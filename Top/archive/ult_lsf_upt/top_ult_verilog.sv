parameter SV_L0MDT_TTC_LEN = 5;
parameter SV_HPS_NUM_MDT_CH_INN = 6;
parameter SV_EN_MDT_HITS = 1;
parameter SV_EN_TAR_HITS = 1; 
parameter n_PRIMARY_CANDIDATES=3;

`include "l0mdt_buses_constants.svh"

  
module top_ult_verilog(
			  input logic 						clk,
			  input logic 						rst,
			  input logic 						bx,
			  
			  input logic [SV_L0MDT_TTC_LEN-1:0] 			ttc_commands,
	       //input logic 					       h2s_ctrl,
	       //output logic 					       h2s_mon,
			  input logic 						mtc_ctrl,
			  output logic [1:0] 					mtc_mon, 
			  input logic [SV_EN_MDT_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_inner_tdc_hits,
			  input logic [SV_EN_MDT_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_middle_tdc_hits,
			  input logic [SV_EN_MDT_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_outer_tdc_hits,
			  input logic [SV_EN_MDT_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_extra_tdc_hits,

			  input logic [SV_EN_TAR_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_inner_tar_hits,
			  input logic [SV_EN_TAR_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_middle_tar_hits,
			  input logic [SV_EN_TAR_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_outer_tar_hits,
			  input logic [SV_EN_TAR_HITS*SV_HPS_NUM_MDT_CH_INN -1:0] i_extra_tar_hits,

			  input logic [SLC_RX_LEN*n_PRIMARY_CANDIDATES-1:0] 	i_main_primary_slc,
			  input logic [SLC_RX_LEN*n_PRIMARY_CANDIDATES-1:0] 	i_main_secondary_slc ,
			  input logic [SLC_RX_LEN-1:0] 				i_plus_neighbor_slc,
			  input logic [SLC_RX_LEN-1:0] 				i_minus_neighbor_slc,
			  //output logic [MTC2SL_LEN*2-1:0] 			mtc_o,
			  output logic [193*2-1:0] 				mtc_o,		
			  output logic 						sump
	       );

   logic [SLC_RX_LEN-1:0] 							i_main_primary_slc_unpacked[n_PRIMARY_CANDIDATES];   
   logic [SLC_RX_LEN-1:0] 							i_main_secondary_slc_unpacked[n_PRIMARY_CANDIDATES];
   logic [MTC2SL_LEN-1:0] 							mtc_o_unpacked[2];
   

   assign {>>{i_main_primary_slc_unpacked}}   = i_main_primary_slc;
   assign {>>{i_main_secondary_slc_unpacked}} = i_main_secondary_slc;					 
   assign {>>{mtc_o}}                         = mtc_o_unpacked;

   
   top_ult top_ult_inst
     (
      .clk(clk),
      .rst(rst),
      .bx(bx),

      .mtc_ctrl(mtc_ctrl),
      .mtc_mon(mtc_mon),
      
      .ttc_commands(ttc_commands),
      .i_inner_tdc_hits(i_inner_tdc_hits),
      .i_middle_tdc_hits(i_middle_tdc_hits),
      .i_outer_tdc_hits(i_outer_tdc_hits),
      .i_extra_tdc_hits(i_extra_tdc_hits),

      .i_inner_tar_hits(i_inner_tar_hits),
      .i_middle_tar_hits(i_middle_tar_hits),
      .i_outer_tar_hits(i_outer_tar_hits),
      .i_extra_tar_hits(i_extra_tar_hits),

      .i_main_primary_slc(i_main_primary_slc_unpacked),
      .i_main_secondary_slc(i_main_secondary_slc_unpacked),
      .i_plus_neighbor_slc(i_plus_neighbor_slc),
      .i_minus_neighbor_slc(i_minus_neighbor_slc),

      .mtc_o(mtc_o_unpacked),
      .sump(sump)
      
      );
   

endmodule // top_ult
