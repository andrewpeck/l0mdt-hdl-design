//`include "l0mdt_buses_constants.svh"



 /* -----\/----- EXCLUDED -----\/-----
parameter PTCALC2MTC_LEN_i = 54 ;
parameter PL2MTC_LEN_i = 113 ;
parameter MTC2SL_LEN_i = 193 ;
 -----/\----- EXCLUDED -----/\----- */

module mtc_bd_impl #(
		     parameter PTCALC_WIDTH=54,
		     parameter SLCPIPELINE_WIDTH=113,
		     parameter MTC2SL_LEN = 193,
		     parameter c_NUM_THREADS=3,
		     parameter c_MAX_NUM_SL = 3,
	 	     parameter n_PRIMARY_MTC = 3
		     )
   (
    input 			  clock,
    input 			  rst,
    input 			  srst,
    input [PTCALC_WIDTH-1:0] 	  ptcalc_0,
    input [PTCALC_WIDTH-1:0] 	  ptcalc_1,
    input [PTCALC_WIDTH-1:0] 	  ptcalc_2,
    input [SLCPIPELINE_WIDTH-1:0] sl0,
    input [SLCPIPELINE_WIDTH-1:0] sl1,
    input [SLCPIPELINE_WIDTH-1:0] sl2,
    output [MTC2SL_LEN-1:0] 	  mtc0,
    output [MTC2SL_LEN-1:0] 	  mtc1,
    output [MTC2SL_LEN-1:0] 	  mtc2
   
    );
   
   wire [MTC2SL_LEN*3-1:0] 	  mtc_o;


   assign {mtc2, mtc1, mtc0} = mtc_o;
   
   
   mtc_bd_wrapper #(
		    .PTCALC_WIDTH(PTCALC_WIDTH),
		    .SLCPIPELINE_WIDTH(SLCPIPELINE_WIDTH),
		    .c_NUM_THREADS(c_NUM_THREADS),
		    .c_MAX_NUM_SL (c_MAX_NUM_SL),
		    .n_PRIMARY_MTC(n_PRIMARY_MTC),
		    .MTC2SL_LEN(MTC2SL_LEN)
		    )
   mtc_bd_wrapper_inst(
		       .clock(clock),
		       .rst(rst),
		       .srst(srst),
		       .ptcalc({ptcalc_0, ptcalc_1,ptcalc_2}),
		       .sl({sl0,sl1,sl2}),
		       .mtc(mtc_o)
		       );
   
endmodule // mtc_impl
