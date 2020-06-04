library ieee;
use ieee.std_logic_1164.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;
use l0mdt_lib.mdttp_constants_pkg.all;

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

  type TDCPOLMUX_rt_array is array (integer range <>) of TDCPOLMUX_rt;

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

  constant SLC_LEN : integer := 80;
  subtype SLC_vt is std_logic_vector(SLC_LEN-1 downto 0);
  type SLC_avt is array (integer range <>) of SLC_vt;

  -- constant TDCPOLMUX_LEN : integer := 42;
  subtype TDCPOLMUX_vt is std_logic_vector(TDCPOLMUX_LEN-1 downto 0);
  type TDCPOLMUX_avt is array (integer range <>) of TDCPOLMUX_vt;

  constant SF_LEN : integer := 128;
  subtype SF_vt is std_logic_vector(SF_LEN-1 downto 0);
  type SF_avt is array (integer range <>) of SF_vt;

  constant SLCPIPE_PTCALC_LEN : integer := 128;
  subtype SLCPIPE_PTCALC_vt is std_logic_vector(SLCPIPE_PTCALC_LEN-1 downto 0);
  type SLCPIPE_PTCALC_avt is array (integer range <>) of SLCPIPE_PTCALC_vt;

  constant FELIX_STREAM_LEN : integer := 64;
  subtype FELIX_STREAM_vt is std_logic_vector(FELIX_STREAM_LEN-1 downto 0);
  type FELIX_STREAM_avt is array (integer range <>) of FELIX_STREAM_vt;

  constant MTC_LEN : integer := 80;
  subtype MTC_vt is std_logic_vector(MTC_LEN-1 downto 0);
  type MTC_avt is array (integer range <>) of MTC_vt;

  constant NSP_LEN : integer := 128;
  subtype NSP_vt is std_logic_vector(NSP_LEN-1 downto 0);
  type NSP_avt is array (integer range <>) of NSP_vt;

  -- Number of TDC Hits per Station
  constant c_NUM_INNER_POLMUX  : integer := 6;
  constant c_NUM_MIDDLE_POLMUX : integer := 6;
  constant c_NUM_OUTER_POLMUX  : integer := 6;
  constant c_NUM_EXTRA_POLMUX  : integer := 6;

  -- Number of sector logic candidates (1 + 3 + 1)
  constant c_NUM_SLC : integer := 5;

  -- Number of segments from neighbor
  constant c_NUM_SF_INPUTS  : integer := 3;
  constant c_NUM_SF_OUTPUTS : integer := 2;

  -- Number of hit extraction groups per processing station
  -- is always equal to the number of segment finders
  constant c_NUM_THREADS : integer := 3;

  -- Number of DAQ streams
  constant c_NUM_DAQ_STREAMS : integer := 1;

  constant c_NUM_MTC : integer := 1;
  constant c_NUM_NSP : integer := 2;
  --
  constant c_NUM_SLCPROC_OUTPUTS : integer := 3;
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
