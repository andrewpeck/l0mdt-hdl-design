
/////////////////////////////////////////////////////////////////////////////
// Design Name:....GBT_SCA                                                 //
// Module Name:....SEU_counter + NCTR_majority_voter (TRI Version)         //
// Description:....- Counter of Single event upset                         //
//                 - Specific Majority Voter for reducing critical path    //
// Company:........CERN (PH-ESE)                                           //
// Made by:........Alessandro Caratelli                                    //
//                                                                         //
// Date:...........17/October/2013  - Created                              //
//                 10/December/2013 - Changed                              //
/////////////////////////////////////////////////////////////////////////////

//`define cnt_TB
//`define mjv_TB

`include "global_defines.v"
`define log4(N) ((N<4)?1:((N<16)?2:((N<64)?3:((N<256)?4:5)))) 

`timescale 1ns/1ps
module SEU_count_mono (

	input  clk,
	input  res,
	input  clear,
	input  err,
	
	output reg [15:0] SEU_count_o,
	input      [15:0] SEU_count_i,
	output reg [1:0]  cnt_o,
	input      [1:0]  cnt_i,
	output wire       inc_o,
	input             inc_i
	);
	
	always @(posedge clk or posedge res) begin
            if(res)           SEU_count_o <= {16{1'b0}};
            else if (clear)   SEU_count_o <= {16{1'b0}};
            else if (inc_i)   SEU_count_o <= SEU_count_i + 16'h1;
            else              SEU_count_o <= SEU_count_i;
      end   
	
	always @(posedge clk or posedge res) begin
		if(res) cnt_o <= 1'b0;           
		else 	if(err) cnt_o <= (&cnt_i) ? 2'b01 : (cnt_i + 2'b01);   
			else    cnt_o <= 2'b00;
	end
	
	assign inc_o = (cnt_i == 2'b01);
	
endmodule

`timescale 1ns/1ps		
module SEU_voter # (
	parameter  WIDTH = 1
 	)(
	input      [(WIDTH-1):0] in1, in2, in3,
	output reg [(WIDTH-1):0] out
	);
	
	// synopsys template
	
	always @(*) out = vote (in1,in2,in3);	
	
	function vote_atom;
		input in1,in2,in3;
	begin
		if (in1 != in2) vote_atom = in3;
		else            vote_atom = in1;
	end
	endfunction
	
	function [(WIDTH-1):0] vote;
		input   [(WIDTH-1):0]   in1, in2, in3;
		integer i;
	begin
		for (i=0; i<WIDTH; i=i+1)
			vote[i] = vote_atom( in1[i], in2[i], in3[i] );
	end
	endfunction
    
endmodule	

