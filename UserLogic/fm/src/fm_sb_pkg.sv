`ifndef _FM_SB_PKG_
`define _FM_SB_PKG_
`include "FM_PKG.svh"

package fm_sb_pkg;

   import fm_ctrl::*;


   //parameter total_sb_bits      = $clog2(total_sb);
   parameter axi_dw             = 32;
   parameter mon_dw_max         = 256;
   parameter pb_mode_width      = 2;


   parameter stations_n         = 3; // INN, MID, OUT
   parameter threads_n          = 3;
   parameter sf_sb_n            = 3;
   parameter sf_sb_single_station_n   = sf_sb_n * threads_n;


   parameter h2s_sb_single_station_n  = sf_sb_single_station_n;
   parameter h2s_sb_all_station_n     = h2s_sb_single_station_n * stations_n;
   parameter total_sb                 = 27; //h2s_sb_all_station_n ;


   FM_CTRL_t FM_CTRL;
   FM_MON_t FM_MON;


   typedef struct {
      logic [mon_dw_max-1 : 0] fm_data;
      logic 		       fm_vld;
      }fm_rt;

   parameter  integer axi_sb_addr_width[total_sb] = {
						     $bits(FM_CTRL.SB0.SB_MEM.address),
						     $bits(FM_CTRL.SB1.SB_MEM.address),
						     $bits(FM_CTRL.SB2.SB_MEM.address),
						     $bits(FM_CTRL.SB3.SB_MEM.address),
						     $bits(FM_CTRL.SB4.SB_MEM.address),
						     $bits(FM_CTRL.SB5.SB_MEM.address),
						     $bits(FM_CTRL.SB6.SB_MEM.address),
						     $bits(FM_CTRL.SB7.SB_MEM.address),
						     $bits(FM_CTRL.SB8.SB_MEM.address),
						     $bits(FM_CTRL.SB9.SB_MEM.address),
						     $bits(FM_CTRL.SB10.SB_MEM.address),
						     $bits(FM_CTRL.SB11.SB_MEM.address),
						     $bits(FM_CTRL.SB12.SB_MEM.address),
						     $bits(FM_CTRL.SB13.SB_MEM.address),
						     $bits(FM_CTRL.SB14.SB_MEM.address),
						     $bits(FM_CTRL.SB15.SB_MEM.address),
						     $bits(FM_CTRL.SB16.SB_MEM.address),
						     $bits(FM_CTRL.SB17.SB_MEM.address),
						     $bits(FM_CTRL.SB18.SB_MEM.address),
						     $bits(FM_CTRL.SB19.SB_MEM.address),
						     $bits(FM_CTRL.SB20.SB_MEM.address),
						     $bits(FM_CTRL.SB21.SB_MEM.address),
						     $bits(FM_CTRL.SB22.SB_MEM.address),
						     $bits(FM_CTRL.SB23.SB_MEM.address),
						     $bits(FM_CTRL.SB24.SB_MEM.address),
						     $bits(FM_CTRL.SB25.SB_MEM.address),
						     $bits(FM_CTRL.SB26.SB_MEM.address)
						     };

   parameter integer  axi_sm_addr_width[total_sb] = {
						     $bits(FM_CTRL.SB0.SB_META.address),
						     $bits(FM_CTRL.SB1.SB_META.address),
						     $bits(FM_CTRL.SB2.SB_META.address),
						     $bits(FM_CTRL.SB3.SB_META.address),
						     $bits(FM_CTRL.SB4.SB_META.address),
						     $bits(FM_CTRL.SB5.SB_META.address),
						     $bits(FM_CTRL.SB6.SB_META.address),
						     $bits(FM_CTRL.SB7.SB_META.address),
						     $bits(FM_CTRL.SB8.SB_META.address),
						     $bits(FM_CTRL.SB9.SB_META.address),
						     $bits(FM_CTRL.SB10.SB_META.address),
						     $bits(FM_CTRL.SB11.SB_META.address),
						     $bits(FM_CTRL.SB12.SB_META.address),
						     $bits(FM_CTRL.SB13.SB_META.address),
						     $bits(FM_CTRL.SB14.SB_META.address),
						     $bits(FM_CTRL.SB15.SB_META.address),
						     $bits(FM_CTRL.SB16.SB_META.address),
						     $bits(FM_CTRL.SB17.SB_META.address),
						     $bits(FM_CTRL.SB18.SB_META.address),
						     $bits(FM_CTRL.SB19.SB_META.address),
						     $bits(FM_CTRL.SB20.SB_META.address),
						     $bits(FM_CTRL.SB21.SB_META.address),
						     $bits(FM_CTRL.SB22.SB_META.address),
						     $bits(FM_CTRL.SB23.SB_META.address),
						     $bits(FM_CTRL.SB24.SB_META.address),
						     $bits(FM_CTRL.SB25.SB_META.address),
						     $bits(FM_CTRL.SB26.SB_META.address)
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
