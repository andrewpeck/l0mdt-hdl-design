library work::fm_sb_pkg;
import fm_sb_pkg::*;

module fm(
	  input       FM_CTRL_t fm_ctrl_in,
	  input logic clk_hs,
	  input logic rst_hs,
	  output      FM_MON_t fm_mon_out,
	  input       fm_rt ult_fm_data[total_sb]
	  );

   logic [total_sb-1:0] 	       freeze;
   logic [pb_mode_width-1:0] 	       playback_mode[total_sb];

   fm_sb_ctrl fm_sb_ctrl_inst(
			      .fm_ctrl_in(fm_ctrl_in),
			      .freeze(freeze),
			      .playback_mode(playback_mode)
			);

   fm_data fm_data_inst(
			.clk_hs(clk_hs),
			.rst_hs(rst_hs),
			.freeze(freeze),
			.playback_mode(playback_mode),
			.fm_ctrl_in(fm_ctrl_in),
			.ult_mon_data(ult_fm_data),
			.fm_mon_out(fm_mon_out)
			);


endmodule // fv
