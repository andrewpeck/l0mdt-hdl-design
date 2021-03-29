// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Mon Mar 29 15:39:30 2021
// Host        : atlas126a running 64-bit openSUSE Tumbleweed
// Command     : write_verilog -force -mode synth_stub
//               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_get_legendre_segment_barrel/hls_get_legendre_segment_barrel_stub.v
// Design      : hls_get_legendre_segment_barrel
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "get_legendre_segment_barrel,Vivado 2019.2.1" *)
module hls_get_legendre_segment_barrel(segpos_V_ap_vld, ap_clk, ap_rst, ap_start, 
  ap_done, ap_idle, ap_ready, hls_sin_val_V, hls_cos_val_V, hls_LT_r_global_V, slcvec_pos_R_V, 
  hewindow_pos_Z_V, hewindow_pos_R_V, hls_LT_theta_global_V, segpos_V)
/* synthesis syn_black_box black_box_pad_pin="segpos_V_ap_vld,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,hls_sin_val_V[17:0],hls_cos_val_V[17:0],hls_LT_r_global_V[21:0],slcvec_pos_R_V[17:0],hewindow_pos_Z_V[17:0],hewindow_pos_R_V[17:0],hls_LT_theta_global_V[13:0],segpos_V[17:0]" */;
  output segpos_V_ap_vld;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [17:0]hls_sin_val_V;
  input [17:0]hls_cos_val_V;
  input [21:0]hls_LT_r_global_V;
  input [17:0]slcvec_pos_R_V;
  input [17:0]hewindow_pos_Z_V;
  input [17:0]hewindow_pos_R_V;
  input [13:0]hls_LT_theta_global_V;
  output [17:0]segpos_V;
endmodule
