library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library work;
use work.lpgbt_pkg.all;

entity lpgbtemul_wrapper is
generic (
   g_NUM_LPGBTS : integer := 1
);
port(
    lpgbt_uplink_mgt_word_array_o : out std32_array_t (g_NUM_LPGBTS-1 downto 0); -- 32 bit mgt data @ 40MHz
    lpgbt_downlink_mgt_word_array_i : in  std32_array_t (g_NUM_LPGBTS-1 downto 0); -- 32 bit lpgbt formatted data to mgt @ 40MHz

    uplink_ic_i : in std2_array_t (g_NUM_LPGBTS-1 downto 0);
    uplink_ec_i : in std2_array_t (g_NUM_LPGBTS-1 downto 0);

    downlink_ic_o : out std2_array_t (g_NUM_LPGBTS-1 downto 0);
    downlink_ec_o : out std2_array_t (g_NUM_LPGBTS-1 downto 0);

    uplink_data_array_i : in std224_array_t (g_NUM_LPGBTS-1 downto 0);
    uplink_clken_i : in std_logic_vector (g_NUM_LPGBTS-1 downto 0);
    uplink_ready_o : out std_logic_vector (g_NUM_LPGBTS-1 downto 0);

    downlink_ready_o : out std_logic_vector (g_NUM_LPGBTS-1 downto 0);
    downlink_data_array_o : out std32_array_t (g_NUM_LPGBTS-1 downto 0);
    downlink_clken_o : out std_logic_vector (g_NUM_LPGBTS-1 downto 0);

    rxusrclk_i : in std_logic_vector (g_NUM_LPGBTS-1 downto 0);
    txusrclk_i : in std_logic_vector (g_NUM_LPGBTS-1 downto 0);
    uplink_ready_i : in std_logic_vector (g_NUM_LPGBTS-1 downto 0);
    downlink_ready_i : in std_logic_vector (g_NUM_LPGBTS-1 downto 0);
    rxslide_o : out std_logic_vector (g_NUM_LPGBTS-1 downto 0);

    rst_downlink_i : in std_logic_vector (g_NUM_LPGBTS-1 downto 0);
    rst_uplink_i : in std_logic_vector (g_NUM_LPGBTS-1 downto 0)
);
end lpgbtemul_wrapper;

architecture Behavioral of  lpgbtemul_wrapper is

begin

    lpgbtemul_loop : for I in 0 to (g_NUM_LPGBTS-1) generate
    begin
        lpgbtemul_top_1: entity work.lpgbtemul_top
        generic map (
            rxslide_pulse_duration => 2,
            rxslide_pulse_delay    => 128
        )
        port map (
            rst_downlink_i              => rst_downlink_i(I),
            rst_uplink_i                => rst_uplink_i(I),

            downlinkClkEn_o             => downlink_clken_o(I),
            downLinkDataGroup0          => downlink_data_array_o(I)(15 downto 0),
            downLinkDataGroup1          => downlink_data_array_o(I)(31 downto 16),
            downLinkDataEc              => downlink_ec_o(I),
            downLinkDataIc              => downlink_ic_o(I),
            downLinkBypassDeinterleaver => lpgbt_bypass_interleaver,
            downLinkBypassFECDecoder    => lpgbt_bypass_fec,
            downLinkBypassDescsrambler  => lpgbt_bypass_scrambler,
            enableFECErrCounter         => '1',
            fecCorrectionCount          => open,
            downlinkRdy_o               => downlink_ready_o(I),

            uplinkClkEn_i               => uplink_clken_i(I),
            upLinkData0                 => uplink_data_array_i(I)(31 downto 0),
            upLinkData1                 => uplink_data_array_i(I)(63 downto 32),
            upLinkData2                 => uplink_data_array_i(I)(95 downto 64),
            upLinkData3                 => uplink_data_array_i(I)(127 downto 96),
            upLinkData4                 => uplink_data_array_i(I)(159 downto 128),
            upLinkData5                 => uplink_data_array_i(I)(191 downto 160),
            upLinkData6                 => uplink_data_array_i(I)(223 downto 192),
            upLinkDataIC                => uplink_ic_i(I),
            upLinkDataEC                => uplink_ec_i(I),
            uplinkRdy_o                 => uplink_ready_o(I),

            GT_RXUSRCLK_IN              => rxusrclk_i(I),
            GT_TXUSRCLK_IN              => txusrclk_i(I),
            GT_RXSLIDE_OUT              => rxslide_o(I),
            GT_TXREADY_IN               => uplink_ready_i(I),
            GT_RXREADY_IN               => downlink_ready_i(I),
            GT_TXDATA_OUT               => lpgbt_uplink_mgt_word_array_o(I), -- 32 bit transmit data to mgt
            GT_RXDATA_IN                => lpgbt_downlink_mgt_word_array_i(I), -- 32 bit receive data word from mgt
            upLinkScramblerReset        => '0',

            upLinkInterleaverBypass     => lpgbt_bypass_interleaver,
            upLinkFecBypass             => lpgbt_bypass_fec,
            upLinkScramblerBypass       => lpgbt_bypass_scrambler,
            fecMode                     => '0', -- 0 = fec5, 1 = fec12
            txDataRate                  => '1' -- 0 = 5.24 gbps, 1 = 10.24
        );
    end generate;

end Behavioral;
