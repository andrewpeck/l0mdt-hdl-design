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



`include "l0mdt_buses_constants.svh"

module mtc_builder_verilog#(
			    parameter PTCALC_WIDTH=PTCALC2MTC_LEN,
			    parameter SLCPIPELINE_WIDTH=PL2MTC_LEN ,
			    parameter c_NUM_THREADS=3,
			    parameter c_MAX_NUM_SL = 3,
	 		    parameter n_PRIMARY_MTC = 3
			    )
   (
    input logic 			clock,
    input logic 			rst,
    input logic 			srst,
    input logic [PTCALC_WIDTH-1:0] 	ptcalc[c_NUM_THREADS],
    input logic [SLCPIPELINE_WIDTH-1:0] slcpipeline[c_MAX_NUM_SL],
    output logic [MTC2SL_LEN-1:0] 	mtc[n_PRIMARY_MTC]    
    );
   localparam MTC_PKT_WIDTH = MTC2SL_LEN-1;
   logic [PL2MTC_PROCESS_CH_LEN-1:0]   ptcalc_sel[c_MAX_NUM_SL];
   logic [MTC_PKT_WIDTH-1:0] 	       mtc_inter[c_MAX_NUM_SL];//c_NUM_THREADS];
   logic 			       slcpipeline_vld[c_MAX_NUM_SL];
   logic [c_MAX_NUM_SL-1:0] 	       mtc_inter_valid;
   logic [PTCALC_WIDTH-1:0] 	       ptcalc_internal[c_MAX_NUM_SL];
   logic [MTC2SL_LEN-1:0]      	       mtc_not_mapped[c_MAX_NUM_SL] ;
   
   logic [$bits(c_MAX_NUM_SL)-1:0]     j;
   genvar 			       p;
   genvar 			       i;

   generate
      for(i=0; i<c_MAX_NUM_SL; i=i+1)
	begin:format_mtc_packet
	   assign ptcalc_sel[i] = (slcpipeline[i][PL2MTC_PROCESS_CH_MSB:PL2MTC_PROCESS_CH_LSB] > c_NUM_THREADS - 1)? c_NUM_THREADS : slcpipeline[i][PL2MTC_PROCESS_CH_MSB:PL2MTC_PROCESS_CH_LSB]  ;
	   assign ptcalc_internal[i] = (ptcalc_sel[i] == c_NUM_THREADS)? 0 : ptcalc[ptcalc_sel[i]];
	   
	   
	   format_mtc_pkt #(
			    .PTCALC_WIDTH(PTCALC_WIDTH),
			    .SLCPIPELINE_WIDTH(SLCPIPELINE_WIDTH),
			    .MTC_PKT_WIDTH(MTC_PKT_WIDTH)
			    )
	   format_mtc_pkt_inst (
				.clock(clock),
				.rst(rst | srst),
				.slcpipeline(slcpipeline[i]),
				.ptcalc(ptcalc_internal[i]),
				.mtc(mtc_inter[i]),
				.mtc_valid(mtc_inter_valid[i])
				);
	end
   endgenerate
   
   //Map to Primary SL
   generate
      for(i=0; i<c_MAX_NUM_SL; i=i+1)
	begin:link_mapping
	   if(i < n_PRIMARY_MTC)
	     begin
		mtc_link_map
		  #(
		    .LINK_SLID(0),
		    .LINK_SLCID(i+1),
		    .c_MAX_NUM_SL(c_MAX_NUM_SL)
		    )mtc_link_map_inst
		    (
		     .clock(clock),
		     .rst(rst),
		     .mtc_in(mtc_not_mapped),
		     .mtc2sl(mtc[i])
		     );
	     end // if (i < n_PRIMARY_MTC)
	   else
	     begin
		mtc_link_map
		  #(
		    .LINK_SLID(i-n_PRIMARY_MTC+1),
		    .LINK_SLCID(0),
		    .c_MAX_NUM_SL(c_MAX_NUM_SL)
		    )mtc_link_map_inst
		    (
		     .clock(clock),
		     .rst(rst),
		     .mtc_in(mtc_not_mapped),
		     .mtc2sl(mtc[i])
		     );
	     end // else: !if(i < n_PRIMARY_MTC)
	   
	end // for (i=0; i<c_MAX_NUM_SL; i=i+1)
   endgenerate
   

   
   always @(posedge clock)
     begin
	if(rst | srst )
	  begin
	     for( j=0; j < c_MAX_NUM_SL; j=j+1)
	       begin
		  mtc_not_mapped[j]       <= 0;		  
	       end
	  end
	else
	  begin
	     for(j=0; j < c_MAX_NUM_SL; j=j+1)
	       begin
		  if(mtc_inter_valid[j]==1)
		    begin		       
		       mtc_not_mapped[j]         <= {1'b1,mtc_inter[j]};
		    end
		  else
		    begin		       
		       mtc_not_mapped[j]       <= 0;
		    end // else: !if(slcpipeline_vld[i]==1)
	       end // for (int i=0; i < c_MAX_NUM_SL; i++)

	  end // else: !if(rst | srst )

     end // always @ (posedge clock)





  endmodule





