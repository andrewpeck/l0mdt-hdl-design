library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_types_pkg.all;

library hal;
use hal.system_types_pkg.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity felix_tx is
  generic(
    g_NUM_UPLINKS : integer := 2
    );
  port(

    -- clk/reset
    clk320  : in std_logic;
    clk40   : in std_logic;
    reset_i : in std_logic;

    daq_streams : in FELIX_STREAM_bus_avt (g_NUM_UPLINKS-1 downto 0);

    -- 256 bits / bx from mgt
    mgt_word_array_o : out std32_array_t (g_NUM_UPLINKS-1 downto 0);

    ready_o         : out std_logic_vector (g_NUM_UPLINKS-1 downto 0);
    was_not_ready_o : out std_logic_vector (g_NUM_UPLINKS-1 downto 0);

    strobe_320 : in std_logic

    );
end felix_tx;

architecture behavioral of felix_tx is
begin

  felix_tx_gen : for I in 0 to g_NUM_UPLINKS-1 generate
  begin

    felix_tx_inst : entity work.lpgbt_10g_tx
      generic map (
        g_MGT_TX_BUS_WIDTH        => 32,
        g_TXUSRCLK_TO_TTC40_RATIO => 8
        )
      port map (
        reset_i                  => reset_i,
        clk40_i                  => clk40,
        mgt_tx_usrclk_i          => clk320,
        mgt_tx_ready_i           => not reset_i,
        mgt_tx_data_o            => mgt_word_array_o(I),
        tx_data_i(66 downto 0)   => daq_streams(I)(66 downto 0),
        tx_data_i(223 downto 67) => (others => '1'),
        tx_ready_o               => ready_o(I),
        tx_had_not_ready_o       => was_not_ready_o(I)
        );

  end generate;

end behavioral;