`timescale 1ns/1ps	
module SEU_counter(
      input  clk_1,   clk_2,   clk_3,
      input  res_1,   res_2,   res_3,
      input  clear_1, clear_2, clear_3,
      input  err_1,   err_2,   err_3, 
      
      output wire [15:0] SEU_count_1, 
      output wire [15:0] SEU_count_2,
      output wire [15:0] SEU_count_3
      );  
      
	wire [15:0] SEU_count_1v, SEU_count_2v, SEU_count_3v;
	wire  [1:0] cnt_1,        cnt_2,        cnt_3;
	wire  [1:0] cnt_1v,       cnt_2v,       cnt_3v;
	wire        inc_1,        inc_2,        inc_3;
	wire        inc_1v,       inc_2v,       inc_3v;
      
	SEU_count_mono SEU_cnt_1 (
 		.clk(clk_1),
		.res(res_1),
		.clear(clear_1),
		.err(err_1),
		.SEU_count_o(SEU_count_1),
		.SEU_count_i(SEU_count_1v),
		.cnt_o(cnt_1),
		.cnt_i(cnt_1v),
		.inc_o(inc_1),
		.inc_i(inc_1v)     
      );
      
	SEU_count_mono SEU_cnt_2 (
 		.clk(clk_2),
		.res(res_2),
		.clear(clear_2),
		.err(err_2),
		.SEU_count_o(SEU_count_2),
		.SEU_count_i(SEU_count_2v),
		.cnt_o(cnt_2),
		.cnt_i(cnt_2v),
		.inc_o(inc_2),
		.inc_i(inc_2v)     
      );  
          
	SEU_count_mono SEU_cnt_3 (
 		.clk(clk_3),
		.res(res_3),
		.clear(clear_3),
		.err(err_3),
		.SEU_count_o(SEU_count_3),
		.SEU_count_i(SEU_count_3v),
		.cnt_o(cnt_3),
		.cnt_i(cnt_3v),
		.inc_o(inc_3),
		.inc_i(inc_3v)     
      ); 
          
      SEU_voter # (1+16+2) SEU_voter_1 (
      	.in1({cnt_1[1:0],  inc_1,  SEU_count_1[15:0] }),
      	.in2({cnt_2[1:0],  inc_2,  SEU_count_2[15:0] }),
      	.in3({cnt_3[1:0],  inc_3,  SEU_count_3[15:0] }),
      	.out({cnt_1v[1:0], inc_1v, SEU_count_1v[15:0]})
      );
      
      SEU_voter # (1+16+2) SEU_voter_2 (
      	.in1({cnt_2[1:0],  inc_2,  SEU_count_2[15:0] }),
      	.in2({cnt_3[1:0],  inc_3,  SEU_count_3[15:0] }),
      	.in3({cnt_1[1:0],  inc_1,  SEU_count_1[15:0] }),
      	.out({cnt_2v[1:0], inc_2v, SEU_count_2v[15:0]})
      );
      
      SEU_voter # (1+16+2) SEU_voter_3 (
      	.in1({cnt_3[1:0],  inc_3,  SEU_count_3[15:0] }),
      	.in2({cnt_1[1:0],  inc_1,  SEU_count_1[15:0] }),
      	.in3({cnt_2[1:0],  inc_2,  SEU_count_2[15:0] }),
      	.out({cnt_3v[1:0], inc_3v, SEU_count_3v[15:0]})
      );


endmodule

`timescale 1ns/1ps
module majority_error (
	input  [460:0] in1, in2, in3,
	output wire     err
	);
	reg  [459:0]   err0;
	wire [114:0]   err1;
	wire [28:0]    err2;
	wire [6:0]     err3;
	wire [1:0]     err4;
	integer        i;
	
	function err_atom;
		input in1,in2,in3;
    	   begin
		if (in1 != in2) err_atom = 1'b1;
		else if (in2 != in3) err_atom = 1'b1;
		     else err_atom = 1'b0;
    	   end
	endfunction

	always @(*) for (i=0; i<460; i=i+1) err0[i] = err_atom(in1[i],in2[i],in3[i]);
	
	mvor4 me_or_0[114:0] (.Z(err1[114:0]), .A(err0[114:0]), .B(err0[229:115]), .C(err0[344:230]), .D(err0[459:345]));	
	mvor4 me_or_1[27:0]  (.Z(err2[27:0]),  .A(err1[27:0]),  .B(err1[55:28]),   .C(err1[83:56]),   .D(err1[111:84]));
	mvor3 me_or_1b       (.Z(err2[28]),    .A(err1[112]),   .B(err1[113]),     .C(err1[114]));	
	mvor4 me_or_2[6:0]   (.Z(err3[6:0]),   .A(err2[6:0]),   .B(err2[13:7]),    .C(err2[20:14]),   .D(err2[27:21]));	
	mvor4 me_or_3a       (.Z(err4[0]),     .A(err3[0]),     .B(err3[1]),       .C(err3[2]),       .D(err3[3]));
	mvor4 me_or_3b       (.Z(err4[1]),     .A(err3[4]),     .B(err3[5]),       .C(err3[6]),       .D(err2[28]));
	mvor2 me_or_4        (.Z(err),         .A(err4[0]),     .B(err4[1]));
 
endmodule

module mvor4(
	input A,B,C,D,
	output wire Z
	);
	// cadence dc::set_dont_touch or4b_inst
	OR4_B or4b_inst (.Z(Z),.A(A),.B(B),.C(C),.D(D));
endmodule
module mvor3(
	input A,B,C,
	output wire Z
	);
	// cadence dc::set_dont_touch or3b_inst
	OR3_B or3b_inst (.Z(Z),.A(A),.B(B),.C(C));
endmodule
module mvor2(
	input A,B,
	output wire Z
	);
	// cadence dc::set_dont_touch or2b_inst
	OR2_B or2b_inst (.Z(Z),.A(A),.B(B));
endmodule




















	
	
/////////////////////////// TB //////////////////////////////	
	
