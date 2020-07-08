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
--  2. Once the FELIX clock is active, we can set sel_felix_clk to 1. After
--     this switch, the MMCM should be reset.
--
--  3. Finally, sync_i should be pulsed which will tell the state machine to
--     synchronize the 40MHz output clock to the recovered felix data stream
--
--------------------------------------------------------------------------------
-- TODO: make the initial state desynced, at a startup check that on the rising edge
-- of mmcm locked it will resync on its own... mmcm unlock should go back to desync
-- TODO: Input clock can only be switched when RST=1.

library ieee;
use ieee.std_logic_1164.all;

library xil_defaultlib;

library unisim;
use unisim.vcomponents.all;

library work;
use work.system_types_pkg.all;

entity top_clocking is
  port (

    reset_i : in std_logic;             --

    -- set high to initiate sync to 40MHz recovered clock
    sync_i : in std_logic;

    -- 1 of 8 valid signal from LPGBT for 40MHz syncrhonization
    felix_valid_i : in std_logic;

    -- 100MHz ASYNC clock to BUFG
    clock_100m_i_p : in std_logic;
    clock_100m_i_n : in std_logic;

    -- 320MHz programmable ASYNC clock
    clock_i_p : in std_logic;
    clock_i_n : in std_logic;

    -- Recovered clock from felix
    felix_recclk_i   : in std_logic;    -- already on BUFG
    select_felix_clk : in std_logic;    -- '1' to select felix clock; make sure to reset

    -- 320MHz clock out to output pins
    lhc_refclk_o_p : out std_logic;
    lhc_refclk_o_n : out std_logic;

    --
    clocks_o : out system_clocks_rt;

    strobe_pipeline_o : out std_logic;
    strobe_320_o      : out std_logic;

    out_of_sync_o : out std_logic;

    locked_o : out std_logic

    );

