library ieee;
use ieee.std_logic_1164.all;

library lpgbt_fpga; 

library framework;
use framework.lpgbt_pkg.all;
use framework.system_types_pkg.all;
use framework.constants_pkg.all;

entity lpgbt_link_wrapper is
port(

    --------------------------------------------------------------------------------
    -- Downlink
    --------------------------------------------------------------------------------

    -- 320 Mhz Downlink Fabric Clock
    lpgbt_downlink_clk_i            : in std_logic;

    -- Per-link reset input
    lpgbt_downlink_reset_i          : in std_logic_vector (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    -- 1 bit valid (strobe at 40MHz)
    -- 32 bits / bx from fabric
    -- 2 bits ic
    -- 2 bits ec
    lpgbt_downlink_data             : in lpgbt_downlink_data_rt_array (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    -- 32 bits / bx to mgt
    lpgbt_downlink_mgt_word_array_o : out  std32_array_t (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    -- downlink ready flag
    lpgbt_downlink_ready_o          : out std_logic_vector (c_NUM_LPGBT_DOWNLINKS-1 downto 0);

    --------------------------------------------------------------------------------
    -- Uplink
    --------------------------------------------------------------------------------

    -- 320 MHz Uplink Fabric Clock
    lpgbt_uplink_clk_i            : in std_logic; -- 320 MHz

    -- Per-link reset input
    lpgbt_uplink_reset_i          : in std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);

    -- 1 bit valid output (strobes at 40MHz)
    -- 224 bits / bx to fabric
    -- 2 bits ic
    -- 2 bits ec
    lpgbt_uplink_data             : out lpgbt_uplink_data_rt_array (c_NUM_LPGBT_UPLINKS-1 downto 0);

    -- 256 bits / bx from mgt
    lpgbt_uplink_mgt_word_array_i : in std32_array_t (c_NUM_LPGBT_UPLINKS-1 downto 0);

    -- bitslip flag to connect to mgt rxslide for alignment
    lpgbt_uplink_bitslip_o        : out std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0);

    -- uplink ready output
    lpgbt_uplink_ready_o          : out std_logic_vector (c_NUM_LPGBT_UPLINKS-1 downto 0)

);
end lpgbt_link_wrapper;


architecture Behavioral of  lpgbt_link_wrapper is

    type std230_array_t is array (integer range <>) of std_logic_vector(229 downto 0);
    signal lpgbt_uplink_decoded_data : std230_array_t (c_NUM_LPGBT_UPLINKS-1 downto 0);

begin

    --------------------------------------------------------------------------------
    -- Downlink
    --------------------------------------------------------------------------------

    downlink_gen : for I in 0 to (c_NUM_LPGBT_DOWNLINKS-1) generate
    begin

        lpgbtfpga_downlink_gen : entity lpgbt_fpga.lpgbtfpga_downlink

        generic map (
            c_multicyleDelay    => c_LPGBT_DOWNLINK_MULTICYCLE_DELAY,
            c_clockRatio        => c_LPGBT_DOWNLINK_CLOCK_RATIO,
            c_outputWidth       => c_LPGBT_DOWNLINK_WORD_WIDTH
        )
        port map (
            clk_i               => lpgbt_downlink_clk_i,
            rst_n_i             => not lpgbt_downlink_reset_i(I),
            clken_i             => lpgbt_downlink_data(I).valid,
            userdata_i          => lpgbt_downlink_data(I).data,
            ecdata_i            => lpgbt_downlink_data(I).ec,
            icdata_i            => lpgbt_downlink_data(I).ic,
            mgt_word_o          => lpgbt_downlink_mgt_word_array_o(I),
            interleaverbypass_i => c_LPGBT_BYPASS_INTERLEAVER,
            encoderbypass_i     => c_LPGBT_BYPASS_FEC,
            scramblerbypass_i   => c_LPGBT_BYPASS_SCRAMBLER,
            rdy_o               => lpgbt_downlink_ready_o(I)
        );
    end generate;

    --------------------------------------------------------------------------------
    -- Uplink
    --------------------------------------------------------------------------------

    uplink_gen : for I in 0 to (c_NUM_LPGBT_UPLINKS-1) generate
    begin
    lpgbtfpga_uplink_gen : entity lpgbt_fpga.lpgbtfpga_uplink

        generic map (
            datarate                  => C_LPGBT_UPLINK_DATARATE,
            fec                       => C_LPGBT_UPLINK_FEC,
            c_multicyledelay          => C_LPGBT_UPLINK_MULTICYCLE_DELAY,
            c_clockratio              => C_LPGBT_UPLINK_CLOCK_RATIO,
            c_mgtwordwidth            => C_LPGBT_UPLINK_WORD_WIDTH,
            c_allowedfalseheader      => C_LPGBT_UPLINK_ALLOWED_FALSE_HEADER,
            c_allowedfalseheaderovern => C_LPGBT_UPLINK_ALLOWED_FALSE_HEADER_OVERN,
            c_requiredtrueheader      => C_LPGBT_UPLINK_REQUIRED_TRUE_HEADER,
            c_bitslip_mindly          => C_LPGBT_UPLINK_BITSLIP_MINDLY,
            c_bitslip_waitdly         => C_LPGBT_UPLINK_BITSLIP_WAITDLY
        )

        port map (
            clk_freerunningclk_i => std_logic'('0'), -- not used since reset on even feature is disabled in frame aligner
            uplinkclk_i          => lpgbt_uplink_clk_i,
            uplinkrst_n_i        => not lpgbt_uplink_reset_i(i),
            mgt_word_o           => lpgbt_uplink_mgt_word_array_i(i),
            bypassinterleaver_i  => c_lpgbt_bypass_interleaver,
            bypassfecencoder_i   => c_lpgbt_bypass_fec,
            bypassscrambler_i    => c_lpgbt_bypass_scrambler,
            uplinkclkouten_o     => lpgbt_uplink_data(i).valid,
            userdata_o           => lpgbt_uplink_decoded_data(i),
            ecdata_o             => lpgbt_uplink_data(i).ec,
            icdata_o             => lpgbt_uplink_data(i).ic,
            mgt_bitslipctrl_o    => lpgbt_uplink_bitslip_o(i),
            datacorrected_o      => open,
            iccorrected_o        => open,
            eccorrected_o        => open,
            rdy_o                => lpgbt_uplink_ready_o(i)
        );

        lpgbt_uplink_data(I).data <= lpgbt_uplink_decoded_data(I)(223 downto 0); -- 229 downto 224 are LM bits, not used

    end generate;

end Behavioral;
