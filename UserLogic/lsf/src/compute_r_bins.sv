
`include "l0mdt_buses_constants.svh"
import l0mdt_dataformats_svh::*;
module compute_r_bins #(
			parameter W_r = 22,
			parameter IW_r = 16,
			parameter W_OUT = 18,
			parameter IW_OUT = 1,
			parameter W_bin_number_a = 7,
			parameter RBINS=128

			)(
		       input logic 			      clk,
		       input logic 			      rst_n,
		       input logic 			      hit_vld,
		       input logic [HEG2SFHIT_LOCALX_LEN-1:0] mdt_localx,
		       input logic [HEG2SFHIT_LOCALY_LEN-1:0] mdt_localy,
		       input logic [W_r-1:0] 		      mdt_r_offset,
		       input logic [W_OUT-1:0] 		      hw_sin_val,
		       input logic [W_OUT-1:0] 		      hw_cos_val,
		       output logic [W_bin_number_a-1:0]      r_bin,
		       output logic 			      r_bin_vld
);

   localparam cos_shift = HEG2SFHIT_LOCALX_DECB + (W_OUT - IW_OUT) - (W_r - IW_r);
   localparam sin_shift = HEG2SFHIT_LOCALY_DECB + (W_OUT - IW_OUT) - (W_r - IW_r);
   localparam xcos_mul_len = HEG2SFHIT_LOCALX_LEN + W_OUT;
   localparam ysin_mul_len = HEG2SFHIT_LOCALY_LEN + W_OUT;
   localparam bin_shift    = (RBINS == 128)? (W_r - IW_r - 1 ) : W_r - IW_r;



   logic [xcos_mul_len-1:0] 				      xcos_mul;
   logic [ysin_mul_len-1:0] 				      ysin_mul;
   logic [W_r-1:0] 					      mdt_r_offset_d;
   logic 						      hit_vld_d;

   logic [xcos_mul_len-W_OUT-1:0] 			      hw_cos_sign_ext;
   logic [ysin_mul_len-W_OUT-1:0] 			      hw_sin_sign_ext;

   logic [xcos_mul_len-HEG2SFHIT_LOCALX_LEN -1 : 0] 	      mdt_localx_sign_ext;
   logic [ysin_mul_len-HEG2SFHIT_LOCALY_LEN -1 : 0] 	      mdt_localy_sign_ext;


   assign hw_cos_sign_ext = (hw_cos_val[W_OUT-1])? ((1 << (xcos_mul_len-W_OUT) ) - 1) : 0;
   assign hw_sin_sign_ext = (hw_sin_val[W_OUT-1])? ((1 << (ysin_mul_len-W_OUT) ) - 1) : 0;

   assign mdt_localx_sign_ext = (mdt_localx[HEG2SFHIT_LOCALX_LEN-1])? (( 1 << (xcos_mul_len-HEG2SFHIT_LOCALX_LEN) ) - 1) : 0;
   assign mdt_localy_sign_ext = (mdt_localy[HEG2SFHIT_LOCALY_LEN-1])? (( 1 << (ysin_mul_len-HEG2SFHIT_LOCALY_LEN) ) - 1) : 0;

   logic [xcos_mul_len-W_OUT-1:0] 			      cos_tmp;
   logic [ysin_mul_len-W_OUT-1:0] 			      sin_tmp;

   assign cos_tmp = xcos_mul[xcos_mul_len-1 : cos_shift];
   assign sin_tmp = ysin_mul[ysin_mul_len-1 : sin_shift];


   always @ (posedge clk)
     begin
	if(~rst_n)
	  begin
	     r_bin_vld <= 0;
	     r_bin     <= 0;
	     hit_vld_d <= hit_vld;

	  end
	else
	  begin
	     hit_vld_d <= hit_vld;

	     if (hit_vld)
	       begin
		  mdt_r_offset_d   <= mdt_r_offset;
		  xcos_mul         <= {mdt_localx_sign_ext, mdt_localx} * {hw_cos_sign_ext, hw_cos_val};
		  ysin_mul         <= {mdt_localy_sign_ext, mdt_localy} * {hw_sin_sign_ext, hw_sin_val};
	       end
	     if(hit_vld_d)
	       begin
		  r_bin      <= (xcos_mul[xcos_mul_len-1 : cos_shift] + ysin_mul[ysin_mul_len-1 : sin_shift] + mdt_r_offset_d) >> bin_shift;
		  if(xcos_mul[xcos_mul_len-1 : cos_shift] + ysin_mul[ysin_mul_len-1 : sin_shift] + mdt_r_offset_d >= 0)
		    r_bin_vld  <= 1'b1;
		  else
		    r_bin_vld  <= 1'b0;
	       end
	     else
	       begin
		  r_bin      <= 0;
		  r_bin_vld  <= 0;
	       end

	  end

     end


endmodule // compute_r_bins
