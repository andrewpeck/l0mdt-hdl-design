//Author : Priya Sundararajan (priya.sundararajan@uci.edu)
`include "fm_sb_pkg.sv"
`include "FM_PKG.svh"

import FM_CTRL::*;
import fm_sb_pkg::*;


module fm_data #(
		 parameter total_l0mdt_sb = 27
		 )(
	       input logic 		       clk_hs,
	       input logic 		       rst_hs,
	       input logic 		       spy_clock,
	       input logic 		       axi_reset_n,
	       input logic [sb_mapped_n-1:0]   freeze,
	       input logic 		       init_spy_mem,
	       input logic [sb_mapped_n-1:0]   sb_reset,
	       input logic [pb_mode_width-1:0] playback_mode[sb_mapped_n],
	       input 			       FM_CTRL_t fm_ctrl_in,
	       input 			       fm_rt ult_mon_data[total_l0mdt_sb] ,
	       output 			       FM_MON_t fm_mon_out,
	       output logic [mon_dw_max-1 : 0] fm_playback_data[total_l0mdt_sb]
	       );
   localparam axi_dw = axi_dw;
   genvar 	      sb_i;
   logic [sb_mapped_n-1 :0] axi_spy_rd_vld;
   logic [sb_mapped_n-1 :0] axi_spy_meta_rd_vld;
   logic [axi_dw-1:0] 	 axi_spy_data[sb_mapped_n];
   logic [axi_dw-1:0] 	 axi_spy_data_i[sb_mapped_n];
   logic [axi_dw-1:0] 	 axi_spy_meta_data[sb_mapped_n];
   logic [0:sb_mapped_n-1] axi_sb_enable;
   logic [0:sb_mapped_n-1] axi_sb_enable_internal;
   logic 		   axi_sm_enable[sb_mapped_n];
   logic [0:sb_mapped_n-1] axi_sb_wr_enable;
   logic 		   axi_sm_wr_enable[sb_mapped_n];
   logic [axi_dw-1:0] 	 axi_sb_wr_data[sb_mapped_n] ;
   logic [axi_dw-1:0] 	 axi_sm_wr_data[sb_mapped_n];
   logic [15:0] 	 axi_sb_addr[sb_mapped_n] ;
   logic [15:0] 	 axi_sm_addr[sb_mapped_n] ;
   
   logic [15:0] 	 axi_sb_init_addr[sb_mapped_n]  = '{default:0};
   logic [axi_dw-1:0] 	 axi_sb_init_wr_data[sb_mapped_n] = '{default:0} ;
   logic 		 init_spy_mem_internal;
   logic [sb_dw[sb_master_dummy_index] -1:0] 	 dummy_mon_data[sb_total_dummy];
   logic 			dummy_mon_vld[sb_total_dummy];
   logic [0:sb_mapped_n-1] 	sb_empty;
   
   fm_rt fm_passthrough_data[sb_mapped_n];
   fm_rt fm_mon_data[sb_mapped_n];

     generate
      for (sb_i = 0; sb_i < total_l0mdt_sb; sb_i = sb_i+1)
	begin
	   assign fm_playback_data[sb_i] = (~sb_empty[sb_i])? fm_passthrough_data[sb_i].fm_data : 'b0;
	end
     endgenerate
   
     generate
      for (sb_i = 0; sb_i < sb_mapped_n; sb_i = sb_i+1)
	begin
	   assign  fm_passthrough_data[sb_i].fm_vld = fm_passthrough_data[sb_i].fm_data[sb_tp_dw[sb_i]-1] & ~sb_empty[sb_i];
	   
	end
     endgenerate

   generate
      for (sb_i = 0; sb_i < sb_mapped_n; sb_i = sb_i+1)
	begin
	   if(sb_i < total_l0mdt_sb)
	     begin
		assign fm_mon_data[sb_i] = ult_mon_data[sb_i];
	     end
	   else
	     begin
		if(sb_i < total_l0mdt_sb + sb_total_dummy)
		  begin
		     assign fm_mon_data[sb_i] = '{fm_data:{dummy_mon_data[sb_i-total_l0mdt_sb]}, fm_vld:dummy_mon_vld[sb_i-total_l0mdt_sb]};
		  end
		else
		  begin
		     assign fm_mon_data[sb_i] = '{fm_data:0, fm_vld:0};
		  end

	     end
	end
   endgenerate


  generate
      for (sb_i = 0; sb_i < sb_mapped_n; sb_i = sb_i+1)
	begin
	   assign axi_spy_data[sb_i] =  (axi_spy_rd_vld[sb_i] == 1)? axi_spy_data_i[sb_i] : 0;	   
	end
     endgenerate



