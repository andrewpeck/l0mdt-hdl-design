library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.lpgbt_pkg.all;

entity lpgbt_top is
generic (
   g_NUM_UPLINKS : integer   := 1;
   g_NUM_DOWNLINKS : integer := 1
);
port(
    reset_i    : in std_logic;

    lpgbt_downlink_clock320_i   : in std_logic;
    lpgbt_downlink_data_array_i : in  std32_array_t (g_NUM_DOWNLINKS-1 downto 0); -- 32 bit user downlink data @ 320MHz with enable
    lpgbt_downlink_clock_en_i   : in std_logic_vector (g_NUM_DOWNLINKS-1 downto 0); -- strobes 1 of 8 clocks to align to 40MHz
    lpgbt_downlink_ready_o      : out std_logic_vector (g_NUM_DOWNLINKS-1 downto 0);

    lpgbt_uplink_clock320_i   : in std_logic;
    lpgbt_uplink_data_array_o : out std224_array_t (g_NUM_UPLINKS-1 downto 0); -- 224 bit user data @ 320MHz with enable
    lpgbt_uplink_clock_en_o   : out std_logic_vector (g_NUM_UPLINKS-1 downto 0); -- strobes 1 of 8 clocks to align to 40MHz
    lpgbt_uplink_ready_o      : out std_logic_vector (g_NUM_UPLINKS-1 downto 0)

);
end lpgbt_top;


-- need to implement timing constraints for multicycle path!!!
--
-- ##====================##
-- ## TIMING CONSTRAINTS ##
-- ##====================##
--


architecture Behavioral of lpgbt_top is

    signal lpgbt_downlink_reset  : std_logic_vector (g_NUM_DOWNLINKS-1 downto 0);
    signal lpgbt_uplink_reset    : std_logic_vector (g_NUM_UPLINKS-1 downto 0);

    signal lpgbt_uplink_mgt_word_array_i : std32_array_t (g_NUM_UPLINKS-1 downto 0); -- 32 bit mgt data @ 320MHz
    signal lpgbt_downlink_mgt_word_array_o : std32_array_t (g_NUM_DOWNLINKS-1 downto 0); -- 32 bit lpgbt formatted data to mgt @ 320MHz

    signal lpgbt_uplink_bitslip_o  : std_logic_vector (g_NUM_UPLINKS-1 downto 0);
begin

    lpgbt_uplink_reset     <= (others => reset_i);
    lpgbt_downlink_reset   <= (others => reset_i);

    lpgbt_link_wrapper: entity work.lpgbt_link_wrapper
    generic map (
        g_NUM_UPLINKS   => g_NUM_UPLINKS,
        g_NUM_DOWNLINKS => g_NUM_DOWNLINKS)
    port map (

        --------------------------------------------------------------------------------
        -- Downlink 2.56 Gbps
        --------------------------------------------------------------------------------

        lpgbt_downlink_clk_i            => lpgbt_downlink_clock320_i,
        lpgbt_downlink_data_array_i     => lpgbt_downlink_data_array_i,
        lpgbt_downlink_clock_en_i       => lpgbt_downlink_clock_en_i,
        lpgbt_downlink_reset_i          => lpgbt_downlink_reset,
        lpgbt_downlink_mgt_word_array_o => lpgbt_downlink_mgt_word_array_o,
        lpgbt_downlink_ready_o          => lpgbt_downlink_ready_o,

        --------------------------------------------------------------------------------
        -- Uplink 10.24 Gbps
        --------------------------------------------------------------------------------

        lpgbt_uplink_clk_i            => lpgbt_uplink_clock320_i,
        lpgbt_uplink_reset_i          => lpgbt_uplink_reset,
        lpgbt_uplink_mgt_word_array_i => lpgbt_uplink_mgt_word_array_i,
        lpgbt_uplink_clock_en_o       => lpgbt_uplink_clock_en_o,
        lpgbt_uplink_data_array_o     => lpgbt_uplink_data_array_o,
        lpgbt_uplink_bitslip_o        => lpgbt_uplink_bitslip_o,
        lpgbt_uplink_ready_o          => lpgbt_uplink_ready_o
    );

    lpgbt_ic_mux_inst : entity work.lpgbt_ic_mux
    --generic map (

    --);
    port map (
        --------------------------------------------------------------------------------
        -- Internal Control Signals
        --------------------------------------------------------------------------------

        lpgbt_link_select_i => (others => '0'),

        lpgbt_ic_chip_adr_i => (others => '0'),
        lpgbt_ic_adr_i      => (others => '0'),
        lpgbt_ic_wdata_i    => (others => '0'),
        lpgbt_ic_rdata_o    => open,
        lpgbt_ic_length     => (others => '0'),
        lpgbt_ic_write_req  => '0',
        lpgbt_ic_write_done => open,
        lpgbt_ic_read_req   => '0',
        lpgbt_ic_read_done  => open

    );

    -- lpgbt_mgts_inst : entity work.    --lpgbt_mgts
    -- --generic map (

    -- --);
    -- port map (

    -- );

end Behavioral;
