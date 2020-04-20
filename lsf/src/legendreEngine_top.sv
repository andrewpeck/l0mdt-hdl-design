`timescale 1ns/1ps

`ifndef L0MDT_BUS_CONSTANTS
`define L0MDT_BUS_CONSTANTS
`include "l0mdt_buses_constants.svh"
`endif

`default_nettype wire
module legendreEngine_top(
			  input 			       clk,
			  input 			       rst,
			  input 			       srst,
			  input logic [HPS_LSF_LEN-1:0]        mdt_hit_top,
			  output logic 			       mdt_hit_top_re,
			  input logic 			       mdt_hit_top_empty,
			  input logic [SLCPROC_HPS_SF_LEN-1:0] hit_extraction_roi_top,
			  output logic 			       hit_extraction_roi_re,
			  input logic 			       hit_extraction_roi_empty,
			  input logic [9:0] 		       histogram_accumulation_count,
//			  output logic 	      mdt_hit_ap_ready,
//			  output logic 	      roi_ap_ready, 
			  output logic [SF_LEN-1:0] 		       le_output_top,
			  output logic 			       le_output_vld
			 /* 
			  output logic [191:0] le_tb_output,
			  output logic 	       le_tb_output_vld
			  */
			  );

   parameter W_zd = SLCPROC_HPS_SF_VEC_POS_LEN; //HPS_LSF_MDT_LOCALX_LEN; //19;
   parameter W_Rd = SLCPROC_HPS_SF_VEC_POS_LEN; //HPS_LSF_MDT_LOCALY_LEN; //18; //19;

   parameter W_rd = HPS_LSF_MDT_RADIUS_LEN; // 9;
 

   parameter W_IN = 22;
   parameter W_r  = 13;
   parameter char_width = 8;

   parameter gtheta = SF_SEGANGLE_LEN; //15;
   

 


   logic [191:0] 			       mdt_hit;
   logic [391:0] 			       hit_extraction_roi;
   logic [383:0] 			       le_output;
   logic [191:0] 			       le_tb_output;
   logic 				       le_tb_output_vld;


   assign mdt_hit[63:0]    = mdt_hit_top[W_zd-1:0];
   assign mdt_hit[127:64]  = mdt_hit_top[W_Rd+W_zd-1 :W_zd];
   assign mdt_hit[191:128] = mdt_hit_top[W_rd+W_Rd+W_zd-1 :W_Rd+W_zd];


   
   assign hit_extraction_roi[63:0]    = hit_extraction_roi_top[W_IN-1:0];
   assign hit_extraction_roi[127:64]  = hit_extraction_roi_top[W_zd+W_IN-1:W_IN];
   assign hit_extraction_roi[191:128] = hit_extraction_roi_top[W_Rd+W_zd+W_IN-1:W_zd+W_IN];
   assign hit_extraction_roi[255:192] = hit_extraction_roi_top[W_r+W_Rd+W_zd+W_IN-1 : W_Rd+W_zd+W_IN];
   assign hit_extraction_roi[319:256] = hit_extraction_roi_top[W_Rd+W_r+W_Rd+W_zd+W_IN-1:W_r+W_Rd+W_zd+W_IN];
   assign hit_extraction_roi[383:320] = hit_extraction_roi_top[W_zd+W_Rd+W_r+W_Rd+W_zd+W_IN-1:W_Rd+W_r+W_Rd+W_zd+W_IN];
   assign hit_extraction_roi[391:384] = hit_extraction_roi_top[char_width+W_zd+W_Rd+W_r+W_Rd+W_zd+W_IN-1:W_zd+W_Rd+W_r+W_Rd+W_zd+W_IN];
   

   assign le_output_top[W_zd-1:0]              = le_output[W_zd-1:0];
   assign le_output_top[W_Rd+W_zd-1:W_zd]      = le_output[W_Rd+64-1 :64];
   assign le_output_top[W_r+W_Rd+W_zd-1:W_Rd+W_zd]      = le_output[W_r+128-1 :128];
   assign le_output_top[W_r+W_Rd+W_zd+gtheta-1:W_r+W_Rd+W_zd] = le_output[gtheta+192-1:192];
   assign le_output_top[W_r+W_Rd+W_zd+gtheta*2-1:W_r+W_Rd+W_zd+gtheta] = le_output[gtheta+256-1:256];
   assign le_output_top[W_r+W_Rd+W_zd+gtheta*2 + W_r -1:W_r+W_Rd+W_zd+gtheta*2] = le_output[W_r+320-1:320];
    
   
   logic 				       clk_hs;
   
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
   legendreEngine legendreEngine_inst(
		       		      .clk(clk_hs),
		       		      .rst(rst),
		       		      .srst(srst),
				      .mdt_hit(mdt_hit),
		        	      .mdt_hit_re(mdt_hit_top_re),
				      .mdt_hit_empty(mdt_hit_top_empty),
				      .hit_extraction_roi(hit_extraction_roi),
		        	      .hit_extraction_roi_re(hit_extraction_roi_re),
				      .hit_extraction_roi_empty(hit_extraction_roi_empty),
				      .histogram_accumulation_count(histogram_accumulation_count),
		        	    //  .mdt_hit_ap_ready(mdt_hit_ap_ready),
		        	    //  .roi_ap_ready(roi_ap_ready), 
				      .le_output(le_output),
		        	      .le_output_vld(le_output_vld),
				      .le_tb_output(le_tb_output),
		        	      .le_tb_output_vld(le_tb_output_vld)
		      );
   
			   
endmodule // legendreEngine_top
