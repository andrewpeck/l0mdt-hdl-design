//Last modification: 29 Sept 2015 - Change ADC control and parameters

`timescale 1ns / 1ps
`include "global_defines.v"
module wb_addr_decod_iostate( wb_addr, wb_stb_slave, wb_stb, wb_con_in_1, wb_con_in_3, wb_con_in_2,wb_con_in_4,
                      wb_con_in_5,wb_con_in_6,wb_con_in_7,wb_con_in_8,
                      wb_con_in_9, wb_con_in_10,  wb_con_in_11, wb_con_in_12, wb_con_in_13,
                      wb_con_in_14, wb_con_in_15, wb_con_in_16,wb_con_in_17,wb_con_in_18,wb_con_in_19, 
                      wb_con_in_20,wb_con_in_21,
                      wb_con_data_o);


	input [4:0] wb_addr ;
	input wb_stb ;
	input [31:0] wb_con_in_1 ;
	input [31:0] wb_con_in_2 ;
	input [31:0] wb_con_in_3 ;
	input [31:0] wb_con_in_4 ;
	input [31:0] wb_con_in_5 ;
	input [31:0] wb_con_in_6 ;
	input [31:0] wb_con_in_7 ;
	input [31:0] wb_con_in_8 ;
	input [31:0] wb_con_in_9 ;
	input [31:0] wb_con_in_10 ;
	input [31:0] wb_con_in_11 ;
	input [31:0] wb_con_in_12 ;
	input [31:0] wb_con_in_13 ;
	input [31:0] wb_con_in_14 ;
	input [31:0] wb_con_in_15 ;
	input [31:0] wb_con_in_16 ;
	input [31:0] wb_con_in_17 ;
	input [31:0] wb_con_in_18 ;
	input [31:0] wb_con_in_19 ;
	input [31:0] wb_con_in_20 ;
	input [31:0] wb_con_in_21 ;
	output [31:0] wb_stb_slave ;
	output [31:0] wb_con_data_o ;


	wire [4:0] wb_addr ;
	wire wb_stb ;
	wire [31:0] wb_con_in_1 ;
	wire [31:0] wb_con_in_2 ;
	wire [31:0] wb_con_in_3 ;
	wire [31:0] wb_con_in_4 ;
	wire [31:0] wb_con_in_5 ;
	wire [31:0] wb_con_in_6 ;
	wire [31:0] wb_con_in_7 ;
	wire [31:0] wb_con_in_8 ;
	wire [31:0] wb_con_in_9 ;
	wire [31:0] wb_con_in_10 ;
	wire [31:0] wb_con_in_11 ;
	wire [31:0] wb_con_in_12 ;
	wire [31:0] wb_con_in_13 ;
	wire [31:0] wb_con_in_14 ;
	wire [31:0] wb_con_in_15 ;
	wire [31:0] wb_con_in_16 ;
	wire [31:0] wb_con_in_17 ;
	wire [31:0] wb_con_in_18 ;
	wire [31:0] wb_con_in_19 ;
	wire [31:0] wb_con_in_20 ;
	wire [31:0] wb_con_in_21 ;

	reg [31:0] wb_stb_slave ;
	reg [31:0] wb_con_data_o ;             
     
 always @*
 begin
   if (wb_stb)
     case( wb_addr[4:0])
        5'b00001 :
           wb_stb_slave = 32'h1;  // SPI
        5'b00010 :
           wb_stb_slave = 32'h2;  //GPIO
        5'b00011 :
           wb_stb_slave = 32'h4;  // I2C 0         
         5'b00100 :
           wb_stb_slave = 32'h8;  // I2c 1        
         5'b00101 :
           wb_stb_slave = 32'h10;  // I2c 2         
         5'b00110 :
           wb_stb_slave = 32'h20;  // I2c 3
         5'b00111 :
           wb_stb_slave = 32'h40;  // I2c 4         
         5'b01000 :
           wb_stb_slave = 32'h80;  // I2c 5            
         5'b01001 :
           wb_stb_slave = 32'h100; // I2c 6          
         5'b01010 :
           wb_stb_slave = 32'h200;  // I2c 7               
         5'b01011 :
           wb_stb_slave = 32'h400;  // i2c 8 
         5'b01100 :
           wb_stb_slave = 32'h800;   // I2c 9            
         5'b01101 :
           wb_stb_slave = 32'h1000;   // I2c 10            
         5'b01110 :
           wb_stb_slave = 32'h2000;   // I2c 11            
         5'b01111 :
           wb_stb_slave = 32'h4000;   // I2c 12            
         5'b10000 :
           wb_stb_slave = 32'h8000;   // I2c 13                              
         5'b10001 :
           wb_stb_slave = 32'h10000;   // I2c 14
         5'b10010 :
           wb_stb_slave = 32'h20000;   // I2c 15            
         5'b10011 :
           wb_stb_slave = 32'h40000;   // canal 8'h13   JTAG
         5'b10100 :
           wb_stb_slave = 32'h80000;   // canal 8'h14   ADC
         5'b10101 :
           wb_stb_slave = 32'h100000;   // canal 8'h15   DAC           
                                                         
       default: 
           wb_stb_slave = 32'h0;  // aucun de selectionne
    endcase
   else
       wb_stb_slave = 32'h0; 
  end
always @ (wb_con_in_1 or wb_con_in_2 or wb_con_in_3 or  wb_con_in_4 or wb_con_in_5 or wb_con_in_6  
          or wb_con_in_7 or wb_con_in_8 or wb_con_in_9 or wb_con_in_10 or wb_con_in_11 or wb_con_in_12
          or wb_con_in_13 or wb_con_in_14 or wb_con_in_15 or wb_con_in_16 or wb_con_in_17 or wb_con_in_18
          or wb_con_in_19 or wb_con_in_20 or wb_con_in_21 or wb_addr)   
   begin
       case(wb_addr[4:0])
         5'b00001:
              wb_con_data_o = wb_con_in_1;  //SPI
         5'b00010:
              wb_con_data_o = wb_con_in_2;  // GPIO
         5'b00011:
              wb_con_data_o = wb_con_in_3;  // I2c0
          5'b00100:
              wb_con_data_o = wb_con_in_4;// I2c1
          5'b00101:
              wb_con_data_o = wb_con_in_5;  // I2c2 
          5'b00110:
              wb_con_data_o = wb_con_in_6;  // I2c3            
          5'b00111:
              wb_con_data_o = wb_con_in_7; // I2c4             
          5'b01000:
              wb_con_data_o = wb_con_in_8; // I2c5  
          5'b01001:
              wb_con_data_o = wb_con_in_9; // I2c6              
          5'b01010:
              wb_con_data_o = wb_con_in_10;// I2c7               
          5'b01011:
              wb_con_data_o = wb_con_in_11; // I2c8                  
          5'b01100:
              wb_con_data_o = wb_con_in_12; // I2c9                                    
          5'b01101:
              wb_con_data_o = wb_con_in_13;// I2c10 
          5'b01110:
              wb_con_data_o = wb_con_in_14;// I2c11               
          5'b01111:
              wb_con_data_o = wb_con_in_15; // I2c12             
          5'b10000:
              wb_con_data_o = wb_con_in_16;// I2c13
          5'b10001:
              wb_con_data_o = wb_con_in_17;// I2c14                                               
          5'b10010:
              wb_con_data_o = wb_con_in_18;// I2c15 
          5'b10011:
              wb_con_data_o = wb_con_in_19;// JTAG 
          5'b10100:
              wb_con_data_o = wb_con_in_20;// ADC
           5'b10101:
              wb_con_data_o = wb_con_in_21;// DAC
                                                                                        
        default:
             wb_con_data_o = 32'hFFFF;
    endcase 
 end 
endmodule



module wb_addr_decod_tri( wb_addr_1, wb_addr_2, wb_addr_3, wb_stb_slave_1, wb_stb_slave_2, wb_stb_slave_3, wb_stb_1, wb_stb_2, wb_stb_3, wb_con_in_1_1, wb_con_in_1_2, wb_con_in_1_3, wb_con_in_3_1, wb_con_in_3_2, wb_con_in_3_3, wb_con_in_2_1, wb_con_in_2_2, wb_con_in_2_3,wb_con_in_4_1, wb_con_in_4_2, wb_con_in_4_3,
                      wb_con_in_5_1, wb_con_in_5_2, wb_con_in_5_3,wb_con_in_6_1, wb_con_in_6_2, wb_con_in_6_3,wb_con_in_7_1, wb_con_in_7_2, wb_con_in_7_3,wb_con_in_8_1, wb_con_in_8_2, wb_con_in_8_3,
                      wb_con_in_9_1, wb_con_in_9_2, wb_con_in_9_3, wb_con_in_10_1, wb_con_in_10_2, wb_con_in_10_3,  wb_con_in_11_1, wb_con_in_11_2, wb_con_in_11_3, wb_con_in_12_1, wb_con_in_12_2, wb_con_in_12_3, wb_con_in_13_1, wb_con_in_13_2, wb_con_in_13_3,
                      wb_con_in_14_1, wb_con_in_14_2, wb_con_in_14_3, wb_con_in_15_1, wb_con_in_15_2, wb_con_in_15_3, wb_con_in_16_1, wb_con_in_16_2, wb_con_in_16_3,wb_con_in_17_1, wb_con_in_17_2, wb_con_in_17_3,wb_con_in_18_1, wb_con_in_18_2, wb_con_in_18_3,wb_con_in_19_1, wb_con_in_19_2, wb_con_in_19_3, 
                      wb_con_in_20_1, wb_con_in_20_2, wb_con_in_20_3,wb_con_in_21_1, wb_con_in_21_2, wb_con_in_21_3,
                      wb_con_data_o_1, wb_con_data_o_2, wb_con_data_o_3);

	input [4:0] wb_addr_1, wb_addr_2, wb_addr_3 ;
	input wb_stb_1, wb_stb_2, wb_stb_3 ;
	input [31:0] wb_con_in_1_1, wb_con_in_1_2, wb_con_in_1_3 ;
	input [31:0] wb_con_in_2_1, wb_con_in_2_2, wb_con_in_2_3 ;
	input [31:0] wb_con_in_3_1, wb_con_in_3_2, wb_con_in_3_3 ;
	input [31:0] wb_con_in_4_1, wb_con_in_4_2, wb_con_in_4_3 ;
	input [31:0] wb_con_in_5_1, wb_con_in_5_2, wb_con_in_5_3 ;
	input [31:0] wb_con_in_6_1, wb_con_in_6_2, wb_con_in_6_3 ;
	input [31:0] wb_con_in_7_1, wb_con_in_7_2, wb_con_in_7_3 ;
	input [31:0] wb_con_in_8_1, wb_con_in_8_2, wb_con_in_8_3 ;
	input [31:0] wb_con_in_9_1, wb_con_in_9_2, wb_con_in_9_3 ;
	input [31:0] wb_con_in_10_1, wb_con_in_10_2, wb_con_in_10_3 ;
	input [31:0] wb_con_in_11_1, wb_con_in_11_2, wb_con_in_11_3 ;
	input [31:0] wb_con_in_12_1, wb_con_in_12_2, wb_con_in_12_3 ;
	input [31:0] wb_con_in_13_1, wb_con_in_13_2, wb_con_in_13_3 ;
	input [31:0] wb_con_in_14_1, wb_con_in_14_2, wb_con_in_14_3 ;
	input [31:0] wb_con_in_15_1, wb_con_in_15_2, wb_con_in_15_3 ;
	input [31:0] wb_con_in_16_1, wb_con_in_16_2, wb_con_in_16_3 ;
	input [31:0] wb_con_in_17_1, wb_con_in_17_2, wb_con_in_17_3 ;
	input [31:0] wb_con_in_18_1, wb_con_in_18_2, wb_con_in_18_3 ;
	input [31:0] wb_con_in_19_1, wb_con_in_19_2, wb_con_in_19_3 ;
	input [31:0] wb_con_in_20_1, wb_con_in_20_2, wb_con_in_20_3 ;
	input [31:0] wb_con_in_21_1, wb_con_in_21_2, wb_con_in_21_3 ;
	output [31:0] wb_stb_slave_1, wb_stb_slave_2, wb_stb_slave_3 ;
	output [31:0] wb_con_data_o_1, wb_con_data_o_2, wb_con_data_o_3 ;

	wb_addr_decod_iostate wb_addr_decod_iostate_1  ( 
							.wb_addr(wb_addr_1), 
							.wb_stb_slave(wb_stb_slave_1), 
							.wb_stb(wb_stb_1), 
							.wb_con_in_1(wb_con_in_1_1), 
							.wb_con_in_3(wb_con_in_3_1), 
							.wb_con_in_2(wb_con_in_2_1),
							.wb_con_in_4(wb_con_in_4_1),
							.wb_con_in_5(wb_con_in_5_1),
							.wb_con_in_6(wb_con_in_6_1),
							.wb_con_in_7(wb_con_in_7_1),
							.wb_con_in_8(wb_con_in_8_1),
							.wb_con_in_9(wb_con_in_9_1), 
							.wb_con_in_10(wb_con_in_10_1),  
							.wb_con_in_11(wb_con_in_11_1), 
							.wb_con_in_12(wb_con_in_12_1), 
							.wb_con_in_13(wb_con_in_13_1),
							.wb_con_in_14(wb_con_in_14_1), 
							.wb_con_in_15(wb_con_in_15_1), 
							.wb_con_in_16(wb_con_in_16_1),
							.wb_con_in_17(wb_con_in_17_1),
							.wb_con_in_18(wb_con_in_18_1),
							.wb_con_in_19(wb_con_in_19_1), 
							.wb_con_in_20(wb_con_in_20_1),
							.wb_con_in_21(wb_con_in_21_1),
							.wb_con_data_o(wb_con_data_o_1)
							);

	wb_addr_decod_iostate wb_addr_decod_iostate_2  ( 
							.wb_addr(wb_addr_2), 
							.wb_stb_slave(wb_stb_slave_2), 
							.wb_stb(wb_stb_2), 
							.wb_con_in_1(wb_con_in_1_2), 
							.wb_con_in_3(wb_con_in_3_2), 
							.wb_con_in_2(wb_con_in_2_2),
							.wb_con_in_4(wb_con_in_4_2),
							.wb_con_in_5(wb_con_in_5_2),
							.wb_con_in_6(wb_con_in_6_2),
							.wb_con_in_7(wb_con_in_7_2),
							.wb_con_in_8(wb_con_in_8_2),
							.wb_con_in_9(wb_con_in_9_2), 
							.wb_con_in_10(wb_con_in_10_2),  
							.wb_con_in_11(wb_con_in_11_2), 
							.wb_con_in_12(wb_con_in_12_2), 
							.wb_con_in_13(wb_con_in_13_2),
							.wb_con_in_14(wb_con_in_14_2), 
							.wb_con_in_15(wb_con_in_15_2), 
							.wb_con_in_16(wb_con_in_16_2),
							.wb_con_in_17(wb_con_in_17_2),
							.wb_con_in_18(wb_con_in_18_2),
							.wb_con_in_19(wb_con_in_19_2), 
							.wb_con_in_20(wb_con_in_20_2),
							.wb_con_in_21(wb_con_in_21_2),
							.wb_con_data_o(wb_con_data_o_2)
							);

	wb_addr_decod_iostate wb_addr_decod_iostate_3  ( 
							.wb_addr(wb_addr_3), 
							.wb_stb_slave(wb_stb_slave_3), 
							.wb_stb(wb_stb_3), 
							.wb_con_in_1(wb_con_in_1_3), 
							.wb_con_in_3(wb_con_in_3_3), 
							.wb_con_in_2(wb_con_in_2_3),
							.wb_con_in_4(wb_con_in_4_3),
							.wb_con_in_5(wb_con_in_5_3),
							.wb_con_in_6(wb_con_in_6_3),
							.wb_con_in_7(wb_con_in_7_3),
							.wb_con_in_8(wb_con_in_8_3),
							.wb_con_in_9(wb_con_in_9_3),
							.wb_con_in_10(wb_con_in_10_3),  
							.wb_con_in_11(wb_con_in_11_3), 
							.wb_con_in_12(wb_con_in_12_3), 
							.wb_con_in_13(wb_con_in_13_3),
							.wb_con_in_14(wb_con_in_14_3), 
							.wb_con_in_15(wb_con_in_15_3), 
							.wb_con_in_16(wb_con_in_16_3),
							.wb_con_in_17(wb_con_in_17_3),
							.wb_con_in_18(wb_con_in_18_3),
							.wb_con_in_19(wb_con_in_19_3), 
							.wb_con_in_20(wb_con_in_20_3),
							.wb_con_in_21(wb_con_in_21_3),
							.wb_con_data_o(wb_con_data_o_3)
							);

endmodule



//  Design Unit:
//  ------------
//      Unit    Name  :  ack_and
//      Library Name  :  node_ctrl
//  
//      Creation Date :  Mon Jun 24 09:42:12 2013
//      Version       :  2012.09 v4.4.1 build 33. Date: Nov  1 2012. License: 2012.11
//  
//  Options Used:
//  -------------
//      Target
//         Language   :  As Is
//         Purpose    :  Synthesis
//         Vendor     :  BuildGates
//  
//      Style
//         Use tasks                      :  No
//         Code Destination               :  1 File per Unit
//         Attach Directives              :  Yes
//         Structural                     :  No
//         Free text style                :  / / ...
//         Preserve spacing for free text :  Yes
//         Declaration alignment          :  No
//
//--------------------------------------------------
//--------------------------------------------------
//  
//  Library Name :  node_ctrl
//  Unit    Name :  ack_and
//  Unit    Type :  Text Unit
//  
//----------------------------------------------------
//////////////////////////////////////////
//////////////////////////////////////////
// Date        : Tue Jan 15 11:07:06 2013
//
// Author      : 
//
// Company     : 
//
// Description : 
//
//////////////////////////////////////////
//////////////////////////////////////////


module ack_and_iostate(ack_in,ack_out);
	input  [5:0] ack_in;
	output   ack_out;
	assign  ack_out =   ack_in[2] || ack_in[1] || ack_in[0] || ack_in[3] || ack_in[4] || ack_in[5];
endmodule


module ack_and_tri(ack_in_1, ack_in_2, ack_in_3,ack_out_1, ack_out_2, ack_out_3);
	input  [5:0] ack_in_1, ack_in_2, ack_in_3;
	output       ack_out_1, ack_out_2, ack_out_3;
	ack_and_iostate ack_and_iostate_1  (.ack_in(ack_in_1),.ack_out(ack_out_1));
	ack_and_iostate ack_and_iostate_2  (.ack_in(ack_in_2),.ack_out(ack_out_2));
	ack_and_iostate ack_and_iostate_3  (.ack_in(ack_in_3),.ack_out(ack_out_3));
endmodule







module sca_node_ctrl_tri 

 (
`ifdef WithSEUcounter
output  SEU_NCTRLflag1,
output  SEU_NCTRLflag2,
output  SEU_NCTRLflag3,
`endif

input  clock_1,
input  clock_2,
input  clock_3,
input  tx_dav_1,
input  tx_dav_2,
input  tx_dav_3,
input  wb_ack_i_1,
input  wb_ack_i_2,
input  wb_ack_i_3,
input  wb_err_in_1,
input  wb_err_in_2,
input  wb_err_in_3,
input [5:0]  Int_arb_in_1,
input [5:0]  Int_arb_in_2,
input [5:0]  Int_arb_in_3,
input [15:0]  dataw_in_1,
input [15:0]  dataw_in_2,
input [15:0]  dataw_in_3,
input [31:0]  wb_dat_i_1,
input [31:0]  wb_dat_i_2,
input [31:0]  wb_dat_i_3,
input  rx_ena_1,
input  rx_ena_2,
input  rx_ena_3,
input  reset_1,
input  reset_2,
input  reset_3,
output  wb_cyc_o_1,
output  wb_cyc_o_2,
output  wb_cyc_o_3,
output  wb_stb_o_1,
output  wb_stb_o_2,
output  wb_stb_o_3,
output [31:0]  wb_addr_o_1,
output [31:0]  wb_addr_o_2,
output [31:0]  wb_addr_o_3,
output  rx_dav_1,
output  rx_dav_2,
output  rx_dav_3,
output [7:0]  CRE_1,
output [7:0]  CRE_2,
output [7:0]  CRE_3,
output [15:0]  dataw_out_1,
output [15:0]  dataw_out_2,
output [15:0]  dataw_out_3,
output [31:0]  wb_dat_o_1,
output [31:0]  wb_dat_o_2,
output [31:0]  wb_dat_o_3,
output [3:0]  wb_sel_o_1,
output [3:0]  wb_sel_o_2,
output [3:0]  wb_sel_o_3,
output  tx_ena_1,
output  tx_ena_2,
output  tx_ena_3,
output  wb_we_o_1,
output  wb_we_o_2,
output  wb_we_o_3,

output  [31:0] EN_ch_reg_1,//ADDED 30jan14
output  [31:0] EN_ch_reg_2,//ADDED 30jan14
output  [31:0] EN_ch_reg_3 //ADDED 30jan14
);

