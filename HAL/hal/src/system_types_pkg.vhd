library ieee;
use ieee.std_logic_1164.all;

package system_types_pkg is

  constant std_logic1 : std_logic := '1';
  constant std_logic0 : std_logic := '0';

  type std16_array_t is array (integer range <>) of std_logic_vector(15 downto 0);
  type std32_array_t is array (integer range <>) of std_logic_vector(31 downto 0);
  type std64_array_t is array (integer range <>) of std_logic_vector(63 downto 0);

  type gtcommon_rt is record
    refclk         : std_logic;
    refclk01       : std_logic;
    clock40        : std_logic;
    clock320       : std_logic;
    clock_pipeline : std_logic;
  end record;

  type TTS_CMD_rt is record
    backpressure : std_logic;
  end record;

  function log2ceil(arg : positive) return natural;

  function bitsel(data : std_logic_vector; width : integer; index : integer)
    return std_logic_vector;

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

  function bitsel(data : std_logic_vector; width : integer; index : integer)
    return std_logic_vector is
  begin
    return data(width*(index+1)-1 downto width*(index));
  end function;

end package body;