`ifdef cnt_TB
`timescale 1ps / 1ps
module SEU_cnt_TB();	
	//`define clk_skew
      reg     res, clear, err;
      reg     clk_1, clk_2, clk_3;
      wire    [15:0] SEU_count_1, SEU_count_2, SEU_count_3; 
      reg     [15:0] cnt_TB;
	integer ran;	
	initial begin
		clk_1 = 1'b0; clk_2 = 1'b0; clk_3 = 1'b0; 
		forever #(12500) clk_1 = ~clk_1;
	end
	
	always @(clk_1) begin
		`ifdef clk_skew
			clk_2 = #({$random}%2000) clk_1;
			clk_3 = #({$random}%2000) clk_1;
		`else
			clk_2 = clk_1; clk_3 = clk_1;
		`endif
	end
	
	initial begin
		clear = 1'b0; err = 1'b0; ran = 1'b0;
		#1000000;
		forever #(50000+{$random}%500000) begin
			err = 1'b1;
			ran = (25000+{$random}%125000);
			err = #ran 1'b0;
		end
	
	end	
	integer i;
	always @ (posedge err) begin
		@(posedge clk_1) cnt_TB = cnt_TB + 1;
		if(err) @(posedge clk_1);
		if(err) @(posedge clk_1);
		if(err) @(posedge clk_1) if(err) cnt_TB = cnt_TB + 1;
	end

	
	always @(negedge err) begin
		#100;@(posedge clk_1)#100;
		if (SEU_count_1 != cnt_TB) $display("@%d: Error_1! [%d][%d]",$time,SEU_count_1,cnt_TB);
		if (SEU_count_1 != cnt_TB) $display("@%d: Error_1! [%d][%d]",$time,SEU_count_1,cnt_TB);
		if (SEU_count_1 != cnt_TB) $display("@%d: Error_1! [%d][%d]",$time,SEU_count_1,cnt_TB);		
	end
	
	initial begin
		res = 1'b1;
		cnt_TB = 0;
		#200000; res = 1'b0;
	end	
      SEU_counter SEU_TB(
		.clk_1(clk_1),
		.clk_2(clk_2),
		.clk_3(clk_3),
		.res_1(res),
		.res_2(res),
		.res_3(res),
		.clear_1(clear),
		.clear_2(clear),
		.clear_3(clear),
		.err_1(err),
		.err_2(err),
		.err_3(err),
		.SEU_count_1(SEU_count_1),
		.SEU_count_2(SEU_count_2),
		.SEU_count_3(SEU_count_3)
      ); 
endmodule
`endif	

`ifdef mjv_TB
module TB();

	parameter WIDTH = 445;
	
	reg   [(WIDTH-1):0]  in1, in2, in3;
	wire  [(WIDTH-1):0]  out;
	wire                 err;
	
 	NodeCtrl_MajorityVoter # (
		.WIDTH(445)
	)MV_test(
		.in1(in1), .in2(in2), .in3(in3),
		.out(out), .err(err)
	);	
	
	
	initial begin
		in1 = 0; 
		in2 = 0; 
		in3 = 0;
	end
	
	initial forever #1000 begin
			in1 = 1;
			#100; in1 = 0;
	end
	
	initial forever #1000 begin
			in2 = 1;
			#100; in2 = 0;
	end	
	initial forever #1000 begin
			in3 = 1;
			#100; in3 = 0;
	end		
endmodule	
`endif	

	
	
	
	
	
	




	
////////////////// old version (monostable) //////////////////////////	
	