wire [31:0]  up_data_out_1;
wire [31:0]  up_data_out_2;
wire [31:0]  up_data_out_3;
wire  up_busy_1;
wire  up_busy_2;
wire  up_busy_3;
wire  up_cs_b_1;
wire  up_cs_b_2;
wire  up_cs_b_3;
wire [31:0]  S4_1;
wire [31:0]  S4_2;
wire [31:0]  S4_3;
wire [31:0]  up_addr_1;
wire [31:0]  up_addr_2;
wire [31:0]  up_addr_3;
wire  up_rw_b_1;
wire  up_rw_b_2;
wire  up_rw_b_3;
wire [4:0]    mem_adr_w_1;
wire [4:0]    mem_adr_w_2;
wire [4:0]    mem_adr_w_3;
wire [4:0]    mem_adr_r_1;
wire [4:0]    mem_adr_r_2;
wire [4:0]    mem_adr_r_3;
wire [7:0]    mem_data_w_1;
wire [7:0]    mem_data_w_2;
wire [7:0]    mem_data_w_3;
wire [7:0]    mem_data_r_1;
wire [7:0]    mem_data_r_2;
wire [7:0]    mem_data_r_3;
wire          mem_w_enable_1;
wire          mem_w_enable_2;
wire          mem_w_enable_3;
wire          mem_rst_1;
wire          mem_rst_2;
wire          mem_rst_3;

     
up_2_wishbone_tri  up_2_wishbone
    (
     .up_data_in_1(up_data_out_1[31:0]),
     .up_addr_1(up_addr_1[31:0]),
     .up_cs_b_1(up_cs_b_1),
     .up_rw_b_1(up_rw_b_1),
     .up_data_out_1(S4_1[31:0]),
     .wb_addr_o_1(wb_addr_o_1[31:0]),
     .wb_dat_o_1(wb_dat_o_1[31:0]),
     .wb_sel_o_1(wb_sel_o_1[3:0]),
     .wb_we_o_1(wb_we_o_1),
     .wb_stb_o_1(wb_stb_o_1),
     .wb_ack_i_1(wb_ack_i_1),
     .wb_dat_i_1(wb_dat_i_1[31:0]),
     .wb_cyc_o_1(wb_cyc_o_1),
     .clock_1(clock_1),
     .reset_1(reset_1),
     .wb_err_in_1(wb_err_in_1),
     .up_busy_1(up_busy_1),
		.up_data_in_2(up_data_out_2[31:0]),
     .up_addr_2(up_addr_2[31:0]),
     .up_cs_b_2(up_cs_b_2),
     .up_rw_b_2(up_rw_b_2),
     .up_data_out_2(S4_2[31:0]),
     .wb_addr_o_2(wb_addr_o_2[31:0]),
     .wb_dat_o_2(wb_dat_o_2[31:0]),
     .wb_sel_o_2(wb_sel_o_2[3:0]),
     .wb_we_o_2(wb_we_o_2),
     .wb_stb_o_2(wb_stb_o_2),
     .wb_ack_i_2(wb_ack_i_2),
     .wb_dat_i_2(wb_dat_i_2[31:0]),
     .wb_cyc_o_2(wb_cyc_o_2),
     .clock_2(clock_2),
     .reset_2(reset_2),
     .wb_err_in_2(wb_err_in_2),
     .up_busy_2(up_busy_2),
		.up_data_in_3(up_data_out_3[31:0]),
     .up_addr_3(up_addr_3[31:0]),
     .up_cs_b_3(up_cs_b_3),
     .up_rw_b_3(up_rw_b_3),
     .up_data_out_3(S4_3[31:0]),
     .wb_addr_o_3(wb_addr_o_3[31:0]),
     .wb_dat_o_3(wb_dat_o_3[31:0]),
     .wb_sel_o_3(wb_sel_o_3[3:0]),
     .wb_we_o_3(wb_we_o_3),
     .wb_stb_o_3(wb_stb_o_3),
     .wb_ack_i_3(wb_ack_i_3),
     .wb_dat_i_3(wb_dat_i_3[31:0]),
     .wb_cyc_o_3(wb_cyc_o_3),
     .clock_3(clock_3),
     .reset_3(reset_3),
     .wb_err_in_3(wb_err_in_3),
     .up_busy_3(up_busy_3)
	);

nctrl_tri  C0
    (
     `ifdef WithSEUcounter
        .SEU_NCTRLflag1(SEU_NCTRLflag1),
        .SEU_NCTRLflag2(SEU_NCTRLflag2),
        .SEU_NCTRLflag3(SEU_NCTRLflag3),
     `endif    
     
     .EN_ch_reg_1(EN_ch_reg_1[31:0]), //ADDED 30jan14
     .EN_ch_reg_2(EN_ch_reg_2[31:0]), //ADDED 30jan14
     .EN_ch_reg_3(EN_ch_reg_3[31:0]), //ADDED 30jan14
     
     .clock_1(clock_1),
     .reset_1(reset_1),
     .up_rw_b_1(up_rw_b_1),
     .up_data_out_1(up_data_out_1[31:0]),
     .up_data_in_1(S4_1[31:0]),
     .up_addr_1(up_addr_1[31:0]),
     .up_cs_b_1(up_cs_b_1),
     .tx_ena_1(tx_ena_1),
     .tx_dav_1(tx_dav_1),
     .nc_ready_1(),
     .rx_dav_1(rx_dav_1),
     .rx_ena_1(rx_ena_1),
     .dataw_in_1(dataw_in_1[15:0]),
     .Int_arb_in_1(Int_arb_in_1[5:0]),
     .up_busy_in_1(up_busy_1),
     .CRE_1(CRE_1[7:0]),  
     .dataw_out_1(dataw_out_1[15:0]),
     //.mem_adr_w_1(mem_adr_w_1[4:0]),
     //.mem_adr_r_1(mem_adr_r_1[4:0]),
     //.mem_data_w_1(mem_data_w_1[7:0]),
     //.mem_data_r_1(mem_data_r_1[7:0]),
     //.mem_w_enable_1(mem_w_enable_1),
     //.mem_rst_1(mem_rst_1),
	
     .clock_2(clock_2),
     .reset_2(reset_2),
     .up_rw_b_2(up_rw_b_2),
     .up_data_out_2(up_data_out_2[31:0]),
     .up_data_in_2(S4_2[31:0]),
     .up_addr_2(up_addr_2[31:0]),
     .up_cs_b_2(up_cs_b_2),
     .tx_ena_2(tx_ena_2),
     .tx_dav_2(tx_dav_2),
     .nc_ready_2(),
     .rx_dav_2(rx_dav_2),
     .rx_ena_2(rx_ena_2),
     .dataw_in_2(dataw_in_2[15:0]),
     .Int_arb_in_2(Int_arb_in_2[5:0]),
     .up_busy_in_2(up_busy_2),
     .CRE_2(CRE_2[7:0]),  
     .dataw_out_2(dataw_out_2[15:0]),
     //.mem_adr_w_2(mem_adr_w_2[4:0]),
     //.mem_adr_r_2(mem_adr_r_2[4:0]),
     //.mem_data_w_2(mem_data_w_2[7:0]),
     //.mem_data_r_2(mem_data_r_2[7:0]),
     //.mem_w_enable_2(mem_w_enable_2),
     //.mem_rst_2(mem_rst_2),
		
     .clock_3(clock_3),
     .reset_3(reset_3),
     .up_rw_b_3(up_rw_b_3),
     .up_data_out_3(up_data_out_3[31:0]),
     .up_data_in_3(S4_3[31:0]),
     .up_addr_3(up_addr_3[31:0]),
     .up_cs_b_3(up_cs_b_3),
     .tx_ena_3(tx_ena_3),
     .tx_dav_3(tx_dav_3),
     .nc_ready_3(),
     .rx_dav_3(rx_dav_3),
     .rx_ena_3(rx_ena_3),
     .dataw_in_3(dataw_in_3[15:0]),
     .Int_arb_in_3(Int_arb_in_3[5:0]),
     .up_busy_in_3(up_busy_3),
     .CRE_3(CRE_3[7:0]),  
     .dataw_out_3(dataw_out_3[15:0])
     //.mem_adr_w_3(mem_adr_w_3[4:0]),
     //.mem_adr_r_3(mem_adr_r_3[4:0]),
     //.mem_data_w_3(mem_data_w_3[7:0]),
     //.mem_data_r_3(mem_data_r_3[7:0]),
     //.mem_w_enable_3(mem_w_enable_3),
     //.mem_rst_3(mem_rst_3)
 
	);


//mySRAM #(.ADDR_WIDTH(5), .DATA_WIDTH(8)) SRAM_1 (
//	.addr_w(mem_adr_w_1[4:0]), 
//	.addr_r(mem_adr_r_1[4:0]),  
//	.data_w(mem_data_w_1[7:0]),
//	.data_r(mem_data_r_1[7:0]),
//	.w_enable(mem_w_enable_1), 
//	.clk_w(clock_1), 
//	.reset(reset_1 || mem_rst_1)
//	 );
//
//mySRAM #(.ADDR_WIDTH(5), .DATA_WIDTH(8)) SRAM_2 (
//	.addr_w(mem_adr_w_2[4:0]), 
//	.addr_r(mem_adr_r_2[4:0]),  
//	.data_w(mem_data_w_2[7:0]),
//	.data_r(mem_data_r_2[7:0]),
//	.w_enable(mem_w_enable_2), 
//	.clk_w(clock_2), 
//	.reset(reset_2 || mem_rst_2)
//	 );
//
//mySRAM #(.ADDR_WIDTH(5), .DATA_WIDTH(8)) SRAM_3 (
//	.addr_w(mem_adr_w_3[4:0]), 
//	.addr_r(mem_adr_r_3[4:0]),  
//	.data_w(mem_data_w_3[7:0]),
//	.data_r(mem_data_r_3[7:0]),
//	.w_enable(mem_w_enable_3), 
//	.clk_w(clock_3), 
//	.reset(reset_3 || mem_rst_3)
//	 );


endmodule



