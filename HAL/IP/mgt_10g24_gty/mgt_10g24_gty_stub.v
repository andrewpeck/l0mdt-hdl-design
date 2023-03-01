// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Mon Feb 27 19:15:48 2023
// Host        : VBU2204-1 running 64-bit Ubuntu 22.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/guille/ATLAS/l0mdt-hdl-design/HAL/IP/mgt_10g24_gty/mgt_10g24_gty_stub.v
// Design      : mgt_10g24_gty
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "mgt_10g24_gty_gtwizard_top,Vivado 2020.2" *)
module mgt_10g24_gty(gtwiz_userclk_tx_active_in, 
  gtwiz_userclk_rx_active_in, gtwiz_buffbypass_tx_reset_in, 
  gtwiz_buffbypass_tx_start_user_in, gtwiz_buffbypass_tx_done_out, 
  gtwiz_buffbypass_tx_error_out, gtwiz_reset_clk_freerun_in, gtwiz_reset_all_in, 
  gtwiz_reset_tx_pll_and_datapath_in, gtwiz_reset_tx_datapath_in, 
  gtwiz_reset_rx_pll_and_datapath_in, gtwiz_reset_rx_datapath_in, 
  gtwiz_reset_rx_cdr_stable_out, gtwiz_reset_tx_done_out, gtwiz_reset_rx_done_out, 
  gtwiz_userdata_tx_in, gtwiz_userdata_rx_out, gtrefclk00_in, gtrefclk01_in, 
  qpll0outclk_out, qpll0outrefclk_out, qpll1outclk_out, qpll1outrefclk_out, drpaddr_in, 
  drpclk_in, drpdi_in, drpen_in, drpwe_in, gtyrxn_in, gtyrxp_in, rxslide_in, rxusrclk_in, 
  rxusrclk2_in, txusrclk_in, txusrclk2_in, drpdo_out, drprdy_out, gtpowergood_out, gtytxn_out, 
  gtytxp_out, rxoutclk_out, rxpmaresetdone_out, txbufstatus_out, txoutclk_out, 
  txpmaresetdone_out, txprgdivresetdone_out)
/* synthesis syn_black_box black_box_pad_pin="gtwiz_userclk_tx_active_in[0:0],gtwiz_userclk_rx_active_in[0:0],gtwiz_buffbypass_tx_reset_in[0:0],gtwiz_buffbypass_tx_start_user_in[0:0],gtwiz_buffbypass_tx_done_out[0:0],gtwiz_buffbypass_tx_error_out[0:0],gtwiz_reset_clk_freerun_in[0:0],gtwiz_reset_all_in[0:0],gtwiz_reset_tx_pll_and_datapath_in[0:0],gtwiz_reset_tx_datapath_in[0:0],gtwiz_reset_rx_pll_and_datapath_in[0:0],gtwiz_reset_rx_datapath_in[0:0],gtwiz_reset_rx_cdr_stable_out[0:0],gtwiz_reset_tx_done_out[0:0],gtwiz_reset_rx_done_out[0:0],gtwiz_userdata_tx_in[127:0],gtwiz_userdata_rx_out[127:0],gtrefclk00_in[0:0],gtrefclk01_in[0:0],qpll0outclk_out[0:0],qpll0outrefclk_out[0:0],qpll1outclk_out[0:0],qpll1outrefclk_out[0:0],drpaddr_in[39:0],drpclk_in[3:0],drpdi_in[63:0],drpen_in[3:0],drpwe_in[3:0],gtyrxn_in[3:0],gtyrxp_in[3:0],rxslide_in[3:0],rxusrclk_in[3:0],rxusrclk2_in[3:0],txusrclk_in[3:0],txusrclk2_in[3:0],drpdo_out[63:0],drprdy_out[3:0],gtpowergood_out[3:0],gtytxn_out[3:0],gtytxp_out[3:0],rxoutclk_out[3:0],rxpmaresetdone_out[3:0],txbufstatus_out[7:0],txoutclk_out[3:0],txpmaresetdone_out[3:0],txprgdivresetdone_out[3:0]" */;
  input [0:0]gtwiz_userclk_tx_active_in;
  input [0:0]gtwiz_userclk_rx_active_in;
  input [0:0]gtwiz_buffbypass_tx_reset_in;
  input [0:0]gtwiz_buffbypass_tx_start_user_in;
  output [0:0]gtwiz_buffbypass_tx_done_out;
  output [0:0]gtwiz_buffbypass_tx_error_out;
  input [0:0]gtwiz_reset_clk_freerun_in;
  input [0:0]gtwiz_reset_all_in;
  input [0:0]gtwiz_reset_tx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_tx_datapath_in;
  input [0:0]gtwiz_reset_rx_pll_and_datapath_in;
  input [0:0]gtwiz_reset_rx_datapath_in;
  output [0:0]gtwiz_reset_rx_cdr_stable_out;
  output [0:0]gtwiz_reset_tx_done_out;
  output [0:0]gtwiz_reset_rx_done_out;
  input [127:0]gtwiz_userdata_tx_in;
  output [127:0]gtwiz_userdata_rx_out;
  input [0:0]gtrefclk00_in;
  input [0:0]gtrefclk01_in;
  output [0:0]qpll0outclk_out;
  output [0:0]qpll0outrefclk_out;
  output [0:0]qpll1outclk_out;
  output [0:0]qpll1outrefclk_out;
  input [39:0]drpaddr_in;
  input [3:0]drpclk_in;
  input [63:0]drpdi_in;
  input [3:0]drpen_in;
  input [3:0]drpwe_in;
  input [3:0]gtyrxn_in;
  input [3:0]gtyrxp_in;
  input [3:0]rxslide_in;
  input [3:0]rxusrclk_in;
  input [3:0]rxusrclk2_in;
  input [3:0]txusrclk_in;
  input [3:0]txusrclk2_in;
  output [63:0]drpdo_out;
  output [3:0]drprdy_out;
  output [3:0]gtpowergood_out;
  output [3:0]gtytxn_out;
  output [3:0]gtytxp_out;
  output [3:0]rxoutclk_out;
  output [3:0]rxpmaresetdone_out;
  output [7:0]txbufstatus_out;
  output [3:0]txoutclk_out;
  output [3:0]txpmaresetdone_out;
  output [3:0]txprgdivresetdone_out;
endmodule
