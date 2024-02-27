// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef COMMON_CONSTANTS_PKG_SVH
`define COMMON_CONSTANTS_PKG_SVH

`include <common_ieee_pkg.svh>
`include <l0mdt_constants_pkg.svh>

package common_constants_pkg;

   parameter int MDT_GLOBAL_AXI_LEN = 19;

   parameter float MDT_GLOBAL_AXI_MULT = 32.0;

   parameter int MDT_LOCAL_X_LEN = 15;

   parameter float MDT_LOCAL_X_MULT = 32.0;

   parameter int MDT_LOCAL_Y_LEN = 15;

   parameter float MDT_LOCAL_Y_MULT = 32.0;

   parameter int MDT_RADIUS_LEN = 9;

   parameter float MDT_RADIUS_MULT = 32.0;

   parameter int BCID_LEN = 12;

   parameter int SLC_CHAMBER_LEN = 4;

   parameter int SLC_Z_RPC_LEN = 12;

   parameter float SLC_Z_RPC_MULT = 0.125;

   parameter int MDT_FIBER_LEN = 5;

   parameter int MDT_MUXCH_LEN = 4;

   parameter int MDT_TUBE_LEN = 9;

   parameter int MDT_LAYER_LEN = 5;

   parameter int MDT_TIME_LEN = 17;

   parameter int UCM_VEC_ANG_LEN = 11;

   parameter int UCM_MBAR_LEN = 11;

   parameter int UCM_Z_ROI_LEN = 14;

   parameter float UCM_Z_ROI_MULT = 1.0;

   parameter int MDT_LOCAL_AXI_LEN = 14;

   parameter float MDT_LOCAL_AXI_MULT = 16.0;

   parameter int CSF_X_OFFSET = 0;

   parameter int CSF_Y_OFFSET = -640;

   parameter int SF_SEG_POS_LEN = 18;

   parameter float SF_SEG_POS_MULTI = 16.0;

   parameter int SF_SEG_ANG_LEN = 14;

   parameter float SF_SEG_ANG_MULTI = 4096.0;

   parameter int SF_SEG_ANG_MULTI_LEN = 12;

   parameter int UCM_PT_PHIMOD_LEN = 8;

   parameter int MTC_ETA_LEN = 14;

   parameter int MTC_PT_LEN = 8;

   parameter float MTC_PT_MULT = 2.0;

   parameter int MTC_PTTHR_LEN = 4;

   parameter int MTC_NSEG_LEN = 2;

   parameter int MTC_QUALITY_LEN = 3;

   parameter float BIL_SEC3_RHO_CORNER = 4755.91;

   parameter float BML_SEC3_RHO_CORNER = 6898.44;

   parameter float BOL_SEC3_RHO_CORNER = 9259.44;

   parameter float BIL_SEC3_RHO = 4948.979;

   parameter float BML_SEC3_RHO = 7138.999;

   parameter float BOL_SEC3_RHO = 9499.998;

   parameter int c_CLK_AXI_MULT = 8;

   parameter int UCM_R_MDT_LEN = 15;

endpackage : common_constants_pkg

`endif // COMMON_CONSTANTS_PKG_SVH
