library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;

package common_constants_pkg is

  constant MDT_GLOBAL_AXI_LEN : integer := 19;

  -- MDT_GLOBAL_AXI_MULT: mm
  constant MDT_GLOBAL_AXI_MULT : real := 32.0;

  constant MDT_LOCAL_X_LEN : integer := 13;

  constant MDT_LOCAL_Y_LEN : integer := 14;

  constant MDT_RADIUS_LEN : integer := 9;

  constant MDT_RADIUS_MULT : real := 32.0;

  constant BCID_LEN : integer := SL_HEADER_BCID_LEN;

  constant SLC_CHAMBER_LEN : integer := 3;

  constant SLC_Z_RPC_LEN : integer := 10;

  constant SLC_Z_RPC_MULT : real := 13.0;

  constant MDT_FIBER_LEN : integer := 5;

  constant MDT_MUXCH_LEN : integer := 4;

  constant MDT_TUBE_LEN : integer := TAR2HPS_MDT_TUBE_NUM_LEN;

  constant MDT_LAYER_LEN : integer := TAR2HPS_MDT_TUBE_LAYER_LEN;

  constant MDT_TIME_LEN : integer := 18;

  constant UCM_VEC_ANG_LEN : integer := UCM2HPS_VEC_ANG_LEN;

  constant UCM_Z_ROI_LEN : integer := SLC_BARREL_RPC0_POSZ_LEN;

  constant MDT_LOCAL_AXI_LEN : integer := 14;

  constant MDT_LOCAL_AXI_MULT : real := 16.0;

  constant CSF_X_OFFSET : integer := 0;

  constant CSF_Y_OFFSET : integer := -640;

  constant SF_SEG_DATA_LEN : integer := 59;

  constant BIL_SEC3_RHO : real := 4949.0;

  constant BML_SEC3_RHO : real := 7139.0;

  constant BOL_SEC3_RHO : real := 9500.0;

end package common_constants_pkg;

------------------------------------------------------------

package body common_constants_pkg is

end package body common_constants_pkg;
