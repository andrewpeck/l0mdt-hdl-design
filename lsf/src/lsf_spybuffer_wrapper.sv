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

module lsf_spybuffer_wrapper
  (
   // main TP clock, nominally 200 MHz
   input wire 			   clock,
   input wire 			   reset,
   input wire [HEG2SFHIT_LEN-1:0]  mdt_hit,
   input wire 			   mdt_hit_we,
   //output wire 			   mdt_hit_af,
   input wire [HEG2SFSLC_LEN-1:0]    roi,
   input wire 			   roi_we,
  // output wire 			   roi_af ,
   output reg [SF2PTCALC_LEN -1:0] lsf_output,
   //input 			   lsf_output_re,
  // output 			   lsf_output_empty,
   input logic [9:0] 		   histogram_accumulation_count
   );
   
   logic [HEG2SFSLC_LEN-1:0] 	       lsf_roi;
   logic 			       lsf_roi_re;
   logic 			       lsf_roi_empty;
   
   logic [HEG2SFHIT_LEN-1:0] 	       lsf_mdt_hit;
   logic 			       lsf_mdt_hit_re;
   logic 			       lsf_mdt_hit_empty;
   
   
   logic [SF2PTCALC_LEN -1:0] 	       lsf;
   logic 			       lsf_we;
   
   
   
   
   SpyBuffer #(
	       .DATA_WIDTH(HEG2SFSLC_LEN-1)
	       ) roi_buffer (
			     .rclock(clock),
			     .wclock(clock),
			     .rreset(~reset),
			     .wreset(~reset),
			     .write_data(roi),//ToUpdate
			     .write_enable(roi_we),//ToUpdate
			     .read_data(lsf_roi),
			     .read_enable(lsf_roi_re),
			     .almost_full(roi_af),
			     .empty(lsf_roi_empty), //ToUpdate
			     // The following should not be needed until one actually wants
			     // to use the spy-buffer functionality, whereas for now we just
			     // want to use the fifo functionality.
			     .freeze(1'b0),
			     .playback(2'b0),
			     .playback_write_enable(0),
			     .playback_write_data(0),
			     .spy_read_enable(1'b0),
			     .spy_meta_read_enable(1'b0),
			     .spy_read_addr(1'b0),
			     .spy_meta_read_addr(1'b0),
			     .spy_write_addr(),
			     .spy_meta_write_addr(),
			     .spy_data(),
			     .spy_meta_read_data()
			     );
   

    SpyBuffer #(
		.DATA_WIDTH(HEG2SFHIT_LEN-1),
		.FC_FIFO_WIDTH(4)
	       ) mdt_hit_buffer (
				 .rclock(clock),
				 .wclock(clock),
				 .rreset(~reset),
				 .wreset(~reset),
				 .write_data(mdt_hit),//ToUpdate
				 .write_enable(mdt_hit_we),//ToUpdate
				 .read_data(lsf_mdt_hit),
				 .read_enable(lsf_mdt_hit_re),
				 .almost_full(mdt_hit_af),
				 .empty(lsf_mdt_hit_empty),//ToUpdate
				 // The following should not be needed until one actually wants
				 // to use the spy-buffer functionality, whereas for now we just
				 // want to use the fifo functionality.
				 .freeze(1'b0),
				 .playback(2'b0),
				 .playback_write_enable(0),
				 .playback_write_data(0),
				 .spy_read_enable(1'b0),
				 .spy_meta_read_enable(1'b0),
				 .spy_read_addr(1'b0),
				 .spy_meta_read_addr(1'b0),
				 .spy_write_addr(),
				 .spy_meta_write_addr(),
				 .spy_data(),
				 .spy_meta_read_data()
				 );
   
   
   legendreEngine_top legendreEngine_top_inst(
					      .clk(clock),
					      .rst(reset),
					      .srst(reset),
					      .mdt_hit_top(lsf_mdt_hit),
					      .mdt_hit_top_re(lsf_mdt_hit_re),
					      .mdt_hit_top_empty(lsf_mdt_hit_empty),
					      .hit_extraction_roi_top(lsf_roi),
					      .hit_extraction_roi_re(lsf_roi_re),
					      .hit_extraction_roi_empty(lsf_roi_empty),
					      .histogram_accumulation_count(histogram_accumulation_count),
					      .le_output_top(lsf),
					      .le_output_vld(lsf_we)
					      /* 
					       .le_tb_output(),
					       .le_tb_output_vld()
					       */
			  );



   SpyBuffer #(
	       .DATA_WIDTH(SF2PTCALC_LEN-1),
	       .PASSTHROUGH(1)
	       ) lsf_output_buffer (
				    .rclock(clock),
				    .wclock(clock),
				    .rreset(~reset),
				    .wreset(~reset),
				    .write_data(lsf),//ToUpdate
				    .write_enable(lsf_we),//ToUpdate
				    .read_data(lsf_output),
				    .read_enable(), //lsf_output_re),
				    .almost_full(),
				    .empty(lsf_output_empty), //ToUpdate
				    // The following should not be needed until one actually wants
				    // to use the spy-buffer functionality, whereas for now we just
				    // want to use the fifo functionality.
				    .freeze(1'b0),
				    .playback(2'b0),
				    .playback_write_enable(0),
				    .playback_write_data(0),
				    .spy_read_enable(1'b0),
				    .spy_meta_read_enable(1'b0),
				    .spy_read_addr(1'b0),
				    .spy_meta_read_addr(1'b0),
				    .spy_write_addr(),
				    .spy_meta_write_addr(),
				    .spy_data(),
				    .spy_meta_read_data()
				    );


   
  endmodule // lsf_spybuffer_wrapper
