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

`ifndef L0MDT_BUS_CONSTANTS
`define L0MDT_BUS_CONSTANTS
//`include "l0mdt_buses_constants.svh"
import l0mdt_dataformats_svh::*;
`endif

 
module format_mtc_pkt #(
			 parameter PTCALC_WIDTH=PTCALC2MTC_LEN,
			 parameter SLCPIPELINE_WIDTH=PL2MTC_LEN ,
			 parameter MTC_PKT_WIDTH=128
			 )
			 (
			  input logic 			      clock,
			  input logic 			      rst,
			  input logic [SLCPIPELINE_WIDTH-1:0] slcpipeline,
			  input logic [PTCALC_WIDTH-1:0]      ptcalc,
			  output logic [MTC_PKT_WIDTH-1:0]    mtc,
			  output logic 			      mtc_valid
			  );
   localparam MTC_msb            = MTC_PKT_WIDTH-1;
//   parameter MTC_RESERVED_lsb   = MTC_SLC_COMMON_LSB + SLC_COMMON_LEN;


   always @ (posedge clock)
     begin
     
	if(rst == 1)
	  begin
	     mtc          <= 0;
	     mtc_valid <= 0;	     
	  end
	else if (slcpipeline[PL2MTC_DATA_VALID_MSB])
	  begin
	     mtc_valid                                                                                       <= 1'b1;	     
	     mtc[MTC2SL_M_RESERVED_MSB:MTC2SL_M_RESERVED_LSB] <= 0; //RESERVED
	     
	     mtc[MTC2SL_COMMON_LSB +  SLC_COMMON_LEN - 1: MTC2SL_COMMON_LSB] <= slcpipeline[PL2MTC_COMMON_MSB : PL2MTC_COMMON_LSB];
	     
	     if(slcpipeline[PL2MTC_BUSY_LSB] == 1)
	       begin
		  mtc[MTC2SL_COMMON_LSB - 1 : MTC2SL_MDT_CHARGE_LSB]       <= ptcalc[PTCALC2MTC_MDT_ETA_MSB : PTCALC2MTC_MDT_CHARGE_LSB];
		  mtc[ MTC2SL_MDT_NSEGMENTS_MSB : MTC2SL_MDT_QUALITY_LSB]  <= ptcalc[PTCALC2MTC_MDT_NSEGMENTS_MSB : PTCALC2MTC_MDT_QUALITY_LSB];
		  
		  if(ptcalc[PTCALC2MTC_MUID_LSB + SLC_MUID_SLID_MSB : PTCALC2MTC_MUID_LSB + SLC_MUID_SLID_LSB ] != 0) //FIND OUT BOARD ID MAPPING
		    mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] <= 3;
		  //else if(ptcalc[PTCALC2MTC_MDT_PTTHRESH_MSB:PTCALC2MTC_MDT_PTTHRESH_LSB] != 0) //Pass
		    else if(ptcalc[PTCALC2MTC_MDT_PT_MSB:PTCALC2MTC_MDT_PT_LSB] != 0) //Pass
		      begin
			 if(ptcalc[PTCALC2MTC_MDT_PTTHRESH_MSB:PTCALC2MTC_MDT_PTTHRESH_LSB] >=  slcpipeline[PL2MTC_COMMON_LSB + SLC_COMMON_SL_PTTHRESH_LSB + SLC_COMMON_SL_PTTHRESH_LEN - 1 : PL2MTC_COMMON_LSB + SLC_COMMON_SL_PTTHRESH_LSB])
			   mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] <= 1;
			 else
			   mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] <= 2;
		      end
		    else
		      begin
			 if (slcpipeline[PL2MTC_COMMON_LSB + SLC_COMMON_COINTYPE_MSB : PL2MTC_COMMON_LSB + SLC_COMMON_COINTYPE_LSB] == 0)
		      begin
			 if(ptcalc[PTCALC2MTC_MDT_NSEGMENTS_MSB :PTCALC2MTC_MDT_NSEGMENTS_LSB ] == 0)
			   mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] <= 4;
			 else if(ptcalc[PTCALC2MTC_MDT_NSEGMENTS_MSB :PTCALC2MTC_MDT_NSEGMENTS_LSB ] == 1)
			   mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] <= 5;
		      end
			 else if(ptcalc[PTCALC2MTC_MDT_NSEGMENTS_MSB :PTCALC2MTC_MDT_NSEGMENTS_LSB] > 2) //HOW TO DETERMINE PT FAILED CONDITION
			   mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] <= 6;
			 else
			   mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] <= 4'hf;
		      end // else: !if()
	       end // if (slcpipeline[PL2MTC_BUSY_LSB] != 0)
	     else
	       begin
		  mtc[MTC2SL_COMMON_LSB - 1 : MTC2SL_MDT_CHARGE_LSB]         <= 0;
		  mtc[MTC2SL_MDT_PROCFLAGS_LSB -1 : MTC2SL_MDT_QUALITY_LSB]  <= 0;
		  mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB]    <= 0;
	       end // else: !if(slcpipeline[PL2MTC_BUSY_LSB] != 0)
	  end // if (slcpipeline[PL2MTC_DATA_VALID_MSB])
	else begin
	   mtc           <= 0;
	   mtc_valid <= 0;	   
	end // else: !if(slcpipeline[PL2MTC_DATA_VALID_MSB])
	
	
     end // always @ (posedge clock)
   

endmodule


module mtc_builder_verilog#(
			    parameter PTCALC_WIDTH=PTCALC2MTC_LEN,
			    parameter SLCPIPELINE_WIDTH=PL2MTC_LEN ,
			    parameter c_NUM_THREADS=3,
			    parameter c_MAX_NUM_SL = 3,
	 		    parameter n_PRIMARY_MTC = 3
		    )
   (
    input logic 		       clock,
    input logic 		       rst,
    input logic 		       srst,
    input wire [PTCALC_WIDTH-1:0]      ptcalc[c_NUM_THREADS],
    input wire [SLCPIPELINE_WIDTH-1:0] slcpipeline[c_MAX_NUM_SL],
    output logic [MTC2SL_LEN-1:0]      mtc[n_PRIMARY_MTC]    
    );
   localparam MTC_PKT_WIDTH = MTC2SL_LEN-1;
   logic [PL2MTC_PROCESS_CH_LEN-1:0]   ptcalc_sel[c_MAX_NUM_SL];
   logic [MTC_PKT_WIDTH-1:0] 	       mtc_inter[c_MAX_NUM_SL];//c_NUM_THREADS];
   
   

   logic [2:0] 			       mtc_valid;

   logic [PTCALC_WIDTH-1:0] 	       ptcalc_internal[c_MAX_NUM_SL];
   logic 			                               slcpipeline_vld[c_MAX_NUM_SL];
   genvar 			       p;
   

   
   genvar 			       i;
   
   generate
      for(i=0; i<c_MAX_NUM_SL; i=i+1)
	   begin
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
				.mtc_valid(mtc_valid[i])
		     );	      
	   end
   endgenerate
   
   
  
   




   always @(posedge clock)
     begin
	if(rst | srst )
	  begin
	     for(int i=0; i < n_PRIMARY_MTC; i++)
	       begin
		  mtc[i]       <= 0;		  
	       end
	  end
	else
	  begin
	     for(int i=0; i < n_PRIMARY_MTC; i++)
	       begin
		  if(mtc_valid[i]==1)
		    begin		       
		       mtc[i]         <= {1'b1,mtc_inter[i]};
		    end
		  else
		    begin		       
		       mtc[i]       <= 0;
		    end // else: !if(slcpipeline_vld[i]==1)
	       end // for (int i=0; i < c_MAX_NUM_SL; i++)

	  end // else: !if(rst | srst )

     end // always @ (posedge clock)





  endmodule





