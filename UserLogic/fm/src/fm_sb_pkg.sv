`ifndef _FM_SB_PKG_
`define _FM_SB_PKG_
`include "FM_PKG.svh"

package fm_sb_pkg;

   import fm_ctrl::*;

   parameter total_sb            = 2;
   parameter total_sb_bits      = $clog2(total_sb);
   parameter axi_dw             = 32;
   parameter mon_dw_max         = 256;
   parameter pb_mode_width      = 2;


   FM_CTRL_t FM_CTRL;
   FM_MON_t FM_MON;


   typedef struct {
      logic [mon_dw_max-1 : 0] fm_data;
      logic 		       fm_vld;
      }fm_rt;

   parameter  integer axi_sb_addr_width[total_sb] = {
						     $bits(FM_CTRL.SB0.SB_MEM.address),
						     $bits(FM_CTRL.SB1.SB_MEM.address)
						     };
   parameter integer  axi_sm_addr_width[total_sb] = {
						     $bits(FM_CTRL.SB0.SB_META.address),
						     $bits(FM_CTRL.SB1.SB_META.address)
						     };
   logic [15:0]       axi_sb_addr[total_sb] ;
   logic [15:0]       axi_sm_addr[total_sb] ;
   logic 	      axi_sb_enable[total_sb];
   logic 	      axi_sm_enable[total_sb];
   logic 	      axi_sb_wr_enable[total_sb];
   logic 	      axi_sm_wr_enable[total_sb];
   logic [axi_dw-1:0] axi_sb_wr_data[total_sb] ;
   logic [axi_dw-1:0] axi_sm_wr_data[total_sb];
   logic 	      spy_clock;


   /*
   logic [15:0]       axi_sb_addr[total_sb]       = {
						     FM_CTRL_t.SB0.SB_MEM.address,
						     FM_CTRL_t.SB1.SB_MEM.address
						     };
   logic [15:0]       axi_sm_addr[total_sb]       = {
						     FM_CTRL_t.SB0.SB_META.address,
						     FM_CTRL_t.SB1.SB_META.address
						     };

   logic 	      axi_sb_enable[total_sb]       = {
						       FM_CTRL_t.SB0.SB_MEM.enable,
						       FM_CTRL_t.SB1.SB_MEM.enable
						       };
   logic 	      axi_sm_enable[total_sb]       = {
						       FM_CTRL_t.SB0.SB_META.enable,
						       FM_CTRL_t.SB1.SB_META.enable
						       };

   logic 	      axi_sb_wr_enable[total_sb]    = {
						       FM_CTRL_t.SB0.SB_MEM.wr_enable,
						       FM_CTRL_t.SB1.SB_MEM.wr_enable
						       };
   logic 	      axi_sm_wr_enable[total_sb]    = {
						       FM_CTRL_t.SB0.SB_META.wr_enable,
						       FM_CTRL_t.SB1.SB_META.wr_enable
						       };

   logic [axi_dw-1:0] axi_sb_wr_data[total_sb]       = {
							FM_CTRL_t.SB0.SB_MEM.wr_data,
							FM_CTRL_t.SB1.SB_MEM.wr_data
							};
   logic [axi_dw-1:0] axi_sm_wr_data[total_sb]       = {
							FM_CTRL_t.SB0.SB_META.wr_enable,
							FM_CTRL_t.SB1.SB_META.wr_enable
							};
    logic 	      spy_clock                       = FM_CTRL.SB0.SB_MEM.clk;
   */

   logic [axi_dw-1:0] axi_spy_data[total_sb];
   logic [axi_dw-1:0] axi_spy_meta_data[total_sb];






endpackage // fm_sb_pkg

`endif //  `ifndef _FM_SB_PKG_
