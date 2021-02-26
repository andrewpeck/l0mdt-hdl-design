
/////////////////////////////////////////////////////////////////////////////
// Design Name:    GBT_SCA                                                 //
// Module Name:    Auxiliary_Port(TRI Version)                             //
// Made by:        Alessandro Caratelli                                    //
//                                                                         //
// Description:    Auxiliary serial port to access the SCA                 // 
//                 for testing or deasy chain running mode                 //
// Company:        CERN (PH-ESE)                                           //
// Create Date:    10/jan/2014                                             //
/////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module SwitchPort_tri (
      //global signals 
      input              clk_1,              clk_2,              clk_3,
      input              resetB_1,           resetB_2,           resetB_3,
      //Auxiliary port pad connections
      input              auxPort_TestEn_1,   auxPort_TestEn_2,   auxPort_TestEn_3,
      input              auxPort_SCL_1,      auxPort_SCL_2,      auxPort_SCL_3,
      input              auxPort_SDA_in_1,   auxPort_SDA_in_2,   auxPort_SDA_in_3,      
      output wire        auxPort_SDA_out_1,  auxPort_SDA_out_2,  auxPort_SDA_out_3,
      output wire        auxPort_SDA_oEn_1,  auxPort_SDA_oEn_2,  auxPort_SDA_oEn_3,
      //Network Controller connections
      output wire        nctrl_tx_dav_1,     nctrl_tx_dav_2,     nctrl_tx_dav_3,
      input       [15:0] nctrl_tx_dat_1,     nctrl_tx_dat_2,     nctrl_tx_dat_3,  
      output wire        nctrl_rx_ena_1,     nctrl_rx_ena_2,     nctrl_rx_ena_3,
      input              nctrl_rx_dav_1,     nctrl_rx_dav_2,     nctrl_rx_dav_3,
      output wire [15:0] nctrl_rx_dat_1,     nctrl_rx_dat_2,     nctrl_rx_dat_3,
      input              nctrl_tx_ena_1,     nctrl_tx_ena_2,     nctrl_tx_ena_3,
      //EPORT signals to Network Controller
      input              elink_tx_dav_1,     elink_tx_dav_2,     elink_tx_dav_3,
      output wire [15:0] elink_tx_dat_1,     elink_tx_dat_2,     elink_tx_dat_3,
      input              elink_rx_ena_1,     elink_rx_ena_2,     elink_rx_ena_3,
      output wire        elink_rx_dav_1,     elink_rx_dav_2,     elink_rx_dav_3,
      input       [15:0] elink_rx_dat_1,     elink_rx_dat_2,     elink_rx_dat_3,
      output wire        elink_tx_ena_1,     elink_tx_ena_2,     elink_tx_ena_3
      );
      //Auxiliary I2C port signals to Network Controller
      wire               aux_tx_dav_1,       aux_tx_dav_2,       aux_tx_dav_3;
      wire        [15:0] aux_tx_dat_1,       aux_tx_dat_2,       aux_tx_dat_3;
      wire               aux_rx_ena_1,       aux_rx_ena_2,       aux_rx_ena_3;
      wire               aux_rx_dav_1,       aux_rx_dav_2,       aux_rx_dav_3;
      wire        [15:0] aux_rx_dat_1,       aux_rx_dat_2,       aux_rx_dat_3;
      wire               aux_tx_ena_1,       aux_tx_ena_2,       taux_x_ena_3;
	wire               clk_g_1,            clk_g_2,            clk_g_3;
	
	auxiliary_port aux_port (
		//global signals
		.clk_1(clk_g_1),             .clk_2(clk_g_2),             .clk_3(clk_g_3),
      	.reset_n_1(resetB_1),        .reset_n_2(resetB_2),        .reset_n_3(resetB_3),
      	//I2C signals
		.SDAo_1(auxPort_SDA_out_1),  .SDAo_2(auxPort_SDA_out_2),  .SDAo_3(auxPort_SDA_out_3),              
		.SDAen_1(auxPort_SDA_oEn_1), .SDAen_2(auxPort_SDA_oEn_2), .SDAen_3(auxPort_SDA_oEn_3),             
		.SDAi_1(auxPort_SDA_in_1),   .SDAi_2(auxPort_SDA_in_2),   .SDAi_3(auxPort_SDA_in_3),   
		.SCL_1(auxPort_SCL_1),       .SCL_2(auxPort_SCL_2),       .SCL_3(auxPort_SCL_3),           
		//Atlantic Interface eport signals
		.rx_dav_1(aux_rx_dav_1),     .rx_dav_2(aux_rx_dav_2),     .rx_dav_3(aux_rx_dav_3),
		.tx_ena_1(aux_tx_ena_1),     .tx_ena_2(aux_tx_ena_2),     .tx_ena_3(aux_tx_ena_3),
		.tx_dat_1(aux_tx_dat_1),     .tx_dat_2(aux_tx_dat_2),     .tx_dat_3(aux_tx_dat_3),
		.rx_ena_1(aux_rx_ena_1),     .rx_ena_2(aux_rx_ena_2),     .rx_ena_3(aux_rx_ena_3),
		.rx_dat_1(aux_rx_dat_1),     .rx_dat_2(aux_rx_dat_2),     .rx_dat_3(aux_rx_dat_3)  
	);  
	
	clk_gating_tri ckgate(
		.en_clk_1(auxPort_TestEn_1), .en_clk_2(auxPort_TestEn_2),   .en_clk_3(auxPort_TestEn_3),
		.clk_1(clk_1),               .clk_2(clk_2),               .clk_3(clk_3),
		.clk_gated_1(clk_g_1),       .clk_gated_2(clk_g_2),       .clk_gated_3(clk_g_3)
	);
	
	 		
      assign nctrl_tx_dav_1 = (auxPort_TestEn_1) ? 1'b1 : elink_tx_dav_1;
      assign nctrl_tx_dav_2 = (auxPort_TestEn_2) ? 1'b1 : elink_tx_dav_2;
      assign nctrl_tx_dav_3 = (auxPort_TestEn_3) ? 1'b1 : elink_tx_dav_3;
      
      assign nctrl_rx_dat_1 = (auxPort_TestEn_1) ? aux_rx_dat_1 : elink_rx_dat_1; 
      assign nctrl_rx_dat_2 = (auxPort_TestEn_2) ? aux_rx_dat_2 : elink_rx_dat_2;
      assign nctrl_rx_dat_3 = (auxPort_TestEn_3) ? aux_rx_dat_3 : elink_rx_dat_3;
      
      assign nctrl_rx_ena_1 = (auxPort_TestEn_1) ? aux_rx_ena_1 : elink_rx_ena_1;
      assign nctrl_rx_ena_2 = (auxPort_TestEn_2) ? aux_rx_ena_2 : elink_rx_ena_2;
      assign nctrl_rx_ena_3 = (auxPort_TestEn_3) ? aux_rx_ena_3 : elink_rx_ena_3;
      
      assign elink_tx_dat_1 = nctrl_tx_dat_1; assign aux_tx_dat_1 = nctrl_tx_dat_1;
      assign elink_tx_dat_2 = nctrl_tx_dat_2; assign aux_tx_dat_2 = nctrl_tx_dat_2;
      assign elink_tx_dat_3 = nctrl_tx_dat_3; assign aux_tx_dat_3 = nctrl_tx_dat_3;
      
      assign elink_rx_dav_1 = nctrl_rx_dav_1; assign aux_rx_dav_1 = nctrl_rx_dav_1;
      assign elink_rx_dav_2 = nctrl_rx_dav_2; assign aux_rx_dav_2 = nctrl_rx_dav_2;
      assign elink_rx_dav_3 = nctrl_rx_dav_3; assign aux_rx_dav_3 = nctrl_rx_dav_3;
       
      assign elink_tx_ena_1 = nctrl_tx_ena_1; assign aux_tx_ena_1 = nctrl_tx_ena_1;
      assign elink_tx_ena_2 = nctrl_tx_ena_2; assign aux_tx_ena_2 = nctrl_tx_ena_2;
      assign elink_tx_ena_3 = nctrl_tx_ena_3; assign aux_tx_ena_3 = nctrl_tx_ena_3;
 
