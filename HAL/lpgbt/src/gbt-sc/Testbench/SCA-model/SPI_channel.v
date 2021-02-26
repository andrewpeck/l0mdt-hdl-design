
`include "spi_defines.v"
module spi_top_tri (

input                             wb_clk_i_1,         
input                             wb_clk_i_2,         
input                             wb_clk_i_3,         
input                             wb_rst_i_1,         
input                             wb_rst_i_2,         
input                             wb_rst_i_3,         
input [4:0]                       wb_adr_i_1,         
input [4:0]                       wb_adr_i_2,         
input [4:0]                       wb_adr_i_3,         
input [32-1:0]                    wb_dat_i_1,         
input [32-1:0]                    wb_dat_i_2,         
input [32-1:0]                    wb_dat_i_3,         
output [32-1:0]                   wb_dat_o_1,         
output [32-1:0]                   wb_dat_o_2,         
output [32-1:0]                   wb_dat_o_3,         
input [3:0]                       wb_sel_i_1,         
input [3:0]                       wb_sel_i_2,         
input [3:0]                       wb_sel_i_3,         
input                             wb_we_i_1 ,         
input                             wb_we_i_2 ,         
input                             wb_we_i_3 ,         
input                             wb_stb_i_1,         
input                             wb_stb_i_2,         
input                             wb_stb_i_3,         
input                             wb_cyc_i_1,         
input                             wb_cyc_i_2,         
input                             wb_cyc_i_3,         
output                            wb_ack_o_1,         
output                            wb_ack_o_2,         
output                            wb_ack_o_3,         
output                            wb_err_o_1,         
output                            wb_err_o_2,         
output                            wb_err_o_3,         
output                            wb_int_o_1,                               
output                            wb_int_o_2,                               
output                            wb_int_o_3,                               
output [`SPI_SS_NB-1:0]           ss_pad_o_1,       
output [`SPI_SS_NB-1:0]           ss_pad_o_2,       
output [`SPI_SS_NB-1:0]           ss_pad_o_3,       
output                            sclk_pad_o_1,       
output                            sclk_pad_o_2,       
output                            sclk_pad_o_3,       
output                            mosi_pad_o_1,       
output                            mosi_pad_o_2,       
output                            mosi_pad_o_3,       
input                             miso_pad_i_1,
input                             miso_pad_i_2,
input                             miso_pad_i_3 
);

wire [`SPI_DIVIDER_LEN-1:0]        divider_1;
wire [`SPI_DIVIDER_LEN-1:0]        divider_2;
wire [`SPI_DIVIDER_LEN-1:0]        divider_3;
wire [`SPI_CTRL_BIT_NB-1:0]        ctrl_1;
wire [`SPI_CTRL_BIT_NB-1:0]        ctrl_2;
wire [`SPI_CTRL_BIT_NB-1:0]        ctrl_3;
wire [`SPI_SS_NB-1:0]              ss_1;
wire [`SPI_SS_NB-1:0]              ss_2;
wire [`SPI_SS_NB-1:0]              ss_3;
wire [`SPI_MAX_CHAR-1:0]          rx_1;
wire [`SPI_MAX_CHAR-1:0]          rx_2;
wire [`SPI_MAX_CHAR-1:0]          rx_3;
wire                              rx_negedge_1;
wire                              rx_negedge_2;
wire                              rx_negedge_3;
wire                              tx_negedge_1;
wire                              tx_negedge_2;
wire                              tx_negedge_3;
wire [`SPI_CHAR_LEN_BITS-1:0]     char_len_1;
wire [`SPI_CHAR_LEN_BITS-1:0]     char_len_2;
wire [`SPI_CHAR_LEN_BITS-1:0]     char_len_3;
wire                              go_1;
wire                              go_2;
wire                              go_3;
wire                              lsb_1;
wire                              lsb_2;
wire                              lsb_3;
wire                              ie_1;
wire                              ie_2;
wire                              ie_3;
wire                              ass_1;
wire                              ass_2;
wire                              ass_3;
wire 				     inv_sclk_1;
wire 				     inv_sclk_2;
wire 				     inv_sclk_3;
wire                              spi_divider_sel_1;
wire                              spi_divider_sel_2;
wire                              spi_divider_sel_3;
wire                              spi_ctrl_sel_1;
wire                              spi_ctrl_sel_2;
wire                              spi_ctrl_sel_3;
wire [3:0]                        spi_tx_sel_1;
wire [3:0]                        spi_tx_sel_2;
wire [3:0]                        spi_tx_sel_3;
wire                              spi_ss_sel_1;
wire                              spi_ss_sel_2;
wire                              spi_ss_sel_3;
wire                              tip_1;
wire                              tip_2;
wire                              tip_3;
wire                              pos_edge_1;
wire                              pos_edge_2;
wire                              pos_edge_3;
wire                              neg_edge_1;
wire                              neg_edge_2;
wire                              neg_edge_3;
wire                              last_bit_1;
wire                              last_bit_2;
wire                              last_bit_3;
wire                              sclk_o_1;
wire                              sclk_o_2;
wire                              sclk_o_3;

assign inv_sclk_1   = ctrl_1[`SPI_CTRL_INV_SCLK];
assign inv_sclk_2   = ctrl_2[`SPI_CTRL_INV_SCLK];
assign inv_sclk_3   = ctrl_3[`SPI_CTRL_INV_SCLK];

assign go_1         = ctrl_1[`SPI_CTRL_GO];
assign go_2         = ctrl_2[`SPI_CTRL_GO];
assign go_3         = ctrl_3[`SPI_CTRL_GO];

assign char_len_1   = ctrl_1[`SPI_CTRL_CHAR_LEN];
assign char_len_2   = ctrl_2[`SPI_CTRL_CHAR_LEN];
assign char_len_3   = ctrl_3[`SPI_CTRL_CHAR_LEN];

assign lsb_1        = ctrl_1[`SPI_CTRL_LSB];
assign lsb_2        = ctrl_2[`SPI_CTRL_LSB];
assign lsb_3        = ctrl_3[`SPI_CTRL_LSB];

//assign ie_1         = ctrl_1[`SPI_CTRL_IE]; //change 1-Oct-2015
//assign ie_2         = ctrl_2[`SPI_CTRL_IE]; //change 1-Oct-2015
//assign ie_3         = ctrl_3[`SPI_CTRL_IE]; //change 1-Oct-2015

assign ie_1         = 1'b1; //change 1-Oct-2015
assign ie_2         = 1'b1; //change 1-Oct-2015
assign ie_3         = 1'b1; //change 1-Oct-2015