/*
module SEU_counter(
      input  clk_1,   clk_2,   clk_3,
      input  res_1,   res_2,   res_3,
      input  clear_1, clear_2, clear_3,
      input  err_1,   err_2,   err_3, 
      
      output wire [15:0]  SEU_count_1, 
      output reg  [15:0]  SEU_count_2,
      output reg  [15:0]  SEU_count_3
      );  
      
      reg  [15:0]  SEU_count;
      wire inc, inc_1, inc_2, inc_3; 
      
      SEUmonostable SEU_mon1(.clk(clk_1), .res(res_1), .in(err_1), .out(inc_2));
      SEUmonostable SEU_mon2(.clk(clk_2), .res(res_2), .in(err_2), .out(inc_3));
      SEUmonostable SEU_mon3(.clk(clk_3), .res(res_3), .in(err_3), .out(inc)  );     
      	
      always @(posedge clk_1 or posedge res_1) begin
            if(res_1)           SEU_count_2 <= {16{1'b0}};
            else if (clear_1)   SEU_count_2 <= {16{1'b0}};
            else if (inc_1)     SEU_count_2 <= SEU_count_1 + 16'h1;
            else                SEU_count_2 <= SEU_count_1;
      end   
      always @(posedge clk_2 or posedge res_2) begin
            if(res_2)           SEU_count_3 <= {16{1'b0}};
            else if (clear_2)   SEU_count_3 <= {16{1'b0}};
            else if (inc_2)     SEU_count_3 <= SEU_count_2 + 16'h1;
            else                SEU_count_3 <= SEU_count_2;
      end
      always @(posedge clk_3 or posedge res_3) begin
            if(res_3)           SEU_count <= {16{1'b0}};
            else if (clear_3)   SEU_count <= {16{1'b0}};
            else if (inc_3)     SEU_count <= SEU_count_3 + 16'h1;
            else                SEU_count <= SEU_count_3;
      end
      
      majority_voter #(.WIDTH(1)) mvMonostable (
		.in1(inc_2),
		.in2(inc_3),
		.in3(inc),
		.out(inc_1),
		.err()
	);	
      majority_voter #(.WIDTH(16)) mv_SEUount (
		.in1(SEU_count_2),
		.in2(SEU_count_3),
		.in3(SEU_count),
		.out(SEU_count_1),
		.err()
	);	   
endmodule

module SEUmonostable(
      input       clk,
      input       res,
      input       in,
      output reg  out
      ); 
      wire areset;
      reg  intq;
      always@ (posedge in or posedge areset) 
            if(areset)  intq <= 1'b0; 
            else        intq <= 1'b1;
      always@ (posedge clk or posedge res) 
            if(res) out <= 1'b0;
            else    out <= intq;
      assign areset = (~clk & out)|res;     
endmodule

*/



/*
module single_vote (
	input  i1, i2, i3,
	output reg er
	);
	always @(*) begin
		if (i1 != i2) er = 1'b1;
		else 	if (i2 != i3) er = 1'b1;
			else er = 1'b0;
	end
endmodule

module or_mv # (
	parameter dim = 445
	)(
	input  [dim-1:0] in,
	output wire [dim/4:0] out
);
	genvar i;
	or or1[dim/4-1:0] (
		out[dim/4-1:0], 
		in[(dim/4)-1:0],
		in[(dim/4)*2-1:(dim/4)],
		in[(dim/4)*3-1:(dim/4)*2],
		in[(dim/4)*4-1:(dim/4*3)]
	);
	generate 
	case (dim % 4) 
		0: assign out[dim/4] = 1'b0;
		1: assign out[dim/4] = in[dim-1];
		2: or(out[dim/4],in[dim-1],in[dim-2]);
		3: or(out[dim/4],in[dim-1],in[dim-2],in[dim-3]);
	endcase 
	endgenerate 
endmodule	


module NodeCtrl_ErrCnt 
	input  [(WIDTH-1):0]  in1, in2, in3,
	output                err
	);
	wire [(WIDTH-1):0]  vect0;
	wire [WIDTH/4-1:0]  vect1;
	wire [WIDTH/16-1:0] vect2;
	wire [WIDTH/64-1:0] vect3;
	genvar lev;
		
	single_vote svote[(WIDTH-1):0] (
		.i1(in1[(WIDTH-1):0]),
		.i2(in2[(WIDTH-1):0]),
		.i3(in3[(WIDTH-1):0]),
		.er(vect0[(WIDTH-1):0])
	); 	

	generate 
		if(`log4(WIDTH)<2) assign err = (|vect0); 
		else begin
			or_mv #(.dim(WIDTH)) or_lev0 (.in(vect0[(WIDTH-1):0]) );	   
			if(`log4(WIDTH)<3) assign err = (|vect1); 
			else begin
				or_mv #(.dim(WIDTH/4)) or_lev1 (.in(vect1[WIDTH/4-1:0]));
				if(`log4(WIDTH)<4) assign err = (|vect2); 
				else begin
					or_mv #(.dim(WIDTH/16)) or_lev2 (.in(vect2[WIDTH/16-1:0]));
					assign err = (|vect3);
				end	
			end
		end	   		
	endgenerate

endmodule
*/


