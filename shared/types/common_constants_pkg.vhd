library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;

package common_constants_pkg is

  constant MDT_GLOBAL_AXI_LEN : integer := 19;

  constant MDT_GLOBAL_AXI_MULT : real := 32.0;

  constant MDT_LOCAL_X_LEN : integer := HEG2SFHIT_LOCALX_LEN;

  constant MDT_LOCAL_X_MULT : real := HEG2SFHIT_LOCALX_MULT;

  constant MDT_LOCAL_Y_LEN : integer := HEG2SFHIT_LOCALY_LEN;

  constant MDT_LOCAL_Y_MULT : real := HEG2SFHIT_LOCALY_MULT;

  constant MDT_RADIUS_LEN : integer := HEG2SFHIT_RADIUS_LEN;

  constant MDT_RADIUS_MULT : real := 32.0;

  constant BCID_LEN : integer := SL_HEADER_BCID_LEN;

  constant SLC_CHAMBER_LEN : integer := 4;

  constant SLC_Z_RPC_LEN : integer := SLC_BARREL_RPC0_POSZ_LEN;

  constant SLC_Z_RPC_MULT : real := 13.0;

  constant MDT_FIBER_LEN : integer := 5;

  constant MDT_MUXCH_LEN : integer := 4;

  constant MDT_TUBE_LEN : integer := TAR2HPS_TUBE_LEN;

  constant MDT_LAYER_LEN : integer := TAR2HPS_LAYER_LEN;

  constant MDT_TIME_LEN : integer := 18;

  constant UCM_VEC_ANG_LEN : integer := UCM2HPS_VEC_ANG_LEN;

  constant UCM_MBAR_LEN : integer := UCM_VEC_ANG_LEN;

  constant UCM_Z_ROI_LEN : integer := UCM2HPS_VEC_POS_LEN;

  constant MDT_LOCAL_AXI_LEN : integer := 14;

  constant MDT_LOCAL_AXI_MULT : real := 16.0;

  constant CSF_X_OFFSET : integer := 0;

  constant CSF_Y_OFFSET : integer := -640;

  constant SF_SEG_POS_LEN : integer := SF2PTCALC_SEGPOS_LEN;

  constant SF_SEG_POS_MULTI : real := 16.0;

  constant SF_SEG_ANG_LEN : integer := SF2PTCALC_SEGANGLE_LEN;

  constant SF_SEG_ANG_MULTI : real := 4096.0;

  constant SF_SEG_ANG_MULTI_LEN : integer := 12;

  constant UCM_PT_PHIMOD_LEN : integer := UCM2PL_PHIMOD_LEN;

  constant MTC_ETA_LEN : integer := PTCALC2MTC_MDT_ETA_LEN;

  constant MTC_PT_LEN : integer := PTCALC2MTC_MDT_PT_LEN;

  constant MTC_PT_MULT : real := PTCALC2MTC_MDT_PT_MULT;

  constant MTC_PTTHR_LEN : integer := PTCALC2MTC_MDT_PTTHRESH_LEN;

  constant MTC_NSEG_LEN : integer := PTCALC2MTC_MDT_NSEGMENTS_LEN;

  constant MTC_QUALITY_LEN : integer := PTCALC2MTC_MDT_QUALITY_LEN;

  constant BIL_SEC3_RHO : real := 4949.0;

  constant BML_SEC3_RHO : real := 7139.0;

  constant BOL_SEC3_RHO : real := 9500.0;

end package common_constants_pkg;

------------------------------------------------------------

package body common_constants_pkg is

end package body common_constants_pkg;
