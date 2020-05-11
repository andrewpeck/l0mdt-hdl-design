library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library work;
use work.lpgbt_pkg.all;

entity lpgbtemul_wrapper is
  port(
    --------------------------------------------------------------------------------
    -- Uplink 10.24 Gbps
    --------------------------------------------------------------------------------

    -- 320 MHz Uplink Fabric Clock
    lpgbt_uplink_clk_i : in std_logic;  -- 320 MHz

    -- 32 bit mgt data @ 320 MHz
    lpgbt_uplink_mgt_word_array_o : out std32_array_t (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0);

    -- 1 bit valid output (strobes at 40MHz)
    -- 224 bits / bx to fabric
    -- 2 bits ic
    -- 2 bits ec

    lpgbt_uplink_data_i : in lpgbt_uplink_data_rt_array (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0);

    lpgbt_uplink_ready_i : in std_logic_vector (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0);

    lpgbt_rst_uplink_i : in std_logic_vector (c_NUM_LPGBT_EMUL_UPLINKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- Downlink 2.56 Gbps
    --------------------------------------------------------------------------------

    -- 320 Mhz Downlink Fabric Clock
    lpgbt_downlink_clk_i : in std_logic;

    -- 32 bit lpgbt formatted data to mgt @ 40MHz
    lpgbt_downlink_mgt_word_array_i : in std32_array_t (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);

    -- 1 bit valid (strobe at 40MHz)
    -- 32 bits / bx from fabric
    -- 2 bits ic
    -- 2 bits ec
    lpgbt_downlink_data_o : out lpgbt_downlink_data_rt_array (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);

    lpgbt_downlink_ready_i : in std_logic_vector (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);

    -- bitslip flag to connect to mgt rxslide for alignment
    lpgbt_downlink_bitslip_o : out std_logic_vector (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0);

    lpgbt_rst_downlink_i : in std_logic_vector (c_NUM_LPGBT_EMUL_DOWNLINKS-1 downto 0)
    );
end lpgbtemul_wrapper;

architecture Behavioral of lpgbtemul_wrapper is

begin

  assert (c_NUM_LPGBT_EMUL_UPLINKS = c_NUM_LPGBT_EMUL_DOWNLINKS) report "for now must set lpgbt emul uplinks equal to the number of downlinks. no assymetry allowed" severity error;

  -- TODO: loop on max of up or down, allow for asymmetry
  lpgbtemul_loop : for I in 0 to (c_NUM_EMUL_UPLINKS-1) generate
  begin
    lpgbtemul_top_1 : entity work.lpgbtemul_top
      generic map (
        rxslide_pulse_duration => 2,
        rxslide_pulse_delay    => 128
        )
      port map (
        rst_downlink_i => rst_downlink_i(I),
        rst_uplink_i   => rst_uplink_i(I),

        downlinkClkEn_o             => lpgbt_downlink_data_o(I).valid,
        downLinkDataGroup0          => lpgbt_downlink_data_o(I).data(15 downto 0),
        downLinkDataGroup1          => lpgbt_downlink_data_o(I).data(31 downto 16),
        downLinkDataEc              => lpgbt_downlink_data_o(I).ec,
        downLinkDataIc              => lpgbt_downlink_data_o(I).ic,
        downLinkBypassDeinterleaver => c_LPGBT_BYPASS_INTERLEAVER,
        downLinkBypassFECDecoder    => c_LPGBT_BYPASS_FEC,
        downLinkBypassDescsrambler  => c_LPGBT_BYPASS_SCRAMBLER,
        enableFECErrCounter         => '1',
        fecCorrectionCount          => open,
        downlinkRdy_o               => downlink_ready_o(I),

        uplinkClkEn_i => lpgbt_uplink_data_i(I).valid,
        upLinkData0   => lpgbt_uplink_data_i(I).valid(31 downto 0),
        upLinkData1   => lpgbt_uplink_data_i(I).valid(63 downto 32),
        upLinkData2   => lpgbt_uplink_data_i(I).valid(95 downto 64),
        upLinkData3   => lpgbt_uplink_data_i(I).valid(127 downto 96),
        upLinkData4   => lpgbt_uplink_data_i(I).valid(159 downto 128),
        upLinkData5   => lpgbt_uplink_data_i(I).valid(191 downto 160),
        upLinkData6   => lpgbt_uplink_data_i(I).valid(223 downto 192),
        upLinkDataIC  => lpgbt_uplink_data_i(I).ic(I),
        upLinkDataEC  => lpgbt_uplink_data_i(I).ec(I),
        uplinkRdy_o   => uplink_ready_o(I),

        GT_RXUSRCLK_IN       => rxusrclk_i(I),
        GT_TXUSRCLK_IN       => txusrclk_i(I),
        GT_RXSLIDE_OUT       => lpgbt_downlink_bitslip_o(I),
        GT_TXREADY_IN        => uplink_ready_i(I),
        GT_RXREADY_IN        => downlink_ready_i(I),
        GT_TXDATA_OUT        => lpgbt_uplink_mgt_word_array_o(I),  -- 32 bit transmit data to mgt
        GT_RXDATA_IN         => lpgbt_downlink_mgt_word_array_i(I),  -- 32 bit receive data word from mgt
        upLinkScramblerReset => '0',

        upLinkInterleaverBypass => c_LPGBT_BYPASS_INTERLEAVER,
        upLinkFecBypass         => c_LPGBT_BYPASS_FEC,
        upLinkScramblerBypass   => c_LPGBT_BYPASS_SCRAMBLER,
        fecMode                 => '0',  -- 0 = fec5, 1 = fec12
        txDataRate              => '1'   -- 0 = 5.24 gbps, 1 = 10.24
        );
  end generate;

end Behavioral;
