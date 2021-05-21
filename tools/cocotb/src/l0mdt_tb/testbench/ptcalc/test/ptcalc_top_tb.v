module hls_ptcalc_top (
					  ap_clk,
					  ap_rst,
					  ap_start,
					  ap_done,
					  ap_idle,
					  ap_ready,
					  pl2ptcalc_V,
					  sf2ptcalc_inn_V,
					  sf2ptcalc_mid_V,
					  sf2ptcalc_out_V,
					  ptcalc2mtc_V,
					  ptcalc2mtc_V_ap_vld,
					  is_C_side
					  );


   input   ap_clk;
   input   ap_rst;
   input   ap_start;
   output  ap_done;
   output  ap_idle;
   output  ap_ready;
   input [57:0] pl2ptcalc_V;
   input [63:0] sf2ptcalc_inn_V;
   input [63:0] sf2ptcalc_mid_V;
   input [63:0] sf2ptcalc_out_V;
   output [53:0] ptcalc2mtc_V;
   output 	 ptcalc2mtc_V_ap_vld;
   input 	 is_C_side;


   ptcalc_top ptcalc_top_inst(
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .pl2ptcalc_V(pl2ptcalc_V),
        .sf2ptcalc_inn_V(sf2ptcalc_inn_V),
        .sf2ptcalc_mid_V(sf2ptcalc_mid_V),
        .sf2ptcalc_out_V(sf2ptcalc_out_V),
        .ptcalc2mtc_V(ptcalc2mtc_V),
        .ptcalc2mtc_V_ap_vld(ptcalc2mtc_V_ap_vld),
        .is_C_side(is_C_side)
);


   endmodule
