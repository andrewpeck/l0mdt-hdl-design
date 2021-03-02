`timescale 1ns/1ps
`include "../src/l0mdt_buses_constants.svh"
module mtc_tb();
   parameter PTCALC_WIDTH=PTCALC_LEN; 
   parameter SLCPIPELINE_WIDTH=SLCPIPE_MTC_BARREL_LEN ;
   parameter MTC_WIDTH=80;
   parameter TOTAL_PTCALC_BLKS=3;

   parameter MTC_CANDIDATES=70;
   parameter MTC_PTCALC_CANDIDATES=51;
   parameter PTCALC_TV_DEPTH=MTC_PTCALC_CANDIDATES*2;
   parameter MTC_CANDIDATES_NOT_PROCESSED = MTC_CANDIDATES-MTC_PTCALC_CANDIDATES;
   
   
   logic clk;
   logic rst;
   logic srst;
   logic [PTCALC_WIDTH:0] ptcalc[TOTAL_PTCALC_BLKS];
   logic [SLCPIPELINE_WIDTH:0] slcpipeline;
   logic 		       b0_ec1; //Barrel=0, Encap=1
   logic [MTC_WIDTH:0] 	       mtc;
   logic 		       start_test;
   
   logic [SLCPIPELINE_WIDTH:0] slcpipeline_tv[MTC_PTCALC_CANDIDATES];
   logic [SLCPIPELINE_WIDTH:0] slcpipeline_tv_with_busy[MTC_CANDIDATES];
   logic [PTCALC_WIDTH:0]      ptcalc_tv[TOTAL_PTCALC_BLKS][PTCALC_TV_DEPTH];
   logic [MTC_WIDTH:0] 	       mtc_exp[MTC_PTCALC_CANDIDATES];
   logic [MTC_WIDTH:0] 	       mtc_exp_with_busy[MTC_CANDIDATES];
   
   int 			       index;
   logic [SLCPIPELINE_WIDTH:0] slcpipeline_delay[10];
   int 			       mtc_index;
   int 			       j=0;
   int 			       slc_muid[MTC_PTCALC_CANDIDATES];
   
   int 			       slc_pipeline_tv_index;
   int 			       busy_cnt;
   
   /*
   mtc_builder  #(
		  .PTCALC_WIDTH(PTCALC_WIDTH),
		  .SLCPIPELINE_WIDTH(SLCPIPELINE_WIDTH),
		  .MTC_WIDTH( MTC_WIDTH),
		  .TOTAL_PTCALC_BLKS(TOTAL_PTCALC_BLKS)
		  )
   mtc_builder_inst
     (
      .clk(clk),
      .rst(rst),
      .srst(srst),
      .ptcalc(ptcalc),
      .slcpipeline(slcpipeline),
      .b0_ec1(b0_ec1), //Barrel=0, Encap=1
      .mtc(mtc)
      );
   */

   mtc_builder_wrapper    mtc_builder_wrapper_inst
     (
      .clk(clk),
      .rst(rst),
      .srst(srst),
      .ptcalc(ptcalc),
      .slcpipeline(slcpipeline),
      .b0_ec1(b0_ec1), //Barrel=0, Encap=1
      .mtc(mtc)
      );

   initial
     begin //360MHz
	clk   = 0;
	$display("Generate CLK\n");
	forever #1.4 clk = ~clk;
     end

   assign srst = rst;
   
     initial
       begin
	  start_test     = 0;

	  
	  $display("Reset System\n");
	  rst   = 1;
	  repeat(100) @(posedge clk);
	  rst   = 0;

	  for(int i=0; i< MTC_CANDIDATES; i++)
	    begin
	       slcpipeline_tv_with_busy[i] = 0;
	       mtc_exp_with_busy[i] = 0;
	       
	     end
	  for(int i=0; i< MTC_PTCALC_CANDIDATES; i++)
	    begin
	       slcpipeline_tv[i] = 0;
	       for(int j=0; j< PTCALC_TV_DEPTH; j++)
		 ptcalc_tv[i][j]   = 0;
	       
	    end
	  repeat(30) @(posedge clk);
	  start_test = 1;
	  $display("System Out of Reset\n");

	  for(int i=0; i< MTC_PTCALC_CANDIDATES/3; i++)
	    begin
	       for(int j=0; j< 3; j++)
		 begin
		    slc_muid[i*3+j] = $urandom_range(20'hfffff);
		    
		 //   ptcalc_tv[j][i][51:32] = 54 + j*3 + i + 1;
		    ptcalc_tv[j][i][PTCALC_SLC_MUID_MSB:PTCALC_SLC_MUID_LSB] = slc_muid[i*3+j];
		    ptcalc_tv[j][i][PTCALC_ETA_MSB:0] = 36'hbabebab0e + (i << 10);
		    ptcalc_tv[j][i][PTCALC_WIDTH] = 1;
		 end
	    end // for (int i=0; i< 4; i++)

	  j=0;
	  
	  for(int i=0; i< MTC_PTCALC_CANDIDATES+5; i++)
	    begin
	       j= (i>0 & i%3==0)? j+1 : j;
	    
	      // slcpipeline_tv[i][53:34] = 54 + (i%3)*3 + j + 1;
	       slcpipeline_tv[i][57:55] = 0;
	       slcpipeline_tv[i][SLCPIPE_MTC_BARREL_SLC_MUID_MSB:SLCPIPE_MTC_BARREL_SLC_MUID_LSB] = slc_muid[i];
	       slcpipeline_tv[i][SLCPIPE_MTC_BARREL_SLC_COMMON_MSB:SLCPIPE_MTC_BARREL_SLC_COMMON_LSB]  = $urandom_range(30'h3ffffff); //16'habcb;
	       slcpipeline_tv[i][SLCPIPE_MTC_BARREL_BUSY_LSB]     = 0;//busy
	       slcpipeline_tv[i][ SLCPIPE_MTC_BARREL_DESTSL_MSB: SLCPIPE_MTC_BARREL_DESTSL_LSB]   = $urandom_range(2);
	       
	       
	       slcpipeline_tv[i][SLCPIPELINE_WIDTH] = 1;
	   //    $display("TB i=%d, j=%d SLC_COMMONE=0x%x",i,j,slcpipeline_tv[i][33:3]);

	       mtc_exp[i][ MTC_NSEGMENTS_MSB:0]   = ptcalc_tv[i%3][j][PTCALC_NSEGMENTS_MSB :0];
	       mtc_exp[i][MTC_ETA_MSB:MTC_CHARGE_LSB]  = ptcalc_tv[i%3][j][PTCALC_ETA_MSB: PTCALC_CHARGE_LSB ];
	       mtc_exp[i][MTC_SLC_COMMON_MSB:MTC_SLC_COMMON_LSB] = slcpipeline_tv[i][SLCPIPE_MTC_BARREL_SLC_COMMON_MSB:SLCPIPE_MTC_BARREL_SLC_COMMON_LSB];
	       mtc_exp[i][MTC_WIDTH] = 1;
	       mtc_exp[i][MTC_WIDTH-1:MTC_SLC_COMMON_MSB+1] = 0; //Reserved
	       
	       //MDT Processing Flags 
	       if(slcpipeline_tv[i][SLCPIPE_MTC_BARREL_BUSY_LSB] == 1)
		 mtc_exp[i][MTC_PROCFLAGS_MSB:MTC_PROCFLAGS_LSB] = 0; //busy
	       else if(slcpipeline_tv[i][PTCALC_SLC_MUID_LSB + SLC_MUID_SLID_LSB + SLC_MUID_SLID_LEN -1:PTCALC_SLC_MUID_LSB + SLC_MUID_SLID_LSB ]!= 0)
		 mtc_exp[i][MTC_PROCFLAGS_MSB:MTC_PROCFLAGS_LSB] = 3; //NS
	       else if(ptcalc_tv[i%3][j][PTCALC_PT_MSB : PTCALC_PT_LSB] != 0) //pt calc passed
		 begin
		    if(ptcalc_tv[i%3][j][PTCALC_PTTHRESH_MSB:PTCALC_PTTHRESH_LSB] >= slcpipeline_tv[i][7:4])
		      mtc_exp[i][MTC_PROCFLAGS_MSB:MTC_PROCFLAGS_LSB] = 1;
		    else
		      mtc_exp[i][MTC_PROCFLAGS_MSB:MTC_PROCFLAGS_LSB] = 2;
		 end
	       else
		   begin
		      if(slcpipeline_tv[i][56:54] == 0 & ptcalc_tv[i%3][j][4:3] == 0 )
			mtc_exp[i][MTC_PROCFLAGS_MSB:MTC_PROCFLAGS_LSB] = 4;
		      else if(slcpipeline_tv[i][56:54] == 0 & ptcalc_tv[i%3][j][PTCALC_NSEGMENTS_MSB:PTCALC_NSEGMENTS_LSB] == 1 )
			mtc_exp[i][MTC_PROCFLAGS_MSB:MTC_PROCFLAGS_LSB] = 5;
		      else if(ptcalc_tv[i%3][j][PTCALC_NSEGMENTS_MSB:PTCALC_NSEGMENTS_LSB] > 2 )
			mtc_exp[i][MTC_PROCFLAGS_MSB:MTC_PROCFLAGS_LSB] = 6;
		      else
			mtc_exp[i][MTC_PROCFLAGS_MSB:MTC_PROCFLAGS_LSB] = 7'hf;
		   end // else: !if(ptcalc_tv[i%3][j][9:6] >= slcpipeline_tv[i][7:4])
	    end // for (int i=0; i< MTC_PTCALC_CANDIDATES+5; i++)
	  


	  slc_pipeline_tv_index = 0;
	  busy_cnt    = 0;
	  
	  for(int i=0 ; i < MTC_CANDIDATES; i++)
	    begin
	       if(busy_cnt < MTC_CANDIDATES_NOT_PROCESSED && i%3==1)
		 begin
		    slcpipeline_tv_with_busy[i][SLCPIPE_MTC_BARREL_SLC_MUID_MSB:SLCPIPE_MTC_BARREL_SLC_MUID_LSB] = $urandom_range(20'hfffff);
		    slcpipeline_tv_with_busy[i][SLCPIPE_MTC_BARREL_SLC_COMMON_MSB:SLCPIPE_MTC_BARREL_SLC_COMMON_LSB]  = $urandom_range(30'h3ffffff); //16'habcb;
		    slcpipeline_tv_with_busy[i][SLCPIPE_MTC_BARREL_BUSY_LSB]     = 1;//busy
		    slcpipeline_tv_with_busy[i][SLCPIPE_MTC_BARREL_DESTSL_MSB: SLCPIPE_MTC_BARREL_DESTSL_LSB]   = $urandom_range(2);
	       	    slcpipeline_tv_with_busy[i][SLCPIPELINE_WIDTH] = 1;

		    mtc_exp_with_busy[i][MTC_ETA_MSB:0]  = 0;
		    mtc_exp_with_busy[i][MTC_SLC_COMMON_MSB:MTC_SLC_COMMON_LSB] = slcpipeline_tv_with_busy[i][SLCPIPE_MTC_BARREL_SLC_COMMON_MSB:SLCPIPE_MTC_BARREL_SLC_COMMON_LSB];
		    mtc_exp_with_busy[i][MTC_WIDTH] = 1;
		    mtc_exp_with_busy[i][MTC_WIDTH-1:MTC_LEN] = 0; //Reserved
		    mtc_exp_with_busy[i][MTC_PROCFLAGS_MSB:MTC_PROCFLAGS_LSB] = 0; //TP Busy
		 end
	       else
		 begin
		    slcpipeline_tv_with_busy[i] <= slcpipeline_tv[slc_pipeline_tv_index];
		    mtc_exp_with_busy[i]     <= mtc_exp[slc_pipeline_tv_index];
		    slc_pipeline_tv_index++;
		 end
	    end

	  
       end // initial begin

   always @ (posedge clk)
     begin
	if(start_test == 0)
	  begin
	     index       <= 0;
	     slcpipeline <= 0;
	     for(int i=0;i<TOTAL_PTCALC_BLKS;i++)
	       ptcalc[i] <= 0;
	     for (int i=0;i<10;i++)
	       begin
		  slcpipeline_delay[i] <= 0;
	       end
	  end
	else
	  begin
	     slcpipeline_delay[0] <= slcpipeline_tv_with_busy[index];
	     slcpipeline          <= slcpipeline_delay[2];

	     for (int i=1;i<10;i++)
	       begin
		  slcpipeline_delay[i] <= slcpipeline_delay[i-1];
	       end
	     for(int i=0; i<TOTAL_PTCALC_BLKS; i++)
	       begin
		  ptcalc[i]   <= ptcalc_tv[i][index];
	       end
	     index       <= index + 1;
	   
  
	  end
     end // always @ (posedge clk)



    always @ (posedge clk)
      begin
	 if(rst)
	   begin
	      mtc_index <= 0;
	      
	   end
	 else
	   begin
//	      $display("MTC=0x%x",mtc);
	     
	      if(mtc[MTC_WIDTH])
		begin
		   mtc_index <= mtc_index+1;
		   if(mtc != mtc_exp_with_busy[mtc_index])
		     begin
			$display("%d: Mismatch : Expected = 0x%x, Actual = 0x%x\n",mtc_index, mtc_exp_with_busy[mtc_index], mtc);
			$finish();
		     end
		   else
		     begin
			$display("%d: Matched : Expected = 0x%x, Actual = 0x%x\n",mtc_index, mtc_exp_with_busy[mtc_index], mtc);
		     end
		  
		   
		 
		end // if (mtc[MTC_WIDTH])
	     
	      if(mtc_index == MTC_CANDIDATES-1)
		begin
		   $display("PASS: Processed %d Muon Track Candidates",mtc_index);
		   $finish();
		end
	      
	   end // else: !if(rst)
	 
      end // always @ (posedge clk)
   
   
endmodule // mtc_tb
