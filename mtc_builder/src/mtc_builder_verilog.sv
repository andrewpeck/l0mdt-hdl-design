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



//`include "l0mdt_buses_constants.svh"
`default_nettype wire
module mtc_builder_verilog#(
			    parameter PTCALC_WIDTH=PTCALC2MTC_LEN,
			    parameter SLCPIPELINE_WIDTH=PL2MTC_LEN ,
			    parameter TOTAL_PTCALC_BLKS=3,
			    parameter MTC_PER_BCID = 3,
	 		    parameter n_PRIMARY_MTC = 3
		    )
   (
    input logic 		       clk,
    input logic 		       rst,
    input logic 		       srst,
    input wire [PTCALC_WIDTH-1:0]        ptcalc[TOTAL_PTCALC_BLKS],
    input wire [SLCPIPELINE_WIDTH-1:0] slcpipeline[MTC_PER_BCID],
    output logic [MTC2SL_LEN-1:0]      mtc[n_PRIMARY_MTC]
//    output logic 			mtc_valid[MTC_PER_BCID]
    );
   parameter MTC_PKT_WIDTH = MTC2SL_LEN-1;
   logic [PL2MTC_PROCESS_CH_LEN-1:0]   ptcalc_sel[MTC_PER_BCID];
   logic [MTC_PKT_WIDTH-1:0] 	       mtc_inter[TOTAL_PTCALC_BLKS];
   logic [MTC2SL_LEN-2:0] 	       mtc_pkt[n_PRIMARY_MTC];
   
   logic 			       mtc_valid[n_PRIMARY_MTC];
   logic 			       slcpipeline_vld[MTC_PER_BCID];
   
   genvar 			       p;
 
  


   generate
      for(p=0; p < MTC_PER_BCID;p++)
	begin:format_packet
	   format_mtc_pkt #(
			    .PTCALC_WIDTH(PTCALC_WIDTH),
			    .SLCPIPELINE_WIDTH(SLCPIPELINE_WIDTH),
			    .MTC_PKT_WIDTH(MTC_PKT_WIDTH)
			    )
	   format_mtc_pkt_inst (
				.slcpipeline(slcpipeline[p]),
				.ptcalc(ptcalc[ptcalc_sel[p]][PTCALC_WIDTH-1:0]),
				.mtc(mtc_inter[p])
			  );

	   //For COCOTB TB
	   assign mtc_pkt[p]         = mtc[p][MTC2SL_LEN-2:0];
	   assign slcpipeline_vld[p] = slcpipeline[p][PL2MTC_DATA_VALID_MSB];
	   assign ptcalc_sel[p]      = slcpipeline[p][PL2MTC_PROCESS_CH_MSB:PL2MTC_PROCESS_CH_LSB];
	   
	end
   endgenerate




   always @(posedge clk)
     begin
	if(rst | srst )
	  begin
	     for(int i=0; i < MTC_PER_BCID; i++)
	       begin
		  mtc[i]       <= 0;
		  mtc_valid[i] <= 0;
	       end
	  end
	else
	  begin
	     for(int i=0; i < MTC_PER_BCID; i++)
	       begin
		  if(slcpipeline_vld[i]==1)
		    begin
		       mtc_valid[i]   <= 1;
		       mtc[i]         <= {1'b1,mtc_inter[i]};
		    end
		  else
		    begin
		       mtc_valid[i] <= 0;
		       mtc[i]       <= 0;
		    end // else: !if(slcpipeline_vld[i]==1)
	       end // for (int i=0; i < MTC_PER_BCID; i++)

	  end // else: !if(rst | srst )

     end // always @ (posedge clk)





  endmodule
