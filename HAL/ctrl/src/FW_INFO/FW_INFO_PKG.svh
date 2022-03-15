// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl
// 2022-03-15 23:42:25

`ifndef FW_INFO_CTRL_SVH
`define FW_INFO_CTRL_SVH


`include <common_ieee_pkg.svh>

package FW_INFO_CTRL;

   typedef struct FW_INFO_FW_INFO_BUILD_DATE_MON_t {
      logic DAY[8:0];
      logic MONTH[8:0];
      logic YEAR[16:0];
   };

   typedef struct FW_INFO_FW_INFO_BUILD_TIME_MON_t {
      logic SEC[8:0];
      logic MIN[8:0];
      logic HOUR[8:0];
   };

   typedef struct FW_INFO_FW_INFO_MON_t {
      logic GIT_VALID;
      logic GIT_HASH_1[32:0];
      logic GIT_HASH_2[32:0];
      logic GIT_HASH_3[32:0];
      logic GIT_HASH_4[32:0];
      logic GIT_HASH_5[32:0];
      FW_INFO_FW_INFO_BUILD_DATE_MON_t BUILD_DATE;
      FW_INFO_FW_INFO_BUILD_TIME_MON_t BUILD_TIME;
   };

   typedef struct FW_INFO_HOG_INFO_MON_t {
      logic GLOBAL_FWDATE[32:0];
      logic GLOBAL_FWTIME[32:0];
      logic OFFICIAL[32:0];
      logic GLOBAL_FWHASH[32:0];
      logic TOP_FWHASH[32:0];
      logic XML_HASH[32:0];
      logic GLOBAL_FWVERSION[32:0];
      logic TOP_FWVERSION[32:0];
      logic XML_VERSION[32:0];
      logic HOG_FWHASH[32:0];
      logic FRAMEWORK_FWVERSION[32:0];
      logic FRAMEWORK_FWHASH[32:0];
   };

   typedef struct FW_INFO_CONFIG_MON_t {
      logic MAIN_CFG_COMPILE_HW;
      logic MAIN_CFG_COMPILE_UL;
      logic ST_nBARREL_ENDCAP;
      logic ENDCAP_nSMALL_LARGE;
      logic ENABLE_NEIGHBORS;
      logic SECTOR_ID[32:0];
      logic PHY_BARREL_R0[32:0];
      logic PHY_BARREL_R1[32:0];
      logic PHY_BARREL_R2[32:0];
      logic PHY_BARREL_R3[32:0];
      logic HPS_ENABLE_ST_INN;
      logic HPS_ENABLE_ST_EXT;
      logic HPS_ENABLE_ST_MID;
      logic HPS_ENABLE_ST_OUT;
      logic HPS_NUM_MDT_CH_INN[8:0];
      logic HPS_NUM_MDT_CH_EXT[8:0];
      logic HPS_NUM_MDT_CH_MID[8:0];
      logic HPS_NUM_MDT_CH_OUT[8:0];
      logic NUM_MTC[8:0];
      logic NUM_NSP[8:0];
      logic UCM_ENABLED;
      logic MPL_ENABLED;
      logic SF_ENABLED;
      logic SF_TYPE;
      logic NUM_DAQ_STREAMS[8:0];
      logic NUM_SF_INPUTS[8:0];
      logic NUM_SF_OUTPUTS[8:0];
      logic MAX_NUM_SL[8:0];
      logic NUM_THREADS[8:0];
   };

   typedef struct FW_INFO_MON_t {
      FW_INFO_FW_INFO_MON_t FW_INFO;
      FW_INFO_HOG_INFO_MON_t HOG_INFO;
      FW_INFO_CONFIG_MON_t CONFIG;
   };

endpackage : FW_INFO_CTRL

`endif // FW_INFO_CTRL_SVH