endmodule
 
      
      
module clk_gating_tri(
	input       en_clk_1,    en_clk_2,    en_clk_3,
	input       clk_1,       clk_2,       clk_3,
	output wire clk_gated_1, clk_gated_2, clk_gated_3
	);
	
	clk_gating ckgate1(
		.en_clk(en_clk_1),
		.clk(clk_1),
		.clk_gated(clk_gated_1)
	);
	clk_gating ckgate2(
		.en_clk(en_clk_2),
		.clk(clk_2),
		.clk_gated(clk_gated_2)
	);
	clk_gating ckgate3(
		.en_clk(en_clk_3),
		.clk(clk_3),
		.clk_gated(clk_gated_3)
	);
endmodule

module clk_gating(
	input       en_clk,
	input       clk,
	output wire clk_gated
	);
	
	reg en_clk_latched;
	
	always @(clk) begin //keep during high period
		if (~clk) en_clk_latched = en_clk;
	end
	
	assign clk_gated = clk & en_clk_latched;
	
endmodule





`timescale 1ns / 1ps

module wishbone2atlanticSCA_tri (clk_1, clk_2, clk_3,reset_n_1, reset_n_2, reset_n_3,wb_ack_out_1, wb_ack_out_2, wb_ack_out_3,wb_adr_in_1, wb_adr_in_2, wb_adr_in_3,wb_dat_in_1, wb_dat_in_2, wb_dat_in_3,wb_we_in_1, wb_we_in_2, wb_we_in_3, wb_stb_in_1, wb_stb_in_2, wb_stb_in_3,wb_cyc_in_1, wb_cyc_in_2, wb_cyc_in_3,wb_dat_out_1, wb_dat_out_2, wb_dat_out_3,
					rx_ena_1, rx_ena_2, rx_ena_3,rx_dav_1, rx_dav_2, rx_dav_3,tx_ena_1, tx_ena_2, tx_ena_3,rx_dat_1, rx_dat_2, rx_dat_3,tx_dat_1, tx_dat_2, tx_dat_3);

	//global signals
	input         clk_1,        clk_2,        clk_3; 
	input         reset_n_1,    reset_n_2,    reset_n_3;	
	//wb interface
	output        wb_ack_out_1, wb_ack_out_2, wb_ack_out_3;                  
	input   [3:0] wb_adr_in_1,  wb_adr_in_2,  wb_adr_in_3;         
	input   [7:0] wb_dat_in_1,  wb_dat_in_2,  wb_dat_in_3;                  
	input         wb_we_in_1,   wb_we_in_2,   wb_we_in_3;          
	input         wb_stb_in_1,  wb_stb_in_2,  wb_stb_in_3;      
	input         wb_cyc_in_1,  wb_cyc_in_2,  wb_cyc_in_3; 
	output  [7:0] wb_dat_out_1, wb_dat_out_2, wb_dat_out_3;
	//Atlantic Interface eport signals	
	output        rx_ena_1,     rx_ena_2,     rx_ena_3;
      input         rx_dav_1,     rx_dav_2,     rx_dav_3;
      input         tx_ena_1,     tx_ena_2,     tx_ena_3;
      output [15:0] rx_dat_1,     rx_dat_2,     rx_dat_3;
      input  [15:0] tx_dat_1,     tx_dat_2,     tx_dat_3;
      
	// triple module redundancy signals
	wire [1:0] CTRL_1, CTRL_2, CTRL_3;
	wire [63:0] data_1, data_2, data_3;
	wire [2:0] count_tx_1, count_tx_2, count_tx_3;
	wire wb_ack_out_1, wb_ack_out_2, wb_ack_out_3;
	wire state_rx_1, state_rx_2, state_rx_3;
	wire [1:0] count_rx_1, count_rx_2, count_rx_3;
	wire [15:0] rx_dat_1, rx_dat_2, rx_dat_3;
	wire send_ack_1, send_ack_2, send_ack_3;
	wire [7:0] wb_dat_out_1, wb_dat_out_2, wb_dat_out_3;
	wire [1:0] CTRL;
	wire [63:0] data;
	wire [2:0] count_tx;
	wire wb_ack_out;
	wire state_rx;
	wire [1:0] count_rx;
	wire [15:0] rx_dat;
	wire send_ack;
	wire [7:0] wb_dat_out;
	
	wishbone2atlanticSCA_iostate wishbone2atlanticSCA_iostate_1   (.clk(clk_1),.reset_n(reset_n_1),.wb_ack_out_i(wb_ack_out_1), .wb_ack_out_o(wb_ack_out_2),.wb_adr_in(wb_adr_in_1),.wb_dat_in(wb_dat_in_1),.wb_we_in(wb_we_in_1), .wb_stb_in(wb_stb_in_1),.wb_cyc_in(wb_cyc_in_1),.wb_dat_out_i(wb_dat_out_1), .wb_dat_out_o(wb_dat_out_2),
					.rx_ena(rx_ena_1),.rx_dav(rx_dav_1),.tx_ena(tx_ena_1),.rx_dat_i(rx_dat_1), .rx_dat_o(rx_dat_2),.tx_dat(tx_dat_1), .CTRL_i(CTRL_1), .CTRL_o(CTRL_2), .data_i(data_1), .data_o(data_2), .count_tx_i(count_tx_1), .count_tx_o(count_tx_2), .state_rx_i(state_rx_1), .state_rx_o(state_rx_2), .count_rx_i(count_rx_1), .count_rx_o(count_rx_2), .send_ack_i(send_ack_1), .send_ack_o(send_ack_2));
	wishbone2atlanticSCA_iostate wishbone2atlanticSCA_iostate_2   (.clk(clk_2),.reset_n(reset_n_2),.wb_ack_out_i(wb_ack_out_2), .wb_ack_out_o(wb_ack_out_3),.wb_adr_in(wb_adr_in_2),.wb_dat_in(wb_dat_in_2),.wb_we_in(wb_we_in_2), .wb_stb_in(wb_stb_in_2),.wb_cyc_in(wb_cyc_in_2),.wb_dat_out_i(wb_dat_out_2), .wb_dat_out_o(wb_dat_out_3),
					.rx_ena(rx_ena_2),.rx_dav(rx_dav_2),.tx_ena(tx_ena_2),.rx_dat_i(rx_dat_2), .rx_dat_o(rx_dat_3),.tx_dat(tx_dat_2), .CTRL_i(CTRL_2), .CTRL_o(CTRL_3), .data_i(data_2), .data_o(data_3), .count_tx_i(count_tx_2), .count_tx_o(count_tx_3), .state_rx_i(state_rx_2), .state_rx_o(state_rx_3), .count_rx_i(count_rx_2), .count_rx_o(count_rx_3), .send_ack_i(send_ack_2), .send_ack_o(send_ack_3));
	wishbone2atlanticSCA_iostate wishbone2atlanticSCA_iostate_3   (.clk(clk_3),.reset_n(reset_n_3),.wb_ack_out_i(wb_ack_out_3), .wb_ack_out_o(wb_ack_out),.wb_adr_in(wb_adr_in_3),.wb_dat_in(wb_dat_in_3),.wb_we_in(wb_we_in_3), .wb_stb_in(wb_stb_in_3),.wb_cyc_in(wb_cyc_in_3),.wb_dat_out_i(wb_dat_out_3), .wb_dat_out_o(wb_dat_out),
					.rx_ena(rx_ena_3),.rx_dav(rx_dav_3),.tx_ena(tx_ena_3),.rx_dat_i(rx_dat_3), .rx_dat_o(rx_dat),.tx_dat(tx_dat_3), .CTRL_i(CTRL_3), .CTRL_o(CTRL), .data_i(data_3), .data_o(data), .count_tx_i(count_tx_3), .count_tx_o(count_tx), .state_rx_i(state_rx_3), .state_rx_o(state_rx), .count_rx_i(count_rx_3), .count_rx_o(count_rx), .send_ack_i(send_ack_3), .send_ack_o(send_ack));

	majority_voter #(.WIDTH(98)) mv (
		.in1({CTRL_2, data_2, count_tx_2, wb_ack_out_2, state_rx_2, count_rx_2, rx_dat_2, send_ack_2, wb_dat_out_2}),
		.in2({CTRL_3, data_3, count_tx_3, wb_ack_out_3, state_rx_3, count_rx_3, rx_dat_3, send_ack_3, wb_dat_out_3}),
		.in3({CTRL, data, count_tx, wb_ack_out, state_rx, count_rx, rx_dat, send_ack, wb_dat_out}),
		.out({CTRL_1, data_1, count_tx_1, wb_ack_out_1, state_rx_1, count_rx_1, rx_dat_1, send_ack_1, wb_dat_out_1}),
		.err()
	);
endmodule



module wishbone2atlanticSCA_iostate (clk,reset_n,wb_ack_out_i, wb_ack_out_o,wb_adr_in,wb_dat_in,wb_we_in, wb_stb_in,wb_cyc_in,wb_dat_out_i, wb_dat_out_o,
					rx_ena,rx_dav,tx_ena,rx_dat_i, rx_dat_o,tx_dat, CTRL_i, CTRL_o, data_i, data_o, count_tx_i, count_tx_o, state_rx_i, state_rx_o, count_rx_i, count_rx_o, send_ack_i, send_ack_o);	
	//global signals
	input         clk; 
	input         reset_n;
	//wb interface
	input   [3:0] wb_adr_in;         
	input   [7:0] wb_dat_in;                  
	input         wb_we_in;          
	input         wb_stb_in;      
	input         wb_cyc_in; 
	output  [7:0] wb_dat_out_o;	
	output        wb_ack_out_o;	
	//atlantic interface
	input         rx_dav;  
      input         tx_ena;
      input  [15:0] tx_dat;
 	output        rx_ena;
	output [15:0] rx_dat_o;     
      // triple module redundancy signals
      input         send_ack_i; 
      input   [1:0] count_rx_i; 
      input         state_rx_i;     
	input   [2:0] count_tx_i;
      input  [63:0] data_i;
      input   [1:0] CTRL_i;
	output        send_ack_o;
      output  [1:0] count_rx_o;
	output        state_rx_o;
	input  [15:0] rx_dat_i;
      input         wb_ack_out_i;                  
	output  [2:0] count_tx_o;
	output [63:0] data_o;
	output  [1:0] CTRL_o;
	input   [7:0] wb_dat_out_i;
      
	//Atlantic Interface eport signals	
	reg    [63:0] data_o;
	reg           state_rx_o, send_ack_o,  wb_ack_out_o; 
	reg     [2:0] count_tx_o;
	reg     [1:0] count_rx_o, CTRL_o;
	reg     [7:0] wb_dat_out_o;
	
	wire   [15:0] rx_dat_o;
      wire          send, rx_ena, SCA_new_pkt_rec;
      
      `define inactive    1'b0
      `define send_packet 1'b1
      
      assign rx_ena = state_rx_i;
      
	assign rx_dat_o[15:8] = (state_rx_i==`send_packet) ? (data_i[ (16*count_rx_i) +: 8])     : {8{1'b0}};
	assign rx_dat_o[7:0]  = (state_rx_i==`send_packet) ? (data_i[ ((16*count_rx_i)+8) +: 8]) : {8{1'b0}};
	
      assign SCA_new_pkt_rec = ((~tx_ena) && (|(count_tx_i))) ? 1'b1 : 1'b0;
	
	
	//write ctrl register
	always @(posedge clk or negedge reset_n) begin 
		if (~reset_n) CTRL_o <=#1 2'h0;
		else begin
			if(wb_cyc_in & wb_stb_in & wb_we_in & (wb_adr_in[3:0] == 4'h8)) 
				CTRL_o <=#1 wb_dat_in[1:0];
			else begin
				if(&(count_rx_i)) CTRL_o[0] <=#1 1'b0;
				else              CTRL_o[0] <=#1 CTRL_i[0];
				if(SCA_new_pkt_rec) CTRL_o[1] <=#1 1'b1;
				else                CTRL_o[1] <=#1 CTRL_i[1];
			end
		end
	end
	assign send = CTRL_i[0];

	// write_data_buffer
	always @(posedge clk or negedge reset_n) begin 
		if (~reset_n) data_o <=#1 {64{1'b0}};
		else begin
			data_o <=#1 data_i;
			if(wb_cyc_in & wb_stb_in & wb_we_in & (wb_adr_in[3:0] < 8)) 
				data_o[ (8 * wb_adr_in[3:0]) +: 8] <=#1 wb_dat_in;
			else if(tx_ena) begin
				data_o[(count_tx_i*16) +: 8]     <=#1  tx_dat[15:8];
				data_o[((count_tx_i*16)+8) +: 8] <=#1  tx_dat[7:0];
			end
			else 
				data_o[63:0] <=#1 data_i[63:0];
		end
	end
	   
	// transmit_word_counter
      always @(posedge clk or negedge reset_n) begin 
      	if(~reset_n) count_tx_o <=#1 3'h0;
            else begin
            	if(tx_ena) count_tx_o <=#1 count_tx_i + 1;
           		else count_tx_o <=#1 3'h0;         		
           	end
      end
  
      // acknoladge_wb
	always @(posedge clk or negedge reset_n) begin 
		if (~reset_n) wb_ack_out_o <=#1 1'b0;
		else	wb_ack_out_o <=#1 wb_cyc_in & wb_stb_in & ~wb_ack_out_i;
	end
	// receive_state_machine    
      always @(posedge clk or negedge reset_n) begin 
            if(~reset_n) begin
                  state_rx_o <=#1 `inactive;
                  count_rx_o <=#1 2'h0;
            end
            else case (state_rx_i) 
           		`inactive:    begin
           			count_rx_o <=#1 2'h0;
           		      if(send) state_rx_o <=#1 `send_packet;
           		      else state_rx_o <=#1 `inactive;
           		 end
           		`send_packet: begin
           		      if(&(count_rx_i)) begin
           		      	state_rx_o <=#1 `inactive;
           		      	count_rx_o <=#1 2'h0;
           		      end
           		      else begin
           		      	state_rx_o <=#1 `send_packet;
           		      	count_rx_o <=#1 count_rx_i + 2'h1;
           		      end
           		 end
            endcase
      end
	
      // read buf through wb   
	always @(posedge clk or negedge reset_n) begin
		if (~reset_n) 
			wb_dat_out_o <=#1 {8{1'b0}};
		else begin	
			if(wb_adr_in[3:0] < 8)
				wb_dat_out_o <=#1  data_i[ (8 * wb_adr_in[3:0]) +: 8];
			else if(wb_adr_in[3:0] == 4'h8) 
				wb_dat_out_o <=#1 CTRL_i;
			else 
				wb_dat_out_o <=#1 {8{1'b0}};
		end
	end
  
endmodule

`include "I2C_slavle_wb.v"

module auxiliary_port (
	//global signals
	input             clk_1,        clk_2,        clk_3,
      input             reset_n_1,    reset_n_2,    reset_n_3,
      //I2C signals
	output wire       SDAo_1,       SDAo_2,       SDAo_3,              
	output wire       SDAen_1,      SDAen_2,      SDAen_3,             
	input             SDAi_1,       SDAi_2,       SDAi_3,   
	input             SCL_1,        SCL_2,        SCL_3,           
	//Atlantic Interface eport signals
	input             rx_dav_1,     rx_dav_2,     rx_dav_3,
	input             tx_ena_1,     tx_ena_2,     tx_ena_3,
	input      [15:0] tx_dat_1,     tx_dat_2,     tx_dat_3,
	output wire       rx_ena_1,     rx_ena_2,     rx_ena_3,
	output     [15:0] rx_dat_1,     rx_dat_2,     rx_dat_3
	);
		
	wire              wb_ack_out_1, wb_ack_out_2, wb_ack_out_3;                  
	wire        [6:0] wb_adr_in_1,  wb_adr_in_2,  wb_adr_in_3;         
	wire        [7:0] wb_dat_in_1,  wb_dat_in_2,  wb_dat_in_3;                  
	wire              wb_we_in_1,   wb_we_in_2,   wb_we_in_3;          
	wire              wb_stb_in_1,  wb_stb_in_2,  wb_stb_in_3;      
	wire              wb_cyc_in_1,  wb_cyc_in_2,  wb_cyc_in_3; 
	wire        [7:0] wb_dat_out_1, wb_dat_out_2, wb_dat_out_3;
	
	wishbone2atlanticSCA_tri wb2atlantic(
		.clk_1(clk_1),	             .clk_2(clk_2),	              .clk_3(clk_3),
		.reset_n_1(reset_n_1),	       .reset_n_2(reset_n_2),	        .reset_n_3(reset_n_3),
		
		.wb_ack_out_1(wb_ack_out_1),	 .wb_ack_out_2(wb_ack_out_2),	  .wb_ack_out_3(wb_ack_out_3),
		.wb_adr_in_1(wb_adr_in_1[3:0]),.wb_adr_in_2(wb_adr_in_2[3:0]),.wb_adr_in_3(wb_adr_in_3[3:0]),
		.wb_dat_in_1(wb_dat_in_1),	 .wb_dat_in_2(wb_dat_in_2),	  .wb_dat_in_3(wb_dat_in_3),
		.wb_we_in_1(wb_we_in_1),	 .wb_we_in_2(wb_we_in_2),	  .wb_we_in_3(wb_we_in_3), 
		.wb_stb_in_1(wb_stb_in_1),	 .wb_stb_in_2(wb_stb_in_2),	  .wb_stb_in_3(wb_stb_in_3),
		.wb_cyc_in_1(wb_cyc_in_1),	 .wb_cyc_in_2(wb_cyc_in_2),	  .wb_cyc_in_3(wb_cyc_in_3),
		.wb_dat_out_1(wb_dat_out_1),	 .wb_dat_out_2(wb_dat_out_2),	  .wb_dat_out_3(wb_dat_out_3),
					
		.rx_ena_1(rx_ena_1),	       .rx_ena_2(rx_ena_2),	        .rx_ena_3(rx_ena_3),
		.rx_dav_1(rx_dav_1),	       .rx_dav_2(rx_dav_2),	        .rx_dav_3(rx_dav_3),
		.tx_ena_1(tx_ena_1),	       .tx_ena_2(tx_ena_2),	        .tx_ena_3(tx_ena_3),
		.rx_dat_1(rx_dat_1),	       .rx_dat_2(rx_dat_2),	        .rx_dat_3(rx_dat_3),
		.tx_dat_1(tx_dat_1),	       .tx_dat_2(tx_dat_2),	        .tx_dat_3(tx_dat_3)
      );
                
                
      i2c_slave I2C_Port (         
		.SCL1(SCL_1), 
		.resetB1(reset_n_1), 
		.clk1(clk_1), 
		.wb_dat_i1(wb_dat_out_1), 
		.wb_we1(wb_we_in_1), 
		.wb_stb1(wb_stb_in_1),  
		.wb_cyc1(wb_cyc_in_1),
		.wb_ack1(wb_ack_out_1), 
		.chip_id1(3'h0), 
		.ADDR10BIT1(1'b0), 
		.INCREMENT_ADDR1(1'b1), 
		.wb_dat_o1(wb_dat_in_1), 
		.SDAo1(SDAo_1),
		.SDAen1(SDAen_1), 
		.wb_adr1(wb_adr_in_1), 
		.SDAi1(SDAi_1), 
		
		 
		.SCL2(SCL_2), 
		.resetB2(reset_n_2), 
		.clk2(clk_2), 
		.wb_dat_i2(wb_dat_out_2), 
		.wb_we2(wb_we_in_2),	
		.wb_stb2(wb_stb_in_2),  
		.wb_cyc2(wb_cyc_in_2), 
		.wb_ack2(wb_ack_out_2), 
		.chip_id2(3'h0), 
		.ADDR10BIT2(1'b0), 
		.INCREMENT_ADDR2(1'b1),
		.wb_dat_o2(wb_dat_in_2), 
		.SDAo2(SDAo_2), 
		.SDAen2(SDAen_2), 
		.wb_adr2(wb_adr_in_2), 
		.SDAi2(SDAi_2),
		 
		.SCL3(SCL_3), 
		.resetB3(reset_n_3), 
		.clk3(clk_3),	
		.wb_dat_i3(wb_dat_out_3), 
		.wb_we3(wb_we_in_3), 
		.wb_stb3(wb_stb_in_3),  
		.wb_cyc3(wb_cyc_in_3), 
		.wb_ack3(wb_ack_out_3), 
		.chip_id3(3'h0),
		.ADDR10BIT3(1'b0), 
		.INCREMENT_ADDR3(1'b1), 
		.wb_dat_o3(wb_dat_in_3), 
		.SDAo3(SDAo_3), 
		.SDAen3(SDAen_3), 
		.wb_adr3(wb_adr_in_3),
		.SDAi3(SDAi_3)
        );     
endmodule
         



