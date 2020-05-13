library ieee;
use ieee.std_logic_1164.all;

library xil_defaultlib;

library unisim;
use unisim.vcomponents.all;

entity top_clocking is

  port (

    reset_i : in std_logic;             --

    sync_i  : in std_logic;
    valid_i : in std_logic;

    -- 320MHz ASYNC clock to BUFG
    clock_100m_i_p : in std_logic;
    clock_100m_i_n : in std_logic;

    -- 320MHz programmable ASYNC clock
    clock_i_p : in std_logic;
    clock_i_n : in std_logic;

    -- Recovered clock from felix
    felix_recclk_i   : in std_logic;
    select_felix_clk : in std_logic;    -- '1' to select felix clock; make sure to reset

    -- 320MHz clock out to output pins
    lhc_refclk_o_p : out std_logic;
    lhc_refclk_o_n : out std_logic;

    --
    clock40_o   : out std_logic;
    clock320_o  : out std_logic;
    clock100_o  : out std_logic;
    clockpipe_o : out std_logic;

    locked_o : out std_logic

    );

end entity top_clocking;
architecture behavioral of top_clocking is

  signal clkfb_nobuf, clk320_nobuf, clkpipe_nobuf       : std_logic;
  signal clkfb, clk100, clk40, clk320, clkoddr, clkpipe : std_logic;
  signal mmcm_locked                                    : std_logic;

  signal clock_ibufds      : std_logic;
  signal clock_100m_ibufds : std_logic;

  -- clk40 synchronizer
  signal clear    : std_logic;
  signal valid_sr : std_logic_vector (4 downto 0) := (others => '0');
  signal armed    : std_logic                     := '0';
  signal synced   : std_logic                     := '1';

