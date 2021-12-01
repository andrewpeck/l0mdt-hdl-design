`ifndef L0MDT_BUS_CONSTANTS
`define L0MDT_BUS_CONSTANTS
`include "l0mdt_buses_constants.svh"
import l0mdt_dataformats_svh::*;
`endif
module mtc_bd_wrapper #(
			parameter PTCALC_WIDTH=PTCALC2MTC_LEN,
			parameter SLCPIPELINE_WIDTH=PL2MTC_LEN ,
			parameter MTC2SL_LEN = MTC2SL_LEN,
			parameter c_NUM_THREADS=3,
			parameter c_MAX_NUM_SL = 3,
	 		parameter n_PRIMARY_MTC = 3
			
			)
   (
    input 					clock,
    input 					rst,
    input 					srst,
    input [PTCALC_WIDTH*c_NUM_THREADS-1:0] 	ptcalc, 
    input [SLCPIPELINE_WIDTH*n_PRIMARY_MTC-1:0] sl, 
    output [MTC2SL_LEN*n_PRIMARY_MTC-1:0] 	mtc
    );


   wire [PTCALC_WIDTH-1:0] 	ptcalc_i[c_NUM_THREADS];
   wire [SLCPIPELINE_WIDTH-1:0] sl_i[n_PRIMARY_MTC];
   wire [MTC2SL_LEN-1:0] 	mtc_i[n_PRIMARY_MTC];

   genvar i;
   
generate
   for ( i=0;i<c_NUM_THREADS; i=i+1)
     begin
	assign ptcalc_i[i] = ptcalc[i*c_NUM_THREADS+:PTCALC_WIDTH];	   
     end
   for ( i=0;i<n_PRIMARY_MTC; i=i+1)
     begin
	assign sl_i[i] = sl[i*SLCPIPELINE_WIDTH+:SLCPIPELINE_WIDTH];
	assign mtc[i*MTC2SL_LEN +:MTC2SL_LEN] = mtc_i[i];
	
     end
endgenerate
   
   
 mtc_builder_verilog #(
	      .PTCALC_WIDTH(PTCALC_WIDTH),
	      .SLCPIPELINE_WIDTH(SLCPIPELINE_WIDTH),
	      .c_NUM_THREADS(c_NUM_THREADS),
	      .c_MAX_NUM_SL (c_MAX_NUM_SL),
	      .n_PRIMARY_MTC(n_PRIMARY_MTC)
	      )
   mtc_builder_verilog_inst(
		 .clock(clock),
		 .rst(rst),
		 .srst(srst),
		 .ptcalc(ptcalc_i),
		 .slcpipeline(sl_i),
		 .mtc(mtc_i)
			  );
endmodule
