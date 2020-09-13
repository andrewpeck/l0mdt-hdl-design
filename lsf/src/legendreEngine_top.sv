//--------------------------------------------------------------------------------
//--  Department of Physics and Astronomy, UCI
//--  Priya Sundararajan
//--  priya.sundararajan@cern.ch
//--------------------------------------------------------------------------------
//--  Project: ATLAS L0MDT Trigger 
//--  Description:
//--
//--------------------------------------------------------------------------------
//--  Revisions:
//--      
//--------------------------------------------------------------------------------

`timescale 1ns/1ps

`ifndef L0MDT_BUS_CONSTANTS
`define L0MDT_BUS_CONSTANTS
`include "l0mdt_buses_constants.svh"
`endif

`default_nettype wire
module legendreEngine_top(
			  input 			   clk,
			  input 			   rst,
			  input 			   srst,
			  input logic [HEG2SFHIT_LEN-1:0]  mdt_hit_top,
			  output logic 			   mdt_hit_top_re,
			  input logic 			   mdt_hit_top_empty,
			  input logic [HEG2SFSLC_LEN-1:0]  hit_extraction_roi_top,
			  output logic 			   hit_extraction_roi_re,
			  input logic 			   hit_extraction_roi_empty,
			  input logic [9:0] 		   histogram_accumulation_count,
//			  output logic 	      mdt_hit_ap_ready,
//			  output logic 	      roi_ap_ready, 
			  output logic [SF2PTCALC_LEN-1:0] le_output_top,
			  output logic 			   le_output_vld
			 /* 
			  output logic [191:0] le_tb_output,
			  output logic 	       le_tb_output_vld
			  */
			  );

/* -----\/----- EXCLUDED -----\/-----
   parameter W_zd = HEG2SFSLC_VEC_ANG_LEN; //HPS_LSF_MDT_LOCALX_LEN; //19;
   parameter W_Rd = HEG2SFSLC_VEC_POS_LEN; //HPS_LSF_MDT_LOCALY_LEN; //18; //19;

   parameter W_rd = HEG2SFHIT_RADIUS_LEN; // 9;
 

   parameter W_IN = 22;
   parameter W_r  = 13;
   parameter char_width = 8;

   parameter gtheta = SF2PTCALC_SEGANGLE_LEN; //15;
   logic [383:0] 					       le_output;
 -----/\----- EXCLUDED -----/\----- */
   

 


 
 
   logic [191:0] 					       le_tb_output;
   logic 						       le_tb_output_vld;


   logic 				       clk_hs;
   assign clk_hs = clk;
   
/* -----\/----- EXCLUDED -----\/-----
`ifdef SYNTHESIS
    pll_inst pll_inst_0
   (
    // Clock out ports
    .clk_out1(clk_hs),     // output clk_out1
    // Status and control signals
    .reset(rst), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk)); 
`else // !`ifdef SYNTH
   assign clk_hs = clk;
`endif
 -----/\----- EXCLUDED -----/\----- */
   legendreEngine legendreEngine_inst(
		       		      .clk(clk_hs),
		       		      .rst(rst),
		       		      .srst(srst),
				      .mdt_hit(mdt_hit_top),
		        	      .mdt_hit_re(mdt_hit_top_re),
				      .mdt_hit_empty(mdt_hit_top_empty),
				      .hit_extraction_roi(hit_extraction_roi_top),
		        	      .hit_extraction_roi_re(hit_extraction_roi_re),
				      .hit_extraction_roi_empty(hit_extraction_roi_empty),
				      .histogram_accumulation_count(histogram_accumulation_count),
		        	    //  .mdt_hit_ap_ready(mdt_hit_ap_ready),
		        	    //  .roi_ap_ready(roi_ap_ready), 
				      .le_output(le_output_top),
		        	      .le_output_vld(le_output_vld),
				      .le_tb_output(le_tb_output),
		        	      .le_tb_output_vld(le_tb_output_vld)
		      );
   
			   
endmodule // legendreEngine_top
