

/////////////////////////////////////////////////////////////////////////////
// Design Name:    GBT_SCA                                                 //
// Module Name:    JTAG_Master_Top (TRI Version)                           //
// Made by:        Alessandro Caratelli                                    //
//                                                                         //
// Description:    JTAG Master fully configurable Wishbon compatible       //
// Company:        CERN (PH-ESE)                                           //
// Create Date:    11/April/2013-Created                                   //
// Last modif:     1 October 2015 (for GBT-SCA V2.0)                       //
//                                                                         //
/////////////////////////////////////////////////////////////////////////////


`include "JTAG_define.v"
`include "global_defines.v"


module JTAG_Master_Top_tri (
	 output        TCK_pad_o_1, TCK_pad_o_2, TCK_pad_o_3,         
	 input         TDI_pad_i_1, TDI_pad_i_2, TDI_pad_i_3,         
	 output        TDO_pad_o_1, TDO_pad_o_2, TDO_pad_o_3,  
	 output        TMS_pad_o_1, TMS_pad_o_2, TMS_pad_o_3,      
	 output        RST_pad_o_1, RST_pad_o_2, RST_pad_o_3,      
	 input         wb_clk_i_1,  wb_clk_i_2,  wb_clk_i_3,         
	 input         wb_rst_i_1,  wb_rst_i_2,  wb_rst_i_3,         
	 input   [5:0] wb_adr_i_1,  wb_adr_i_2,  wb_adr_i_3,       
	 input  [31:0] wb_dat_i_1,  wb_dat_i_2,  wb_dat_i_3,      
	 output [31:0] wb_dat_o_1,  wb_dat_o_2,  wb_dat_o_3,    
	 input   [3:0] wb_sel_i_1,  wb_sel_i_2,  wb_sel_i_3,        
	 input         wb_we_i_1,   wb_we_i_2,   wb_we_i_3,         
	 input         wb_stb_i_1,  wb_stb_i_2,  wb_stb_i_3,       
	 input         wb_cyc_i_1,  wb_cyc_i_2,  wb_cyc_i_3,       
	 output        wb_ack_o_1,  wb_ack_o_2,  wb_ack_o_3,        
	 output        wb_err_o_1,  wb_err_o_2,  wb_err_o_3,         
	 output        wb_int_o_1,  wb_int_o_2,  wb_int_o_3
	`ifdef WithSEUcounter                                               
	,output SEUclear_1,SEUclear_2,SEUclear_3,
	 input  [`SEUcnt_nbit-1:0] SEU_cnt_1, SEU_cnt_2, SEU_cnt_3
	`endif	         
);

	wire    [`JTAG_MaxTrLen-1:0] rx_1,               rx_2,               rx_3;
	wire    [`JTAG_MaxTrLen-1:0] TMStx_1,            TMStx_2,            TMStx_3;
	wire       [`JTAG_NBits-1:0] char_len_1,         char_len_2,         char_len_3;
	wire [`JTAVDivFregLEN-1:0]   divider_1,          divider_2,          divider_3;
	wire [`JTAG_CTRL_BIT_NB-1:0] ctrl_1,             ctrl_2,             ctrl_3;
	
	wire [3:0] JTAG_TDO_txsel_1,   JTAG_TDO_txsel_2,   JTAG_TDO_txsel_3;
	wire [3:0] JTAG_TMS_txsel_1,   JTAG_TMS_txsel_2,   JTAG_TMS_txsel_3;
	wire	   Inv_RxEdge_1,       Inv_RxEdge_2,	   Inv_RxEdge_3;
	wire	   Inv_TxEdge_1,       Inv_TxEdge_2,	   Inv_TxEdge_3;
	wire	   go_1,	       go_2,		   go_3;
	wire	   SendReset_1,        SendReset_2,	   SendReset_3;
	wire	   lsb_1,	       lsb_2,		   lsb_3;
	wire	   ie_1,	       ie_2,		   ie_3;
	wire	   Inv_IdlSt_1,        Inv_IdlSt_2,	   Inv_IdlSt_3;
	wire	   JTAG_divider_sel_1, JTAG_divider_sel_2, JTAG_divider_sel_3;
	wire	   JTAG_ctrl_sel_1,    JTAG_ctrl_sel_2,    JTAG_ctrl_sel_3;
	wire	   tip_1,	       tip_2,		   tip_3;
	wire	   pos_edge_1,         pos_edge_2,	   pos_edge_3;
	wire	   neg_edge_1,         neg_edge_2,	   neg_edge_3;
	wire	   last_bit_1,         last_bit_2,	   last_bit_3;
	wire	   rst_done_1,         rst_done_2,	   rst_done_3;
	wire	   sclk_o_1,	       sclk_o_2,	   sclk_o_3;



	JTAG_WB_Interface_tri JTAG__WB_Interface (

                  `ifdef WithSEUcounter
                        .SEUclear_1(SEUclear_1),
                        .SEUclear_2(SEUclear_2),
                        .SEUclear_3(SEUclear_3),
                        .SEU_cnt_1(SEU_cnt_1), 
                        .SEU_cnt_2(SEU_cnt_2), 
                        .SEU_cnt_3(SEU_cnt_3),
                  `endif

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
			.rx_1(rx_1), 
			.TMStx_1(TMStx_1), 
			.tip_1(tip_1), 
			.pos_edge_1(pos_edge_1), 
			.neg_edge_1(neg_edge_1), 
			.last_bit_1(last_bit_1), 
			.divider_1(divider_1), 
			.ctrl_1(ctrl_1), 
			.ie_1(ie_1), 
			.rst_done_1(rst_done_1), 
			.JTAG_divider_sel_1(JTAG_divider_sel_1), 
			.JTAG_ctrl_sel_1(JTAG_ctrl_sel_1), 
			.JTAG_TDO_txsel_1(JTAG_TDO_txsel_1), 
			.JTAG_TMS_txsel_1(JTAG_TMS_txsel_1),
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
			.rx_2(rx_2), 
			.TMStx_2(TMStx_2), 
			.tip_2(tip_2), 
			.pos_edge_2(pos_edge_2), 
			.neg_edge_2(neg_edge_2), 
			.last_bit_2(last_bit_2), 
			.divider_2(divider_2), 
			.ctrl_2(ctrl_2), 
			.ie_2(ie_2), 
			.rst_done_2(rst_done_2), 
			.JTAG_divider_sel_2(JTAG_divider_sel_2), 
			.JTAG_ctrl_sel_2(JTAG_ctrl_sel_2), 
			.JTAG_TDO_txsel_2(JTAG_TDO_txsel_2), 
			.JTAG_TMS_txsel_2(JTAG_TMS_txsel_2),
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
			.rx_3(rx_3), 
			.TMStx_3(TMStx_3), 
			.tip_3(tip_3), 
			.pos_edge_3(pos_edge_3), 
			.neg_edge_3(neg_edge_3), 
			.last_bit_3(last_bit_3), 
			.divider_3(divider_3), 
			.ctrl_3(ctrl_3), 
			.ie_3(ie_3), 
			.rst_done_3(rst_done_3), 
			.JTAG_divider_sel_3(JTAG_divider_sel_3), 
			.JTAG_ctrl_sel_3(JTAG_ctrl_sel_3), 
			.JTAG_TDO_txsel_3(JTAG_TDO_txsel_3), 
			.JTAG_TMS_txsel_3(JTAG_TMS_txsel_3)
	);


	JTAG_clock_gen_tri JTAG__clock_gen (	
			.clk_in_1(wb_clk_i_1), 
			.rst_1(wb_rst_i_1), 
			.go_1(go_1 && ~SendReset_1), 
			.enable_1(tip_1), 
			.last_clk_1(last_bit_1),
			.divider_1(divider_1), 
			.clk_out_1(sclk_o_1), 
			.pos_edge_1(pos_edge_1), 
			.neg_edge_1(neg_edge_1),
		.clk_in_2(wb_clk_i_2), 
			.rst_2(wb_rst_i_2), 
			.go_2(go_2 && ~SendReset_2), 
			.enable_2(tip_2), 
			.last_clk_2(last_bit_2),
			.divider_2(divider_2), 
			.clk_out_2(sclk_o_2), 
			.pos_edge_2(pos_edge_2), 
			.neg_edge_2(neg_edge_2),
		.clk_in_3(wb_clk_i_3), 
			.rst_3(wb_rst_i_3), 
			.go_3(go_3 && ~SendReset_3), 
			.enable_3(tip_3), 
			.last_clk_3(last_bit_3),
			.divider_3(divider_3), 
			.clk_out_3(sclk_o_3), 
			.pos_edge_3(pos_edge_3), 
			.neg_edge_3(neg_edge_3)
	);


	JTAG_areset_tri JTAG__areset (
			.clk_1(wb_clk_i_1),			//system clock
			.rst_1(wb_rst_i_1),			//system reset
			.SendReset_1(SendReset_1),		//GO sygnal for sending asyncronous reset
			.Inv_IdlSt_1(Inv_IdlSt_1),		//it inverts the level (standard active low)
			.len_1(char_len_1[`JTAG_NBits-1:0]),
			.rst_done_1(rst_done_1),
			.reset_pad_o_1(RST_pad_o_1),
		.clk_2(wb_clk_i_2),				//system clock
			.rst_2(wb_rst_i_2),			//system reset
			.SendReset_2(SendReset_2),		//GO sygnal for sending asyncronous reset
			.Inv_IdlSt_2(Inv_IdlSt_2),		//it inverts the level (standard active low)
			.len_2(char_len_2[`JTAG_NBits-1:0]),
			.rst_done_2(rst_done_2),
			.reset_pad_o_2(RST_pad_o_2),
		.clk_3(wb_clk_i_3),				//system clock
			.rst_3(wb_rst_i_3),			//system reset
			.SendReset_3(SendReset_3),		//GO sygnal for sending asyncronous reset
			.Inv_IdlSt_3(Inv_IdlSt_3),		//it inverts the level (standard active low)
			.len_3(char_len_3[`JTAG_NBits-1:0]),
			.rst_done_3(rst_done_3),
			.reset_pad_o_3(RST_pad_o_3)
	);


	JTAG_shift_tri JTAG__shift (
			.clk_1(wb_clk_i_1), 
			.rst_1(wb_rst_i_1), 
			.len_1(char_len_1[`JTAG_NBits-1:0]),
			.lsb_1(lsb_1), 
			.go_1(go_1 && ~SendReset_1), 
			.pos_edge_1(pos_edge_1), 
			.neg_edge_1(neg_edge_1), 
			.Inv_RxEdge_1(Inv_RxEdge_1), 
			.Inv_TxEdge_1(Inv_TxEdge_1),
			.Inv_IdlSt_1(Inv_IdlSt_1),
			.tip_1(tip_1), 
			.last_1(last_bit_1),
			.p_in_1(wb_dat_i_1), 
			.dataTDO_1(rx_1),
			.dataTMS_1(TMStx_1),
			.latchTDO_1(JTAG_TDO_txsel_1[3:0] & {4{wb_we_i_1}}), 
			.latchTMS_1(JTAG_TMS_txsel_1[3:0] & {4{wb_we_i_1}}), 
			.byte_sel_1(wb_sel_i_1),
			.s_in_1(TDI_pad_i_1), 
			.s_outTDO_1(TDO_pad_o_1),
			.s_outTMS_1(TMS_pad_o_1),
		.clk_2(wb_clk_i_2), 
			.rst_2(wb_rst_i_2), 
			.len_2(char_len_2[`JTAG_NBits-1:0]),
			.lsb_2(lsb_2), 
			.go_2(go_2 && ~SendReset_2), 
			.pos_edge_2(pos_edge_2), 
			.neg_edge_2(neg_edge_2), 
			.Inv_RxEdge_2(Inv_RxEdge_2), 
			.Inv_TxEdge_2(Inv_TxEdge_2),
			.Inv_IdlSt_2(Inv_IdlSt_2),
			.tip_2(tip_2), 
			.last_2(last_bit_2),
			.p_in_2(wb_dat_i_2), 
			.dataTDO_2(rx_2),
			.dataTMS_2(TMStx_2),
			.latchTDO_2(JTAG_TDO_txsel_2[3:0] & {4{wb_we_i_2}}), 
			.latchTMS_2(JTAG_TMS_txsel_2[3:0] & {4{wb_we_i_2}}), 
			.byte_sel_2(wb_sel_i_2),
			.s_in_2(TDI_pad_i_2), 
			.s_outTDO_2(TDO_pad_o_2),
			.s_outTMS_2(TMS_pad_o_2),
		.clk_3(wb_clk_i_3), 
			.rst_3(wb_rst_i_3), 
			.len_3(char_len_3[`JTAG_NBits-1:0]),
			.lsb_3(lsb_3), 
			.go_3(go_3 && ~SendReset_3), 
			.pos_edge_3(pos_edge_3), 
			.neg_edge_3(neg_edge_3), 
			.Inv_RxEdge_3(Inv_RxEdge_3), 
			.Inv_TxEdge_3(Inv_TxEdge_3),
			.Inv_IdlSt_3(Inv_IdlSt_3),
			.tip_3(tip_3), 
			.last_3(last_bit_3),
			.p_in_3(wb_dat_i_3), 
			.dataTDO_3(rx_3),
			.dataTMS_3(TMStx_3),
			.latchTDO_3(JTAG_TDO_txsel_3[3:0] & {4{wb_we_i_3}}), 
			.latchTMS_3(JTAG_TMS_txsel_3[3:0] & {4{wb_we_i_3}}), 
			.byte_sel_3(wb_sel_i_3),
			.s_in_3(TDI_pad_i_3), 
			.s_outTDO_3(TDO_pad_o_3),
			.s_outTMS_3(TMS_pad_o_3)
	);


	assign Inv_IdlSt_1        =  ctrl_1[`JTAG_CTRL_Inv_IdlSt];
	assign Inv_IdlSt_2        =  ctrl_2[`JTAG_CTRL_Inv_IdlSt];
	assign Inv_IdlSt_3        =  ctrl_3[`JTAG_CTRL_Inv_IdlSt];

	assign go_1               =  ctrl_1[`JTAG_CTRL_GO];
	assign go_2               =  ctrl_2[`JTAG_CTRL_GO];
	assign go_3               =  ctrl_3[`JTAG_CTRL_GO];

	assign char_len_1         =  ctrl_1[`JTAG_CTRL_CHAR_LEN];
	assign char_len_2         =  ctrl_2[`JTAG_CTRL_CHAR_LEN];
	assign char_len_3         =  ctrl_3[`JTAG_CTRL_CHAR_LEN];

	assign lsb_1              = ~ctrl_1[`JTAG_CTRL_Inv_TrDir];
	assign lsb_2              = ~ctrl_2[`JTAG_CTRL_Inv_TrDir];
	assign lsb_3              = ~ctrl_3[`JTAG_CTRL_Inv_TrDir];

	assign ie_1             =  ctrl_1[`JTAG_CTRL_IE];  //01-Oct-2015
	assign ie_2             =  ctrl_2[`JTAG_CTRL_IE];  //01-Oct-2015
	assign ie_3             =  ctrl_3[`JTAG_CTRL_IE];  //01-Oct-2015

	//assign ie_1               =  1'b1;  //01-Oct-2015
	//assign ie_2               =  1'b1;  //01-Oct-2015
	//assign ie_3               =  1'b1;  //01-Oct-2015
	
	assign SendReset_1        =  ctrl_1[`JTAG_CTRL_RES];
	assign SendReset_2        =  ctrl_2[`JTAG_CTRL_RES];
	assign SendReset_3        =  ctrl_3[`JTAG_CTRL_RES];

	assign Inv_RxEdge_1       = (~Inv_IdlSt_1) ? ctrl_1[`JTAG_CTRL_Inv_RxEdge] : ~ctrl_1[`JTAG_CTRL_Inv_RxEdge];
	assign Inv_RxEdge_2       = (~Inv_IdlSt_2) ? ctrl_2[`JTAG_CTRL_Inv_RxEdge] : ~ctrl_2[`JTAG_CTRL_Inv_RxEdge];
	assign Inv_RxEdge_3       = (~Inv_IdlSt_3) ? ctrl_3[`JTAG_CTRL_Inv_RxEdge] : ~ctrl_3[`JTAG_CTRL_Inv_RxEdge];

	assign Inv_TxEdge_1       = (~Inv_IdlSt_1) ? ctrl_1[`JTAG_CTRL_Inv_TxEdge] : ~ctrl_1[`JTAG_CTRL_Inv_TxEdge];
	assign Inv_TxEdge_2       = (~Inv_IdlSt_2) ? ctrl_2[`JTAG_CTRL_Inv_TxEdge] : ~ctrl_2[`JTAG_CTRL_Inv_TxEdge];
	assign Inv_TxEdge_3       = (~Inv_IdlSt_3) ? ctrl_3[`JTAG_CTRL_Inv_TxEdge] : ~ctrl_3[`JTAG_CTRL_Inv_TxEdge];
	
	assign TCK_pad_o_1       = (Inv_IdlSt_1) ? sclk_o_1 : ~sclk_o_1;
	assign TCK_pad_o_2       = (Inv_IdlSt_2) ? sclk_o_2 : ~sclk_o_2;
	assign TCK_pad_o_3       = (Inv_IdlSt_3) ? sclk_o_3 : ~sclk_o_3;

	assign wb_err_o_1       = 1'b0;
	assign wb_err_o_2       = 1'b0;
	assign wb_err_o_3       = 1'b0;
