`include "fm_sb_pkg.sv"
`include "FM_PKG.svh"

import fm_ctrl::*;
import fm_sb_pkg::*;


module fm_data(
	       input logic 		       clk_hs,
	       input logic 		       rst_hs,
	       input logic 		       axi_reset,
	       input logic [total_sb-1:0]      freeze,
	       input logic [pb_mode_width-1:0] playback_mode[total_sb],
	       input 			       FM_CTRL_t fm_ctrl_in,
	       input 			       fm_rt ult_mon_data[total_sb],
	       output 			       FM_MON_t fm_mon_out
	       );
   localparam axi_dw = axi_dw;
   genvar 	      sb_i;
   logic 	      sb_mem_rd_valid[total_sb];
   logic 	      sb_meta_rd_valid[total_sb];

   assign fm_mon_out.SB0.SB_MEM.rd_data  = axi_spy_data[0];
   assign fm_mon_out.SB0.SB_META.rd_data = axi_spy_meta_data[0];

   assign fm_mon_out.SB0.SB_MEM.rd_data_valid  = sb_mem_rd_valid[0];
   assign fm_mon_out.SB0.SB_META.rd_data_valid = sb_meta_rd_valid[0];


   assign fm_mon_out.SB1.SB_MEM.rd_data  = axi_spy_data[1];
   assign fm_mon_out.SB1.SB_META.rd_data = axi_spy_meta_data[1];



   assign spy_clock = fm_ctrl_in.SB0.SB_MEM.clk;

   generate
      begin: l0mdt_spybuffers
	 for(sb_i =0; sb_i < total_sb; sb_i = sb_i+1)
	   begin
	      assign  axi_sb_addr[sb_i]       = {
						 fm_ctrl_in.SB0.SB_MEM.address,
						 fm_ctrl_in.SB1.SB_MEM.address
						 };
	      SpyBuffer #(
			  .DATA_WIDTH_A(256),
			  .DATA_WIDTH_B(axi_dw),
			  .SPY_META_DATA_WIDTH(axi_dw),

			  .SPY_MEM_WIDTH_A(),
			  .SPY_MEM_WIDTH_B(axi_sb_addr_width[sb_i]), //$bits(fm_ctrl_t.sb0.SB_MEM.address)),

			  .FC_FIFO_WIDTH(4),

			  .EL_MEM_WIDTH(axi_sm_addr_width[sb_i]),


			  .PASSTHROUGH(1)
			  )
	      spybuffer_inst
		(
		 .rclock(clk_hs),
		 .wclock(clk_hs),
		 .rresetbar(~rst_hs),
		 .wresetbar(~rst_hs),
		 .write_data(ult_mon_data[sb_i].fm_data),
		 .write_enable(ult_mon_data[sb_i].fm_vld),
		 .read_enable(),
		 .read_data(),
		 .almost_full(),
		 .empty(),

		 .dbg_spy_meta_write_addr(),
		 .dbg_spy_write_addr(),
		 .dbg_spy_meta_read_data(),

		 .spy_clock(spy_clock),
		 .spy_clock_meta(spy_clock),

		 .freeze(freeze[sb_i]),
		 .playback(playback_mode[sb_i]),
		 .spy_en(axi_sb_enable[sb_i]),
		 .spy_addr(axi_sb_addr[sb_i][axi_sb_addr_width[sb_i]-1:0]),
		 .spy_write_enable(axi_sb_enable[sb_i] & axi_sb_wr_enable[sb_i]),
		 .spy_write_data(axi_sb_wr_data[sb_i]),
		 .spy_data(axi_spy_data[sb_i]),
		 .spy_meta_en(axi_sm_enable[sb_i]),
		 .spy_meta_addr(axi_sm_addr[sb_i][axi_sm_addr_width[sb_i]-1:0]),
		 .spy_meta_read_data(axi_spy_meta_data[sb_i]),
		 .spy_meta_write_data(axi_sm_wr_data[sb_i]),
		 .spy_meta_wen(axi_sm_wr_enable[sb_i])

		 );

	   end // for (sb_i =0; sb_i < total_sb; sb_i = sb_i+1)
      end // block: l0mdt_spybuffers
   endgenerate



   always @(posedge spy_clock)
     begin
	if(axi_reset)
	  begin
	     for(integer i=0;i<total_sb;i=i+1)
	       begin
		  sb_mem_rd_valid[i]   <= 0;
   		  sb_meta_rd_valid[i]  <= 0;
	       end
	  end
	else
	  begin
	     for(integer i=0;i<total_sb;i=i+1)
	       begin
		  if(axi_sb_enable[i] == 1'b1)
		    begin
		       sb_mem_rd_valid[i] <= 1'b1;
		    end
		  else
		    begin
		       sb_mem_rd_valid[i] <= 1'b0;
		    end


		  if(axi_sm_enable[i] == 1'b1)
		    begin
		       sb_meta_rd_valid[i] <= 1'b1;
		    end
		  else
		    begin
		       sb_meta_rd_valid[i] <= 1'b0;
		    end
	       end
	  end
     end
   endmodule
