library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package common_constants_pkg is

  constant   SLC_SLCID_LEN        :  integer := 2;

  constant   SLC_SLID_LEN         :  integer := 6;

  constant   BCID_LEN             :  integer := 12;

  constant   SLC_CHAMBER_LEN      :  integer := 3;

  constant   SLC_TCID_LEN         :  integer := 3;

  constant   SLC_TCSENT_LEN       :  integer := 1;

  constant   SLC_POS_ETA_LEN      :  integer := 14;

  constant   SLC_POS_ETA_MULT     :  real := 0.014;

  constant   SLC_POS_PHI_LEN      :  integer := 9;

  constant   SLC_POS_PHI_MULT     :  real := 0.012;

  constant   SLC_RPC_PT_LEN       :  integer := 8;

  constant   SLC_PT_TH_LEN        :  integer := 4;

  constant   SLC_CHARGE_LEN       :  integer := 1;

  constant   SLC_B_SPARE_LEN      :  integer := 8;

  constant   SLC_COIN_TYPE_LEN    :  integer := 3;

  constant   SLC_Z_RPC_LEN        :  integer := 10;

  constant   SLC_Z_RPC_MULT       :  real := 25.0;

  constant   SLC_E_SPARE_LEN      :  integer := 8;

  constant   SLC_R_LEN            :  integer := 10;

  constant   SLC_ANGLE_WRT_PHI_LEN :  integer := 7;

  constant   SLC_ANGLE_WRT_ETA_LEN :  integer := 4;

  constant   SLC_NSW_ETA_LEN      :  integer := 14;

  constant   SLC_NSW_PHI_LEN      :  integer := 8;

  constant   SLC_NSW_ANGLE_WRT_ETA_LEN :  integer := 5;

  constant   SLC_SPECIFIC_LEN     :  integer := 51;

  constant   MDT_TDC_CH_LEN       :  integer := 5;

  constant   MDT_TDC_MODE_LEN     :  integer := 2;

  constant   MDT_TDC_COARSE_LEN   :  integer := 12;

  constant   MDT_TDC_FINE_LEN     :  integer := 5;

  constant   MDT_TDC_PW_LEN       :  integer := 8;

  constant   MDT_FIBER_LEN        :  integer := 5;

  constant   MDT_MUXCH_LEN        :  integer := 4;

  constant   MDT_TUBE_LEN         :  integer := 9;

  constant   MDT_LAYER_LEN        :  integer := 5;

  constant   MDT_TIME_LEN         :  integer := 18;

  constant   UCM_MBAR_LEN         :  integer := 12;

  constant   UCM_MBAR_MULT        :  real := 1024.0;

  constant   UCM_Z_ROI_LEN        :  integer := 10;

  constant   UCM_R_ROI_LEN        :  integer := 4;

  constant   UCM_PHI_LEN          :  integer := 14;

  constant   UCM_ETA_LEN          :  integer := 8;

  constant   UCM2HPS_SPECIFIC_LEN :  integer := 22;

  constant   MDT_GLOBAL_AXI_LEN   :  integer := 19;

  constant   MDT_GLOBAL_AXI_MULT  :  real := 32.0;

  constant   MDT_LOCAL_AXI_LEN    :  integer := 15;

  constant   MDT_LOCAL_AXI_MULT   :  real := 32.0;

  constant   MDT_RADIUS_LEN       :  integer := 9;

  constant   MDT_RADIUS_MULT      :  real := 32.0;

  constant   CSF_X_OFFSET         :  integer := -640;

  constant   CSF_Z_OFFSET         :  integer := 1920;

  constant   SF_SEG_POS_LEN       :  integer := 19;

  constant   SF_SEG_POS_MULTI     :  real := 16.0;

  constant   SF_SEG_ANG_LEN       :  integer := 15;

  constant   SF_SEG_ANG_MULTI     :  real := 4096.0;

  constant   SF_SEG_ANG_MULTI_LEN :  integer := 12;

  constant   SLC_PT_PHIMOD_LEN    :  integer := 8;

  constant   SLC_PT_PHIMOD_MULT   :  real := 320.0;

  constant   MTC_ETA_LEN          :  integer := 15;

  constant   MTC_ETA_MULT         :  real := 6068.1481481481;

  constant   MTC_PT_LEN           :  integer := 9;

  constant   MTC_PT_MULT          :  real := 4.0;

  constant   MTC_PTTHR_LEN        :  integer := 4;

  constant   MTC_NSEG_LEN         :  integer := 2;

  constant   MTC_QUALITY_LEN      :  integer := 3;

  constant   BIL_SEC3_RHO         :  real := 4949.0;

  constant   BML_SEC3_RHO         :  real := 7139.0;

  constant   BOL_SEC3_RHO         :  real := 9500.0;

end package common_constants_pkg;

------------------------------------------------------------

package body common_constants_pkg is

end package body common_constants_pkg;