end entity top_clocking;
architecture behavioral of top_clocking is

  signal clkfb_nobuf, clk320_nobuf, clkpipe_nobuf       : std_logic;
  signal clkfb, clk50, clk100, clk40, clk320, clkoddr, clkpipe : std_logic;
  signal mmcm_locked                                    : std_logic;

  signal clock_ibufds      : std_logic;
  signal clock_100m_ibufds : std_logic;

  -- clk40 synchronizer
  signal clear          : std_logic := '0';
  signal valid_sr       : std_logic_vector (5 downto 0) := (others => '0');
  signal synced         : std_logic                     := '0';
  signal mmcm_locking   : std_logic;
  signal mmcm_locked_sr : std_logic_vector (7 downto 0);

  signal oos_r, oos_rr : std_logic;
  constant oos_cnt_max : integer := 10;
  signal oos_cnt : integer range 0 to oos_cnt_max := 10;

  signal out_of_sync : std_logic := '0';

  signal strobe_320 : std_logic;

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
  strobe_320_o            <= strobe_320;
  locked_o                <= mmcm_locked;

  --------------------------------------------------------------------------------
  -- Clock and reset to User Logic
  --------------------------------------------------------------------------------

  -- Create a 1 of N high signal synced to the 40MHZ clock with a width of 1 fastclk

  clock_strobe_pipeline : entity work.clock_strobe
    port map (
      fast_clk_i => clkpipe,
      slow_clk_i => clk40,
      strobe_o   => strobe_pipeline_o
      );

  clock_strobe_320 : entity work.clock_strobe
    port map (
      fast_clk_i => clk320,
      slow_clk_i => clk40,
      strobe_o   => strobe_320
      );

  -- by construction always in sync if we are using a local clock (since it doesn't matter)
  -- otherwise we should sync to the felix datavalid
  process (clk320)
  begin
    if (rising_edge(clk320)) then
      out_of_sync <= (strobe_320 xor felix_valid_i) and (select_felix_clk);
    end if;
  end process;

  -- extend the out of sync a few clocks using the 100MHz clock to make it a readable signal
  process (clk100)
  begin
    if (rising_edge(clk100)) then
      oos_r <= not synced or out_of_sync;
      oos_rr <= oos_r;
      if (oos_rr = '1') then
        oos_cnt <= oos_cnt_max;
        out_of_sync_o <= '1';
      elsif (oos_cnt > 0) then
        oos_cnt <= oos_cnt - 1;
        out_of_sync_o <= '1';
      else
        out_of_sync_o <= '0';
      end if;
    end if;
  end process;

  --------------------------------------------------------------------------------
  -- 100MHz free-running clock
  --------------------------------------------------------------------------------

  clock_100m_in_ibufds : IBUFDS
    generic map(
      DIFF_TERM    => true,             --DifferentialTermination
      IBUF_LOW_PWR => false,            --Lowpower(TRUE)vs.performance(FALSE)
      IOSTANDARD   => "LVDS")
    port map(
      O  => clock_100m_ibufds,
      I  => clock_100m_i_p,
      IB => clock_100m_i_n
      );

  -- create a freerunnning clock for
  -- initialization of the mgts, AXI, etc.
  -- this could be put on a PLL / MMCM if the frequency needs to change
  -- or just a BUFG_DIV if we want to go from 100M to 50M for example

  BUFG_freeclk_inst : BUFG
    port map (
      I => clock_100m_ibufds,
      O => clk100
      );

  -- 50MHz divided copy for AXI  (should increase this later)
  BUFG_clk50_inst : BUFGCE_DIV
    generic map (
      BUFGCE_DIVIDE => 2
      )
    port map (
      I   => clock_100m_ibufds,
      CLR => '0',
      CE  => '1',
      O   => clk50
      );

  -------------------------------------------------------------------------------
  -- MMCM
  --------------------------------------------------------------------------------

  clock_in_ibufds : IBUFDS
    generic map(
      DIFF_TERM    => true,             --DifferentialTermination
      IBUF_LOW_PWR => false,            --Lowpower(TRUE)vs.performance(FALSE)
      IOSTANDARD   => "LVDS")
    port map(
      O  => clock_ibufds,
      I  => clock_i_p,
      IB => clock_i_n
      );

  -- The MMCM and PLL reference clock can be dynamically switched by using the CLKINSEL pin.
  -- The switching is done asynchronously. Once the clock switches, the MMCM/PLL is likely to
  -- lose LOCKED and automatically lock onto the new clock. Therefore, once the clock switches,
  -- the MMCM/PLL must be reset. The MMCM/PLL clock MUX switching is shown in Figure 3-10.
  -- The CLKINSEL signal directly controls the MUX. No synchronization logic is present
  framework_mmcm_inst : entity xil_defaultlib.framework_mmcm
    port map (
      clk320_async_i => clock_ibufds,
      clk320_sync_i  => felix_recclk_i,
      clk_sel_i      => select_felix_clk,
      reset          => reset_i,

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
      CLR => '0',
      CE  => '1',
      O   => clkfb
      );

  -- 40Mhz clock
  -- CLR the output is 0 when CLR is High (active).
  -- When CLR (reset) is deasserted, the output clock transitions from Low to High on the first
  -- edge after the CLR is deasserted, regardless of the divide value.
  bufgce_clk40_inst : bufgce_div
    generic map (
      BUFGCE_DIVIDE => 8
      )
    port map (
      I   => clk320_nobuf,
      CLR => (not mmcm_locked) or clear or (not synced),
      CE  => '1',
      O   => clk40
      );

  -- lpgbt clock
  bufgce_clk320_inst : bufgce_div
    generic map (
      BUFGCE_DIVIDE => 1
      )
    port map (
      I   => clk320_nobuf,
      CLR => (not mmcm_locked),
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
      CLR => (not mmcm_locked),
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
  -- The CLEAR input of the BUFGCE gives us a way to dial-in the phase alignment of the 40MHz
  -- clock that we generate from the 320MHz recovered clock
  --
  -- When CE is deasserted, the output stops at its current state, High or Low.
  -- When CE is reasserted, the internal counter restarts from where it stopped.
  -- For example, if the divide value is 8 and CE is deasserted two input clock cycles after
  -- the last output High transition, the output stays High. Then when CE is reasserted,
  -- the output transitions Low after two input clock cycles. If the reset input is used,
  -- upon assertion the output transitions Low immediately if the current output is High,
  -- otherwise it stays Low.
  --
  --
  --            ___ ___ ___ ___ ___ ___ ___ ___ ___
  -- clk320   __|0|_|1|_|2|_|3|_|4|_|5|_|6|_|7|_|8|_
  --            _____                           _____
  -- valid    __|   |___________________________|
  --              _____
  -- sync_i   ____|   |_________________________________
  --                                _____
  -- val_dly  ______________________|   |______________
  --                                    _____
  -- clear    __________________________|   |__________
  --          _________                         ________
  -- synced           |_________________________|
  --                                            ________
  -- clk40    __________________________________|

  process (clk320, mmcm_locked)
    variable sync_r, sync_rr : std_logic;
  begin
    -- need ASYNC check if mmcm is locked
    if (mmcm_locked='0') then
      clear  <= '0';
      synced <= '0';
      sync_r := '0';
      sync_rr := '0';
      valid_sr <= (others => '0');
    elsif (rising_edge(clk320)) then

      -- let the mmcm locking initiate a sync process
      sync_r  := sync_i or mmcm_locking or (not mmcm_locked);
      sync_rr := sync_r;

      valid_sr <= felix_valid_i & valid_sr(valid_sr'length-1 downto 1);

      if (select_felix_clk = '0') then
        clear  <= '0';
        synced <= '1';
      else
        if (sync_rr = '1') then
          clear  <= '1';
          synced <= '0';
        elsif (clear = '1' and synced = '0' and valid_sr(0) = '1') then
          clear  <= '0';
          synced <= '1';
        end if;
      end if;

    end if;
  end process;

  process (clk100)
  begin
    if (rising_edge(clk100)) then
      mmcm_locked_sr <= mmcm_locked_sr(mmcm_locked_sr'length-2 downto 0) & mmcm_locked;
    end if;
  end process;

  mmcm_locking   <= '1' when mmcm_locked_sr = "01111111" else '0';

  --------------------------------------------------------------------------------
  -- Output Clock to Pins
  --------------------------------------------------------------------------------

  lhc_refclk_oddr : ODDRE1
    generic map (                       --
      IS_C_INVERTED => '0',             -- Optional inversion for C
      SIM_DEVICE    => "ULTRASCALE",    -- Set the device version (ULTRASCALE)
      SRVAL         => '0'              -- Initializes the ODDRE1 Flip-Flops to the specified value ('0', '1')
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
