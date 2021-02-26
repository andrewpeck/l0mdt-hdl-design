
/////////////////////////////////////////////////////////////////////////////
// Design Name:    GBT_SCA                                                 //
// Module Name:    Progr_Divider  (tri version)                            //
// Made by:        Alessandro Caratelli                                    //
//                                                                         //
// Description:    Programmable divider clk_gating for I2C modules         // 
// Company:        CERN (PH-ESE)                                           //
// Create Date:    01/dec/2013                                             //
/////////////////////////////////////////////////////////////////////////////



//`define TB
`timescale 1ns / 1ps
module div_cnt # ( 
	parameter  div0 = 100,
	parameter  div1 = 50,
	parameter  div2 = 25,
	parameter  div3 = 10
	)(
	input             clk,
	input             reset,
	input       [1:0] div,	
		
	output reg  [6:0] count,
	input       [6:0] count_voted,
	output wire       clk_en
	);

	assign clk_en = ~(|count_voted);

	always @(negedge clk or posedge reset) begin: counter
		if(reset) count <= {7{1'b0}};
		else begin
			if(!count) begin 
				case(div)
				2'b00: count <= div0;
				2'b01: count <= div1;
				2'b10: count <= div2;
				2'b11: count <= div3;
				endcase
			end
			else count <= count_voted - 7'h01;
		end
	end

endmodule


module div_prog_voter(
	input      [6:0] count_in_1,  count_in_2,  count_in_3,
	output reg [6:0] count_out,
	input            en_in_1,  en_in_2,  en_in_3,
	output reg       en_out	
	);
	integer i;
	always @(*) begin
		en_out = (en_in_1 != en_in_2) ? en_in_3 : en_in_1;
		for(i=0; i<7; i=i+1) count_out[i] = (count_in_1[i] != count_in_2[i]) ? count_in_3[i] : count_in_1[i];
	end
endmodule


module div_prog_sm_tri # ( 

	parameter     div0 = 100,
	parameter     div1 = 50,
	parameter     div2 = 25,
	parameter     div3 = 10
	)(
	input         clk_1,          clk_2,          clk_3,
	input         reset_1,        reset_2,        reset_3,
	input [1:0]   div_1,          div_2,          div_3,	
	output wire   clk_out_1,      clk_out_2,      clk_out_3
	);	
	wire  [6:0]   count_1,        count_2,        count_3;
	wire  [6:0]   count_1_voted,  count_2_voted,  count_3_voted;
	wire          clk_en_1,       clk_en_2,       clk_en_3;     
	wire          clk_en_1_voted, clk_en_2_voted, clk_en_3_voted; 

	and clk_gating_1 (clk_out_1, clk_1, clk_en_1_voted);
	and clk_gating_2 (clk_out_2, clk_2, clk_en_2_voted);
	and clk_gating_3 (clk_out_3, clk_3, clk_en_3_voted);
	
	div_prog_voter div_voter_1 (
		.count_in_1(count_1[6:0]),
		.count_in_2(count_2[6:0]),
		.count_in_3(count_3[6:0]),
		.count_out(count_1_voted[6:0]),
		.en_in_1(clk_en_2),
		.en_in_2(clk_en_3),
		.en_in_3(clk_en_1),
		.en_out(clk_en_1_voted)
	);
	
	div_prog_voter div_voter_2 (
		.count_in_1(count_2[6:0]),
		.count_in_2(count_3[6:0]),
		.count_in_3(count_1[6:0]),
		.count_out(count_2_voted[6:0]),
		.en_in_1(clk_en_3),
		.en_in_2(clk_en_1),
		.en_in_3(clk_en_2),
		.en_out(clk_en_2_voted)
	);	
	
	div_prog_voter div_voter_3 (
		.count_in_1(count_3[6:0]),
		.count_in_2(count_1[6:0]),
		.count_in_3(count_2[6:0]),
		.count_out(count_3_voted[6:0]),
		.en_in_1(clk_en_1),
		.en_in_2(clk_en_2),
		.en_in_3(clk_en_3),
		.en_out(clk_en_3_voted)
	);	
	
	div_cnt # (
		.div0(div0),
		.div1(div1),
		.div2(div2),
		.div3(div3)
	) div_cnt_1 (
		.clk(clk_1),
		.reset(reset_1),
		.div(div_1),	
	
		.count(count_1[6:0]),
		.count_voted(count_1_voted[6:0]),
		.clk_en(clk_en_1)
	);

	div_cnt # (
		.div0(div0),
		.div1(div1),
		.div2(div2),
		.div3(div3)
	) div_cnt_2 (
		.clk(clk_2),
		.reset(reset_2),
		.div(div_2),		
	
		.count(count_2[6:0]),
		.count_voted(count_2_voted[6:0]),
		.clk_en(clk_en_2)
	);

	div_cnt # (
		.div0(div0),
		.div1(div1),
		.div2(div2),
		.div3(div3)
	) div_cnt_3 (
		.clk(clk_3),
		.reset(reset_3),
		.div(div_3),	
	
		.count(count_3[6:0]),
		.count_voted(count_3_voted[6:0]),
		.clk_en(clk_en_3)
	);

endmodule








`ifdef TB
module div_test();
	
	reg  [1:0] div;
	reg  reset;
	reg  clk;
	wire clk_out_1, clk_out_2, clk_out_3;
	
	div_prog_sm_tri div_tb (
		.clk_1(clk),           .clk_2(clk),           .clk_3(clk),
		.reset_1(reset),       .reset_2(reset),       .reset_3(reset),
		.div_1(div),           .div_2(div),           .div_3(div),     
		.clk_out_1(clk_out_1), .clk_out_2(clk_out_2), .clk_out_3(clk_out_3)
	);
	
	initial begin
		clk = 1'b0;
		forever #12.5 clk = ~clk;
	end
	
	initial begin
		reset = 1'b0;
		div = 2'b0; 
		#500;reset = 1'b1;
		#10;reset = 1'b0;
		forever begin
			#(2500*5+({$random}%3000)); 
			@(posedge clk) div = {$random}%4;
		end
	end
	
