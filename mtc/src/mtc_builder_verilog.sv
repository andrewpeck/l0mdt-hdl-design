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
`default_nettype wire

  
module mtc_builder_verilog#(
			    parameter PTCALC_WIDTH=PTCALC2MTC_LEN,
			    parameter SLCPIPELINE_WIDTH=PL2MTC_LEN ,
			    parameter TOTAL_PTCALC_BLKS=3,
			    parameter MTC_PER_BCID = 3,
	 		    parameter n_PRIMARY_MTC = 1
		    )
   (
    input logic 		       clock,
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




   always @(posedge clock)
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

     end // always @ (posedge clock)





  endmodule





module format_mtc_pkt #(
			 parameter PTCALC_WIDTH=PTCALC2MTC_LEN,
			 parameter SLCPIPELINE_WIDTH=PL2MTC_LEN ,
			 parameter MTC_PKT_WIDTH=128
			 )
			 (
			  input logic [SLCPIPELINE_WIDTH-1:0] slcpipeline,
			  input logic [PTCALC_WIDTH-1:0] 	    ptcalc,
			  output logic [MTC_PKT_WIDTH-1:0] 	    mtc
		      );
   parameter MTC_msb            = MTC_PKT_WIDTH-1;
//   parameter MTC_RESERVED_lsb   = MTC_SLC_COMMON_LSB + SLC_COMMON_LEN;


   always_comb
     begin

	mtc[MTC2SL_M_RESERVED_MSB:MTC2SL_M_RESERVED_LSB] = 0; //RESERVED

	mtc[MTC2SL_COMMON_LSB +  SLC_COMMON_LEN - 1: MTC2SL_COMMON_LSB] = slcpipeline[PL2MTC_COMMON_MSB : PL2MTC_COMMON_LSB];

	if(slcpipeline[PL2MTC_BUSY_LSB] == 0)
	  begin
	     mtc[MTC2SL_COMMON_LSB - 1 : MTC2SL_MDT_CHARGE_LSB]       = ptcalc[PTCALC2MTC_MDT_ETA_MSB : PTCALC2MTC_MDT_CHARGE_LSB];
	     mtc[ MTC2SL_MDT_NSEGMENTS_MSB : MTC2SL_MDT_QUALITY_LSB]  = ptcalc[PTCALC2MTC_MDT_NSEGMENTS_MSB : PTCALC2MTC_MDT_QUALITY_LSB];

	     if(ptcalc[PTCALC2MTC_MUID_LSB + SLC_MUID_SLID_LSB + SLC_MUID_SLID_LEN -1:PTCALC2MTC_MUID_LSB + SLC_MUID_SLID_LSB ] != 0) //FIND OUT BOARD ID MAPPING
	       mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] = 3;
	     //else if(ptcalc[PTCALC2MTC_MDT_PTTHRESH_MSB:PTCALC2MTC_MDT_PTTHRESH_LSB] != 0) //Pass
	       else if(ptcalc[PTCALC2MTC_MDT_PT_MSB:PTCALC2MTC_MDT_PT_LSB] != 0) //Pass
		 begin
		    if(ptcalc[PTCALC2MTC_MDT_PTTHRESH_MSB:PTCALC2MTC_MDT_PTTHRESH_LSB] >=  slcpipeline[PL2MTC_COMMON_LSB + SLC_COMMON_SL_PTTHRESH_LSB + SLC_COMMON_SL_PTTHRESH_LEN - 1 : PL2MTC_COMMON_LSB + SLC_COMMON_SL_PTTHRESH_LSB])
		      mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] = 1;
		    else
		      mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] = 2;
		 end
	       else
		 begin
		    if (slcpipeline[PL2MTC_COMMON_LSB + SLC_COMMON_COINTYPE_MSB : PL2MTC_COMMON_LSB + SLC_COMMON_COINTYPE_LSB] == 0)
		      begin
			 if(ptcalc[PTCALC2MTC_MDT_NSEGMENTS_MSB :PTCALC2MTC_MDT_NSEGMENTS_LSB ] == 0)
			   mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] = 4;
			 else if(ptcalc[PTCALC2MTC_MDT_NSEGMENTS_MSB :PTCALC2MTC_MDT_NSEGMENTS_LSB ] == 1)
			   mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] = 5;
		      end
		    else if(ptcalc[PTCALC2MTC_MDT_NSEGMENTS_MSB :PTCALC2MTC_MDT_NSEGMENTS_LSB] > 2) //HOW TO DETERMINE PT FAILED CONDITION
		      mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] = 6;
		    else
		      mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB] = 4'hf;
		 end // else: !if()
	  end // if (slcpipeline[PL2MTC_BUSY_LSB] != 0)
	else
	  begin
	     mtc[MTC2SL_COMMON_LSB - 1 : MTC2SL_MDT_CHARGE_LSB]         = 0;
	     mtc[MTC2SL_MDT_PROCFLAGS_LSB -1 : MTC2SL_MDT_QUALITY_LSB]  = 0;
	     mtc[MTC2SL_MDT_PROCFLAGS_MSB :MTC2SL_MDT_PROCFLAGS_LSB]    = 0;
	  end // else: !if(slcpipeline[PL2MTC_BUSY_LSB] != 0)

     end // always_comb

endmodule
