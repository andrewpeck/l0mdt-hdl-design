`include "l0mdt_buses_constants.svh"
import l0mdt_dataformats_svh::*;
module hls_ptcalc_top (
		       ap_clk,
		       ap_rst,
		       ap_start,
		       ap_done,
		       ap_idle,
		       ap_ready,
		       pl2ptcalc,
		       sf2ptcalc_inn,
		       sf2ptcalc_mid,
		       sf2ptcalc_out,
		       ptcalc2mtc,
		       ptcalc2mtc_ap_vld,
		       ptcalc_debug,
		       is_C_side
		       );


   input   ap_clk;
   input   ap_rst;
   input   ap_start;
   output  ap_done;
   output  ap_idle;
   output  ap_ready;
   input [PL2PTCALC_LEN-1:0] pl2ptcalc;
   input [SF2PTCALC_LEN-1:0] sf2ptcalc_inn;
   input [SF2PTCALC_LEN-1:0] sf2ptcalc_mid;
   input [SF2PTCALC_LEN-1:0] sf2ptcalc_out;
   output [PTCALC2MTC_LEN-1:0] ptcalc2mtc;
   output 	 ptcalc2mtc_ap_vld;
   input 	 is_C_side;
   output [57:0] ptcalc_debug;



   ptcalc_top ptcalc_top_inst(
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .pl2ptcalc(pl2ptcalc),
        .sf2ptcalc_inn(sf2ptcalc_inn),
        .sf2ptcalc_mid(sf2ptcalc_mid),
        .sf2ptcalc_out(sf2ptcalc_out),
        .ptcalc2mtc(ptcalc2mtc),
        .ptcalc2mtc_ap_vld(ptcalc2mtc_ap_vld),
        .is_C_side(is_C_side)
);


   endmodule
