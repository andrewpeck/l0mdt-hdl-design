//-----------------------------------------------------
// Design Name : DFFR_E
// File Name   : cadence.v
// Function    : D flip-flop async reset
// Coder       : J. Mendez
//-----------------------------------------------------

module DFFR_E (
	RN  , // Reset input
	CLK , // Clock Input
	D   , // Data Input
	Q   , // Q output
	QBAR  // QBAR output
);

	//-----------Input Ports---------------
	input D, CLK, RN ; 

	//-----------Output Ports---------------
	output Q, QBAR;

	//------------Internal Variables--------
	reg q, qbar;

	//-------------Code Starts Here---------
	always @ ( posedge CLK or negedge RN)
		if (~RN) begin
		  q <= 1'b0;
		  qbar <= 1'b1;
		end  else begin
		  q <= D;
		  qbar <= ~D;
		end
		
	assign Q = q;
	assign QBAR = qbar;
	
endmodule //End Of Module dff_sync_reset

//-----------------------------------------------------
// Design Name : DELAY6_C
// File Name   : cadence.v
// Function    : Delay
// Coder       : J. Mendez
//-----------------------------------------------------

`timescale 1ns / 1ps

module DELAY6_C(
    input A,
    output Z
    );
	assign #0.5 Z = A;
 endmodule

//-----------------------------------------------------
// Design Name : INVERT_A
// File Name   : cadence.v
// Function    : Inverter
// Coder       : J. Mendez
//-----------------------------------------------------
module INVERT_A (
    input A,
    output Z
);
	assign Z = ~A;	
endmodule

//-----------------------------------------------------
// Design Name : OR3_B
// File Name   : cadence.v
// Function    : Oring
// Coder       : J. Mendez
//-----------------------------------------------------
module OR3_B (
    input A,
    input B,
    input C,
    output Z
);
	assign Z = A | B | C;	
endmodule

//-----------------------------------------------------
// Design Name : BUFFER_F
// File Name   : cadence.v
// Function    : Buffer
// Coder       : J. Mendez
//-----------------------------------------------------
module BUFFER_F (
    input A,
    output Z
);
	assign Z = A;	
endmodule

//-----------------------------------------------------
// Design Name : BUFFER_C
// File Name   : cadence.v
// Function    : Buffer
// Coder       : J. Mendez
//-----------------------------------------------------
module BUFFER_C (
    input A,
    output Z
);
	assign Z = A;	
endmodule

//-----------------------------------------------------
// Design Name : AND2_B
// File Name   : cadence.v
// Function    : Oring
// Coder       : J. Mendez
//-----------------------------------------------------
module AND2_B (
    input A,
    input B,
    output Z
);
	assign Z = A & B;	
endmodule

//-----------------------------------------------------
// Design Name : ADDF_F
// File Name   : cadence.v
// Function    : Adder
// Coder       : J. Mendez
//-----------------------------------------------------
module ADDF_F (
    input A,
    input B,
    input CIN,
    output COUT,
	output SUM
);
	assign SUM = A ^ B ^ CIN;	
	assign COUT = ((A ^ B) & CIN) | (A & B);	
endmodule

//-----------------------------------------------------
// Design Name : OR4_B
// File Name   : cadence.v
// Function    : Oring
// Coder       : J. Mendez
//-----------------------------------------------------
module OR4_B (
    input A,
    input B,
    input C,
    input D,
    output Z
);
	assign Z = A | B | C | D;	
endmodule

//-----------------------------------------------------
// Design Name : OR2_B
// File Name   : cadence.v
// Function    : Oring
// Coder       : J. Mendez
//-----------------------------------------------------
module OR2_B (
    input A,
    input B,
    output Z
);
	assign Z = A | B;	
endmodule