endmodule
`endif	
		
	
/*	
`timescale 1ns / 1ps
module div_prog_sm_tri # ( 
	parameter     div0 = 100,
	parameter     div1 = 50,
	parameter     div2 = 25,
	parameter     div3 = 10
	)(
	input         clk_1,          clk_2,          clk_3,
	input         reset_1,        reset_2,        reset_3,
	input [1:0]   div_1,          div_2,          div_3,	
	output wire   clk_out_1,      clk_out_2,      clk_out_3
	);
	
	reg [6:0]     count_1,        count_2,        count_3;
	reg [6:0]     count_1_voted,  count_2_voted,  count_3_voted;
	wire          clk_en_1,       clk_en_2,       clk_en_3;     
	reg           clk_en_1_voted, clk_en_2_voted, clk_en_3_voted; 

	integer i;

	always @(*) begin: majority_voter
		for(i=0; i<7; i=i+1) begin
			count_1_voted[i] = (count_1[i] != count_2[i]) ? count_3[i] : count_1[i];
			count_2_voted[i] = (count_2[i] != count_3[i]) ? count_1[i] : count_2[i];
			count_3_voted[i] = (count_3[i] != count_1[i]) ? count_2[i] : count_3[i];
		end
		clk_en_1_voted = (clk_en_1 != clk_en_2) ? clk_en_3 : clk_en_1;
		clk_en_2_voted = (clk_en_2 != clk_en_3) ? clk_en_1 : clk_en_2;
		clk_en_3_voted = (clk_en_3 != clk_en_1) ? clk_en_2 : clk_en_3;
	end

	and clk_gating_1 (clk_out_1, clk_1, clk_en_1_voted);
	and clk_gating_2 (clk_out_2, clk_2, clk_en_2_voted);
	and clk_gating_3 (clk_out_3, clk_3, clk_en_3_voted);
	
	assign clk_en_1 = ~(|count_1_voted);
	assign clk_en_2 = ~(|count_2_voted);
	assign clk_en_3 = ~(|count_3_voted);

	always @(negedge clk_1 or posedge reset_1) begin: counter_1
		if(reset_1) count_1 <= {7{1'b0}};
		else begin
			if(!count_1) begin 
				case(div_1)
				2'b00: count_1 <= div0;
				2'b01: count_1 <= div1;
				2'b10: count_1 <= div2;
				2'b11: count_1 <= div3;
				endcase
			end
			else count_1 <= count_1_voted - 7'h01;
		end
	end

	always @(negedge clk_2 or posedge reset_2) begin: counter_2
		if(reset_2) count_2 <= {7{1'b0}};
		else begin
			if(!count_2) begin 
				case(div_2)
				2'b00: count_2 <= div0;
				2'b01: count_2 <= div1;
				2'b10: count_2 <= div2;
				2'b11: count_2 <= div3;
				endcase
			end
			else count_2 <= count_2_voted - 7'h01;
		end
	end
	
	always @(negedge clk_3 or posedge reset_3) begin: counter_3
		if(reset_3) count_3 <= {7{1'b0}};
		else begin
			if(!count_3) begin 
				case(div_3)
				2'b00: count_3 <= div0;
				2'b01: count_3 <= div1;
				2'b10: count_3 <= div2;
				2'b11: count_3 <= div3;
				endcase
			end
			else count_3 <= count_3_voted - 7'h01;
		end
	end

endmodule
*/
	