begin  -- architecture behavioral

  clock40_o   <= clk40;
  clock320_o  <= clk320;
  clock100_o  <= clk100;
  clockpipe_o <= clkpipe;
  locked_o    <= mmcm_locked;

  clock_in_ibufds : IBUFDS
    generic map(DIFF_TERM    => true,   --DifferentialTermination
                IBUF_LOW_PWR => false,  --Lowpower(TRUE)vs.performance(FALSE)
                IOSTANDARD   => "LVDS")
    port map(
      O  => clock_ibufds,
      I  => clock_i_p,
      IB => clock_i_n
      );

  clock_100m_in_ibufds : IBUFDS
    generic map(DIFF_TERM    => true,   --DifferentialTermination
                IBUF_LOW_PWR => false,  --Lowpower(TRUE)vs.performance(FALSE)
                IOSTANDARD   => "LVDS")
    port map(
      O  => clock_100m_ibufds,
      I  => clock_100m_i_p,
      IB => clock_100m_i_n
      );

  -- create a freerunnning clock for
  -- initialization of the mgts, AXI, etc.
  -- this could be put on a PLL / MMCM if the frequency needs to change

  BUFG_freeclk_inst : BUFG
    port map (
      I => clock_100m_ibufds,
      O => clk100
      );

  -------------------------------------------------------------------------------
  -- MMCM
  --------------------------------------------------------------------------------

  -- mmcm for system clocks

  framework_mmcm_inst : entity xil_defaultlib.framework_mmcm
    port map (
      clk320_async_i => clock_ibufds,
      clk320_sync_i  => felix_recclk_i,
      clk_sel_i      => not select_felix_clk,
      reset           => reset_i,

      clkfb_o   => clkfb_nobuf,
      clk320_o  => clk320_nobuf,
      clkpipe_o => clkpipe_nobuf,

      clkfb_i => clkfb,

      locked_o => mmcm_locked
      );

  -- Feedback clock through bufgce

  bufgce_clkfb_inst : bufgce_div
    generic map (
      BUFGCE_DIVIDE => 1
      )
    port map (
      I   => clkfb_nobuf,
      CLR => clear,
      CE  => synced,
      O   => clkfb
      );

  -- 40Mhz clock

  -- CLR the O output is 0 when CLR is High (active).
  -- When CLR (reset) is deasserted, the output clock transitions from Low to High on the first
  -- edge after the CLR is deasserted, regardless of the divide value.
  bufgce_clk40_inst : bufgce_div
    generic map (
      BUFGCE_DIVIDE => 8
      )
    port map (
      I   => clk320_nobuf,
      CLR => clear,
      CE  => synced,
      O   => clk40
      );

  -- lpgbt clock

  bufgce_clk320_inst : bufgce_div
    generic map (
      BUFGCE_DIVIDE => 1
      )
    port map (
      I   => clk320_nobuf,
      CLR => '0',
      CE  => '1',
      O   => clk320
      );

  -- pipeline clock
  bufgce_clkpipe_inst : bufgce_div
    generic map (
      BUFGCE_DIVIDE => 1
      )
    port map (
      I   => clkpipe_nobuf,
      CLR => '0',
      CE  => '1',
      O   => clkpipe
      );

  --------------------------------------------------------------------------------
  -- CLK40 divider sync logic
  --------------------------------------------------------------------------------

  -- https://forums.xilinx.com/t5/Other-FPGA-Architecture/How-to-divide-a-clock-by-2-with-a-simple-primitive-without-Clock/m-p/784079
  -- https://www.xilinx.com/support/answers/67885.html
  -- https://forums.xilinx.com/t5/Design-Methodologies-and/Best-way-to-divide-a-clock-by-two/td-p/728222
  -- https://forums.xilinx.com/t5/Other-FPGA-Architecture/Multiple-region-BUFR-alignment/m-p/1062626#M37596

  -- When two synchronous clocks from the same MMCM/PLL have a simple period ratio (/2 /4 /8), you can prevent the phase
  -- error between the two clock domains using a single MMCM/PLL output connected to two BUFGCE_DIV buffers. The
  -- BUFGCE_DIV buffer performs the clock division (/1 /2 /4 /8).
  --
  -- *Note*: Because the BUFGCE and BUFGCE_DIV do not have the same cell delays, Xilinx recommends using the same clock
  -- buffer for both synchronous clocks (two BUFGCE or two BUFGCE_DIV buffers).
  --
  -- Create a 40MHz divided clock and a global buffered 320MHz clock from a 320MHz
  -- (non-buffered, straight from MMCM ) input clock with a valid flag
  --
  -- The non-buffered clock will NOT have a deterministic phase relationship to the buffered clock
  -- due to the BUFG insertion delay, but the 320 and 40MHz clocks will be precisely phase aligned
  -- with low skew
  --
  --            ___ ___ ___ ___ ___ ___ ___ ___ ___
  -- clk320   __|0|_|1|_|2|_|3|_|4|_|5|_|6|_|7|_|8|_
  --            _____                           _____
  -- valid    __|   |___________________________|
  --              _____
  -- sync_i   ____|   |_________________________________
  --                  ___________________
  -- armed    ________|                 |_______________
  --                                _____
  -- val_dly  ______________________|   |______________
  --                                    _____
  -- clear    __________________________|   |__________
  --          _________                         ________
  -- synced           |_________________________|
  --                                            ________
  -- clk40    __________________________________|

  process (clk320)
  begin
    if (rising_edge(clk320)) then
      valid_sr <= valid_i & valid_sr(valid_sr'length-1 downto 1);

      if (sync_i = '1') then
        armed  <= '1';
        synced <= '0';
        clear  <= '0';
      elsif (synced = '0' and armed = '1' and valid_sr(0) = '1') then
        armed  <= '0';
        synced <= '1';
        clear  <= '1';
      else
        clear <= '0';
      end if;

    end if;
  end process;

  --------------------------------------------------------------------------------
  -- Output Clock
  --------------------------------------------------------------------------------

  lhc_refclk_oddr : ODDRE1
    generic map (                       --
      IS_C_INVERTED => '0',       -- Optional inversion for C
      SIM_DEVICE => "ULTRASCALE", -- Set the device version (ULTRASCALE)
      SRVAL => '0'                -- Initializes the ODDRE1 Flip-Flops to the specified value ('0', '1')
      )
    port map (
      Q  => clkoddr,                    -- 1-bit DDR output
      C  => clk320,                     -- 1-bit clock input
      D1 => '1',                        -- 1-bit data input (positive edge)
      D2 => '0',                        -- 1-bit data input (negative edge)
      SR => not mmcm_locked             -- 1-bit active high async reset
      );

  lhc_refclk_obufds : OBUFDS
    port map(
      I  => clkoddr,
      O  => lhc_refclk_o_p,
      OB => lhc_refclk_o_n
      );


end architecture behavioral;
