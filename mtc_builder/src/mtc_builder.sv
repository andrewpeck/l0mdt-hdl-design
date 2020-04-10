`include "l0mdt_buses_constants.svh"
module mtc_builder#(
		    parameter PTCALC_WIDTH=PTCALC_LEN,
		    parameter SLCPIPELINE_WIDTH=SLCPIPE_MTC_BARREL_LEN ,
		    parameter MTC_WIDTH=80,
		    parameter TOTAL_PTCALC_BLKS=3
		    )
   (
    input logic 		      clk,
    input logic 		      rst,
    input logic 		      srst,
    input logic [PTCALC_WIDTH:0]      ptcalc[TOTAL_PTCALC_BLKS],
    input logic [SLCPIPELINE_WIDTH:0] slcpipeline,
    input 			      b0_ec1, //Barrel=0, Encap=1
    output logic [MTC_WIDTH:0] 	      mtc
    );

   logic 		       ptcalc_fifo_re[TOTAL_PTCALC_BLKS];
   logic 		       ptcalc_fifo_r_not_done[TOTAL_PTCALC_BLKS];
   logic [PTCALC_WIDTH-1:0]    pt[TOTAL_PTCALC_BLKS];
   logic 		       ptcalc_fifo_full[TOTAL_PTCALC_BLKS];
   logic 		       ptcalc_fifo_empty[TOTAL_PTCALC_BLKS];
   logic [TOTAL_PTCALC_BLKS-1:0] wr_rst_busy;
   logic [TOTAL_PTCALC_BLKS-1:0] rd_rst_busy;
   logic 		       first_read[TOTAL_PTCALC_BLKS];
   logic [TOTAL_PTCALC_BLKS-1:0]   ptcalc_match;
   logic [TOTAL_PTCALC_BLKS-1:0]   ptcalc_wren;
   logic [MTC_WIDTH-1:0]           mtc_inter[TOTAL_PTCALC_BLKS];
   logic [TOTAL_PTCALC_BLKS-1:0]   ptcalc_match_index;
   
   // quality of the MDT TC (TBC how this is defined)


   parameter MTC_msb            = MTC_WIDTH-1;
   parameter MTC_RESERVED_lsb   = MTC_SLC_COMMON_LSB + SLC_COMMON_LEN;
   
  genvar p;
   generate
      for(p=0; p< TOTAL_PTCALC_BLKS;p++)
	begin:ptcalc_fifo
	   fifo_54 ptcalc_fifo (
			       .clk(clk),  
			       .srst(srst | rst),
			       .din(ptcalc[p][PTCALC_WIDTH-1:0]), 
			       .wr_en(ptcalc_wren[p]),   
			       .rd_en(ptcalc_fifo_re[p]),         
			       .dout(pt[p]),               
			       .full(ptcalc_fifo_full[p]), 
			       .almost_full(),  
			       .empty(ptcalc_fifo_empty[p]),  
			       .wr_rst_busy(wr_rst_busy[p]),  
			       .rd_rst_busy(rd_rst_busy[p]) 
			       );
	   assign ptcalc_match[p] = (slcpipeline[SLCPIPELINE_WIDTH]) & (slcpipeline[SLCPIPE_MTC_BARREL_SLC_MUID_MSB :SLCPIPE_MTC_BARREL_SLC_MUID_LSB ] == pt[p][PTCALC_SLC_MUID_MSB:PTCALC_SLC_MUID_LSB]);
	   assign ptcalc_wren[p] = (srst | rst |wr_rst_busy | rd_rst_busy)? 0 : ptcalc[p][PTCALC_WIDTH];
	 
       end
      
   endgenerate

 
   always_comb
     begin
	for(int i=0; i<TOTAL_PTCALC_BLKS; i++)
	  begin
	     mtc_inter[i][MTC_msb:MTC_RESERVED_lsb] = 0; //RESERVED
	     
	     mtc_inter[i][MTC_SLC_COMMON_LSB +  SLC_COMMON_LEN - 1: MTC_SLC_COMMON_LSB] <= slcpipeline[SLCPIPE_MTC_BARREL_SLC_COMMON_MSB : SLCPIPE_MTC_BARREL_SLC_COMMON_LSB];
	     
	     if(slcpipeline[SLCPIPE_MTC_BARREL_BUSY_LSB] == 0)
	       begin
		  mtc_inter[i][MTC_SLC_COMMON_LSB - 1 : MTC_CHARGE_LSB]   <= pt[i][PTCALC_ETA_MSB : PTCALC_CHARGE_LSB];
		  mtc_inter[i][MTC_PROCFLAGS_LSB -1 : MTC_QUALITY_LSB]  <= pt[i][PTCALC_NSEGMENTS_MSB -1 : PTCALC_QUALITY_LSB];
		  
		  if(pt[i][PTCALC_SLC_MUID_LSB + SLC_MUID_SLID_LSB + SLC_MUID_SLID_LEN -1:PTCALC_SLC_MUID_LSB + SLC_MUID_SLID_LSB ] != 0) //FIND OUT BOARD ID MAPPING
		    mtc_inter[i][MTC_PROCFLAGS_MSB :MTC_PROCFLAGS_LSB] <= 3;
		  //else if(pt[i][PTCALC_PTTHRESH_MSB:PTCALC_PTTHRESH_LSB] != 0) //Pass
		    else if(pt[i][PTCALC_PT_MSB:PTCALC_PT_LSB] != 0) //Pass
		    begin
		       if(pt[i][PTCALC_PTTHRESH_MSB:PTCALC_PTTHRESH_LSB] >=  slcpipeline[SLCPIPE_MTC_BARREL_SLC_COMMON_LSB + SLC_COMMON_PTTHRESH_LSB + SLC_COMMON_PTTHRESH_LEN - 1 : SLCPIPE_MTC_BARREL_SLC_COMMON_LSB + SLC_COMMON_PTTHRESH_LSB])
			 mtc_inter[i][MTC_PROCFLAGS_MSB :MTC_PROCFLAGS_LSB] <= 1;
		       else
			 mtc_inter[i][MTC_PROCFLAGS_MSB :MTC_PROCFLAGS_LSB] <= 2;
		    end
		    else
		      begin
			 if (slcpipeline[SLCPIPE_MTC_BARREL_COINTYPE_MSB : SLCPIPE_MTC_BARREL_COINTYPE_LSB] == 0) 
			   begin
			      if(pt[i][PTCALC_NSEGMENTS_MSB :PTCALC_NSEGMENTS_LSB ] == 0)
				mtc_inter[i][MTC_PROCFLAGS_MSB :MTC_PROCFLAGS_LSB] <= 4;
			      else if(pt[i][PTCALC_NSEGMENTS_MSB :PTCALC_NSEGMENTS_LSB ] == 1)
				mtc_inter[i][MTC_PROCFLAGS_MSB :MTC_PROCFLAGS_LSB] <= 5;
			   end	   
			 else if(pt[i][PTCALC_NSEGMENTS_MSB :PTCALC_NSEGMENTS_LSB] > 2) //HOW TO DETERMINE PT FAILED CONDITION
			 mtc_inter[i][MTC_PROCFLAGS_MSB :MTC_PROCFLAGS_LSB] <= 6;
			 else
			   mtc_inter[i][MTC_PROCFLAGS_MSB :MTC_PROCFLAGS_LSB] <= 4'hf;
		      end // else: !if()
	       end // if (slcpipeline[SLCPIPE_MTC_BARREL_BUSY_LSB] != 0)
	     else
	       begin
		  mtc_inter[i][MTC_SLC_COMMON_LSB - 1 : MTC_CHARGE_LSB]   <= 0;
		  mtc_inter[i][MTC_PROCFLAGS_LSB -1 : MTC_QUALITY_LSB]  <= 0;
		  mtc_inter[i][MTC_PROCFLAGS_MSB :MTC_PROCFLAGS_LSB] <= 0;
	       end // else: !if(slcpipeline[SLCPIPE_MTC_BARREL_BUSY_LSB] != 0)
	  end // for (int i=0; i<TOTAL_PTCALC_BLKS; i++)
     end // always_comb
   
   
   always @(posedge clk)
     begin
	if(rst | srst | wr_rst_busy | rd_rst_busy)
	  begin
	      for(int i=0; i< TOTAL_PTCALC_BLKS;i++)
		begin
		   ptcalc_fifo_re[i]         <= 0;
		   first_read[i]             <= 1;
		   ptcalc_fifo_r_not_done[i] <= 0;
		end
	     
	  end
	else
	  begin
	     for(int i=0; i< TOTAL_PTCALC_BLKS;i++)
	       begin
		  if(first_read[i])
		    begin
		       if(~ptcalc_fifo_empty[i])
			 begin
			    first_read[i]     <= 0;
			 end
		       else
			 begin
			    first_read[i]     <= 1;
			 end
		    end // if (first_read)
		  
		  if(ptcalc_match[i])
		    begin
		       ptcalc_fifo_re[i] <= 1;
		       if(~ptcalc_fifo_empty[i])
			 ptcalc_fifo_r_not_done[i] <= 0;
		       else
			 ptcalc_fifo_r_not_done[i] <= 1;
		    end
		  else
		    begin
		       if(first_read[i] & ptcalc_fifo_empty[i] )
			 begin
			    ptcalc_fifo_re[i]         <= 1;
			    ptcalc_fifo_r_not_done[i] <= 0;
			 end
		       else if(ptcalc_fifo_r_not_done[i] == 1)
			 begin
			    ptcalc_fifo_r_not_done[i] <= 1;
			    ptcalc_fifo_re[i] <= 1;
			 end
		       else
			 begin
			    ptcalc_fifo_re[i] <= 0;
			    ptcalc_fifo_r_not_done[i] <= 0;
			 end
		    end
		    
	       end // for (i=0; i< TOTAL_PTCALC_BLKS;i++)
	  end // else: !if(rst | srst | wr_rst_busy | rd_rst_busy)
     end // always @ (posedge clk)
   

   always @(posedge clk)
     begin
	if(rst | srst | wr_rst_busy | rd_rst_busy)
	  begin
	     mtc <= 0;
	     
	  end
	else
	  begin
	     if(slcpipeline[SLCPIPELINE_WIDTH]==1)
	       begin
		  mtc[MTC_WIDTH] <= 1;
		  case(ptcalc_match)
		    3'b000: //TP busy, use any one of mtc_inter
		      begin
			 mtc[MTC_WIDTH-1:0] <= mtc_inter[0];
		      end
		    3'b001:
		      begin
			 mtc[MTC_WIDTH-1:0] <= mtc_inter[0];
		      end
		    3'b010:
		      begin
			 mtc[MTC_WIDTH-1:0] <= mtc_inter[1];
		      end
		    3'b100:
		      begin
			 mtc[MTC_WIDTH-1:0] <= mtc_inter[2];
		      end
		    
		  endcase // case (ptcalc_match)
		  
		
		  assert( ~(((~(^ptcalc_match == 1) && slcpipeline[SLCPIPE_MTC_BARREL_BUSY_LSB]==0)) || (ptcalc_match == 0 && slcpipeline[SLCPIPE_MTC_BARREL_BUSY_LSB]==0) ))
		    else
		      begin
			 $error($time, " More than one pt results for Track Candidate, OR conflicting MTC_BUSY val! ptcalc_match = 0x%h, slcpipeline=0x%h, slcpipeline[%d]=0x%h", ptcalc_match, slcpipeline,SLCPIPE_MTC_BARREL_BUSY_LSB,slcpipeline[SLCPIPE_MTC_BARREL_BUSY_LSB]);
		      end
	       end
	     else
	       begin
		  mtc[MTC_WIDTH] <= 0;
		  mtc            <= 0;
	       end
	  end // else: !if(rst | srst | wr_rst_busy | rd_rst_busy)
	
     end // always @ (posedge clk)
   
	    
	 
  endmodule
