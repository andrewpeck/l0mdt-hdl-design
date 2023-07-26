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
--
--
--
--------------------------------------------------------------------------------

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

    -- 40MHz programmable LHC clock
    clock_i_p : in std_logic;
    clock_i_n : in std_logic;

    --
    clocks_o : out system_clocks_rt;

    clk50_freq  : out std_logic_vector (31 downto 0);
    clk100_freq : out std_logic_vector (31 downto 0);
    clk200_freq : out std_logic_vector (31 downto 0);

    clk40_freq  : out std_logic_vector (31 downto 0);
    clk320_freq : out std_logic_vector (31 downto 0)

    );

end entity top_clocking;

architecture behavioral of top_clocking is

  signal clk50, clk100, clk200, clk40, clk320, clkpipe : std_logic;
  signal locked_clk40                                  : std_logic;
  signal clock_async_ibufds                            : std_logic;
  signal clock_async_i                                 : std_logic;
  signal clock_async                                   : std_logic;

  component onboardclk
    port (
      clk_200MHz : out std_logic;
      clk_100MHz : out std_logic;
      clk_50Mhz  : out std_logic;
      reset      : in  std_logic;
      locked     : out std_logic;
      clk_in1  : in  std_logic
      );
  end component;

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

  clocks_o.axiclock       <= clk40;
  clocks_o.clock40        <= clk40;
  clocks_o.clock320       <= clk320;
  clocks_o.freeclock      <= clk40;
  clocks_o.clock_pipeline <= clkpipe;
  clocks_o.b2b_locked     <= locked_clk40;
  clocks_o.lhc_locked     <= locked_clk40;

  --------------------------------------------------------------------------------
  -- ASYNC + 50MHz free-running clocks
  --------------------------------------------------------------------------------

  IBUFDS_inst : IBUFDS
  port map (
    O => clock_async_i,
    I => clock_async_i_p,
    IB => clock_async_i_n
  );

  BUFG_inst : BUFG
  port map (
    O => clock_async,                 -- 1-bit output: Clock output
    I => clock_async_i                        -- 1-bit input: Clock input
  );

  pll_clk50_inst : onboardclk
    port map (
      clk_200MHz => clk200,
      clk_100Mhz => clk100,
      clk_50Mhz  => clk50,
      reset      => '0',
      locked     => locked_clk50,
      clk_in1    => clock_async
    );

  -------------------------------------------------------------------------------
  -- MMCM clocking
  --------------------------------------------------------------------------------
    
  framework_mmcm_inst : framework_mmcm
    port map (
      clk_in1_p => clock_i_p,
      clk_in1_n => clock_i_n,
      reset     => reset_i,
      clk320_o  => clk320,
      clk40_o   => clk40,
      locked_o  => locked_clk40
      );

  clkpipe <= clk320;

  -- Counters to measure the clk frequency of clk_b from a known clk_a
  clk320_frequency : entity work.clk_frequency
    generic map (clk_a_freq => 50_000_000)
    port map (
      reset => '0',
      clk_a => clk50,
      clk_b => clk320,
      rate  => clk320_freq
      );

  clk40_frequency : entity work.clk_frequency
    generic map (clk_a_freq => 50_000_000)
    port map (
      reset => '0',
      clk_a => clk50,
      clk_b => clk40,
      rate  => clk40_freq
      );

  clk50_frequency : entity work.clk_frequency
    generic map (clk_a_freq => 50_000_000)
    port map (
      reset => '0',
      clk_a => clk50,
      clk_b => clk50,
      rate  => clk50_freq
      );

  clk100_frequency : entity work.clk_frequency
    generic map (clk_a_freq => 50_000_000)
    port map (
      reset => '0',
      clk_a => clk50,
      clk_b => clk100,
      rate  => clk100_freq
      );

  clk200_frequency : entity work.clk_frequency
    generic map (clk_a_freq => 50_000_000)
    port map (
      reset => '0',
      clk_a => clk50,
      clk_b => clk200,
      rate  => clk200_freq
      );

end architecture behavioral;
