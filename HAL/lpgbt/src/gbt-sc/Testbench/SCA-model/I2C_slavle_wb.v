///////////////////////////////////////////////////
//
// i2c_slave_TMR.v
// Created on Jun  3  2008 
// by Sandro Bonacini
// CERN PH/ESE/ME
//
///////////////////////////////////////////////////
`timescale 1ps/1ps

module i2c_slave ( SCL1, resetB1, clk1, wb_dat_i1, wb_we1, wb_stb1,  wb_cyc1,
			wb_ack1, chip_id1, ADDR10BIT1, INCREMENT_ADDR1, wb_dat_o1, SDAo1,
			SDAen1, wb_adr1, SDAi1,  SCL2, resetB2, clk2, wb_dat_i2, wb_we2,
			wb_stb2,  wb_cyc2, wb_ack2, chip_id2, ADDR10BIT2, INCREMENT_ADDR2,
			wb_dat_o2, SDAo2, SDAen2, wb_adr2, SDAi2, SCL3, resetB3, clk3,
			wb_dat_i3, wb_we3, wb_stb3,  wb_cyc3, wb_ack3, chip_id3,
			ADDR10BIT3, INCREMENT_ADDR3, wb_dat_o3, SDAo3, SDAen3, wb_adr3,
			SDAi3 );

	parameter [3:0] CHIP_ID_WIDTH = 3;

    input     	    SCL1;
	input			SDAi1;
    input  	    resetB1;
    input   	    clk1;
	input [7:0] wb_dat_i1;     // databus input
	input       wb_ack1;     // bus cycle acknowledge output
	input [CHIP_ID_WIDTH-1:0] chip_id1;
	input ADDR10BIT1;
	input INCREMENT_ADDR1;
	output        wb_we1;      // write enable input
	output        wb_stb1;     // stobe/core select signal
	output        wb_cyc1;     // valid bus cycle input
	output [7:0] wb_dat_o1;     // databus output
	output SDAo1;
	output SDAen1;
	output [9-CHIP_ID_WIDTH:0] wb_adr1;

    input     	    SCL2;
	input			SDAi2;
    input  	    resetB2;
    input   	    clk2;
	input [7:0] wb_dat_i2;     // databus input
	input       wb_ack2;     // bus cycle acknowledge output
	input [CHIP_ID_WIDTH-1:0] chip_id2;
	input ADDR10BIT2;
	input INCREMENT_ADDR2;
	output        wb_we2;      // write enable input
	output        wb_stb2;     // stobe/core select signal
	output        wb_cyc2;     // valid bus cycle input
	output [7:0] wb_dat_o2;     // databus output
	output SDAo2;
	output SDAen2;
	output [9-CHIP_ID_WIDTH:0] wb_adr2;

    input     	    SCL3;
	input			SDAi3;
    input  	    resetB3;
    input   	    clk3;
	input [7:0] wb_dat_i3;     // databus input
	input       wb_ack3;     // bus cycle acknowledge output
	input [CHIP_ID_WIDTH-1:0] chip_id3;
	input ADDR10BIT3;
	input INCREMENT_ADDR3;
	output        wb_we3;      // write enable input 
	output        wb_stb3;     // stobe/core select signal
	output        wb_cyc3;     // valid bus cycle input
	output [7:0] wb_dat_o3;     // databus output
	output SDAo3;
	output SDAen3;
	output [9-CHIP_ID_WIDTH:0] wb_adr3;

	wire [7:0] wb_dat_oV;     // databus wire
	wire [9-CHIP_ID_WIDTH:0] wb_adrV;
	
	
    wire [1:0]  state1;
	wire [3:0] i1;
	wire [8:0] watchdog1;
	wire [7:0] buffer1;

    wire [1:0]  state2;
	wire [3:0] i2;
	wire [8:0] watchdog2;
	wire [7:0] buffer2;

    wire [1:0]  state3;
	wire [3:0] i3;
	wire [8:0] watchdog3;
	wire [7:0] buffer3;

    wire [1:0]  stateV;
	wire [3:0] iV;
	wire [8:0] watchdogV;
	wire [7:0] bufferV;


	i2c_slave_iostate slave1 ( 
		.SCL(SCL1),
		.SDAi(SDAi1),
		.wb_adr(wb_adr1),
		.wb_dat_i(wb_dat_i1),
		.wb_dat_o(wb_dat_o1),
		.SDAo(SDAo1),
		.SDAen(SDAen1),
		.state(state1),
		.wb_ack(wb_ack1),
		.wb_cyc(wb_cyc1),
		.wb_stb(wb_stb1),
		.wb_we(wb_we1),
		.i(i1),
		.buffer(buffer1),
		.i_voted(iV),
		.buffer_voted(bufferV),
		.wb_dat_o_voted(wb_dat_oV),
		.SDAo_voted(SDAoV),
		.SDAen_voted(SDAenV),
		.state_voted(stateV),
		.wb_adr_voted(wb_adrV),
		.wb_we_voted(wb_weV),
		.wb_cyc_voted(wb_cycV),
		.readcycle(readcycle1),
		.selected(selected1),
		.readcycle_voted(readcycleV),
		.selected_voted(selectedV),
		.watchdog(watchdog1),
		.watchdog_voted(watchdogV),
		.chip_id(chip_id1),
		.ADDR10BIT(ADDR10BIT1),
		.INCREMENT_ADDR(INCREMENT_ADDR1),
		.clk(clk1),
		.en_clk(en_clk1),
		.en_clk_voted(en_clkV),
		.resetB(resetB1)
	);

	i2c_slave_iostate slave2 ( 
		.SCL(SCL2),
		.SDAi(SDAi2),
		.wb_adr(wb_adr2),
		.wb_dat_i(wb_dat_i2),
		.wb_dat_o(wb_dat_o2),
		.SDAo(SDAo2),
		.SDAen(SDAen2),
		.state(state2),
		.wb_ack(wb_ack2),
		.wb_cyc(wb_cyc2),
		.wb_stb(wb_stb2),
		.wb_we(wb_we2),
		.i(i2),
		.buffer(buffer2),
		.i_voted(i1),
		.buffer_voted(buffer1),
		.wb_dat_o_voted(wb_dat_o1),
		.SDAo_voted(SDAo1),
		.SDAen_voted(SDAen1),
		.state_voted(state1),
		.wb_adr_voted(wb_adr1),
		.wb_we_voted(wb_we1),
		.wb_cyc_voted(wb_cyc1),
		.readcycle(readcycle2),
		.selected(selected2),
		.readcycle_voted(readcycle1),
		.selected_voted(selected1),
		.watchdog(watchdog2),
		.watchdog_voted(watchdog1),
		.chip_id(chip_id2),
		.ADDR10BIT(ADDR10BIT2),
		.INCREMENT_ADDR(INCREMENT_ADDR2),
		.clk(clk2),
		.en_clk(en_clk2),
		.en_clk_voted(en_clk1),
		.resetB(resetB2)
	);

	i2c_slave_iostate slave3 ( 
		.SCL(SCL3),
		.SDAi(SDAi3),
		.wb_adr(wb_adr3),
		.wb_dat_i(wb_dat_i3),
		.wb_dat_o(wb_dat_o3),
		.SDAo(SDAo3),
		.SDAen(SDAen3),
		.state(state3),
		.wb_ack(wb_ack3),
		.wb_cyc(wb_cyc3),
		.wb_stb(wb_stb3),
		.wb_we(wb_we3),
		.i(i3),
		.buffer(buffer3),
		.i_voted(i2),
		.buffer_voted(buffer2),
		.wb_dat_o_voted(wb_dat_o2),
		.SDAo_voted(SDAo2),
		.SDAen_voted(SDAen2),
		.state_voted(state2),
		.wb_adr_voted(wb_adr2),
		.wb_we_voted(wb_we2),
		.wb_cyc_voted(wb_cyc2),
		.readcycle(readcycle3),
		.selected(selected3),
		.readcycle_voted(readcycle2),
		.selected_voted(selected1),
		.watchdog(watchdog3),
		.watchdog_voted(watchdog2),
		.chip_id(chip_id3),
		.ADDR10BIT(ADDR10BIT3),
		.INCREMENT_ADDR(INCREMENT_ADDR3),
		.clk(clk3),
		.en_clk(en_clk3),
		.en_clk_voted(en_clk2),
		.resetB(resetB3)
	);

	majority_voter #(45) mv (
		.in1({en_clk1, i1, buffer1, wb_dat_o1, SDAo1, SDAen1, state1, wb_adr1, wb_we1, wb_cyc1, readcycle1, selected1, watchdog1}),
		.in2({en_clk2, i2, buffer2, wb_dat_o2, SDAo2, SDAen2, state2, wb_adr2, wb_we2, wb_cyc2, readcycle2, selected2, watchdog2}),
		.in3({en_clk3, i3, buffer3, wb_dat_o3, SDAo3, SDAen3, state3, wb_adr3, wb_we3, wb_cyc3, readcycle3, selected3, watchdog3}),
		.out({en_clkV, iV, bufferV, wb_dat_oV, SDAoV, SDAenV, stateV, wb_adrV, wb_weV, wb_cycV, readcycleV, selectedV, watchdogV}),
		.err()
	);

endmodule


///////////////////////////////////////////////////
//
// i2c_slave_iostate.v
// Created on Jun  3  2008 
// by Sandro Bonacini
// CERN PH/ESE/ME
//
///////////////////////////////////////////////////
`timescale 1ps/1ps

