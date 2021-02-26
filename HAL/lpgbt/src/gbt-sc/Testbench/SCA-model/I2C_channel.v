// Modified the 1 October 2015
// change log:
// - line  559: added asyncronous reset for i2c_dat_out_o
// - line 1965: added initialization value for: 
//              busy_o, scl_o, sda_o, nb_byte_o, le_ec_o, 
//              address_o, ack_multi_orx_1byte_o, 
//              nb_bit_o, ack_ok_o, registre_o sda_gnd_o  



`timescale 1ns / 1ps
`include "I2C_prog_divider.v"
`timescale 1ns/1ps



//  Design Unit:
//  ------------
//      Unit    Name  :  wb_i2c
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
//         Sort Ports by mode             :  No
//         New line for each Port         :  No
//         Attach comment to Port         :  No
//
//--------------------------------------------------
//--------------------------------------------------
//  
//  Library Name :  node_ctrl
//  Unit    Name :  wb_i2c
//  Unit    Type :  Block Diagram
//  
//----------------------------------------------------
 


module wb_i2c_tri (

output  scl_1,
output  scl_2,
output  scl_3,
output  sclen_1,// added 26 october 2015 
output  sclen_2,// added 26 october 2015 
output  sclen_3,// added 26 october 2015 
output  sda_out_1,
output  sda_out_2,
output  sda_out_3,
output  wb_int_o_1,
output  wb_int_o_2,
output  wb_int_o_3,
output  wb_ack_o_1,
output  wb_ack_o_2,
output  wb_ack_o_3,
output  wb_err_o_1,
output  wb_err_o_2,
output  wb_err_o_3,
output [31:0]  wb_dat_o_1, 
output [31:0]  wb_dat_o_2, 
output [31:0]  wb_dat_o_3, 
input  sda_in_1,
input  sda_in_2,
input  sda_in_3,
input [31:0]  wb_dat_i_1, 
input [31:0]  wb_dat_i_2, 
input [31:0]  wb_dat_i_3, 
input [4:0]  wb_adr_i_1,
input [4:0]  wb_adr_i_2,
input [4:0]  wb_adr_i_3,
input  wb_rst_i_1,
input  wb_rst_i_2,
input  wb_rst_i_3,
input [3:0]  wb_sel_i_1, 
input [3:0]  wb_sel_i_2, 
input [3:0]  wb_sel_i_3, 
input  wb_we_i_1,
input  wb_we_i_2,
input  wb_we_i_3,
input  wb_stb_i_1,
input  wb_stb_i_2,
input  wb_stb_i_3,
input  wb_cyc_i_1,
input  wb_cyc_i_2,
input  wb_cyc_i_3,
input  wb_clk_i_1,
input  wb_clk_i_2,
input  wb_clk_i_3
);

wire [31:0]  i2c_msk_reg_1;
wire [31:0]  i2c_msk_reg_2;
wire [31:0]  i2c_msk_reg_3;
wire [7:0]  SRA_reg_1;
wire [7:0]  SRA_reg_2;
wire [7:0]  SRA_reg_3;
wire  reponse_1;
wire  reponse_2;
wire  reponse_3;
wire  read_nc_1;
wire  read_nc_2;
wire  read_nc_3;
wire [7:0]  i2c_dat_out_1;
wire [7:0]  i2c_dat_out_2;
wire [7:0]  i2c_dat_out_3;
wire  Start_tr_1;
wire  Start_tr_2;
wire  Start_tr_3;
wire [7:0]  Rx_Byte_1;
wire [7:0]  Rx_Byte_2;
wire [7:0]  Rx_Byte_3;
wire  MultiByte_1;
wire  MultiByte_2;
wire  MultiByte_3;
wire [127:0]  rx_1;
wire [127:0]  rx_2;
wire [127:0]  rx_3;
wire [3:0]  data_reg_sel_1;
wire [3:0]  data_reg_sel_2;
wire [3:0]  data_reg_sel_3;
wire  busy_1;
wire  busy_2;
wire  busy_3;
wire  rx_1byte_1;
wire  rx_1byte_2;
wire  rx_1byte_3;
wire [31:0]  i2c_ctrl_reg_1;
wire [31:0]  i2c_ctrl_reg_2;
wire [31:0]  i2c_ctrl_reg_3;
wire [3:0]  blktr_idx_1;
wire [3:0]  blktr_idx_2;
wire [3:0]  blktr_idx_3;
wire [31:0]  r0_out_1;
wire [31:0]  r0_out_2;
wire [31:0]  r0_out_3;
wire [3:0]  O_1;
wire [3:0]  O_2;
wire [3:0]  O_3;
wire  S133_1;
wire  S133_2;
wire  S133_3;
wire  le_ec_1;
wire  le_ec_2;
wire  le_ec_3;

// added 26 october 2015 
	wire outscl_1, outscl_2, outscl_3;
	wire scl_mode_1 = i2c_ctrl_reg_1[31];
	wire scl_mode_2 = i2c_ctrl_reg_2[31];
	wire scl_mode_3 = i2c_ctrl_reg_3[31];
	assign scl_1    = (scl_mode_1) ? outscl_1 : 1'b0;
	assign scl_2    = (scl_mode_2) ? outscl_2 : 1'b0;
	assign scl_3    = (scl_mode_3) ? outscl_3 : 1'b0;
	assign sclen_1  = (scl_mode_1) ? 1'b1 : ~outscl_1;
	assign sclen_2  = (scl_mode_2) ? 1'b1 : ~outscl_2;
	assign sclen_3  = (scl_mode_3) ? 1'b1 : ~outscl_3;
/////////////////////// 

i2c_multi_reg_tri  I2C_multi (
     .clk_1(wb_clk_i_1),
     .rst_1(wb_rst_i_1),
     .wb_dat_in_1(wb_dat_i_1[31:0]),
     .i2c_dat_out_1(i2c_dat_out_1[7:0]),
     .latch_1(O_1[3:0]),
     .i2c_latch_1(blktr_idx_1[3:0]),
     .Rx_1byte_1(rx_1byte_1),
     .rx_1(rx_1[127:0]),
     .byte_sel_1(wb_sel_i_1[3:0]),
     .tip_1(busy_1),
     .le_el_1(le_ec_1),
     .multi_byte_1(MultiByte_1),
     .Rx_Byte_in_1(Rx_Byte_1[7:0]),
		.clk_2(wb_clk_i_2),
     .rst_2(wb_rst_i_2),
     .wb_dat_in_2(wb_dat_i_2[31:0]),
     .i2c_dat_out_2(i2c_dat_out_2[7:0]),
     .latch_2(O_2[3:0]),
     .i2c_latch_2(blktr_idx_2[3:0]),
     .Rx_1byte_2(rx_1byte_2),
     .rx_2(rx_2[127:0]),
     .byte_sel_2(wb_sel_i_2[3:0]),
     .tip_2(busy_2),
     .le_el_2(le_ec_2),
     .multi_byte_2(MultiByte_2),
     .Rx_Byte_in_2(Rx_Byte_2[7:0]),
		.clk_3(wb_clk_i_3),
     .rst_3(wb_rst_i_3),
     .wb_dat_in_3(wb_dat_i_3[31:0]),
     .i2c_dat_out_3(i2c_dat_out_3[7:0]),
     .latch_3(O_3[3:0]),
     .i2c_latch_3(blktr_idx_3[3:0]),
     .Rx_1byte_3(rx_1byte_3),
     .rx_3(rx_3[127:0]),
     .byte_sel_3(wb_sel_i_3[3:0]),
     .tip_3(busy_3),
     .le_el_3(le_ec_3),
     .multi_byte_3(MultiByte_3),
     .Rx_Byte_in_3(Rx_Byte_3[7:0])
	);


wb_adapt_i2c_tri  WB2I2c (
     .clk_1(wb_clk_i_1),
     .rst_1(wb_rst_i_1),
     .Start_tr_1(Start_tr_1),
     .wb_ack_1(wb_ack_o_1),
     .reponse_n_1(reponse_1),
     .read_nc_1(read_nc_1),
     .wb_we_1(wb_we_i_1),
     .wb_addr_1(wb_adr_i_1[4:0]),
		.clk_2(wb_clk_i_2),
     .rst_2(wb_rst_i_2),
     .Start_tr_2(Start_tr_2),
     .wb_ack_2(wb_ack_o_2),
     .reponse_n_2(reponse_2),
     .read_nc_2(read_nc_2),
     .wb_we_2(wb_we_i_2),
     .wb_addr_2(wb_adr_i_2[4:0]),
		.clk_3(wb_clk_i_3),
     .rst_3(wb_rst_i_3),
     .Start_tr_3(Start_tr_3),
     .wb_ack_3(wb_ack_o_3),
     .reponse_n_3(reponse_3),
     .read_nc_3(read_nc_3),
     .wb_we_3(wb_we_i_3),
     .wb_addr_3(wb_adr_i_3[4:0])
);


wb_generic_tri  wb_gen_1 (
     .wb_clk_in_1(wb_clk_i_1),
     .wb_rst_in_1(wb_rst_i_1),
     .wb_adr_in_1(wb_adr_i_1[4:0]),
     .wb_dat_in_1(wb_dat_i_1[31:0]),
     .wb_dat_out_1(wb_dat_o_1[31:0]),
     .wb_sel_in_1(wb_sel_i_1[3:0]),
     .wb_we_in_1(wb_we_i_1),
     .wb_stb_in_1(wb_stb_i_1),
     .wb_cyc_in_1(wb_cyc_i_1),
     .wb_ack_out_1(wb_ack_o_1),
     .wb_err_out_1(wb_err_o_1),
     .wb_int_out_1(wb_int_o_1),
     .registre0_1(r0_out_1[31:0]),
     .i2c_msk_reg_1(i2c_msk_reg_1[31:0]),
     .tip_1(busy_1),
     .last_bit_1(read_nc_1),
     .status_i2c_1(SRA_reg_1[7:0]),
     .i2c_ctrl_reg_1(i2c_ctrl_reg_1[31:0]),
     .rx_byte_in_1(Rx_Byte_1[7:0]),
     .data_reg_sel_1(data_reg_sel_1[3:0]),
     .rx_1(rx_1[127:0]),
		.wb_clk_in_2(wb_clk_i_2),
     .wb_rst_in_2(wb_rst_i_2),
     .wb_adr_in_2(wb_adr_i_2[4:0]),
     .wb_dat_in_2(wb_dat_i_2[31:0]),
     .wb_dat_out_2(wb_dat_o_2[31:0]),
     .wb_sel_in_2(wb_sel_i_2[3:0]),
     .wb_we_in_2(wb_we_i_2),
     .wb_stb_in_2(wb_stb_i_2),
     .wb_cyc_in_2(wb_cyc_i_2),
     .wb_ack_out_2(wb_ack_o_2),
     .wb_err_out_2(wb_err_o_2),
     .wb_int_out_2(wb_int_o_2),
     .registre0_2(r0_out_2[31:0]),
     .i2c_msk_reg_2(i2c_msk_reg_2[31:0]),
     .tip_2(busy_2),
     .last_bit_2(read_nc_2),
     .status_i2c_2(SRA_reg_2[7:0]),
     .i2c_ctrl_reg_2(i2c_ctrl_reg_2[31:0]),
     .rx_byte_in_2(Rx_Byte_2[7:0]),
     .data_reg_sel_2(data_reg_sel_2[3:0]),
     .rx_2(rx_2[127:0]),
		.wb_clk_in_3(wb_clk_i_3),
     .wb_rst_in_3(wb_rst_i_3),
     .wb_adr_in_3(wb_adr_i_3[4:0]),
     .wb_dat_in_3(wb_dat_i_3[31:0]),
     .wb_dat_out_3(wb_dat_o_3[31:0]),
     .wb_sel_in_3(wb_sel_i_3[3:0]),
     .wb_we_in_3(wb_we_i_3),
     .wb_stb_in_3(wb_stb_i_3),
     .wb_cyc_in_3(wb_cyc_i_3),
     .wb_ack_out_3(wb_ack_o_3),
     .wb_err_out_3(wb_err_o_3),
     .wb_int_out_3(wb_int_o_3),
     .registre0_3(r0_out_3[31:0]),
     .i2c_msk_reg_3(i2c_msk_reg_3[31:0]),
     .tip_3(busy_3),
     .last_bit_3(read_nc_3),
     .status_i2c_3(SRA_reg_3[7:0]),
     .i2c_ctrl_reg_3(i2c_ctrl_reg_3[31:0]),
     .rx_byte_in_3(Rx_Byte_3[7:0]),
     .data_reg_sel_3(data_reg_sel_3[3:0]),
     .rx_3(rx_3[127:0])
);


i2c_blk_tri  I2C_ccu (
     	.scl_1(outscl_1),
     .sda_out_1(sda_out_1),
     .reponse_1(reponse_1),
     .clk_1(wb_clk_i_1),
     .read_nc_1(read_nc_1),
     .busy_1(busy_1),
     .sda_in_1(sda_in_1),
     .i2c_br_1(S133_1),
     .reset_1(wb_rst_i_1),
     .SRA_out_1(SRA_reg_1[7:0]),
     .MultiByte_1(MultiByte_1),
     .rx_1byte_1(rx_1byte_1),
     .msk_1(i2c_msk_reg_1[31:24]),
     .blktr_idx_1(blktr_idx_1[3:0]),
     .Start_tr_n_1(Start_tr_1),
     .le_ec_1(le_ec_1),
     .Rx_Byte_o_1(Rx_Byte_1[7:0]),
     .multi_byte_in_1(i2c_dat_out_1[7:0]),
     .cra_1(i2c_ctrl_reg_1[30:24]),
     .byte_out_cmd_1(r0_out_1[31:24]),
     .byte_out3_1(r0_out_1[23:16]),
     .byte_out4_1(r0_out_1[15:8]),
     .byte_out5_1(r0_out_1[7:0]),
		.scl_2(outscl_2),
     .sda_out_2(sda_out_2),
     .reponse_2(reponse_2),
     .clk_2(wb_clk_i_2),
     .read_nc_2(read_nc_2),
     .busy_2(busy_2),
     .sda_in_2(sda_in_2),
     .i2c_br_2(S133_2),
     .reset_2(wb_rst_i_2),
     .SRA_out_2(SRA_reg_2[7:0]),
     .MultiByte_2(MultiByte_2),
     .rx_1byte_2(rx_1byte_2),
     .msk_2(i2c_msk_reg_2[31:24]),
     .blktr_idx_2(blktr_idx_2[3:0]),
     .Start_tr_n_2(Start_tr_2),
     .le_ec_2(le_ec_2),
     .Rx_Byte_o_2(Rx_Byte_2[7:0]),
     .multi_byte_in_2(i2c_dat_out_2[7:0]),
     .cra_2(i2c_ctrl_reg_2[31:24]),
     .byte_out_cmd_2(r0_out_2[31:24]),
     .byte_out3_2(r0_out_2[23:16]),
     .byte_out4_2(r0_out_2[15:8]),
     .byte_out5_2(r0_out_2[7:0]),
		.scl_3(outscl_3),
     .sda_out_3(sda_out_3),
     .reponse_3(reponse_3),
     .clk_3(wb_clk_i_3),
     .read_nc_3(read_nc_3),
     .busy_3(busy_3),
     .sda_in_3(sda_in_3),
     .i2c_br_3(S133_3),
     .reset_3(wb_rst_i_3),
     .SRA_out_3(SRA_reg_3[7:0]),
     .MultiByte_3(MultiByte_3),
     .rx_1byte_3(rx_1byte_3),
     .msk_3(i2c_msk_reg_3[31:24]),
     .blktr_idx_3(blktr_idx_3[3:0]),
     .Start_tr_n_3(Start_tr_3),
     .le_ec_3(le_ec_3),
     .Rx_Byte_o_3(Rx_Byte_3[7:0]),
     .multi_byte_in_3(i2c_dat_out_3[7:0]),
     .cra_3(i2c_ctrl_reg_3[31:24]),
     .byte_out_cmd_3(r0_out_3[31:24]),
     .byte_out3_3(r0_out_3[23:16]),
     .byte_out4_3(r0_out_3[15:8]),
     .byte_out5_3(r0_out_3[7:0])
);

assign S133_1 = 1'b0;
assign S133_2 = 1'b0;
assign S133_3 = 1'b0;

assign O_1[3] = ( data_reg_sel_1[3]) & ( wb_we_i_1);
assign O_2[3] = ( data_reg_sel_2[3]) & ( wb_we_i_2);
assign O_3[3] = ( data_reg_sel_3[3]) & ( wb_we_i_3);

assign O_1[2] = ( data_reg_sel_1[2]) & ( wb_we_i_1);
assign O_2[2] = ( data_reg_sel_2[2]) & ( wb_we_i_2);
assign O_3[2] = ( data_reg_sel_3[2]) & ( wb_we_i_3);

assign O_1[1] = ( data_reg_sel_1[1]) & ( wb_we_i_1);
assign O_2[1] = ( data_reg_sel_2[1]) & ( wb_we_i_2);
assign O_3[1] = ( data_reg_sel_3[1]) & ( wb_we_i_3);

assign O_1[0] = ( data_reg_sel_1[0]) & ( wb_we_i_1);
assign O_2[0] = ( data_reg_sel_2[0]) & ( wb_we_i_2);
assign O_3[0] = ( data_reg_sel_3[0]) & ( wb_we_i_3);


endmodule



//  Design Unit:
//  ------------
//      Unit    Name  :  i2c_multi_reg
//      Library Name  :  node_ctrl
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013  (CHANGED 11SEPT13)
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
//  Unit    Name :  i2c_multi_reg
//  Unit    Type :  Text Unit
//  
//----------------------------------------------------
//////////////////////////////////////////
//////////////////////////////////////////
// Date        : Tue Nov 20 11:36:53 2012
//
// Author      : Ch.Paillard
//
// Company     : CERN
//
// Description : registre 128 bit pour multi byte transfert i2c
//
//////////////////////////////////////////
//////////////////////////////////////////



module i2c_multi_reg_iostate(clk,rst,wb_dat_in,i2c_dat_out_i, i2c_dat_out_o,latch,i2c_latch,
                     Rx_1byte,rx,byte_sel,tip,le_el,multi_byte,Rx_Byte_in, data_i, data_o);
  
 input           clk;
 input    [7:0]  i2c_dat_out_i; 
 input  [127:0]  data_i;   

 input           rst;
 input    [3:0]  latch;         
 output [127:0]  rx;
 output   [7:0]  i2c_dat_out_o;
 output [127:0]  data_o;
 input    [3:0]  byte_sel;     
 input           tip;                 
 input           le_el;               
 input           multi_byte;          
 input           Rx_1byte;            
 input  [31:0]   wb_dat_in;  
 input   [3:0]   i2c_latch;  
 input   [7:0]   Rx_Byte_in;  
 reg     [7:0]   i2c_dat_out_o;
 reg   [127:0]   data_o;
 
 
 assign rx = data_i;
 
  always @(posedge clk or posedge rst)
  begin
    if(rst) begin
     // cnt <= #1 {`SPI_CHAR_LEN_BITS+1{1'b0}};
       data_o[127:0] <= 128'h00000000;
    end
    else begin
    data_o <= data_i; 
    if (latch[0] && !tip)   // mettre l'equivalent de tip dans les conditions pour empecher l'ecriture depuis wb. pendant i2cactif
        begin
         if(byte_sel[3])   // R0
             data_o[31:24] <= wb_dat_in[31:24];              
        if(byte_sel[2])
             data_o[23:16] <= wb_dat_in[23:16];             
        if(byte_sel[1])
             data_o[15:8] <= wb_dat_in[15:8];                     
         if(byte_sel[0])
             data_o[7:0] <= wb_dat_in[7:0];                          
      end
     else if (latch[1]&& !tip)   // R1
       begin
         if(byte_sel[3])
             data_o[63:56] <= wb_dat_in[31:24];               
        if(byte_sel[2])
             data_o[55:48] <= wb_dat_in[23:16];               
        if(byte_sel[1])
             data_o[47:40] <= wb_dat_in[15:8];                     
         if(byte_sel[0])
             data_o[39:32] <= wb_dat_in[7:0];                              
       end  
       
     else if (latch[2]&& !tip)   // R2
       begin
         if(byte_sel[3])
             data_o[95:88] <= wb_dat_in[31:24];              
        if(byte_sel[2])
             data_o[87:80] <= wb_dat_in[23:16];              
        if(byte_sel[1])
             data_o[79:72] <= wb_dat_in[15:8];                     
         if(byte_sel[0])
             data_o[71:64] <= wb_dat_in[7:0];                              
       end        
  
     else if (latch[3]&& !tip)  //R3
       begin
         if(byte_sel[3])
             data_o[127:120] <= wb_dat_in[31:24];              
        if(byte_sel[2])
             data_o[119:112] <= wb_dat_in[23:16];               
        if(byte_sel[1])
             data_o[111:104] <= wb_dat_in[15:8];                     
         if(byte_sel[0])
             data_o[103:96] <= wb_dat_in[7:0];                              
       end         
     else    // transfer i2c actif  mais en i2c read !!! lec_ec == 1
     begin
        if (tip && le_el  && multi_byte && Rx_1byte)    // lecture i2c
           begin
                if(i2c_latch == 4'hf)
                  data_o[7:0] <= Rx_Byte_in[7:0]; 
           else if(i2c_latch == 4'he)
                  data_o[15:8]<= Rx_Byte_in[7:0]; 
           else if(i2c_latch == 4'hd)
                  data_o[23:16]<= Rx_Byte_in[7:0]; 
           else if(i2c_latch == 4'hc)
                  data_o[31:24]<= Rx_Byte_in[7:0];    
           else if(i2c_latch == 4'hb)
                  data_o[39:32]<= Rx_Byte_in[7:0];                 
           else if(i2c_latch == 4'ha)
                  data_o[47:40]<= Rx_Byte_in[7:0];              
           else if(i2c_latch == 4'h9)
                  data_o[55:48]<= Rx_Byte_in[7:0];                       
           else if(i2c_latch == 4'h8)
                  data_o[63:56]<= Rx_Byte_in[7:0];      
           else if(i2c_latch == 4'h7)
                  data_o[71:64]<= Rx_Byte_in[7:0];                 
           else if(i2c_latch == 4'h6)
                  data_o[79:72]<= Rx_Byte_in[7:0];
           else if(i2c_latch == 4'h5)
                  data_o[87:80]<= Rx_Byte_in[7:0];               
           else if(i2c_latch == 4'h4)
                  data_o[95:88]<= Rx_Byte_in[7:0];                                   
           else if(i2c_latch == 4'h3)
                  data_o[103:96]<= Rx_Byte_in[7:0];
           else if(i2c_latch == 4'h2)
                  data_o[111:104]<= Rx_Byte_in[7:0];               
           else if(i2c_latch == 4'h1)
                  data_o[119:112]<= Rx_Byte_in[7:0];                      
           else if(i2c_latch == 4'h0)
                  data_o[127:120]<= Rx_Byte_in[7:0];                                                    
         end
     end     
     end
  end
  
always @(posedge clk or posedge rst) begin
	if(rst)
		i2c_dat_out_o <= 8'h0;
	else begin
		if(i2c_latch == 4'h0)				 
			i2c_dat_out_o <= data_i[31:24];   // ------modif 7.3.13--------------R0 
		else if(i2c_latch == 4'h1)
			i2c_dat_out_o <= data_i[23:16];  
		else if(i2c_latch == 4'h2)
			i2c_dat_out_o <= data_i[15:8];  
		else if(i2c_latch == 4'h3)
			i2c_dat_out_o <= data_i[7:0];	    
		else if(i2c_latch == 4'h4)   //------------------------------R1
			i2c_dat_out_o <= data_i[63:56];
		else if(i2c_latch == 4'h5)
			i2c_dat_out_o <= data_i[55:48];
		else if(i2c_latch == 4'h6)
			i2c_dat_out_o <= data_i[47:40];	 
		else if(i2c_latch == 4'h7)
			i2c_dat_out_o <= data_i[39:32]; 
		else if(i2c_latch == 4'h8)   //------------------------------R2
			i2c_dat_out_o <= data_i[95:88];
		else if(i2c_latch == 4'h9)
			i2c_dat_out_o <= data_i[87:80];
		else if(i2c_latch == 4'ha)
			i2c_dat_out_o <= data_i[79:72];	 
		else if(i2c_latch == 4'hb)
			i2c_dat_out_o <= data_i[71:64]; 
		else if(i2c_latch == 4'hc)   //------------------------------R3
			i2c_dat_out_o <= data_i[127:120];
		else if(i2c_latch == 4'hd)
			i2c_dat_out_o <= data_i[119:112];
		else if(i2c_latch == 4'he)
			i2c_dat_out_o <= data_i[111:104];	   
		else if(i2c_latch == 4'hf)
			i2c_dat_out_o <= data_i[103:96];				     
	end
end  
 
endmodule
 /*
  assign rx = data_i;
  always @(posedge clk or posedge rst)
  begin
    if(rst)
       data_o[127:0] <= 128'h89;
    else 
    begin
      data_o <= data_i; 
    	if (latch[0] && !tip)   
        begin
         if(byte_sel[3])   
             data_o[31:24] <= wb_dat_in[31:24];              
         if(byte_sel[2])
             data_o[23:16] <= wb_dat_in[23:16];             
         if(byte_sel[1])
             data_o[15:8] <= wb_dat_in[15:8];                     
         if(byte_sel[0])
             data_o[7:0] <= wb_dat_in[7:0];                          
      end
     else if (latch[1]&& !tip)  
       begin
         if(byte_sel[3])
             data_o[63:56] <= wb_dat_in[31:24];               
         if(byte_sel[2])
             data_o[55:48] <= wb_dat_in[23:16];               
         if(byte_sel[1])
             data_o[47:40] <= wb_dat_in[15:8];                     
         if(byte_sel[0])
             data_o[39:32] <= wb_dat_in[7:0];                              
       end  
     else if (latch[2]&& !tip)   // R2
       begin
         if(byte_sel[3])
             data_o[95:88] <= wb_dat_in[31:24];              
         if(byte_sel[2])
             data_o[87:80] <= wb_dat_in[23:16];              
         if(byte_sel[1])
             data_o[79:72] <= wb_dat_in[15:8];                     
         if(byte_sel[0])
             data_o[71:64] <= wb_dat_in[7:0];                              
       end        
  
     else if (latch[3]&& !tip)  //R3
       begin
         if(byte_sel[3])
             data_o[127:120] <= wb_dat_in[31:24];              
         if(byte_sel[2])
             data_o[119:112] <= wb_dat_in[23:16];               
         if(byte_sel[1])
             data_o[111:104] <= wb_dat_in[15:8];                     
         if(byte_sel[0])
             data_o[103:96] <= wb_dat_in[7:0];                              
       end         
     else    
     begin
        if (tip && le_el  && multi_byte && Rx_1byte)    
           begin
                if(i2c_latch == 4'h0)
                  data_o[7:0] <= Rx_Byte_in[7:0]; 
           else if(i2c_latch == 4'h1)
                  data_o[15:8]<= Rx_Byte_in[7:0]; 
           else if(i2c_latch == 4'h2)
                  data_o[23:16]<= Rx_Byte_in[7:0]; 
           else if(i2c_latch == 4'h3)
                  data_o[31:24]<= Rx_Byte_in[7:0];    
           else if(i2c_latch == 4'h4)
                  data_o[39:32]<= Rx_Byte_in[7:0];                 
           else if(i2c_latch == 4'h5)
                  data_o[47:40]<= Rx_Byte_in[7:0];              
           else if(i2c_latch == 4'h6)
                  data_o[55:48]<= Rx_Byte_in[7:0];                       
           else if(i2c_latch == 4'h7)
                  data_o[63:56]<= Rx_Byte_in[7:0];      
           else if(i2c_latch == 4'h8)
                  data_o[71:64]<= Rx_Byte_in[7:0];                 
           else if(i2c_latch == 4'h9)
                  data_o[79:72]<= Rx_Byte_in[7:0];
           else if(i2c_latch == 4'ha)
                  data_o[87:80]<= Rx_Byte_in[7:0];               
           else if(i2c_latch == 4'hb)
                  data_o[95:88]<= Rx_Byte_in[7:0];                                   
           else if(i2c_latch == 4'hc)
                  data_o[103:96]<= Rx_Byte_in[7:0];
           else if(i2c_latch == 4'hd)
                  data_o[111:104]<= Rx_Byte_in[7:0];               
           else if(i2c_latch == 4'he)
                  data_o[119:112]<= Rx_Byte_in[7:0];                      
           else if(i2c_latch == 4'hf)
                  data_o[127:120]<= Rx_Byte_in[7:0];                                                     
         end
     end 
    end     
  end
  
always @(posedge clk )
 begin
   if(i2c_latch == 4'h0)                            
      i2c_dat_out_o <= data_i[31:24];  
  else if(i2c_latch == 4'h1)
      i2c_dat_out_o <= data_i[23:16];  
  else if(i2c_latch == 4'h2)
      i2c_dat_out_o <= data_i[15:8];  
  else if(i2c_latch == 4'h3)
      i2c_dat_out_o <= data_i[7:0];           
  else if(i2c_latch == 4'h4)   //------------------------------R1
      i2c_dat_out_o <= data_i[63:56];
  else if(i2c_latch == 4'h5)
      i2c_dat_out_o <= data_i[55:48];
  else if(i2c_latch == 4'h6)
      i2c_dat_out_o <= data_i[47:40];      
  else if(i2c_latch == 4'h7)
      i2c_dat_out_o <= data_i[39:32]; 
  else if(i2c_latch == 4'h8)   //------------------------------R2
      i2c_dat_out_o <= data_i[95:88];
  else if(i2c_latch == 4'h9)
      i2c_dat_out_o <= data_i[87:80];
  else if(i2c_latch == 4'ha)
      i2c_dat_out_o <= data_i[79:72];      
  else if(i2c_latch == 4'hb)
      i2c_dat_out_o <= data_i[71:64]; 
  else if(i2c_latch == 4'hc)   //------------------------------R3
      i2c_dat_out_o <= data_i[127:120];
  else if(i2c_latch == 4'hd)
      i2c_dat_out_o <= data_i[119:112];
  else if(i2c_latch == 4'he)
      i2c_dat_out_o <= data_i[111:104];      
  else if(i2c_latch == 4'hf)
      i2c_dat_out_o <= data_i[103:96]; 
  else 
  	i2c_dat_out_o <= i2c_dat_out_i;                                
 end  
endmodule*/



//  Design Unit:
//  ------------
//      Unit    Name  :  i2c_multi_reg
//      Library Name  :  node_ctrl
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//  Unit    Name :  i2c_multi_reg
//  Unit    Type :  Text Unit
//  
//----------------------------------------------------
//////////////////////////////////////////
//////////////////////////////////////////
// Date        : Tue Nov 20 11:36:53 2012
//
// Author      : Ch.Paillard
//
// Company     : CERN
//
// Description : registre 128 bit pour multi byte transfert i2c
//
//////////////////////////////////////////
//////////////////////////////////////////

module i2c_multi_reg_tri(clk_1, clk_2, clk_3,rst_1, rst_2, rst_3,wb_dat_in_1, wb_dat_in_2, wb_dat_in_3,i2c_dat_out_1, i2c_dat_out_2, i2c_dat_out_3,latch_1, latch_2, latch_3,i2c_latch_1, i2c_latch_2, i2c_latch_3,
                     Rx_1byte_1, Rx_1byte_2, Rx_1byte_3,rx_1, rx_2, rx_3,byte_sel_1, byte_sel_2, byte_sel_3,tip_1, tip_2, tip_3,le_el_1, le_el_2, le_el_3,multi_byte_1, multi_byte_2, multi_byte_3,Rx_Byte_in_1, Rx_Byte_in_2, Rx_Byte_in_3);

 input clk_1, clk_2, clk_3;
 input rst_1, rst_2, rst_3;
 input [3:0] latch_1, latch_2, latch_3;         
 output [127:0]  rx_1, rx_2, rx_3;
 input [3:0]  byte_sel_1, byte_sel_2, byte_sel_3;     
 input tip_1, tip_2, tip_3;                 
 input le_el_1, le_el_2, le_el_3;               
 input multi_byte_1, multi_byte_2, multi_byte_3;          
 input Rx_1byte_1, Rx_1byte_2, Rx_1byte_3;            
 input  [31:0]   wb_dat_in_1, wb_dat_in_2, wb_dat_in_3;  
 input  [3:0]    i2c_latch_1, i2c_latch_2, i2c_latch_3;  
 input  [7:0]    Rx_Byte_in_1, Rx_Byte_in_2, Rx_Byte_in_3;  
 output [7:0]    i2c_dat_out_1, i2c_dat_out_2, i2c_dat_out_3; 

	wire [127:0] data_1, data_2, data_3;
	wire [7:0] i2c_dat_out_1, i2c_dat_out_2, i2c_dat_out_3;
	wire [127:0] data;
	wire [7:0] i2c_dat_out;

	i2c_multi_reg_iostate i2c_multi_reg_iostate_1  (.clk(clk_1),.rst(rst_1),.wb_dat_in(wb_dat_in_1),.i2c_dat_out_i(i2c_dat_out_1), .i2c_dat_out_o(i2c_dat_out_2),.latch(latch_1),.i2c_latch(i2c_latch_1),
                     .Rx_1byte(Rx_1byte_1),.rx(rx_1),.byte_sel(byte_sel_1),.tip(tip_1),.le_el(le_el_1),.multi_byte(multi_byte_1),.Rx_Byte_in(Rx_Byte_in_1), .data_i(data_1), .data_o(data_2));

	i2c_multi_reg_iostate i2c_multi_reg_iostate_2  (.clk(clk_2),.rst(rst_2),.wb_dat_in(wb_dat_in_2),.i2c_dat_out_i(i2c_dat_out_2), .i2c_dat_out_o(i2c_dat_out_3),.latch(latch_2),.i2c_latch(i2c_latch_2),
                     .Rx_1byte(Rx_1byte_2),.rx(rx_2),.byte_sel(byte_sel_2),.tip(tip_2),.le_el(le_el_2),.multi_byte(multi_byte_2),.Rx_Byte_in(Rx_Byte_in_2), .data_i(data_2), .data_o(data_3));

	i2c_multi_reg_iostate i2c_multi_reg_iostate_3  (.clk(clk_3),.rst(rst_3),.wb_dat_in(wb_dat_in_3),.i2c_dat_out_i(i2c_dat_out_3), .i2c_dat_out_o(i2c_dat_out),.latch(latch_3),.i2c_latch(i2c_latch_3),
                     .Rx_1byte(Rx_1byte_3),.rx(rx_3),.byte_sel(byte_sel_3),.tip(tip_3),.le_el(le_el_3),.multi_byte(multi_byte_3),.Rx_Byte_in(Rx_Byte_in_3), .data_i(data_3), .data_o(data));

	majority_voter #(.WIDTH(136)) mv (
		.in1({data_2, i2c_dat_out_2}),
		.in2({data_3, i2c_dat_out_3}),
		.in3({data, i2c_dat_out}),
		.out({data_1, i2c_dat_out_1}),
		.err()
	);
endmodule



//  Design Unit:
//  ------------
//      Unit    Name  :  wb_adapt_i2c
//      Library Name  :  node_ctrl
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//  Unit    Name :  wb_adapt_i2c
//  Unit    Type :  State Machine
//  
//----------------------------------------------------
 

module wb_adapt_i2c_iostate (clk, rst, Start_tr_i, Start_tr_o, wb_ack, reponse_n, read_nc_i, read_nc_o, wb_we,
                     wb_addr
                     , visual_wb2ccu_nc_iddle_current_i, visual_wb2ccu_nc_iddle_current_o);
 
   parameter wb2ccu_nc_iddle = 3'b000,
            ReadNc          = 3'b001,
            Reponse_i2c     = 3'b010,
            S14             = 3'b011,
            out_crc_ok      = 3'b100;
            
  input clk;
  input [2:0] visual_wb2ccu_nc_iddle_current_i;
 
  input wb_we;
  input [4:0] wb_addr;
  wire clk;
  input rst;
  wire rst;
  output Start_tr_o;
	output [2:0] visual_wb2ccu_nc_iddle_current_o;
	output read_nc_o;
	input read_nc_i;
  input Start_tr_i;
  reg Start_tr_o;
  input wb_ack;            
  wire wb_ack;
  input reponse_n;  
  wire reponse_n;
  reg read_nc_o;
  wire wb_we;
  wire [4:0] wb_addr;
 
 
  reg [2:0] visual_wb2ccu_nc_iddle_current_o;
  
always  @(posedge clk or posedge rst)
  begin : wb_adapt_i2c_wb2ccu_nc_iddle
    if (rst === 1'b1)
    begin
      Start_tr_o <= 1'b1;
      read_nc_o <= 1'b0;
      visual_wb2ccu_nc_iddle_current_o <= wb2ccu_nc_iddle;
    end
    else
    begin
 	Start_tr_o <= Start_tr_i;
      read_nc_o <= read_nc_i;
      visual_wb2ccu_nc_iddle_current_o <= visual_wb2ccu_nc_iddle_current_i;
      
      case (visual_wb2ccu_nc_iddle_current_i)
        wb2ccu_nc_iddle:
          begin
          	read_nc_o <= 1'b0;//new
            if ((wb_ack == 1'b0) && (reponse_n == 1'b1) && (wb_addr != 5'h0))
            begin
              visual_wb2ccu_nc_iddle_current_o <= wb2ccu_nc_iddle;
            end
            else if (reponse_n == 1'b0)
            begin
              visual_wb2ccu_nc_iddle_current_o <= Reponse_i2c;
            end
            else if ((wb_ack == 1'b1) && (reponse_n == 1'b1) && (wb_we == 1'b1)
                     && (wb_addr == 5'h0))
            begin
              Start_tr_o <= 1'b0; 
              visual_wb2ccu_nc_iddle_current_o <= out_crc_ok;
            end
            else
              visual_wb2ccu_nc_iddle_current_o <= wb2ccu_nc_iddle;
          end
 
        ReadNc:
          begin
            Start_tr_o <= 1'b1;
            read_nc_o <= 1'b0;
            visual_wb2ccu_nc_iddle_current_o <= wb2ccu_nc_iddle;
          end
 
        Reponse_i2c:
          begin
            read_nc_o <= 1'b1;  // lecture du resultat
            visual_wb2ccu_nc_iddle_current_o <= ReadNc;
          end
 
        S14:
          begin
            Start_tr_o <= 1'b1;
            read_nc_o <= 1'b0;
            visual_wb2ccu_nc_iddle_current_o <= wb2ccu_nc_iddle;
          end
 
        out_crc_ok:
          begin
          	Start_tr_o <= 1'b0; //new
            visual_wb2ccu_nc_iddle_current_o <= S14;
          end
 
        default:
          begin
            Start_tr_o <= 1'b1;
            read_nc_o <= 1'b0;
            visual_wb2ccu_nc_iddle_current_o <= wb2ccu_nc_iddle;
          end
      endcase
    end
  end
 
 
 
endmodule



//  Design Unit:
//  ------------
//      Unit    Name  :  wb_adapt_i2c
//      Library Name  :  node_ctrl
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//  Unit    Name :  wb_adapt_i2c
//  Unit    Type :  State Machine
//  
//----------------------------------------------------


module wb_adapt_i2c_tri (clk_1, clk_2, clk_3, rst_1, rst_2, rst_3, Start_tr_1, Start_tr_2, Start_tr_3, wb_ack_1, wb_ack_2, wb_ack_3, reponse_n_1, reponse_n_2, reponse_n_3, read_nc_1, read_nc_2, read_nc_3, wb_we_1, wb_we_2, wb_we_3,
                     wb_addr_1, wb_addr_2, wb_addr_3
                     );

   parameter wb2ccu_nc_iddle = 3'b000,
            ReadNc          = 3'b001,
            Reponse_i2c     = 3'b010,
            S14             = 3'b011,
            out_crc_ok      = 3'b100;

  input clk_1, clk_2, clk_3;
  input rst_1, rst_2, rst_3;
  output Start_tr_1, Start_tr_2, Start_tr_3;
  input wb_ack_1, wb_ack_2, wb_ack_3;            
  input reponse_n_1, reponse_n_2, reponse_n_3;  
  output read_nc_1, read_nc_2, read_nc_3;
  input wb_we_1, wb_we_2, wb_we_3;
  input [4:0] wb_addr_1, wb_addr_2, wb_addr_3;

	wire Start_tr_1, Start_tr_2, Start_tr_3;
	wire read_nc_1, read_nc_2, read_nc_3;
	wire [2:0] visual_wb2ccu_nc_iddle_current_1, visual_wb2ccu_nc_iddle_current_2, visual_wb2ccu_nc_iddle_current_3;
	wire Start_tr;
	wire read_nc;
	wire [2:0] visual_wb2ccu_nc_iddle_current;

	wb_adapt_i2c_iostate  wb_adapt_i2c_iostate_1 (.clk(clk_1), .rst(rst_1), .Start_tr_i(Start_tr_1), .Start_tr_o(Start_tr_2), .wb_ack(wb_ack_1), .reponse_n(reponse_n_1), .read_nc_i(read_nc_1), .read_nc_o(read_nc_2), .wb_we(wb_we_1), .wb_addr(wb_addr_1), .visual_wb2ccu_nc_iddle_current_i(visual_wb2ccu_nc_iddle_current_1), .visual_wb2ccu_nc_iddle_current_o(visual_wb2ccu_nc_iddle_current_2));
	wb_adapt_i2c_iostate  wb_adapt_i2c_iostate_2 (.clk(clk_2), .rst(rst_2), .Start_tr_i(Start_tr_2), .Start_tr_o(Start_tr_3), .wb_ack(wb_ack_2), .reponse_n(reponse_n_2), .read_nc_i(read_nc_2), .read_nc_o(read_nc_3), .wb_we(wb_we_2), .wb_addr(wb_addr_2), .visual_wb2ccu_nc_iddle_current_i(visual_wb2ccu_nc_iddle_current_2), .visual_wb2ccu_nc_iddle_current_o(visual_wb2ccu_nc_iddle_current_3));
	wb_adapt_i2c_iostate  wb_adapt_i2c_iostate_3 (.clk(clk_3), .rst(rst_3), .Start_tr_i(Start_tr_3), .Start_tr_o(Start_tr),   .wb_ack(wb_ack_3), .reponse_n(reponse_n_3), .read_nc_i(read_nc_3), .read_nc_o(read_nc),   .wb_we(wb_we_3), .wb_addr(wb_addr_3), .visual_wb2ccu_nc_iddle_current_i(visual_wb2ccu_nc_iddle_current_3), .visual_wb2ccu_nc_iddle_current_o(visual_wb2ccu_nc_iddle_current));

	majority_voter #(.WIDTH(5)) mv (
		.in1({Start_tr_2, read_nc_2, visual_wb2ccu_nc_iddle_current_2}),
		.in2({Start_tr_3, read_nc_3, visual_wb2ccu_nc_iddle_current_3}),
		.in3({Start_tr,   read_nc,   visual_wb2ccu_nc_iddle_current}),
		.out({Start_tr_1, read_nc_1, visual_wb2ccu_nc_iddle_current_1}),
		.err()
	);
endmodule


// missing: i2c_msk_reg_o <=#1 i2c_msk_reg_i;
// missing: i2c_ctrl_reg_o <=#1 i2c_ctrl_reg_i;
// missing: registre0_o <=#1 registre0_i;
// missing: wb_ack_out_o <=#1 wb_ack_out_i;
// missing: wb_dat_out_o <=#1 wb_dat_out_i;

//  Design Unit:
//  ------------
//      Unit    Name  :  wb_generic
//      Library Name  :  node_ctrl
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//  Unit    Name :  wb_generic
//  Unit    Type :  Text Unit
//  
//----------------------------------------------------
//////////////////////////////////////////
//////////////////////////////////////////
// Date        : Mon Oct 15 14:43:06 2012
//
// Author      : 
//
// Company     : 
//
// Description : 
//

//////////////////////////////////////////
//////////////////////////////////////////                                                            
////  wb_generic.v
//---------------dans define                                                   
`define REG_LEN 32   // nombre de bit des registres
`define SPI_OFS_BITS	          4:2
`define GENERIC_R0   0    // data byte 2 byte 3 byte 4 byte 5   du ccu-i2c
`define STATUS_REG   1   // pour status i2c assoc. avec status_i2c
`define I2C_MSK      2
`define I2C_CTRL     3    // assoc avec i2c_ctrl_reg
`define DATA_REG0     4      // byte 3:0 long registre pour les data des transfert multiple 
`define DATA_REG1     5      // byte 7:4
`define DATA_REG2     6      // byte 12:8
`define DATA_REG3     7      // byte 15:12

`define GENERIC_R0_LEN 32
`define GENERIC_R1_LEN 32
`define GENERIC_R2_LEN 32
`define I2C_CTRL_GO  8   // bit[8] pour demarrer cycle du i2c ccu




module wb_generic_iostate (
  wb_clk_in, wb_rst_in, wb_adr_in, wb_dat_in, wb_dat_out_i, wb_dat_out_o, wb_sel_in,
  wb_we_in, wb_stb_in, wb_cyc_in, wb_ack_out_i, wb_ack_out_o, wb_err_out, wb_int_out_i, wb_int_out_o,
  registre0_i, registre0_o,i2c_msk_reg_i, i2c_msk_reg_o,tip,last_bit,status_i2c,i2c_ctrl_reg_i, i2c_ctrl_reg_o,
  rx_byte_in,data_reg_sel,rx

);

  parameter Tp = 1;

  input                            wb_clk_in;         
  input                            wb_int_out_i;         
  input                  [128-1:0] rx;               
  input                            tip;              
  input                            last_bit;             
  input                      [7:0] status_i2c;                                           
  input                      [7:0] rx_byte_in;      
  input                            wb_rst_in;         
  input                      [4:0] wb_adr_in;         
  input                   [32-1:0] wb_dat_in;         
  output                  [32-1:0] wb_dat_out_o;
  output                           wb_err_out;         
  output                           wb_int_out_o;
  output                    [31:0] i2c_ctrl_reg_o;
  input                     [31:0] i2c_ctrl_reg_i; 
  output                     [3:0] data_reg_sel;     
  output            [`REG_LEN-1:0] registre0_o;
  input             [`REG_LEN-1:0] registre0_i;             
  output            [`REG_LEN-1:0] i2c_msk_reg_o;
  input             [`REG_LEN-1:0] i2c_msk_reg_i;         
  input                   [32-1:0] wb_dat_out_i;         
  input                      [3:0] wb_sel_in;         
  input                            wb_we_in;          
  input                            wb_stb_in;         
  input                            wb_cyc_in;         
  output                           wb_ack_out_o;
  input                            wb_ack_out_i;         
  reg                       [31:0] i2c_ctrl_reg_o;                                                   
  reg                     [32-1:0] wb_dat_out_o;
  reg                              wb_ack_out_o;
  reg                              wb_int_out_o;                                       
  reg               [`REG_LEN-1:0] registre0_o;               
  reg               [`REG_LEN-1:0] i2c_msk_reg_o;            
  reg                     [32-1:0] wb_datM;           
  wire                             registre0_sel; 
  wire                             i2c_ctrl_sel;   
  wire                             i2c_msk_sel;   
  wire                     [3:0]   data_reg_sel;  
 
    
  
  assign registre0_sel   = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `GENERIC_R0);
  assign i2c_ctrl_sel    = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `I2C_CTRL); 
  assign i2c_msk_sel     = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `I2C_MSK);
  assign data_reg_sel[0] = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `DATA_REG0); 
  assign data_reg_sel[1] = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `DATA_REG1); 
  assign data_reg_sel[2] = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `DATA_REG2); 
  assign data_reg_sel[3] = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `DATA_REG3);  
  
    
 
  always @(wb_adr_in or registre0_i  or status_i2c or i2c_msk_reg_i or i2c_ctrl_reg_i or rx or rx_byte_in ) 
  begin
    case (wb_adr_in[`SPI_OFS_BITS])
      `DATA_REG0:    wb_datM = rx[31:0];  
      `DATA_REG1:    wb_datM = rx[63:32];
      `DATA_REG2:    wb_datM = rx[95:64];
      `DATA_REG3:    wb_datM = rx[127:96];
      `STATUS_REG:   begin
                       wb_datM[31:24] = status_i2c[7:0];    
                       wb_datM[23:16] = rx_byte_in[7:0];  
                       wb_datM[15:0] = 16'hbb;
                    end
      `GENERIC_R0:    wb_datM = {{32-`GENERIC_R0_LEN{1'b0}}, registre0_i};
      `I2C_CTRL:     wb_datM =  i2c_ctrl_reg_i;
      `I2C_MSK:      wb_datM =   i2c_msk_reg_i;
      
      default:      wb_datM = 128'h0;
    endcase
  end
  

  always @(posedge wb_clk_in or posedge wb_rst_in)
  begin 
    if (wb_rst_in)
      wb_dat_out_o <= #1 32'b0;
    else
      wb_dat_out_o <= #1 wb_datM;
  end
  

  always @(posedge wb_clk_in or posedge wb_rst_in)
  begin
    if (wb_rst_in)
      wb_ack_out_o <= #1 1'b0;
    else
      wb_ack_out_o <= #1 wb_cyc_in & wb_stb_in & ~wb_ack_out_i;
  end
  

  assign wb_err_out = 1'b0;
  

  always @(posedge wb_clk_in or posedge wb_rst_in)
  begin
    if (wb_rst_in)
      wb_int_out_o <= #1 1'b0;      // reset de l'interrupt
    else if (tip && last_bit  )
      wb_int_out_o <= #1 1'b1;      // interrupt actif
    else if (wb_ack_out_i)
      wb_int_out_o <=  1'b0;   
    else
    	wb_int_out_o <= wb_int_out_i;
  end
  

  always @(posedge wb_clk_in or posedge wb_rst_in)
  begin
    if (wb_rst_in)
     begin
       registre0_o <= #1 {32{1'b0}}; 
       i2c_ctrl_reg_o <= #1 32'h8;   
       i2c_msk_reg_o <= #1 {32{1'b0}}; 
      end
    else begin
    	registre0_o <= #1 registre0_i;
    	i2c_ctrl_reg_o <= #1 i2c_ctrl_reg_i;   
      i2c_msk_reg_o <= #1 i2c_msk_reg_i; 
    	if (registre0_sel && wb_we_in && !tip)
      begin
        if (wb_sel_in[0])
          registre0_o[7:0]  <= #1 wb_dat_in[7:0];
        if (wb_sel_in[1])
          registre0_o[15:8] <= #1 wb_dat_in[15:8];
        if (wb_sel_in[2])
          registre0_o[23:16] <= #1 wb_dat_in[23:16];
        if (wb_sel_in[3])
          registre0_o[31:24] <= #1 wb_dat_in[ 31:24];
      end           
    	else if (i2c_msk_sel && wb_we_in && !tip)
      begin
        if (wb_sel_in[0])
          begin
          i2c_msk_reg_o[7:0]   <= #1 wb_dat_in[7:0];
          end 
        if (wb_sel_in[1])
          i2c_msk_reg_o[15:8] <= #1 wb_dat_in[15:8];
        if (wb_sel_in[2])
          i2c_msk_reg_o[23:16] <= #1 wb_dat_in[23:16];
        if (wb_sel_in[3])
          i2c_msk_reg_o[31:24] <= #1 wb_dat_in[ 31:24];
      end
    	else if (i2c_ctrl_sel && wb_we_in && !tip)
      begin
        if (wb_sel_in[0])
          i2c_ctrl_reg_o[7:0]  <= #1 wb_dat_in[7:0];
        if (wb_sel_in[1])
          i2c_ctrl_reg_o[15:8] <= #1 wb_dat_in[15:8];
        if (wb_sel_in[2])
          i2c_ctrl_reg_o[23:16] <= #1 wb_dat_in[23:16];
        if (wb_sel_in[3])
          i2c_ctrl_reg_o[31:24] <= #1 wb_dat_in[ 31:24];
      end
     end           
  end  
  
  
endmodule
  



//  Design Unit:
//  ------------
//      Unit    Name  :  wb_generic
//      Library Name  :  node_ctrl
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//  Unit    Name :  wb_generic
//  Unit    Type :  Text Unit
//  
//----------------------------------------------------
//////////////////////////////////////////
//////////////////////////////////////////
// Date        : Mon Oct 15 14:43:06 2012
//
// Author      : 
//
// Company     : 
//
// Description : 
//

module wb_generic_tri
(
  wb_clk_in_1, wb_clk_in_2, wb_clk_in_3, wb_rst_in_1, wb_rst_in_2, wb_rst_in_3, wb_adr_in_1, wb_adr_in_2, wb_adr_in_3, wb_dat_in_1, wb_dat_in_2, wb_dat_in_3, wb_dat_out_1, wb_dat_out_2, wb_dat_out_3, wb_sel_in_1, wb_sel_in_2, wb_sel_in_3,
  wb_we_in_1, wb_we_in_2, wb_we_in_3, wb_stb_in_1, wb_stb_in_2, wb_stb_in_3, wb_cyc_in_1, wb_cyc_in_2, wb_cyc_in_3, wb_ack_out_1, wb_ack_out_2, wb_ack_out_3, wb_err_out_1, wb_err_out_2, wb_err_out_3, wb_int_out_1, wb_int_out_2, wb_int_out_3,
  registre0_1, registre0_2, registre0_3,i2c_msk_reg_1, i2c_msk_reg_2, i2c_msk_reg_3,tip_1, tip_2, tip_3,last_bit_1, last_bit_2, last_bit_3,status_i2c_1, status_i2c_2, status_i2c_3,i2c_ctrl_reg_1, i2c_ctrl_reg_2, i2c_ctrl_reg_3,
  rx_byte_in_1, rx_byte_in_2, rx_byte_in_3,data_reg_sel_1, data_reg_sel_2, data_reg_sel_3,rx_1, rx_2, rx_3

);

  parameter Tp = 1;

  // Wishbone signals
  input                            wb_clk_in_1, wb_clk_in_2, wb_clk_in_3;         
  input                            wb_rst_in_1, wb_rst_in_2, wb_rst_in_3;         
  input                      [4:0] wb_adr_in_1, wb_adr_in_2, wb_adr_in_3;         
  input                   [32-1:0] wb_dat_in_1, wb_dat_in_2, wb_dat_in_3;         
  output                  [32-1:0] wb_dat_out_1, wb_dat_out_2, wb_dat_out_3;         
  input                      [3:0] wb_sel_in_1, wb_sel_in_2, wb_sel_in_3;         
  input                            wb_we_in_1, wb_we_in_2, wb_we_in_3;          
  input                            wb_stb_in_1, wb_stb_in_2, wb_stb_in_3;         
  input                            wb_cyc_in_1, wb_cyc_in_2, wb_cyc_in_3;         
  output                           wb_ack_out_1, wb_ack_out_2, wb_ack_out_3;         
  output                           wb_err_out_1, wb_err_out_2, wb_err_out_3;         
  output                           wb_int_out_1, wb_int_out_2, wb_int_out_3;         
  output                    [31:0] i2c_ctrl_reg_1, i2c_ctrl_reg_2, i2c_ctrl_reg_3; 
  output                     [3:0] data_reg_sel_1, data_reg_sel_2, data_reg_sel_3;     
  input                  [128-1:0] rx_1, rx_2, rx_3;               
  input                            tip_1, tip_2, tip_3;              
  input                            last_bit_1, last_bit_2, last_bit_3;             
  input [7:0]                      status_i2c_1, status_i2c_2, status_i2c_3;                                           
  input [7:0]                      rx_byte_in_1, rx_byte_in_2, rx_byte_in_3;      
  output       [`REG_LEN-1:0]   registre0_1, registre0_2, registre0_3;             
  output       [`REG_LEN-1:0]   i2c_msk_reg_1, i2c_msk_reg_2, i2c_msk_reg_3;         

	wire [32-1:0] wb_dat_out_1, wb_dat_out_2, wb_dat_out_3;
	wire wb_ack_out_1, wb_ack_out_2, wb_ack_out_3;
	wire wb_int_out_1, wb_int_out_2, wb_int_out_3;
	wire [`REG_LEN-1:0] registre0_1, registre0_2, registre0_3;
	wire [31:0] i2c_ctrl_reg_1, i2c_ctrl_reg_2, i2c_ctrl_reg_3;
	wire [`REG_LEN-1:0] i2c_msk_reg_1, i2c_msk_reg_2, i2c_msk_reg_3;
	wire [32-1:0] wb_dat_out;
	wire wb_ack_out;
	wire wb_int_out;
	wire [`REG_LEN-1:0] registre0;
	wire [31:0] i2c_ctrl_reg;
	wire [`REG_LEN-1:0] i2c_msk_reg;

	wb_generic_iostate #(.Tp(Tp) ) wb_generic_iostate_1 (
  .wb_clk_in(wb_clk_in_1), .wb_rst_in(wb_rst_in_1), .wb_adr_in(wb_adr_in_1), .wb_dat_in(wb_dat_in_1), .wb_dat_out_i(wb_dat_out_1), .wb_dat_out_o(wb_dat_out_2), .wb_sel_in(wb_sel_in_1),
  .wb_we_in(wb_we_in_1), .wb_stb_in(wb_stb_in_1), .wb_cyc_in(wb_cyc_in_1), .wb_ack_out_i(wb_ack_out_1), .wb_ack_out_o(wb_ack_out_2), .wb_err_out(wb_err_out_1), .wb_int_out_i(wb_int_out_1), .wb_int_out_o(wb_int_out_2),
  .registre0_i(registre0_1), .registre0_o(registre0_2),.i2c_msk_reg_i(i2c_msk_reg_1), .i2c_msk_reg_o(i2c_msk_reg_2),.tip(tip_1),.last_bit(last_bit_1),.status_i2c(status_i2c_1),.i2c_ctrl_reg_i(i2c_ctrl_reg_1), .i2c_ctrl_reg_o(i2c_ctrl_reg_2),
  .rx_byte_in(rx_byte_in_1),.data_reg_sel(data_reg_sel_1),.rx(rx_1));

	wb_generic_iostate #(.Tp(Tp) ) wb_generic_iostate_2 (
  .wb_clk_in(wb_clk_in_2), .wb_rst_in(wb_rst_in_2), .wb_adr_in(wb_adr_in_2), .wb_dat_in(wb_dat_in_2), .wb_dat_out_i(wb_dat_out_2), .wb_dat_out_o(wb_dat_out_3), .wb_sel_in(wb_sel_in_2),
  .wb_we_in(wb_we_in_2), .wb_stb_in(wb_stb_in_2), .wb_cyc_in(wb_cyc_in_2), .wb_ack_out_i(wb_ack_out_2), .wb_ack_out_o(wb_ack_out_3), .wb_err_out(wb_err_out_2), .wb_int_out_i(wb_int_out_2), .wb_int_out_o(wb_int_out_3),
  .registre0_i(registre0_2), .registre0_o(registre0_3),.i2c_msk_reg_i(i2c_msk_reg_2), .i2c_msk_reg_o(i2c_msk_reg_3),.tip(tip_2),.last_bit(last_bit_2),.status_i2c(status_i2c_2),.i2c_ctrl_reg_i(i2c_ctrl_reg_2), .i2c_ctrl_reg_o(i2c_ctrl_reg_3),
  .rx_byte_in(rx_byte_in_2),.data_reg_sel(data_reg_sel_2),.rx(rx_2));

	wb_generic_iostate #(.Tp(Tp) ) wb_generic_iostate_3 (
  .wb_clk_in(wb_clk_in_3), .wb_rst_in(wb_rst_in_3), .wb_adr_in(wb_adr_in_3), .wb_dat_in(wb_dat_in_3), .wb_dat_out_i(wb_dat_out_3), .wb_dat_out_o(wb_dat_out), .wb_sel_in(wb_sel_in_3),
  .wb_we_in(wb_we_in_3), .wb_stb_in(wb_stb_in_3), .wb_cyc_in(wb_cyc_in_3), .wb_ack_out_i(wb_ack_out_3), .wb_ack_out_o(wb_ack_out), .wb_err_out(wb_err_out_3), .wb_int_out_i(wb_int_out_3), .wb_int_out_o(wb_int_out),
  .registre0_i(registre0_3), .registre0_o(registre0),.i2c_msk_reg_i(i2c_msk_reg_3), .i2c_msk_reg_o(i2c_msk_reg),.tip(tip_3),.last_bit(last_bit_3),.status_i2c(status_i2c_3),.i2c_ctrl_reg_i(i2c_ctrl_reg_3), .i2c_ctrl_reg_o(i2c_ctrl_reg),
  .rx_byte_in(rx_byte_in_3),.data_reg_sel(data_reg_sel_3),.rx(rx_3));

	majority_voter #(.WIDTH(37+32-1+`REG_LEN-1+`REG_LEN-1)) mv (
		.in1({wb_dat_out_2, wb_ack_out_2, wb_int_out_2, registre0_2, i2c_ctrl_reg_2, i2c_msk_reg_2}),
		.in2({wb_dat_out_3, wb_ack_out_3, wb_int_out_3, registre0_3, i2c_ctrl_reg_3, i2c_msk_reg_3}),
		.in3({wb_dat_out, wb_ack_out, wb_int_out, registre0, i2c_ctrl_reg, i2c_msk_reg}),
		.out({wb_dat_out_1, wb_ack_out_1, wb_int_out_1, registre0_1, i2c_ctrl_reg_1, i2c_msk_reg_1}),
		.err()
	);
endmodule



//  Design Unit:
//  ------------
//      Unit    Name  :  i2c_blk
//      Library Name  :  new_i2c_2
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//         Sort Ports by mode             :  No
//         New line for each Port         :  No
//         Attach comment to Port         :  No
//
//--------------------------------------------------
//--------------------------------------------------
//  
//  Library Name :  new_i2c_2
//  Unit    Name :  i2c_blk
//  Unit    Type :  Block Diagram
//  
//----------------------------------------------------
 
 

module i2c_blk_tri 

 (
input  clk_1,
input  clk_2,
input  clk_3,
output  scl_1,
output  scl_2,
output  scl_3,
output  sda_out_1,
output  sda_out_2,
output  sda_out_3,
output  reponse_1,
output  reponse_2,
output  reponse_3,
input  read_nc_1,
input  read_nc_2,
input  read_nc_3,
output  busy_1,
output  busy_2,
output  busy_3,
input  sda_in_1,
input  sda_in_2,
input  sda_in_3,
input  i2c_br_1,
input  i2c_br_2,
input  i2c_br_3,
input  reset_1,
input  reset_2,
input  reset_3,
output [7:0]  SRA_out_1,
output [7:0]  SRA_out_2,
output [7:0]  SRA_out_3,
output  MultiByte_1,
output  MultiByte_2,
output  MultiByte_3,
output  rx_1byte_1,
output  rx_1byte_2,
output  rx_1byte_3,
input [7:0]  msk_1,
input [7:0]  msk_2,
input [7:0]  msk_3,
output [3:0]  blktr_idx_1,   
output [3:0]  blktr_idx_2,   
output [3:0]  blktr_idx_3,   
input  Start_tr_n_1,   
input  Start_tr_n_2,   
input  Start_tr_n_3,   
output  le_ec_1,
output  le_ec_2,
output  le_ec_3,
output [7:0]  Rx_Byte_o_1,
output [7:0]  Rx_Byte_o_2,
output [7:0]  Rx_Byte_o_3,
input [7:0]  multi_byte_in_1,
input [7:0]  multi_byte_in_2,
input [7:0]  multi_byte_in_3,
input [6:0]  cra_1,
input [6:0]  cra_2,
input [6:0]  cra_3,
input [7:0]  byte_out_cmd_1,
input [7:0]  byte_out_cmd_2,
input [7:0]  byte_out_cmd_3,
input [7:0]  byte_out3_1,  
input [7:0]  byte_out3_2,  
input [7:0]  byte_out3_3,  
input [7:0]  byte_out4_1,    
input [7:0]  byte_out4_2,    
input [7:0]  byte_out4_3,    
input [7:0]  byte_out5_1,     
input [7:0]  byte_out5_2,     
input [7:0]  byte_out5_3     
);


wire  sti2c_out_1;
wire  sti2c_out_2;
wire  sti2c_out_3;
wire  ext_mode_1;
wire  ext_mode_2;
wire  ext_mode_3;
wire  start_i2c_1;
wire  start_i2c_2;
wire  start_i2c_3;
wire [4:0]  nbyte_1;
wire [4:0]  nbyte_2;
wire [4:0]  nbyte_3;
wire [1:0]  msk_op_1;
wire [1:0]  msk_op_2;
wire [1:0]  msk_op_3;
wire  stop_cond_1;
wire  stop_cond_2;
wire  stop_cond_3;
wire  ext_multi_mode_1;
wire  ext_multi_mode_2;
wire  ext_multi_mode_3;
wire  sda_gnd_1;
wire  sda_gnd_2;
wire  sda_gnd_3;
wire [7:0]  data_outY_1;
wire [7:0]  data_outY_2;
wire [7:0]  data_outY_3;
wire  rw_b_ext_1;
wire  rw_b_ext_2;
wire  rw_b_ext_3;
wire  ack_ok_1;
wire  ack_ok_2;
wire  ack_ok_3;
wire  busy_i2c_1;
wire  busy_i2c_2;
wire  busy_i2c_3;
wire  hor_1;
wire  hor_2;
wire  hor_3;
wire [7:0]  out_i2c_1;
wire [7:0]  out_i2c_2;
wire [7:0]  out_i2c_3;




div_prog_sm_tri  CLK_DIV (
     .clk_1(clk_1),
     .clk_out_1(hor_1),
     .reset_1(reset_1),
     .div_1(cra_1[1:0]),
		.clk_2(clk_2),
     .clk_out_2(hor_2),
     .reset_2(reset_2),
     .div_2(cra_2[1:0]),
		.clk_3(clk_3),
     .clk_out_3(hor_3),
     .reset_3(reset_3),
     .div_3(cra_3[1:0])
	);


master_cmd_sm_tri  Exec_cmd (
     .clock2_1(hor_1),
     .cmd_1(out_i2c_1[7:0]),
     .rx_byte_o_1(Rx_Byte_o_1[7:0]),
     .busy_1(busy_i2c_1),
     .sda_1(sda_out_1),
     .scl_1(scl_1),
     .sda_bi_1(sda_in_1),
     .reset_1(reset_1),
     .start_i2c_1(sti2c_out_1),
     .ack_ok_1(ack_ok_1),
     .data_in_1(data_outY_1[7:0]),
     .data_in2_1(byte_out5_1[7:0]),
     .nbyte_1(nbyte_1[4:0]),
     .sda_gnd_1(sda_gnd_1),
     .ext_mode_1(ext_mode_1),
     .MultiByte_1(MultiByte_1),
     .multi_byte_in_1(multi_byte_in_1[7:0]),
     .le_ec_1(le_ec_1),
     .rx_1byte_1(rx_1byte_1),
     .ext_multi_mode_1(ext_multi_mode_1),
     .rw_b_ext_1(rw_b_ext_1),
     .stop_cond_1(stop_cond_1),
     .blktr_idx_1(blktr_idx_1[3:0]),
		.clock2_2(hor_2),
     .cmd_2(out_i2c_2[7:0]),
     .rx_byte_o_2(Rx_Byte_o_2[7:0]),
     .busy_2(busy_i2c_2),
     .sda_2(sda_out_2),
     .scl_2(scl_2),
     .sda_bi_2(sda_in_2),
     .reset_2(reset_2),
     .start_i2c_2(sti2c_out_2),
     .ack_ok_2(ack_ok_2),
     .data_in_2(data_outY_2[7:0]),
     .data_in2_2(byte_out5_2[7:0]),
     .nbyte_2(nbyte_2[4:0]),
     .sda_gnd_2(sda_gnd_2),
     .ext_mode_2(ext_mode_2),
     .MultiByte_2(MultiByte_2),
     .multi_byte_in_2(multi_byte_in_2[7:0]),
     .le_ec_2(le_ec_2),
     .rx_1byte_2(rx_1byte_2),
     .ext_multi_mode_2(ext_multi_mode_2),
     .rw_b_ext_2(rw_b_ext_2),
     .stop_cond_2(stop_cond_2),
     .blktr_idx_2(blktr_idx_2[3:0]),
		.clock2_3(hor_3),
     .cmd_3(out_i2c_3[7:0]),
     .rx_byte_o_3(Rx_Byte_o_3[7:0]),
     .busy_3(busy_i2c_3),
     .sda_3(sda_out_3),
     .scl_3(scl_3),
     .sda_bi_3(sda_in_3),
     .reset_3(reset_3),
     .start_i2c_3(sti2c_out_3),
     .ack_ok_3(ack_ok_3),
     .data_in_3(data_outY_3[7:0]),
     .data_in2_3(byte_out5_3[7:0]),
     .nbyte_3(nbyte_3[4:0]),
     .sda_gnd_3(sda_gnd_3),
     .ext_mode_3(ext_mode_3),
     .MultiByte_3(MultiByte_3),
     .multi_byte_in_3(multi_byte_in_3[7:0]),
     .le_ec_3(le_ec_3),
     .rx_1byte_3(rx_1byte_3),
     .ext_multi_mode_3(ext_multi_mode_3),
     .rw_b_ext_3(rw_b_ext_3),
     .stop_cond_3(stop_cond_3),
     .blktr_idx_3(blktr_idx_3[3:0])
	);


i_mask_op_fc_tri  CMSK_op (
     .mask_in_1(msk_1[7:0]),
     .data_in_1(Rx_Byte_o_1[7:0]),
     .data_pass_1(byte_out4_1[7:0]),
     .data_out_1(data_outY_1[7:0]),
     .op_1(msk_op_1[1:0]),
     .clk_1(clk_1),
     .reset_1(reset_1),
		.mask_in_2(msk_2[7:0]),
     .data_in_2(Rx_Byte_o_2[7:0]),
     .data_pass_2(byte_out4_2[7:0]),
     .data_out_2(data_outY_2[7:0]),
     .op_2(msk_op_2[1:0]),
     .clk_2(clk_2),
     .reset_2(reset_2),
		.mask_in_3(msk_3[7:0]),
     .data_in_3(Rx_Byte_o_3[7:0]),
     .data_pass_3(byte_out4_3[7:0]),
     .data_out_3(data_outY_3[7:0]),
     .op_3(msk_op_3[1:0]),
     .clk_3(clk_3),
     .reset_3(reset_3)
	);


sync_start_tri  sync_clk (
     .reset_1(reset_1),
     .clk_1(clk_1),
     .sti2c_in_1(start_i2c_1),
     .sti2c_out_1(sti2c_out_1),
		.reset_2(reset_2),
     .clk_2(clk_2),
     .sti2c_in_2(start_i2c_2),
     .sti2c_out_2(sti2c_out_2),
		.reset_3(reset_3),
     .clk_3(clk_3),
     .sti2c_in_3(start_i2c_3),
     .sti2c_out_3(sti2c_out_3)
	);


decode_sm_back_tri  CMD_decod (
     .reset_1(reset_1),
     .ack_ok_in_1(ack_ok_1),
     .clk_1(clk_1),
     .cmd_in_1(byte_out_cmd_1[7:0]),
     .nbyte_1(nbyte_1[4:0]),
     .out_i2c_1(out_i2c_1[7:0]),
     .i2c_busy_1(busy_i2c_1),
     .start_i2c_1(start_i2c_1),
     .crc_ok_1(Start_tr_n_1),
     .occup_1(busy_1),
     .addr_i2c_1(byte_out3_1[7:0]),
     .read_nc_1(read_nc_1),
     .rep_out_1(reponse_1),
     .msk_op_1(msk_op_1[1:0]),
     .SRA_1(SRA_out_1[7:0]),
     .SDA_LOW_1(sda_gnd_1),
     .ext_mode_1(ext_mode_1),
     .i2c_br_1(i2c_br_1),
     .EBRDCST_1(cra_1[6]),
     .MultiByte_1(MultiByte_1),
     .nbyte_in_1(cra_1[5:2]),
     .ext_multi_mode_1(ext_multi_mode_1),
     .rw_b_ext_1(rw_b_ext_1),
     .stop_cond_in_1(stop_cond_1),
		.reset_2(reset_2),
     .ack_ok_in_2(ack_ok_2),
     .clk_2(clk_2),
     .cmd_in_2(byte_out_cmd_2[7:0]),
     .nbyte_2(nbyte_2[4:0]),
     .out_i2c_2(out_i2c_2[7:0]),
     .i2c_busy_2(busy_i2c_2),
     .start_i2c_2(start_i2c_2),
     .crc_ok_2(Start_tr_n_2),
     .occup_2(busy_2),
     .addr_i2c_2(byte_out3_2[7:0]),
     .read_nc_2(read_nc_2),
     .rep_out_2(reponse_2),
     .msk_op_2(msk_op_2[1:0]),
     .SRA_2(SRA_out_2[7:0]),
     .SDA_LOW_2(sda_gnd_2),
     .ext_mode_2(ext_mode_2),
     .i2c_br_2(i2c_br_2),
     .EBRDCST_2(cra_2[6]),
     .MultiByte_2(MultiByte_2),
     .nbyte_in_2(cra_2[5:2]),
     .ext_multi_mode_2(ext_multi_mode_2),
     .rw_b_ext_2(rw_b_ext_2),
     .stop_cond_in_2(stop_cond_2),
		.reset_3(reset_3),
     .ack_ok_in_3(ack_ok_3),
     .clk_3(clk_3),
     .cmd_in_3(byte_out_cmd_3[7:0]),
     .nbyte_3(nbyte_3[4:0]),
     .out_i2c_3(out_i2c_3[7:0]),
     .i2c_busy_3(busy_i2c_3),
     .start_i2c_3(start_i2c_3),
     .crc_ok_3(Start_tr_n_3),
     .occup_3(busy_3),
     .addr_i2c_3(byte_out3_3[7:0]),
     .read_nc_3(read_nc_3),
     .rep_out_3(reponse_3),
     .msk_op_3(msk_op_3[1:0]),
     .SRA_3(SRA_out_3[7:0]),
     .SDA_LOW_3(sda_gnd_3),
     .ext_mode_3(ext_mode_3),
     .i2c_br_3(i2c_br_3),
     .EBRDCST_3(cra_3[6]),
     .MultiByte_3(MultiByte_3),
     .nbyte_in_3(cra_3[5:2]),
     .ext_multi_mode_3(ext_multi_mode_3),
     .rw_b_ext_3(rw_b_ext_3),
     .stop_cond_in_3(stop_cond_3)
	);

endmodule


`timescale 1ns / 1ps







//  Design Unit:
//  ------------
//      Unit    Name  :  master_cmd_sm
//      Library Name  :  new_i2c_2
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//  Library Name :  new_i2c_2
//  Unit    Name :  master_cmd_sm
//  Unit    Type :  State Machine
//  
//----------------------------------------------------

module master_cmd_sm_iostate (clock2, cmd, rx_byte_o_i, rx_byte_o_o, busy_i, busy_o, sda_i, sda_o, scl_i, scl_o, sda_bi, reset,
                      start_i2c, ack_ok_i, ack_ok_o, data_in, data_in2, nbyte, sda_gnd_i, sda_gnd_o,
                      ext_mode, MultiByte, multi_byte_in, le_ec_i, le_ec_o, rx_1byte_i, rx_1byte_o,
                      ext_multi_mode, rw_b_ext, stop_cond_i, stop_cond_o, blktr_idx_i, blktr_idx_o
                      , status_i, status_o, visual_rst_state_current_i, visual_rst_state_current_o, nb_byte_i, nb_byte_o, address_i, address_o, ack_multi_i, ack_multi_o, nb_bit_i, nb_bit_o, registre_i, registre_o, i2c_mode_i, i2c_mode_o);
 
  input clock2;
  input [3:0] i2c_mode_i;
 
  input start_i2c;
  input [7:0] registre_i;
  input [7:0] data_in;
  input [3:0] nb_bit_i;
  input [7:0] data_in2;
  input ack_multi_i;           
  input [7:0] address_i;
  input [4:0] nbyte;
  input [4:0] nb_byte_i;       
  input ext_mode;
  input MultiByte;        
  input [7:0] multi_byte_in; 
  input [5:0] visual_rst_state_current_i;
 
 
 
  input ext_multi_mode;
  input stop_cond_i;
  input rw_b_ext;
  input status_i;
  input [7:0] cmd;
  output [7:0] rx_byte_o_o;
  output [3:0] i2c_mode_o;
  output status_o;
  output [7:0] registre_o;
  output busy_o;
  output [3:0] nb_bit_o;
  output sda_o;
  output ack_multi_o;
  output [7:0] address_o;
  output scl_o;
  output [4:0] nb_byte_o;
  output ack_ok_o;
  input ack_ok_i;
  output sda_gnd_o;
  input sda_gnd_i;
  output le_ec_o;
  input le_ec_i;
  output [5:0] visual_rst_state_current_o;
  output rx_1byte_o;
  input rx_1byte_i;         
  output stop_cond_o;
  output [3:0] blktr_idx_o;
  input [3:0] blktr_idx_i;  
  input [7:0] rx_byte_o_i;
  reg [7:0] rx_byte_o_o;
  input busy_i;
  reg busy_o;
  input sda_i;
  reg sda_o;
  input scl_i;
  reg scl_o;
  input sda_bi;
  wire sda_bi;
  input reset;
  reg ack_ok_o;
  reg sda_gnd_o;
  wire ext_mode;
  wire MultiByte;
  wire [7:0] multi_byte_in;
  reg le_ec_o;
  reg rx_1byte_o;
  wire ext_multi_mode;
  wire rw_b_ext;
  reg stop_cond_o;
  reg [3:0] blktr_idx_o;
  reg [3:0] nb_bit_o;
	reg [7:0] address_o;
	reg [7:0] rx_byte;
  reg status_o;
	reg [7:0] registre_o;
	reg ack_multi_o;
	reg [4:0] nb_byte_o;
	reg [3:0] i2c_mode_o;
	parameter rst_state = 6'b000000,
            Ack_read  = 6'b000001,
            READ      = 6'b000010,
            S30       = 6'b000011,
            S31       = 6'b000100,
            S32       = 6'b000101,
            S44       = 6'b000110,
            S46busy_o = 6'b000111,
            main      = 6'b001000,
            repos     = 6'b001001,
            s10       = 6'b001010,
            s17Rd     = 6'b001011,
            s22       = 6'b001100,
            s4Rd      = 6'b001101,
            s5Rd      = 6'b001110,
            s_dat_rdy = 6'b001111,
            thd_sda   = 6'b010000,
            s7_stop   = 6'b010001,
            s6_stop   = 6'b010010,
            s8_stop   = 6'b010011,
            tsu_sto   = 6'b010100,
            S0        = 6'b010101,
            S1        = 6'b010110,
            S11       = 6'b010111,
            S9        = 6'b011000,
            S3_scl1   = 6'b011001,
            S18delai  = 6'b011010,
            S19       = 6'b011011,
            S4        = 6'b011100,
            S5        = 6'b011101,
            S6_scl0   = 6'b011110,
            S8_sda_1  = 6'b011111,
            TST_ACK   = 6'b100000;
 
 
  reg [5:0] visual_rst_state_current_o;
	// Synchronous process
  always  @(posedge clock2 or posedge reset) begin : master_cmd_sm_rst_state
    if (reset == 1'b1) begin
	status_o <= 1'b0;
	rx_byte_o_o <= 8'h0;
	stop_cond_o <= 1'b0;
	blktr_idx_o <= 4'h0;
	visual_rst_state_current_o <= rst_state;
	
	busy_o      <= 1'b0;    //added 1 oct 2015
	scl_o       <= 1'b1;    //added 1 oct 2015
	sda_o       <= 1'b1;    //added 1 oct 2015
	nb_byte_o   <= 5'h0;    //added 1 oct 2015 
	le_ec_o     <= 1'b0;    //added 1 oct 2015
	address_o   <= 8'h0;    //added 1 oct 2015
	ack_multi_o <= 1'b0;    //added 1 oct 2015
	rx_1byte_o  <= 1'b0;    //added 1 oct 2015
	nb_bit_o    <= 4'b1000; //added 1 oct 2015
	ack_ok_o    <= 1'b0;    //added 1 oct 2015
	registre_o  <= 8'h0;    //added 1 oct 2015
	sda_gnd_o   <= 1'b0;    //added 1 oct 2015
	 
    end
    else begin
      status_o    <= status_i;
      rx_byte_o_o <= rx_byte_o_i;
      stop_cond_o <= stop_cond_i;
      blktr_idx_o <= blktr_idx_i;
      visual_rst_state_current_o <= visual_rst_state_current_i;
      busy_o <= busy_i;
      scl_o <= scl_i;
      sda_o <= sda_i;
      nb_byte_o <= nb_byte_i;
      le_ec_o <= le_ec_i;
      address_o <= address_i;
      ack_multi_o <= ack_multi_i;
      rx_1byte_o <= rx_1byte_i;
      nb_bit_o <= nb_bit_i;
      ack_ok_o <= ack_ok_i;
      registre_o <= registre_i;
      sda_gnd_o <= sda_gnd_i;  
	i2c_mode_o <= i2c_mode_i;
	
      case (visual_rst_state_current_i)
        rst_state:
          begin
            busy_o <= 1'b0;
            scl_o <= 1'b1;
            sda_o <= 1'b1;
            nb_byte_o <= 5'h0;
            le_ec_o <= 1'b0;
            address_o <= 8'h0;
            ack_multi_o <= 1'b0;
            rx_1byte_o <= 1'b0;
            nb_bit_o <= 4'b1000;
            ack_ok_o <= 1'b0;
            registre_o <= 8'h0;
            sda_gnd_o <= 1'b0;  
            blktr_idx_o <= 4'h0;
            visual_rst_state_current_o <= repos;
          end
 
        Ack_read:
          begin
            if (nb_byte_i == nbyte)
            begin
              sda_o <= 1'b0;
              visual_rst_state_current_o <= s7_stop;
            end
            else if ((nb_byte_i != nbyte) && MultiByte)
            begin
              ack_multi_o <= 1'b0;
              sda_o <= 1'b1;
              rx_1byte_o <= 1'b0;
              visual_rst_state_current_o <= READ;
            end
            else
              visual_rst_state_current_o <= Ack_read;
          end
 
        READ:
          begin
            scl_o <= 1'b1;
            visual_rst_state_current_o <= s4Rd;
          end
 
        S30:
          begin
            scl_o <= 1'b1;
            visual_rst_state_current_o <= S31;
            blktr_idx_o <= blktr_idx_i + 4'h1;
            rx_1byte_o <= 1'b0;
          end
 
        S31:
          begin
            visual_rst_state_current_o <= S32;
          end
 
        S32:
          begin
            scl_o <= 1'b0;
            nb_bit_o <= 4'b0111;
            visual_rst_state_current_o <= Ack_read;
          end
 
        S44:
          begin
            sda_o <= address_i[7];
            visual_rst_state_current_o <= s_dat_rdy;
          end
 
        S46busy_o:
          begin
            busy_o <= 1'b0;
            scl_o <= 1'b1;
            sda_o <= 1'b1;
            nb_byte_o <= 5'h0;
            le_ec_o <= 1'b0;
            address_o <= 8'h0;
            ack_multi_o <= 1'b0;
            rx_1byte_o <= 1'b0;
            nb_bit_o <= 4'b1000;
            ack_ok_o <= 1'b0;
            registre_o <= 8'h0;
            sda_gnd_o <= 1'b0;  
            blktr_idx_o <= 4'h0;
            visual_rst_state_current_o <= repos;
          end
 
        main:
          begin
            if (nb_byte_i == 5'h0)
            begin
              sda_o <= 1'b0;
              ack_ok_o <= 1'b0;
              visual_rst_state_current_o <= s10;
            end
            else if ((nb_byte_i > 5'h0) && (cmd[0]))
            begin
              nb_bit_o <= (nb_bit_i - 1);
              blktr_idx_o <= 4'h0;
              ack_multi_o <= 1'b0;
              sda_o <= 1'b1;
              rx_1byte_o <= 1'b0;
              visual_rst_state_current_o <= READ;
            end
            else if (nb_byte_i > 5'b00000)
            begin
              scl_o <= 1'b1;
              visual_rst_state_current_o <= S3_scl1;
            end
            else
              visual_rst_state_current_o <= main;
          end
 
        repos:
          begin
            if (start_i2c)
            begin
              nb_byte_o <= 5'h0;
              le_ec_o <= cmd[0];
              address_o <= cmd;  
              busy_o <= 1'b1;
              sda_o <= 1'b1;
              status_o <= 1'b0; 
              stop_cond_o <= 1'b0;
              rx_1byte_o <= 1'b0;
              i2c_mode_o <= {ext_multi_mode,rw_b_ext,MultiByte,cmd[0]};
 
              if((nb_byte_i != 5'b00000) && (nb_byte_i != nbyte))
              begin
              case  ({ext_multi_mode,rw_b_ext,MultiByte,cmd[0]})
                     4'b0000,4'b0100,4'b1000,4'b1100:
                    begin
                      if (nb_byte_i == 5'b00001)
                         begin
                          address_o <= data_in;
                          sda_o <=     data_in[7];
                         end
                      if (nb_byte_i == 5'b00010)
                         begin
                          address_o <= data_in2;
                          sda_o <=     data_in2[7];
                         end
                    end
                   4'b1110:
                     begin
                      if(nb_byte_i == 5'b00010)
                        begin
                         address_o <= {cmd[7:1],1'b1};
                         sda_o <= cmd[7];
                        end
                      if(nb_byte_i == 5'b00001)
                         begin
                          address_o <= data_in;
                          sda_o <=     data_in[7];
                      end
                      if(nb_byte_i >= 5'b00011)
                         begin
                           address_o <= multi_byte_in;
                           sda_o <=    multi_byte_in[7];
                         end
                      end
                   4'b0110,4'b0010:  
                        begin
                         address_o <= multi_byte_in;
                         sda_o <= multi_byte_in[7];
                        end
                   4'b1010:   
                       begin
                          if(nb_byte_i == 5'b00001)
                             begin
                                address_o <= data_in;  
                                sda_o <= data_in[7];
                             end
                           else
                              begin
                                address_o <= multi_byte_in;
                                sda_o <= multi_byte_in[7];
                              end
                       end
 
 
                   default:
                       address_o <= 1;
              endcase
              end 
              visual_rst_state_current_o <= main;
            end
            else if ((sda_bi == 1'b1) && (!(start_i2c)))
            begin
              sda_gnd_o <= 1'b0;
              visual_rst_state_current_o <= repos;
            end
            else if ((sda_bi == 1'b0) && (!(start_i2c)))
            begin
              sda_gnd_o <= 1'b1;
              visual_rst_state_current_o <= repos;
            end
            else
              visual_rst_state_current_o <= repos;
          end
 
        s10:
          begin
            visual_rst_state_current_o <= thd_sda;
          end
 
        s17Rd:
          begin
            if (nb_bit_i == 4'b0000)
            begin
              rx_byte_o_o <= registre_i;
              scl_o <= 1'b0;
              nb_byte_o <= nb_byte_i + 5'h1; 
              //blktr_idx_o <= blktr_idx_i + 4'h1;
              visual_rst_state_current_o <= s22;
            end
            else
            begin
              scl_o <= 1'b0;
              registre_o <= (registre_i << 1);
              nb_bit_o <= (nb_bit_i-1);
              visual_rst_state_current_o <= s5Rd;
            end
          end
 
        s22:
          begin
            rx_1byte_o <= 1'b1;
            if (MultiByte && (nb_byte_i != nbyte))
              begin
                ack_multi_o <= 1'b1;
                sda_o <= 1'b0;
               end
            else
              sda_o <= 1'b1;
            visual_rst_state_current_o <= S30;
          end
 
        s4Rd:
          begin
              registre_o[0] <= sda_bi;
            visual_rst_state_current_o <= s17Rd;
          end
 
        s5Rd:
          begin
            ack_multi_o <= 1'b0;
            sda_o <= 1'b1;
            rx_1byte_o <= 1'b0;
            visual_rst_state_current_o <= READ;
          end
 
        s_dat_rdy:
          begin
            scl_o <= 1'b1;
            visual_rst_state_current_o <= S3_scl1;
          end
 
        thd_sda:
          begin
            scl_o <= 1'b0;
            visual_rst_state_current_o <= S44;
          end
 
        s7_stop:
          begin
            scl_o <= 1'b1;
            stop_cond_o <= 1'b1;
            visual_rst_state_current_o <= s8_stop;
          end
 
        s6_stop:
          begin
            busy_o<= 1'b0;
            visual_rst_state_current_o <= S46busy_o;
          end
 
        s8_stop:
          begin
            visual_rst_state_current_o <= tsu_sto;
          end
 
        tsu_sto:
          begin
            sda_o <= 1'b1;
            visual_rst_state_current_o <= s6_stop;
          end
 
        S0:
          begin
            scl_o <= 1'b1;
            visual_rst_state_current_o <= S1;
          end
 
        S1:
          begin
            visual_rst_state_current_o <= S11;
          end
 
        S11:
          begin
            sda_o <= 1'b1;
            visual_rst_state_current_o <= S9;
          end
 
        S9:
          begin
            busy_o<= 1'b0;
            visual_rst_state_current_o <= S46busy_o;
          end
 
        S3_scl1:
          begin
            nb_bit_o <= (nb_bit_i - 1);
            address_o <= (address_i << 1);
            visual_rst_state_current_o <= S4;
          end
 
        S18delai:
          begin
            if ((!(status_i)) && (nb_byte_i == nbyte && ext_mode == 1'b0))
            begin
              sda_o <= 1'b0;
              visual_rst_state_current_o <= s7_stop;
            end
            else if ((!(status_i)) && ((nb_byte_i == nbyte) && (ext_mode == 1'b1)))
            begin
              sda_o <= 1'b1;
              visual_rst_state_current_o <= S0;
            end
            else if ((!(status_i)) && (nb_byte_i != nbyte))
            begin
              rx_1byte_o <= 1'b0;
 
              i2c_mode_o <= {ext_multi_mode,rw_b_ext,MultiByte,cmd[0]};
 
              if((nb_byte_i != 5'b00000) && (nb_byte_i != nbyte))

              begin
              case  ({ext_multi_mode,rw_b_ext,MultiByte,cmd[0]})
                     4'b0000,4'b0100,4'b1000,4'b1100:
                    begin
                      if (nb_byte_i == 5'b00001)
                         begin
                          address_o <= data_in;
                          sda_o <=     data_in[7];
                         end
                      if (nb_byte_i == 5'b00010)
                         begin
                          address_o <= data_in2;
                          sda_o <=     data_in2[7];
                         end
                    end
                   4'b1110:
                     begin
                      if(nb_byte_i == 5'b00010)
                        begin
                         address_o <= {cmd[7:1],1'b1};
                         sda_o <= cmd[7];
                        end
                      if(nb_byte_i == 5'b00001)
                         begin
                          address_o <= data_in;
                          sda_o <=     data_in[7];
                      end
                      if(nb_byte_i >= 5'b00011)
                         begin
                           address_o <= multi_byte_in;
                           sda_o <=    multi_byte_in[7];
                         end
                      end
                   4'b0110,4'b0010:  
                        begin
                         address_o <= multi_byte_in;
                         sda_o <= multi_byte_in[7];
                        end
                   4'b1010:    
                       begin
                          if(nb_byte_i == 5'b00001)
                             begin
                                address_o <= data_in;  
                                sda_o <= data_in[7];
                             end
                           else
                              begin
                                address_o <= multi_byte_in;
                                sda_o <= multi_byte_in[7];
                              end
                       end
 
 
                   default:
                       address_o <= 1;
              endcase
              end 
              visual_rst_state_current_o <= main;
            end
            else if (status_i)
            begin
              sda_o <= 1'b0;
              visual_rst_state_current_o <= s7_stop;
            end
            else
            begin
              scl_o <= 1'b1;
              visual_rst_state_current_o <= S3_scl1;
            end
          end
 
        S19:
          begin
            scl_o <= 1'b0;
            visual_rst_state_current_o <= S18delai;
          end
 
        S4:
          begin
            scl_o <= 1'b0;
            visual_rst_state_current_o <= S6_scl0;
          end
 
        S5:
          begin
            scl_o <= 1'b1;
            visual_rst_state_current_o <= S3_scl1;
          end
 
        S6_scl0:
          begin
            if (nb_bit_i == 4'b0000)
            begin
              sda_o <= 1'b1;
              if(!le_ec_i && ext_multi_mode && (nb_byte_i >= 5'b00010))
                blktr_idx_o <= blktr_idx_i + 4'b0001;
              if(!le_ec_i && MultiByte && (!ext_multi_mode) && (nb_byte_i >=
               5'b00001))
                blktr_idx_o <= blktr_idx_i + 4'b0001;
              visual_rst_state_current_o <= S8_sda_1;
            end
            else
            begin
              sda_o <= address_i[7];
              visual_rst_state_current_o <= S5;
            end
          end
 
        S8_sda_1:
          begin
            scl_o <= 1'b1;
            if(sda_bi == 1'b1)
                begin
                 status_o <= 1'b1;
                 ack_ok_o <= 1'b0;
                 end
            else
               begin
                 status_o <= 1'b0;
                 ack_ok_o <= 1'b1;
               end
            visual_rst_state_current_o <= TST_ACK;
          end
 
        TST_ACK:
          begin
            nb_byte_o <= nb_byte_i + 5'b00001;
            nb_bit_o <= 4'b1000;
            visual_rst_state_current_o <= S19;
          end
 
        default:
          begin
            status_o <= 1'b0;
            rx_byte_o_o <= 8'h0;
            stop_cond_o <= 1'b0;
            blktr_idx_o <= 4'h0;
            visual_rst_state_current_o <= rst_state;
          end
      endcase
    end
  end
 
 
 
endmodule




//  Design Unit:
//  ------------
//      Unit    Name  :  master_cmd_sm
//      Library Name  :  new_i2c_2
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//  Library Name :  new_i2c_2
//  Unit    Name :  master_cmd_sm
//  Unit    Type :  State Machine
//  
//----------------------------------------------------

module master_cmd_sm_tri (clock2_1, clock2_2, clock2_3, cmd_1, cmd_2, cmd_3, rx_byte_o_1, rx_byte_o_2, rx_byte_o_3, busy_1, busy_2, busy_3, sda_1, sda_2, sda_3, scl_1, scl_2, scl_3, sda_bi_1, sda_bi_2, sda_bi_3, reset_1, reset_2, reset_3,
                      start_i2c_1, start_i2c_2, start_i2c_3, ack_ok_1, ack_ok_2, ack_ok_3, data_in_1, data_in_2, data_in_3, data_in2_1, data_in2_2, data_in2_3, nbyte_1, nbyte_2, nbyte_3, sda_gnd_1, sda_gnd_2, sda_gnd_3,
                      ext_mode_1, ext_mode_2, ext_mode_3, MultiByte_1, MultiByte_2, MultiByte_3, multi_byte_in_1, multi_byte_in_2, multi_byte_in_3, le_ec_1, le_ec_2, le_ec_3, rx_1byte_1, rx_1byte_2, rx_1byte_3,
                      ext_multi_mode_1, ext_multi_mode_2, ext_multi_mode_3, rw_b_ext_1, rw_b_ext_2, rw_b_ext_3, stop_cond_1, stop_cond_2, stop_cond_3, blktr_idx_1, blktr_idx_2, blktr_idx_3
                      );

  input clock2_1, clock2_2, clock2_3;
  input [7:0] cmd_1, cmd_2, cmd_3;
  output [7:0] rx_byte_o_1, rx_byte_o_2, rx_byte_o_3;
  output busy_1, busy_2, busy_3;
  output sda_1, sda_2, sda_3;
  output scl_1, scl_2, scl_3;
  input sda_bi_1, sda_bi_2, sda_bi_3;
  input reset_1, reset_2, reset_3;
  input start_i2c_1, start_i2c_2, start_i2c_3;
  output ack_ok_1, ack_ok_2, ack_ok_3;
  input [7:0] data_in_1, data_in_2, data_in_3;
  input [7:0] data_in2_1, data_in2_2, data_in2_3;
  input [4:0] nbyte_1, nbyte_2, nbyte_3;
  output sda_gnd_1, sda_gnd_2, sda_gnd_3;
  input ext_mode_1, ext_mode_2, ext_mode_3;
  input MultiByte_1, MultiByte_2, MultiByte_3;        
  input [7:0] multi_byte_in_1, multi_byte_in_2, multi_byte_in_3; 
  output le_ec_1, le_ec_2, le_ec_3;
  output rx_1byte_1, rx_1byte_2, rx_1byte_3;         
  input ext_multi_mode_1, ext_multi_mode_2, ext_multi_mode_3;
  input rw_b_ext_1, rw_b_ext_2, rw_b_ext_3;
  output stop_cond_1, stop_cond_2, stop_cond_3;
  output [3:0] blktr_idx_1, blktr_idx_2, blktr_idx_3;  
  

	wire status_1, status_2, status_3;
	wire [7:0] rx_byte_o_1, rx_byte_o_2, rx_byte_o_3;
	wire stop_cond_1, stop_cond_2, stop_cond_3;
	wire [3:0] blktr_idx_1, blktr_idx_2, blktr_idx_3;
	wire [5:0] visual_rst_state_current_1, visual_rst_state_current_2, visual_rst_state_current_3;
	wire busy_1, busy_2, busy_3;
	wire scl_1, scl_2, scl_3;
	wire sda_1, sda_2, sda_3;
	wire [4:0] nb_byte_1, nb_byte_2, nb_byte_3;
	wire le_ec_1, le_ec_2, le_ec_3;
	wire [7:0] address_1, address_2, address_3;
	wire ack_multi_1, ack_multi_2, ack_multi_3;
	wire rx_1byte_1, rx_1byte_2, rx_1byte_3;
	wire [3:0] nb_bit_1, nb_bit_2, nb_bit_3;
	wire ack_ok_1, ack_ok_2, ack_ok_3;
	wire [7:0] registre_1, registre_2, registre_3;
	wire sda_gnd_1, sda_gnd_2, sda_gnd_3;
	wire [3:0] i2c_mode_1, i2c_mode_2, i2c_mode_3;
	
	wire status_nv1, status_nv2, status_nv3;
	wire [7:0] rx_byte_o_nv1, rx_byte_o_nv2, rx_byte_o_nv3;
	wire stop_cond_nv1, stop_cond_nv2, stop_cond_nv3;
	wire [3:0] blktr_idx_nv1, blktr_idx_nv2, blktr_idx_nv3;
	wire [5:0] visual_rst_state_current_nv1, visual_rst_state_current_nv2, visual_rst_state_current_nv3;
	wire busy_nv1, busy_nv2, busy_nv3;
	wire scl_nv1, scl_nv2, scl_nv3;
	wire sda_nv1, sda_nv2, sda_nv3;
	wire [4:0] nb_byte_nv1, nb_byte_nv2, nb_byte_nv3;
	wire le_ec_nv1, le_ec_nv2, le_ec_nv3;
	wire [7:0] address_nv1, address_nv2, address_nv3;
	wire ack_multi_nv1, ack_multi_nv2, ack_multi_nv3;
	wire rx_1byte_nv1, rx_1byte_nv2, rx_1byte_nv3;
	wire [3:0] nb_bit_nv1, nb_bit_nv2, nb_bit_nv3;
	wire ack_ok_nv1, ack_ok_nv2, ack_ok_nv3;
	wire [7:0] registre_nv1, registre_nv2, registre_nv3;
	wire sda_gnd_nv1, sda_gnd_nv2, sda_gnd_nv3;
	wire [3:0] i2c_mode_nv1, i2c_mode_nv2, i2c_mode_nv3;	
	
	//wire status;
	//wire [7:0] rx_byte_o;
	//wire stop_cond;
	//wire [3:0] blktr_idx;
	//wire [5:0] visual_rst_state_current;
	//wire busy;
	//wire scl;
	//wire sda;
	//wire [4:0] nb_byte;
	//wire le_ec;
	//wire [7:0] address;
	//wire ack_multi;
	//wire rx_1byte;
	//wire [3:0] nb_bit;
	//wire ack_ok;
	//wire [7:0] registre;
	//wire sda_gnd;
	//wire [3:0] i2c_mode;

	master_cmd_sm_iostate master_cmd_sm_iostate_1   (
			.clock2(clock2_1), 
			.cmd(cmd_1), 
			.rx_byte_o_i(rx_byte_o_1), 
			.rx_byte_o_o(rx_byte_o_nv1), 
			.busy_i(busy_1), 
			.busy_o(busy_nv1), 
			.sda_i(sda_1), 
			.sda_o(sda_nv1), 
			.scl_i(scl_1), 
			.scl_o(scl_nv1), 
			.sda_bi(sda_bi_1), 
			.reset(reset_1),
                      
			.start_i2c(start_i2c_1), 
			.ack_ok_i(ack_ok_1), 
			.ack_ok_o(ack_ok_nv1), 
			.data_in(data_in_1), 
			.data_in2(data_in2_1), 
			.nbyte(nbyte_1), 
			.sda_gnd_i(sda_gnd_1), 
			.sda_gnd_o(sda_gnd_nv1),
                      
			.ext_mode(ext_mode_1), 
			.MultiByte(MultiByte_1), 
			.multi_byte_in(multi_byte_in_1), 
			.le_ec_i(le_ec_1), 
			.le_ec_o(le_ec_nv1), 
			.rx_1byte_i(rx_1byte_1), 
			.rx_1byte_o(rx_1byte_nv1),
                      
			.ext_multi_mode(ext_multi_mode_1), 
			.rw_b_ext(rw_b_ext_1), 
			.stop_cond_i(stop_cond_1), 
			.stop_cond_o(stop_cond_nv1), 
			.blktr_idx_i(blktr_idx_1), 
			.blktr_idx_o(blktr_idx_nv1), 
			.status_i(status_1), 
			.status_o(status_nv1), 
			.visual_rst_state_current_i(visual_rst_state_current_1), 
			.visual_rst_state_current_o(visual_rst_state_current_nv1), 
			.nb_byte_i(nb_byte_1), 
			.nb_byte_o(nb_byte_nv1), 
			.address_i(address_1), 
			.address_o(address_nv1), 
			.ack_multi_i(ack_multi_1), 
			.ack_multi_o(ack_multi_nv1), 
			.nb_bit_i(nb_bit_1), 
			.nb_bit_o(nb_bit_nv1), 
			.registre_i(registre_1), 
			.registre_o(registre_nv1), 
			.i2c_mode_i(i2c_mode_1), 
			.i2c_mode_o(i2c_mode_nv1));

	master_cmd_sm_iostate master_cmd_sm_iostate_2   (
			
			.clock2(clock2_2), 
			.cmd(cmd_2), 
			.rx_byte_o_i(rx_byte_o_2), 
			.rx_byte_o_o(rx_byte_o_nv2), 
			.busy_i(busy_2), 
			.busy_o(busy_nv2), 
			.sda_i(sda_2), 
			.sda_o(sda_nv2), 
			.scl_i(scl_2), 
			.scl_o(scl_nv2), 
			.sda_bi(sda_bi_2), 
			.reset(reset_2),
                      
			.start_i2c(start_i2c_2), 
			.ack_ok_i(ack_ok_2), 
			.ack_ok_o(ack_ok_nv2), 
			.data_in(data_in_2), 
			.data_in2(data_in2_2), 
			.nbyte(nbyte_2), 
			.sda_gnd_i(sda_gnd_2), 
			.sda_gnd_o(sda_gnd_nv2),
                      
			.ext_mode(ext_mode_2), 
			.MultiByte(MultiByte_2), 
			.multi_byte_in(multi_byte_in_2), 
			.le_ec_i(le_ec_2), 
			.le_ec_o(le_ec_nv2), 
			.rx_1byte_i(rx_1byte_2), 
			.rx_1byte_o(rx_1byte_nv2),
                      
			.ext_multi_mode(ext_multi_mode_2), 
			.rw_b_ext(rw_b_ext_2), 
			.stop_cond_i(stop_cond_2), 
			.stop_cond_o(stop_cond_nv2), 
			.blktr_idx_i(blktr_idx_2), 
			.blktr_idx_o(blktr_idx_nv2), 
			.status_i(status_2), 
			.status_o(status_nv2), 
			.visual_rst_state_current_i(visual_rst_state_current_2), 
			.visual_rst_state_current_o(visual_rst_state_current_nv2), 
			.nb_byte_i(nb_byte_2), 
			.nb_byte_o(nb_byte_nv2), 
			.address_i(address_2), 
			.address_o(address_nv2), 
			.ack_multi_i(ack_multi_2), 
			.ack_multi_o(ack_multi_nv2), 
			.nb_bit_i(nb_bit_2), 
			.nb_bit_o(nb_bit_nv2), 
			.registre_i(registre_2), 
			.registre_o(registre_nv2), 
			.i2c_mode_i(i2c_mode_2), 
			.i2c_mode_o(i2c_mode_nv2));

	master_cmd_sm_iostate master_cmd_sm_iostate_3   (
			.clock2(clock2_3), 
			.cmd(cmd_3), 
			.rx_byte_o_i(rx_byte_o_3), 
			.rx_byte_o_o(rx_byte_o_nv3), 
			.busy_i(busy_3), 
			.busy_o(busy_nv3), 
			.sda_i(sda_3), 
			.sda_o(sda_nv3), 
			.scl_i(scl_3), 
			.scl_o(scl_nv3), 
			.sda_bi(sda_bi_3), 
			.reset(reset_3),
                      
			.start_i2c(start_i2c_3), 
			.ack_ok_i(ack_ok_3), 
			.ack_ok_o(ack_ok_nv3), 
			.data_in(data_in_3), 
			.data_in2(data_in2_3), 
			.nbyte(nbyte_3), 
			.sda_gnd_i(sda_gnd_3), 
			.sda_gnd_o(sda_gnd_nv3),
                      
			.ext_mode(ext_mode_3), 
			.MultiByte(MultiByte_3), 
			.multi_byte_in(multi_byte_in_3), 
			.le_ec_i(le_ec_3), 
			.le_ec_o(le_ec_nv3), 
			.rx_1byte_i(rx_1byte_3), 
			.rx_1byte_o(rx_1byte_nv3),
                      
			.ext_multi_mode(ext_multi_mode_3), 
			.rw_b_ext(rw_b_ext_3), 
			.stop_cond_i(stop_cond_3), 
			.stop_cond_o(stop_cond_nv3), 
			.blktr_idx_i(blktr_idx_3), 
			.blktr_idx_o(blktr_idx_nv3), 
			.status_i(status_3), 
			.status_o(status_nv3), 
			.visual_rst_state_current_i(visual_rst_state_current_3), 
			.visual_rst_state_current_o(visual_rst_state_current_nv3), 
			.nb_byte_i(nb_byte_3), 
			.nb_byte_o(nb_byte_nv3), 
			.address_i(address_3), 
			.address_o(address_nv3), 
			.ack_multi_i(ack_multi_3), 
			.ack_multi_o(ack_multi_nv3), 
			.nb_bit_i(nb_bit_3), 
			.nb_bit_o(nb_bit_nv3), 
			.registre_i(registre_3), 
			.registre_o(registre_nv3), 
			.i2c_mode_i(i2c_mode_3), 
			.i2c_mode_o(i2c_mode_nv3));

	//majority_voter #(.WIDTH(57)) mv_1 (
	//	.in1({status_2, rx_byte_o_2, stop_cond_2, blktr_idx_2, visual_rst_state_current_2, busy_2, scl_2, sda_2, nb_byte_2, le_ec_2, address_2, ack_multi_2, rx_1byte_2, nb_bit_2, ack_ok_2, registre_2, sda_gnd_2, i2c_mode_2}),
	//	.in2({status_3, rx_byte_o_3, stop_cond_3, blktr_idx_3, visual_rst_state_current_3, busy_3, scl_3, sda_3, nb_byte_3, le_ec_3, address_3, ack_multi_3, rx_1byte_3, nb_bit_3, ack_ok_3, registre_3, sda_gnd_3, i2c_mode_3}),
	//	.in3({status,   rx_byte_o,   stop_cond,   blktr_idx,   visual_rst_state_current,   busy,   scl,   sda,   nb_byte,   le_ec,   address,   ack_multi,   rx_1byte,   nb_bit,   ack_ok,   registre,   sda_gnd, i2c_mode}),
	//	.out({status_1, rx_byte_o_1, stop_cond_1, blktr_idx_1, visual_rst_state_current_1, busy_1, scl_1, sda_1, nb_byte_1, le_ec_1, address_1, ack_multi_1, rx_1byte_1, nb_bit_1, ack_ok_1, registre_1, sda_gnd_1, i2c_mode_1}),
	//	.err()
	//);

	majority_voter #(.WIDTH(57)) mv_1 (
		.in1({status_nv1,  rx_byte_o_nv1,  stop_cond_nv1,  blktr_idx_nv1,  visual_rst_state_current_nv1,  busy_nv1,  scl_nv1,  sda_nv1,  nb_byte_nv1,  le_ec_nv1,  address_nv1,  ack_multi_nv1,  rx_1byte_nv1,  nb_bit_nv1,  ack_ok_nv1,  registre_nv1,  sda_gnd_nv1,  i2c_mode_nv1  }),
		.in2({status_nv2,  rx_byte_o_nv2,  stop_cond_nv2,  blktr_idx_nv2,  visual_rst_state_current_nv2,  busy_nv2,  scl_nv2,  sda_nv2,  nb_byte_nv2,  le_ec_nv2,  address_nv2,  ack_multi_nv2,  rx_1byte_nv2,  nb_bit_nv2,  ack_ok_nv2,  registre_nv2,  sda_gnd_nv2,  i2c_mode_nv2  }),
		.in3({status_nv3,  rx_byte_o_nv3,  stop_cond_nv3,  blktr_idx_nv3,  visual_rst_state_current_nv3,  busy_nv3,  scl_nv3,  sda_nv3,  nb_byte_nv3,  le_ec_nv3,  address_nv3,  ack_multi_nv3,  rx_1byte_nv3,  nb_bit_nv3,  ack_ok_nv3,  registre_nv3,  sda_gnd_nv3,  i2c_mode_nv3  }),
		.out({status_1,    rx_byte_o_1,    stop_cond_1,    blktr_idx_1,    visual_rst_state_current_1,    busy_1,    scl_1,    sda_1,    nb_byte_1,    le_ec_1,    address_1,    ack_multi_1,    rx_1byte_1,    nb_bit_1,    ack_ok_1,    registre_1,    sda_gnd_1,    i2c_mode_1}   ),
		.err()
	);
	
	majority_voter #(.WIDTH(57)) mv_2 (
		.in1({status_nv1,  rx_byte_o_nv1,  stop_cond_nv1,  blktr_idx_nv1,  visual_rst_state_current_nv1,  busy_nv1,  scl_nv1,  sda_nv1,  nb_byte_nv1,  le_ec_nv1,  address_nv1,  ack_multi_nv1,  rx_1byte_nv1,  nb_bit_nv1,  ack_ok_nv1,  registre_nv1,  sda_gnd_nv1,  i2c_mode_nv1  }),
		.in2({status_nv2,  rx_byte_o_nv2,  stop_cond_nv2,  blktr_idx_nv2,  visual_rst_state_current_nv2,  busy_nv2,  scl_nv2,  sda_nv2,  nb_byte_nv2,  le_ec_nv2,  address_nv2,  ack_multi_nv2,  rx_1byte_nv2,  nb_bit_nv2,  ack_ok_nv2,  registre_nv2,  sda_gnd_nv2,  i2c_mode_nv2  }),
		.in3({status_nv3,  rx_byte_o_nv3,  stop_cond_nv3,  blktr_idx_nv3,  visual_rst_state_current_nv3,  busy_nv3,  scl_nv3,  sda_nv3,  nb_byte_nv3,  le_ec_nv3,  address_nv3,  ack_multi_nv3,  rx_1byte_nv3,  nb_bit_nv3,  ack_ok_nv3,  registre_nv3,  sda_gnd_nv3,  i2c_mode_nv3  }),
		.out({status_2,    rx_byte_o_2,    stop_cond_2,    blktr_idx_2,    visual_rst_state_current_2,    busy_2,    scl_2,    sda_2,    nb_byte_2,    le_ec_2,    address_2,    ack_multi_2,    rx_1byte_2,    nb_bit_2,    ack_ok_2,    registre_2,    sda_gnd_2,    i2c_mode_2}   ),
		.err()
	);
	
	majority_voter #(.WIDTH(57)) mv_3 (
		.in1({status_nv1,  rx_byte_o_nv1,  stop_cond_nv1,  blktr_idx_nv1,  visual_rst_state_current_nv1,  busy_nv1,  scl_nv1,  sda_nv1,  nb_byte_nv1,  le_ec_nv1,  address_nv1,  ack_multi_nv1,  rx_1byte_nv1,  nb_bit_nv1,  ack_ok_nv1,  registre_nv1,  sda_gnd_nv1,  i2c_mode_nv1  }),
		.in2({status_nv2,  rx_byte_o_nv2,  stop_cond_nv2,  blktr_idx_nv2,  visual_rst_state_current_nv2,  busy_nv2,  scl_nv2,  sda_nv2,  nb_byte_nv2,  le_ec_nv2,  address_nv2,  ack_multi_nv2,  rx_1byte_nv2,  nb_bit_nv2,  ack_ok_nv2,  registre_nv2,  sda_gnd_nv2,  i2c_mode_nv2  }),
		.in3({status_nv3,  rx_byte_o_nv3,  stop_cond_nv3,  blktr_idx_nv3,  visual_rst_state_current_nv3,  busy_nv3,  scl_nv3,  sda_nv3,  nb_byte_nv3,  le_ec_nv3,  address_nv3,  ack_multi_nv3,  rx_1byte_nv3,  nb_bit_nv3,  ack_ok_nv3,  registre_nv3,  sda_gnd_nv3,  i2c_mode_nv3  }),
		.out({status_3,    rx_byte_o_3,    stop_cond_3,    blktr_idx_3,    visual_rst_state_current_3,    busy_3,    scl_3,    sda_3,    nb_byte_3,    le_ec_3,    address_3,    ack_multi_3,    rx_1byte_3,    nb_bit_3,    ack_ok_3,    registre_3,    sda_gnd_3,    i2c_mode_3}   ),
		.err()
	);
	
	
		
endmodule





//  Design Unit:
//  ------------
//      Unit    Name  :  i_mask_op_fc
//      Library Name  :  new_i2c_2
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//         Sort Ports by mode             :  No
//         New line for each Port         :  No
//         Attach comment to Port         :  No
//
//--------------------------------------------------
//--------------------------------------------------
//  
//  Library Name :  new_i2c_2
//  Unit    Name :  i_mask_op_fc
//  Unit    Type :  Flow Chart
//  
//----------------------------------------------------
 

module i_mask_op_fc_iostate (mask_in, data_in, data_pass, data_out, op, clk, reset
                     , visual_0_data_out_i, visual_0_data_out_o);
 
  input [7:0] mask_in;
  input [7:0] visual_0_data_out_i;
 
 
  input [7:0] data_in;
  input [7:0] data_pass;
  output [7:0] data_out;
  output [7:0] visual_0_data_out_o;
	input [1:0] op;
  input clk;
  input reset;
  reg [7:0] visual_0_data_out_o;

always @( posedge (clk) or posedge (reset) )
  begin   :mask_op

    if (reset)
    begin
        visual_0_data_out_o <= 8'b00000000;
    end
    else
    begin
      visual_0_data_out_o <= visual_0_data_out_i;
      if (op == 2'b00)
      begin
          visual_0_data_out_o <= data_pass;
      end
      else
      begin
        if (op == 2'b01)
        begin
            visual_0_data_out_o <= (data_in & mask_in);
        end
        else
        begin
          if (op == 2'b10)
          begin
              visual_0_data_out_o <= (data_in | mask_in);
          end
          else
          begin
            if (op == 2'b11)
            begin
                visual_0_data_out_o <= (data_in ^ mask_in);
            end
          end
        end
      end
    end
  end
 
    assign data_out = visual_0_data_out_i;
 
 
endmodule



//  Design Unit:
//  ------------
//      Unit    Name  :  i_mask_op_fc
//      Library Name  :  new_i2c_2
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//         Sort Ports by mode             :  No
//         New line for each Port         :  No
//         Attach comment to Port         :  No
//
//--------------------------------------------------
//--------------------------------------------------
//  
//  Library Name :  new_i2c_2
//  Unit    Name :  i_mask_op_fc
//  Unit    Type :  Flow Chart
//  
//----------------------------------------------------

module i_mask_op_fc_tri (mask_in_1, mask_in_2, mask_in_3, data_in_1, data_in_2, data_in_3, data_pass_1, data_pass_2, data_pass_3, data_out_1, data_out_2, data_out_3, op_1, op_2, op_3, clk_1, clk_2, clk_3, reset_1, reset_2, reset_3
                     );

  input [7:0] mask_in_1, mask_in_2, mask_in_3;
  input [7:0] data_in_1, data_in_2, data_in_3;
  input [7:0] data_pass_1, data_pass_2, data_pass_3;
  output [7:0] data_out_1, data_out_2, data_out_3;
  input [1:0] op_1, op_2, op_3;
  input clk_1, clk_2, clk_3;
  input reset_1, reset_2, reset_3;

	wire [7:0] visual_0_data_out_1, visual_0_data_out_2, visual_0_data_out_3;
	wire [7:0] visual_0_data_out;

	i_mask_op_fc_iostate i_mask_op_fc_iostate_1   (.mask_in(mask_in_1), .data_in(data_in_1), .data_pass(data_pass_1), .data_out(data_out_1), .op(op_1), .clk(clk_1), .reset(reset_1), .visual_0_data_out_i(visual_0_data_out_1), .visual_0_data_out_o(visual_0_data_out_2));

	i_mask_op_fc_iostate i_mask_op_fc_iostate_2   (.mask_in(mask_in_2), .data_in(data_in_2), .data_pass(data_pass_2), .data_out(data_out_2), .op(op_2), .clk(clk_2), .reset(reset_2), .visual_0_data_out_i(visual_0_data_out_2), .visual_0_data_out_o(visual_0_data_out_3));

	i_mask_op_fc_iostate i_mask_op_fc_iostate_3   (.mask_in(mask_in_3), .data_in(data_in_3), .data_pass(data_pass_3), .data_out(data_out_3), .op(op_3), .clk(clk_3), .reset(reset_3), .visual_0_data_out_i(visual_0_data_out_3), .visual_0_data_out_o(visual_0_data_out));

	majority_voter #(.WIDTH(8)) mv (
		.in1({visual_0_data_out_2}),
		.in2({visual_0_data_out_3}),
		.in3({visual_0_data_out}),
		.out({visual_0_data_out_1}),
		.err()
	);
endmodule


// missing: sti2c_out_o <=#1 sti2c_out_i;

//  Design Unit:
//  ------------
//      Unit    Name  :  sync_start
//      Library Name  :  new_i2c_2
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//         Sort Ports by mode             :  No
//         New line for each Port         :  No
//         Attach comment to Port         :  No
//
//--------------------------------------------------
//--------------------------------------------------
//  
//  Library Name :  new_i2c_2
//  Unit    Name :  sync_start
//  Unit    Type :  Flow Chart
//  
//----------------------------------------------------
 


module sync_start_iostate (reset, clk, sti2c_in, sti2c_out_i, sti2c_out_o
                   );

  input reset;
  input sti2c_out_i;
  wire reset;
  input clk;
  wire clk;
  input sti2c_in;
  wire sti2c_in;
  output sti2c_out_o;
	reg sti2c_out_o;
 
 
  always
    @( negedge (clk) or posedge (reset) )
  begin   :Start
 
    if (reset)
    begin
      sti2c_out_o <= 1'b0;
    end
    else
    begin
      sti2c_out_o <= sti2c_in;
    end
  end
 
 
 
endmodule



//  Design Unit:
//  ------------
//      Unit    Name  :  sync_start
//      Library Name  :  new_i2c_2
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//         Sort Ports by mode             :  No
//         New line for each Port         :  No
//         Attach comment to Port         :  No
//
//--------------------------------------------------
//--------------------------------------------------
//  
//  Library Name :  new_i2c_2
//  Unit    Name :  sync_start
//  Unit    Type :  Flow Chart
//  
//----------------------------------------------------

module sync_start_tri (reset_1, reset_2, reset_3, clk_1, clk_2, clk_3, sti2c_in_1, sti2c_in_2, sti2c_in_3, sti2c_out_1, sti2c_out_2, sti2c_out_3
                   );

  input reset_1, reset_2, reset_3;
  input clk_1, clk_2, clk_3;
  input sti2c_in_1, sti2c_in_2, sti2c_in_3;
  output sti2c_out_1, sti2c_out_2, sti2c_out_3;

	wire sti2c_out_1, sti2c_out_2, sti2c_out_3;
	wire sti2c_out;

	sync_start_iostate sync_start_iostate_1   (.reset(reset_1), .clk(clk_1), .sti2c_in(sti2c_in_1), .sti2c_out_i(sti2c_out_1), .sti2c_out_o(sti2c_out_2));

	sync_start_iostate sync_start_iostate_2   (.reset(reset_2), .clk(clk_2), .sti2c_in(sti2c_in_2), .sti2c_out_i(sti2c_out_2), .sti2c_out_o(sti2c_out_3));

	sync_start_iostate sync_start_iostate_3   (.reset(reset_3), .clk(clk_3), .sti2c_in(sti2c_in_3), .sti2c_out_i(sti2c_out_3), .sti2c_out_o(sti2c_out));

	majority_voter #(.WIDTH(1)) mv (
		.in1({sti2c_out_2}),
		.in2({sti2c_out_3}),
		.in3({sti2c_out}),
		.out({sti2c_out_1}),
		.err()
	);
endmodule


// missing: visual_res_current_o <=#1 visual_res_current_i;

//  Design Unit:
//  ------------
//      Unit    Name  :  decode_sm_back
//      Library Name  :  new_i2c_2
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//  Library Name :  new_i2c_2
//  Unit    Name :  decode_sm_back
//  Unit    Type :  State Machine
//  
//----------------------------------------------------

 
module decode_sm_back_iostate (reset, ack_ok_in, clk, cmd_in, nbyte_i, nbyte_o, out_i2c_i, out_i2c_o, i2c_busy,
                       start_i2c_i, start_i2c_o, crc_ok, occup_i, occup_o, addr_i2c, read_nc, rep_out_i, rep_out_o,
                       msk_op_i, msk_op_o, SRA_i, SRA_o, SDA_LOW, ext_mode_i, ext_mode_o, i2c_br, EBRDCST,
                       MultiByte_i, MultiByte_o, nbyte_in, ext_multi_mode_i, ext_multi_mode_o, rw_b_ext_i, rw_b_ext_o,
                       stop_cond_in
                       , lire_i2c_i, lire_i2c_o, visual_res_current_i, visual_res_current_o);
`include "Table_Commande.v"
 
  input reset;
  input [4:0] visual_res_current_i;
 
 
 
  input crc_ok;
  input [7:0] addr_i2c;
  input read_nc;
  input rep_out_i;
  input [1:0] msk_op_i;
  input [7:0] SRA_i;
  input SDA_LOW;
  input i2c_br;
  input EBRDCST;
  input lire_i2c_i;
  input [3:0] nbyte_in;
  input stop_cond_in;
  input ack_ok_in;
  input clk;
  input [7:0] cmd_in;
  wire [7:0] cmd_in;
  output [4:0] nbyte_o;
	output [4:0] visual_res_current_o;
	output rw_b_ext_o;
	output [7:0] out_i2c_o;
	output start_i2c_o;
	output occup_o;
	input occup_i;
  output rep_out_o;
	output [1:0] msk_op_o;
	input [4:0] nbyte_i;
  output [7:0] SRA_o;
	output ext_mode_o;
	input ext_mode_i;
  output MultiByte_o;
	input MultiByte_i;        
  output lire_i2c_o;
	output ext_multi_mode_o;
	input ext_multi_mode_i;   
  input rw_b_ext_i;
  reg [4:0] nbyte_o;
  input [7:0] out_i2c_i;
  reg [7:0] out_i2c_o;
  input i2c_busy;
  input start_i2c_i;
  reg start_i2c_o;
  wire crc_ok;
  reg occup_o;
  wire [7:0] addr_i2c;
  wire read_nc;
  reg rep_out_o;
  reg [1:0] msk_op_o;
  reg [7:0] SRA_o;
  wire SDA_LOW;
  reg ext_mode_o;
  wire i2c_br;
  wire EBRDCST;
  reg MultiByte_o;
  wire [3:0] nbyte_in;
  reg ext_multi_mode_o;
  reg rw_b_ext_o;
  wire stop_cond_in;
  reg lire_i2c_o;
	wire [7:0] com;
 
  parameter res             = 5'b00000,
            S55             = 5'b00001,
            S56             = 5'b00010,
            S58             = 5'b00011,
            State_start_i2c = 5'b00100,
            WaitBusy_st     = 5'b00101,
            a7_out          = 5'b00110,
            attente         = 5'b00111,
            lec_cmd         = 5'b01000,
            rd_wr_err       = 5'b01001,
            re_nc           = 5'b01010,
            sen_ad_10bit_2  = 5'b01011,
            send_ad_10bit   = 5'b01100,
            tr_cor          = 5'b01101,
            wait_r_nc       = 5'b01110,
            RMW_normal      = 5'b01111,
            RMW_ext         = 5'b10000,
            att_busy0       = 5'b10001,
            s13             = 5'b10010,
            s6              = 5'b10011,
            start_i2c1      = 5'b10100;
 
 
  reg [4:0] visual_res_current_o;
	// Synchronous process
  always  @(posedge clk or posedge reset)
  begin : decode_sm_back_res
 
    if (reset === 1'b1)
    begin
      out_i2c_o <= 8'h0;
      start_i2c_o <= 1'b0;
      lire_i2c_o <= 1'b0;
      msk_op_o <= 2'b0;
      SRA_o <= 8'h0;
      ext_mode_o <= 1'b0;
      nbyte_o <= 5'b0;
      rep_out_o <= 1'b1;
      MultiByte_o <= 1'b0;
      occup_o <= 1'b0;
      ext_multi_mode_o <= 1'b0;
      rw_b_ext_o <= 1'b0;  // write
      visual_res_current_o <= res;
    end
    else
    begin
 	out_i2c_o <= out_i2c_i;
      start_i2c_o <= start_i2c_i;
      lire_i2c_o <= lire_i2c_i;
      msk_op_o <= msk_op_i;
      SRA_o <= SRA_i;
      ext_mode_o <= ext_mode_i;
      nbyte_o <= nbyte_i;
      rep_out_o <= rep_out_i;
      MultiByte_o <= MultiByte_i;
      occup_o <= occup_i;
      ext_multi_mode_o <= ext_multi_mode_i;
      rw_b_ext_o <= rw_b_ext_i;
      
      visual_res_current_o <= visual_res_current_i;
      
      case (visual_res_current_i)
        res:
          begin
            start_i2c_o <= 1'b0;
            occup_o <= 1'b0;
            rep_out_o <= 1'b1;
            lire_i2c_o <= 1'b0;
            msk_op_o <= 2'b0;
            ext_mode_o <= 1'b0;
            MultiByte_o <= 1'b0;
            
            ext_multi_mode_o <= 1'b0;
            rw_b_ext_o <= 1'b0;  // 28.5.13
            visual_res_current_o <= attente;
          end
 
        S55:
          begin
            //lire_i2c = 1'b1;
            start_i2c_o <= 1'b1;
            SRA_o[6] <= 1'b0;
            lire_i2c_o <= 1'b1; //19nov2012
            visual_res_current_o <= State_start_i2c;
          end
 
        S56:
          begin
            visual_res_current_o <= tr_cor;
          end
 
        S58:
          begin
            if (i2c_busy)
            begin
              start_i2c_o <= 1'b0;
              visual_res_current_o <= S58;
            end
            else if ((~(i2c_busy)) && (!(ack_ok_in)))
            begin
              SRA_o[2] <= 1'b0;
              SRA_o[6] <= 1'b1;
              visual_res_current_o <= rd_wr_err;
            end
            else if ((~(i2c_busy)) && (!(lire_i2c_i) && ack_ok_in))
            begin
              SRA_o[2] <= 1'b1;
              visual_res_current_o <= S56;
            end
            else if ((~(i2c_busy)) && (lire_i2c_i && ack_ok_in))
            begin
              SRA_o[2] <= 1'b1;
              rep_out_o <= 1'b0;
              visual_res_current_o <= wait_r_nc;
            end
            else
              visual_res_current_o <= S58;
          end
 
        State_start_i2c:
          begin
            start_i2c_o <= 1'b1;
            visual_res_current_o <= WaitBusy_st;
          end
 
        WaitBusy_st:
          begin
            if (i2c_busy == 1'b0)
            begin
              visual_res_current_o <= WaitBusy_st;
            end
            else
            begin
              visual_res_current_o <= S58;
            end
          end
 
        a7_out:
          begin
            if (com >= 8'h10 && 8'h15 >= com)
            begin
              if (com >= 8'h10 && 8'h12 >= com)
              begin
                nbyte_o <= 4'b0010;
                out_i2c_o[0] <= 1'b1;// addresse[0] = 1 read
                visual_res_current_o <= RMW_normal;
              end
              else if ((com >= 8'h13) && (8'h15 >= com ))
              begin
                nbyte_o <= 4'b0011;
                visual_res_current_o <= RMW_ext;
              end
              else
              begin
                nbyte_o <= 4'b0010;
                out_i2c_o[0] <= 1'b1;// addresse[0] = 1 read
                visual_res_current_o <= RMW_normal;
              end
            end
            else if (com == 8'h0)
            begin
              nbyte_o <= 5'b0010;
              out_i2c_o[0] <= 1'b0;
              visual_res_current_o <= S55;
            end
            else if (com == 8'h2)
            begin
              nbyte_o <= 5'b0011;
              rw_b_ext_o <= 1'b0;//write
              out_i2c_o[0] <= 1'b0;
              visual_res_current_o <= S55;
            end
            else if (com == 8'h16) 
            begin
              MultiByte_o <= 1'b1;
              if(nbyte_in == 4'h0)
                  nbyte_o <= 5'h11;  // 29.3.13
              else
                  nbyte_o <= {1'b0,nbyte_in}+5'h1 ;
              out_i2c_o[0] <= 1'b0;
              visual_res_current_o <= S55;
            end
            else if (com == 8'h1)
            begin
              nbyte_o <= 5'b0010;
              out_i2c_o[0] <= 1'b1;
              //lecture
              start_i2c_o <= 1'b1;
              SRA_o[6] <= 1'b0;
              lire_i2c_o <= 1'b1; //19nov2012
              visual_res_current_o <= State_start_i2c;
            end
            else if (com == 8'h17)
            begin
              MultiByte_o <= 1'b1;
              if(nbyte_in == 4'h0)
                 nbyte_o <= 5'h11;
              else
                 nbyte_o <= {1'b0,nbyte_in} + 5'h1; 
              out_i2c_o[0] <= 1'b1;
              //lecture
              start_i2c_o <= 1'b1;
              SRA_o[6] <= 1'b0;
              lire_i2c_o <= 1'b1; //19nov2012
              visual_res_current_o <= State_start_i2c;
            end
            else if (com == {3'b0, I2C_write_multi_ext[6:2]})
            begin
              MultiByte_o <= 1'b1;
              nbyte_o <= {1'b0,nbyte_in} +5'h2;
              ext_multi_mode_o <= 1'b1;
              rw_b_ext_o <= 1'b0;
              out_i2c_o[0] <= 1'b0;
              visual_res_current_o <= S55;
            end
            else if (com == {3'b0, I2C_read_multi_ext[6:2]})
            begin
              MultiByte_o <= 1'b1;
              ext_mode_o <= 1'b1;
              nbyte_o <=   5'b00010; // pour addr multi
              ext_multi_mode_o <= 1'b1;
              start_i2c_o <= 1'b1;
              rw_b_ext_o <= 1'b1;  //r
              visual_res_current_o <= send_ad_10bit;
            end
            else if (com == 8'h3)
            begin
              ext_mode_o <= 1'b1;
              nbyte_o <= 5'b0010;
              start_i2c_o <= 1'b1;
              out_i2c_o[0]<= 1'b0;
              rw_b_ext_o <= 1'b1; //r
              visual_res_current_o <= send_ad_10bit;
            end
            else
            begin
              SRA_o[5]  <= 1'b1;
              visual_res_current_o <= tr_cor;
            end
          end
 
        attente:
          begin
            if (crc_ok)
            begin
              visual_res_current_o <= attente;
            end
            else if (!(crc_ok) && ((i2c_br && EBRDCST) || !(i2c_br)))
            begin
              visual_res_current_o <= lec_cmd;
            end
            else
              visual_res_current_o <= attente;
          end
 
        lec_cmd:
          begin
            if (SDA_LOW == 1'b0)
            begin
              occup_o <= 1'b1; //nov 2012
              out_i2c_o <= (addr_i2c << 1);
              SRA_o[2] <= 1'b0;
              visual_res_current_o <= a7_out;
            end
            else if (SDA_LOW == 1'b1)
            begin
              occup_o <= 1'b1; //nov 2012
              
              SRA_o <= 8'h08;
              
              rep_out_o <= 1'b0;
              visual_res_current_o <= wait_r_nc;
            end
            else
              visual_res_current_o <= lec_cmd;
          end
 
        rd_wr_err:
          begin
            rep_out_o <= 1'b0;
            visual_res_current_o <= wait_r_nc;
          end
 
        re_nc:
          begin
            if (read_nc)
            begin
              visual_res_current_o <= re_nc;
            end
            else if (!(read_nc))
            begin
              visual_res_current_o <= tr_cor;
            end
            else
              visual_res_current_o <= re_nc;
          end
 
        sen_ad_10bit_2:
          begin
            if (i2c_busy)
            begin
              visual_res_current_o <= sen_ad_10bit_2;
            end
            else if (!(i2c_busy) && !(stop_cond_in))
            begin
              nbyte_o <= 5'h8;
              
              out_i2c_o[0] <= 1'b1;
              if(com == {3'b0,I2C_read_multi_ext[6:2]})
                  nbyte_o <= {1'b0,nbyte_in}+ 5'h1;
              else
                  nbyte_o <= 5'h2;
              start_i2c_o <= 1'b1;
              SRA_o[6] <= 1'b0;
              lire_i2c_o <= 1'b1; //19nov2012
              visual_res_current_o <= State_start_i2c;
            end
            else if (stop_cond_in)
            begin
              rep_out_o <= 1'b0;
              visual_res_current_o <= wait_r_nc;
            end
            else
              visual_res_current_o <= sen_ad_10bit_2;
          end
 
        send_ad_10bit:
          begin
            if (!(i2c_busy))
            begin
              visual_res_current_o <= send_ad_10bit;
            end
            else if (i2c_busy)
            begin
              visual_res_current_o <= sen_ad_10bit_2;
            end
            else
              visual_res_current_o <= send_ad_10bit;
          end
 
        tr_cor:
          begin
            start_i2c_o <= 1'b0;
            occup_o <= 1'b0;
            rep_out_o <= 1'b1;
            lire_i2c_o <= 1'b0;
            msk_op_o <= 2'b0;
            ext_mode_o <= 1'b0;
            MultiByte_o <= 1'b0;
            ext_multi_mode_o <= 1'b0;
            rw_b_ext_o <= 1'b0;  // 28.5.13
            visual_res_current_o <= attente;
          end
 
        wait_r_nc:
          begin
            if (read_nc)
            begin
              visual_res_current_o <= re_nc;
            end
            else if (!(read_nc))
            begin
              visual_res_current_o <= wait_r_nc;
            end
            else
              visual_res_current_o <= wait_r_nc;
          end
 
        RMW_normal:
          begin
             start_i2c_o <= 1'b1;
            visual_res_current_o <= start_i2c1;
          end
 
        RMW_ext:
          begin
             start_i2c_o <= 1'b1;
            visual_res_current_o <= start_i2c1;
          end
 
        att_busy0:
          begin
            if (i2c_busy)
            begin
              visual_res_current_o <= s6;
            end
            else if (!(i2c_busy))
            begin
              visual_res_current_o <= att_busy0;
            end
            else
              visual_res_current_o <= att_busy0;
          end
 
        s13:
          begin
            if (ack_ok_in)
            begin
              
              visual_res_current_o <= S55;
            end
            else if (!(ack_ok_in))
            begin
              
              SRA_o[6] <= 1'b1;
              visual_res_current_o <= rd_wr_err;
            end
            else
            begin
              
              if ((com >= 8'h10) && (8'h12 >= com))
              begin
                nbyte_o <= 4'b0010;
                out_i2c_o[0] <= 1'b1;// addresse[0] = 1 read
                visual_res_current_o <= RMW_normal;
              end
              else if ((com >= 8'h13) && (8'h15 >= com))
              begin
                nbyte_o <= 4'b0011;
                visual_res_current_o <= RMW_ext;
              end
              else
              begin
                nbyte_o <= 4'b0010;
                out_i2c_o[0] <= 1'b1;// addresse[0] = 1 read
                visual_res_current_o <= RMW_normal;
              end
            end
          end
 
        s6:
          begin
            if (i2c_busy)
            begin
              visual_res_current_o <= s6;
            end
            else if (((ack_ok_in) && !(i2c_busy)) && ((cmd_in == 8'h10) || (
                     cmd_in == 8'h13)))
            begin
              start_i2c_o <= 1'b0;
              msk_op_o <= 2'b01;
              out_i2c_o[0] <= 1'b0;
              visual_res_current_o <= s13;
            end
            else if (((ack_ok_in) && !(i2c_busy)) && ((cmd_in == 8'h11) || (
                     cmd_in == 8'h14)))
            begin
              start_i2c_o <= 1'b0;
              msk_op_o <= 2'b10;
              out_i2c_o[0] <= 1'b0;
              visual_res_current_o <= s13;
            end
            else if (((ack_ok_in) && !(i2c_busy)) && ((cmd_in == 8'h12) || (
                     cmd_in == 8'h15)))
            begin
              start_i2c_o <= 1'b0;
              msk_op_o <= 2'b11;
              out_i2c_o[0] <= 1'b0;
              visual_res_current_o <= s13;
            end
            else if ((!(ack_ok_in)) && !(i2c_busy))
            begin
              if (ack_ok_in)
              begin
                start_i2c_o <= 1'b0;
                visual_res_current_o <= S55;
              end
              else if (!(ack_ok_in))
              begin
                start_i2c_o <= 1'b0;
                SRA_o[6] <= 1'b1;
                visual_res_current_o <= rd_wr_err;
              end
              else
              begin
                start_i2c_o <= 1'b0;
                if (com >= 8'h10 && 8'h12 >= com)
                begin
                  nbyte_o <= 4'b0010;
                  out_i2c_o[0] <= 1'b1;// addresse[0] = 1 read
                  visual_res_current_o <= RMW_normal;
                end
                else if ((com >= 8'h13) && (8'h15 >= com))
                begin
                  nbyte_o <= 4'b0011;
                  visual_res_current_o <= RMW_ext;
                end
                else
                begin
                  nbyte_o <= 4'b0010;
                  out_i2c_o[0] <= 1'b1;// addresse[0] = 1 read
                  visual_res_current_o <= RMW_normal;
                end
              end
            end
            else
              visual_res_current_o <= s6;
          end
 
        start_i2c1:
          begin
            visual_res_current_o <= att_busy0;
          end
 
        default:
          begin
            out_i2c_o <= 8'h0;
            start_i2c_o <= 1'b0;
            lire_i2c_o <= 1'b0;
            msk_op_o <= 2'b0;
            SRA_o <= 8'h0;
            ext_mode_o <= 1'b0;
            nbyte_o <= 5'b0;
            
            rep_out_o <= 1'b1;
            MultiByte_o <= 1'b0;
            occup_o <= 1'b0;
            ext_multi_mode_o <= 1'b0;
            rw_b_ext_o <= 1'b0;  // write
            visual_res_current_o <= res;
          end
      endcase
    end
  end
 
  assign com[7:0] = cmd_in[7:0];
 
 
endmodule



//  Design Unit:
//  ------------
//      Unit    Name  :  decode_sm_back
//      Library Name  :  new_i2c_2
//  
//      Creation Date :  Mon Jun 24 09:42:13 2013
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
//  Library Name :  new_i2c_2
//  Unit    Name :  decode_sm_back
//  Unit    Type :  State Machine
//  
//----------------------------------------------------

module decode_sm_back_tri (reset_1, reset_2, reset_3, ack_ok_in_1, ack_ok_in_2, ack_ok_in_3, clk_1, clk_2, clk_3, cmd_in_1, cmd_in_2, cmd_in_3, nbyte_1, nbyte_2, nbyte_3, out_i2c_1, out_i2c_2, out_i2c_3, i2c_busy_1, i2c_busy_2, i2c_busy_3,
                       start_i2c_1, start_i2c_2, start_i2c_3, crc_ok_1, crc_ok_2, crc_ok_3, occup_1, occup_2, occup_3, addr_i2c_1, addr_i2c_2, addr_i2c_3, read_nc_1, read_nc_2, read_nc_3, rep_out_1, rep_out_2, rep_out_3,
                       msk_op_1, msk_op_2, msk_op_3, SRA_1, SRA_2, SRA_3, SDA_LOW_1, SDA_LOW_2, SDA_LOW_3, ext_mode_1, ext_mode_2, ext_mode_3, i2c_br_1, i2c_br_2, i2c_br_3, EBRDCST_1, EBRDCST_2, EBRDCST_3,
                       MultiByte_1, MultiByte_2, MultiByte_3, nbyte_in_1, nbyte_in_2, nbyte_in_3, ext_multi_mode_1, ext_multi_mode_2, ext_multi_mode_3, rw_b_ext_1, rw_b_ext_2, rw_b_ext_3,
                       stop_cond_in_1, stop_cond_in_2, stop_cond_in_3
                       );

`include "Table_Commande.v"

  input reset_1, reset_2, reset_3;
  input ack_ok_in_1, ack_ok_in_2, ack_ok_in_3;
  input clk_1, clk_2, clk_3;
  input [7:0] cmd_in_1, cmd_in_2, cmd_in_3;
  output [4:0] nbyte_1, nbyte_2, nbyte_3;
  output [7:0] out_i2c_1, out_i2c_2, out_i2c_3;
  input i2c_busy_1, i2c_busy_2, i2c_busy_3;
  output start_i2c_1, start_i2c_2, start_i2c_3;
  input crc_ok_1, crc_ok_2, crc_ok_3;
  output occup_1, occup_2, occup_3;
  input [7:0] addr_i2c_1, addr_i2c_2, addr_i2c_3;
  input read_nc_1, read_nc_2, read_nc_3;
  output rep_out_1, rep_out_2, rep_out_3;
  output [1:0] msk_op_1, msk_op_2, msk_op_3;
  output [7:0] SRA_1, SRA_2, SRA_3;
  input SDA_LOW_1, SDA_LOW_2, SDA_LOW_3;
  output ext_mode_1, ext_mode_2, ext_mode_3;
  input i2c_br_1, i2c_br_2, i2c_br_3;
  input EBRDCST_1, EBRDCST_2, EBRDCST_3;
  output MultiByte_1, MultiByte_2, MultiByte_3;        
  input [3:0] nbyte_in_1, nbyte_in_2, nbyte_in_3;
  output ext_multi_mode_1, ext_multi_mode_2, ext_multi_mode_3;   
  output rw_b_ext_1, rw_b_ext_2, rw_b_ext_3;
  input stop_cond_in_1, stop_cond_in_2, stop_cond_in_3;

	wire [7:0] out_i2c_1, out_i2c_2, out_i2c_3;
	wire start_i2c_1, start_i2c_2, start_i2c_3;
	wire lire_i2c_1, lire_i2c_2, lire_i2c_3;
	wire [1:0] msk_op_1, msk_op_2, msk_op_3;
	wire [7:0] SRA_1, SRA_2, SRA_3;
	wire ext_mode_1, ext_mode_2, ext_mode_3;
	wire [4:0] nbyte_1, nbyte_2, nbyte_3;
	wire rep_out_1, rep_out_2, rep_out_3;
	wire MultiByte_1, MultiByte_2, MultiByte_3;
	wire occup_1, occup_2, occup_3;
	wire ext_multi_mode_1, ext_multi_mode_2, ext_multi_mode_3;
	wire rw_b_ext_1, rw_b_ext_2, rw_b_ext_3;
	wire [4:0] visual_res_current_1, visual_res_current_2, visual_res_current_3;
	wire [7:0] out_i2c;
	wire start_i2c;
	wire lire_i2c;
	wire [1:0] msk_op;
	wire [7:0] SRA;
	wire ext_mode;
	wire [4:0] nbyte;
	wire rep_out;
	wire MultiByte;
	wire occup;
	wire ext_multi_mode;
	wire rw_b_ext;
	wire [4:0] visual_res_current;

	decode_sm_back_iostate decode_sm_back_iostate_1   (.reset(reset_1), .ack_ok_in(ack_ok_in_1), .clk(clk_1), .cmd_in(cmd_in_1), .nbyte_i(nbyte_1), .nbyte_o(nbyte_2), .out_i2c_i(out_i2c_1), .out_i2c_o(out_i2c_2), .i2c_busy(i2c_busy_1),
                       .start_i2c_i(start_i2c_1), .start_i2c_o(start_i2c_2), .crc_ok(crc_ok_1), .occup_i(occup_1), .occup_o(occup_2), .addr_i2c(addr_i2c_1), .read_nc(read_nc_1), .rep_out_i(rep_out_1), .rep_out_o(rep_out_2),
                       .msk_op_i(msk_op_1), .msk_op_o(msk_op_2), .SRA_i(SRA_1), .SRA_o(SRA_2), .SDA_LOW(SDA_LOW_1), .ext_mode_i(ext_mode_1), .ext_mode_o(ext_mode_2), .i2c_br(i2c_br_1), .EBRDCST(EBRDCST_1),
                       .MultiByte_i(MultiByte_1), .MultiByte_o(MultiByte_2), .nbyte_in(nbyte_in_1), .ext_multi_mode_i(ext_multi_mode_1), .ext_multi_mode_o(ext_multi_mode_2), .rw_b_ext_i(rw_b_ext_1), .rw_b_ext_o(rw_b_ext_2),
                       .stop_cond_in(stop_cond_in_1), .lire_i2c_i(lire_i2c_1), .lire_i2c_o(lire_i2c_2), .visual_res_current_i(visual_res_current_1), .visual_res_current_o(visual_res_current_2));

	decode_sm_back_iostate decode_sm_back_iostate_2   (.reset(reset_2), .ack_ok_in(ack_ok_in_2), .clk(clk_2), .cmd_in(cmd_in_2), .nbyte_i(nbyte_2), .nbyte_o(nbyte_3), .out_i2c_i(out_i2c_2), .out_i2c_o(out_i2c_3), .i2c_busy(i2c_busy_2),
                       .start_i2c_i(start_i2c_2), .start_i2c_o(start_i2c_3), .crc_ok(crc_ok_2), .occup_i(occup_2), .occup_o(occup_3), .addr_i2c(addr_i2c_2), .read_nc(read_nc_2), .rep_out_i(rep_out_2), .rep_out_o(rep_out_3),
                       .msk_op_i(msk_op_2), .msk_op_o(msk_op_3), .SRA_i(SRA_2), .SRA_o(SRA_3), .SDA_LOW(SDA_LOW_2), .ext_mode_i(ext_mode_2), .ext_mode_o(ext_mode_3), .i2c_br(i2c_br_2), .EBRDCST(EBRDCST_2),
                       .MultiByte_i(MultiByte_2), .MultiByte_o(MultiByte_3), .nbyte_in(nbyte_in_2), .ext_multi_mode_i(ext_multi_mode_2), .ext_multi_mode_o(ext_multi_mode_3), .rw_b_ext_i(rw_b_ext_2), .rw_b_ext_o(rw_b_ext_3),
                       .stop_cond_in(stop_cond_in_2), .lire_i2c_i(lire_i2c_2), .lire_i2c_o(lire_i2c_3), .visual_res_current_i(visual_res_current_2), .visual_res_current_o(visual_res_current_3));

	decode_sm_back_iostate decode_sm_back_iostate_3   (.reset(reset_3), .ack_ok_in(ack_ok_in_3), .clk(clk_3), .cmd_in(cmd_in_3), .nbyte_i(nbyte_3), .nbyte_o(nbyte), .out_i2c_i(out_i2c_3), .out_i2c_o(out_i2c), .i2c_busy(i2c_busy_3),
                       .start_i2c_i(start_i2c_3), .start_i2c_o(start_i2c), .crc_ok(crc_ok_3), .occup_i(occup_3), .occup_o(occup), .addr_i2c(addr_i2c_3), .read_nc(read_nc_3), .rep_out_i(rep_out_3), .rep_out_o(rep_out),
                       .msk_op_i(msk_op_3), .msk_op_o(msk_op), .SRA_i(SRA_3), .SRA_o(SRA), .SDA_LOW(SDA_LOW_3), .ext_mode_i(ext_mode_3), .ext_mode_o(ext_mode), .i2c_br(i2c_br_3), .EBRDCST(EBRDCST_3),
                       .MultiByte_i(MultiByte_3), .MultiByte_o(MultiByte), .nbyte_in(nbyte_in_3), .ext_multi_mode_i(ext_multi_mode_3), .ext_multi_mode_o(ext_multi_mode), .rw_b_ext_i(rw_b_ext_3), .rw_b_ext_o(rw_b_ext),
                       .stop_cond_in(stop_cond_in_3), .lire_i2c_i(lire_i2c_3), .lire_i2c_o(lire_i2c), .visual_res_current_i(visual_res_current_3), .visual_res_current_o(visual_res_current));

	majority_voter #(.WIDTH(36)) mv (
		.in1({out_i2c_2, start_i2c_2, lire_i2c_2, msk_op_2, SRA_2, ext_mode_2, nbyte_2, rep_out_2, MultiByte_2, occup_2, ext_multi_mode_2, rw_b_ext_2, visual_res_current_2}),
		.in2({out_i2c_3, start_i2c_3, lire_i2c_3, msk_op_3, SRA_3, ext_mode_3, nbyte_3, rep_out_3, MultiByte_3, occup_3, ext_multi_mode_3, rw_b_ext_3, visual_res_current_3}),
		.in3({out_i2c,   start_i2c,   lire_i2c,   msk_op,   SRA,   ext_mode,   nbyte,   rep_out,   MultiByte,   occup,   ext_multi_mode, rw_b_ext, visual_res_current}),
		.out({out_i2c_1, start_i2c_1, lire_i2c_1, msk_op_1, SRA_1, ext_mode_1, nbyte_1, rep_out_1, MultiByte_1, occup_1, ext_multi_mode_1, rw_b_ext_1, visual_res_current_1}),
		.err()
	);
endmodule





















