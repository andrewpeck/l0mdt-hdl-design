// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef CSF_PKG_SVH
`define CSF_PKG_SVH


`include <common_ieee_pkg.svh>
`include <l0mdt_constants_pkg.svh>
`include <l0mdt_dataformats_pkg.svh>
`include <common_constants_pkg.svh>
`include <common_types_pkg.svh>

package csf_pkg;

   parameter float UCM_MBAR_MULT = 1024.0;

   parameter int CSF_SEG_M_LEN = 15;

   parameter float CSF_SEG_M_MULT = 4096.0;

   parameter int CSF_SEG_B_LEN = 13;

   parameter float CSF_SEG_B_MULT = 16.0;

   parameter int CSF_SEG_CHI2_LEN = 15;

   parameter float CSF_SEG_CHI2_MULT = 4.0;

   parameter int CSF_MAXHITS_SEG = 16;

   parameter int CSF_MAXHITS_SEG_LEN = 4;

   parameter int CSF_MAXHITS_ML_LEN = 3;

   parameter int CSF_MAX_CLUSTERS = 6;

   parameter int SUM_XY_LEN = 34;

   parameter int SUM_Y_LEN = 19;

   parameter int SUM_X_LEN = 19;

   parameter int SUM_X2_LEN = 34;

   typedef struct packed {
      slc_muid_rt  muid;
      logic unsigned [UCM_VEC_ANG_LEN-1:0] mbar;
      logic unsigned [UCM_Z_ROI_LEN-1:0] pos;
      logic unsigned [UCM_Z_ROI_LEN-1:0] ang;
      vec_mdtid_rt  mdtid;
      logic  data_valid;
   } csf_seed_rt ;

   typedef struct packed {
      logic  valid;
      logic unsigned [MDT_LOCAL_X_LEN-1:0] x;
      logic unsigned [MDT_LOCAL_Y_LEN-1:0] y;
   } csf_hit_rt ;

   typedef logic csf_hit_vt[30,0];

   typedef csf_hit_rt csf_hit_art[];

   typedef csf_hit_vt csf_hit_avt[];

   typedef struct packed {
      logic  valid;
      logic signed [CSF_SEG_B_LEN-1:0] b;
      logic signed [CSF_SEG_M_LEN-1:0] m;
      logic unsigned [CSF_SEG_CHI2_LEN-1:0] chi2;
      logic unsigned [CSF_MAXHITS_SEG_LEN-1:0] nhits;
   } csf_locseg_rt ;

   typedef logic csf_locseg_vt[47,0];

   typedef csf_locseg_rt csf_locseg_art[];

   typedef csf_locseg_vt csf_locseg_avt[];

   typedef struct packed {
      logic  valid;
      logic unsigned [SUM_XY_LEN-1:0] xy;
      logic unsigned [SUM_Y_LEN-1:0] y;
      logic unsigned [SUM_X_LEN-1:0] x;
      logic unsigned [SUM_X2_LEN-1:0] x2;
      logic unsigned [CSF_MAXHITS_SEG_LEN-1:0] n;
   } csf_sums_rt ;

   typedef logic csf_sums_vt[110,0];

   typedef csf_sums_rt csf_sums_art[];

   typedef csf_sums_vt csf_sums_avt[];

   typedef struct packed {
      logic  data_valid;
      slc_muid_rt  muid;
      vec_mdtid_rt  mdtid;
      logic signed [SF_SEG_POS_LEN-1:0] pos;
      logic signed [SF_SEG_ANG_LEN-1:0] angle;
      logic  quality;
   } sf_seg_data_barrel_rt ;

   typedef struct packed {
      logic  data_valid;
      slc_muid_rt  muid;
      vec_mdtid_rt  mdtid;
      logic unsigned [SF_SEG_POS_LEN-1:0] pos;
      logic signed [SF_SEG_ANG_LEN-1:0] angle;
      logic  quality;
   } sf_seg_data_endcap_rt ;

endpackage : csf_pkg

`endif // CSF_PKG_SVH