endmodule


/////////////////////////////////////////////////////////////////////////////
// Design Name:    GBT_SCA                                                 //
// Module Name:    JTAG_areset (TRI Version)                               //
// Description:    JTAG Master fully configurable Wishbon compatible       //
// Company:        CERN (PH-ESE)                                           //
// Made by:        Alessandro Caratelli                                    //
// Create Date:    11/April/2013-Created                                   //
//                 27/June/2013-Small Modifications                        //
/////////////////////////////////////////////////////////////////////////////
`include "JTAG_define.v"
module JTAG_areset_iostate (clk,rst,SendReset,Inv_IdlSt,len,rst_done,reset_pad_o, clkdiv_i, clkdiv_o, cnt_i, cnt_o, tip_i, tip_o);

  input                  clk;                                                      
  input                  tip_i;
  input  [`JTAG_NBits:0] cnt_i;
  input                  clkdiv_i;
  input                  rst;                   
  input                  SendReset;          
  input                  Inv_IdlSt;           
  input[`JTAG_NBits-1:0] len;
  output                 rst_done;            
  output                 tip_o;
  output [`JTAG_NBits:0] cnt_o;
  output                 clkdiv_o;
  output                 reset_pad_o;      
  
  reg    [`JTAG_NBits:0] cnt_o;
  reg                    tip_o;
  reg                    clkdiv_o;
  wire                   rst_done;
  wire                   reset_pad_o;
  
  assign rst_done = !(|cnt_i) ? 1'b1 : 1'b0;
  
  assign reset_pad_o = ~Inv_IdlSt ? (tip_i ? 1'b0 : 1'b1) : (tip_i ? 1'b1 : 1'b0);
  
  always @ (posedge clk or posedge rst) begin
    if(rst) clkdiv_o <= 1'b0;
       else clkdiv_o <= ~clkdiv_i;
      end
  
  always @(posedge clk or posedge rst) begin
    if(rst) 
      cnt_o <= {`JTAG_NBits+1{1'b1}};
    else
      if(~tip_i) 
                  cnt_o <= !(|len) ? `JTAG_NBits'b1 : {1'b0, len};
            else
                  cnt_o <= (clkdiv_i) ? (cnt_i - {{`JTAG_NBits{1'b0}}, 1'b1}) : cnt_i;
      end
      
      always @(posedge clk or posedge rst) begin
            if(rst) 
                  tip_o <= 1'b0;
            else begin
                  tip_o <= tip_i;
                  if(SendReset && ~tip_i) 
                        tip_o <=1'b1;
                  else 
                        if(tip_i)
                              tip_o <= !(|cnt_i) ? 1'b0 : 1'b1;
                        else
                              tip_o <= 1'b0;
                  end
            end      
endmodule

`include "JTAG_define.v"
module JTAG_areset_tri (clk_1, clk_2, clk_3,rst_1, rst_2, rst_3,SendReset_1, SendReset_2, SendReset_3,Inv_IdlSt_1, Inv_IdlSt_2, Inv_IdlSt_3,len_1, len_2, len_3,rst_done_1, rst_done_2, rst_done_3,reset_pad_o_1, reset_pad_o_2, reset_pad_o_3);

      input                    clk_1, clk_2, clk_3;      
      input                    rst_1, rst_2, rst_3;       
      input                    SendReset_1, SendReset_2, SendReset_3;      
      input                    Inv_IdlSt_1, Inv_IdlSt_2, Inv_IdlSt_3;      
      input  [`JTAG_NBits-1:0] len_1, len_2, len_3;
      output                   rst_done_1, rst_done_2, rst_done_3;            
      output                   reset_pad_o_1, reset_pad_o_2, reset_pad_o_3;      

      wire clkdiv_1, clkdiv_2, clkdiv_3;
      wire [`JTAG_NBits:0] cnt_1, cnt_2, cnt_3;
      wire tip_1, tip_2, tip_3;
      wire clkdiv;
      wire [`JTAG_NBits:0] cnt;
      wire tip;
      
      JTAG_areset_iostate JTAG_areset_iostate_1   (.clk(clk_1),.rst(rst_1),.SendReset(SendReset_1),.Inv_IdlSt(Inv_IdlSt_1),.len(len_1),.rst_done(rst_done_1),.reset_pad_o(reset_pad_o_1), .clkdiv_i(clkdiv_1), .clkdiv_o(clkdiv_2), .cnt_i(cnt_1), .cnt_o(cnt_2), .tip_i(tip_1), .tip_o(tip_2));

      JTAG_areset_iostate JTAG_areset_iostate_2   (.clk(clk_2),.rst(rst_2),.SendReset(SendReset_2),.Inv_IdlSt(Inv_IdlSt_2),.len(len_2),.rst_done(rst_done_2),.reset_pad_o(reset_pad_o_2), .clkdiv_i(clkdiv_2), .clkdiv_o(clkdiv_3), .cnt_i(cnt_2), .cnt_o(cnt_3), .tip_i(tip_2), .tip_o(tip_3));

      JTAG_areset_iostate JTAG_areset_iostate_3   (.clk(clk_3),.rst(rst_3),.SendReset(SendReset_3),.Inv_IdlSt(Inv_IdlSt_3),.len(len_3),.rst_done(rst_done_3),.reset_pad_o(reset_pad_o_3), .clkdiv_i(clkdiv_3), .clkdiv_o(clkdiv), .cnt_i(cnt_3), .cnt_o(cnt), .tip_i(tip_3), .tip_o(tip));

      majority_voter #(.WIDTH(3+`JTAG_NBits)) mv (
            .in1({clkdiv_2, cnt_2, tip_2}),
            .in2({clkdiv_3, cnt_3, tip_3}),
            .in3({clkdiv, cnt, tip}),
            .out({clkdiv_1, cnt_1, tip_1}),
            .err()
      );