module up_2_wishbone_iostate (up_data_in, up_addr, up_cs_b, up_rw_b, up_data_out_iv, up_data_out_ov,
                      wb_addr_o_iv, wb_addr_o_ov, wb_dat_o_iv, wb_dat_o_ov, wb_sel_o_iv, wb_sel_o_ov, wb_we_o_iv, wb_we_o_ov, wb_stb_o_iv, wb_stb_o_ov,
                      wb_ack_i, wb_dat_i, wb_cyc_o_iv, wb_cyc_o_ov, clock, reset, wb_err_in,
                      up_busy_iv, up_busy_ov
                      , visual_Wish_idle_current_iv, visual_Wish_idle_current_ov);
 
  input [31:0] up_data_in;
  input wb_we_o_iv;
  input wb_stb_o_iv;
  input [1:0] visual_Wish_idle_current_iv;

  input wb_ack_i;
  input [31:0] wb_dat_i;
  input wb_cyc_o_iv;
  input clock;
  input reset;
  input wb_err_in;
  wire [31:0] up_data_in;
  input [31:0] up_addr;
  wire [31:0] up_addr;
  input up_cs_b;
  wire up_cs_b;
  input up_rw_b;
  wire up_rw_b;
  output [31:0] up_data_out_ov;
	output up_busy_ov;
	input [31:0] up_data_out_iv;
  output [31:0] wb_addr_o_ov;
	output [1:0] visual_Wish_idle_current_ov;
	output [31:0] wb_dat_o_ov;
	input [31:0] wb_dat_o_iv;
  output [3:0] wb_sel_o_ov;
	output wb_we_o_ov;
	output wb_stb_o_ov;
	output wb_cyc_o_ov;
	input up_busy_iv;          
  reg [31:0] up_data_out_ov;
  input [31:0] wb_addr_o_iv;
  reg [31:0] wb_addr_o_ov;
  reg [31:0] wb_dat_o_ov;
  input [3:0] wb_sel_o_iv;
  reg [3:0] wb_sel_o_ov;
  reg wb_we_o_ov;
  reg wb_stb_o_ov;
  wire wb_ack_i;
  wire [31:0] wb_dat_i;
  reg wb_cyc_o_ov;
  wire clock;
  wire reset;
  wire wb_err_in;
  reg up_busy_ov;
  reg [1:0] visual_Wish_idle_current_ov;
	parameter Wish_idle = 2'b00,
            CS_enable = 2'b01,
            Wb_ack    = 2'b10,
            up2w_read = 2'b11;
 
  
  always  @(posedge clock or posedge reset)
  begin : up_2_wishbone_Wish_idle
    if (reset === 1'b1)
    begin
      wb_stb_o_ov <=   1'b0;   
      wb_cyc_o_ov <=   1'b0;    
      wb_addr_o_ov <=   32'h0;
      wb_we_o_ov <=   ~up_rw_b;   
      wb_sel_o_ov <=  4'hf;   
      up_busy_ov <=   1'b0;
      visual_Wish_idle_current_ov <=   Wish_idle;
    end
    else
    begin
      wb_stb_o_ov    <=   wb_stb_o_iv;   
      wb_cyc_o_ov    <=   wb_cyc_o_iv;    
      wb_addr_o_ov   <=   wb_addr_o_iv;
      wb_we_o_ov     <=   wb_we_o_iv;   
      wb_sel_o_ov    <=   wb_sel_o_iv;   
      up_busy_ov     <=   up_busy_iv;
	wb_dat_o_ov    <=   wb_dat_o_iv;
	up_data_out_ov <=   up_data_out_iv;
      visual_Wish_idle_current_ov <=   visual_Wish_idle_current_iv;

      case (visual_Wish_idle_current_iv)
        Wish_idle:
          begin
            if (up_cs_b == 1'b1)
            begin
              visual_Wish_idle_current_ov <=   Wish_idle;
            end
            else if (up_cs_b == 1'b0)
            begin
              wb_addr_o_ov <=   up_addr;   
              wb_stb_o_ov <=   1'b1;
              wb_cyc_o_ov <=   1'b1;
              wb_dat_o_ov <=   up_data_in;
              wb_we_o_ov <=   ~up_rw_b;
              up_busy_ov <=   1'b1;
              visual_Wish_idle_current_ov <=   CS_enable;
            end
            else
              visual_Wish_idle_current_ov <=   Wish_idle;
          end
 
        CS_enable:
          begin
            if ((wb_ack_i == 1'b0) && (wb_err_in == 1'b0))
            begin
              visual_Wish_idle_current_ov <=   CS_enable;
            end
            else if ((wb_ack_i == 1'b1) && (wb_err_in == 1'b0))
            begin
              up_busy_ov <=   1'b0;
              wb_stb_o_ov <=   1'b0;
              visual_Wish_idle_current_ov <=   Wb_ack;
            end
            else if (wb_err_in == 1'b1)
            begin
              wb_stb_o_ov <=   1'b0;   
              wb_cyc_o_ov <=   1'b0;    
              wb_addr_o_ov <=   32'h0;
              wb_we_o_ov <=   ~up_rw_b;   
              wb_sel_o_ov <=  4'hf;   
              up_busy_ov <=   1'b0;
              visual_Wish_idle_current_ov <=   Wish_idle;
            end
            else
              visual_Wish_idle_current_ov <=   CS_enable;
          end
 
        Wb_ack:
          begin
            if (up_rw_b == 1'b0)
            begin
              wb_stb_o_ov <=   1'b0;   
              wb_cyc_o_ov <=   1'b0;    
              wb_addr_o_ov <=   32'h0;
              wb_we_o_ov <=   ~up_rw_b;   
              wb_sel_o_ov <=  4'hf;   
              up_busy_ov <=   1'b0;
              visual_Wish_idle_current_ov <=   Wish_idle;
            end
            else if (up_rw_b == 1'b1)
            begin
              up_data_out_ov <=   wb_dat_i;
              visual_Wish_idle_current_ov <=   up2w_read;
            end
            else
              visual_Wish_idle_current_ov <=   Wb_ack;
          end
 
        up2w_read:
          begin
            wb_stb_o_ov <=   1'b0;   
            wb_cyc_o_ov <=   1'b0;    
            wb_addr_o_ov <=   32'h0;
            wb_we_o_ov <=   ~up_rw_b;   
            wb_sel_o_ov <=  4'hf;   
            up_busy_ov <=   1'b0;
            visual_Wish_idle_current_ov <=   Wish_idle;
          end
 
        default:
          begin
            wb_stb_o_ov <=   1'b0;   
            wb_cyc_o_ov <=   1'b0;    
            wb_addr_o_ov <=   32'h0;
            wb_we_o_ov <=   ~up_rw_b;   
            wb_sel_o_ov <=  4'hf;   
            up_busy_ov <=   1'b0;
            visual_Wish_idle_current_ov <=   Wish_idle;
          end
      endcase
    end
  end
 
 
 
endmodule



module up_2_wishbone_tri (up_data_in_1, up_data_in_2, up_data_in_3, up_addr_1, up_addr_2, up_addr_3, up_cs_b_1, up_cs_b_2, up_cs_b_3, up_rw_b_1, up_rw_b_2, up_rw_b_3, up_data_out_1, up_data_out_2, up_data_out_3,
                      wb_addr_o_1, wb_addr_o_2, wb_addr_o_3, wb_dat_o_1, wb_dat_o_2, wb_dat_o_3, wb_sel_o_1, wb_sel_o_2, wb_sel_o_3, wb_we_o_1, wb_we_o_2, wb_we_o_3, wb_stb_o_1, wb_stb_o_2, wb_stb_o_3,
                      wb_ack_i_1, wb_ack_i_2, wb_ack_i_3, wb_dat_i_1, wb_dat_i_2, wb_dat_i_3, wb_cyc_o_1, wb_cyc_o_2, wb_cyc_o_3, clock_1, clock_2, clock_3, reset_1, reset_2, reset_3, wb_err_in_1, wb_err_in_2, wb_err_in_3,
                      up_busy_1, up_busy_2, up_busy_3
                      );

  input [31:0] up_data_in_1, up_data_in_2, up_data_in_3;
  input [31:0] up_addr_1, up_addr_2, up_addr_3;
  input up_cs_b_1, up_cs_b_2, up_cs_b_3;
  input up_rw_b_1, up_rw_b_2, up_rw_b_3;
  output [31:0] up_data_out_1, up_data_out_2, up_data_out_3;
  output [31:0] wb_addr_o_1, wb_addr_o_2, wb_addr_o_3;
  output [31:0] wb_dat_o_1, wb_dat_o_2, wb_dat_o_3;
  output [3:0] wb_sel_o_1, wb_sel_o_2, wb_sel_o_3;
  output wb_we_o_1, wb_we_o_2, wb_we_o_3;
  output wb_stb_o_1, wb_stb_o_2, wb_stb_o_3;
  input wb_ack_i_1, wb_ack_i_2, wb_ack_i_3;
  input [31:0] wb_dat_i_1, wb_dat_i_2, wb_dat_i_3;
  output wb_cyc_o_1, wb_cyc_o_2, wb_cyc_o_3;
  input clock_1, clock_2, clock_3;
  input reset_1, reset_2, reset_3;
  input wb_err_in_1, wb_err_in_2, wb_err_in_3;
  output up_busy_1, up_busy_2, up_busy_3;          

	wire wb_stb_o_1, wb_stb_o_2, wb_stb_o_3;
	wire wb_cyc_o_1, wb_cyc_o_2, wb_cyc_o_3;
	wire [31:0] wb_addr_o_1, wb_addr_o_2, wb_addr_o_3;
	wire wb_we_o_1, wb_we_o_2, wb_we_o_3;
	wire [3:0] wb_sel_o_1, wb_sel_o_2, wb_sel_o_3;
	wire up_busy_1, up_busy_2, up_busy_3;
	wire [1:0] visual_Wish_idle_current_1, visual_Wish_idle_current_2, visual_Wish_idle_current_3;
	wire [31:0] wb_dat_o_1, wb_dat_o_2, wb_dat_o_3;
	wire [31:0] up_data_out_1, up_data_out_2, up_data_out_3;
	wire wb_stb_o;
	wire wb_cyc_o;
	wire [31:0] wb_addr_o;
	wire wb_we_o;
	wire [3:0] wb_sel_o;
	wire up_busy;
	wire [1:0] visual_Wish_idle_current;
	wire [31:0] wb_dat_o;
	wire [31:0] up_data_out;

	up_2_wishbone_iostate up_2_wishbone_iostate_1   (.up_data_in(up_data_in_1), .up_addr(up_addr_1), .up_cs_b(up_cs_b_1), .up_rw_b(up_rw_b_1), .up_data_out_iv(up_data_out_1), .up_data_out_ov(up_data_out_2),
                      .wb_addr_o_iv(wb_addr_o_1), .wb_addr_o_ov(wb_addr_o_2), .wb_dat_o_iv(wb_dat_o_1), .wb_dat_o_ov(wb_dat_o_2), .wb_sel_o_iv(wb_sel_o_1), .wb_sel_o_ov(wb_sel_o_2), .wb_we_o_iv(wb_we_o_1), .wb_we_o_ov(wb_we_o_2), .wb_stb_o_iv(wb_stb_o_1), .wb_stb_o_ov(wb_stb_o_2),
                      .wb_ack_i(wb_ack_i_1), .wb_dat_i(wb_dat_i_1), .wb_cyc_o_iv(wb_cyc_o_1), .wb_cyc_o_ov(wb_cyc_o_2), .clock(clock_1), .reset(reset_1), .wb_err_in(wb_err_in_1),
                      .up_busy_iv(up_busy_1), .up_busy_ov(up_busy_2), .visual_Wish_idle_current_iv(visual_Wish_idle_current_1), .visual_Wish_idle_current_ov(visual_Wish_idle_current_2));

	up_2_wishbone_iostate up_2_wishbone_iostate_2   (.up_data_in(up_data_in_2), .up_addr(up_addr_2), .up_cs_b(up_cs_b_2), .up_rw_b(up_rw_b_2), .up_data_out_iv(up_data_out_2), .up_data_out_ov(up_data_out_3),
                      .wb_addr_o_iv(wb_addr_o_2), .wb_addr_o_ov(wb_addr_o_3), .wb_dat_o_iv(wb_dat_o_2), .wb_dat_o_ov(wb_dat_o_3), .wb_sel_o_iv(wb_sel_o_2), .wb_sel_o_ov(wb_sel_o_3), .wb_we_o_iv(wb_we_o_2), .wb_we_o_ov(wb_we_o_3), .wb_stb_o_iv(wb_stb_o_2), .wb_stb_o_ov(wb_stb_o_3),
                      .wb_ack_i(wb_ack_i_2), .wb_dat_i(wb_dat_i_2), .wb_cyc_o_iv(wb_cyc_o_2), .wb_cyc_o_ov(wb_cyc_o_3), .clock(clock_2), .reset(reset_2), .wb_err_in(wb_err_in_2),
                      .up_busy_iv(up_busy_2), .up_busy_ov(up_busy_3), .visual_Wish_idle_current_iv(visual_Wish_idle_current_2), .visual_Wish_idle_current_ov(visual_Wish_idle_current_3));

	up_2_wishbone_iostate up_2_wishbone_iostate_3   (.up_data_in(up_data_in_3), .up_addr(up_addr_3), .up_cs_b(up_cs_b_3), .up_rw_b(up_rw_b_3), .up_data_out_iv(up_data_out_3), .up_data_out_ov(up_data_out),
                      .wb_addr_o_iv(wb_addr_o_3), .wb_addr_o_ov(wb_addr_o), .wb_dat_o_iv(wb_dat_o_3), .wb_dat_o_ov(wb_dat_o), .wb_sel_o_iv(wb_sel_o_3), .wb_sel_o_ov(wb_sel_o), .wb_we_o_iv(wb_we_o_3), .wb_we_o_ov(wb_we_o), .wb_stb_o_iv(wb_stb_o_3), .wb_stb_o_ov(wb_stb_o),
                      .wb_ack_i(wb_ack_i_3), .wb_dat_i(wb_dat_i_3), .wb_cyc_o_iv(wb_cyc_o_3), .wb_cyc_o_ov(wb_cyc_o), .clock(clock_3), .reset(reset_3), .wb_err_in(wb_err_in_3),
                      .up_busy_iv(up_busy_3), .up_busy_ov(up_busy), .visual_Wish_idle_current_iv(visual_Wish_idle_current_3), .visual_Wish_idle_current_ov(visual_Wish_idle_current));

	majority_voter #(.WIDTH(106)) mv (
		.in1({wb_stb_o_2, wb_cyc_o_2, wb_addr_o_2, wb_we_o_2, wb_sel_o_2, up_busy_2, visual_Wish_idle_current_2, wb_dat_o_2, up_data_out_2}),
		.in2({wb_stb_o_3, wb_cyc_o_3, wb_addr_o_3, wb_we_o_3, wb_sel_o_3, up_busy_3, visual_Wish_idle_current_3, wb_dat_o_3, up_data_out_3}),
		.in3({wb_stb_o, wb_cyc_o, wb_addr_o, wb_we_o, wb_sel_o, up_busy, visual_Wish_idle_current, wb_dat_o, up_data_out}),
		.out({wb_stb_o_1, wb_cyc_o_1, wb_addr_o_1, wb_we_o_1, wb_sel_o_1, up_busy_1, visual_Wish_idle_current_1, wb_dat_o_1, up_data_out_1}),
		.err()
	);
endmodule




//--------------------------------------------------
//  
//      Verilog code generated by Visual Elite
//
//  Design Unit:
//  ------------
//      Unit    Name  :  nctrl
//      Library Name  :  node_ctrl
//  
//      Creation Date :  Thu Aug  1 16:01:28 2013
//      Version       :  2012.09 v4.4.1 build 33. Date: Nov  1 2012. License: 2012.11
//  
//  Options Used:
//  -------------
//      Target
//         Language   :  As Is
//         Purpose    :  Synthesis
//         Vendor     :  BuildGates
//  
//      Style
//         Use tasks                      :  No
//         Code Destination               :  Combined file
//         Attach Directives              :  Yes
//         Structural                     :  No
//         IF for state selection         :  No
//         Error (default) state          :  Yes
//         String typed state variable    :  No
//         Next state assignments         :  Non blocking
//         Free text style                :  / / ...
//         Preserve spacing for free text :  Yes
//         Declaration alignment          :  No
//         Sort Ports by mode             :  No
//         New line for each Port         :  No
//         Attach comment to Port         :  No
//
//--------------------------------------------------
//--------------------------------------------------
//  
//  Library Name :  node_ctrl
//  Unit    Name :  nctrl
//  Unit    Type :  State Machine
//  
//----------------------------------------------------
 
 

module nctrl_iostate (clock, reset, up_rw_b_i, up_rw_b_o, up_data_out_i, up_data_out_o, up_data_in, up_addr_i, up_addr_o, up_cs_b_i, up_cs_b_o,
              tx_ena_i, tx_ena_o, tx_dav, nc_ready_i, nc_ready_o, rx_dav_i, rx_dav_o, rx_ena, dataw_in, dataw_out_i, dataw_out_o,
              Int_arb_in, up_busy_in, CRE_i, CRE_o, SRA_i, SRA_o, SRB_i, SRB_o, CRA_i, CRA_o, CRB_i, CRB_o, CRC_i, CRC_o, CRD_i, CRD_o, 
              EN_ch_reg_i, EN_ch_reg_o, AckByte_i, AckByte_o, LenRep_i, LenRep_o, TR_i, TR_o, CH_i, CH_o, CMD_i, CMD_o, LEN_i, LEN_o, rep_node_i, 
              rep_node_o, SPI_CTRL_i, SPI_CTRL_o, data_in_tmp_i, data_in_tmp_o, data_in_tmp1_i, data_in_tmp1_o, invalid_cmd_i, invalid_cmd_o, 
              mem0_i, mem0_o, mem1_i, mem1_o, mem2_i, mem2_o, mem3_i, mem3_o, mem4_i, mem4_o, mem5_i, mem5_o, mem6_i, mem6_o, mem7_i, mem7_o, 
              mem8_i, mem8_o, mem9_i, mem9_o, mem10_i, mem10_o, mem11_i, mem11_o, mem12_i, mem12_o, mem13_i, mem13_o, mem14_i, mem14_o, mem15_i, mem15_o, 
              mem16_i, mem16_o, mem17_i, mem17_o, mem18_i, mem18_o, mem19_i, mem19_o, mem20_i, mem20_o, mem21_i, mem21_o, 
              visual_RST_ST_current_i, visual_RST_ST_current_o);
              
	`include "Table_Commande.v"
	
	
	input clock;
	input [6:0] visual_RST_ST_current_i;

	input [7:0] mem21_i;
	input [7:0] mem20_i;
	input [7:0] mem19_i;
	input [7:0] mem18_i;
	input [7:0] mem17_i;
	input [7:0] mem16_i;
	input [7:0] mem15_i;
	input [7:0] mem14_i;
	input [7:0] mem13_i;
	input [7:0] mem12_i;
	input [7:0] mem11_i;
	input [7:0] mem10_i;
	input [7:0] mem9_i;
	input [7:0] mem8_i;
	input [7:0] mem7_i;
	input [7:0] mem6_i;
	input [7:0] mem5_i;
	input [7:0] mem4_i;
	input [7:0] mem3_i;
	input [7:0] mem2_i;
	input [7:0] mem1_i;
	input [7:0] mem0_i;
	input up_rw_b_i;
	input up_cs_b_i;
	input nc_ready_i;
	input invalid_cmd_i;
	input [15:0] data_in_tmp1_i;
	input [15:0] data_in_tmp_i;
	input [atlantic_nb_bit:0] dataw_out_i;
	input [15:0] SPI_CTRL_i;
	input [7:0] rep_node_i;
	input [wb_nb_bit:0] up_addr_i;
	input [7:0] LEN_i;
	input [7:0] CMD_i;
	input [7:0] CH_i;
	input [7:0] TR_i;
	input [7:0] LenRep_i;
	input [7:0] AckByte_i;
	input [31:0] EN_ch_reg_i;
	input [7:0] CRE_i;

	input [7:0] CRD_i;
	input [7:0] CRC_i;
	input [7:0] CRB_i;
	input [7:0] CRA_i;
	input [7:0] SRB_i;
	input [7:0] SRA_i;
	input tx_ena_i;
	input rx_dav_i;

	input reset;
	input [wb_nb_bit:0] up_data_in;
	input tx_dav;
	input rx_ena;
	input [atlantic_nb_bit:0] dataw_in;
	input [5:0] Int_arb_in;
	input up_busy_in;
	output up_rw_b_o;
	output [6:0] visual_RST_ST_current_o;
	output [7:0] mem21_o;
	output [7:0] mem20_o;
	output [7:0] mem19_o;
	output [7:0] mem18_o;
	output [7:0] mem17_o;
	output [7:0] mem16_o;
	output [7:0] mem15_o;
	output [7:0] mem14_o;
	output [7:0] mem13_o;
	output [7:0] mem12_o;
	output [7:0] mem11_o;
	output [7:0] mem10_o;
	output [7:0] mem9_o;
	output [7:0] mem8_o;
	output [7:0] mem7_o;
	output [7:0] mem6_o;
	output [7:0] mem5_o;
	output [7:0] mem4_o;
	output [7:0] mem3_o;
	output [7:0] mem2_o;
	output [7:0] mem1_o;
	output [7:0] mem0_o;
	output [7:0] CRE_o;
	output [wb_nb_bit:0] up_data_out_o;
	input [wb_nb_bit:0] up_data_out_i;
	output [wb_nb_bit:0] up_addr_o;
	output invalid_cmd_o;
	output [15:0] data_in_tmp1_o;
	output [15:0] data_in_tmp_o;
	output up_cs_b_o;
	output [15:0] SPI_CTRL_o;
	output [7:0] rep_node_o;
	output tx_ena_o;
	output [7:0] LEN_o;
	output [7:0] CMD_o;
	output [7:0] CH_o;
	output [7:0] TR_o;
	output [7:0] LenRep_o;
	output [7:0] AckByte_o;
	output [31:0] EN_ch_reg_o;
	output nc_ready_o;
	output [7:0] CRD_o;
	output [7:0] CRC_o;
	output [7:0] CRB_o;
	output [7:0] CRA_o;
	output [7:0] SRB_o;
	output [7:0] SRA_o;
	output rx_dav_o;
	output [atlantic_nb_bit:0] dataw_out_o;
	
  parameter RST_ST         = 7'b0000000,
            ADC_cmd_valid  = 7'b0000001,
            BUSY_STATE     = 7'b0000010,
            CH_errors      = 7'b0000011,
            CMD_ACCEPT     = 7'b0000100,
            DAC_cmd_valid  = 7'b0000101,
            GPIO_cmd_valid = 7'b0000110,
            I2c_cmd_valid  = 7'b0000111,
            IntColli       = 7'b0001000,
            Int_Ack        = 7'b0001001,
            Interr1        = 7'b0001010,
            Jtag_cmd_valid = 7'b0001011,
            REPOS          = 7'b0001100,
            ReadData       = 7'b0001101,
            ReadData_15_0  = 7'b0001110,
            Read_node      = 7'b0001111,
            Reply_d1_d2    = 7'b0010000,
            Rx1_data_sup   = 7'b0010001,
            Rx_Data        = 7'b0010010,
            Rx_word2       = 7'b0010011,
            S28            = 7'b0010100,
            S41            = 7'b0010101,
            S46csb0        = 7'b0010110,
            S47csb1        = 7'b0010111,
            S48busy1       = 7'b0011000,
            SPI_cmd_valid  = 7'b0011001,
            Send2Ack       = 7'b0011010,
            clr_data       = 7'b0011011,
            delai          = 7'b0011100,
            tst_busy       = 7'b0011101,
            tx_dav_ok      = 7'b0011110,
            Sel_CH_spi     = 7'b0011111,
            Read_Wish      = 7'b0100000,
            S0_int_adc     = 7'b0100001,
            S3_int_adc     = 7'b0100010,
            Dec_cmd_CH0    = 7'b0100011,
            NC_invalid     = 7'b0100100,
            Rd_CRA         = 7'b0100101,
            Rd_CRB         = 7'b0100110,
            Rd_CRC         = 7'b0100111,
            Rd_CRD         = 7'b0101000,
            Rd_CRE         = 7'b0101001,
            Wr_CRA         = 7'b0101010,
            Wr_CRB         = 7'b0101011,
            Wr_CRC         = 7'b0101100,
            Wr_CRD         = 7'b0101101,
            Wr_CRE         = 7'b0101110,
            Decod_Cmd_CH1  = 7'b0101111,
            CS_bas         = 7'b0110000,
            S10            = 7'b0110001,
            S9             = 7'b0110010,
            write_up       = 7'b0110011,
            S0cmd3         = 7'b0110100,
            S10_cs_0       = 7'b0110101,
            S3cmd3         = 7'b0110110,
            S4cmd3         = 7'b0110111,
            S6cmd3_Read    = 7'b0111000,
            S7_addten      = 7'b0111001,
            cmd3_write     = 7'b0111010,
            Rd_Gpio_int0   = 7'b0111011,
            Gpio_wr_wait   = 7'b0111100,
            Rd_Gpio_int1   = 7'b0111101,
            Rd_Gpio_int2   = 7'b0111110,
            Rd_Gpio_int3   = 7'b0111111,
            Rd_Gpio_int4   = 7'b1000000,
            Rd_Gpio_int5   = 7'b1000001,
            S0int_i2c      = 7'b1000010,
            S1int_i2c      = 7'b1000011,
            S0_int_jtag    = 7'b1000100,
            S3_int_jtag    = 7'b1000101;
  



	reg up_rw_b_o;
	reg [wb_nb_bit:0] up_data_out_o;
	reg [wb_nb_bit:0] up_addr_o;
	reg up_cs_b_o;
	reg tx_ena_o;
	reg nc_ready_o;
	reg rx_dav_o;
	reg [atlantic_nb_bit:0] dataw_out_o;
	reg [7:0] CRE_o;
	reg [7:0] SRB_o;
	reg [7:0] SRA_o;
	reg [7:0] CRA_o;
	reg [7:0] CH_o;
	reg [7:0] TR_o;
	reg [7:0] CMD_o;
	reg [7:0] LEN_o;
	reg [15:0] data_in_tmp_o;
	reg [7:0] CRB_o;
	reg [7:0] CRC_o;
	reg [7:0] CRD_o;
	reg [15:0] data_in_tmp1_o;
	reg [15:0] SPI_CTRL_o;
	reg [7:0] rep_node_o;
	reg invalid_cmd_o;
	reg [7:0] AckByte_o;
	reg [7:0] LenRep_o;
	reg [31:0] EN_ch_reg_o;
	reg [7:0] mem0_o;
	reg [7:0] mem1_o;
	reg [7:0] mem2_o;
	reg [7:0] mem3_o;
	reg [7:0] mem4_o;
	reg [7:0] mem5_o;
	reg [7:0] mem6_o;
	reg [7:0] mem7_o;
	reg [7:0] mem8_o;
	reg [7:0] mem9_o;
	reg [7:0] mem10_o;
	reg [7:0] mem11_o;
	reg [7:0] mem12_o;
	reg [7:0] mem13_o;
	reg [7:0] mem14_o;
	reg [7:0] mem15_o;
	reg [7:0] mem16_o;
	reg [7:0] mem17_o;
	reg [7:0] mem18_o;
	reg [7:0] mem19_o;
	reg [7:0] mem20_o;
	reg [7:0] mem21_o;
	reg [6:0] visual_RST_ST_current_o;
	
	
	function [7:0] read_mem;
	input [4:0] adr;
  	begin
      case(adr[4:0])
             0:read_mem = mem0_i;
  		 1:read_mem = mem1_i; 
  		 2:read_mem = mem2_i;  
  		 3:read_mem = mem3_i; 
  		 4:read_mem = mem4_i; 
  		 5:read_mem = mem5_i; 
  		 6:read_mem = mem6_i; 
  		 7:read_mem = mem7_i; 
  		 8:read_mem = mem8_i; 
  		 9:read_mem = mem9_i;
  		10:read_mem = mem10_i;
  		11:read_mem = mem11_i;
  		12:read_mem = mem12_i;
  		13:read_mem = mem13_i;
  		14:read_mem = mem14_i;
  		15:read_mem = mem15_i;
  		16:read_mem = mem16_i;
  		17:read_mem = mem17_i;
  		18:read_mem = mem18_i;
  		19:read_mem = mem19_i;
  		20:read_mem = mem20_i;
  		21:read_mem = mem21_i;
  		default: read_mem = 8'h00;
  	endcase
  end
  endfunction
 
  
  always  @(posedge clock or posedge reset)
  begin : nctrl_RST_ST
 
    if (reset == 1'b1)
    begin
      rx_dav_o <=   1'b0;
      tx_ena_o <=   1'b0;
      dataw_out_o <=   16'h0000;
      SRA_o <=   8'h00;
      SRB_o <=   8'h00;
      CRA_o <=   8'h00;
      CRB_o <=   8'h00;
      CRC_o <=   8'h00;
      CRD_o <=   8'h00;
      CRE_o <=   8'h00;
      EN_ch_reg_o <=   32'h00000001;
      AckByte_o <=   8'h00;
      LenRep_o <=   8'h00;
      TR_o <=   8'h00;
      CH_o <=   8'h00;
      CMD_o <=   8'h00;
      LEN_o <=   8'h00;
      up_addr_o <=   32'h00000000;
      rep_node_o <=   8'h00;
      SPI_CTRL_o <=   16'h0000;
      nc_ready_o <=   1'b0;
      data_in_tmp_o <=   16'h0000;
      data_in_tmp1_o <=   16'h0000;
      invalid_cmd_o <=   1'b0;
      up_cs_b_o <=   1'b1;
      up_rw_b_o <=   1'b0;
      up_data_out_o <=   32'h00000000;
      mem0_o  <=   8'h00;  
      mem1_o  <=   8'h00;
      mem2_o  <=   8'h00;  
      mem3_o  <=   8'h00;
      mem4_o  <=   8'h00;  
      mem5_o  <=   8'h00;
      mem6_o  <=   8'h00;  
      mem7_o  <=   8'h00;
      mem8_o  <=   8'h00;  
      mem9_o  <=   8'h00;
      mem10_o <=   8'h00; 
      mem11_o <=   8'h00;
      mem12_o <=   8'h00;  
      mem13_o <=   8'h00;
      mem14_o <=   8'h00;  
      mem15_o <=   8'h00;
      mem16_o <=   8'h00;  
      mem17_o <=   8'h00;
      mem18_o <=   8'h00;  
      mem19_o <=   8'h00;
      mem20_o <=   8'h00;  
      mem21_o <=   8'h00;
      visual_RST_ST_current_o <=   RST_ST;
      
 
    end
    else
    begin
            rx_dav_o       <=   rx_dav_i;
            tx_ena_o       <=   tx_ena_i;
            dataw_out_o    <=   dataw_out_i;
            SRA_o          <=   SRA_i;
            SRB_o          <=   SRB_i;
            CRA_o          <=   CRA_i;
            CRB_o          <=   CRB_i;
            CRC_o          <=   CRC_i;
            CRD_o          <=   CRD_i;
            CRE_o          <=   CRE_i;
            EN_ch_reg_o    <=   EN_ch_reg_i;
            AckByte_o      <=   AckByte_i;
            LenRep_o       <=   LenRep_i;
            TR_o           <=   TR_i;
            CH_o           <=   CH_i;
            CMD_o          <=   CMD_i;
            LEN_o          <=   LEN_i;
            up_addr_o      <=   up_addr_i;
            rep_node_o     <=   rep_node_i;
            SPI_CTRL_o     <=   SPI_CTRL_i;
            nc_ready_o     <=   nc_ready_i;
            data_in_tmp_o  <=   data_in_tmp_i;
            data_in_tmp1_o <=   data_in_tmp1_i;
            invalid_cmd_o  <=   invalid_cmd_i;
            up_cs_b_o      <=   up_cs_b_i;
            up_rw_b_o      <=   up_rw_b_i;
            up_data_out_o  <=   up_data_out_i;
            
            mem0_o         <=   mem0_i;  
            mem1_o         <=   mem1_i;
            mem2_o         <=   mem2_i;  
            mem3_o         <=   mem3_i;
            mem4_o         <=   mem4_i;  
            mem5_o         <=   mem5_i;
            mem6_o         <=   mem6_i;  
            mem7_o         <=   mem7_i;
            mem8_o         <=   mem8_i;  
            mem9_o         <=   mem9_i;
            mem10_o        <=   mem10_i; 
            mem11_o        <=   mem11_i;
            mem12_o        <=   mem12_i;  
            mem13_o        <=   mem13_i;
            mem14_o        <=   mem14_i;  
            mem15_o        <=   mem15_i;
            mem16_o        <=   mem16_i;  
            mem17_o        <=   mem17_i;
            mem18_o        <=   mem18_i;  
            mem19_o        <=   mem19_i;
            mem20_o        <=   mem20_i;  
		mem21_o        <=   mem21_i;
		
		visual_RST_ST_current_o <=   visual_RST_ST_current_i; 
		
      case (visual_RST_ST_current_i)
        RST_ST:
          begin
            
            up_cs_b_o <=   1'b1;
            up_rw_b_o <=   1'b1;     
            tx_ena_o <=   1'b0;
            nc_ready_o <=   1'b1;
            rx_dav_o <=   1'b1;     
            invalid_cmd_o <=   1'b0;
            AckByte_o <=   8'h00;
            LenRep_o <=   8'h00;
            visual_RST_ST_current_o <=   REPOS;
          end
 
        ADC_cmd_valid:
          begin
            if (invalid_cmd_i == 1'b1)
            begin
              
              
          	case(CH_i[4:0])
          	 0:mem0_o   <=   8'h00;
  		 1:mem1_o   <=   8'h00; 
  		 2:mem2_o   <=   8'h00;  
  		 3:mem3_o   <=   8'h00; 
  		 4:mem4_o   <=   8'h00; 
  		 5:mem5_o   <=   8'h00; 
  		 6:mem6_o   <=   8'h00; 
  		 7:mem7_o   <=   8'h00; 
  		 8:mem8_o   <=   8'h00; 
  		 9:mem9_o   <=   8'h00;
  		10:mem10_o  <=   8'h00;
  		11:mem11_o  <=   8'h00;
  		12:mem12_o  <=   8'h00;
  		13:mem13_o  <=   8'h00;
  		14:mem14_o  <=   8'h00;
  		15:mem15_o  <=   8'h00;
  		16:mem16_o  <=   8'h00;
  		17:mem17_o  <=   8'h00;
  		18:mem18_o  <=   8'h00;
  		19:mem19_o  <=   8'h00;
  		20:mem20_o  <=   8'h00;
  		21:mem21_o  <=   8'h00;
  		endcase
 
              visual_RST_ST_current_o <=   clr_data;
            end
            else if (invalid_cmd_i == 1'b0)
            begin
              visual_RST_ST_current_o <=   Decod_Cmd_CH1;
            end
            else
              visual_RST_ST_current_o <=   ADC_cmd_valid;
          end
 
        BUSY_STATE:
          begin
            if (tx_dav == 1'b0)
            begin
              visual_RST_ST_current_o <=   BUSY_STATE;
            end
            else if (tx_dav == 1'b1)
            begin
              tx_ena_o <=   1'b1;
              dataw_out_o[15:8] <=   CH_i[7:0];
              dataw_out_o[7:0] <=   TR_i[7:0];
              up_cs_b_o <=   1'b1;
              visual_RST_ST_current_o <=   tx_dav_ok;
            end
            else
              visual_RST_ST_current_o <=   BUSY_STATE;
          end
 
        CH_errors:
          begin
            if (tx_dav == 1'b0)
            begin
              visual_RST_ST_current_o <=   CH_errors;
            end
            else if (tx_dav == 1'b1)
            begin
              tx_ena_o <=   1'b1;
              dataw_out_o[15:8] <=   CH_i[7:0];
              dataw_out_o[7:0] <=   TR_i[7:0];
              visual_RST_ST_current_o <=   S28;
            end
            else
              visual_RST_ST_current_o <=   CH_errors;
          end
 
        CMD_ACCEPT:
          begin
            if (rx_ena == 1'b1)
            begin
              data_in_tmp1_o <=   dataw_in;
              visual_RST_ST_current_o <=   Rx_Data;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_NODE))
            begin
              LenRep_o <=   8'h03;  
              visual_RST_ST_current_o <=   Dec_cmd_CH0;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_SPI))
            begin
              case (CMD_i)
                SPI_wrt_TX0,
                SPI_rea_RX0,
		SPI_wrt_TX1,
		SPI_rea_RX1,
		SPI_wrt_TX2,
		SPI_rea_RX2,
		SPI_wrt_TX3,
		SPI_rea_RX3,
		SPI_wrt_ctrl,
		SPI_rea_ctrl,
		SPI_wrt_DIV,
		SPI_rea_DIV,
		SPI_wrt_SS,
		SPI_rea_SS, 
		SPI_go:     
                      invalid_cmd_o <=   1'b0;
              default:
                invalid_cmd_o <=   1'b1;
              endcase
 
              if(CMD_i == SPI_wrt_ctrl)
                  data_in_tmp_o[12] <=   1'b1;  
              visual_RST_ST_current_o <=   SPI_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_GPIO))
            begin
              case(CMD_i)
                GPIO_R_DAT_IN,GPIO_W_DAT_OUT,GPIO_R_DAT_OUT,GPIO_W_OE:
                  invalid_cmd_o <=   1'b0;
                GPIO_R_WE,GPIO_W_INTE,GPIO_R_INTE,GPIO_W_PTRIG,GPIO_R_PTRIG:
                  invalid_cmd_o <=   1'b0;
                GPIO_W_AUX,GPIO_R_AUX,GPIO_W_CTRL,GPIO_R_CTRL,GPIO_W_INTS
              ,GPIO_R_INTS:
                   invalid_cmd_o <=   1'b0;
                GPIO_W_ECLK,GPIO_R_ECLK,GPIO_W_NEC,GPIO_R_NEC:
                    invalid_cmd_o <=   1'b0;
 
              default:
                invalid_cmd_o <=   1'b1;
              endcase
              visual_RST_ST_current_o <=   GPIO_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && ((CH_i >= CH_I2C0) && (CH_I2C15 >= CH_i )))
            begin
              case (CMD_i)
  
               I2C_READ_SRA,I2C_WRITE_MSK,I2C_READ_MSK,I2C_WRITE_CRA
              ,I2C_READ_CRA:  // commande direct wb reg
                  invalid_cmd_o <=   1'b0;
 
               I2C_1BYTE_WRITE,I2C_1BYTE_READ,I2C_1BYTE_WRITE_EXT
              ,I2C_1byte_READ_EXT,I2C_1byte_rmw_OR,I2C_1byte_rmw_XOR,8'hC2:
              // commande pour i2c-ccu compatib.
                  invalid_cmd_o <=   1'b0;
 
                 I2C_W_multi_4byte0,I2C_W_multi_4byte1,I2C_W_multi_4byte2 ,
               I2C_W_multi_4byte3,I2C_write_multi ,I2C_read_multi:
              // commande multibyte
                  invalid_cmd_o <=   1'b0;
 
                 I2C_R_multi_4byte0,I2C_R_multi_4byte1,I2C_R_multi_4byte2
              ,I2C_R_multi_4byte3:
                   invalid_cmd_o <=   1'b0;
 
                 I2C_write_multi_ext,I2C_read_multi_ext:
              // commande multi byte mode ext 10 bit addr
                   invalid_cmd_o <=   1'b0;

              default:
                 invalid_cmd_o <=   1'b1;
              endcase
              visual_RST_ST_current_o <=   I2c_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_DAC))
            begin
              case (CMD_i)
                DAC_W_CH1,DAC_R_CH1,DAC_W_CH2,DAC_R_CH2,DAC_W_CH3,DAC_R_CH3
              ,DAC_W_CH4,DAC_R_CH4:
                invalid_cmd_o <=   1'b0;
              default:
                invalid_cmd_o <=   1'b1;
              endcase
              visual_RST_ST_current_o <=   DAC_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_JTAG))
            begin
              case (CMD_i)
                     JTG_w_TDO_tx0,
                     JTG_r_TDI_rx0,
                     JTG_w_TDO_tx1,
                     JTG_r_TDI_rx1,
                     JTG_w_TDO_tx2,
                     JTG_r_TDI_rx2,
                     JTG_w_TDO_tx3,
                     JTG_r_TDI_rx3,
                     JTG_w_TMS_tx0,
                     JTG_r_TMS_tx0,
                     JTG_w_TMS_tx1,
                     JTG_r_TMS_tx1,
                     JTG_w_TMS_tx2,
                     JTG_r_TMS_tx2,
                     JTG_w_TMS_tx3,
                     JTG_r_TMS_tx3,
                     JTG_w_ctrl,
                     JTG_r_crtl,
                     JTG_w_div,
                     JTG_r_div,
                     JTG_go_auto,
                     JTG_go_manual,
                     JTAG_status,
		     JTAG_RES, 
		     SEU_read,  
		     SEU_clear:    
                     invalid_cmd_o <=   1'b0;
                default:
                  invalid_cmd_o <=   1'b1;
              endcase
              if(CMD_i == JTG_w_ctrl)
                   data_in_tmp1_o[12] <=   1'b1;
              
              visual_RST_ST_current_o <=   Jtag_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_ADC))
            begin
              case(CMD_i)
                     ADC_GO,      
                     ADC_W_MUX,    
                     ADC_R_MUX,    
                     ADC_W_GAIN,   
                     ADC_R_GAIN,   
                     ADC_R_ID,     
                     ADC_W_CURR,  
                     ADC_R_CURR,   
                     ADC_R_DATA,   
                     ADC_R_CTRL,   
                     ADC_R_CWD,    
                     ADC_R_OFFSET, 
                     FUSE_W_ID,    
                     FUSE_R_ID,   
                     FUSE_W_GAIN,  
                     FUSE_R_GAIN:  
		 invalid_cmd_o <=   1'b0;
 
              default:
                 invalid_cmd_o <=   1'b1;
              endcase
              visual_RST_ST_current_o <=   ADC_cmd_valid;
            end
            else
              visual_RST_ST_current_o <=   CMD_ACCEPT;
          end
 
        DAC_cmd_valid:
          begin
            if (invalid_cmd_i == 1'b1)
            begin
              
              case(CH_i[4:0])
             0:mem0_o   <=   8'h00;
  		 1:mem1_o   <=   8'h00; 
  		 2:mem2_o   <=   8'h00;  
  		 3:mem3_o   <=   8'h00; 
  		 4:mem4_o   <=   8'h00; 
  		 5:mem5_o   <=   8'h00; 
  		 6:mem6_o   <=   8'h00; 
  		 7:mem7_o   <=   8'h00; 
  		 8:mem8_o   <=   8'h00; 
  		 9:mem9_o   <=   8'h00;
  		10:mem10_o  <=   8'h00;
  		11:mem11_o  <=   8'h00;
  		12:mem12_o  <=   8'h00;
  		13:mem13_o  <=   8'h00;
  		14:mem14_o  <=   8'h00;
  		15:mem15_o  <=   8'h00;
  		16:mem16_o  <=   8'h00;
  		17:mem17_o  <=   8'h00;
  		18:mem18_o  <=   8'h00;
  		19:mem19_o  <=   8'h00;
  		20:mem20_o  <=   8'h00;
  		21:mem21_o  <=   8'h00;
  		endcase
              visual_RST_ST_current_o <=   clr_data;
            end
            else if (invalid_cmd_i == 1'b0)
            begin
              visual_RST_ST_current_o <=   Decod_Cmd_CH1;
            end
            else
              visual_RST_ST_current_o <=   DAC_cmd_valid;
          end
 
        GPIO_cmd_valid:
          begin
            if (invalid_cmd_i == 1'b1)
            begin
              
              case(CH_i[4:0])
             0:mem0_o   <=   8'h00;
  		 1:mem1_o   <=   8'h00; 
  		 2:mem2_o   <=   8'h00;  
  		 3:mem3_o   <=   8'h00; 
  		 4:mem4_o   <=   8'h00; 
  		 5:mem5_o   <=   8'h00; 
  		 6:mem6_o   <=   8'h00; 
  		 7:mem7_o   <=   8'h00; 
  		 8:mem8_o   <=   8'h00; 
  		 9:mem9_o   <=   8'h00;
  		10:mem10_o  <=   8'h00;
  		11:mem11_o  <=   8'h00;
  		12:mem12_o  <=   8'h00;
  		13:mem13_o  <=   8'h00;
  		14:mem14_o  <=   8'h00;
  		15:mem15_o  <=   8'h00;
  		16:mem16_o  <=   8'h00;
  		17:mem17_o  <=   8'h00;
  		18:mem18_o  <=   8'h00;
  		19:mem19_o  <=   8'h00;
  		20:mem20_o  <=   8'h00;
  		21:mem21_o  <=   8'h00;
  		endcase
              visual_RST_ST_current_o <=   clr_data;
            end
            else if (invalid_cmd_i == 1'b0)
            begin
              visual_RST_ST_current_o <=   Decod_Cmd_CH1;
            end
            else
              visual_RST_ST_current_o <=   GPIO_cmd_valid;
          end
 
        I2c_cmd_valid:
          begin
            if (invalid_cmd_i == 1'b0)
            begin
              up_rw_b_o <=   CMD_i[0];
              visual_RST_ST_current_o <=   S0cmd3;
            end
            else if (invalid_cmd_i == 1'b1)
            begin
              
             case(CH_i[4:0])
             0:mem0_o   <=   8'h00;
  		 1:mem1_o   <=   8'h00; 
  		 2:mem2_o   <=   8'h00;  
  		 3:mem3_o   <=   8'h00; 
  		 4:mem4_o   <=   8'h00; 
  		 5:mem5_o   <=   8'h00; 
  		 6:mem6_o   <=   8'h00; 
  		 7:mem7_o   <=   8'h00; 
  		 8:mem8_o   <=   8'h00; 
  		 9:mem9_o   <=   8'h00;
  		10:mem10_o  <=   8'h00;
  		11:mem11_o  <=   8'h00;
  		12:mem12_o  <=   8'h00;
  		13:mem13_o  <=   8'h00;
  		14:mem14_o  <=   8'h00;
  		15:mem15_o  <=   8'h00;
  		16:mem16_o  <=   8'h00;
  		17:mem17_o  <=   8'h00;
  		18:mem18_o  <=   8'h00;
  		19:mem19_o  <=   8'h00;
  		20:mem20_o  <=   8'h00;
  		21:mem21_o  <=   8'h00;
  		endcase
              visual_RST_ST_current_o <=   clr_data;
            end
            else
              visual_RST_ST_current_o <=   I2c_cmd_valid;
          end
 
        IntColli:
          begin
            if (rx_ena)
            begin
              rx_dav_o <=   1'b0;
              CH_o[7:0] <=   dataw_in[15:8];
              TR_o[7:0] <=   dataw_in[7:0];
              visual_RST_ST_current_o <=   tst_busy;
            end
            else if (rx_ena == 1'b0)
            begin
              
              TR_o <=   read_mem(Int_arb_in[4:0]);
              
              CH_o[7:0] <=   {1'b0,1'b0,Int_arb_in[5:0]};
              rx_dav_o <=   1'b0;  
              visual_RST_ST_current_o <=   Int_Ack;
            end
            else
              visual_RST_ST_current_o <=   IntColli;
          end
 
        Int_Ack:
          begin
            if (Int_arb_in == CH_SPI[5:0])
            begin
              visual_RST_ST_current_o <=   Sel_CH_spi;
            end
            else if (Int_arb_in == CH_GPIO[5:0])
            begin
              CH_o <=   8'h02 ; 
              TR_o <=   8'hff;   

              visual_RST_ST_current_o <=   Rd_Gpio_int0;
            end
            else if (Int_arb_in == CH_JTAG[5:0])
            begin
              visual_RST_ST_current_o <=   S0_int_jtag;
            end
            else if ((Int_arb_in) >= CH_I2C0[5:0] && (CH_I2C15[5:0] >= Int_arb_in))
            begin
              visual_RST_ST_current_o <=   S0int_i2c;
            end
            else if (Int_arb_in == CH_ADC[5:0])
            begin
              visual_RST_ST_current_o <=   S0_int_adc;
            end
            else
              visual_RST_ST_current_o <=   Int_Ack;
          end
 
        Interr1:
          begin
            dataw_out_o[15:0] <=   up_data_in[15:0];
            visual_RST_ST_current_o <=   ReadData_15_0;
          end
 
        Jtag_cmd_valid:
          begin
            if (invalid_cmd_i == 1'b0)
            begin
              visual_RST_ST_current_o <=   Decod_Cmd_CH1;
            end
            else if (invalid_cmd_i == 1'b1)
            begin
              
             case(CH_i[4:0])
             0:mem0_o   <=   8'h00;
  		 1:mem1_o   <=   8'h00; 
  		 2:mem2_o   <=   8'h00;  
  		 3:mem3_o   <=   8'h00; 
  		 4:mem4_o   <=   8'h00; 
  		 5:mem5_o   <=   8'h00; 
  		 6:mem6_o   <=   8'h00; 
  		 7:mem7_o   <=   8'h00; 
  		 8:mem8_o   <=   8'h00; 
  		 9:mem9_o   <=   8'h00;
  		10:mem10_o  <=   8'h00;
  		11:mem11_o  <=   8'h00;
  		12:mem12_o  <=   8'h00;
  		13:mem13_o  <=   8'h00;
  		14:mem14_o  <=   8'h00;
  		15:mem15_o  <=   8'h00;
  		16:mem16_o  <=   8'h00;
  		17:mem17_o  <=   8'h00;
  		18:mem18_o  <=   8'h00;
  		19:mem19_o  <=   8'h00;
  		20:mem20_o  <=   8'h00;
  		21:mem21_o  <=   8'h00;
  		endcase
              visual_RST_ST_current_o <=   clr_data;
            end
            else
              visual_RST_ST_current_o <=   Jtag_cmd_valid;
          end
 
        REPOS:
          begin
            if (rx_ena)
            begin
              rx_dav_o <=   1'b0;
              CH_o[7:0] <=   dataw_in[15:8];
              TR_o[7:0] <=   dataw_in[7:0];
              visual_RST_ST_current_o <=   tst_busy;
            end
            else if (Int_arb_in != 6'b000000)
            begin
              rx_dav_o <=   1'b0;
              visual_RST_ST_current_o <=   delai;
            end
            else if ((rx_ena == 1'b0) && (Int_arb_in == 6'b000000))
            begin
              visual_RST_ST_current_o <=   REPOS;
            end
            else
              visual_RST_ST_current_o <=   REPOS;
          end
 
        ReadData:
          begin
            dataw_out_o[15:0] <=   up_data_in[15:0];
            visual_RST_ST_current_o <=   ReadData_15_0;
          end
 
        ReadData_15_0:
          begin
            
            up_cs_b_o <=   1'b1;
            up_rw_b_o <=   1'b1;     
            tx_ena_o <=   1'b0;
            nc_ready_o <=   1'b1;
            rx_dav_o <=   1'b1;     
            invalid_cmd_o <=   1'b0;
            AckByte_o <=   8'h00;
            LenRep_o <=   8'h00;
            visual_RST_ST_current_o <=   REPOS;
          end
 
        Read_node:
          begin
            dataw_out_o[15:8] <=   rep_node_i[7:0];
            dataw_out_o[7:0] <=   8'h00 ;  
            visual_RST_ST_current_o <=   Reply_d1_d2;
          end
 
        Reply_d1_d2:
          begin
            
            up_cs_b_o <=   1'b1;
            up_rw_b_o <=   1'b1;     
            tx_ena_o <=   1'b0;
            nc_ready_o <=   1'b1;
            rx_dav_o <=   1'b1;     
            invalid_cmd_o <=   1'b0;
            AckByte_o <=   8'h00;
            LenRep_o <=   8'h00;
            visual_RST_ST_current_o <=   REPOS;
          end
 
        Rx1_data_sup:
          begin
            if (rx_ena == 1'b1)
            begin
              visual_RST_ST_current_o <=   Rx1_data_sup;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_NODE))
            begin
              LenRep_o <=   8'h03;  
              visual_RST_ST_current_o <=   Dec_cmd_CH0;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_SPI))
            begin
              case (CMD_i)
                SPI_wrt_TX0,
                SPI_rea_RX0,
		SPI_wrt_TX1,
		SPI_rea_RX1,
		SPI_wrt_TX2,
		SPI_rea_RX2,
		SPI_wrt_TX3,
		SPI_rea_RX3,
		SPI_wrt_ctrl,
		SPI_rea_ctrl,
		SPI_wrt_DIV,
		SPI_rea_DIV,
		SPI_wrt_SS,
		SPI_rea_SS, 
		SPI_go: 
                      invalid_cmd_o <=   1'b0;
              default:
                invalid_cmd_o <=   1'b1;
              endcase
 
              if(CMD_i == SPI_wrt_ctrl)
                  data_in_tmp_o[12] <=   1'b1;  
              visual_RST_ST_current_o <=   SPI_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_GPIO))
            begin
              case(CMD_i)
                GPIO_R_DAT_IN,GPIO_W_DAT_OUT,GPIO_R_DAT_OUT,GPIO_W_OE:
                  invalid_cmd_o <=   1'b0;
                GPIO_R_WE,GPIO_W_INTE,GPIO_R_INTE,GPIO_W_PTRIG,GPIO_R_PTRIG:
                  invalid_cmd_o <=   1'b0;
                GPIO_W_AUX,GPIO_R_AUX,GPIO_W_CTRL,GPIO_R_CTRL,GPIO_W_INTS
              ,GPIO_R_INTS:
                   invalid_cmd_o <=   1'b0;
                GPIO_W_ECLK,GPIO_R_ECLK,GPIO_W_NEC,GPIO_R_NEC:
                    invalid_cmd_o <=   1'b0;
 
              default:
                invalid_cmd_o <=   1'b1;
              endcase
              visual_RST_ST_current_o <=   GPIO_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && ((CH_i >= CH_I2C0) && (CH_I2C15 >= CH_i )))
            begin
              case (CMD_i)
 
               I2C_READ_SRA,I2C_WRITE_MSK,I2C_READ_MSK,I2C_WRITE_CRA
              ,I2C_READ_CRA:  // commande direct wb reg
                  invalid_cmd_o <=   1'b0;
 
               I2C_1BYTE_WRITE,I2C_1BYTE_READ,I2C_1BYTE_WRITE_EXT
              ,I2C_1byte_READ_EXT,I2C_1byte_rmw_OR,I2C_1byte_rmw_XOR,8'hC2:
              // commande pour i2c-ccu compatib.
                  invalid_cmd_o <=   1'b0;
 
                 I2C_W_multi_4byte0,I2C_W_multi_4byte1,I2C_W_multi_4byte2 ,
               I2C_W_multi_4byte3,I2C_write_multi ,I2C_read_multi:
              // commande multibyte
                  invalid_cmd_o <=   1'b0;
 
                 I2C_R_multi_4byte0,I2C_R_multi_4byte1,I2C_R_multi_4byte2
              ,I2C_R_multi_4byte3:
                   invalid_cmd_o <=   1'b0;
 
                 I2C_write_multi_ext,I2C_read_multi_ext:
              // commande multi byte mode ext 10 bit addr
                   invalid_cmd_o <=   1'b0;
 
              default:
                 invalid_cmd_o <=   1'b1;
              endcase
              visual_RST_ST_current_o <=   I2c_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_DAC))
            begin
              case (CMD_i)
                DAC_W_CH1,DAC_R_CH1,DAC_W_CH2,DAC_R_CH2,DAC_W_CH3,DAC_R_CH3
              ,DAC_W_CH4,DAC_R_CH4:
                invalid_cmd_o <=   1'b0;
              default:
                invalid_cmd_o <=   1'b1;
              endcase
              visual_RST_ST_current_o <=   DAC_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_JTAG))
            begin
              case (CMD_i)
                     JTG_w_TDO_tx0,
                     JTG_r_TDI_rx0,
                     JTG_w_TDO_tx1,
                     JTG_r_TDI_rx1,
                     JTG_w_TDO_tx2,
                     JTG_r_TDI_rx2,
                     JTG_w_TDO_tx3,
                     JTG_r_TDI_rx3,
                     JTG_w_TMS_tx0,
                     JTG_r_TMS_tx0,
                     JTG_w_TMS_tx1,
                     JTG_r_TMS_tx1,
                     JTG_w_TMS_tx2,
                     JTG_r_TMS_tx2,
                     JTG_w_TMS_tx3,
                     JTG_r_TMS_tx3,
                     JTG_w_ctrl,
                     JTG_r_crtl,
                     JTG_w_div,
                     JTG_r_div,
                     JTG_go_auto,
                     JTG_go_manual,
                     JTAG_status,
		     JTAG_RES, 
		     SEU_read,  
		     SEU_clear:
                     invalid_cmd_o <=   1'b0;
                default:
                  invalid_cmd_o <=   1'b1;
              endcase
              if(CMD_i == JTG_w_ctrl)
                   data_in_tmp1_o[12] <=   1'b1;
              
              visual_RST_ST_current_o <=   Jtag_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_ADC))
            begin
              case(CMD_i)
                     ADC_GO,      
                     ADC_W_MUX,    
                     ADC_R_MUX,    
                     ADC_W_GAIN,   
                     ADC_R_GAIN,   
                     ADC_R_ID,     
                     ADC_W_CURR,  
                     ADC_R_CURR,   
                     ADC_R_DATA,   
                     ADC_R_CTRL,   
                     ADC_R_CWD,    
                     ADC_R_OFFSET, 
                     FUSE_W_ID,    
                     FUSE_R_ID,   
                     FUSE_W_GAIN,  
                     FUSE_R_GAIN:
                   invalid_cmd_o <=   1'b0;
 
 
              default:
                 invalid_cmd_o <=   1'b1;
              endcase
              visual_RST_ST_current_o <=   ADC_cmd_valid;
            end
            else
              visual_RST_ST_current_o <=   Rx1_data_sup;
          end
 
        Rx_Data:
          begin
            if (rx_ena == 1'b1)
            begin
              
              visual_RST_ST_current_o <=   Rx1_data_sup;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_NODE))
            begin
              LenRep_o <=   8'h03;  
              visual_RST_ST_current_o <=   Dec_cmd_CH0;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_SPI))
            begin
              case (CMD_i)
                SPI_wrt_TX0,
                SPI_rea_RX0,
		SPI_wrt_TX1,
		SPI_rea_RX1,
		SPI_wrt_TX2,
		SPI_rea_RX2,
		SPI_wrt_TX3,
		SPI_rea_RX3,
		SPI_wrt_ctrl,
		SPI_rea_ctrl,
		SPI_wrt_DIV,
		SPI_rea_DIV,
		SPI_wrt_SS,
		SPI_rea_SS, 
		SPI_go: 
                      invalid_cmd_o <=   1'b0;
              default:
                invalid_cmd_o <=   1'b1;
              endcase
 
              if(CMD_i == SPI_wrt_ctrl)
                  data_in_tmp_o[12] <=   1'b1;  
              visual_RST_ST_current_o <=   SPI_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_GPIO))
            begin
              case(CMD_i)
                GPIO_R_DAT_IN,GPIO_W_DAT_OUT,GPIO_R_DAT_OUT,GPIO_W_OE:
                  invalid_cmd_o <=   1'b0;
                GPIO_R_WE,GPIO_W_INTE,GPIO_R_INTE,GPIO_W_PTRIG,GPIO_R_PTRIG:
                  invalid_cmd_o <=   1'b0;
                GPIO_W_AUX,GPIO_R_AUX,GPIO_W_CTRL,GPIO_R_CTRL,GPIO_W_INTS,GPIO_R_INTS:
                   invalid_cmd_o <=   1'b0;
                GPIO_W_ECLK,GPIO_R_ECLK,GPIO_W_NEC,GPIO_R_NEC:
                    invalid_cmd_o <=   1'b0;
 
              default:
                invalid_cmd_o <=   1'b1;
              endcase
              visual_RST_ST_current_o <=   GPIO_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && ((CH_i >= CH_I2C0) && (CH_I2C15 >= CH_i)))
            begin
              case (CMD_i)
 
               I2C_READ_SRA,I2C_WRITE_MSK,I2C_READ_MSK,I2C_WRITE_CRA
              ,I2C_READ_CRA:  // commande direct wb reg
                  invalid_cmd_o <=   1'b0;
 
               I2C_1BYTE_WRITE,I2C_1BYTE_READ,I2C_1BYTE_WRITE_EXT
              ,I2C_1byte_READ_EXT,I2C_1byte_rmw_OR,I2C_1byte_rmw_XOR,8'hC2:
              // commande pour i2c-ccu compatib.
                  invalid_cmd_o <=   1'b0;
 
                 I2C_W_multi_4byte0,I2C_W_multi_4byte1,I2C_W_multi_4byte2 ,
               I2C_W_multi_4byte3,I2C_write_multi ,I2C_read_multi:
              // commande multibyte
                  invalid_cmd_o <=   1'b0;
 
                 I2C_R_multi_4byte0,I2C_R_multi_4byte1,I2C_R_multi_4byte2
              ,I2C_R_multi_4byte3:
                   invalid_cmd_o <=   1'b0;
 
                 I2C_write_multi_ext,I2C_read_multi_ext:
              // commande multi byte mode ext 10 bit addr
                   invalid_cmd_o <=   1'b0;
 
              default:
                 invalid_cmd_o <=   1'b1;
              endcase
              visual_RST_ST_current_o <=   I2c_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_DAC))
            begin
              case (CMD_i)
                DAC_W_CH1,DAC_R_CH1,DAC_W_CH2,DAC_R_CH2,DAC_W_CH3,DAC_R_CH3
              ,DAC_W_CH4,DAC_R_CH4:
                invalid_cmd_o <=   1'b0;
              default:
                invalid_cmd_o <=   1'b1;
              endcase
              visual_RST_ST_current_o <=   DAC_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_JTAG))
            begin
              case (CMD_i)
                     JTG_w_TDO_tx0,
                     JTG_r_TDI_rx0,
                     JTG_w_TDO_tx1,
                     JTG_r_TDI_rx1,
                     JTG_w_TDO_tx2,
                     JTG_r_TDI_rx2,
                     JTG_w_TDO_tx3,
                     JTG_r_TDI_rx3,
                     JTG_w_TMS_tx0,
                     JTG_r_TMS_tx0,
                     JTG_w_TMS_tx1,
                     JTG_r_TMS_tx1,
                     JTG_w_TMS_tx2,
                     JTG_r_TMS_tx2,
                     JTG_w_TMS_tx3,
                     JTG_r_TMS_tx3,
                     JTG_w_ctrl,
                     JTG_r_crtl,
                     JTG_w_div,
                     JTG_r_div,
                     JTG_go_auto,
                     JTG_go_manual,
                     JTAG_status,
		     JTAG_RES, 
		     SEU_read,  
		     SEU_clear:
                     invalid_cmd_o <=   1'b0;
                default:
                     invalid_cmd_o <=   1'b1;
              endcase
              if(CMD_i == JTG_w_ctrl)
                   data_in_tmp1_o[12] <=   1'b1;
              
              visual_RST_ST_current_o <=   Jtag_cmd_valid;
            end
            else if ((rx_ena == 1'b0) && (CH_i == CH_ADC))
            begin
              case(CMD_i)
                     ADC_GO,      
                     ADC_W_MUX,    
                     ADC_R_MUX,    
                     ADC_W_GAIN,   
                     ADC_R_GAIN,   
                     ADC_R_ID,     
                     ADC_W_CURR,  
                     ADC_R_CURR,   
                     ADC_R_DATA,   
                     ADC_R_CTRL,   
                     ADC_R_CWD,    
                     ADC_R_OFFSET, 
                     FUSE_W_ID,    
                     FUSE_R_ID,   
                     FUSE_W_GAIN,  
                     FUSE_R_GAIN: 
                   invalid_cmd_o <=   1'b0;
 
              default:
                 invalid_cmd_o <=   1'b1;
              endcase
              visual_RST_ST_current_o <=   ADC_cmd_valid;
            end
            else
              visual_RST_ST_current_o <=   Rx_Data;
          end
 
        Rx_word2:
          begin
            
            if ((read_mem(CH_i[4:0]) == 8'h00) && (Num_Max_CH >= CH_i) && (EN_ch_reg_i[CH_i[4:0]] == 1'b1) && (TR_i != 8'h00) && (TR_i != 8'hff))
            begin
              
              case(CH_i[4:0])
              0:mem0_o   <=   TR_i; 
  		  1:mem1_o   <=   TR_i; 
  		  2:mem2_o   <=   TR_i; 
  		  3:mem3_o   <=   TR_i; 
  		  4:mem4_o   <=   TR_i;
  		  5:mem5_o   <=   TR_i; 
  		  6:mem6_o   <=   TR_i; 
  		  7:mem7_o   <=   TR_i;  
  		  8:mem8_o   <=   TR_i; 
  		  9:mem9_o   <=   TR_i; 
  		 10:mem10_o  <=   TR_i; 
  		 11:mem11_o  <=   TR_i; 
  		 12:mem12_o  <=   TR_i; 
  		 13:mem13_o  <=   TR_i; 
  		 14:mem14_o  <=   TR_i; 
  		 15:mem15_o  <=   TR_i; 
  		 16:mem16_o  <=   TR_i; 
  		 17:mem17_o  <=   TR_i; 
  		 18:mem18_o  <=   TR_i; 
  		 19:mem19_o  <=   TR_i; 
  		 20:mem20_o  <=   TR_i; 
  		 21:mem21_o  <=   TR_i;
  		 endcase 
              SRB_o <=   TR_i;   
              data_in_tmp_o <=   dataw_in;
              visual_RST_ST_current_o <=   CMD_ACCEPT;
            end
            
            else if ((read_mem(CH_i[4:0])!= 8'h00) || (CH_i > Num_Max_CH) || (EN_ch_reg_i[CH_i[4:0]] == 1'b0) || (TR_i == 8'h00) || (TR_i == 8'hff))
            begin
              visual_RST_ST_current_o <=   clr_data;
            end
            else
              visual_RST_ST_current_o <=   Rx_word2;
          end
 
        S28:
          begin
            dataw_out_o[15:8] <=   LenRep_i[7:0];    
            dataw_out_o[7:0]  <=   AckByte_i;
            
            visual_RST_ST_current_o <=   Read_node;
          end
 
        S41:
          begin
            if (rx_ena == 1'b0)
            begin
              visual_RST_ST_current_o <=   IntColli;
            end
            else if (rx_ena)
            begin
              rx_dav_o <=   1'b0;
              CH_o[7:0] <=   dataw_in[15:8];
              TR_o[7:0] <=   dataw_in[7:0];
              visual_RST_ST_current_o <=   tst_busy;
            end
            else
              visual_RST_ST_current_o <=   S41;
          end
 
        S46csb0:
          begin
            visual_RST_ST_current_o <=   S48busy1;
          end
 
        S47csb1:
          begin
            
            nc_ready_o <=   1'b0;
            visual_RST_ST_current_o <=   BUSY_STATE;
          end
 
        S48busy1:
          begin
            if (up_busy_in == 1'b1)
            begin
              visual_RST_ST_current_o <=   S48busy1;
            end
            else if (up_busy_in == 1'b0)
            begin
              up_cs_b_o <=   1'b1;
              visual_RST_ST_current_o <=   S47csb1;
            end
            else
              visual_RST_ST_current_o <=   S48busy1;
          end
 
        SPI_cmd_valid:
          begin
            if (invalid_cmd_i == 1'b1)
            begin
              
              case(CH_i[4:0])
             0:mem0_o   <=   8'h00;
  		 1:mem1_o   <=   8'h00; 
  		 2:mem2_o   <=   8'h00;  
  		 3:mem3_o   <=   8'h00; 
  		 4:mem4_o   <=   8'h00; 
  		 5:mem5_o   <=   8'h00; 
  		 6:mem6_o   <=   8'h00; 
  		 7:mem7_o   <=   8'h00; 
  		 8:mem8_o   <=   8'h00; 
  		 9:mem9_o   <=   8'h00;
  		10:mem10_o  <=   8'h00;
  		11:mem11_o  <=   8'h00;
  		12:mem12_o  <=   8'h00;
  		13:mem13_o  <=   8'h00;
  		14:mem14_o  <=   8'h00;
  		15:mem15_o  <=   8'h00;
  		16:mem16_o  <=   8'h00;
  		17:mem17_o  <=   8'h00;
  		18:mem18_o  <=   8'h00;
  		19:mem19_o  <=   8'h00;
  		20:mem20_o  <=   8'h00;
  		21:mem21_o  <=   8'h00;
  		endcase
              visual_RST_ST_current_o <=   clr_data;
            end
            else if (invalid_cmd_i == 1'b0)
            begin
              visual_RST_ST_current_o <=   Decod_Cmd_CH1;
            end
            else
              visual_RST_ST_current_o <=   SPI_cmd_valid;
          end
 
        Send2Ack:
          begin
            if (TR_i == 8'hff)
            begin
              dataw_out_o[15:0] <=   up_data_in[31:16];
              visual_RST_ST_current_o <=   Interr1;
            end
            else if (CMD_i[0] == 1'b0)
            begin
              
              up_cs_b_o <=   1'b1;
              up_rw_b_o <=   1'b1;     
              tx_ena_o <=   1'b0;
              nc_ready_o <=   1'b1;
              rx_dav_o <=   1'b1;     
              invalid_cmd_o <=   1'b0;
              AckByte_o <=   8'h00;
              LenRep_o <=   8'h00;
              visual_RST_ST_current_o <=   REPOS;
            end
            else if (CMD_i[0] == 1'b1)
            begin
              dataw_out_o[15:0] <=   up_data_in[31:16] ;
              visual_RST_ST_current_o <=   ReadData;
            end
            else
              visual_RST_ST_current_o <=   Send2Ack;
          end
 
        clr_data:
          begin
            if (rx_ena == 1'b1)
            begin
              visual_RST_ST_current_o <=   clr_data;
            end
            else if (rx_ena == 1'b0)
            begin
              if (CH_i > Num_Max_CH) AckByte_o[Inv_CH] <=   1'b1;
              else
              begin  
                if(read_mem(CH_i[4:0]) != 8'h00)   AckByte_o[CH_Busy] <=   1'b1;
                if(EN_ch_reg_i[CH_i[4:0]] == 1'b0) AckByte_o[CH_dis] <=   1'b1;
              end
              if(invalid_cmd_i == 1'b1) AckByte_o[Inv_Cmd]  <=   1'b1;
              LenRep_o <=   8'h02;  
              if ((TR_i == 8'h00) || (TR_i == 8'hff))
                AckByte_o[Inv_TR] <=   1'b1;
              visual_RST_ST_current_o <=   CH_errors;
            end
            else
              visual_RST_ST_current_o <=   clr_data;
          end
 
        delai:
          begin
            if (rx_ena)
            begin
              rx_dav_o <=   1'b0;
              CH_o[7:0] <=   dataw_in[15:8];
              TR_o[7:0] <=   dataw_in[7:0];
              visual_RST_ST_current_o <=   tst_busy;
            end
            else if (rx_ena == 1'b0)
            begin
              visual_RST_ST_current_o <=   S41;
            end
            else
              visual_RST_ST_current_o <=   delai;
          end
 
        tst_busy:
          begin
            CMD_o[7:0] <=   dataw_in[15:8];
            LEN_o[7:0] <=   dataw_in[7:0];
            visual_RST_ST_current_o <=   Rx_word2;
          end
 
        tx_dav_ok:
          begin
            if (CH_i == CH_NODE)
            begin
              
              case(CH_i[4:0])
             0:mem0_o   <=   8'h00;
  		 1:mem1_o   <=   8'h00; 
  		 2:mem2_o   <=   8'h00;  
  		 3:mem3_o   <=   8'h00; 
  		 4:mem4_o   <=   8'h00; 
  		 5:mem5_o   <=   8'h00; 
  		 6:mem6_o   <=   8'h00; 
  		 7:mem7_o   <=   8'h00; 
  		 8:mem8_o   <=   8'h00; 
  		 9:mem9_o   <=   8'h00;
  		10:mem10_o  <=   8'h00;
  		11:mem11_o  <=   8'h00;
  		12:mem12_o  <=   8'h00;
  		13:mem13_o  <=   8'h00;
  		14:mem14_o  <=   8'h00;
  		15:mem15_o  <=   8'h00;
  		16:mem16_o  <=   8'h00;
  		17:mem17_o  <=   8'h00;
  		18:mem18_o  <=   8'h00;
  		19:mem19_o  <=   8'h00;
  		20:mem20_o  <=   8'h00;
  		21:mem21_o  <=   8'h00;
  		endcase
              dataw_out_o[15:8] <=   LenRep_i[7:0];    
              dataw_out_o[7:0]  <=   AckByte_i;
              
              visual_RST_ST_current_o <=   Read_node;
            end
            else
            begin
              
              if(( CH_i >= CH_I2C0 ) && (CH_I2C15 >= CH_i))
                   dataw_out_o[15:8] <=   8'h02;
              else
                   dataw_out_o[15:8] <=   8'h06;
              dataw_out_o[7:0] <=   AckByte_i ; 
              
              case(CH_i[4:0])
             0:mem0_o   <=   8'h00;
  		 1:mem1_o   <=   8'h00; 
  		 2:mem2_o   <=   8'h00;  
  		 3:mem3_o   <=   8'h00; 
  		 4:mem4_o   <=   8'h00; 
  		 5:mem5_o   <=   8'h00; 
  		 6:mem6_o   <=   8'h00; 
  		 7:mem7_o   <=   8'h00; 
  		 8:mem8_o   <=   8'h00; 
  		 9:mem9_o   <=   8'h00;
  		10:mem10_o  <=   8'h00;
  		11:mem11_o  <=   8'h00;
  		12:mem12_o  <=   8'h00;
  		13:mem13_o  <=   8'h00;
  		14:mem14_o  <=   8'h00;
  		15:mem15_o  <=   8'h00;
  		16:mem16_o  <=   8'h00;
  		17:mem17_o  <=   8'h00;
  		18:mem18_o  <=   8'h00;
  		19:mem19_o  <=   8'h00;
  		20:mem20_o  <=   8'h00;
  		21:mem21_o  <=   8'h00;
  		endcase
              visual_RST_ST_current_o <=   Send2Ack;
            end
          end
 
        Sel_CH_spi:
          begin
            up_rw_b_o <=   1'b1; 
            
            up_addr_o <=   {16'h0000,1'b0,CH_i[7:0],7'b0000000};
            
            
            visual_RST_ST_current_o <=   Read_Wish;
          end
 
        Read_Wish:
          begin
            up_cs_b_o <=   1'b0;
            CMD_o[0] <=   1'b1;
            visual_RST_ST_current_o <=   S46csb0;
          end
 
        S0_int_adc:
          begin
            
            up_rw_b_o <=   1'b1; 
            up_addr_o <=   {16'h0000,1'b0,CH_i[7:0],1'b0,ADC_R_DATA[7:2]};
            visual_RST_ST_current_o <=   S3_int_adc;
          end
 
        S3_int_adc:
          begin
            up_cs_b_o <=   1'b0;
            CMD_o[0] <=   1'b1;
            visual_RST_ST_current_o <=   S46csb0;
          end
 
        Dec_cmd_CH0:
          begin
            if (CMD_i == NC_Write_CRD)
            begin
              CRD_o[7:0] <=   data_in_tmp_i[15:8];
              EN_ch_reg_o[23:16] <=   data_in_tmp_i[15:8];
              if(~data_in_tmp_i[8])  mem16_o <= 8'h0; //i2c13
              if(~data_in_tmp_i[9])  mem17_o <= 8'h0; //i2c14
              if(~data_in_tmp_i[10]) mem18_o <= 8'h0; //i2c15
              if(~data_in_tmp_i[11]) mem19_o <= 8'h0; //jtag
              if(~data_in_tmp_i[12]) mem20_o <= 8'h0; //adc
              if(~data_in_tmp_i[13]) mem21_o <= 8'h0; //dac
              visual_RST_ST_current_o <=   Wr_CRD;
            end
            else if (CMD_i == NC_Read_CRA)
            begin
              rep_node_o <=   CRA_i;
              visual_RST_ST_current_o <=   Rd_CRA;
            end
            else if (CMD_i == NC_Write_CRA)
            begin
              CRA_o[7:0] <=   data_in_tmp_i[15:8];
              rep_node_o <=   8'h00;
              visual_RST_ST_current_o <=   Wr_CRA;
            end
            else if (CMD_i == NC_Write_CRB)
            begin
              CRB_o[7:0] <=   data_in_tmp_i[15:8];
              EN_ch_reg_o[7:0] <=   {data_in_tmp_i[15:9],1'b1};
              if(~data_in_tmp_i[9])  mem1_o <= 8'h0; //spi
              if(~data_in_tmp_i[10]) mem2_o <= 8'h0; //gpio
              if(~data_in_tmp_i[11]) mem3_o <= 8'h0; //i2c0
              if(~data_in_tmp_i[12]) mem4_o <= 8'h0; //i2c1
              if(~data_in_tmp_i[13]) mem5_o <= 8'h0; //i2c2
              if(~data_in_tmp_i[14]) mem6_o <= 8'h0; //i2c3
              if(~data_in_tmp_i[15]) mem7_o <= 8'h0; //i2c4

              visual_RST_ST_current_o <=   Wr_CRB;
            end
            else if (CMD_i == NC_Read_CRB)
            begin
            
              rep_node_o <=   CRB_i;
              visual_RST_ST_current_o <=   Rd_CRB;
            end
            else if (CMD_i == NC_Write_CRC)
            begin
              CRC_o[7:0] <=   data_in_tmp_i[15:8];
              EN_ch_reg_o[15:8] <=   data_in_tmp_i[15:8];
              if(~data_in_tmp_i[8])  mem8_o  <= 8'h0; //i2c5
              if(~data_in_tmp_i[9])  mem9_o  <= 8'h0; //i2c6
              if(~data_in_tmp_i[10]) mem10_o <= 8'h0; //i2c7
              if(~data_in_tmp_i[11]) mem11_o <= 8'h0; //i2c8
              if(~data_in_tmp_i[12]) mem12_o <= 8'h0; //i2c9
              if(~data_in_tmp_i[13]) mem13_o <= 8'h0; //i2c10
              if(~data_in_tmp_i[14]) mem14_o <= 8'h0; //i2c11
              if(~data_in_tmp_i[15]) mem15_o <= 8'h0; //i2c12
              visual_RST_ST_current_o <=   Wr_CRC;
            end
            else if (CMD_i == NC_Read_CRC)
            begin
              rep_node_o <=   CRC_i;
              visual_RST_ST_current_o <=   Rd_CRC;
            end
            else if (CMD_i == NC_Read_CRD)
            begin
              rep_node_o <=   CRD_i;
              visual_RST_ST_current_o <=   Rd_CRD;
            end
            else if (CMD_i > NC_Read_CRE)
            begin
              AckByte_o[Inv_Cmd] <=    1'b1;   
              visual_RST_ST_current_o <=   NC_invalid;
            end
            else if (CMD_i == NC_Write_CRE)
            begin
              CRE_o[7:0] <=   data_in_tmp_i[15:8];
              visual_RST_ST_current_o <=   Wr_CRE;
            end
            else if (CMD_i == NC_Read_CRE)
            begin
              rep_node_o <=   CRE_i;
              visual_RST_ST_current_o <=   Rd_CRE;
            end
            else
              visual_RST_ST_current_o <=   Dec_cmd_CH0;
          end
 
        NC_invalid:
          begin
            
            nc_ready_o <=   1'b0;
            visual_RST_ST_current_o <=   BUSY_STATE;
          end
 
        Rd_CRA:
          begin
            
            nc_ready_o <=   1'b0;
            visual_RST_ST_current_o <=   BUSY_STATE;
          end
 
        Rd_CRB:
          begin
            
            nc_ready_o <=   1'b0;
            visual_RST_ST_current_o <=   BUSY_STATE;
          end
 
        Rd_CRC:
          begin
            
            nc_ready_o <=   1'b0;
            visual_RST_ST_current_o <=   BUSY_STATE;
          end
 
        Rd_CRD:
          begin
            
            nc_ready_o <=   1'b0;
            visual_RST_ST_current_o <=   BUSY_STATE;
          end
 
        Rd_CRE:
          begin
            
            nc_ready_o <=   1'b0;
            visual_RST_ST_current_o <=   BUSY_STATE;
          end
 
        Wr_CRA:
          begin
            
            nc_ready_o <=   1'b0;
            visual_RST_ST_current_o <=   BUSY_STATE;
          end
 
        Wr_CRB:
          begin
            
            nc_ready_o <=   1'b0;
            visual_RST_ST_current_o <=   BUSY_STATE;
          end
 
        Wr_CRC:
          begin
            
            nc_ready_o <=   1'b0;
            visual_RST_ST_current_o <=   BUSY_STATE;
          end
 
        Wr_CRD:
          begin
            
            nc_ready_o <=   1'b0;
            visual_RST_ST_current_o <=   BUSY_STATE;
          end
 
        Wr_CRE:
          begin
            
            nc_ready_o <=   1'b0;
            visual_RST_ST_current_o <=   BUSY_STATE;
          end
 
        Decod_Cmd_CH1:
          begin
            up_rw_b_o <=   CMD_i[0];      
            up_data_out_o <=   {data_in_tmp_i,data_in_tmp1_i};
            
            up_addr_o <=  {16'h0000,1'b0,CH_i[7:0],1'b0,CMD_i[7:2]};
            visual_RST_ST_current_o <=   write_up;
          end
 
        CS_bas:
          begin
            visual_RST_ST_current_o <=   S9;
          end
 
        S10:
          begin
            if (CMD_i[1] == 1'b0)
            begin
              
              nc_ready_o <=   1'b0;
              visual_RST_ST_current_o <=   BUSY_STATE;
            end
            else if (CMD_i[1] == 1'b1)
            begin
              
              up_cs_b_o <=   1'b1;
              up_rw_b_o <=   1'b1;     
              tx_ena_o <=   1'b0;
              nc_ready_o <=   1'b1;
              rx_dav_o <=   1'b1;     
              invalid_cmd_o <=   1'b0;
              AckByte_o <=   8'h00;
              LenRep_o <=   8'h00;
              visual_RST_ST_current_o <=   REPOS;
            end
            else
            begin
              visual_RST_ST_current_o <=   Decod_Cmd_CH1;
            end
          end
 
        S9:
          begin
            if (up_busy_in == 1'b1)
            begin
              visual_RST_ST_current_o <=   S9;
            end
            else if (up_busy_in == 1'b0)
            begin
              visual_RST_ST_current_o <=   S10;
            end
            else
              visual_RST_ST_current_o <=   S9;
          end
 
        write_up:
          begin
            up_cs_b_o <=   1'b0;  
            visual_RST_ST_current_o <=   CS_bas;
          end
 
        S0cmd3:
          begin
            if ((CMD_i[0] || !(CMD_i[0])) && CMD_i[7])
            begin
              up_data_out_o[15:0] <=   {data_in_tmp_i[7:0],data_in_tmp1_i[15:8]};
              up_data_out_o[31:16] <=   {1'b0,1'b0,1'b0,CMD_i[6],CMD_i[5],CMD_i[4],CMD_i[3],CMD_i[2],(data_in_tmp_i[15:8])};
              
              
              up_addr_o <=   {16'h0000,1'b0,CH_i[7:0],7'b0000000};
              visual_RST_ST_current_o <=   S3cmd3;
            end
            else if (CMD_i[0] && !(CMD_i[7]))
            begin
              
              
              up_addr_o <=  {16'h0000,1'b0,CH_i[7:0],1'b0,CMD_i[7:2]};
              visual_RST_ST_current_o <=   S6cmd3_Read;
            end
            else if (!(CMD_i[7]))
            begin
              
              up_data_out_o <=   {data_in_tmp_i,data_in_tmp1_i};
              
              up_addr_o <=   {16'h0000,1'b0,CH_i[7:0],1'b0,CMD_i[7:2]} ;
              visual_RST_ST_current_o <=   cmd3_write;
            end
            else
              visual_RST_ST_current_o <=   S0cmd3;
          end
 
        S10_cs_0:
          begin
            if (CMD_i[1] == 1'b1)
            begin
              
              up_cs_b_o <=   1'b1;
              up_rw_b_o <=   1'b1;     
              tx_ena_o <=   1'b0;
              nc_ready_o <=   1'b1;
              rx_dav_o <=   1'b1;     
              invalid_cmd_o <=   1'b0;
              AckByte_o <=   8'h00;
              LenRep_o <=   8'h00;
              visual_RST_ST_current_o <=   REPOS;
            end
            else if (CMD_i[1] == 1'b0)
            begin
              
              nc_ready_o <=   1'b0;
              visual_RST_ST_current_o <=   BUSY_STATE;
            end
            else
            begin
              up_rw_b_o <=   CMD_i[0];
              visual_RST_ST_current_o <=   S0cmd3;
            end
          end
 
        S3cmd3:
          begin
            up_cs_b_o <=   1'b0;  
            visual_RST_ST_current_o <=   S4cmd3;
          end
 
        S4cmd3:
          begin
            visual_RST_ST_current_o <=   S7_addten;
          end
 
        S6cmd3_Read:
          begin
            up_cs_b_o <=   1'b0;  
            visual_RST_ST_current_o <=   S4cmd3;
          end
 
        S7_addten:
          begin
            if (up_busy_in == 1'b1)
            begin
              visual_RST_ST_current_o <=   S7_addten;
            end
            else if (up_busy_in == 1'b0)
            begin
              up_cs_b_o <=   1'b1;
              visual_RST_ST_current_o <=   S10_cs_0;
            end
            else
              visual_RST_ST_current_o <=   S7_addten;
          end
 
        cmd3_write:
          begin
            up_cs_b_o <=   1'b0;  
            visual_RST_ST_current_o <=   S4cmd3;
          end
 
        Rd_Gpio_int0:
          begin
            up_rw_b_o <=   1'b1;      
            
            up_addr_o <=    {24'h000001,8'h1c};
            visual_RST_ST_current_o <=   Rd_Gpio_int1;
          end
 
        Gpio_wr_wait:
          begin
            if (up_busy_in == 1'b1)
            begin
              visual_RST_ST_current_o <=   Gpio_wr_wait;
            end
            else if (up_busy_in == 1'b0)
            begin
              
              nc_ready_o <=   1'b0;
              visual_RST_ST_current_o <=   BUSY_STATE;
            end
            else
              visual_RST_ST_current_o <=   Gpio_wr_wait;
          end
 
        Rd_Gpio_int1:
          begin
            up_cs_b_o <=   1'b0;  
            visual_RST_ST_current_o <=   Rd_Gpio_int2;
          end
 
        Rd_Gpio_int2:
          begin
            visual_RST_ST_current_o <=   Rd_Gpio_int3;
          end
 
        Rd_Gpio_int3:
          begin
            if (up_busy_in == 1'b1)
            begin
              visual_RST_ST_current_o <=   Rd_Gpio_int3;
            end
            else if (up_busy_in == 1'b0)
            begin
              
              up_cs_b_o <=   1'b1;
              up_rw_b_o <=   1'b0;  
              up_data_out_o <=   32'h00000000;    
              visual_RST_ST_current_o <=   Rd_Gpio_int4;
            end
            else
              visual_RST_ST_current_o <=   Rd_Gpio_int3;
          end
 
        Rd_Gpio_int4:
          begin
            up_cs_b_o <=   1'b0;
            visual_RST_ST_current_o <=   Rd_Gpio_int5;
          end
 
        Rd_Gpio_int5:
          begin
            visual_RST_ST_current_o <=   Gpio_wr_wait;
          end
 
        S0int_i2c:
          begin
            up_rw_b_o <=   1'b1; 
            
            up_addr_o <=     {16'h0000,1'b0,CH_i[7:0],7'b0000100};
            
            visual_RST_ST_current_o <=   S1int_i2c;
          end
 
        S1int_i2c:
          begin
            up_cs_b_o <=   1'b0;
            CMD_o[0] <=   1'b1;
            visual_RST_ST_current_o <=   S46csb0;
          end
 
        S0_int_jtag:
          begin
            up_rw_b_o <=   1'b1;
            up_addr_o <=   {16'h0000,1'b0,CH_i[7:0],7'b0000000};  
            
            visual_RST_ST_current_o <=   S3_int_jtag;
          end
 
        S3_int_jtag:
          begin
            up_cs_b_o <=   1'b0;
            CMD_o[0] <=   1'b1;
            visual_RST_ST_current_o <=   S46csb0;
          end
 
        default:
          begin
            
            
            rx_dav_o <=   1'b0;
            tx_ena_o <=   1'b0;
            dataw_out_o <=   16'h0000;
            SRA_o <=   8'h00;
            SRB_o <=   8'h00;
            CRA_o <=   8'h00;
            CRB_o <=   8'h00;
            CRC_o <=   8'h00;
            CRD_o <=   8'h00;
            CRE_o <=   8'h00;
           
            EN_ch_reg_o <=   32'h00000001;
            AckByte_o <=   8'h00;
            LenRep_o <=   8'h00;
            
            TR_o <=   8'h00;
            CH_o <=   8'h00;
            CMD_o <=   8'h00;
            LEN_o <=   8'h00;
            up_addr_o <=   32'h00000000;
            rep_node_o <=   8'h00;
            SPI_CTRL_o <=   16'h0000;
            nc_ready_o <=   1'b0;
            data_in_tmp_o <=   16'h0000;
            data_in_tmp1_o <=   16'h0000;
            invalid_cmd_o <=   1'b0;
            up_cs_b_o <=   1'b1;
            up_rw_b_o <=   1'b0;
            up_data_out_o <=   32'h00000000;
            
            mem0_o  <=   8'h00;  
            mem1_o  <=   8'h00;
            mem2_o  <=   8'h00;  
            mem3_o  <=   8'h00;
            mem4_o  <=   8'h00;  
            mem5_o  <=   8'h00;
            mem6_o  <=   8'h00;  
            mem7_o  <=   8'h00;
            mem8_o  <=   8'h00;  
            mem9_o  <=   8'h00;
            mem10_o <=   8'h00; 
            mem11_o <=   8'h00;
            mem12_o <=   8'h00;  
            mem13_o <=   8'h00;
            mem14_o <=   8'h00;  
            mem15_o <=   8'h00;
            mem16_o <=   8'h00;  
            mem17_o <=   8'h00;
            mem18_o <=   8'h00;  
            mem19_o <=   8'h00;
            mem20_o <=   8'h00;  
            mem21_o <=   8'h00;

            visual_RST_ST_current_o <=   RST_ST;

          end
      endcase
    end
  end
endmodule






module nctrl_tri (clock_1, clock_2, clock_3, reset_1, reset_2, reset_3, up_rw_b_1, up_rw_b_2, up_rw_b_3, up_data_out_1, up_data_out_2, up_data_out_3, up_data_in_1, up_data_in_2, up_data_in_3, up_addr_1, up_addr_2, up_addr_3, up_cs_b_1, up_cs_b_2, up_cs_b_3,
              tx_ena_1, tx_ena_2, tx_ena_3, tx_dav_1, tx_dav_2, tx_dav_3, nc_ready_1, nc_ready_2, nc_ready_3, rx_dav_1, rx_dav_2, rx_dav_3, rx_ena_1, rx_ena_2, rx_ena_3, dataw_in_1, dataw_in_2, dataw_in_3, dataw_out_1, dataw_out_2, dataw_out_3,
              `ifdef WithSEUcounter
                  SEU_NCTRLflag1,SEU_NCTRLflag2,SEU_NCTRLflag3, //ADDED 17oct13
              `endif 
              Int_arb_in_1, Int_arb_in_2, Int_arb_in_3, up_busy_in_1, up_busy_in_2, up_busy_in_3, CRE_1, CRE_2, CRE_3,
              EN_ch_reg_1, EN_ch_reg_2, EN_ch_reg_3 //ADDED 30jan14 for gating channels
              );

	`include "Table_Commande.v"

	input clock_1, clock_2, clock_3;
	input reset_1, reset_2, reset_3;
	input [wb_nb_bit:0] up_data_in_1, up_data_in_2, up_data_in_3;
	input tx_dav_1, tx_dav_2, tx_dav_3;
	input rx_ena_1, rx_ena_2, rx_ena_3;
	input [atlantic_nb_bit:0] dataw_in_1, dataw_in_2, dataw_in_3;
	input [5:0] Int_arb_in_1, Int_arb_in_2, Int_arb_in_3;
	input up_busy_in_1, up_busy_in_2, up_busy_in_3;
	output up_rw_b_1, up_rw_b_2, up_rw_b_3;
	output [wb_nb_bit:0] up_data_out_1, up_data_out_2, up_data_out_3;
	output [wb_nb_bit:0] up_addr_1, up_addr_2, up_addr_3;
	output up_cs_b_1, up_cs_b_2, up_cs_b_3;
	output tx_ena_1, tx_ena_2, tx_ena_3;
	output nc_ready_1, nc_ready_2, nc_ready_3;
	output rx_dav_1, rx_dav_2, rx_dav_3;
	output [atlantic_nb_bit:0] dataw_out_1, dataw_out_2, dataw_out_3;
	output [7:0] CRE_1, CRE_2, CRE_3;
	
	output [31:0] EN_ch_reg_1, EN_ch_reg_2, EN_ch_reg_3; //ADDED 30jan14 for gating channels
	
	`ifdef WithSEUcounter //ADDED 17oct13
            output SEU_NCTRLflag1;
            wire SEU_NCTRLflag1;  
            output SEU_NCTRLflag2;
            wire SEU_NCTRLflag2;             
            output SEU_NCTRLflag3;
            wire SEU_NCTRLflag3;             
            
      `endif 
	
	wire rx_dav_1, rx_dav_2, rx_dav_3;
	wire tx_ena_1, tx_ena_2, tx_ena_3;
	wire [atlantic_nb_bit:0] dataw_out_1, dataw_out_2, dataw_out_3;
	wire [7:0] SRA_1, SRA_2, SRA_3;
	wire [7:0] SRB_1, SRB_2, SRB_3;
	wire [7:0] CRA_1, CRA_2, CRA_3;
	wire [7:0] CRB_1, CRB_2, CRB_3;
	wire [7:0] CRC_1, CRC_2, CRC_3;
	wire [7:0] CRD_1, CRD_2, CRD_3;
	wire [7:0] CRE_1, CRE_2, CRE_3;
	wire [31:0] EN_ch_reg_1, EN_ch_reg_2, EN_ch_reg_3;
	wire [7:0] AckByte_1, AckByte_2, AckByte_3;
	wire [7:0] LenRep_1, LenRep_2, LenRep_3;
	wire [7:0] TR_1, TR_2, TR_3;
	wire [7:0] CH_1, CH_2, CH_3;
	wire [7:0] CMD_1, CMD_2, CMD_3;
	wire [7:0] LEN_1, LEN_2, LEN_3;
	wire [wb_nb_bit:0] up_addr_1, up_addr_2, up_addr_3;
	wire [7:0] rep_node_1, rep_node_2, rep_node_3;
	wire [15:0] SPI_CTRL_1, SPI_CTRL_2, SPI_CTRL_3;
	wire nc_ready_1, nc_ready_2, nc_ready_3;
	wire [15:0] data_in_tmp_1, data_in_tmp_2, data_in_tmp_3;
	wire [15:0] data_in_tmp1_1, data_in_tmp1_2, data_in_tmp1_3;
	wire invalid_cmd_1, invalid_cmd_2, invalid_cmd_3;
	wire up_cs_b_1, up_cs_b_2, up_cs_b_3;
	wire up_rw_b_1, up_rw_b_2, up_rw_b_3;
	wire [wb_nb_bit:0] up_data_out_1, up_data_out_2, up_data_out_3;
	wire [7:0] mem0_1, mem0_2, mem0_3;
	wire [7:0] mem1_1, mem1_2, mem1_3;
	wire [7:0] mem2_1, mem2_2, mem2_3;
	wire [7:0] mem3_1, mem3_2, mem3_3;
	wire [7:0] mem4_1, mem4_2, mem4_3;
	wire [7:0] mem5_1, mem5_2, mem5_3;
	wire [7:0] mem6_1, mem6_2, mem6_3;
	wire [7:0] mem7_1, mem7_2, mem7_3;
	wire [7:0] mem8_1, mem8_2, mem8_3;
	wire [7:0] mem9_1, mem9_2, mem9_3;
	wire [7:0] mem10_1, mem10_2, mem10_3;
	wire [7:0] mem11_1, mem11_2, mem11_3;
	wire [7:0] mem12_1, mem12_2, mem12_3;
	wire [7:0] mem13_1, mem13_2, mem13_3;
	wire [7:0] mem14_1, mem14_2, mem14_3;
	wire [7:0] mem15_1, mem15_2, mem15_3;
	wire [7:0] mem16_1, mem16_2, mem16_3;
	wire [7:0] mem17_1, mem17_2, mem17_3;
	wire [7:0] mem18_1, mem18_2, mem18_3;
	wire [7:0] mem19_1, mem19_2, mem19_3;
	wire [7:0] mem20_1, mem20_2, mem20_3;
	wire [7:0] mem21_1, mem21_2, mem21_3;
	wire [6:0] visual_RST_ST_current_1, visual_RST_ST_current_2, visual_RST_ST_current_3;
	wire rx_dav;
	wire tx_ena;
	wire [atlantic_nb_bit:0] dataw_out;
	wire [7:0] SRA;
	wire [7:0] SRB;
	wire [7:0] CRA;
	wire [7:0] CRB;
	wire [7:0] CRC;
	wire [7:0] CRD;
	wire [7:0] CRE;
	wire [31:0] EN_ch_reg;
	wire [7:0] AckByte;
	wire [7:0] LenRep;
	wire [7:0] TR;
	wire [7:0] CH;
	wire [7:0] CMD;
	wire [7:0] LEN;
	wire [wb_nb_bit:0] up_addr;
	wire [7:0] rep_node;
	wire [15:0] SPI_CTRL;
	wire nc_ready;
	wire [15:0] data_in_tmp;
	wire [15:0] data_in_tmp1;
	wire invalid_cmd;
	wire up_cs_b;
	wire up_rw_b;
	wire [wb_nb_bit:0] up_data_out;
	wire [7:0] mem0;
	wire [7:0] mem1;
	wire [7:0] mem2;
	wire [7:0] mem3;
	wire [7:0] mem4;
	wire [7:0] mem5;
	wire [7:0] mem6;
	wire [7:0] mem7;
	wire [7:0] mem8;
	wire [7:0] mem9;
	wire [7:0] mem10;
	wire [7:0] mem11;
	wire [7:0] mem12;
	wire [7:0] mem13;
	wire [7:0] mem14;
	wire [7:0] mem15;
	wire [7:0] mem16;
	wire [7:0] mem17;
	wire [7:0] mem18;
	wire [7:0] mem19;
	wire [7:0] mem20;
	wire [7:0] mem21;
	wire [6:0] visual_RST_ST_current;
	
	
	// (output)\W*?(\[\w+:\w+\])*\W*?(\w+)(_o);  => .\3\4(\3o_2),
	// (input)\W*?(\[\w+:\w+\])*\W*?(\w+)(_i);  => .\3\4(\3_1),
	// (input)\W*?(\[\w+:\w+\])*\W*?(\w+);      => .\3\4(\3_1),

	nctrl_iostate nctrl_iostate_1   (.clock(clock_1), .reset(reset_1), .up_rw_b_i(up_rw_b_1), .up_rw_b_o(up_rw_b_2), .up_data_out_i(up_data_out_1), .up_data_out_o(up_data_out_2), .up_data_in(up_data_in_1), .up_addr_i(up_addr_1), .up_addr_o(up_addr_2), .up_cs_b_i(up_cs_b_1), .up_cs_b_o(up_cs_b_2),
              .tx_ena_i(tx_ena_1), .tx_ena_o(tx_ena_2), .tx_dav(tx_dav_1), .nc_ready_i(nc_ready_1), .nc_ready_o(nc_ready_2), .rx_dav_i(rx_dav_1), .rx_dav_o(rx_dav_2), .rx_ena(rx_ena_1), .dataw_in(dataw_in_1), .dataw_out_i(dataw_out_1), .dataw_out_o(dataw_out_2),
              .Int_arb_in(Int_arb_in_1), .up_busy_in(up_busy_in_1), .CRE_i(CRE_1), .CRE_o(CRE_2), .SRA_i(SRA_1), .SRA_o(SRA_2), .SRB_i(SRB_1), .SRB_o(SRB_2), .CRA_i(CRA_1), .CRA_o(CRA_2), .CRB_i(CRB_1), .CRB_o(CRB_2), .CRC_i(CRC_1), .CRC_o(CRC_2), .CRD_i(CRD_1), .CRD_o(CRD_2), .EN_ch_reg_i(EN_ch_reg_1), .EN_ch_reg_o(EN_ch_reg_2), .AckByte_i(AckByte_1), .AckByte_o(AckByte_2), .LenRep_i(LenRep_1), .LenRep_o(LenRep_2), .TR_i(TR_1), .TR_o(TR_2), .CH_i(CH_1), .CH_o(CH_2), .CMD_i(CMD_1), .CMD_o(CMD_2), .LEN_i(LEN_1), .LEN_o(LEN_2), .rep_node_i(rep_node_1), .rep_node_o(rep_node_2), .SPI_CTRL_i(SPI_CTRL_1), .SPI_CTRL_o(SPI_CTRL_2), .data_in_tmp_i(data_in_tmp_1), .data_in_tmp_o(data_in_tmp_2), .data_in_tmp1_i(data_in_tmp1_1), .data_in_tmp1_o(data_in_tmp1_2), .invalid_cmd_i(invalid_cmd_1), .invalid_cmd_o(invalid_cmd_2), .mem0_i(mem0_1), .mem0_o(mem0_2), .mem1_i(mem1_1), .mem1_o(mem1_2), .mem2_i(mem2_1), .mem2_o(mem2_2), .mem3_i(mem3_1), .mem3_o(mem3_2), .mem4_i(mem4_1), .mem4_o(mem4_2), .mem5_i(mem5_1), .mem5_o(mem5_2), .mem6_i(mem6_1), .mem6_o(mem6_2), .mem7_i(mem7_1), .mem7_o(mem7_2), .mem8_i(mem8_1), .mem8_o(mem8_2), .mem9_i(mem9_1), .mem9_o(mem9_2), .mem10_i(mem10_1), .mem10_o(mem10_2), .mem11_i(mem11_1), .mem11_o(mem11_2), .mem12_i(mem12_1), .mem12_o(mem12_2), .mem13_i(mem13_1), .mem13_o(mem13_2), .mem14_i(mem14_1), .mem14_o(mem14_2), .mem15_i(mem15_1), .mem15_o(mem15_2), .mem16_i(mem16_1), .mem16_o(mem16_2), .mem17_i(mem17_1), .mem17_o(mem17_2), .mem18_i(mem18_1), .mem18_o(mem18_2), .mem19_i(mem19_1), .mem19_o(mem19_2), .mem20_i(mem20_1), .mem20_o(mem20_2), .mem21_i(mem21_1), .mem21_o(mem21_2), .visual_RST_ST_current_i(visual_RST_ST_current_1), .visual_RST_ST_current_o(visual_RST_ST_current_2));

	nctrl_iostate nctrl_iostate_2   (.clock(clock_2), .reset(reset_2), .up_rw_b_i(up_rw_b_2), .up_rw_b_o(up_rw_b_3), .up_data_out_i(up_data_out_2), .up_data_out_o(up_data_out_3), .up_data_in(up_data_in_2), .up_addr_i(up_addr_2), .up_addr_o(up_addr_3), .up_cs_b_i(up_cs_b_2), .up_cs_b_o(up_cs_b_3),
              .tx_ena_i(tx_ena_2), .tx_ena_o(tx_ena_3), .tx_dav(tx_dav_2), .nc_ready_i(nc_ready_2), .nc_ready_o(nc_ready_3), .rx_dav_i(rx_dav_2), .rx_dav_o(rx_dav_3), .rx_ena(rx_ena_2), .dataw_in(dataw_in_2), .dataw_out_i(dataw_out_2), .dataw_out_o(dataw_out_3),
              .Int_arb_in(Int_arb_in_2), .up_busy_in(up_busy_in_2), .CRE_i(CRE_2), .CRE_o(CRE_3), .SRA_i(SRA_2), .SRA_o(SRA_3), .SRB_i(SRB_2), .SRB_o(SRB_3), .CRA_i(CRA_2), .CRA_o(CRA_3), .CRB_i(CRB_2), .CRB_o(CRB_3), .CRC_i(CRC_2), .CRC_o(CRC_3), .CRD_i(CRD_2), .CRD_o(CRD_3), .EN_ch_reg_i(EN_ch_reg_2), .EN_ch_reg_o(EN_ch_reg_3), .AckByte_i(AckByte_2), .AckByte_o(AckByte_3), .LenRep_i(LenRep_2), .LenRep_o(LenRep_3), .TR_i(TR_2), .TR_o(TR_3), .CH_i(CH_2), .CH_o(CH_3), .CMD_i(CMD_2), .CMD_o(CMD_3), .LEN_i(LEN_2), .LEN_o(LEN_3), .rep_node_i(rep_node_2), .rep_node_o(rep_node_3), .SPI_CTRL_i(SPI_CTRL_2), .SPI_CTRL_o(SPI_CTRL_3), .data_in_tmp_i(data_in_tmp_2), .data_in_tmp_o(data_in_tmp_3), .data_in_tmp1_i(data_in_tmp1_2), .data_in_tmp1_o(data_in_tmp1_3), .invalid_cmd_i(invalid_cmd_2), .invalid_cmd_o(invalid_cmd_3), .mem0_i(mem0_2), .mem0_o(mem0_3), .mem1_i(mem1_2), .mem1_o(mem1_3), .mem2_i(mem2_2), .mem2_o(mem2_3), .mem3_i(mem3_2), .mem3_o(mem3_3), .mem4_i(mem4_2), .mem4_o(mem4_3), .mem5_i(mem5_2), .mem5_o(mem5_3), .mem6_i(mem6_2), .mem6_o(mem6_3), .mem7_i(mem7_2), .mem7_o(mem7_3), .mem8_i(mem8_2), .mem8_o(mem8_3), .mem9_i(mem9_2), .mem9_o(mem9_3), .mem10_i(mem10_2), .mem10_o(mem10_3), .mem11_i(mem11_2), .mem11_o(mem11_3), .mem12_i(mem12_2), .mem12_o(mem12_3), .mem13_i(mem13_2), .mem13_o(mem13_3), .mem14_i(mem14_2), .mem14_o(mem14_3), .mem15_i(mem15_2), .mem15_o(mem15_3), .mem16_i(mem16_2), .mem16_o(mem16_3), .mem17_i(mem17_2), .mem17_o(mem17_3), .mem18_i(mem18_2), .mem18_o(mem18_3), .mem19_i(mem19_2), .mem19_o(mem19_3), .mem20_i(mem20_2), .mem20_o(mem20_3), .mem21_i(mem21_2), .mem21_o(mem21_3), .visual_RST_ST_current_i(visual_RST_ST_current_2), .visual_RST_ST_current_o(visual_RST_ST_current_3));

	nctrl_iostate nctrl_iostate_3   (.clock(clock_3), .reset(reset_3), .up_rw_b_i(up_rw_b_3), .up_rw_b_o(up_rw_b), .up_data_out_i(up_data_out_3), .up_data_out_o(up_data_out), .up_data_in(up_data_in_3), .up_addr_i(up_addr_3), .up_addr_o(up_addr), .up_cs_b_i(up_cs_b_3), .up_cs_b_o(up_cs_b),
              .tx_ena_i(tx_ena_3), .tx_ena_o(tx_ena), .tx_dav(tx_dav_3), .nc_ready_i(nc_ready_3), .nc_ready_o(nc_ready), .rx_dav_i(rx_dav_3), .rx_dav_o(rx_dav), .rx_ena(rx_ena_3), .dataw_in(dataw_in_3), .dataw_out_i(dataw_out_3), .dataw_out_o(dataw_out),
              .Int_arb_in(Int_arb_in_3), .up_busy_in(up_busy_in_3), .CRE_i(CRE_3), .CRE_o(CRE), .SRA_i(SRA_3), .SRA_o(SRA), .SRB_i(SRB_3), .SRB_o(SRB), .CRA_i(CRA_3), .CRA_o(CRA), .CRB_i(CRB_3), .CRB_o(CRB), .CRC_i(CRC_3), .CRC_o(CRC), .CRD_i(CRD_3), .CRD_o(CRD), .EN_ch_reg_i(EN_ch_reg_3), .EN_ch_reg_o(EN_ch_reg), .AckByte_i(AckByte_3), .AckByte_o(AckByte), .LenRep_i(LenRep_3), .LenRep_o(LenRep), .TR_i(TR_3), .TR_o(TR), .CH_i(CH_3), .CH_o(CH), .CMD_i(CMD_3), .CMD_o(CMD), .LEN_i(LEN_3), .LEN_o(LEN), .rep_node_i(rep_node_3), .rep_node_o(rep_node), .SPI_CTRL_i(SPI_CTRL_3), .SPI_CTRL_o(SPI_CTRL), .data_in_tmp_i(data_in_tmp_3), .data_in_tmp_o(data_in_tmp), .data_in_tmp1_i(data_in_tmp1_3), .data_in_tmp1_o(data_in_tmp1), .invalid_cmd_i(invalid_cmd_3), .invalid_cmd_o(invalid_cmd), .mem0_i(mem0_3), .mem0_o(mem0), .mem1_i(mem1_3), .mem1_o(mem1), .mem2_i(mem2_3), .mem2_o(mem2), .mem3_i(mem3_3), .mem3_o(mem3), .mem4_i(mem4_3), .mem4_o(mem4), .mem5_i(mem5_3), .mem5_o(mem5), .mem6_i(mem6_3), .mem6_o(mem6), .mem7_i(mem7_3), .mem7_o(mem7), .mem8_i(mem8_3), .mem8_o(mem8), .mem9_i(mem9_3), .mem9_o(mem9), .mem10_i(mem10_3), .mem10_o(mem10), .mem11_i(mem11_3), .mem11_o(mem11), .mem12_i(mem12_3), .mem12_o(mem12), .mem13_i(mem13_3), .mem13_o(mem13), .mem14_i(mem14_3), .mem14_o(mem14), .mem15_i(mem15_3), .mem15_o(mem15), .mem16_i(mem16_3), .mem16_o(mem16), .mem17_i(mem17_3), .mem17_o(mem17), .mem18_i(mem18_3), .mem18_o(mem18), .mem19_i(mem19_3), .mem19_o(mem19), .mem20_i(mem20_3), .mem20_o(mem20), .mem21_i(mem21_3), .mem21_o(mem21), .visual_RST_ST_current_i(visual_RST_ST_current_3), .visual_RST_ST_current_o(visual_RST_ST_current));
	

	majority_voter #(.WIDTH(384+atlantic_nb_bit+wb_nb_bit+wb_nb_bit)) mv (
		.in1({rx_dav_2, tx_ena_2, dataw_out_2, SRA_2, SRB_2, CRA_2, CRB_2, CRC_2, CRD_2, CRE_2, EN_ch_reg_2, AckByte_2, LenRep_2, TR_2, CH_2, CMD_2, LEN_2, up_addr_2, rep_node_2, SPI_CTRL_2, nc_ready_2, data_in_tmp_2, data_in_tmp1_2, invalid_cmd_2, up_cs_b_2, up_rw_b_2, up_data_out_2, mem0_2, mem1_2, mem2_2, mem3_2, mem4_2, mem5_2, mem6_2, mem7_2, mem8_2, mem9_2, mem10_2, mem11_2, mem12_2, mem13_2, mem14_2, mem15_2, mem16_2, mem17_2, mem18_2, mem19_2, mem20_2, mem21_2, visual_RST_ST_current_2 }),
		.in2({rx_dav_3, tx_ena_3, dataw_out_3, SRA_3, SRB_3, CRA_3, CRB_3, CRC_3, CRD_3, CRE_3, EN_ch_reg_3, AckByte_3, LenRep_3, TR_3, CH_3, CMD_3, LEN_3, up_addr_3, rep_node_3, SPI_CTRL_3, nc_ready_3, data_in_tmp_3, data_in_tmp1_3, invalid_cmd_3, up_cs_b_3, up_rw_b_3, up_data_out_3, mem0_3, mem1_3, mem2_3, mem3_3, mem4_3, mem5_3, mem6_3, mem7_3, mem8_3, mem9_3, mem10_3, mem11_3, mem12_3, mem13_3, mem14_3, mem15_3, mem16_3, mem17_3, mem18_3, mem19_3, mem20_3, mem21_3, visual_RST_ST_current_3 }),
		.in3({rx_dav,   tx_ena,   dataw_out,   SRA,   SRB,   CRA,   CRB,   CRC,   CRD,   CRE,   EN_ch_reg,   AckByte,   LenRep,   TR,   CH,   CMD,   LEN,   up_addr,   rep_node,   SPI_CTRL,   nc_ready,   data_in_tmp,   data_in_tmp1,   invalid_cmd,   up_cs_b,   up_rw_b,   up_data_out,   mem0,   mem1,   mem2,   mem3,   mem4,   mem5,   mem6,   mem7,   mem8,   mem9,   mem10,   mem11,   mem12,   mem13,   mem14,   mem15,   mem16,   mem17,   mem18,   mem19,   mem20,   mem21,   visual_RST_ST_current   }),
		.out({rx_dav_1, tx_ena_1, dataw_out_1, SRA_1, SRB_1, CRA_1, CRB_1, CRC_1, CRD_1, CRE_1, EN_ch_reg_1, AckByte_1, LenRep_1, TR_1, CH_1, CMD_1, LEN_1, up_addr_1, rep_node_1, SPI_CTRL_1, nc_ready_1, data_in_tmp_1, data_in_tmp1_1, invalid_cmd_1, up_cs_b_1, up_rw_b_1, up_data_out_1, mem0_1, mem1_1, mem2_1, mem3_1, mem4_1, mem5_1, mem6_1, mem7_1, mem8_1, mem9_1, mem10_1, mem11_1, mem12_1, mem13_1, mem14_1, mem15_1, mem16_1, mem17_1, mem18_1, mem19_1, mem20_1, mem21_1, visual_RST_ST_current_1 }),		
		.err()
	);
	
`ifdef WithSEUcounter
	majority_error err_identif1 (
		.in1({rx_dav_2, tx_ena_2, dataw_out_2, SRA_2, SRB_2, CRA_2, CRB_2, CRC_2, CRD_2, CRE_2, EN_ch_reg_2, AckByte_2, LenRep_2, TR_2, CH_2, CMD_2, LEN_2, up_addr_2, rep_node_2, SPI_CTRL_2, nc_ready_2, data_in_tmp_2, data_in_tmp1_2, invalid_cmd_2, up_cs_b_2, up_rw_b_2, up_data_out_2, mem0_2, mem1_2, mem2_2, mem3_2, mem4_2, mem5_2, mem6_2, mem7_2, mem8_2, mem9_2, mem10_2, mem11_2, mem12_2, mem13_2, mem14_2, mem15_2, mem16_2, mem17_2, mem18_2, mem19_2, mem20_2, mem21_2, visual_RST_ST_current_2 }),
		.in2({rx_dav_3, tx_ena_3, dataw_out_3, SRA_3, SRB_3, CRA_3, CRB_3, CRC_3, CRD_3, CRE_3, EN_ch_reg_3, AckByte_3, LenRep_3, TR_3, CH_3, CMD_3, LEN_3, up_addr_3, rep_node_3, SPI_CTRL_3, nc_ready_3, data_in_tmp_3, data_in_tmp1_3, invalid_cmd_3, up_cs_b_3, up_rw_b_3, up_data_out_3, mem0_3, mem1_3, mem2_3, mem3_3, mem4_3, mem5_3, mem6_3, mem7_3, mem8_3, mem9_3, mem10_3, mem11_3, mem12_3, mem13_3, mem14_3, mem15_3, mem16_3, mem17_3, mem18_3, mem19_3, mem20_3, mem21_3, visual_RST_ST_current_3 }),
		.in3({rx_dav,   tx_ena,   dataw_out,   SRA,   SRB,   CRA,   CRB,   CRC,   CRD,   CRE,   EN_ch_reg,   AckByte,   LenRep,   TR,   CH,   CMD,   LEN,   up_addr,   rep_node,   SPI_CTRL,   nc_ready,   data_in_tmp,   data_in_tmp1,   invalid_cmd,   up_cs_b,   up_rw_b,   up_data_out,   mem0,   mem1,   mem2,   mem3,   mem4,   mem5,   mem6,   mem7,   mem8,   mem9,   mem10,   mem11,   mem12,   mem13,   mem14,   mem15,   mem16,   mem17,   mem18,   mem19,   mem20,   mem21,   visual_RST_ST_current   }),
		.err(SEU_NCTRLflag1)
	);		
	assign SEU_NCTRLflag2 = SEU_NCTRLflag1; //an error here can be considered as part of the sensitivity logic to SEUs
	assign SEU_NCTRLflag3 = SEU_NCTRLflag1;
`endif	
	
/*	
`ifdef WithSEUcounter
	majority_error err_identif1 (
		.in1({rx_dav_2, tx_ena_2, dataw_out_2, SRA_2, SRB_2, CRA_2, CRB_2, CRC_2, CRD_2, CRE_2, EN_ch_reg_2, AckByte_2, LenRep_2, TR_2, CH_2, CMD_2, LEN_2, up_addr_2, rep_node_2, SPI_CTRL_2, nc_ready_2, data_in_tmp_2, data_in_tmp1_2, invalid_cmd_2, up_cs_b_2, up_rw_b_2, up_data_out_2, mem0_2, mem1_2, mem2_2, mem3_2, mem4_2, mem5_2, mem6_2, mem7_2, mem8_2, mem9_2, mem10_2, mem11_2, mem12_2, mem13_2, mem14_2, mem15_2, mem16_2, mem17_2, mem18_2, mem19_2, mem20_2, mem21_2, visual_RST_ST_current_2 }),
		.in2({rx_dav_3, tx_ena_3, dataw_out_3, SRA_3, SRB_3, CRA_3, CRB_3, CRC_3, CRD_3, CRE_3, EN_ch_reg_3, AckByte_3, LenRep_3, TR_3, CH_3, CMD_3, LEN_3, up_addr_3, rep_node_3, SPI_CTRL_3, nc_ready_3, data_in_tmp_3, data_in_tmp1_3, invalid_cmd_3, up_cs_b_3, up_rw_b_3, up_data_out_3, mem0_3, mem1_3, mem2_3, mem3_3, mem4_3, mem5_3, mem6_3, mem7_3, mem8_3, mem9_3, mem10_3, mem11_3, mem12_3, mem13_3, mem14_3, mem15_3, mem16_3, mem17_3, mem18_3, mem19_3, mem20_3, mem21_3, visual_RST_ST_current_3 }),
		.in3({rx_dav,   tx_ena,   dataw_out,   SRA,   SRB,   CRA,   CRB,   CRC,   CRD,   CRE,   EN_ch_reg,   AckByte,   LenRep,   TR,   CH,   CMD,   LEN,   up_addr,   rep_node,   SPI_CTRL,   nc_ready,   data_in_tmp,   data_in_tmp1,   invalid_cmd,   up_cs_b,   up_rw_b,   up_data_out,   mem0,   mem1,   mem2,   mem3,   mem4,   mem5,   mem6,   mem7,   mem8,   mem9,   mem10,   mem11,   mem12,   mem13,   mem14,   mem15,   mem16,   mem17,   mem18,   mem19,   mem20,   mem21,   visual_RST_ST_current   }),
		.err(SEU_NCTRLflag1)
	);
	majority_error err_identif2 (
		.in2({rx_dav_2, tx_ena_2, dataw_out_2, SRA_2, SRB_2, CRA_2, CRB_2, CRC_2, CRD_2, CRE_2, EN_ch_reg_2, AckByte_2, LenRep_2, TR_2, CH_2, CMD_2, LEN_2, up_addr_2, rep_node_2, SPI_CTRL_2, nc_ready_2, data_in_tmp_2, data_in_tmp1_2, invalid_cmd_2, up_cs_b_2, up_rw_b_2, up_data_out_2, mem0_2, mem1_2, mem2_2, mem3_2, mem4_2, mem5_2, mem6_2, mem7_2, mem8_2, mem9_2, mem10_2, mem11_2, mem12_2, mem13_2, mem14_2, mem15_2, mem16_2, mem17_2, mem18_2, mem19_2, mem20_2, mem21_2, visual_RST_ST_current_2 }),
		.in3({rx_dav_3, tx_ena_3, dataw_out_3, SRA_3, SRB_3, CRA_3, CRB_3, CRC_3, CRD_3, CRE_3, EN_ch_reg_3, AckByte_3, LenRep_3, TR_3, CH_3, CMD_3, LEN_3, up_addr_3, rep_node_3, SPI_CTRL_3, nc_ready_3, data_in_tmp_3, data_in_tmp1_3, invalid_cmd_3, up_cs_b_3, up_rw_b_3, up_data_out_3, mem0_3, mem1_3, mem2_3, mem3_3, mem4_3, mem5_3, mem6_3, mem7_3, mem8_3, mem9_3, mem10_3, mem11_3, mem12_3, mem13_3, mem14_3, mem15_3, mem16_3, mem17_3, mem18_3, mem19_3, mem20_3, mem21_3, visual_RST_ST_current_3 }),
		.in1({rx_dav,   tx_ena,   dataw_out,   SRA,   SRB,   CRA,   CRB,   CRC,   CRD,   CRE,   EN_ch_reg,   AckByte,   LenRep,   TR,   CH,   CMD,   LEN,   up_addr,   rep_node,   SPI_CTRL,   nc_ready,   data_in_tmp,   data_in_tmp1,   invalid_cmd,   up_cs_b,   up_rw_b,   up_data_out,   mem0,   mem1,   mem2,   mem3,   mem4,   mem5,   mem6,   mem7,   mem8,   mem9,   mem10,   mem11,   mem12,   mem13,   mem14,   mem15,   mem16,   mem17,   mem18,   mem19,   mem20,   mem21,   visual_RST_ST_current   }),
		.err(SEU_NCTRLflag2)
	);
	majority_error err_identif3 (
		.in3({rx_dav_2, tx_ena_2, dataw_out_2, SRA_2, SRB_2, CRA_2, CRB_2, CRC_2, CRD_2, CRE_2, EN_ch_reg_2, AckByte_2, LenRep_2, TR_2, CH_2, CMD_2, LEN_2, up_addr_2, rep_node_2, SPI_CTRL_2, nc_ready_2, data_in_tmp_2, data_in_tmp1_2, invalid_cmd_2, up_cs_b_2, up_rw_b_2, up_data_out_2, mem0_2, mem1_2, mem2_2, mem3_2, mem4_2, mem5_2, mem6_2, mem7_2, mem8_2, mem9_2, mem10_2, mem11_2, mem12_2, mem13_2, mem14_2, mem15_2, mem16_2, mem17_2, mem18_2, mem19_2, mem20_2, mem21_2, visual_RST_ST_current_2 }),
		.in1({rx_dav_3, tx_ena_3, dataw_out_3, SRA_3, SRB_3, CRA_3, CRB_3, CRC_3, CRD_3, CRE_3, EN_ch_reg_3, AckByte_3, LenRep_3, TR_3, CH_3, CMD_3, LEN_3, up_addr_3, rep_node_3, SPI_CTRL_3, nc_ready_3, data_in_tmp_3, data_in_tmp1_3, invalid_cmd_3, up_cs_b_3, up_rw_b_3, up_data_out_3, mem0_3, mem1_3, mem2_3, mem3_3, mem4_3, mem5_3, mem6_3, mem7_3, mem8_3, mem9_3, mem10_3, mem11_3, mem12_3, mem13_3, mem14_3, mem15_3, mem16_3, mem17_3, mem18_3, mem19_3, mem20_3, mem21_3, visual_RST_ST_current_3 }),
		.in2({rx_dav,   tx_ena,   dataw_out,   SRA,   SRB,   CRA,   CRB,   CRC,   CRD,   CRE,   EN_ch_reg,   AckByte,   LenRep,   TR,   CH,   CMD,   LEN,   up_addr,   rep_node,   SPI_CTRL,   nc_ready,   data_in_tmp,   data_in_tmp1,   invalid_cmd,   up_cs_b,   up_rw_b,   up_data_out,   mem0,   mem1,   mem2,   mem3,   mem4,   mem5,   mem6,   mem7,   mem8,   mem9,   mem10,   mem11,   mem12,   mem13,   mem14,   mem15,   mem16,   mem17,   mem18,   mem19,   mem20,   mem21,   visual_RST_ST_current   }),
		.err(SEU_NCTRLflag3)
	);
`endif	
*/		
endmodule





//  Design Unit:
//  ------------
//      Unit    Name  :  ARBITER
//      Library Name  :  node_ctrl
//  
//      Creation Date :  Mon Jun 24 09:42:12 2013
//      Version       :  2012.09 v4.4.1 build 33. Date: Nov  1 2012. License: 2012.11
//  
//  Options Used:
//  -------------
//      Target
//         Language   :  As Is
//         Purpose    :  Synthesis
//         Vendor     :  BuildGates
//  
//      Style
//         Use tasks                      :  No
//         Code Destination               :  1 File per Unit
//         Attach Directives              :  Yes
//         Structural                     :  No
//         IF for state selection         :  No
//         Error (default) state          :  Yes
//         String typed state variable    :  No
//         Next state assignments         :  Non blocking
//         Free text style                :  / / ...
//         Preserve spacing for free text :  Yes
//         Declaration alignment          :  No
//         Sort Ports by mode             :  No
//         New line for each Port         :  No
//         Attach comment to Port         :  No
//
//--------------------------------------------------
//--------------------------------------------------
//  
//  Library Name :  node_ctrl
//  Unit    Name :  ARBITER
//  Unit    Type :  State Machine
//  
//----------------------------------------------------
 


module ARBITER_iostate(clock, reset, CH_int_iv, CH_int_ov, IE_CH, canal_iv, canal_ov, visual_Repos_current_iv, visual_Repos_current_ov);

`include "Table_Commande.v"


  input clock;
  input [2:0] visual_Repos_current_iv;
  input [5:0] canal_iv;
  input [20:0] IE_CH;
  input reset;
  output [5:0] CH_int_ov;
  output [2:0] visual_Repos_current_ov;
  output [5:0] canal_ov;
  input [5:0] CH_int_iv;
  
  wire clock;
  wire reset;
  wire [20:0] IE_CH;

  reg [5:0] CH_int_ov;
  reg [5:0] canal_ov;
  reg [2:0] visual_Repos_current_ov;
  
  parameter Repos      = 3'b000,
            Clr_int    = 3'b001,
            Int_Activ  = 3'b010,
            Next_canal = 3'b011,
            fin        = 3'b100,
            start      = 3'b101;

  always  @(posedge clock or posedge reset)
  begin : ARBITER_Repos
 
    if (reset === 1'b1)
    begin
      CH_int_ov <=   6'h0;  
      canal_ov <=   6'b0;
      visual_Repos_current_ov <=   Repos;
    end
    else
    begin
      CH_int_ov <=   CH_int_iv;  
      canal_ov <=   canal_iv;
      visual_Repos_current_ov <=   visual_Repos_current_iv;

      case (visual_Repos_current_iv)
        Repos:
          begin
            visual_Repos_current_ov <=   start;
          end
 
        Clr_int:
          begin
            canal_ov <=   canal_iv + 6'h1;
            visual_Repos_current_ov <=   Next_canal;
          end
 
        Int_Activ:
          begin
            if (IE_CH[canal_iv] == 1'b1)
            begin
              visual_Repos_current_ov <=   Int_Activ;
            end
            else if (IE_CH[canal_iv] == 1'b0)
            begin
              CH_int_ov <=   6'h0;
              visual_Repos_current_ov <=   Clr_int;
            end
            else
              visual_Repos_current_ov <=   Int_Activ;
          end
 
        Next_canal:
          begin
            visual_Repos_current_ov <=   fin;
          end
 
        fin:
          begin
            if (canal_iv[5:0] >= Num_Max_CH[5:0])
            begin
              CH_int_ov <=   6'h0;  
              canal_ov <=   6'b0;
              visual_Repos_current_ov <=   Repos;
            end
            else if (Num_Max_CH[5:0] >= canal_iv[5:0])
            begin
              visual_Repos_current_ov <=   start;
            end
            else
              visual_Repos_current_ov <=   fin;
          end
 
        start:
          begin
            if (IE_CH[canal_iv] == 1'b1)
            begin
              CH_int_ov <=   canal_iv;
              visual_Repos_current_ov <=   Int_Activ;
            end
            else if (IE_CH[canal_iv] == 1'b0)
            begin
              canal_ov <=   canal_iv + 6'h1;
              visual_Repos_current_ov <=   Next_canal;
            end
            else
              visual_Repos_current_ov <=   start;
          end
 
        default:
          begin
            CH_int_ov <=   6'h0;  
            canal_ov <=   6'b0;
            visual_Repos_current_ov <=   Repos;
          end
      endcase
    end
  end
 
 
 
endmodule



//  Design Unit:
//  ------------
//      Unit    Name  :  ARBITER
//      Library Name  :  node_ctrl
//  
//      Creation Date :  Mon Jun 24 09:42:12 2013
//      Version       :  2012.09 v4.4.1 build 33. Date: Nov  1 2012. License: 2012.11
//  
//  Options Used:
//  -------------
//      Target
//         Language   :  As Is
//         Purpose    :  Synthesis
//         Vendor     :  BuildGates
//  
//      Style
//         Use tasks                      :  No
//         Code Destination               :  1 File per Unit
//         Attach Directives              :  Yes
//         Structural                     :  No
//         IF for state selection         :  No
//         Error (default_1, default_2, default_3) state          :  Yes
//         String typed state variable    :  No
//         Next state assignments         :  Non blocking
//         Free text style                :  / / ...
//         Preserve spacing for free text :  Yes
//         Declaration alignment          :  No
//         Sort Ports by mode             :  No
//         New line for each Port         :  No
//         Attach comment to Port         :  No
//
//--------------------------------------------------
//--------------------------------------------------
//  
//  Library Name :  node_ctrl
//  Unit    Name :  ARBITER
//  Unit    Type :  State Machine
//  
//----------------------------------------------------

module ARBITER_tri(clock_1, clock_2, clock_3, reset_1, reset_2, reset_3, CH_int_1, CH_int_2, CH_int_3, IE_CH_1, IE_CH_2, IE_CH_3
                );

`include "Table_Commande.v"

  input clock_1, clock_2, clock_3;
  input reset_1, reset_2, reset_3;
  output [5:0] CH_int_1, CH_int_2, CH_int_3;
  input [20:0] IE_CH_1, IE_CH_2, IE_CH_3;

	wire [5:0] CH_int_1, CH_int_2, CH_int_3;
	wire [5:0] canal_1, canal_2, canal_3;
	wire [2:0] visual_Repos_current_1, visual_Repos_current_2, visual_Repos_current_3;
	wire [5:0] CH_int;
	wire [5:0] canal;
	wire [2:0] visual_Repos_current;

	ARBITER_iostate ARBITER_iostate_1  (.clock(clock_1), .reset(reset_1), .CH_int_iv(CH_int_1), .CH_int_ov(CH_int_2), .IE_CH(IE_CH_1), .canal_iv(canal_1), .canal_ov(canal_2), .visual_Repos_current_iv(visual_Repos_current_1), .visual_Repos_current_ov(visual_Repos_current_2));

	ARBITER_iostate ARBITER_iostate_2  (.clock(clock_2), .reset(reset_2), .CH_int_iv(CH_int_2), .CH_int_ov(CH_int_3), .IE_CH(IE_CH_2), .canal_iv(canal_2), .canal_ov(canal_3), .visual_Repos_current_iv(visual_Repos_current_2), .visual_Repos_current_ov(visual_Repos_current_3));

	ARBITER_iostate ARBITER_iostate_3  (.clock(clock_3), .reset(reset_3), .CH_int_iv(CH_int_3), .CH_int_ov(CH_int), .IE_CH(IE_CH_3), .canal_iv(canal_3), .canal_ov(canal), .visual_Repos_current_iv(visual_Repos_current_3), .visual_Repos_current_ov(visual_Repos_current));

	majority_voter #(.WIDTH(15)) mv (
		.in1({CH_int_2, canal_2, visual_Repos_current_2}),
		.in2({CH_int_3, canal_3, visual_Repos_current_3}),
		.in3({CH_int, canal, visual_Repos_current}),
		.out({CH_int_1, canal_1, visual_Repos_current_1}),
		.err()
	);
endmodule

