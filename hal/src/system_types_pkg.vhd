library ieee;
use ieee.std_logic_1164.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;

package system_types_pkg is

  constant std_logic1 : std_logic := '1';
  constant std_logic0 : std_logic := '1';

  type std32_array_t is array (integer range <>) of std_logic_vector(31 downto 0);
  type std64_array_t is array (integer range <>) of std_logic_vector(63 downto 0);

  type gtcommon_rt is record
    refclk         : std_logic;
    refclk01       : std_logic;
    clock40        : std_logic;
    clock320       : std_logic;
    clock240       : std_logic;
    clock_pipeline : std_logic;
  end record;

  type system_clocks_rt is record
    sl_locked      : std_logic;
    locked         : std_logic;
    freeclock      : std_logic;
    clock40        : std_logic;
    clock300       : std_logic;
    clock320       : std_logic;
    clock240       : std_logic;
    clock_pipeline : std_logic;
  end record;

  type SLCPROC_PIPE_ENDCAP_rt_array is array (integer range <>) of SLCPROC_PIPE_ENDCAP_rt;
  type SLCPROC_PIPE_BARREL_rt_array is array (integer range <>) of SLCPROC_PIPE_BARREL_rt;
  type SLC_ENDCAP_rt_array is array (integer range <>) of SLC_ENDCAP_rt;
  type SLC_BARREL_rt_array is array (integer range <>) of SLC_BARREL_rt;
  type TDCPOLMUX_rt_array is array (integer range <>) of TDCPOLMUX_rt;
  type SF_rt_array is array (integer range <>) of SF_rt;

  type DAQ_LINK_rt is record
    dummy : std_logic_vector (1 downto 0);
  end record;
  type DAQ_LINK_rt_array is array (integer range <>) of DAQ_LINK_rt;

  type TTC_CMD_rt is record
    bc0    : std_logic;
    resync : std_logic;
  end record;

  type TTS_CMD_rt is record
    backpressure : std_logic;
  end record;

  type l0mdt_control_rt is record       -- basic control signals to all blocks
    clk   : std_logic;                  -- pipeline clock
    rst_n : std_logic;                  -- active low reset (min 8 clk)
    bx    : std_logic;                  -- bunch crossing strobe
  end record;

  type l0mdt_ttc_rt is record           -- Trigger, Timing, Control
    bcr : std_logic;                    -- LHC bunch count reset (BC0)
    ocr : std_logic;                    -- LHC orbit count reset
    ecr : std_logic;                    -- ATLAS event number reset
    l0a : std_logic;                    -- level 0 accept trigger
    l1a : std_logic;                    -- level 1 accept trigger (optional)
  end record;

  function log2ceil(arg : positive) return natural;

end system_types_pkg;

package body system_types_pkg is

  -- vhdl does not have built-in clog2...
  function log2ceil(arg : positive) return natural is
    variable tmp : positive := 1;
    variable log : natural  := 0;
  begin
    if arg = 1 then return 0; end if;
    while arg > tmp loop
      tmp := tmp * 2;
      log := log + 1;
    end loop;
    return log;
  end function;

end package body;