endmodule





/////////////////////////////////////////////////////////////////////////////
// Design Name:    GBT_SCA                                                 //
// Module Name:    JTAG_clkgen(TRI Version)                                //
// Description:    JTAG Master fully configurable Wishbon compatible       //
// Company:        CERN (PH-ESE)                                           //
// Made by:        Alessandro Caratelli                                    //
// Create Date:    11/April/2013-Created                                   //
//                 27/June/2013-Small Modifications                        //
/////////////////////////////////////////////////////////////////////////////
`include "JTAG_define.v"
module JTAG_clock_gen_iostate (clk_in, rst, go, enable, last_clk, divider, clk_out_i, clk_out_o, pos_edge_i, pos_edge_o, neg_edge_i, neg_edge_o, cnt_i, cnt_o); 
  parameter Tp = 1;
  
  input  clk_in;   								
  input  neg_edge_i; 
  input  pos_edge_i; 								
  input  clk_out_i; 
  input  [`JTAVDivFregLEN-1:0] cnt_i;       // input clock (system clock)
  input  rst;      								// reset
  input  enable;  							 	// clock enable
  input  go;       								// start transfer
  input  last_clk; 								// last clock
  input  [`JTAVDivFregLEN-1:0] divider;  	// clock divider (output clock is divided by this value)
  output clk_out_o;                          
  reg    clk_out_o;
  output pos_edge_o;
  output neg_edge_o;
  output    [`JTAVDivFregLEN-1:0] cnt_o;
  reg    pos_edge_o;
  reg    neg_edge_o;                       
  wire   cnt_zero; 								// conter is equal to zero
  wire   cnt_one;  								// conter is equal to one
  reg    [`JTAVDivFregLEN-1:0] cnt_o;
	// clock counter 
  
  assign cnt_zero = cnt_i == {`JTAVDivFregLEN{1'b0}};
  assign cnt_one  = cnt_i == {{`JTAVDivFregLEN-1{1'b0}}, 1'b1};
  
  // Counter counts half period
  always @(posedge clk_in or posedge rst)
  begin
    if(rst)
      cnt_o <=  {`JTAVDivFregLEN{1'b1}};
    else
      begin
		   cnt_o <= cnt_i;
			if(!enable || cnt_zero)
				cnt_o <=  divider;
			else
				cnt_o <=  cnt_i - {{`JTAVDivFregLEN-1{1'b0}}, 1'b1};
      end
  end
  
  // clk_out is asserted every other half period
  always @(posedge clk_in or posedge rst)
  begin
    if(rst)
      clk_out_o <=  1'b0;
    else
      clk_out_o <=  (enable && cnt_zero && (!last_clk || clk_out_i)) ? ~clk_out_i : clk_out_i;
  end
   
  // Pos and neg edge signals
  always @(posedge clk_in or posedge rst)
  begin
    if(rst)
      begin
        pos_edge_o  <=  1'b0;
        neg_edge_o  <=  1'b0;
      end
    else
      begin
        pos_edge_o  <=  (enable && !clk_out_i && cnt_one) || (!(|divider) && clk_out_i) || (!(|divider) && go && !enable);
        neg_edge_o  <=  (enable && clk_out_i && cnt_one)  || (!(|divider) && !clk_out_i && enable);
      end
  end
endmodule

`include "JTAG_define.v"
module JTAG_clock_gen_tri (clk_in_1, clk_in_2, clk_in_3, rst_1, rst_2, rst_3, go_1, go_2, go_3, enable_1, enable_2, enable_3, last_clk_1, last_clk_2, last_clk_3, divider_1, divider_2, divider_3, clk_out_1, clk_out_2, clk_out_3, pos_edge_1, pos_edge_2, pos_edge_3, neg_edge_1, neg_edge_2, neg_edge_3);

	parameter Tp = 1;

	input  clk_in_1, clk_in_2, clk_in_3;   								
	input  rst_1, rst_2, rst_3;      								
	input  enable_1, enable_2, enable_3;  							 	
	input  go_1, go_2, go_3;       								
	input  last_clk_1, last_clk_2, last_clk_3; 								
	input  [`JTAVDivFregLEN-1:0] divider_1, divider_2, divider_3;  	
	output clk_out_1, clk_out_2, clk_out_3;  								
	output pos_edge_1, pos_edge_2, pos_edge_3; 								
	output neg_edge_1, neg_edge_2, neg_edge_3; 								

	wire [`JTAVDivFregLEN-1:0] cnt_1, cnt_2, cnt_3;
	wire clk_out_1, clk_out_2, clk_out_3;
	wire pos_edge_1, pos_edge_2, pos_edge_3;
	wire neg_edge_1, neg_edge_2, neg_edge_3;
	wire [`JTAVDivFregLEN-1:0] cnt;
	wire clk_out;
	wire pos_edge;
	wire neg_edge;

	JTAG_clock_gen_iostate #(.Tp(Tp) ) JTAG_clock_gen_iostate_1 (.clk_in(clk_in_1), .rst(rst_1), .go(go_1), .enable(enable_1), .last_clk(last_clk_1), .divider(divider_1), .clk_out_i(clk_out_1), .clk_out_o(clk_out_2), .pos_edge_i(pos_edge_1), .pos_edge_o(pos_edge_2), .neg_edge_i(neg_edge_1), .neg_edge_o(neg_edge_2), .cnt_i(cnt_1), .cnt_o(cnt_2));

	JTAG_clock_gen_iostate #(.Tp(Tp) ) JTAG_clock_gen_iostate_2 (.clk_in(clk_in_2), .rst(rst_2), .go(go_2), .enable(enable_2), .last_clk(last_clk_2), .divider(divider_2), .clk_out_i(clk_out_2), .clk_out_o(clk_out_3), .pos_edge_i(pos_edge_2), .pos_edge_o(pos_edge_3), .neg_edge_i(neg_edge_2), .neg_edge_o(neg_edge_3), .cnt_i(cnt_2), .cnt_o(cnt_3));

	JTAG_clock_gen_iostate #(.Tp(Tp) ) JTAG_clock_gen_iostate_3 (.clk_in(clk_in_3), .rst(rst_3), .go(go_3), .enable(enable_3), .last_clk(last_clk_3), .divider(divider_3), .clk_out_i(clk_out_3), .clk_out_o(clk_out), .pos_edge_i(pos_edge_3), .pos_edge_o(pos_edge), .neg_edge_i(neg_edge_3), .neg_edge_o(neg_edge), .cnt_i(cnt_3), .cnt_o(cnt));

	majority_voter #(.WIDTH(4+`JTAVDivFregLEN-1)) mv (
		.in1({cnt_2, clk_out_2, pos_edge_2, neg_edge_2}),
		.in2({cnt_3, clk_out_3, pos_edge_3, neg_edge_3}),
		.in3({cnt, clk_out, pos_edge, neg_edge}),
		.out({cnt_1, clk_out_1, pos_edge_1, neg_edge_1}),
		.err()
	);
endmodule





/////////////////////////////////////////////////////////////////////////////
// Design Name:    GBT_SCA                                                 //
// Module Name:    JTAG_shift (TRI Version)                                //
// Description:    JTAG Master fully configurable Wishbon compatible       //
// Company:        CERN (PH-ESE)                                           //
// Made by:        Alessandro Caratelli                                    //
// Create Date:    11/April/2013-Created                                   //
//                 27/June/2013-Small Modifications                        //
/////////////////////////////////////////////////////////////////////////////

`include "JTAG_define.v"
`timescale 1ns / 1ps
module JTAG_shift_iostate (clk, rst, latchTDO, latchTMS, byte_sel, len, lsb, go,
                  pos_edge, neg_edge, Inv_RxEdge, Inv_TxEdge,
                  tip_i, tip_o, last,  dataTMS_i, dataTMS_o,dataTDO_i, dataTDO_o,
                  p_in, s_in, s_outTDO,s_outTMS, Inv_IdlSt, cnt_i, cnt_o, serial_outTDO_i, serial_outTDO_o, serial_outTMS_i, serial_outTMS_o);

  parameter Tp = 1;
  
  input                      clk;                                             
  input [`JTAG_MaxTrLen-1:0] dataTDO_i;      
  input                      s_in;                                             
  input                      serial_outTMS_i;
  input                      serial_outTDO_i;
  input                      Inv_IdlSt;
  input      [`JTAG_NBits:0] cnt_i;      // system clock
  input                      rst;        // reset
  input                [3:0] latchTDO;   // latch signal for storing the data in shift register
  input                [3:0] latchTMS;   // latch signal for storing the data in shift register
  input                [3:0] byte_sel;   // byte select signals for storing the data in shift register
  input    [`JTAG_NBits-1:0] len;        // data len in bits (minus one)
  input                      lsb;        // lbs first on the line
  input                      go;         // start stansfer
  input                      pos_edge;   // recognize posedge of sclk
  input                      neg_edge;   // recognize negedge of sclk
  input                      Inv_RxEdge; // s_in is sampled on negative edge 
  input                      Inv_TxEdge; // s_out is driven on negative edge
  output                     tip_o;
  output[`JTAG_MaxTrLen-1:0] dataTDO_o;
  output                     s_outTDO;                                      
  output                     serial_outTMS_o;
  output                     serial_outTDO_o;
  output                     s_outTMS;                                      
  input                      tip_i;                                              
  output     [`JTAG_NBits:0] cnt_o;
  output                     last;                                             
  input               [31:0] p_in;                                  
  output[`JTAG_MaxTrLen-1:0] dataTMS_o;
  input [`JTAG_MaxTrLen-1:0] dataTMS_i;      
  
  
  reg                        serial_outTDO_o;
  reg                        serial_outTMS_o;
  wire                       s_outTDO, s_outTMS;
  reg                        tip_o;                         
  reg        [`JTAG_NBits:0] cnt_o;
  reg   [`JTAG_MaxTrLen-1:0] dataTDO_o; 
  reg   [`JTAG_MaxTrLen-1:0] dataTMS_o; 
  wire       [`JTAG_NBits:0] tx_bit_pos;   
  wire       [`JTAG_NBits:0] rx_bit_pos;   
  wire                       rx_clk;                                           
  wire                       tx_clk;                                           
              
  
  assign last = !(|cnt_i); //se zero
  
  assign rx_clk = (Inv_RxEdge ? pos_edge : neg_edge) && tip_i;
  
  assign tx_clk = (Inv_TxEdge ? neg_edge : pos_edge) && tip_i;
  
  assign tx_bit_pos = lsb ? ({!(|len), len} - cnt_i) : (cnt_i - {{`JTAG_NBits{1'b0}},1'b1});
  
  assign rx_bit_pos = lsb ? ({!(|len), len} - (~Inv_RxEdge ? cnt_i + {{`JTAG_NBits{1'b0}},1'b1} : cnt_i) ) : 
                            ( (~Inv_RxEdge ? cnt_i : cnt_i - {{`JTAG_NBits{1'b0}},1'b1}) );
									 
  // Character bit counter
  always @(posedge clk or posedge rst)
  begin
    if(rst)
      cnt_o <= #Tp {`JTAG_NBits+1{1'b0}};
    else
      begin
			cnt_o <= cnt_i;
			if(tip_i)
				cnt_o <= #Tp pos_edge ? (cnt_i - {{`JTAG_NBits{1'b0}}, 1'b1}) : cnt_i;
			else
				cnt_o <= #Tp !(|len) ? {1'b1, {`JTAG_NBits{1'b0}}} : {1'b0, len};
      end
	end
  
  // Transfer in progress
  always @(posedge clk or posedge rst)
  begin
   if(rst)
      	tip_o <= #Tp 1'b0;
  	else begin 
		if(go && ~tip_i)
    		tip_o <= #Tp 1'b1;
		else if(tip_i && last && pos_edge)
    		tip_o <= #Tp 1'b0;
		else tip_o <= #Tp tip_i; 
		end
  end
  
  // Sending bits to the line
  always @(posedge clk or posedge rst)
  begin
    if (rst)
      serial_outTDO_o   <= #Tp 1'b1;
    else
      serial_outTDO_o <= #Tp (tx_clk || !tip_i) ? dataTDO_i[tx_bit_pos[`JTAG_NBits-1:0]] : serial_outTDO_i;
  end
  
  assign s_outTDO = (tip_i) ? serial_outTDO_i : ~Inv_IdlSt;
  
  always @(posedge clk or posedge rst)
  begin
    if (rst)
      serial_outTMS_o   <= #Tp 1'b1;
    else
      serial_outTMS_o <= #Tp (tx_clk || !tip_i) ? dataTMS_i[tx_bit_pos[`JTAG_NBits-1:0]] : serial_outTMS_i;
  end
  assign s_outTMS = (tip_i) ? serial_outTMS_i : ~Inv_IdlSt;
  
  
  // Receiving bits from the line
  always @(posedge clk or posedge rst)
  begin
    if (rst)
      dataTDO_o   <= #Tp {`JTAG_MaxTrLen{1'b0}};

    else begin
			dataTDO_o <= dataTDO_i;
			if (latchTDO[0] && !tip_i)
			begin
			  if (byte_sel[3])
				 dataTDO_o[31:24] <= #Tp p_in[31:24];
			  if (byte_sel[2])
				 dataTDO_o[23:16] <= #Tp p_in[23:16];
			  if (byte_sel[1])
				 dataTDO_o[15:8] <= #Tp p_in[15:8];
			  if (byte_sel[0])
				 dataTDO_o[7:0] <= #Tp p_in[7:0];
			end
			else if (latchTDO[1] && !tip_i)
			begin
			  if (byte_sel[3])
				 dataTDO_o[63:56] <= #Tp p_in[31:24];
			  if (byte_sel[2])
				 dataTDO_o[55:48] <= #Tp p_in[23:16];
			  if (byte_sel[1])
				 dataTDO_o[47:40] <= #Tp p_in[15:8];
			  if (byte_sel[0])
				 dataTDO_o[39:32] <= #Tp p_in[7:0];
			end
			else if (latchTDO[2] && !tip_i)
			begin
			  if (byte_sel[3])
				 dataTDO_o[95:88] <= #Tp p_in[31:24];
			  if (byte_sel[2])
				 dataTDO_o[87:80] <= #Tp p_in[23:16];
			  if (byte_sel[1])
				 dataTDO_o[79:72] <= #Tp p_in[15:8];
			  if (byte_sel[0])
				 dataTDO_o[71:64] <= #Tp p_in[7:0];
			end
			else if (latchTDO[3] && !tip_i)
			begin
			  if (byte_sel[3])
				 dataTDO_o[127:120] <= #Tp p_in[31:24];
			  if (byte_sel[2])
				 dataTDO_o[119:112] <= #Tp p_in[23:16];
			  if (byte_sel[1])
				 dataTDO_o[111:104] <= #Tp p_in[15:8];
			  if (byte_sel[0])
				 dataTDO_o[103:96] <= #Tp p_in[7:0];
			end
			else dataTDO_o[rx_bit_pos[`JTAG_NBits-1:0]] <= #Tp rx_clk ? s_in : dataTDO_i[rx_bit_pos[`JTAG_NBits-1:0]];
		end
  end

 always @(posedge clk or posedge rst)
  begin
    if (rst)
      dataTMS_o   <= #Tp {`JTAG_MaxTrLen{1'b0}};
    else begin
		dataTMS_o   <= #Tp dataTMS_i;
		if (latchTMS[0] && !tip_i)
			begin
			  if (byte_sel[3])
				 dataTMS_o[31:24] <= #Tp p_in[31:24];
			  if (byte_sel[2])
				 dataTMS_o[23:16] <= #Tp p_in[23:16];
			  if (byte_sel[1])
				 dataTMS_o[15:8] <= #Tp p_in[15:8];
			  if (byte_sel[0])
				 dataTMS_o[7:0] <= #Tp p_in[7:0];
			end
			else if (latchTMS[1] && !tip_i)
			begin
			  if (byte_sel[3])
				 dataTMS_o[63:56] <= #Tp p_in[31:24];
			  if (byte_sel[2])
				 dataTMS_o[55:48] <= #Tp p_in[23:16];
			  if (byte_sel[1])
				 dataTMS_o[47:40] <= #Tp p_in[15:8];
			  if (byte_sel[0])
				 dataTMS_o[39:32] <= #Tp p_in[7:0];
			end
			else if (latchTMS[2] && !tip_i)
			begin
			  if (byte_sel[3])
				 dataTMS_o[95:88] <= #Tp p_in[31:24];
			  if (byte_sel[2])
				 dataTMS_o[87:80] <= #Tp p_in[23:16];
			  if (byte_sel[1])
				 dataTMS_o[79:72] <= #Tp p_in[15:8];
			  if (byte_sel[0])
				 dataTMS_o[71:64] <= #Tp p_in[7:0];
			end
			else if (latchTMS[3] && !tip_i)
			begin
			  if (byte_sel[3])
				 dataTMS_o[127:120] <= #Tp p_in[31:24];
			  if (byte_sel[2])
				 dataTMS_o[119:112] <= #Tp p_in[23:16];
			  if (byte_sel[1])
				 dataTMS_o[111:104] <= #Tp p_in[15:8];
			  if (byte_sel[0])
				 dataTMS_o[103:96] <= #Tp p_in[7:0];
			end
		end
   
  end 
endmodule 


`include "JTAG_define.v"

module JTAG_shift_tri (clk_1, clk_2, clk_3, rst_1, rst_2, rst_3, latchTDO_1, latchTDO_2, latchTDO_3, latchTMS_1, latchTMS_2, latchTMS_3, byte_sel_1, byte_sel_2, byte_sel_3, len_1, len_2, len_3, lsb_1, lsb_2, lsb_3, go_1, go_2, go_3,
                  pos_edge_1, pos_edge_2, pos_edge_3, neg_edge_1, neg_edge_2, neg_edge_3, Inv_RxEdge_1, Inv_RxEdge_2, Inv_RxEdge_3, Inv_TxEdge_1, Inv_TxEdge_2, Inv_TxEdge_3,
                  tip_1, tip_2, tip_3, last_1, last_2, last_3,  dataTMS_1, dataTMS_2, dataTMS_3,dataTDO_1, dataTDO_2, dataTDO_3,
                  p_in_1, p_in_2, p_in_3, s_in_1, s_in_2, s_in_3, s_outTDO_1, s_outTDO_2, s_outTDO_3,s_outTMS_1, s_outTMS_2, s_outTMS_3, Inv_IdlSt_1, Inv_IdlSt_2, Inv_IdlSt_3);

	input                       clk_1, clk_2, clk_3;         
	input                       rst_1, rst_2, rst_3;         
	input                 [3:0] latchTDO_1, latchTDO_2, latchTDO_3;     
	input                 [3:0] latchTMS_1, latchTMS_2, latchTMS_3;       
	input                 [3:0] byte_sel_1, byte_sel_2, byte_sel_3;     
	input     [`JTAG_NBits-1:0] len_1, len_2, len_3;         
	input                       lsb_1, lsb_2, lsb_3;         
	input                       go_1, go_2, go_3;          
	input                       pos_edge_1, pos_edge_2, pos_edge_3;     
	input                       neg_edge_1, neg_edge_2, neg_edge_3;     
	input                       Inv_RxEdge_1, Inv_RxEdge_2, Inv_RxEdge_3;    
	input                       Inv_TxEdge_1, Inv_TxEdge_2, Inv_TxEdge_3;   
	output                      tip_1, tip_2, tip_3;          
	output                      last_1, last_2, last_3;        
	input                [31:0] p_in_1, p_in_2, p_in_3;    
	output [`JTAG_MaxTrLen-1:0] dataTMS_1, dataTMS_2, dataTMS_3;
	output [`JTAG_MaxTrLen-1:0] dataTDO_1, dataTDO_2, dataTDO_3;
	input                       s_in_1, s_in_2, s_in_3;    
	output                      s_outTDO_1, s_outTDO_2, s_outTDO_3;        
	output                      s_outTMS_1, s_outTMS_2, s_outTMS_3;        
	input                       Inv_IdlSt_1, Inv_IdlSt_2, Inv_IdlSt_3;

	wire [`JTAG_NBits:0] cnt_1, cnt_2, cnt_3;
	wire tip_1, tip_2, tip_3;
	wire serial_outTDO_1, serial_outTDO_2, serial_outTDO_3;
	wire serial_outTMS_1, serial_outTMS_2, serial_outTMS_3;
	wire [`JTAG_MaxTrLen-1:0] dataTDO_1, dataTDO_2, dataTDO_3;
	wire [`JTAG_MaxTrLen-1:0] dataTMS_1, dataTMS_2, dataTMS_3;
	wire [`JTAG_NBits:0] cnt;
	wire tip;
	wire serial_outTDO;
	wire serial_outTMS;
	wire [`JTAG_MaxTrLen-1:0] dataTDO;
	wire [`JTAG_MaxTrLen-1:0] dataTMS;

	JTAG_shift_iostate #(.Tp(1) ) JTAG_shift_iostate_1 (.clk(clk_1), .rst(rst_1), .latchTDO(latchTDO_1), .latchTMS(latchTMS_1), .byte_sel(byte_sel_1), .len(len_1), .lsb(lsb_1), .go(go_1),
                  .pos_edge(pos_edge_1), .neg_edge(neg_edge_1), .Inv_RxEdge(Inv_RxEdge_1), .Inv_TxEdge(Inv_TxEdge_1),
                  .tip_i(tip_1), .tip_o(tip_2), .last(last_1),  .dataTMS_i(dataTMS_1), .dataTMS_o(dataTMS_2),.dataTDO_i(dataTDO_1), .dataTDO_o(dataTDO_2),
                  .p_in(p_in_1), .s_in(s_in_1), .s_outTDO(s_outTDO_1),.s_outTMS(s_outTMS_1), .Inv_IdlSt(Inv_IdlSt_1), .cnt_i(cnt_1), .cnt_o(cnt_2), .serial_outTDO_i(serial_outTDO_1), .serial_outTDO_o(serial_outTDO_2), .serial_outTMS_i(serial_outTMS_1), .serial_outTMS_o(serial_outTMS_2)); 

	JTAG_shift_iostate #(.Tp(1) ) JTAG_shift_iostate_2 (.clk(clk_2), .rst(rst_2), .latchTDO(latchTDO_2), .latchTMS(latchTMS_2), .byte_sel(byte_sel_2), .len(len_2), .lsb(lsb_2), .go(go_2),
                  .pos_edge(pos_edge_2), .neg_edge(neg_edge_2), .Inv_RxEdge(Inv_RxEdge_2), .Inv_TxEdge(Inv_TxEdge_2),
                  .tip_i(tip_2), .tip_o(tip_3), .last(last_2),  .dataTMS_i(dataTMS_2), .dataTMS_o(dataTMS_3),.dataTDO_i(dataTDO_2), .dataTDO_o(dataTDO_3),
                  .p_in(p_in_2), .s_in(s_in_2), .s_outTDO(s_outTDO_2),.s_outTMS(s_outTMS_2), .Inv_IdlSt(Inv_IdlSt_2), .cnt_i(cnt_2), .cnt_o(cnt_3), .serial_outTDO_i(serial_outTDO_2), .serial_outTDO_o(serial_outTDO_3), .serial_outTMS_i(serial_outTMS_2), .serial_outTMS_o(serial_outTMS_3)); 

	JTAG_shift_iostate #(.Tp(1) ) JTAG_shift_iostate_3 (.clk(clk_3), .rst(rst_3), .latchTDO(latchTDO_3), .latchTMS(latchTMS_3), .byte_sel(byte_sel_3), .len(len_3), .lsb(lsb_3), .go(go_3),
                  .pos_edge(pos_edge_3), .neg_edge(neg_edge_3), .Inv_RxEdge(Inv_RxEdge_3), .Inv_TxEdge(Inv_TxEdge_3),
                  .tip_i(tip_3), .tip_o(tip), .last(last_3),  .dataTMS_i(dataTMS_3), .dataTMS_o(dataTMS),.dataTDO_i(dataTDO_3), .dataTDO_o(dataTDO),
                  .p_in(p_in_3), .s_in(s_in_3), .s_outTDO(s_outTDO_3),.s_outTMS(s_outTMS_3), .Inv_IdlSt(Inv_IdlSt_3), .cnt_i(cnt_3), .cnt_o(cnt), .serial_outTDO_i(serial_outTDO_3), .serial_outTDO_o(serial_outTDO), .serial_outTMS_i(serial_outTMS_3), .serial_outTMS_o(serial_outTMS)); 

	majority_voter #(.WIDTH(6+`JTAG_NBits+`JTAG_MaxTrLen-1+`JTAG_MaxTrLen-1)) mv (
		.in1({cnt_2, tip_2, serial_outTDO_2, serial_outTMS_2, dataTDO_2, dataTMS_2}),
		.in2({cnt_3, tip_3, serial_outTDO_3, serial_outTMS_3, dataTDO_3, dataTMS_3}),
		.in3({cnt, tip, serial_outTDO, serial_outTMS, dataTDO, dataTMS}),
		.out({cnt_1, tip_1, serial_outTDO_1, serial_outTMS_1, dataTDO_1, dataTMS_1}),
		.err()
	);
endmodule 


/////////////////////////////////////////////////////////////////////////////
// Design Name:    GBT_SCA                                                 //
// Module Name:    JTAG_Wishbone_Interface (TRI Version)                   //
// Description:    JTAG Master fully configurable Wishbon compatible       //
// Company:        CERN (PH-ESE)                                           //
// Made by:        Alessandro Caratelli                                    //
// Create Date:    11/April/2013-Created                                   //
//                 27/June/2013-Small Modifications                        //
/////////////////////////////////////////////////////////////////////////////

`include "JTAG_define.v"
module JTAG_WB_Interface_iostate(wb_clk_in, wb_rst_in, wb_adr_in, wb_dat_in, wb_dat_out_i, wb_dat_out_o, wb_sel_in,
                        wb_we_in, wb_stb_in, wb_cyc_in, wb_ack_out_i, wb_ack_out_o, wb_err_out, wb_int_out_i, wb_int_out_o,
                        rx, TMStx, tip, pos_edge, neg_edge, last_bit,JTAG_divider_sel, JTAG_ctrl_sel, JTAG_TDO_txsel, JTAG_TMS_txsel,
                        divider_i, divider_o,      ctrl_i, ctrl_o, ie,  rst_done
                        `ifdef WithSEUcounter 
                              ,SEU_cnt, SEUclear_o
                        `endif
                        );
                                                                                                      
  // Wishbone signals //
  input                          wb_clk_in;                           
  input                          last_bit;                            
  input                          rst_done;                              
  input                          ie;              
  input                          wb_rst_in;       // synchronous active high reset
  input                  [5:0]   wb_adr_in;       // lower address bits
  input                 [31:0]   wb_dat_in;       // databus in
  output                [31:0]   wb_dat_out_o;
  output                         JTAG_divider_sel;	
  output                         JTAG_ctrl_sel;   	
  output                 [3:0]   JTAG_TDO_txsel;  
  output                 [3:0]   JTAG_TMS_txsel;    
  input                 [31:0]   wb_dat_out_i;    // databus out
  input                  [3:0]   wb_sel_in;       // byte select in
  input                          wb_we_in;        // write enable in
  input                          wb_stb_in;       // stobe/core select signal
  input                          wb_cyc_in;       // valid bus cycle in
  output                         wb_ack_out_o;
  input                          wb_ack_out_i;    // bus cycle acknowledge out
  output                         wb_err_out;      // termination error
  output                         wb_int_out_o;
  input                          wb_int_out_i;    // interrupt request signal out
  input  [`JTAG_CTRL_BIT_NB-1:0] ctrl_i;       
  input    [`JTAVDivFregLEN-1:0] divider_i;
  output [`JTAG_CTRL_BIT_NB-1:0] ctrl_o; 
  input     [`JTAG_MaxTrLen-1:0] rx;              // rx register
  input     [`JTAG_MaxTrLen-1:0] TMStx;           // TMStx Register
  input                          tip;             // transfer in progress
  input                          pos_edge;        // recognize posedge of sclk
  input                          neg_edge;        // recognize negedge of sclk
  output   [`JTAVDivFregLEN-1:0] divider_o;
  `ifdef WithSEUcounter
  input       [`SEUcnt_nbit-1:0] SEU_cnt;     //SEU Counter Register
  output                         SEUclear_o;
  reg                            SEUclear_o;
  `endif
  reg      [`JTAVDivFregLEN-1:0] divider_o;            // Divider register
  reg    [`JTAG_CTRL_BIT_NB-1:0] ctrl_o;               // Control and status register
  reg                     [31:0] wb_dat_m;             // wb data out      
  reg                     [31:0] wb_dat_out_o;
  reg                            wb_ack_out_o;
  reg                            wb_int_out_o;
  wire                           JTAG_divider_sel;     // divider register select
  wire                           JTAG_ctrl_sel;        // ctrl register select
  wire                    [3:0]  JTAG_TDO_txsel;       // tx_l register select
  wire                    [3:0]  JTAG_TMS_txsel;       // TMS_TX REGISTER SELECT
  wire                           JTAG_go_auto_sel;
  
  // Address decoder //
  assign JTAG_divider_sel    = wb_cyc_in & wb_stb_in & (wb_adr_in == `JTAG_DEVIDE);
  assign JTAG_TDO_txsel[0]   = wb_cyc_in & wb_stb_in & (wb_adr_in == `JTAG_TDO_tx0);
  assign JTAG_TDO_txsel[1]   = wb_cyc_in & wb_stb_in & (wb_adr_in == `JTAG_TDO_tx1);
  assign JTAG_TDO_txsel[2]   = wb_cyc_in & wb_stb_in & (wb_adr_in == `JTAG_TDO_tx2);
  assign JTAG_TDO_txsel[3]   = wb_cyc_in & wb_stb_in & (wb_adr_in == `JTAG_TDO_tx3);
  assign JTAG_TMS_txsel[0]   = wb_cyc_in & wb_stb_in & (wb_adr_in == `JTAG_TMS_tx0);
  assign JTAG_TMS_txsel[1]   = wb_cyc_in & wb_stb_in & (wb_adr_in == `JTAG_TMS_tx1);
  assign JTAG_TMS_txsel[2]   = wb_cyc_in & wb_stb_in & (wb_adr_in == `JTAG_TMS_tx2);
  assign JTAG_TMS_txsel[3]   = wb_cyc_in & wb_stb_in & (wb_adr_in == `JTAG_TMS_tx3);
  
  `ifdef WithSEUcounter
      wire SEU_cnt_sel;
      assign SEU_cnt_sel = wb_cyc_in & wb_stb_in & (wb_adr_in == `SEU_cnt);
  `endif

  // Read from registers //
  always @(wb_adr_in or rx or ctrl_i or divider_i or TMStx or SEU_cnt)
  begin
    case (wb_adr_in)
      `JTAG_TDI_rx0:    wb_dat_m = rx[31:0];
      `JTAG_TDI_rx1:    wb_dat_m = rx[63:32];
      `JTAG_TDI_rx2:    wb_dat_m = rx[95:64];
      `JTAG_TDI_rx3:    wb_dat_m = {{128-`JTAG_MaxTrLen{1'b0}}, rx[`JTAG_MaxTrLen-1:96]};            
      `JTAG_CTRL:       wb_dat_m = {{32-`JTAG_CTRL_BIT_NB{1'b0}}, ctrl_i};
      `JTAG_STATUS:     wb_dat_m = {30'b0, ctrl_i[`JTAG_CTRL_RES], ctrl_i[`JTAG_CTRL_GO]};//25-Oct-2015
      `JTAG_DEVIDE:     wb_dat_m = {{32-`JTAVDivFregLEN{1'b0}}, divider_i};
      `JTAG_TMS_tx0:    wb_dat_m = TMStx[31:0];
      `JTAG_TMS_tx1:    wb_dat_m = TMStx[63:32];
      `JTAG_TMS_tx2:    wb_dat_m = TMStx[95:64];
      `JTAG_TMS_tx3:    wb_dat_m = {{128-`JTAG_MaxTrLen{1'b0}}, TMStx[`JTAG_MaxTrLen-1:96]};
      `ifdef WithSEUcounter
      `SEU_cnt:         wb_dat_m = {{(32-`SEUcnt_nbit){1'b0}}, SEU_cnt};
      `endif
      default:          wb_dat_m = 32'b0;
    endcase
  end
  
  // Send data on Wishbone //
  always @(posedge wb_clk_in or posedge wb_rst_in) begin
    if (wb_rst_in) begin
         wb_dat_out_o <=  32'b0;
      end 
    else begin
         wb_dat_out_o <=  wb_dat_m;
      end
  end
  
  // Ack on Wishbone //
  always @(posedge wb_clk_in or posedge wb_rst_in) begin
    if (wb_rst_in) begin
         wb_ack_out_o <=  1'b0;
      end
    else begin
         wb_ack_out_o <=  wb_cyc_in & wb_stb_in & ~wb_ack_out_i;
      end
  end
  
  // Interrupt on Wishbone //
  always @(posedge wb_clk_in or posedge wb_rst_in)
  begin
    if (wb_rst_in)
      wb_int_out_o <=  1'b0;
    else if ((tip && last_bit && pos_edge && ie) | (rst_done)) //25-Oct-2015 
      wb_int_out_o <=  1'b1;
    else if (wb_ack_out_i)
      wb_int_out_o <=  1'b0;
    else wb_int_out_o <=  wb_int_out_i;
  end
  
  // Divider register //
  always @(posedge wb_clk_in or posedge wb_rst_in)
  begin
      if (wb_rst_in) begin
      	divider_o <=  {`JTAVDivFregLEN{1'b0}};
      end
      else begin 
      	divider_o <=  divider_i;
      	if (JTAG_divider_sel && wb_we_in && !tip) begin
        		if (wb_sel_in[0]) begin
          			divider_o[7:0] <=  wb_dat_in[7:0];
        		end
        		if (wb_sel_in[1]) begin
          			divider_o[`JTAVDivFregLEN-1:8] <=  wb_dat_in[`JTAVDivFregLEN-1:8];
        		end
      	end
      end
  end
  
`ifdef WithSEUcounter  // SEU Counter Register //
 
  always @(posedge wb_clk_in or posedge wb_rst_in)
  begin
      if (wb_rst_in) 
      	SEUclear_o <=  1'b0;
      else begin 
      	if (SEU_cnt_sel && wb_we_in && wb_sel_in[0]) 
		SEUclear_o <=  1'b1;
      	else 
		SEUclear_o <=  1'b0;
      end
  end 
`endif  
  
   
   // Ctrl register //
  	always @(posedge wb_clk_in or posedge wb_rst_in) begin // 25-Oct-2015 
		if (wb_rst_in) begin
			ctrl_o <=  {`JTAG_CTRL_BIT_NB{1'b0}}; 
			ctrl_o[`JTAG_CTRL_Inv_RxEdge] <= 1'b0; 
			ctrl_o[`JTAG_CTRL_Inv_TxEdge] <= 1'b0;
			ctrl_o[`JTAG_CTRL_Inv_TrDir]  <= 1'b0;
			ctrl_o[`JTAG_CTRL_Inv_IdlSt]  <= 1'b0;
			ctrl_o[`JTAG_CTRL_CHAR_LEN]   <= 1'b0;
			ctrl_o[`JTAG_CTRL_IE]         <= 1'b1;
			ctrl_o[`JTAG_CTRL_GO]         <= 1'b0;
			ctrl_o[`JTAG_CTRL_RES]        <= 1'b0;
		end		
		else begin
			ctrl_o <=  ctrl_i; 
			if (wb_cyc_in & wb_stb_in & wb_we_in && !tip) begin
				if (wb_adr_in != `JTAG_CTRL) begin
					ctrl_o[`JTAG_CTRL_Inv_RxEdge] <=  ctrl_i[`JTAG_CTRL_Inv_RxEdge];
					ctrl_o[`JTAG_CTRL_Inv_TxEdge] <=  ctrl_i[`JTAG_CTRL_Inv_TxEdge];
					ctrl_o[`JTAG_CTRL_Inv_TrDir]  <=  ctrl_i[`JTAG_CTRL_Inv_TrDir];
					ctrl_o[`JTAG_CTRL_Inv_IdlSt]  <=  ctrl_i[`JTAG_CTRL_Inv_IdlSt]; 
					ctrl_o[`JTAG_CTRL_CHAR_LEN]   <=  ctrl_i[`JTAG_CTRL_CHAR_LEN];
					case(wb_adr_in)
					`JTAG_GO_AUTO: begin
						ctrl_o[`JTAG_CTRL_IE]  <= 1'b1;
						ctrl_o[`JTAG_CTRL_GO]  <= 1'b1;
						ctrl_o[`JTAG_CTRL_RES] <= 1'b0;
						end
					`JTAG_GO_MANUAL: begin
						ctrl_o[`JTAG_CTRL_IE]  <= 1'b0;
						ctrl_o[`JTAG_CTRL_GO]  <= 1'b1;
						ctrl_o[`JTAG_CTRL_RES] <= 1'b0;
						end
					`JTAG_RES: begin
						ctrl_o[`JTAG_CTRL_IE]  <= 1'b1;
						ctrl_o[`JTAG_CTRL_GO]  <= 1'b0;
						ctrl_o[`JTAG_CTRL_RES] <= 1'b1;
						end
					default: begin
						ctrl_o[`JTAG_CTRL_IE]  <= ctrl_i[`JTAG_CTRL_IE];
						ctrl_o[`JTAG_CTRL_GO]  <= ctrl_i[`JTAG_CTRL_GO];
						ctrl_o[`JTAG_CTRL_RES] <= ctrl_i[`JTAG_CTRL_RES];
						end
					endcase
				end
				else begin
					ctrl_o[`JTAG_CTRL_GO]  <=  1'b0;
					ctrl_o[`JTAG_CTRL_IE]  <=  1'b1;
					ctrl_o[`JTAG_CTRL_RES] <=  1'b0;
					if (wb_sel_in[0])  
						ctrl_o[`JTAG_CTRL_CHAR_LEN] <=  wb_dat_in[`JTAG_CTRL_CHAR_LEN];
					else 
						ctrl_o[`JTAG_CTRL_CHAR_LEN] <=  ctrl_i[`JTAG_CTRL_CHAR_LEN];
					if (wb_sel_in[1]) begin
						ctrl_o[`JTAG_CTRL_Inv_RxEdge] <=  wb_dat_in[`JTAG_CTRL_Inv_RxEdge];
						ctrl_o[`JTAG_CTRL_Inv_TxEdge] <=  wb_dat_in[`JTAG_CTRL_Inv_TxEdge];
						ctrl_o[`JTAG_CTRL_Inv_TrDir]  <=  wb_dat_in[`JTAG_CTRL_Inv_TrDir]; 
						ctrl_o[`JTAG_CTRL_Inv_IdlSt]  <=  wb_dat_in[`JTAG_CTRL_Inv_IdlSt]; 
					end
					else begin
						ctrl_o[`JTAG_CTRL_Inv_RxEdge] <=  ctrl_i[`JTAG_CTRL_Inv_RxEdge];
						ctrl_o[`JTAG_CTRL_Inv_TxEdge] <=  ctrl_i[`JTAG_CTRL_Inv_TxEdge];
						ctrl_o[`JTAG_CTRL_Inv_TrDir]  <=  ctrl_i[`JTAG_CTRL_Inv_TrDir];
						ctrl_o[`JTAG_CTRL_Inv_IdlSt]  <=  ctrl_i[`JTAG_CTRL_Inv_IdlSt]; 
					end	
				end
			end
			else begin
				if((tip && last_bit && pos_edge) || rst_done) begin
					ctrl_o[`JTAG_CTRL_GO]  <=  1'b0;
					ctrl_o[`JTAG_CTRL_RES] <=  1'b0;
				end
				else begin
					ctrl_o[`JTAG_CTRL_GO]  <= ctrl_i[`JTAG_CTRL_GO];
					ctrl_o[`JTAG_CTRL_RES] <= ctrl_i[`JTAG_CTRL_RES];	
				end
				ctrl_o[`JTAG_CTRL_Inv_RxEdge] <=  ctrl_i[`JTAG_CTRL_Inv_RxEdge];
				ctrl_o[`JTAG_CTRL_Inv_TxEdge] <=  ctrl_i[`JTAG_CTRL_Inv_TxEdge];
				ctrl_o[`JTAG_CTRL_Inv_TrDir]  <=  ctrl_i[`JTAG_CTRL_Inv_TrDir];
				ctrl_o[`JTAG_CTRL_Inv_IdlSt]  <=  ctrl_i[`JTAG_CTRL_Inv_IdlSt]; 
				ctrl_o[`JTAG_CTRL_CHAR_LEN]   <=  ctrl_i[`JTAG_CTRL_CHAR_LEN];
				ctrl_o[`JTAG_CTRL_IE]         <=  ctrl_i[`JTAG_CTRL_IE];
			end
		end
	end
			
  
 endmodule

`include "JTAG_define.v"

module  JTAG_WB_Interface_tri(wb_clk_in_1, wb_clk_in_2, wb_clk_in_3, wb_rst_in_1, wb_rst_in_2, wb_rst_in_3, wb_adr_in_1, wb_adr_in_2, wb_adr_in_3, wb_dat_in_1, wb_dat_in_2, wb_dat_in_3, wb_dat_out_1, wb_dat_out_2, wb_dat_out_3, wb_sel_in_1, wb_sel_in_2, wb_sel_in_3,
                              wb_we_in_1, wb_we_in_2, wb_we_in_3, wb_stb_in_1, wb_stb_in_2, wb_stb_in_3, wb_cyc_in_1, wb_cyc_in_2, wb_cyc_in_3, wb_ack_out_1, wb_ack_out_2, wb_ack_out_3, wb_err_out_1, wb_err_out_2, wb_err_out_3, wb_int_out_1, wb_int_out_2, wb_int_out_3,
                              rx_1, rx_2, rx_3, TMStx_1, TMStx_2, TMStx_3, tip_1, tip_2, tip_3, pos_edge_1, pos_edge_2, pos_edge_3, neg_edge_1, neg_edge_2, neg_edge_3, last_bit_1, last_bit_2, last_bit_3,
                              divider_1, divider_2, divider_3,	ctrl_1, ctrl_2, ctrl_3, ie_1, ie_2, ie_3,  rst_done_1, rst_done_2, rst_done_3,
                              `ifdef WithSEUcounter
                              SEUclear_1,SEUclear_2,SEUclear_3,SEU_cnt_1, SEU_cnt_2, SEU_cnt_3,
                              `endif
                              JTAG_divider_sel_1, JTAG_divider_sel_2, JTAG_divider_sel_3, JTAG_ctrl_sel_1, JTAG_ctrl_sel_2, JTAG_ctrl_sel_3, JTAG_TDO_txsel_1, JTAG_TDO_txsel_2, JTAG_TDO_txsel_3, JTAG_TMS_txsel_1, JTAG_TMS_txsel_2, JTAG_TMS_txsel_3);

  // Wishbone signals //
  input    		wb_clk_in_1, wb_clk_in_2, wb_clk_in_3;         	      // master clock in
  input           wb_rst_in_1, wb_rst_in_2, wb_rst_in_3;         		// synchronous active high reset
  input   [5:0] 	wb_adr_in_1, wb_adr_in_2, wb_adr_in_3;         		// lower address bits
  input  [31:0]	wb_dat_in_1, wb_dat_in_2, wb_dat_in_3;         		// databus in
  output [31:0]	wb_dat_out_1, wb_dat_out_2, wb_dat_out_3;         	// databus out
  input   [3:0]	wb_sel_in_1, wb_sel_in_2, wb_sel_in_3;         		// byte select in
  input           wb_we_in_1, wb_we_in_2, wb_we_in_3;          		// write enable in
  input           wb_stb_in_1, wb_stb_in_2, wb_stb_in_3;         		// stobe/core select signal
  input           wb_cyc_in_1, wb_cyc_in_2, wb_cyc_in_3;         		// valid bus cycle in
  output          wb_ack_out_1, wb_ack_out_2, wb_ack_out_3;         	// bus cycle acknowledge out
  output          wb_err_out_1, wb_err_out_2, wb_err_out_3;         	// termination error
  output          wb_int_out_1, wb_int_out_2, wb_int_out_3;         	// interrupt request signal out

  // internal signals //
  input	[`JTAG_MaxTrLen-1:0] rx_1, rx_2, rx_3;      			// rx register
  input	[`JTAG_MaxTrLen-1:0] TMStx_1, TMStx_2, TMStx_3;   		// TMStx Register
  input	tip_1, tip_2, tip_3;               	                        // transfer in progress
  input	pos_edge_1, pos_edge_2, pos_edge_3;                         // recognize posedge of sclk
  input	neg_edge_1, neg_edge_2, neg_edge_3;                         // recognize negedge of sclk
  input	last_bit_1, last_bit_2, last_bit_3;                         // marks last character bit
  input	rst_done_1, rst_done_2, rst_done_3;	                        // reset signal sent
  input	ie_1, ie_2, ie_3;				

  output    [`JTAVDivFregLEN-1:0] 	divider_1, divider_2, divider_3;	// Divider register
  output    [`JTAG_CTRL_BIT_NB-1:0] ctrl_1, ctrl_2, ctrl_3; 		// Control and status register
  output	JTAG_divider_sel_1, JTAG_divider_sel_2, JTAG_divider_sel_3; // divider register select
  output	JTAG_ctrl_sel_1, JTAG_ctrl_sel_2, JTAG_ctrl_sel_3;     	// ctrl register select
  output	[3:0] JTAG_TDO_txsel_1, JTAG_TDO_txsel_2, JTAG_TDO_txsel_3; // tx_l register select
  output	[3:0] JTAG_TMS_txsel_1, JTAG_TMS_txsel_2, JTAG_TMS_txsel_3;	// TMS_TX REGISTER SELECT
  
  `ifdef WithSEUcounter                                                 // SEU Counter Register 
  output SEUclear_1,SEUclear_2,SEUclear_3;
  input  [`SEUcnt_nbit-1:0] SEU_cnt_1, SEU_cnt_2, SEU_cnt_3;
  `endif		

  wire [31:0] wb_dat_out_1, wb_dat_out_2, wb_dat_out_3;
  wire wb_ack_out_1, wb_ack_out_2, wb_ack_out_3;
  wire wb_int_out_1, wb_int_out_2, wb_int_out_3;
  wire [`JTAVDivFregLEN-1:0] divider_1, divider_2, divider_3;
  wire [`JTAG_CTRL_BIT_NB-1:0] ctrl_1, ctrl_2, ctrl_3;
  wire [31:0] wb_dat_out;
  wire wb_ack_out;
  wire wb_int_out;
  wire [`JTAVDivFregLEN-1:0] divider;
  wire [`JTAG_CTRL_BIT_NB-1:0] ctrl;
	
  `ifdef WithSEUcounter 
  wire SEUclear,SEUclear_1,SEUclear_2,SEUclear_3;
  `endif

	JTAG_WB_Interface_iostate JTAG_WB_Interface_iostate_1  (.wb_clk_in(wb_clk_in_1), .wb_rst_in(wb_rst_in_1), .wb_adr_in(wb_adr_in_1), .wb_dat_in(wb_dat_in_1), .wb_dat_out_i(wb_dat_out_1), .wb_dat_out_o(wb_dat_out_2), .wb_sel_in(wb_sel_in_1),
				.wb_we_in(wb_we_in_1), .wb_stb_in(wb_stb_in_1), .wb_cyc_in(wb_cyc_in_1), .wb_ack_out_i(wb_ack_out_1), .wb_ack_out_o(wb_ack_out_2), .wb_err_out(wb_err_out_1), .wb_int_out_i(wb_int_out_1), .wb_int_out_o(wb_int_out_2),
				.rx(rx_1), .TMStx(TMStx_1), .tip(tip_1), .pos_edge(pos_edge_1), .neg_edge(neg_edge_1), .last_bit(last_bit_1),
				.divider_i(divider_1), .divider_o(divider_2),	.ctrl_i(ctrl_1), .ctrl_o(ctrl_2), .ie(ie_1),  .rst_done(rst_done_1),
				`ifdef WithSEUcounter
                              .SEUclear_o(SEUclear_2),.SEU_cnt(SEU_cnt_1),
                        `endif
				.JTAG_divider_sel(JTAG_divider_sel_1), .JTAG_ctrl_sel(JTAG_ctrl_sel_1), .JTAG_TDO_txsel(JTAG_TDO_txsel_1), .JTAG_TMS_txsel(JTAG_TMS_txsel_1));

	JTAG_WB_Interface_iostate JTAG_WB_Interface_iostate_2  (.wb_clk_in(wb_clk_in_2), .wb_rst_in(wb_rst_in_2), .wb_adr_in(wb_adr_in_2), .wb_dat_in(wb_dat_in_2), .wb_dat_out_i(wb_dat_out_2), .wb_dat_out_o(wb_dat_out_3), .wb_sel_in(wb_sel_in_2),
				.wb_we_in(wb_we_in_2), .wb_stb_in(wb_stb_in_2), .wb_cyc_in(wb_cyc_in_2), .wb_ack_out_i(wb_ack_out_2), .wb_ack_out_o(wb_ack_out_3), .wb_err_out(wb_err_out_2), .wb_int_out_i(wb_int_out_2), .wb_int_out_o(wb_int_out_3),
				.rx(rx_2), .TMStx(TMStx_2), .tip(tip_2), .pos_edge(pos_edge_2), .neg_edge(neg_edge_2), .last_bit(last_bit_2),
				.divider_i(divider_2), .divider_o(divider_3),	.ctrl_i(ctrl_2), .ctrl_o(ctrl_3), .ie(ie_2),  .rst_done(rst_done_2),
				`ifdef WithSEUcounter
                              .SEUclear_o(SEUclear_3),.SEU_cnt(SEU_cnt_2),
                        `endif
				.JTAG_divider_sel(JTAG_divider_sel_2), .JTAG_ctrl_sel(JTAG_ctrl_sel_2), .JTAG_TDO_txsel(JTAG_TDO_txsel_2), .JTAG_TMS_txsel(JTAG_TMS_txsel_2));

	JTAG_WB_Interface_iostate JTAG_WB_Interface_iostate_3  (.wb_clk_in(wb_clk_in_3), .wb_rst_in(wb_rst_in_3), .wb_adr_in(wb_adr_in_3), .wb_dat_in(wb_dat_in_3), .wb_dat_out_i(wb_dat_out_3), .wb_dat_out_o(wb_dat_out), .wb_sel_in(wb_sel_in_3),
				.wb_we_in(wb_we_in_3), .wb_stb_in(wb_stb_in_3), .wb_cyc_in(wb_cyc_in_3), .wb_ack_out_i(wb_ack_out_3), .wb_ack_out_o(wb_ack_out), .wb_err_out(wb_err_out_3), .wb_int_out_i(wb_int_out_3), .wb_int_out_o(wb_int_out),
				.rx(rx_3), .TMStx(TMStx_3), .tip(tip_3), .pos_edge(pos_edge_3), .neg_edge(neg_edge_3), .last_bit(last_bit_3),
				.divider_i(divider_3), .divider_o(divider),	.ctrl_i(ctrl_3), .ctrl_o(ctrl), .ie(ie_3),  .rst_done(rst_done_3),
				`ifdef WithSEUcounter
                              .SEUclear_o(SEUclear),.SEU_cnt(SEU_cnt_3),
                        `endif
				.JTAG_divider_sel(JTAG_divider_sel_3), .JTAG_ctrl_sel(JTAG_ctrl_sel_3), .JTAG_TDO_txsel(JTAG_TDO_txsel_3), .JTAG_TMS_txsel(JTAG_TMS_txsel_3));

	
  `ifdef WithSEUcounter	
	majority_voter #(.WIDTH(36+`JTAVDivFregLEN-1+`JTAG_CTRL_BIT_NB-1+1)) mv (
		.in1({wb_dat_out_2, wb_ack_out_2, wb_int_out_2, divider_2, ctrl_2, SEUclear_2}),
		.in2({wb_dat_out_3, wb_ack_out_3, wb_int_out_3, divider_3, ctrl_3, SEUclear_3}),
		.in3({wb_dat_out,   wb_ack_out,   wb_int_out,   divider,   ctrl,   SEUclear  }),
		.out({wb_dat_out_1, wb_ack_out_1, wb_int_out_1, divider_1, ctrl_1, SEUclear_1}),
		.err()
	);	
  `else	
	majority_voter #(.WIDTH(36+`JTAVDivFregLEN-1+`JTAG_CTRL_BIT_NB-1)) mv (
		.in1({wb_dat_out_2, wb_ack_out_2, wb_int_out_2, divider_2, ctrl_2}),
		.in2({wb_dat_out_3, wb_ack_out_3, wb_int_out_3, divider_3, ctrl_3}),
		.in3({wb_dat_out, wb_ack_out, wb_int_out, divider, ctrl}),
		.out({wb_dat_out_1, wb_ack_out_1, wb_int_out_1, divider_1, ctrl_1}),
		.err()
	);
  `endif	
	
endmodule