module i2c_slave_iostate ( SCL, resetB, clk, wb_dat_i, wb_we, wb_stb,  wb_cyc,
				wb_ack, chip_id, ADDR10BIT, INCREMENT_ADDR, wb_dat_o, SDAo,
				SDAen, wb_adr, SDAi, wb_dat_o_voted, wb_adr_voted,   state, i,
				watchdog, buffer, state_voted, i_voted, watchdog_voted,
				buffer_voted, en_clk, selected, readcycle, en_clk_voted,
				selected_voted, readcycle_voted, wb_we_voted, SDAen_voted,
				SDAo_voted, wb_cyc_voted );


	parameter [3:0] CHIP_ID_WIDTH = 3;


    input     	    SCL;
	input			SDAi;
    input  	    resetB;
    input   	    clk;
	input [7:0] wb_dat_i;     // databus input
	input       wb_ack;     // bus cycle acknowledge output
	input [CHIP_ID_WIDTH-1:0] chip_id;
	input ADDR10BIT;
	input INCREMENT_ADDR;
	output        wb_we;      // write enable input
	output        wb_stb;     // stobe/core select signal
	output        wb_cyc;     // valid bus cycle input
	output [7:0] wb_dat_o;     // databus output
	output SDAo;
	output SDAen;
	output [9-CHIP_ID_WIDTH:0] wb_adr;


	input [7:0] wb_dat_o_voted;     // databus wire
	input [9-CHIP_ID_WIDTH:0] wb_adr_voted;
	
	
    output [1:0]  state;
	output [3:0] i;
	output [8:0] watchdog;
	output [7:0] buffer;
	output en_clk;
	output selected;
	output readcycle;
    input [1:0]  state_voted;
	input [3:0] i_voted;
	input [8:0] watchdog_voted;
	input [7:0] buffer_voted;
	input en_clk_voted;
	input selected_voted;
	input readcycle_voted;
	input wb_we_voted;
	input SDAen_voted;
	input SDAo_voted;
	input wb_cyc_voted;

	I2C_synchronizer synch1 ( 
		.S_SCL(S_SCL),
		.clk40(clk),
		.SCL(SCL),
		.SDA(SDAi),
		.START(START),
		.STOP(STOP),
		.resetB(resetB),
		.S_SDA(S_SDA)
	);

