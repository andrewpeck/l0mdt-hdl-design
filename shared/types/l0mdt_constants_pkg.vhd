library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package l0mdt_constants_pkg is

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

  constant   UCM_MBAR_LEN         :  integer := 11;

  constant   UCM_MBAR_MULT        :  real := 1024.0;

  constant   UCM_Z_ROI_LEN        :  integer := 10;

  constant   UCM_R_ROI_LEN        :  integer := 4;

  constant   UCM2HPS_SPECIFIC_LEN :  integer := 21;

end package l0mdt_constants_pkg;

------------------------------------------------------------

package body l0mdt_constants_pkg is

end package body l0mdt_constants_pkg;
