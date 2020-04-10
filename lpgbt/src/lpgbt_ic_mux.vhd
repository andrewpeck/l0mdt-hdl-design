LIBRARY ieee;
USE ieee.std_logic_1164.all;

library work;
USE work.lpgbt_pkg.all;

entity lpgbt_link_wrapper is
generic (
   g_NUM_UPLINKS : integer   := 1;
   g_NUM_DOWNLINKS : integer := 1
);
port(

    --------------------------------------------------------------------------------
    -- Internal Control
    --------------------------------------------------------------------------------

    lpgbt_link_select_i         : in  std_logic_vector  (7 downto 0); -- lpgbt link select, xFF = broadcast

    lpgbt_ic_chip_adr_i         : in  std_logic_vector  (6 downto 0); -- 7 bit lpgbt address
    lpgbt_ic_adr_i              : in  std_logic_vector (15 downto 0);
    lpgbt_ic_wdata_i            : in  std_logic_vector (31 downto 0);
    lpgbt_ic_rdata_o            : out std_logic_vector (31 downto 0);
    lpgbt_ic_length             : in  std_logic_vector  (2 downto 0);
    lpgbt_ic_write_req          : in  std_logic;
    lpgbt_ic_write_done         : out std_logic;
    lpgbt_ic_read_req           : in  std_logic;
    lpgbt_ic_read_done          : out std_logic
);
end lpgbt_link_wrapper;


architecture Behavioral of  lpgbt_link_wrapper is

    -- IC/EC can only be read on LPGBTs that have a downlink
    signal lpgbt_downlink_ic_data_array : std2_array_t (g_NUM_DOWNLINKS-1 downto 0);
    signal lpgbt_uplink_ic_data_array   : std2_array_t (g_NUM_DOWNLINKS-1 downto 0);
    signal lpgbt_downlink_ec_data_array : std2_array_t (g_NUM_DOWNLINKS-1 downto 0);
    signal lpgbt_uplink_ec_data_array   : std2_array_t (g_NUM_DOWNLINKS-1 downto 0);

    signal lpgbt_uplink_decoded_data : std230_array_t (g_NUM_UPLINKS-1 downto 0);

	signal lpgbt_downlink_clk_en  : std_logic;

begin

    -- gbt_ic_controller_gen : entity work.gbt_ic_controller
    -- port map (
    --     reset_i           => '0',
    --     clock             => lpgbt_downlink_clk40_i,
    --     clock_en          => clk_en,
    --     gbt_i2c_address   => lpgbt_ic_chip_adr_i,
    --     gbt_rx_ic_elink_i => lpgbt_uplink_ic_data,
    --     gbt_tx_ic_elink_o => lpgbt_downlink_ic_data,
    --     ic_rw_address_i   => lpgbt_ic_adr_i,
    --     ic_w_data_i       => lpgbt_ic_wdata_i,
    --     ic_r_data_o       => lpgbt_ic_rdata_o,
    --     ic_rw_length_i    => lpgbt_ic_length,
    --     ic_write_req_i    => lpgbt_ic_write_req,
    --     ic_write_done_o   => lpgbt_ic_write_done,
    --     ic_read_req_i     => lpgbt_ic_read_req,
    --     ic_read_done_o    => lpgbt_ic_read_done
    -- );

    --------------------------------------------------------------------------------
    -- 320 MHz enable, goes high 1 of 8 clocks
    --------------------------------------------------------------------------------

    -- process (lpgbt_downlink_clk_i)
    -- variable counter : integer range 0 to 8;
    -- begin
    --     if (rising_edge(lpgbt_downlink_clk_i)) then

    --         if lpgbt_downlink_reset_i(0) = '1' then
    --             counter := 0;
    --             lpgbt_downlink_clk_en <= '0';

    --         else
    --             counter := counter + 1;

    --             if counter = 8 then
    --                 counter := 0;
    --             end if;

    --             lpgbt_downlink_clk_en   <= '0';
    --             if counter = 0 then
    --                 lpgbt_downlink_clk_en   <= '1';
    --             end if;
    --         end if;


    --     end if;
    -- end process;

end Behavioral;