//	i2c_slave_iostate #(.ADDR10BIT(1),.CHIP_ID(4'b0100)) slave  (
	i2c_control #(.CHIP_ID_WIDTH(CHIP_ID_WIDTH)) slave1  (
		.SDAi(S_SDA),
		.SCL(S_SCL),
		.START(START | START_late),
		.STOP(STOP),
		.resetB(resetB),
		.clk(clkg),
		.wb_adr(wb_adr),
		.wb_dat_i(wb_dat_i),
		.wb_dat_o(wb_dat_o),
		.SDAo(SDAo),
		.SDAen(SDAen),
		.state(state),
		.wb_ack(wb_ack),
		.wb_cyc(wb_cyc),
		.wb_stb(wb_stb),
		.wb_we(wb_we),
		.i(i),
		.buffer(buffer),
		.i_voted(i_voted),
		.buffer_voted(buffer_voted),
		.wb_dat_o_voted(wb_dat_o_voted),
		.SDAo_voted(SDAo_voted),
		.SDAen_voted(SDAen_voted),
		.state_voted(state_voted),
		.wb_adr_voted(wb_adr_voted),
		.wb_we_voted(wb_we_voted),
		.wb_cyc_voted(wb_cyc_voted),
		.readcycle(readcycle),
		.selected(selected),
		.readcycle_voted(readcycle_voted),
		.selected_voted(selected_voted),
		.watchdog(watchdog),
		.watchdog_voted(watchdog_voted),
		.chip_id(chip_id),
		.ADDR10BIT(ADDR10BIT),
		.INCREMENT_ADDR(INCREMENT_ADDR)
	);
	
	i2c_clock_gating i2c_clock_gating1 (
		.START(START),
		.START_late(START_late),
		.clk(clk),
		.clkg(clkg),
		.en_clk(en_clk),
		.en_clk_voted(en_clk_voted),
		.STOP(STOP | (state_voted==0)),
		.resetB(resetB)
	);