assign ass_1        = ctrl_1[`SPI_CTRL_ASS];
assign ass_2        = ctrl_2[`SPI_CTRL_ASS];
assign ass_3        = ctrl_3[`SPI_CTRL_ASS];

assign rx_negedge_1 = (~inv_sclk_1) ? ctrl_1[`SPI_CTRL_RX_NEGEDGE] : ~ctrl_1[`SPI_CTRL_RX_NEGEDGE];
assign rx_negedge_2 = (~inv_sclk_2) ? ctrl_2[`SPI_CTRL_RX_NEGEDGE] : ~ctrl_2[`SPI_CTRL_RX_NEGEDGE];
assign rx_negedge_3 = (~inv_sclk_3) ? ctrl_3[`SPI_CTRL_RX_NEGEDGE] : ~ctrl_3[`SPI_CTRL_RX_NEGEDGE];

assign tx_negedge_1 = (~inv_sclk_1) ? ctrl_1[`SPI_CTRL_TX_NEGEDGE] : ~ctrl_1[`SPI_CTRL_TX_NEGEDGE];
assign tx_negedge_2 = (~inv_sclk_2) ? ctrl_2[`SPI_CTRL_TX_NEGEDGE] : ~ctrl_2[`SPI_CTRL_TX_NEGEDGE];
assign tx_negedge_3 = (~inv_sclk_3) ? ctrl_3[`SPI_CTRL_TX_NEGEDGE] : ~ctrl_3[`SPI_CTRL_TX_NEGEDGE];

assign ss_pad_o_1 = ~((ss_1 & {`SPI_SS_NB{tip_1 & ass_1}}) | (ss_1 & {`SPI_SS_NB{!ass_1}}));
assign ss_pad_o_2 = ~((ss_2 & {`SPI_SS_NB{tip_2 & ass_2}}) | (ss_2 & {`SPI_SS_NB{!ass_2}}));
assign ss_pad_o_3 = ~((ss_3 & {`SPI_SS_NB{tip_3 & ass_3}}) | (ss_3 & {`SPI_SS_NB{!ass_3}}));

assign sclk_pad_o_1 = (~inv_sclk_1) ? sclk_o_1 : ~sclk_o_1;
assign sclk_pad_o_2 = (~inv_sclk_2) ? sclk_o_2 : ~sclk_o_2;
assign sclk_pad_o_3 = (~inv_sclk_3) ? sclk_o_3 : ~sclk_o_3;

spi_clgen_tri clgen (
		.clk_in_1(wb_clk_i_1), 
		.rst_1(wb_rst_i_1), 
		.go_1(go_1), 
		.enable_1(tip_1), 
		.last_clk_1(last_bit_1),
		.divider_1(divider_1), 
		.clk_out_1(sclk_o_1), 
		.pos_edge_1(pos_edge_1),                    
		.neg_edge_1(neg_edge_1),
		.clk_in_2(wb_clk_i_2), 
		.rst_2(wb_rst_i_2), 
		.go_2(go_2), 
		.enable_2(tip_2), 
		.last_clk_2(last_bit_2),
		.divider_2(divider_2), 
		.clk_out_2(sclk_o_2), 
		.pos_edge_2(pos_edge_2),                    
		.neg_edge_2(neg_edge_2),
		.clk_in_3(wb_clk_i_3), 
		.rst_3(wb_rst_i_3), 
		.go_3(go_3), 
		.enable_3(tip_3), 
		.last_clk_3(last_bit_3),
		.divider_3(divider_3), 
		.clk_out_3(sclk_o_3), 
		.pos_edge_3(pos_edge_3),                    
		.neg_edge_3(neg_edge_3)
	);


spi_shift_tri shift (
		.clk_1(wb_clk_i_1), 
		.rst_1(wb_rst_i_1), 
		.len_1(char_len_1[`SPI_CHAR_LEN_BITS-1:0]),                   
		.latch_1(spi_tx_sel_1[3:0] & {4{wb_we_i_1}}), 
		.byte_sel_1(wb_sel_i_1), 
		.lsb_1(lsb_1),                 
		.go_1(go_1), 
		.pos_edge_1(pos_edge_1),
		.neg_edge_1(neg_edge_1), 
		.rx_negedge_1(rx_negedge_1), 
		.tx_negedge_1(tx_negedge_1),
		.tip_1(tip_1), 
		.last_1(last_bit_1), 
		.p_in_1(wb_dat_i_1), 
		.p_out_1(rx_1), 
		.s_clk_1(sclk_o_1), 
		.s_in_1(miso_pad_i_1), 
		.s_out_1(mosi_pad_o_1),
		.clk_2(wb_clk_i_2), 
		.rst_2(wb_rst_i_2), 
		.len_2(char_len_2[`SPI_CHAR_LEN_BITS-1:0]),                   
		.latch_2(spi_tx_sel_2[3:0] & {4{wb_we_i_2}}), 
		.byte_sel_2(wb_sel_i_2), 
		.lsb_2(lsb_2),                 
		.go_2(go_2), 
		.pos_edge_2(pos_edge_2),
		.neg_edge_2(neg_edge_2), 
		.rx_negedge_2(rx_negedge_2), 
		.tx_negedge_2(tx_negedge_2),
		.tip_2(tip_2), 
		.last_2(last_bit_2), 
		.p_in_2(wb_dat_i_2), 
		.p_out_2(rx_2), 
		.s_clk_2(sclk_o_2), 
		.s_in_2(miso_pad_i_2), 
		.s_out_2(mosi_pad_o_2),
		.clk_3(wb_clk_i_3), 
		.rst_3(wb_rst_i_3), 
		.len_3(char_len_3[`SPI_CHAR_LEN_BITS-1:0]),                   
		.latch_3(spi_tx_sel_3[3:0] & {4{wb_we_i_3}}), 
		.byte_sel_3(wb_sel_i_3), 
		.lsb_3(lsb_3),                 
		.go_3(go_3), 
		.pos_edge_3(pos_edge_3),
		.neg_edge_3(neg_edge_3), 
		.rx_negedge_3(rx_negedge_3), 
		.tx_negedge_3(tx_negedge_3),
		.tip_3(tip_3), 
		.last_3(last_bit_3), 
		.p_in_3(wb_dat_i_3), 
		.p_out_3(rx_3), 
		.s_clk_3(sclk_o_3), 
		.s_in_3(miso_pad_i_3), 
		.s_out_3(mosi_pad_o_3)
	);


