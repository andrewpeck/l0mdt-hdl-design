library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

package daq_user_defs_pkg is

  constant DAQ_N_PIPELINES : integer := 16;

  constant DAQ_N_STREAMS : integer := 1;

  constant DAQ_N_FLOWS : integer := 6;

  subtype snake_paths_desc_t is integer_bus_at(DAQ_N_STREAMS-1 downto 0);

  constant DAQ_STREAMS : snake_paths_desc_t := (0 => 40);

end package daq_user_defs_pkg;

------------------------------------------------------------

package body daq_user_defs_pkg is

end package body daq_user_defs_pkg;