endmodule

///////////////////////////////////////////////////
//
// i2c_control.v
// Created on Jun  3  2008 
// by Sandro Bonacini
// CERN PH/ESE/ME
//
///////////////////////////////////////////////////
`timescale 1ps/1ps

module i2c_control (SDAi, SCL, START, STOP, resetB, clk, wb_adr, wb_cyc, wb_stb, wb_ack,
							wb_we, wb_dat_i, wb_dat_o, SDAo, SDAen, state, i, buffer, i_voted,
							buffer_voted, wb_dat_o_voted, SDAo_voted, SDAen_voted, state_voted,
							wb_adr_voted, wb_cyc_voted, wb_we_voted, readcycle, selected,
							readcycle_voted, selected_voted, watchdog, watchdog_voted, chip_id,
							ADDR10BIT, INCREMENT_ADDR );

	parameter [3:0] CHIP_ID_WIDTH = 3;
//	parameter [CHIP_ID_WIDTH-1:0] CHIP_ID = 1;
//	parameter [0:0] ADDR10BIT = 0;
//	parameter [0:0] INCREMENT_ADDR = 1;
	parameter [8:0] WATCHDOG_PRESET = 511;

    //  input ports
    input     	    SDAi;
    input     	    SCL;
    input   	    START;
    input   	    STOP;
    input   	    resetB;
    input   	    clk;
	
//	output [6-CHIP_ID_WIDTH+(ADDR10BIT*3):0] wb_adr;    
	output [6-CHIP_ID_WIDTH+3:0] wb_adr;    
	input [7:0] wb_dat_i;     // databus input
	output [7:0] wb_dat_o;     // databus output
	output        wb_we;      // write enable input
	output        wb_stb;     // stobe/core select signal
	output        wb_cyc;     // valid bus cycle input
	input       wb_ack;     // bus cycle acknowledge output
	input [CHIP_ID_WIDTH-1:0] chip_id;
	input ADDR10BIT;
	input INCREMENT_ADDR;

	
    input [1:0] state_voted; 	
	input [3:0] i_voted;
	input [7:0] buffer_voted;
	input [7:0]	wb_dat_o_voted;
//	input [6-CHIP_ID_WIDTH+(ADDR10BIT*3):0] wb_adr_voted;
	input [6-CHIP_ID_WIDTH+3:0] wb_adr_voted;
	input SDAo_voted, SDAen_voted, wb_we_voted, wb_cyc_voted;
	input readcycle_voted, selected_voted;
	input [8:0]	watchdog_voted;
      
    //  output ports
    output  [1:0]  state;
    output  	    SDAo;
    output  [7:0]   buffer;
    output  	    SDAen;
	output [3:0] i;
	output readcycle, selected;
	output [8:0] watchdog;

    reg [7:0]   wb_dat_o;
//	reg [6-CHIP_ID_WIDTH+(ADDR10BIT*3):0] wb_adr;
	reg [6-CHIP_ID_WIDTH+3:0] wb_adr;
	reg SDAo, SDAen, wb_we, wb_cyc;
	reg [8:0] watchdog;
	
	wire wb_stb = wb_cyc;

	parameter [1:0]  // synopsys enum mystates
		IDLE = 2'd0,
		ADDR = 2'd1,
		ADDR2 = 2'd2,
		RXTX = 2'd3;
	
	
	reg [3:0] i;
	reg [1:0] /* synopsys enum mystates */ state; 
	reg SCL_late;
	reg [7:0] buffer;
	reg readcycle;
	reg selected;
	
    always  @(posedge clk or negedge resetB) begin
		if (~resetB) begin
	    	i 	    	<=#1 0;
	    	buffer 	<=#1 0;
	    	wb_dat_o    	<=#1 0;
	    	SDAo	 	<=#1 1'b1;
	    	SDAen   	<=#1 1'b0;
	    	state 	<=#1 IDLE;
			SCL_late <=#1 0;
			wb_adr <=#1 0;
			wb_we <=#1 0;
			wb_cyc <=#1 0;
			selected <=#1 0;
			readcycle <=#1 0;
			watchdog <=#1 WATCHDOG_PRESET;
		end
		else begin
			i <=#1 i_voted;
			state <=#1 state_voted;
			SCL_late <=#1 SCL;
			wb_dat_o <=#1 wb_dat_o_voted;
			SDAo <=#1 SDAo_voted;
			SDAen <=#1 SDAen_voted;
			buffer <=#1 buffer_voted;
			wb_adr <=#1 wb_adr_voted;
			wb_we <=#1 wb_we_voted;
			wb_cyc <=#1 wb_cyc_voted;
			readcycle <=#1 readcycle_voted;
			selected <=#1 selected_voted;
			
			case (state_voted) //synopsys full_case parallel_case
				IDLE: begin
					SDAen <=#1 0;
					wb_cyc <=#1 0;
				end
				
				ADDR: begin
					if ({SCL_late,SCL}=='b01) i<=#1 i_voted + 1;

					if (i_voted<8) begin
						SDAen <=#1 0;
						if ({SCL_late,SCL}=='b01) begin
							buffer <=#1 {buffer_voted[6:0], SDAi};	
						end
					end
					
					if (i_voted==8) begin
						if ({SCL_late,SCL}=='b10) begin
							if (!ADDR10BIT) begin // 7-bit addressing
								if (buffer_voted[7:8-CHIP_ID_WIDTH] == chip_id) begin
									SDAen<=#1 1; // ACK
									SDAo<=#1 0;
									wb_adr<=#1 buffer_voted[7-CHIP_ID_WIDTH:1];
									readcycle<=#1 buffer_voted[0];
									if (buffer_voted[0]) begin
										wb_we <=#1 0;
										wb_cyc <=#1 1;
									end
								end
								else state <=#1 IDLE;
							end
							else begin // 10-bit addressing
								if (buffer_voted[7:1] == {5'b11110,chip_id[CHIP_ID_WIDTH-1:CHIP_ID_WIDTH-2]}) begin
									
									if (buffer_voted[0]) begin
										if (selected_voted) begin
											wb_we <=#1 0;
											wb_cyc <=#1 1;
											SDAen<=#1 1; // ACK
											SDAo<=#1 0;
											readcycle<=#1 buffer_voted[0];
										end
										else begin
											state <=#1 IDLE;
											selected <=#1 0;
										end
									end
									else begin
										SDAen<=#1 1; // ACK
										SDAo<=#1 0;
										readcycle<=#1 buffer_voted[0];
									end
								end
								else begin
									state <=#1 IDLE;
									selected <=#1 0;
								end
							end
						end
					end
					
					if (i_voted==9) begin
						if (buffer_voted[0]) begin
							i <=#1 0;
							state <=#1 RXTX;
							buffer <=#1 wb_dat_i;
							wb_cyc <=#1 0;
						end
						else begin
							if ({SCL_late,SCL}=='b10) begin
								i<=#1 0;
								SDAen <=#1 0;
								if(!ADDR10BIT) begin // 7-bit addressing
									state <=#1 RXTX;
								end
								else begin // 10-bit addressing
									state <=#1 ADDR2;
								end
							end
						end
					end
				end
				
				ADDR2: if (!ADDR10BIT) begin // 7-bit addressing
					state <=#1 IDLE;
				end
				else begin // 10-bit addressing
					if ({SCL_late,SCL}=='b01) i<=#1 i_voted + 1;

					if (i_voted<8) begin
						SDAen <=#1 0;
						if ({SCL_late,SCL}=='b01) begin
							buffer <=#1 {buffer_voted[6:0], SDAi};	
						end
					end
					
					if (i_voted==8) begin
						if ({SCL_late,SCL}=='b10) begin
							if (buffer_voted[7:10-CHIP_ID_WIDTH] == chip_id[CHIP_ID_WIDTH-3:0]) begin
								SDAen<=#1 1; // ACK
								SDAo<=#1 0;
								wb_adr<=#1 buffer_voted[9-CHIP_ID_WIDTH:0];
								selected <=#1 1;
							end
							else begin
								state <=#1 IDLE;
								selected <=#1 0;
							end
						end
					end
					
					if (i_voted==9) begin
						if ({SCL_late,SCL}=='b10) begin
							i<=#1 0;
							SDAen <=#1 0;
							state <=#1 RXTX;
						end
					end
				end
				
				
				
				
				
				RXTX: if (!readcycle) begin // RX
					if ({SCL_late,SCL}=='b01) i<=#1 i_voted + 1;

					if (i_voted<8) begin
						SDAo <=#1 1;
						SDAen <=#1 0;
						if ({SCL_late,SCL}=='b01) begin
							buffer <=#1 {buffer_voted[6:0], SDAi};	
						end
					end

					if (i_voted==8) begin
						if ({SCL_late,SCL}=='b10) begin
							SDAen<=#1 1; // ACK
							SDAo<=#1 0;
							wb_dat_o<=#1 buffer_voted;
							wb_we <=#1 1;
							wb_cyc <=#1 1;
						end
					end

					if (i_voted==9) begin
						if ({SCL_late,SCL}=='b10) begin
							SDAen<=#1 0;
							i<=#1 0;
							if (INCREMENT_ADDR) wb_adr<=#1 wb_adr_voted + 1;
							//state <=#1 IDLE;
						end
					end

				end
 				else begin // TX
					if ({SCL_late,SCL}=='b10) i<=#1 i_voted + 1;

					if (i_voted<8) begin
						SDAen <=#1 1;
						if ({SCL_late,SCL}=='b10) begin
							SDAo <=#1 buffer_voted[7];
							buffer <=#1 buffer_voted << 1;
						end
					end

					if (i_voted==8) begin
						if ({SCL_late,SCL}=='b10) begin
							SDAen<=#1 0; // ACK
							wb_we <=#1 0;
							wb_cyc <=#1 1;
							if (INCREMENT_ADDR) wb_adr<=#1 wb_adr_voted + 1;
						end
					end

					if (i_voted==9) begin
						SDAen<=#1 0;
						if ({SCL_late,SCL}=='b01) begin
							if (~SDAi) begin
								i<=#1 0;
								buffer <=#1 wb_dat_i;
								wb_cyc <=#1 0;
							end
							else state <=#1 IDLE;
						end
					end

				end

			endcase
			
			if (STOP | (watchdog_voted==0)) begin
				selected <=#1 0;
				state<=#1 IDLE;
			end

			if (START) begin
				state <=#1 ADDR;
				SDAen <=#1 0;
				i<=#1 0;
			end

			if (SCL==1) begin  // Avoid changes when SCL is high
				SDAen <=#1 SDAen_voted;
				SDAo <=#1 SDAo_voted;
			end
			
			if (wb_ack & wb_we_voted) wb_cyc <=#1 0;
			
			if (({SCL_late,SCL}=='b10) | (state_voted==IDLE)) watchdog <=#1 WATCHDOG_PRESET;
			else watchdog <=#1 watchdog_voted - 1;
		end
	end

endmodule

///////////////////////////////////////////////////
//
// i2c_synchronizer.v
// Created on Jun  3  2008 
// by Sandro Bonacini
// CERN PH/ESE/ME
//
///////////////////////////////////////////////////
`timescale 1ps/1ps
module I2C_synchronizer ( S_SCL, clk40, SCL, SDA, START, STOP, resetB, S_SDA  );

    input  clk40, SCL, SDA, resetB;
    
    output S_SCL, START, STOP, S_SDA;
    
	reg S_SCL, S_SDA, SCL_late, SDA_late, sda_fall, sda_rise;
	reg [1:0] sda_fall_late, sda_rise_late;

	assign START = (sda_fall_late == 'b01);
	assign STOP = (sda_rise_late == 'b01);
	
	always @(posedge clk40 or negedge resetB) begin
		if (~resetB) begin
			S_SCL <=#1 0;
			S_SDA <=#1 1;
			SCL_late<=#1 0;
			SDA_late<=#1 1;
			sda_rise_late <=#1 0;
			sda_fall_late <=#1 0;
		end
		else begin
			{S_SCL, SCL_late} <=#1 {SCL_late, SCL};
			{S_SDA, SDA_late} <=#1 {SDA_late, SDA};

			sda_fall_late <=#1 {sda_fall_late[0], sda_fall};
			sda_rise_late <=#1 {sda_rise_late[0], sda_rise};
		end
	end
	
	always @(posedge SDA or negedge resetB) begin
		if (~resetB) sda_rise <=#1 0;
		else sda_rise <=#1 SCL;
	end

	always @(negedge SDA or negedge resetB) begin
		if (~resetB) sda_fall <=#1 0;
		else sda_fall <=#1 SCL;
	end

endmodule


/*
modul I2C_synchronizer ( S_SCL, clk40, SCL, SDA, START, STOP, resetB, S_SDA  );

    input  clk40, SCL, SDA, resetB;
    
    output S_SCL, START, STOP, S_SDA;
    
    wire net68, net95, net99, net70, net86, net79, net77, net74, net90, net107, 
        net69, net82, net65;
	
    E_dff_R I23 ( .D(net77), .CK(clk40), .RESb(resetB), .Q(S_SDA) );
    E_dff_R I25 ( .D(net95), .CK(clk40), .RESb(resetB), .Q(net86) );
    E_dff_R I24 ( .D(net99), .CK(clk40), .RESb(resetB), .Q(net90) );
    E_Inv1 I27 ( .A(net82), .Y(STOP) );
    E_Inv1 I26 ( .A(net86), .Y(net74) );
    E_Inv1 I29 ( .A(net79), .Y(START) );
    E_Nand2 I28 ( .A(net95), .B(net74), .Y(net82) );
    E_dff_R I2 ( .D(SCL), .CK(clk40), .RESb(resetB), .Q(net107) );
    E_dff_R I3 ( .D(net107), .CK(clk40), .RESb(resetB), .Q(S_SCL) );
    E_dff_R I11 ( .D(SCL), .CK(net70), .RESb(resetB), .Q(net69) );
    E_Inv1 I13 ( .A(SDA), .Y(net70) );
    E_dff_R I12 ( .D(SCL), .CK(SDA), .RESb(resetB), .Q(net65) );
    E_Nand2 I31 ( .A(net99), .B(net68), .Y(net79) );
    E_dff_R I15 ( .D(net69), .CK(clk40), .RESb(resetB), .Q(net99) );
    E_dff_R I14 ( .D(net65), .CK(clk40), .RESb(resetB), .Q(net95) );
    E_Inv1 I30 ( .A(net90), .Y(net68) );
    E_dff_R I16 ( .D(SDA), .CK(clk40), .RESb(resetB), .Q(net77) );
    
endmodul

*/
///////////////////////////////////////////////////
//
// i2c_clock_gating_iostate.v
// Created on Jun  3  2008 
// by Sandro Bonacini
// CERN PH/ESE/ME
//
///////////////////////////////////////////////////
`timescale 1ps/1ps
module i2c_clock_gating (START, START_late, clk, clkg, en_clk, en_clk_voted,
						STOP, resetB);
	
	output START_late, clkg, en_clk;
	input START, STOP, en_clk_voted, clk, resetB;

	reg START_late;
	reg en_clk, en_clk_latched;
	always @(clk) begin
		if (~clk) en_clk_latched = en_clk_voted | START;
	end
	
	assign  clkg = clk & en_clk_latched;
		
	always @(posedge clk or negedge resetB) begin
		if (~resetB) begin
			en_clk <=#1 0;
			START_late <=#1 0;
		end
		else begin
			en_clk <=#1 en_clk_voted;
			if (START) en_clk <=#1 1;
			else begin
				if (STOP) en_clk <=#1 0;
			end
			
			//if ((state==0) & (!START)) en_clk <=#1 0;
			START_late <=#1 START;
		end
	end

endmodule



