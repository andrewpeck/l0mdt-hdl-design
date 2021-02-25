
/////////////////////////////////////////////////////////////////////////////
// Design Name:    GBT_SCA                                                 //
// Module Name:    ClkGate_Reset_channels (tri version)                    //
// Made by:        Alessandro Caratelli                                    //
//                                                                         //
// Description:    Generate clock gating and reset for enable/disable      // 
//                 the specific SCA channell                               //
// Company:        CERN (PH-ESE)                                           //
// Create Date:    22/jan/2014                                             //
/////////////////////////////////////////////////////////////////////////////



`timescale 1ns / 1ps

module ClkGate_Reset_channels_tri #(
	parameter n_ch = 22
	)(
	input                    clk_1,       clk_2,       clk_3,
	input                    reset_1,     reset_2,     reset_3,
	input       [(n_ch-1):0] ch_enable_1, ch_enable_2, ch_enable_3,
	output      [(n_ch-1):0] ch_clk_1,    ch_clk_2,    ch_clk_3,
	output      [(n_ch-1):0] ch_res_1,    ch_res_2,    ch_res_3
	);
	wire        [(n_ch-1):0] int_res_1,   int_res_2,   int_res_3;
	genvar i;
	
	generate 
	for(i=0; i<n_ch; i=i+1) begin: inst_ch_clk_gating   
		ch_gate_clk_tri ch_clk_gating(
			.clk_1(clk_1),            .clk_2(clk_2),            .clk_3(clk_3),       
			.resetB_1(~reset_1),      .resetB_2(~reset_2),      .resetB_3(~reset_3),   
			.ch_en_1(ch_enable_1[i]), .ch_en_2(ch_enable_2[i]), .ch_en_3(ch_enable_3[i]),  
			.ch_clk_1(ch_clk_1[i]),   .ch_clk_2(ch_clk_2[i]),   .ch_clk_3(ch_clk_3[i]),  
			.ch_res_1(int_res_1[i]),  .ch_res_2(int_res_2[i]), .ch_res_3(int_res_3[i])
		);	
		assign ch_res_1[i] = int_res_1[i] | reset_1;
		assign ch_res_2[i] = int_res_2[i] | reset_2;
		assign ch_res_3[i] = int_res_3[i] | reset_3;
	end
	endgenerate
	
endmodule 

module ch_gate_clk(
	input             clk,    //global clk
	input             resetB, //global reset
	
	input             ch_en,  //ch enable
	output            ch_clk, //channel clock gated
	output reg        ch_res, //channel reset 
	
	input             en_clk_voted,
	output            en_clk,
	input       [1:0] state_voted,
	output reg  [1:0] state
	); 
	reg               en_clk_latched;  
	
	always @(clk, en_clk_voted) begin
		if (~clk) en_clk_latched =  en_clk_voted;
	end
	
	assign ch_clk = clk & en_clk_latched;      
	
	always @(posedge clk or negedge resetB) begin
		if(~resetB) state <=  2'h0; 
		else  if(~ch_en) 
			      state <=  2'h0;
			else case(state_voted)
				2'h0: state <=  2'h1;    
				2'h1: state <=  2'h2;
				2'h2: state <=  2'h3;
				2'h3: state <=  2'h3;  
			endcase
	end
	
	always @(negedge clk or negedge resetB) begin
		if(~resetB) ch_res <= 1'b1;
		else ch_res <= ~(state_voted[1] & state_voted[0]);
	end 
	
	assign en_clk = (state_voted[1] | state_voted[0]);
	
endmodule

module clkg_voter(
	input in1, in2, in3,
	output out
	);
	assign out = (in1 != in2) ? in3 : in1;
	//clkg_voter name (.in1(), .in2(), .in3(), .out());
endmodule 

module ch_gate_clk_tri(
	input       clk_1,        clk_2,        clk_3,      //global clk
	input       resetB_1,     resetB_2,     resetB_3,   //global reset
	input       ch_en_1,      ch_en_2,      ch_en_3,    //ch enable
	output      ch_clk_1,     ch_clk_2,     ch_clk_3,   //channel clock gated
	output      ch_res_1,     ch_res_2,     ch_res_3    //channel reset 
	); 
	wire        en_clk_int_1, en_clk_int_2, en_clk_int_3; 
	wire  [1:0] state_int_1,  state_int_2,  state_int_3;  
	wire        en_clk_1,     en_clk_2,     en_clk_3;     
	wire  [1:0] state_1,      state_2,      state_3;  
	wire        ch_res_int_1, ch_res_int_2, ch_res_int_3;       
	
	// the connection are mada in this way in order to avoid unwanted 
	// optimizations on this chritical module
	
	clkg_voter clkg_res_v1(.in1(ch_res_int_1),   .in2(ch_res_int_2),   .in3(ch_res_int_3),   .out(ch_res_1));
	clkg_voter clkg_en_v1 (.in1(en_clk_int_1),   .in2(en_clk_int_2),   .in3(en_clk_int_3),   .out(en_clk_1));
	clkg_voter clkg_st0_v1(.in1(state_int_1[0]), .in2(state_int_2[0]), .in3(state_int_3[0]), .out(state_1[0]));
	clkg_voter clkg_st1_v1(.in1(state_int_1[1]), .in2(state_int_2[1]), .in3(state_int_3[1]), .out(state_1[1]));
	
	ch_gate_clk ch_gate_clk_1(
		.clk(clk_1),    
		.resetB(resetB_1),
		.ch_en(ch_en_1),  
		
		.ch_clk(ch_clk_1), 
		.ch_res(ch_res_int_1), 
		
		.en_clk_voted(en_clk_1),
		.en_clk(en_clk_int_1),
		.state_voted(state_1),
		.state(state_int_1)
	); 

	clkg_voter clkg_res_v2(.in2(ch_res_int_1),   .in3(ch_res_int_2),   .in1(ch_res_int_3),   .out(ch_res_2));
	clkg_voter clkg_en_v2 (.in2(en_clk_int_1),   .in3(en_clk_int_2),   .in1(en_clk_int_3),   .out(en_clk_2));
	clkg_voter clkg_st0_v2(.in2(state_int_1[0]), .in3(state_int_2[0]), .in1(state_int_3[0]), .out(state_2[0]));
	clkg_voter clkg_st1_v2(.in2(state_int_1[1]), .in3(state_int_2[1]), .in1(state_int_3[1]), .out(state_2[1]));

	ch_gate_clk ch_gate_clk_2(
		.clk(clk_2),    
		.resetB(resetB_2),
		.ch_en(ch_en_2),  
		
		.ch_clk(ch_clk_2), 
		.ch_res(ch_res_int_2), 
		
		.en_clk_voted(en_clk_2),
		.en_clk(en_clk_int_2),
		.state_voted(state_2),
		.state(state_int_2)
	); 

	clkg_voter clkg_res_v3(.in3(ch_res_int_1),   .in1(ch_res_int_2),   .in2(ch_res_int_3),   .out(ch_res_3));
	clkg_voter clkg_en_v3 (.in3(en_clk_int_1),   .in1(en_clk_int_2),   .in2(en_clk_int_3),   .out(en_clk_3));
	clkg_voter clkg_st0_v3(.in3(state_int_1[0]), .in1(state_int_2[0]), .in2(state_int_3[0]), .out(state_3[0]));
	clkg_voter clkg_st1_v3(.in3(state_int_1[1]), .in1(state_int_2[1]), .in2(state_int_3[1]), .out(state_3[1]));

	ch_gate_clk ch_gate_clk_3(
		.clk(clk_3),    
		.resetB(resetB_3),
		.ch_en(ch_en_3),  
		
		.ch_clk(ch_clk_3), 
		.ch_res(ch_res_int_3), 
		
		.en_clk_voted(en_clk_3),
		.en_clk(en_clk_int_3),
		.state_voted(state_3),
		.state(state_int_3)
	); 
	
endmodule	
	

	
	
	
	
	
	
	
	
	
	
