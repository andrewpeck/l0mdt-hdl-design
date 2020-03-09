library ieee;
use ieee.std_logic_1164.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;

package system_types_pkg is

  type std32_array_t is array (integer range <>) of std_logic_vector(31 downto 0);

  constant std_logic_1 : std_logic := '1';
  constant std_logic_0 : std_logic := '1';

  type system_clocks_rt is record
    locked         : std_logic;
    clock40        : std_logic;
    clock320       : std_logic;
    clock240       : std_logic;
    clock_pipeline : std_logic;
  end record;

  type SLCPROC_PIPELINE_ENDCAP_rt_array is array (integer range <>) of SLCPROC_PIPELINE_ENDCAP_rt;
  type SLCPROC_PIPELINE_BARREL_rt_array is array (integer range <>) of SLCPROC_PIPELINE_BARREL_rt;
  type SLC_ENDCAP_rt_array is array (integer range <>) of SLC_ENDCAP_rt;
  type SLC_BARREL_rt_array is array (integer range <>) of SLC_BARREL_rt;
  type TDCFORMAT_rt_array is array (integer range <>) of TDCFORMAT_rt;

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

end system_types_pkg;
