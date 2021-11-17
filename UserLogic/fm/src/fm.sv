library work::fm_sb_pkg;
import fm_sb_pkg::*;

module fm #(
	    parameter total_sb = 27
	    )(
	      input 	  FM_CTRL_t fm_ctrl_in,
	      input logic clk_hs,
	      input logic rst_hs,
	      output 	  FM_MON_t fm_mon_out,
	      input 	  fm_rt ult_fm_data[total_sb]
	  );

   logic [sb_mapped_n-1:0] 	       freeze;
   logic [pb_mode_width-1:0] 	       playback_mode[sb_mapped_n];
   logic 			       axi_clock;
   logic 			       axi_rst;
   logic [2:0]			       axi_rst_d;


   assign axi_clock = fm_ctrl_in.SB0.SB_MEM.clk;
   fm_sb_ctrl fm_sb_ctrl_inst(
			      .fm_ctrl_in(fm_ctrl_in),
			      .axi_rst(axi_rst),
			      .axi_clk(axi_clock),
			      .freeze(freeze),
			      .playback_mode(playback_mode)
			);

   fm_data  #(
	      .total_sb(total_sb)
	      )fm_data_inst(
			.clk_hs(clk_hs),
			.rst_hs(rst_hs),
			.axi_reset(axi_rst),
			.spy_clock(axi_clock),
			.freeze(freeze),
			.playback_mode(playback_mode),
			.fm_ctrl_in(fm_ctrl_in),
			.ult_mon_data(ult_fm_data),
			.fm_mon_out(fm_mon_out)
			);

   always @ (posedge axi_clock)
     begin
	if(rst_hs == 0)
	  begin
	     axi_rst   <= 0;
	     axi_rst_d <= 0;
	  end
	else
	  begin
	     axi_rst_d <= {axi_rst_d[1:0],rst_hs};
	     axi_rst   <= axi_rst_d[2];

	  end
     end

endmodule // fv