spi_wb_interface_tri wb_interface ( 
		.wb_clk_in_1(wb_clk_i_1), 
		.wb_rst_in_1(wb_rst_i_1), 
		.wb_adr_in_1(wb_adr_i_1), 
		.wb_dat_in_1(wb_dat_i_1), 
		.wb_dat_out_1(wb_dat_o_1),
		.wb_sel_in_1(wb_sel_i_1), 
		.wb_we_in_1(wb_we_i_1), 
		.wb_stb_in_1(wb_stb_i_1), 
		.wb_cyc_in_1(wb_cyc_i_1),            
		.wb_ack_out_1(wb_ack_o_1), 
		.wb_err_out_1(wb_err_o_1), 
		.wb_int_out_1(wb_int_o_1),
		.divider_1(divider_1), 
		.ctrl_1(ctrl_1), 
		.ss_1(ss_1),
		.rx_1(rx_1),
		.ie_1(ie_1),
		.spi_divider_sel_1(spi_divider_sel_1), 
		.spi_ctrl_sel_1(spi_ctrl_sel_1), 
		.spi_tx_sel_1(spi_tx_sel_1), 
		.spi_ss_sel_1(spi_ss_sel_1),
		.tip_1(tip_1),
		.last_bit_1(last_bit_1),
		.pos_edge_1(pos_edge_1),
		.wb_clk_in_2(wb_clk_i_2), 
		.wb_rst_in_2(wb_rst_i_2), 
		.wb_adr_in_2(wb_adr_i_2), 
		.wb_dat_in_2(wb_dat_i_2), 
		.wb_dat_out_2(wb_dat_o_2),
		.wb_sel_in_2(wb_sel_i_2), 
		.wb_we_in_2(wb_we_i_2), 
		.wb_stb_in_2(wb_stb_i_2), 
		.wb_cyc_in_2(wb_cyc_i_2),            
		.wb_ack_out_2(wb_ack_o_2), 
		.wb_err_out_2(wb_err_o_2), 
		.wb_int_out_2(wb_int_o_2),
		.divider_2(divider_2), 
		.ctrl_2(ctrl_2), 
		.ss_2(ss_2),
		.rx_2(rx_2),
		.ie_2(ie_2),
		.spi_divider_sel_2(spi_divider_sel_2), 
		.spi_ctrl_sel_2(spi_ctrl_sel_2), 
		.spi_tx_sel_2(spi_tx_sel_2), 
		.spi_ss_sel_2(spi_ss_sel_2),
		.tip_2(tip_2),
		.last_bit_2(last_bit_2),
		.pos_edge_2(pos_edge_2),
		.wb_clk_in_3(wb_clk_i_3), 
		.wb_rst_in_3(wb_rst_i_3), 
		.wb_adr_in_3(wb_adr_i_3), 
		.wb_dat_in_3(wb_dat_i_3), 
		.wb_dat_out_3(wb_dat_o_3),
		.wb_sel_in_3(wb_sel_i_3), 
		.wb_we_in_3(wb_we_i_3), 
		.wb_stb_in_3(wb_stb_i_3), 
		.wb_cyc_in_3(wb_cyc_i_3),            
		.wb_ack_out_3(wb_ack_o_3), 
		.wb_err_out_3(wb_err_o_3), 
		.wb_int_out_3(wb_int_o_3),
		.divider_3(divider_3), 
		.ctrl_3(ctrl_3), 
		.ss_3(ss_3),
		.rx_3(rx_3),
		.ie_3(ie_3),
		.spi_divider_sel_3(spi_divider_sel_3), 
		.spi_ctrl_sel_3(spi_ctrl_sel_3), 
		.spi_tx_sel_3(spi_tx_sel_3), 
		.spi_ss_sel_3(spi_ss_sel_3),
		.tip_3(tip_3),
		.last_bit_3(last_bit_3),
		.pos_edge_3(pos_edge_3)
	);


endmodule