assign axi_sb_enable_internal                =  (init_spy_mem_internal == 1)? '1:axi_sb_enable;


//INSERT HERE




  
/* -----\/----- EXCLUDED -----\/-----
    assign  axi_sm_addr       = {
				fm_ctrl_in.SB0.SB_META.address,
				fm_ctrl_in.SB1.SB_META.address,
				fm_ctrl_in.SB2.SB_META.address,
				fm_ctrl_in.SB3.SB_META.address,
				fm_ctrl_in.SB4.SB_META.address,
				fm_ctrl_in.SB5.SB_META.address,
				fm_ctrl_in.SB6.SB_META.address,
				fm_ctrl_in.SB7.SB_META.address,
				fm_ctrl_in.SB8.SB_META.address,
				fm_ctrl_in.SB9.SB_META.address,
				fm_ctrl_in.SB10.SB_META.address,
				fm_ctrl_in.SB11.SB_META.address,
				fm_ctrl_in.SB12.SB_META.address,
				fm_ctrl_in.SB13.SB_META.address,
				fm_ctrl_in.SB14.SB_META.address,
				fm_ctrl_in.SB15.SB_META.address,
				fm_ctrl_in.SB16.SB_META.address,
				fm_ctrl_in.SB17.SB_META.address,
				fm_ctrl_in.SB18.SB_META.address,
				fm_ctrl_in.SB19.SB_META.address,
				fm_ctrl_in.SB20.SB_META.address,
				fm_ctrl_in.SB21.SB_META.address,
				fm_ctrl_in.SB22.SB_META.address,
				fm_ctrl_in.SB23.SB_META.address,
				fm_ctrl_in.SB24.SB_META.address,
				fm_ctrl_in.SB25.SB_META.address,
				fm_ctrl_in.SB26.SB_META.address,
                                fm_ctrl_in.SB_DUMMY0.SB_META.address
                                fm_ctrl_in.SB_DUMMY1.SB_META.address
				};

   assign axi_sm_enable                = {
					  fm_ctrl_in.SB0.SB_META.enable,
					  fm_ctrl_in.SB1.SB_META.enable,
					  fm_ctrl_in.SB2.SB_META.enable,
					  fm_ctrl_in.SB3.SB_META.enable,
					  fm_ctrl_in.SB4.SB_META.enable,
					  fm_ctrl_in.SB5.SB_META.enable,
					  fm_ctrl_in.SB6.SB_META.enable,
					  fm_ctrl_in.SB7.SB_META.enable,
					  fm_ctrl_in.SB8.SB_META.enable,
					  fm_ctrl_in.SB9.SB_META.enable,
					  fm_ctrl_in.SB10.SB_META.enable,
					  fm_ctrl_in.SB11.SB_META.enable,
					  fm_ctrl_in.SB12.SB_META.enable,
					  fm_ctrl_in.SB13.SB_META.enable,
					  fm_ctrl_in.SB14.SB_META.enable,
					  fm_ctrl_in.SB15.SB_META.enable,
					  fm_ctrl_in.SB16.SB_META.enable,
					  fm_ctrl_in.SB17.SB_META.enable,
					  fm_ctrl_in.SB18.SB_META.enable,
					  fm_ctrl_in.SB19.SB_META.enable,
					  fm_ctrl_in.SB20.SB_META.enable,
					  fm_ctrl_in.SB21.SB_META.enable,
					  fm_ctrl_in.SB22.SB_META.enable,
					  fm_ctrl_in.SB23.SB_META.enable,
					  fm_ctrl_in.SB24.SB_META.enable,
					  fm_ctrl_in.SB25.SB_META.enable,
					  fm_ctrl_in.SB26.SB_META.enable,
 					  fm_ctrl_in.SB_DUMMY0.SB_META.enable,
  					  fm_ctrl_in.SB_DUMMY1.SB_META.enable
					  };

   assign axi_sm_wr_enable                = {
					     fm_ctrl_in.SB0.SB_META.wr_enable,
					     fm_ctrl_in.SB1.SB_META.wr_enable,
					     fm_ctrl_in.SB2.SB_META.wr_enable,
					     fm_ctrl_in.SB3.SB_META.wr_enable,
					     fm_ctrl_in.SB4.SB_META.wr_enable,
					     fm_ctrl_in.SB5.SB_META.wr_enable,
					     fm_ctrl_in.SB6.SB_META.wr_enable,
					     fm_ctrl_in.SB7.SB_META.wr_enable,
					     fm_ctrl_in.SB8.SB_META.wr_enable,
					     fm_ctrl_in.SB9.SB_META.wr_enable,
					     fm_ctrl_in.SB10.SB_META.wr_enable,
					     fm_ctrl_in.SB11.SB_META.wr_enable,
					     fm_ctrl_in.SB12.SB_META.wr_enable,
					     fm_ctrl_in.SB13.SB_META.wr_enable,
					     fm_ctrl_in.SB14.SB_META.wr_enable,
					     fm_ctrl_in.SB15.SB_META.wr_enable,
					     fm_ctrl_in.SB16.SB_META.wr_enable,
					     fm_ctrl_in.SB17.SB_META.wr_enable,
					     fm_ctrl_in.SB18.SB_META.wr_enable,
					     fm_ctrl_in.SB19.SB_META.wr_enable,
					     fm_ctrl_in.SB20.SB_META.wr_enable,
					     fm_ctrl_in.SB21.SB_META.wr_enable,
					     fm_ctrl_in.SB22.SB_META.wr_enable,
					     fm_ctrl_in.SB23.SB_META.wr_enable,
					     fm_ctrl_in.SB24.SB_META.wr_enable,
					     fm_ctrl_in.SB25.SB_META.wr_enable,
					     fm_ctrl_in.SB26.SB_META.wr_enable,
 					     fm_ctrl_in.SB_DUMMY0.SB_META.wr_enable,
  					     fm_ctrl_in.SB_DUMMY1.SB_META.wr_enable
 };

     assign axi_sm_wr_data               = {
					  fm_ctrl_in.SB0.SB_META.wr_data,
					  fm_ctrl_in.SB1.SB_META.wr_data,
					  fm_ctrl_in.SB2.SB_META.wr_data,
					  fm_ctrl_in.SB3.SB_META.wr_data,
					  fm_ctrl_in.SB4.SB_META.wr_data,
					  fm_ctrl_in.SB5.SB_META.wr_data,
					  fm_ctrl_in.SB6.SB_META.wr_data,
					  fm_ctrl_in.SB7.SB_META.wr_data,
					  fm_ctrl_in.SB8.SB_META.wr_data,
					  fm_ctrl_in.SB9.SB_META.wr_data,
					  fm_ctrl_in.SB10.SB_META.wr_data,
					  fm_ctrl_in.SB11.SB_META.wr_data,
					  fm_ctrl_in.SB12.SB_META.wr_data,
					  fm_ctrl_in.SB13.SB_META.wr_data,
					  fm_ctrl_in.SB14.SB_META.wr_data,
					  fm_ctrl_in.SB15.SB_META.wr_data,
					  fm_ctrl_in.SB16.SB_META.wr_data,
					  fm_ctrl_in.SB17.SB_META.wr_data,
					  fm_ctrl_in.SB18.SB_META.wr_data,
					  fm_ctrl_in.SB19.SB_META.wr_data,
					  fm_ctrl_in.SB20.SB_META.wr_data,
					  fm_ctrl_in.SB21.SB_META.wr_data,
					  fm_ctrl_in.SB22.SB_META.wr_data,
					  fm_ctrl_in.SB23.SB_META.wr_data,
					  fm_ctrl_in.SB24.SB_META.wr_data,
					  fm_ctrl_in.SB25.SB_META.wr_data,
					  fm_ctrl_in.SB26.SB_META.wr_data,
 					  fm_ctrl_in.SB_DUMMY0.SB_META.wr_data,
  					  fm_ctrl_in.SB_DUMMY1.SB_META.wr_data
					  };
 -----/\----- EXCLUDED -----/\----- */

 




   logic [mon_dw_max-1 : 0] tp_write_data[sb_mapped_n];
   generate
   for(sb_i =0; sb_i < sb_mapped_n; sb_i = sb_i+1)
     begin: l0mdt_spybuffers
	if(sb_dw[sb_i] < mon_dw_max)
	  begin
	     assign fm_passthrough_data[sb_i].fm_data[mon_dw_max-1: sb_dw[sb_i]] = 'b0;
	  end

	assign tp_write_data[sb_i] = fm_mon_data[sb_i].fm_data & {sb_tp_dw[sb_i]{1'b1}};
	
	
	   SpyBuffer #(
		       .DATA_WIDTH_A(sb_dw[sb_i]),
		       .DATA_WIDTH_B(axi_dw),
		       .SPY_META_DATA_WIDTH(axi_dw),

		       .SPY_MEM_WIDTH_A($clog2((2**axi_sb_addr_width[sb_i])* axi_dw /sb_dw[sb_i])), //CHK THIS
		       .SPY_MEM_WIDTH_B(axi_sb_addr_width[sb_i]), //$bits(fm_ctrl_t.sb0.SB_MEM.address)),

		       .FC_FIFO_WIDTH(4),

		       .EL_MEM_WIDTH(8), //Size of SPY META - not used


		       .PASSTHROUGH(1)
		       )
	   fm_spybuffer_inst
		(
		 /*
		  //TEST SpyBuffer IN SINGLE CLOCK DOMAIN
		 .rclock((sb_i == sb_master_dummy_index || sb_i == sb_slave_dummy_index)? spy_clock:clk_hs),
		 .wclock((sb_i == sb_master_dummy_index || sb_i == sb_slave_dummy_index)? spy_clock:clk_hs),
		 .rresetbar((sb_i == sb_master_dummy_index || sb_i == sb_slave_dummy_index)? axi_reset_n:~rst_hs),
		 .wresetbar((sb_i == sb_master_dummy_index || sb_i == sb_slave_dummy_index)? axi_reset_n:~rst_hs),
		  */
		 .rclock(clk_hs),
		 .wclock(clk_hs),
		 .rresetbar(~(rst_hs | sb_reset[sb_i])),
		 .wresetbar(~(rst_hs | sb_reset[sb_i])),
		 .write_data(tp_write_data[sb_i]), //{'b0,fm_mon_data[sb_i].fm_data[sb_tp_dw[sb_i]-1 : 0]} & sb_dw[sb_i]{1'b1}), //CHECK IF ALWAYS VALID
		 .write_enable(fm_mon_data[sb_i].fm_vld),
		 .read_enable(1'b1),
		 .read_data(fm_passthrough_data[sb_i].fm_data[sb_dw[sb_i]-1 : 0]),
		 .almost_full(),
		 .empty(sb_empty[sb_i]),

		 .dbg_spy_meta_write_addr(),
		 .dbg_spy_write_addr(),
		 .dbg_spy_meta_read_data(),

		 .spy_clock(spy_clock),
		 .spy_clock_meta(spy_clock),

		 .freeze(freeze[sb_i]),
		 .playback(playback_mode[sb_i]),
		 .spy_en(axi_sb_enable_internal[sb_i] | axi_sb_wr_enable[sb_i]),
		 .spy_addr(axi_sb_addr[sb_i][axi_sb_addr_width[sb_i]-1:0]),
		 .spy_write_enable(axi_sb_wr_enable[sb_i]),
		 .spy_write_data(axi_sb_wr_data[sb_i]),
		 .spy_data(axi_spy_data_i[sb_i]),
		 .spy_meta_en(0),//axi_sm_enable[sb_i] | axi_sm_wr_enable[sb_i]),
		 .spy_meta_addr(0), //axi_sm_addr[sb_i][axi_sm_addr_width[sb_i]-1:0]),
		 .spy_meta_read_data(),//axi_spy_meta_data[sb_i]),
		 .spy_meta_write_data(0), //axi_sm_wr_data[sb_i]),
		 .spy_meta_wen(0)//(axi_sm_wr_enable[sb_i])

		 );

     end // for (sb_i =0; sb_i < sb_mapped_n; sb_i = sb_i+1)

   endgenerate

  

   always @(posedge spy_clock)
     begin
	if(~axi_reset_n)
	  begin
	     for(integer i=0;i<sb_mapped_n;i=i+1)
	       begin
		  axi_spy_rd_vld[i]       <= 0;
   		  axi_spy_meta_rd_vld[i]  <= 0;
	       end
	  end
	else
	  begin
	     for(integer i=0;i<sb_mapped_n;i=i+1)
	       begin
		  if(axi_sb_enable[i] == 1'b1) // & init_spy_mem_internal == 1'b0)
		    begin
		       axi_spy_rd_vld[i] <= 1'b1;
		    end
		  else
		    begin
		       axi_spy_rd_vld[i] <= 1'b0;
		    end


		  if(axi_sm_enable[i] == 1'b1) // & init_spy_mem_internal == 1'b0) 
		    begin
		       axi_spy_meta_rd_vld[i] <= 1'b1;
		    end
		  else
		    begin
		       axi_spy_meta_rd_vld[i] <= 1'b0;
		    end
	       end
	  end
     end // always @ (posedge spy_clock)



    always @(posedge spy_clock)
     begin
	if(~axi_reset_n)
	  begin
	     init_spy_mem_internal <= 1'b1;
	     
	     for(integer i=0;i<sb_mapped_n;i=i+1)
	       begin
		  axi_sb_init_addr[i]    <= '0;
		  axi_sb_init_wr_data[i] <= 32'h0fa5fa50;		  
	       end
	  end
	else
	  begin
	     init_spy_mem_internal <= init_spy_mem;
	     
	       for(integer i=0;i<sb_mapped_n;i=i+1)
		 begin
		    if(init_spy_mem_internal)
		      axi_sb_init_addr[i] <= axi_sb_init_addr[i] + 1;
		    else
		      axi_sb_init_addr[i] <= 0;		    
		 end
	     
	  end
     end // always @ (posedge spy_clock)

   //Debug
   fm_dummy_block #(
		    .dummy_master(1),
		    .data_width(SB_DUMMY_LEN)
		    )fm_dummy_block_master(
					   .clk(clk_hs), //spy_clock),
					   .rst(rst_hs | sb_reset[sb_master_dummy_index]),  //~axi_reset_n),
					   .dummy_input('b0),
					   .dummy_input_vld(0),
					   .dummy_mon_data(dummy_mon_data[0]),
					   .dummy_mon_vld(dummy_mon_vld[0])
					   );
   fm_dummy_block #(
		    .dummy_master(0),
		    .data_width(SB_DUMMY_LEN)
		    )fm_dummy_block_slave(
					  .clk(clk_hs), //spy_clock),
					  .rst(rst_hs | sb_reset[sb_slave_dummy_index]), //~axi_reset_n),
					  .dummy_input(fm_passthrough_data[sb_master_dummy_index].fm_data[SB_DUMMY_LEN-1:0]),
					  .dummy_input_vld(fm_passthrough_data[sb_master_dummy_index].fm_vld),
					  .dummy_mon_data(dummy_mon_data[1]),
					  .dummy_mon_vld(dummy_mon_vld[1])
					  );
   
   endmodule
