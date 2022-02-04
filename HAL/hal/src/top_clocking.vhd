--------------------------------------------------------------------------------
-- Clocking Module
--
-- The L0MDT needs the ability to source its fabric clock from two sources:
--   1. FELIX
--   2. Local oscillator
--
-- The FELIX clock will be a 320MHz recovered clock from the fiber link. The
-- RXRECCLK will be passed from the GTY into the fabric, and out on an ODDR
--
-- This clock will be cleaned in an external jitter cleaner, fanned out, and
-- sent back into the chip where it will be used as the reference clock for the
-- multi-gigabit transceivers.
--
-- The board, however, will not always be operating with a connection to FELIX,
-- so some provision must be made to clock the firmware from a local oscillator
--
-- Currently this is done by using the 0th and 1st inputs to the system MMCM
--
-- The MMCM has an input multiplexer that allows switching between two input
-- sources... we can use this to switch between the always running 320MHz clock
-- and the 320MHz clock recovered from FELIX
--
--  1. The board should boot with sel_felix_clk set to 0 (to select the oscillator)
--
--  2. Once the FELIX clock is active, we should assert RST=1. We can then
--     set sel_felix_clk to 1. After this switch, the MMCM reset should be released
--
--------------------------------------------------------------------------------
-- TODO: Enforce Input clock can only be switched when RST=1 ?

library ieee;
use ieee.std_logic_1164.all;

library xil_defaultlib;

library unisim;
use unisim.vcomponents.all;

library work;
use work.system_types_pkg.all;

library xpm;
use xpm.vcomponents.all;

entity top_clocking is
  generic (
    CLK_FREQ : integer := 200
    );
  port (

    reset_i : in std_logic;

    -- ASYNC clock to BUFG
    clock_async_i_p : in std_logic;
    clock_async_i_n : in std_logic;

    -- 40MHz programmable ASYNC clock
    clock_i_p : in std_logic;
    clock_i_n : in std_logic;

    -- 320MHz clock out to output pins
    lhc_refclk_o_p : out std_logic;
    lhc_refclk_o_n : out std_logic;

    --
    clocks_o          : out system_clocks_rt;
    strobe_pipeline_o : out std_logic;
    strobe_320_o      : out std_logic;

    out_of_sync_o : out std_logic;

    locked_o : out std_logic

    );

end entity top_clocking;
architecture behavioral of top_clocking is

  signal clk50, clk100, clk40, clk320, clkpipe : std_logic;
  signal mmcm_locked                           : std_logic;

  signal clock_async_ibufds : std_logic;

  component framework_mmcm
    port (
      -- Clock out ports
      clk320_o  : out std_logic;
      clk40_o   : out std_logic;
      -- Status and control signals
      reset     : in  std_logic;
      locked_o  : out std_logic;
      -- Clock in ports
      clk_in1_p : in  std_logic;
      clk_in1_n : in  std_logic
      );
  end component;

begin  -- architecture behavioral

  --------------------------------------------------------------------------------
  -- Port Aliasing
  --------------------------------------------------------------------------------

  clocks_o.axiclock       <= clk50;
  clocks_o.clock40        <= clk40;
  clocks_o.clock320       <= clk320;
  clocks_o.freeclock      <= clk100;
  clocks_o.clock_pipeline <= clkpipe;
  clocks_o.locked         <= mmcm_locked;
  locked_o                <= mmcm_locked;

  --------------------------------------------------------------------------------
  -- ASYNC + 50MHz free-running clocks
  --------------------------------------------------------------------------------

  clock_async_in_ibufds : IBUFDS
    generic map(
      DIFF_TERM    => true,             --DifferentialTermination
      IBUF_LOW_PWR => false,            --Lowpower(TRUE)vs.performance(FALSE)
      IOSTANDARD   => "LVDS")
    port map(
      O  => clock_async_ibufds,
      I  => clock_async_i_p,
      IB => clock_async_i_n
      );

  -- create a freerunnning clock for
  -- initialization of the mgts, AXI, etc.
  -- this could be put on a PLL / MMCM if the frequency needs to change
  -- or just a BUFG_DIV if we want to go from ASYNC to 50M for example

  BUFG_clk100_inst : BUFGCE_DIV
    generic map (
      BUFGCE_DIVIDE => CLK_FREQ/100
      )
    port map (
      I   => clock_async_ibufds,
      CLR => '0',
      CE  => '1',
      O   => clk100
      );

  -- 50MHz divided copy for AXI  (should increase this later)
  BUFG_clk50_inst : BUFGCE_DIV
    generic map (
      BUFGCE_DIVIDE => CLK_FREQ/50
      )
    port map (
      I   => clock_async_ibufds,
      CLR => '0',
      CE  => '1',
      O   => clk50
      );

  -------------------------------------------------------------------------------
  -- MMCM
  --------------------------------------------------------------------------------

  framework_mmcm_inst : framework_mmcm
    port map (
      clk_in1_p => clock_i_p,
      clk_in1_n => clock_i_n,
      reset     => reset_i,
      clk320_o  => clk320,
      clk40_o   => clk40,
      locked_o  => mmcm_locked
      );

  clkpipe <= clk320;

end architecture behavioral;
