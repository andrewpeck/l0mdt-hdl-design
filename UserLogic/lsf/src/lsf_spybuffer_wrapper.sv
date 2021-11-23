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
import l0mdt_dataformats_svh::*;


//`define RBINS_64
module lsf_spybuffer_wrapper (
    input wire 			    clock,
    input wire 			    reset,
    input wire [HEG2SFHIT_LEN-1:0]  mdt_hit,
    input wire 			    mdt_hit_we,
    input wire [HEG2SFSLC_LEN-1:0]  roi,
    input wire 			    roi_we,
 
    output reg [SF2PTCALC_LEN -1:0] lsf_output,
  
  
    input logic 		    i_eof,
    input logic [9:0] 		    histogram_accumulation_count


    );

   logic [HEG2SFSLC_LEN-1:0] 	    lsf_roi;
   logic 			    lsf_roi_re;
   logic 			    lsf_roi_empty;

   logic [HEG2SFHIT_LEN-1:0] 	    lsf_mdt_hit;
   logic 			    lsf_mdt_hit_re;
   logic 			    lsf_mdt_hit_empty;


   logic [SF2PTCALC_LEN -1:0] 	    lsf;
   logic 			    lsf_we;


   SpyBuffer #( //FIX THIS - REPLACE WITH FIFO
	       .DATA_WIDTH_A(HEG2SFSLC_LEN),
	       .DATA_WIDTH_B(HEG2SFSLC_LEN),
	       .PASSTHROUGH(0)
	       ) roi_buffer (
			     .rclock(clock),
			     .wclock(clock),
			     .rresetbar(~reset),
			     .wresetbar(~reset),
			     .write_data(roi),//ToUpdate
			     .write_enable(roi_we),//ToUpdate
			     .read_enable(lsf_roi_re),
			     .read_data(lsf_roi),
			     .almost_full(roi_af),
			     .empty(lsf_roi_empty), //ToUpdate
			     // The following should not be needed until one actually wants
			     // to use the spy-buffer functionality, whereas for now we just
			     // want to use the fifo functionality.
			     .spy_clock(clock),
			     .spy_clock_meta(clock),
			     .freeze(1'b0),
			     .playback(2'b0),
			     .spy_write_enable(0),
			     .spy_write_data(0),
			     .spy_en(1'b0),
//			     .spy_meta_read_enable(1'b0),
			     .spy_addr('b0),
//			     .spy_meta_read_addr(1'b0),
//			     .spy_write_addr(),
//			     .spy_meta_write_addr(),
			     .spy_data(),
			     .spy_meta_read_data()
			     );


    SpyBuffer #( //FIX THIS - REPLACE WITH FIFO
		.DATA_WIDTH_A(HEG2SFHIT_LEN),
		.DATA_WIDTH_B(HEG2SFHIT_LEN),
		.FC_FIFO_WIDTH(5),
		.PASSTHROUGH(0)
	       ) mdt_hit_buffer (
				 .rclock(clock),
				 .wclock(clock),
				 .rresetbar(~reset),
				 .wresetbar(~reset),
				 .write_data(mdt_hit),//ToUpdate
				 .write_enable(mdt_hit_we),//ToUpdate
				 .read_data(lsf_mdt_hit),
				 .read_enable(lsf_mdt_hit_re),
				 .almost_full(mdt_hit_af),
				 .empty(lsf_mdt_hit_empty),//ToUpdate
				 // The following should not be needed until one actually wants
				 // to use the spy-buffer functionality, whereas for now we just
				 // want to use the fifo functionality.
				 .spy_clock(clock),
				 .freeze(0), //sb_lsf_mdt_hits_freeze),
				 .playback(0),//sb_lsf_mdt_hits_playback),
				 .spy_write_enable(), //sb_lsf_mdt_hits_playback_we),
				 .spy_write_data(),//sb_lsf_mdt_hits_playback_wdata),
				 .spy_en(0),//sb_lsf_mdt_hits_re ),
				 .spy_addr(0),//sb_lsf_mdt_hits_raddr),
				 .spy_data(),//sb_lsf_mdt_hits_rdata),
				 .spy_meta_read_data()//sb_lsf_mdt_hits_meta_rdata)
				 );

`ifdef RBINS_64
   legendreEngine  legendreEngine_inst(
				       .clk(clock),
				       .rst(reset),
				       .srst(reset),
				       .mdt_hit(lsf_mdt_hit),
				       .mdt_hit_re(lsf_mdt_hit_re),
				       .mdt_hit_empty(lsf_mdt_hit_empty),
				       .hit_extraction_roi(lsf_roi),
				       .hit_extraction_roi_re(lsf_roi_re),
				       .hit_extraction_roi_empty(lsf_roi_empty),
				       .histogram_accumulation_count(histogram_accumulation_count),
				       .i_eof(i_eof),
				       .le_output(lsf_output),
				       .le_output_vld(lsf_we)
				      
			  );

`else // !`ifdef RBINS_64
   legendreEngine_2clk #(
			 .RBINS(128)
			 )legendreEngine_inst(
					      .clk(clock),
					      .rst(reset),
					      .srst(reset),
					      .mdt_hit(lsf_mdt_hit),
					      .mdt_hit_re(lsf_mdt_hit_re),
					      .mdt_hit_empty(lsf_mdt_hit_empty),
					      .hit_extraction_roi(lsf_roi),
					      .hit_extraction_roi_re(lsf_roi_re),
					      .hit_extraction_roi_empty(lsf_roi_empty),
					      .histogram_accumulation_count(histogram_accumulation_count),
					      .i_eof(i_eof),
					      .le_output(lsf_output),
					      .le_output_vld(lsf_we)
					     
					      );


`endif

 


  endmodule // lsf_spybuffer_wrapper