`timescale 1ns / 1ps
module spi_clgen_iostate (clk_in, rst, go, enable, last_clk, divider, clk_out_i, clk_out_o, pos_edge_i, pos_edge_o, neg_edge_i, neg_edge_o, cnt_i, cnt_o); 
  
  input                            clk_in;   
  input                            neg_edge_i;                          
  input                            pos_edge_i; 
  input                            clk_out_i;  
  input     [`SPI_DIVIDER_LEN-1:0] cnt_i;     
 
  input                            rst;      
  input                            enable;   
  input                            go;       
  input                            last_clk; 
  input     [`SPI_DIVIDER_LEN-1:0] divider;  
  output                           clk_out_o;
  output       [`SPI_DIVIDER_LEN-1:0] cnt_o;
  output                           pos_edge_o;
  output                           neg_edge_o;
  
  reg                              clk_out_o;
  reg                              pos_edge_o;
  reg                              neg_edge_o;                        
  reg       [`SPI_DIVIDER_LEN-1:0] cnt_o;
  wire                             cnt_zero; 
  wire                             cnt_one;  
  
  
  assign cnt_zero = cnt_i == {`SPI_DIVIDER_LEN{1'b0}};
  assign cnt_one  = cnt_i == {{`SPI_DIVIDER_LEN-1{1'b0}}, 1'b1};
  
  
  always @(posedge clk_in or posedge rst)
  begin
    if(rst)
      cnt_o <=#1   {`SPI_DIVIDER_LEN{1'b1}};
    else
      begin
	  cnt_o <=#1   cnt_i;
        if(!enable || cnt_zero)
          cnt_o <=#1   divider;
        else
          cnt_o <=#1   cnt_i - {{`SPI_DIVIDER_LEN-1{1'b0}}, 1'b1};
      end
  end
  
  
  always @(posedge clk_in or posedge rst)
  begin
    if(rst)
      clk_out_o <=#1   1'b0;
    else
      clk_out_o <=#1   (enable && cnt_zero && (!last_clk || clk_out_i)) ? ~clk_out_i : clk_out_i;
  end
   
  
  always @(posedge clk_in or posedge rst)
  begin
    if(rst)
      begin
        pos_edge_o  <=#1   1'b0;
        neg_edge_o  <=#1   1'b0;
      end
    else
      begin
        pos_edge_o  <=#1   (enable && !clk_out_i && cnt_one) || (!(|divider) && clk_out_i) || (!(|divider) && go && !enable);
        neg_edge_o  <=#1   (enable && clk_out_i && cnt_one) || (!(|divider) && !clk_out_i && enable);
      end
  end

endmodule



module spi_clgen_tri (clk_in_1, clk_in_2, clk_in_3, rst_1, rst_2, rst_3, go_1, go_2, go_3, enable_1, enable_2, enable_3, last_clk_1, last_clk_2, last_clk_3, divider_1, divider_2, divider_3, clk_out_1, clk_out_2, clk_out_3, pos_edge_1, pos_edge_2, pos_edge_3, neg_edge_1, neg_edge_2, neg_edge_3);

  input                            clk_in_1, clk_in_2, clk_in_3;   
  input                            rst_1, rst_2, rst_3;      
  input                            enable_1, enable_2, enable_3;   
  input                            go_1, go_2, go_3;       
  input                            last_clk_1, last_clk_2, last_clk_3; 
  input     [`SPI_DIVIDER_LEN-1:0] divider_1, divider_2, divider_3;  
  output                           clk_out_1, clk_out_2, clk_out_3;  
  output                           pos_edge_1, pos_edge_2, pos_edge_3; 
  output                           neg_edge_1, neg_edge_2, neg_edge_3; 

	wire [`SPI_DIVIDER_LEN-1:0] cnt_1, cnt_2, cnt_3;
	wire clk_out_1, clk_out_2, clk_out_3;
	wire pos_edge_1, pos_edge_2, pos_edge_3;
	wire neg_edge_1, neg_edge_2, neg_edge_3;
	wire [`SPI_DIVIDER_LEN-1:0] cnt;
	wire clk_out;
	wire pos_edge;
	wire neg_edge;

	spi_clgen_iostate spi_clgen_iostate_1   (.clk_in(clk_in_1), .rst(rst_1), .go(go_1), .enable(enable_1), .last_clk(last_clk_1), .divider(divider_1), .clk_out_i(clk_out_1), .clk_out_o(clk_out_2), .pos_edge_i(pos_edge_1), .pos_edge_o(pos_edge_2), .neg_edge_i(neg_edge_1), .neg_edge_o(neg_edge_2), .cnt_i(cnt_1), .cnt_o(cnt_2));

	spi_clgen_iostate spi_clgen_iostate_2   (.clk_in(clk_in_2), .rst(rst_2), .go(go_2), .enable(enable_2), .last_clk(last_clk_2), .divider(divider_2), .clk_out_i(clk_out_2), .clk_out_o(clk_out_3), .pos_edge_i(pos_edge_2), .pos_edge_o(pos_edge_3), .neg_edge_i(neg_edge_2), .neg_edge_o(neg_edge_3), .cnt_i(cnt_2), .cnt_o(cnt_3));

	spi_clgen_iostate spi_clgen_iostate_3   (.clk_in(clk_in_3), .rst(rst_3), .go(go_3), .enable(enable_3), .last_clk(last_clk_3), .divider(divider_3), .clk_out_i(clk_out_3), .clk_out_o(clk_out), .pos_edge_i(pos_edge_3), .pos_edge_o(pos_edge), .neg_edge_i(neg_edge_3), .neg_edge_o(neg_edge), .cnt_i(cnt_3), .cnt_o(cnt));

	majority_voter #(.WIDTH(4+`SPI_DIVIDER_LEN-1)) mv (
		.in1({cnt_2, clk_out_2, pos_edge_2, neg_edge_2}),
		.in2({cnt_3, clk_out_3, pos_edge_3, neg_edge_3}),
		.in3({cnt, clk_out, pos_edge, neg_edge}),
		.out({cnt_1, clk_out_1, pos_edge_1, neg_edge_1}),
		.err()
	);
endmodule


// missing: s_out_o <=#1  s_out_i;

`timescale 1ns / 1ps
module spi_shift_iostate (clk, rst, latch, byte_sel, len, lsb, go,
                  pos_edge, neg_edge, rx_negedge, tx_negedge,
                  tip_i, tip_o, last, 
                  p_in, p_out, s_clk, s_in, s_out_i, s_out_o, cnt_i, cnt_o, data_i, data_o);
 
  input                          clk;          
  input        [`SPI_MAX_CHAR-1:0] data_i;  
 
      
  input                          s_clk;        
  input                          s_in;         
  input     [`SPI_CHAR_LEN_BITS:0] cnt_i;          
  input                          rst;          
  input                    [3:0] latch;        
  input                    [3:0] byte_sel;     
  input [`SPI_CHAR_LEN_BITS-1:0] len;          
  input                          lsb;          
  input                          go;           
  input                          pos_edge;     
  input                          neg_edge;     
  input                          rx_negedge;   
  input                          tx_negedge;   
  output                         tip_o;
  output        [`SPI_MAX_CHAR-1:0] data_o;
  output     [`SPI_MAX_CHAR-1:0] p_out;        
  output                         s_out_o;
  input                         s_out_i;  
      
                                               
  input                          tip_i;          
  output  [`SPI_CHAR_LEN_BITS:0] cnt_o;
  output                         last;         
  input                   [31:0] p_in;         
  reg                            s_out_o;        
  reg                            tip_o;                             
  reg     [`SPI_CHAR_LEN_BITS:0] cnt_o;
  reg        [`SPI_MAX_CHAR-1:0] data_o;
  wire    [`SPI_CHAR_LEN_BITS:0] tx_bit_pos;   
  wire    [`SPI_CHAR_LEN_BITS:0] rx_bit_pos;   
  wire                           rx_clk;       
  wire                           tx_clk;       
  
  assign p_out = data_i;
  
  assign tx_bit_pos = lsb ? {!(|len), len} - cnt_i : cnt_i - {{`SPI_CHAR_LEN_BITS{1'b0}},1'b1};
  assign rx_bit_pos = lsb ? {!(|len), len} - (rx_negedge ? cnt_i + {{`SPI_CHAR_LEN_BITS{1'b0}},1'b1} : cnt_i) : 
                            (rx_negedge ? cnt_i : cnt_i - {{`SPI_CHAR_LEN_BITS{1'b0}},1'b1});
  
  assign last = !(|cnt_i);
  
  assign rx_clk = (rx_negedge ? neg_edge : pos_edge) && (!last || s_clk);
  assign tx_clk = (tx_negedge ? neg_edge : pos_edge) && !last;
  
  
  always @(posedge clk or posedge rst)
  begin
    if(rst)
      cnt_o <=#1   {`SPI_CHAR_LEN_BITS+1{1'b0}};
    else
      begin
	  cnt_o <=#1   cnt_i;
        if(tip_i)
          cnt_o <=#1   pos_edge ? (cnt_i - {{`SPI_CHAR_LEN_BITS{1'b0}}, 1'b1}) : cnt_i;
        else
          cnt_o <=#1   !(|len) ? {1'b1, {`SPI_CHAR_LEN_BITS{1'b0}}} : {1'b0, len};
      end
  end
  
  
  always @(posedge clk or posedge rst)
  begin
    	if(rst)
      	tip_o <=#1   1'b0;
  	else if(go && ~tip_i)
    		tip_o <=#1   1'b1;
  	else if(tip_i && last && pos_edge)
    		tip_o <=#1   1'b0;
	else 
		tip_o <=#1   tip_i;
  end
  
  
  always @(posedge clk or posedge rst)
  begin
    if (rst)
      s_out_o   <=#1   1'b0;
    else
      s_out_o <=#1   (tx_clk || !tip_i) ? data_i[tx_bit_pos[`SPI_CHAR_LEN_BITS-1:0]] : s_out_i;
  end
  
  
  always @(posedge clk or posedge rst)
  begin
    if (rst)
      data_o   <=#1   {`SPI_MAX_CHAR{1'b0}};
    else begin
		data_o <=#1   data_i;
		if (latch[0] && !tip_i)
			begin
			  if (byte_sel[3])
				 data_o[31:24] <=#1   p_in[31:24];
			  if (byte_sel[2])
				 data_o[23:16] <=#1   p_in[23:16];
			  if (byte_sel[1])
				 data_o[15:8] <=#1   p_in[15:8];
			  if (byte_sel[0])
				 data_o[7:0] <=#1   p_in[7:0];
			end
		 else if (latch[1] && !tip_i)
			begin
			  if (byte_sel[3])
				 data_o[63:56] <=#1   p_in[31:24];
			  if (byte_sel[2])
				 data_o[55:48] <=#1   p_in[23:16];
			  if (byte_sel[1])
				 data_o[47:40] <=#1   p_in[15:8];
			  if (byte_sel[0])
				 data_o[39:32] <=#1   p_in[7:0];
			end
		 else if (latch[2] && !tip_i)
			begin
			  if (byte_sel[3])
				 data_o[95:88] <=#1   p_in[31:24];
			  if (byte_sel[2])
				 data_o[87:80] <=#1   p_in[23:16];
			  if (byte_sel[1])
				 data_o[79:72] <=#1   p_in[15:8];
			  if (byte_sel[0])
				 data_o[71:64] <=#1   p_in[7:0];
			end
		 else if (latch[3] && !tip_i)
			begin
			  if (byte_sel[3])
				 data_o[127:120] <=#1   p_in[31:24];
			  if (byte_sel[2])
				 data_o[119:112] <=#1   p_in[23:16];
			  if (byte_sel[1])
				 data_o[111:104] <=#1   p_in[15:8];
			  if (byte_sel[0])
				 data_o[103:96] <=#1   p_in[7:0];
			end
		 else
			data_o[rx_bit_pos[`SPI_CHAR_LEN_BITS-1:0]] <=#1   rx_clk ? s_in : data_i[rx_bit_pos[`SPI_CHAR_LEN_BITS-1:0]];
   end
  end
  
endmodule



module spi_shift_tri (clk_1, clk_2, clk_3, rst_1, rst_2, rst_3, latch_1, latch_2, latch_3, byte_sel_1, byte_sel_2, byte_sel_3, len_1, len_2, len_3, lsb_1, lsb_2, lsb_3, go_1, go_2, go_3,
                  pos_edge_1, pos_edge_2, pos_edge_3, neg_edge_1, neg_edge_2, neg_edge_3, rx_negedge_1, rx_negedge_2, rx_negedge_3, tx_negedge_1, tx_negedge_2, tx_negedge_3,
                  tip_1, tip_2, tip_3, last_1, last_2, last_3, 
                  p_in_1, p_in_2, p_in_3, p_out_1, p_out_2, p_out_3, s_clk_1, s_clk_2, s_clk_3, s_in_1, s_in_2, s_in_3, s_out_1, s_out_2, s_out_3);

  input                          clk_1, clk_2, clk_3;          
  input                          rst_1, rst_2, rst_3;          
  input                    [3:0] latch_1, latch_2, latch_3;        
  input                    [3:0] byte_sel_1, byte_sel_2, byte_sel_3;     
  input [`SPI_CHAR_LEN_BITS-1:0] len_1, len_2, len_3;          
  input                          lsb_1, lsb_2, lsb_3;          
  input                          go_1, go_2, go_3;           
  input                          pos_edge_1, pos_edge_2, pos_edge_3;     
  input                          neg_edge_1, neg_edge_2, neg_edge_3;     
  input                          rx_negedge_1, rx_negedge_2, rx_negedge_3;   
  input                          tx_negedge_1, tx_negedge_2, tx_negedge_3;   
  output                         tip_1, tip_2, tip_3;          
  output                         last_1, last_2, last_3;         
  input                   [31:0] p_in_1, p_in_2, p_in_3;         
  output     [`SPI_MAX_CHAR-1:0] p_out_1, p_out_2, p_out_3;        
  input                          s_clk_1, s_clk_2, s_clk_3;        
  input                          s_in_1, s_in_2, s_in_3;         
  output                         s_out_1, s_out_2, s_out_3;  

	wire [`SPI_CHAR_LEN_BITS:0] cnt_1, cnt_2, cnt_3;
	wire tip_1, tip_2, tip_3;
	wire s_out_1, s_out_2, s_out_3;
	wire [`SPI_MAX_CHAR-1:0] data_1, data_2, data_3;
	wire [`SPI_CHAR_LEN_BITS:0] cnt;
	wire tip;
	wire s_out;
	wire [`SPI_MAX_CHAR-1:0] data;

	spi_shift_iostate spi_shift_iostate_1   (.clk(clk_1), .rst(rst_1), .latch(latch_1), .byte_sel(byte_sel_1), .len(len_1), .lsb(lsb_1), .go(go_1),
                  .pos_edge(pos_edge_1), .neg_edge(neg_edge_1), .rx_negedge(rx_negedge_1), .tx_negedge(tx_negedge_1),
                  .tip_i(tip_1), .tip_o(tip_2), .last(last_1), 
                  .p_in(p_in_1), .p_out(p_out_1), .s_clk(s_clk_1), .s_in(s_in_1), .s_out_i(s_out_1), .s_out_o(s_out_2), .cnt_i(cnt_1), .cnt_o(cnt_2), .data_i(data_1), .data_o(data_2));

	spi_shift_iostate spi_shift_iostate_2   (.clk(clk_2), .rst(rst_2), .latch(latch_2), .byte_sel(byte_sel_2), .len(len_2), .lsb(lsb_2), .go(go_2),
                  .pos_edge(pos_edge_2), .neg_edge(neg_edge_2), .rx_negedge(rx_negedge_2), .tx_negedge(tx_negedge_2),
                  .tip_i(tip_2), .tip_o(tip_3), .last(last_2), 
                  .p_in(p_in_2), .p_out(p_out_2), .s_clk(s_clk_2), .s_in(s_in_2), .s_out_i(s_out_2), .s_out_o(s_out_3), .cnt_i(cnt_2), .cnt_o(cnt_3), .data_i(data_2), .data_o(data_3));

	spi_shift_iostate spi_shift_iostate_3   (.clk(clk_3), .rst(rst_3), .latch(latch_3), .byte_sel(byte_sel_3), .len(len_3), .lsb(lsb_3), .go(go_3),
                  .pos_edge(pos_edge_3), .neg_edge(neg_edge_3), .rx_negedge(rx_negedge_3), .tx_negedge(tx_negedge_3),
                  .tip_i(tip_3), .tip_o(tip), .last(last_3), 
                  .p_in(p_in_3), .p_out(p_out_3), .s_clk(s_clk_3), .s_in(s_in_3), .s_out_i(s_out_3), .s_out_o(s_out), .cnt_i(cnt_3), .cnt_o(cnt), .data_i(data_3), .data_o(data));

	majority_voter #(.WIDTH(4+`SPI_CHAR_LEN_BITS+`SPI_MAX_CHAR-1)) mv (
		.in1({cnt_2, tip_2, s_out_2, data_2}),
		.in2({cnt_3, tip_3, s_out_3, data_3}),
		.in3({cnt, tip, s_out, data}),
		.out({cnt_1, tip_1, s_out_1, data_1}),
		.err()
	);
endmodule


`timescale 1ns / 1ps
 module spi_wb_interface_iostate (
		wb_clk_in, wb_rst_in, wb_adr_in, wb_dat_in, wb_dat_out_i, wb_dat_out_o,
		wb_sel_in, wb_we_in, wb_stb_in, wb_cyc_in,
            wb_ack_out_i, wb_ack_out_o, wb_err_out, wb_int_out_i, wb_int_out_o,
  		divider_i, divider_o, ctrl_i, ctrl_o, ss_i, ss_o, rx, ie, tip, last_bit, pos_edge,
		spi_divider_sel, spi_ctrl_sel, spi_tx_sel, spi_ss_sel
	);


  input                            wb_clk_in;         
  input				     ie; 
  input     [`SPI_CTRL_BIT_NB-1:0] ctrl_i;             
  input     [`SPI_DIVIDER_LEN-1:0] divider_i;          
  input				     tip;
  input				     last_bit;
  input				     pos_edge;
  input                            wb_rst_in;         
  input                      [4:0] wb_adr_in;         
  input                   [32-1:0] wb_dat_in;         
  output                  [32-1:0] wb_dat_out_o; 
  output    [`SPI_CTRL_BIT_NB-1:0] ctrl_o;
  output          [`SPI_SS_NB-1:0] ss_o;
  input           [`SPI_SS_NB-1:0] ss_i;               

  output                           spi_divider_sel;  
  output                           spi_ctrl_sel;      
  output                     [3:0] spi_tx_sel;       
  output                           spi_ss_sel;  


  input                  [32-1:0] wb_dat_out_i;         
  input                      [3:0] wb_sel_in;         
  input                            wb_we_in;          
  input                            wb_stb_in;         
  input                            wb_cyc_in;        
  output                           wb_ack_out_o;
  input                            wb_ack_out_i;         
  output                           wb_err_out;         
  output                           wb_int_out_o;
  input                            wb_int_out_i;
  
  input	   [`SPI_MAX_CHAR-1:0] rx;
  output    [`SPI_DIVIDER_LEN-1:0] divider_o;  reg                     [32-1:0] wb_dat_out_o;
  reg                              wb_ack_out_o;
  reg                              wb_int_out_o;
  reg       [`SPI_DIVIDER_LEN-1:0] divider_o;          
  reg       [`SPI_CTRL_BIT_NB-1:0] ctrl_o;             
  reg             [`SPI_SS_NB-1:0] ss_o;               
  reg                     [32-1:0] wb_datM; 
  wire  				     spi_go_sel;

  assign spi_divider_sel = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `SPI_DEVIDE);
  assign spi_ctrl_sel    = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `SPI_CTRL);
  assign spi_tx_sel[0]   = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `SPI_TX_0);
  assign spi_tx_sel[1]   = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `SPI_TX_1);
  assign spi_tx_sel[2]   = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `SPI_TX_2);
  assign spi_tx_sel[3]   = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `SPI_TX_3);
  assign spi_ss_sel      = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `SPI_SS);  
  assign spi_go_sel      = wb_cyc_in & wb_stb_in & (wb_adr_in[`SPI_OFS_BITS] == `SPI_GO_REG);
  assign wb_err_out = 1'b0;
	
  always @(wb_adr_in or rx or ctrl_i or divider_i or ss_i)
  begin
    case (wb_adr_in[`SPI_OFS_BITS])
      `SPI_RX_0:    wb_datM = rx[31:0];
      `SPI_RX_1:    wb_datM = rx[63:32];
      `SPI_RX_2:    wb_datM = rx[95:64];
      `SPI_RX_3:    wb_datM = {{128-`SPI_MAX_CHAR{1'b0}}, rx[`SPI_MAX_CHAR-1:96]};
      `SPI_CTRL:    wb_datM = {{32-`SPI_CTRL_BIT_NB{1'b0}}, ctrl_i};
      `SPI_DEVIDE:  wb_datM = {{32-`SPI_DIVIDER_LEN{1'b0}}, divider_i};
      `SPI_SS:      wb_datM = {{32-`SPI_SS_NB{1'b0}}, ss_i};
	`SPI_GO_REG:  wb_datM = {31'h0,ctrl_i[`SPI_CTRL_GO]};
      default:      wb_datM = 32'bx;
    endcase
  end
  
  
  always @(posedge wb_clk_in or posedge wb_rst_in)
  begin
    if (wb_rst_in)
      wb_dat_out_o <=#1   32'b0;
    else
      wb_dat_out_o <=#1   wb_datM;
  end
  
  
  always @(posedge wb_clk_in or posedge wb_rst_in)
  begin
    if (wb_rst_in)
      wb_ack_out_o <=#1   1'b0;
    else
      wb_ack_out_o <=#1   wb_cyc_in & wb_stb_in & ~wb_ack_out_i;
  end
  

  always @(posedge wb_clk_in or posedge wb_rst_in)
  begin
    if (wb_rst_in)
      wb_int_out_o <=#1   1'b0;
    else if (ie && tip && last_bit && pos_edge)
      wb_int_out_o <=#1   1'b1;
    else if (wb_ack_out_i)
      wb_int_out_o <=#1   1'b0;
    else 
	wb_int_out_o <=#1   wb_int_out_i;
  end
  
  
  always @(posedge wb_clk_in or posedge wb_rst_in)
  begin
    if (wb_rst_in)
        divider_o <=#1   {`SPI_DIVIDER_LEN{1'b0}};
    else begin
	divider_o <=#1   divider_i;
	if (spi_divider_sel && wb_we_in && !tip)
      begin
        if (wb_sel_in[0])
          divider_o[7:0] <=#1   wb_dat_in[7:0];
        if (wb_sel_in[1])
          divider_o[`SPI_DIVIDER_LEN-1:8] <=#1   wb_dat_in[`SPI_DIVIDER_LEN-1:8];
      end
    end
  end
  
  
	always @(posedge wb_clk_in or posedge wb_rst_in) begin
		if (wb_rst_in) begin
			ctrl_o <=#1   {`SPI_CTRL_BIT_NB{1'b0}};
			ctrl_o[`SPI_CTRL_GO]         <=#1   1'b0;                            
			ctrl_o[`SPI_CTRL_IE]         <=#1   1'b1;                            
			ctrl_o[`SPI_CTRL_RX_NEGEDGE] <=#1   1'b0;
			ctrl_o[`SPI_CTRL_TX_NEGEDGE] <=#1   1'b0;
			ctrl_o[`SPI_CTRL_LSB]        <=#1   1'b0;
			ctrl_o[`SPI_CTRL_ASS]        <=#1   1'b0;
			ctrl_o[`SPI_CTRL_CHAR_LEN]   <=#1   7'h0;
			ctrl_o[`SPI_CTRL_INV_SCLK]   <=#1   1'b0;
		end
		else begin
			ctrl_o <=#1   ctrl_i;
			if(spi_go_sel && wb_we_in && !tip) begin
				if (wb_sel_in[0])
					ctrl_o[`SPI_CTRL_GO] <=#1   1'b1;
					ctrl_o[`SPI_CTRL_IE] <=#1   1'b1; //change 1-Oct-2015
			end
			else if(spi_ctrl_sel && wb_we_in && !tip) begin
				if (wb_sel_in[0])
					ctrl_o[`SPI_CTRL_CHAR_LEN] <=#1   wb_dat_in[`SPI_CTRL_CHAR_LEN];     //change 1-Oct-2015
					ctrl_o[`SPI_CTRL_INV_SCLK] <=#1   wb_dat_in[`SPI_CTRL_INV_SCLK];     //change 1-Oct-2015
				if (wb_sel_in[1]) begin					
					ctrl_o[`SPI_CTRL_GO]         <=#1   1'b0;                            //change 1-Oct-2015
					ctrl_o[`SPI_CTRL_IE]         <=#1   1'b1;                            //change 1-Oct-2015
					ctrl_o[`SPI_CTRL_RX_NEGEDGE] <=#1   wb_dat_in[`SPI_CTRL_RX_NEGEDGE]; //change 1-Oct-2015
					ctrl_o[`SPI_CTRL_TX_NEGEDGE] <=#1   wb_dat_in[`SPI_CTRL_TX_NEGEDGE]; //change 1-Oct-2015
					ctrl_o[`SPI_CTRL_LSB]        <=#1   wb_dat_in[`SPI_CTRL_LSB];        //change 1-Oct-2015
					ctrl_o[`SPI_CTRL_ASS]        <=#1   wb_dat_in[`SPI_CTRL_ASS];        //change 1-Oct-2015
				end					
			end
			else if(tip && last_bit && pos_edge) begin
				ctrl_o[`SPI_CTRL_GO] <=#1   1'b0;
			end
		end
	end
  
  
  
  

  always @(posedge wb_clk_in or posedge wb_rst_in)
  begin
    if (wb_rst_in)
      ss_o <=#1   {`SPI_SS_NB{1'b0}};
    else begin
	ss_o <=#1   ss_i;
	if(spi_ss_sel && wb_we_in && !tip)
      begin
         if (wb_sel_in[0])
          ss_o <=#1   wb_dat_in[`SPI_SS_NB-1:0];
      end
    end
  end

endmodule



 module spi_wb_interface_tri (
		wb_clk_in_1, wb_clk_in_2, wb_clk_in_3, wb_rst_in_1, wb_rst_in_2, wb_rst_in_3, wb_adr_in_1, wb_adr_in_2, wb_adr_in_3, wb_dat_in_1, wb_dat_in_2, wb_dat_in_3, wb_dat_out_1, wb_dat_out_2, wb_dat_out_3,
		wb_sel_in_1, wb_sel_in_2, wb_sel_in_3, wb_we_in_1, wb_we_in_2, wb_we_in_3, wb_stb_in_1, wb_stb_in_2, wb_stb_in_3, wb_cyc_in_1, wb_cyc_in_2, wb_cyc_in_3,
            wb_ack_out_1, wb_ack_out_2, wb_ack_out_3, wb_err_out_1, wb_err_out_2, wb_err_out_3, wb_int_out_1, wb_int_out_2, wb_int_out_3,
  		divider_1, divider_2, divider_3, ctrl_1, ctrl_2, ctrl_3, ss_1, ss_2, ss_3, rx_1, rx_2, rx_3, ie_1, ie_2, ie_3, tip_1, tip_2, tip_3, last_bit_1, last_bit_2, last_bit_3, pos_edge_1, pos_edge_2, pos_edge_3,
		spi_divider_sel_1, spi_divider_sel_2, spi_divider_sel_3, spi_ctrl_sel_1, spi_ctrl_sel_2, spi_ctrl_sel_3, spi_tx_sel_1, spi_tx_sel_2, spi_tx_sel_3, spi_ss_sel_1, spi_ss_sel_2, spi_ss_sel_3
	);

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

  input	   [`SPI_MAX_CHAR-1:0] rx_1, rx_2, rx_3;
  input				     ie_1, ie_2, ie_3;
  input				     tip_1, tip_2, tip_3;
  input				     last_bit_1, last_bit_2, last_bit_3;
  input				     pos_edge_1, pos_edge_2, pos_edge_3;
  output    [`SPI_DIVIDER_LEN-1:0] divider_1, divider_2, divider_3;          
  output    [`SPI_CTRL_BIT_NB-1:0] ctrl_1, ctrl_2, ctrl_3;             
  output          [`SPI_SS_NB-1:0] ss_1, ss_2, ss_3;               

  output                           spi_divider_sel_1, spi_divider_sel_2, spi_divider_sel_3;  
  output                           spi_ctrl_sel_1, spi_ctrl_sel_2, spi_ctrl_sel_3;     
  output                     [3:0] spi_tx_sel_1, spi_tx_sel_2, spi_tx_sel_3;       
  output                           spi_ss_sel_1, spi_ss_sel_2, spi_ss_sel_3;  

	wire [32-1:0] wb_dat_out_1, wb_dat_out_2, wb_dat_out_3;
	wire wb_ack_out_1, wb_ack_out_2, wb_ack_out_3;
	wire wb_int_out_1, wb_int_out_2, wb_int_out_3;
	wire [`SPI_DIVIDER_LEN-1:0] divider_1, divider_2, divider_3;
	wire [`SPI_CTRL_BIT_NB-1:0] ctrl_1, ctrl_2, ctrl_3;
	wire [`SPI_SS_NB-1:0] ss_1, ss_2, ss_3;
	wire [32-1:0] wb_dat_out;
	wire wb_ack_out;
	wire wb_int_out;
	wire [`SPI_DIVIDER_LEN-1:0] divider;
	wire [`SPI_CTRL_BIT_NB-1:0] ctrl;
	wire [`SPI_SS_NB-1:0] ss;

 	spi_wb_interface_iostate spi_wb_interface_iostate_1   (
		.wb_clk_in(wb_clk_in_1), .wb_rst_in(wb_rst_in_1), .wb_adr_in(wb_adr_in_1), .wb_dat_in(wb_dat_in_1), .wb_dat_out_i(wb_dat_out_1), .wb_dat_out_o(wb_dat_out_2),
		.wb_sel_in(wb_sel_in_1), .wb_we_in(wb_we_in_1), .wb_stb_in(wb_stb_in_1), .wb_cyc_in(wb_cyc_in_1),
            .wb_ack_out_i(wb_ack_out_1), .wb_ack_out_o(wb_ack_out_2), .wb_err_out(wb_err_out_1), .wb_int_out_i(wb_int_out_1), .wb_int_out_o(wb_int_out_2),
  		.divider_i(divider_1), .divider_o(divider_2), .ctrl_i(ctrl_1), .ctrl_o(ctrl_2), .ss_i(ss_1), .ss_o(ss_2), .rx(rx_1), .ie(ie_1), .tip(tip_1), .last_bit(last_bit_1), .pos_edge(pos_edge_1),
		.spi_divider_sel(spi_divider_sel_1), .spi_ctrl_sel(spi_ctrl_sel_1), .spi_tx_sel(spi_tx_sel_1), .spi_ss_sel(spi_ss_sel_1));

 	spi_wb_interface_iostate spi_wb_interface_iostate_2   (
		.wb_clk_in(wb_clk_in_2), .wb_rst_in(wb_rst_in_2), .wb_adr_in(wb_adr_in_2), .wb_dat_in(wb_dat_in_2), .wb_dat_out_i(wb_dat_out_2), .wb_dat_out_o(wb_dat_out_3),
		.wb_sel_in(wb_sel_in_2), .wb_we_in(wb_we_in_2), .wb_stb_in(wb_stb_in_2), .wb_cyc_in(wb_cyc_in_2),
            .wb_ack_out_i(wb_ack_out_2), .wb_ack_out_o(wb_ack_out_3), .wb_err_out(wb_err_out_2), .wb_int_out_i(wb_int_out_2), .wb_int_out_o(wb_int_out_3),
  		.divider_i(divider_2), .divider_o(divider_3), .ctrl_i(ctrl_2), .ctrl_o(ctrl_3), .ss_i(ss_2), .ss_o(ss_3), .rx(rx_2), .ie(ie_2), .tip(tip_2), .last_bit(last_bit_2), .pos_edge(pos_edge_2),
		.spi_divider_sel(spi_divider_sel_2), .spi_ctrl_sel(spi_ctrl_sel_2), .spi_tx_sel(spi_tx_sel_2), .spi_ss_sel(spi_ss_sel_2));

 	spi_wb_interface_iostate spi_wb_interface_iostate_3   (
		.wb_clk_in(wb_clk_in_3), .wb_rst_in(wb_rst_in_3), .wb_adr_in(wb_adr_in_3), .wb_dat_in(wb_dat_in_3), .wb_dat_out_i(wb_dat_out_3), .wb_dat_out_o(wb_dat_out),
		.wb_sel_in(wb_sel_in_3), .wb_we_in(wb_we_in_3), .wb_stb_in(wb_stb_in_3), .wb_cyc_in(wb_cyc_in_3),
            .wb_ack_out_i(wb_ack_out_3), .wb_ack_out_o(wb_ack_out), .wb_err_out(wb_err_out_3), .wb_int_out_i(wb_int_out_3), .wb_int_out_o(wb_int_out),
  		.divider_i(divider_3), .divider_o(divider), .ctrl_i(ctrl_3), .ctrl_o(ctrl), .ss_i(ss_3), .ss_o(ss), .rx(rx_3), .ie(ie_3), .tip(tip_3), .last_bit(last_bit_3), .pos_edge(pos_edge_3),
		.spi_divider_sel(spi_divider_sel_3), .spi_ctrl_sel(spi_ctrl_sel_3), .spi_tx_sel(spi_tx_sel_3), .spi_ss_sel(spi_ss_sel_3));

	majority_voter #(.WIDTH(6+32-1+`SPI_DIVIDER_LEN-1+`SPI_CTRL_BIT_NB-1+`SPI_SS_NB-1)) mv (
		.in1({wb_dat_out_2, wb_ack_out_2, wb_int_out_2, divider_2, ctrl_2, ss_2}),
		.in2({wb_dat_out_3, wb_ack_out_3, wb_int_out_3, divider_3, ctrl_3, ss_3}),
		.in3({wb_dat_out, wb_ack_out, wb_int_out, divider, ctrl, ss}),
		.out({wb_dat_out_1, wb_ack_out_1, wb_int_out_1, divider_1, ctrl_1, ss_1}),
		.err()
	);
endmodule

