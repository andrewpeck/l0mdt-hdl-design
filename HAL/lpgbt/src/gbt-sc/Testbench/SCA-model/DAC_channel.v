

/////////////////////////////////////////////////////////////////////////////
// Design Name:    GBT_SCA                                                 //
// Module Name:    DAC_wb_interface(TRI Version)                           //
// Description:    whishbone Interface for DAC module                      //
// Company:        CERN (PH-ESE)                                           //
// Made by:        Alessandro Caratelli                                    //
//                                                                         //
// Create Date:    18/July/2013 - Created                                  //
/////////////////////////////////////////////////////////////////////////////

`include "DAC_defines.v"
`timescale 1ns / 1ps
module DAC_wb_interf_iostate(
   wb_clk_in, wb_rst_in ,wb_adr_in ,wb_dat_in ,wb_sel_in ,wb_we_in ,
   wb_stb_in ,wb_cyc_in ,wb_dat_out_i, wb_dat_out_o ,wb_ack_out_i, wb_ack_out_o ,wb_err_out ,wb_int_out,
	dac_out_1_i, dac_out_1_o, dac_out_2_i, dac_out_2_o, dac_out_3_i, dac_out_3_o, dac_out_4_i, dac_out_4_o
   );
	 
	//Wishbone signals///////////////////////////////////////////
	input                         wb_clk_in;         
	input    [`dac_conv_nbit-1:0] dac_out_4_i;
	input    [`dac_conv_nbit-1:0] dac_out_3_i;
	input    [`dac_conv_nbit-1:0] dac_out_2_i;
	input    [`dac_conv_nbit-1:0] dac_out_1_i;

	input                          wb_ack_out_i;         
	input                   [31:0] wb_dat_out_i;
	input                          wb_rst_in;         
	input                    [4:0] wb_adr_in;         
	input                   [31:0] wb_dat_in;                  
	input                    [3:0] wb_sel_in;         
	input                          wb_we_in;          
	input                          wb_stb_in;         
	input                          wb_cyc_in; 
	output                  [31:0] wb_dat_out_o;
	output                         wb_err_out;         
	output                         wb_int_out;
	
	output    [`dac_conv_nbit-1:0] dac_out_1_o;
	output    [`dac_conv_nbit-1:0] dac_out_2_o;
	output    [`dac_conv_nbit-1:0] dac_out_3_o;
	output    [`dac_conv_nbit-1:0] dac_out_4_o;
	output                         wb_ack_out_o;
	// Output data to DAC
	//WB data out /////////////////////////////////////////////////
	reg  [31:0] wb_dat_out_o;
	reg  [`dac_conv_nbit-1:0] wb_datM;	

	always @(*) begin
			case (wb_adr_in[`dac_wb_ofset_bits])
				`dac_out1:       wb_datM = dac_out_1_i[`dac_conv_nbit-1:0];
				`dac_out2:       wb_datM = dac_out_2_i[`dac_conv_nbit-1:0];
				`dac_out3:       wb_datM = dac_out_3_i[`dac_conv_nbit-1:0];
				`dac_out4:       wb_datM = dac_out_4_i[`dac_conv_nbit-1:0];
				`dac_ctrl:       wb_datM = {`dac_conv_nbit{1'b0}};
				default:         wb_datM = {`dac_conv_nbit{1'b0}};
			endcase
	end
	
	always @(posedge wb_clk_in or posedge wb_rst_in) begin
		if (wb_rst_in)
			wb_dat_out_o <= #1 {32{1'b0}};
		else
			wb_dat_out_o <= #1 {wb_datM[7:0],{24{1'b0}}}; 
	end
	
	
	//WB Interrupt /////////////////////////////////////////////////
	assign wb_int_out = 1'b0;
	
	//WB ack //////////////////////////////////////////////////////////
	reg   wb_ack_out_o; 
	always @(posedge wb_clk_in or posedge wb_rst_in) begin
		if (wb_rst_in)
			wb_ack_out_o <= #1 1'b0;
		else	
			wb_ack_out_o <= #1 wb_cyc_in & wb_stb_in & ~wb_ack_out_i;
	end
	
	//WB err //////////////////////////////////////////////////////////
	assign wb_err_out = 1'b0;

	// Analog Outputs /////////////////////////////////////////////////////	
	
	reg    [`dac_conv_nbit-1:0] dac_out_1_o;
	reg    [`dac_conv_nbit-1:0] dac_out_2_o;
	reg    [`dac_conv_nbit-1:0] dac_out_3_o;
	reg    [`dac_conv_nbit-1:0] dac_out_4_o;	
	
	wire   dac_out1_sel;
	wire   dac_out2_sel;
	wire   dac_out3_sel;
	wire   dac_out4_sel;
	
	assign dac_out1_sel   = wb_cyc_in & wb_stb_in & (wb_adr_in[`dac_wb_ofset_bits] == `dac_out1);
	assign dac_out2_sel   = wb_cyc_in & wb_stb_in & (wb_adr_in[`dac_wb_ofset_bits] == `dac_out2);
	assign dac_out3_sel   = wb_cyc_in & wb_stb_in & (wb_adr_in[`dac_wb_ofset_bits] == `dac_out3);
	assign dac_out4_sel   = wb_cyc_in & wb_stb_in & (wb_adr_in[`dac_wb_ofset_bits] == `dac_out4);
	
	
	always @(posedge wb_clk_in or posedge wb_rst_in) begin
		if (wb_rst_in) 
			dac_out_1_o <= #1 {`dac_conv_nbit{1'b0}};
		else begin
			if(dac_out1_sel &&  wb_we_in && wb_sel_in[3])
				dac_out_1_o <= #1 wb_dat_in[31:24];
			else
				dac_out_1_o <= #1 dac_out_1_i;
		end
	end
	
	always @(posedge wb_clk_in or posedge wb_rst_in) begin
		if (wb_rst_in) 
			dac_out_2_o <= #1 {`dac_conv_nbit{1'b0}};
		else begin
			if(dac_out2_sel &&  wb_we_in && wb_sel_in[3])
				dac_out_2_o <= #1 wb_dat_in[31:24];
			else
				dac_out_2_o <= #1 dac_out_2_i;
		end
	end
	
	always @(posedge wb_clk_in or posedge wb_rst_in) begin
		if (wb_rst_in) 
			dac_out_3_o <= #1 {`dac_conv_nbit{1'b0}};
		else begin
			if(dac_out3_sel &&  wb_we_in && wb_sel_in[3])
				dac_out_3_o <= #1 wb_dat_in[31:24];
			else
				dac_out_3_o <= #1 dac_out_3_i;
		end
	end
	
	always @(posedge wb_clk_in or posedge wb_rst_in) begin
		if (wb_rst_in) 
			dac_out_4_o <= #1 {`dac_conv_nbit{1'b0}};
		else begin
			if(dac_out4_sel &&  wb_we_in && wb_sel_in[3])
				dac_out_4_o <= #1 wb_dat_in[31:24];
			else
				dac_out_4_o <= #1 dac_out_4_i;
		end
	end
	

endmodule

`timescale 1ns / 1ps
`include "DAC_defines.v"
module DAC_wb_interf_tri(
   wb_clk_in_1, wb_clk_in_2, wb_clk_in_3, wb_rst_in_1, wb_rst_in_2, wb_rst_in_3 ,wb_adr_in_1, wb_adr_in_2, wb_adr_in_3 ,wb_dat_in_1, wb_dat_in_2, wb_dat_in_3 ,wb_sel_in_1, wb_sel_in_2, wb_sel_in_3 ,wb_we_in_1, wb_we_in_2, wb_we_in_3 ,
   wb_stb_in_1, wb_stb_in_2, wb_stb_in_3 ,wb_cyc_in_1, wb_cyc_in_2, wb_cyc_in_3 ,wb_dat_out_1, wb_dat_out_2, wb_dat_out_3 ,wb_ack_out_1, wb_ack_out_2, wb_ack_out_3 ,wb_err_out_1, wb_err_out_2, wb_err_out_3 ,wb_int_out_1, wb_int_out_2, wb_int_out_3,
	dac_out_1_1, dac_out_1_2, dac_out_1_3, dac_out_2_1, dac_out_2_2, dac_out_2_3, dac_out_3_1, dac_out_3_2, dac_out_3_3, dac_out_4_1, dac_out_4_2, dac_out_4_3
   );

	//Wishbone signals///////////////////////////////////////////
	input                           wb_clk_in_1, wb_clk_in_2, wb_clk_in_3;         
	input                           wb_rst_in_1, wb_rst_in_2, wb_rst_in_3;         
	input                     [4:0] wb_adr_in_1, wb_adr_in_2, wb_adr_in_3;         
	input                    [31:0] wb_dat_in_1, wb_dat_in_2, wb_dat_in_3;                  
	input                     [3:0] wb_sel_in_1, wb_sel_in_2, wb_sel_in_3;         
	input                           wb_we_in_1, wb_we_in_2, wb_we_in_3;          
	input                           wb_stb_in_1, wb_stb_in_2, wb_stb_in_3;         
	input                           wb_cyc_in_1, wb_cyc_in_2, wb_cyc_in_3; 
	output                   [31:0] wb_dat_out_1, wb_dat_out_2, wb_dat_out_3;
	output                          wb_ack_out_1, wb_ack_out_2, wb_ack_out_3;         
	output                          wb_err_out_1, wb_err_out_2, wb_err_out_3;         
	output                          wb_int_out_1, wb_int_out_2, wb_int_out_3;

	// Output data to DAC
	output    [`dac_conv_nbit-1:0] dac_out_1_1, dac_out_1_2, dac_out_1_3;
	output    [`dac_conv_nbit-1:0] dac_out_2_1, dac_out_2_2, dac_out_2_3;
	output    [`dac_conv_nbit-1:0] dac_out_3_1, dac_out_3_2, dac_out_3_3;
	output    [`dac_conv_nbit-1:0] dac_out_4_1, dac_out_4_2, dac_out_4_3;

	//WB data out /////////////////////////////////////////////////

	wire [31:0] wb_dat_out_1, wb_dat_out_2, wb_dat_out_3;
	wire wb_ack_out_1, wb_ack_out_2, wb_ack_out_3;
	wire [`dac_conv_nbit-1:0] dac_out_1_1, dac_out_1_2, dac_out_1_3;
	wire [`dac_conv_nbit-1:0] dac_out_2_1, dac_out_2_2, dac_out_2_3;
	wire [`dac_conv_nbit-1:0] dac_out_3_1, dac_out_3_2, dac_out_3_3;
	wire [`dac_conv_nbit-1:0] dac_out_4_1, dac_out_4_2, dac_out_4_3;
	wire [31:0] wb_dat_out;
	wire wb_ack_out;
	wire [`dac_conv_nbit-1:0] dac_out_1;
	wire [`dac_conv_nbit-1:0] dac_out_2;
	wire [`dac_conv_nbit-1:0] dac_out_3;
	wire [`dac_conv_nbit-1:0] dac_out_4;

	DAC_wb_interf_iostate DAC_wb_interf_iostate_1  (
   .wb_clk_in(wb_clk_in_1), .wb_rst_in(wb_rst_in_1),.wb_adr_in(wb_adr_in_1),.wb_dat_in(wb_dat_in_1),.wb_sel_in(wb_sel_in_1),.wb_we_in(wb_we_in_1),
   .wb_stb_in(wb_stb_in_1),.wb_cyc_in(wb_cyc_in_1),.wb_dat_out_i(wb_dat_out_1), .wb_dat_out_o(wb_dat_out_2),.wb_ack_out_i(wb_ack_out_1), .wb_ack_out_o(wb_ack_out_2),.wb_err_out(wb_err_out_1),.wb_int_out(wb_int_out_1),
	.dac_out_1_i(dac_out_1_1), .dac_out_1_o(dac_out_1_2), .dac_out_2_i(dac_out_2_1), .dac_out_2_o(dac_out_2_2), .dac_out_3_i(dac_out_3_1), .dac_out_3_o(dac_out_3_2), .dac_out_4_i(dac_out_4_1), .dac_out_4_o(dac_out_4_2));

	DAC_wb_interf_iostate DAC_wb_interf_iostate_2  (
   .wb_clk_in(wb_clk_in_2), .wb_rst_in(wb_rst_in_2),.wb_adr_in(wb_adr_in_2),.wb_dat_in(wb_dat_in_2),.wb_sel_in(wb_sel_in_2),.wb_we_in(wb_we_in_2),
   .wb_stb_in(wb_stb_in_2),.wb_cyc_in(wb_cyc_in_2),.wb_dat_out_i(wb_dat_out_2), .wb_dat_out_o(wb_dat_out_3),.wb_ack_out_i(wb_ack_out_2), .wb_ack_out_o(wb_ack_out_3),.wb_err_out(wb_err_out_2),.wb_int_out(wb_int_out_2),
	.dac_out_1_i(dac_out_1_2), .dac_out_1_o(dac_out_1_3), .dac_out_2_i(dac_out_2_2), .dac_out_2_o(dac_out_2_3), .dac_out_3_i(dac_out_3_2), .dac_out_3_o(dac_out_3_3), .dac_out_4_i(dac_out_4_2), .dac_out_4_o(dac_out_4_3));

	DAC_wb_interf_iostate DAC_wb_interf_iostate_3  (
   .wb_clk_in(wb_clk_in_3), .wb_rst_in(wb_rst_in_3),.wb_adr_in(wb_adr_in_3),.wb_dat_in(wb_dat_in_3),.wb_sel_in(wb_sel_in_3),.wb_we_in(wb_we_in_3),
   .wb_stb_in(wb_stb_in_3),.wb_cyc_in(wb_cyc_in_3),.wb_dat_out_i(wb_dat_out_3), .wb_dat_out_o(wb_dat_out),.wb_ack_out_i(wb_ack_out_3), .wb_ack_out_o(wb_ack_out),.wb_err_out(wb_err_out_3),.wb_int_out(wb_int_out_3),
	.dac_out_1_i(dac_out_1_3), .dac_out_1_o(dac_out_1), .dac_out_2_i(dac_out_2_3), .dac_out_2_o(dac_out_2), .dac_out_3_i(dac_out_3_3), .dac_out_3_o(dac_out_3), .dac_out_4_i(dac_out_4_3), .dac_out_4_o(dac_out_4));

	majority_voter #(.WIDTH(37+`dac_conv_nbit-1+`dac_conv_nbit-1+`dac_conv_nbit-1+`dac_conv_nbit-1)) mv (
		.in1({wb_dat_out_2, wb_ack_out_2, dac_out_1_2, dac_out_2_2, dac_out_3_2, dac_out_4_2}),
		.in2({wb_dat_out_3, wb_ack_out_3, dac_out_1_3, dac_out_2_3, dac_out_3_3, dac_out_4_3}),
		.in3({wb_dat_out, wb_ack_out,  dac_out_1, dac_out_2, dac_out_3, dac_out_4}),
		.out({wb_dat_out_1, wb_ack_out_1,  dac_out_1_1, dac_out_2_1, dac_out_3_1, dac_out_4_1}),
		.err()
	);
endmodule


