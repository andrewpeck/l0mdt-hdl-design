`include "l0mdt_buses_constants.svh"

module get_rom_addr(
		     input logic 			       clk,
		     input logic 			       rst,
		     input logic 			       in_vld,
		     output logic 			       out_vld,

		     input logic [SF2PTCALC_SEGANGLE_LEN-1:0]  theta_for_lut,
		     input logic 			       lbins0_gbl1,
		     input logic [HEG2SFSLC_VEC_ANG_LEN-1:0]   slcvec_offset_angle_int,
		     output logic [2:0] 		       rom_index,
		     output logic [11:0] 		       lut_start_addr,
		     output logic [SF2PTCALC_SEGANGLE_LEN-1:0] slcvec_angle_mrad
);

`include "hls_get_rom_addr_constants.svh"

   logic [SF2PTCALC_SEGANGLE_LEN -1:0] slcvec_angle_mrad_local;

   logic [LUT_ADDR_WIDTH+3:0] 		       tmp0, tmp1, tmp2, tmp3;


   assign slcvec_angle_mrad_local = (lbins0_gbl1 == 0)?  ((slcvec_offset_angle_int << SF2PTCALC_HEG2SF_ANG_SHIFT) - HALF_PI_MRAD  - ANGLE_MAX_HALF_MRAD) : theta_for_lut;
   assign rom_index               = lut_start_addr[ROM_INDEX_WIDTH-1:0];

   assign tmp0 = (slcvec_angle_mrad_local - ANGLE_BIN_CENTER_OFFSET_MRAD);

   assign tmp1 = ((slcvec_angle_mrad_local - ANGLE_BIN_CENTER_OFFSET_MRAD) * ANGLE_RES_INV) >> SF2PTCALC_LUTBIN_SHIFT;

   assign tmp2 = tmp1 + LUT_ADDRESS_OFFSET;





   always @ (posedge clk)
     begin
	if(rst)
	  begin
	     lut_start_addr    <= 0;
	     slcvec_angle_mrad <= 0;
	     out_vld           <= 0;

	  end
	else
	  begin
	     if(in_vld)
	       begin
		  lut_start_addr    <=  tmp2[LUT_ADDR_WIDTH-1:0];
//( ( (slcvec_angle_mrad_local - ANGLE_BIN_CENTER_OFFSET_MRAD) * ANGLE_RES_INV) + LUT_ADDRESS_OFFSET); // >> SF2PTCALC_LUTBIN_SHIFT ;
		  out_vld           <= 1'b1;
		  slcvec_angle_mrad <= slcvec_angle_mrad_local;
	       end
	     else
	       begin
		  out_vld <= 0;
	       end
	  end

     end

   endmodule
