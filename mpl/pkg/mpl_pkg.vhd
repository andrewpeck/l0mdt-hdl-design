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
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;

package mpl_pkg is

  constant MPL_PL_A_LATENCY : integer := c_MPL_PL_A_LATENCY;

  constant MPL_PL_B_LATENCY : integer := c_MPL_PL_B_LATENCY;

end package mpl_pkg;

------------------------------------------------------------

package body mpl_pkg is

end package body mpl_pkg;
