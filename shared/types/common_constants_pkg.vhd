library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;

package common_constants_pkg is

  constant   MDT_GLOBAL_AXI_LEN   :  integer := 19;

  constant   MDT_GLOBAL_AXI_MULT  :  real := 32.0;

  constant   MDT_LOCAL_X_LEN      :  integer := 13;

  constant   MDT_LOCAL_Y_LEN      :  integer := 14;

  constant   MDT_RADIUS_LEN       :  integer := 9;

  constant   MDT_RADIUS_MULT      :  real := 32.0;

  constant   MDT_LOCAL_AXI_LEN    :  integer := 14;

  constant   MDT_LOCAL_AXI_MULT   :  real := 16.0;

  constant   CSF_X_OFFSET         :  integer := 0;

  constant   CSF_Y_OFFSET         :  integer := -640;

  constant   SF_SEG_DATA_LEN      :  integer := 59;

  constant   BIL_SEC3_RHO         :  real := 4949.0;

  constant   BML_SEC3_RHO         :  real := 7139.0;

  constant   BOL_SEC3_RHO         :  real := 9500.0;

end package common_constants_pkg;

------------------------------------------------------------

package body common_constants_pkg is

end package body common_constants_pkg;
