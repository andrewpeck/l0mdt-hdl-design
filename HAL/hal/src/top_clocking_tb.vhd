library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library work;
use work.system_types_pkg.all;

entity top_clocking_tb is
end top_clocking_tb;

architecture rtl of top_clocking_tb is
  signal valid_strobe        : std_logic;
  signal valid        : std_logic;
  signal tb_clk40        : std_logic := '1';
  signal tb_clk320       : std_logic := '1';
  signal tb_clk320_async : std_logic := '0';
  signal tb_clk100       : std_logic := '1';
  signal err_vec      : std_logic;

  signal clk_src : std_logic;
  signal clk_mux : std_logic;

  signal sync : std_logic := '0';

  signal lhc_recclk_o : std_logic;

  signal clocks : system_clocks_rt;

  signal strobe_pipeline : std_logic;
  signal strobe_320      : std_logic;

  signal out_of_sync : std_logic;
  signal reset : std_logic;

  signal locked : std_logic;

begin

  clk40_proc2 : process
  begin
    -- default
    clk_src <= '0';
    sync <= '0';
    reset <= '0';

    -- let the clocking module auto-lock to the free-running 320MHz clock
    wait for 500 ns;

    -- reset the mmcm, swithc the clock source to FELIX
    reset <= '1';
    wait for 25 ns;
    clk_src <= '1';
    wait for 25 ns;
    reset <= '0';

    -- assert a sync
    wait for 500 ns;
    sync <= '1';
    wait for 50 ns;
    sync <= '0';
    wait for 200 ns;

    -- assert a sync
    --wait for 100 ns;
    --sync <= '1';
    --wait for 50 ns;
    --sync <= '0';
    --wait for 200 ns;
    wait for 400 ns;
    std.env.stop;
  end process;

  -- round off the numbers... don't want to use such high precision
  -- 12.5 ns --> 12 ns
  -- 1.5625 ns -> 1.5 ns

  tb_clk40        <= not tb_clk40        after 12.0 ns;
  tb_clk320       <= not tb_clk320       after 1.5 ns;
  tb_clk320_async <= not tb_clk320_async after 1.5 ns;
  tb_clk100       <= not tb_clk100       after 5.0 ns;

  clock_strobe_320 : entity work.clock_strobe
    port map (
      fast_clk_i => tb_clk320,
      slow_clk_i => tb_clk40,
      strobe_o   => valid_strobe
      );

  valid <= valid_strobe and clk_src after 0.1 ns;

  top_clocking_1 : entity work.top_clocking
    port map (
      reset_i           => reset,
      sync_i            => sync,
      felix_valid_i     => valid,
      clock_100m_i_p    =>     tb_clk100,
      clock_100m_i_n    => not tb_clk100,
      clock_i_p         =>     tb_clk320_async,
      clock_i_n         => not tb_clk320_async,
      felix_recclk_i    => tb_clk320,
      select_felix_clk  => clk_src,
      lhc_refclk_o_p    => lhc_recclk_o,
      lhc_refclk_o_n    => open,
      clocks_o          => clocks,
      strobe_pipeline_o => strobe_pipeline,
      strobe_320_o      => strobe_320,
      out_of_sync_o     => out_of_sync,
      locked_o          => locked
      );

  err_vec <= clocks.clock40 xor tb_clk40;

end rtl;
