`include "fm_sb_pkg.sv"
`include "FM_PKG.svh"

import FM_CTRL::*;
import fm_sb_pkg::*;

module fm #(
	    parameter total_l0mdt_sb = 27
	    )(
	      input logic [$bits(FM_CTRL_t)-1:0] fm_ctrl_v,
	      input logic 			 clk_hs,
	      input logic 			 rst_hs,
	      input logic 			 axi_reset_n,
	      output logic [$bits(FM_MON_t)-1:0] fm_mon_v,
	      input logic [$bits(fm_rt)-1 :0 ] 	 ult_fm_data_v[total_l0mdt_sb],
	      output logic [mon_dw_max-1 : 0] 	 fm_pb_v[total_l0mdt_sb]
	  );
   logic 					 axi_clock;
   genvar 					 sb_t;
   
   logic [sb_mapped_n-1:0] 			 freeze;
   logic [pb_mode_width-1:0] 			 playback_mode[sb_mapped_n];
   logic 					 init_spy_mem;
   
   FM_MON_t fm_mon_out;
   FM_CTRL_t fm_ctrl_in;
   fm_rt     ult_fm_data[total_l0mdt_sb];
   

   assign fm_ctrl_in   = fm_ctrl_v;
   assign fm_mon_v     = fm_mon_out;
   
   assign ult_fm_data = ult_fm_data_v;	
   
   
   //assign axi_clock = fm_ctrl_in.SB0.SB_MEM.clk;
   BUFG bufg_inst(.O(axi_clock), .I(fm_ctrl_in.SB0.SB_MEM.clk));
   
   
   fm_sb_ctrl fm_sb_ctrl_inst(
			      .fm_ctrl_in(fm_ctrl_in),
			      .axi_reset_n(axi_reset_n),
			      .axi_clk(axi_clock),
			      .freeze(freeze),
			      .playback_mode(playback_mode),
			      .init_spy_mem(init_spy_mem)
			);

   fm_data  #(
	      .total_l0mdt_sb(total_l0mdt_sb)
	      )fm_data_inst(
			    .clk_hs(clk_hs),
			    .rst_hs(rst_hs),
			    .axi_reset_n(axi_reset_n),
			    .spy_clock(axi_clock),
			    .freeze(freeze),
			    .playback_mode(playback_mode),
			    .init_spy_mem(init_spy_mem),
			    .fm_ctrl_in(fm_ctrl_in),
			    .ult_mon_data(ult_fm_data),
			    .fm_mon_out(fm_mon_out),
			    .fm_playback_data(fm_pb_v)
			    );

   

endmodule // fv
