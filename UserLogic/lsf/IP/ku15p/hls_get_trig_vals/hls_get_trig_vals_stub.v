// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Mon Mar 29 15:39:03 2021
// Host        : atlas126a running 64-bit openSUSE Tumbleweed
// Command     : write_verilog -force -mode synth_stub
//               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_get_trig_vals/hls_get_trig_vals_stub.v
// Design      : hls_get_trig_vals
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "get_trig_vals,Vivado 2019.2.1" *)
module hls_get_trig_vals(ap_clk, ap_rst, ap_start, ap_done, ap_idle, 
  ap_ready, hw_trig_vals_0_V, hw_trig_vals_1_V, hw_trig_vals_2_V, hw_trig_vals_3_V, 
  hw_trig_vals_4_V, hw_trig_vals_5_V, hw_trig_vals_6_V, hw_trig_vals_7_V, hw_trig_vals_8_V, 
  hw_trig_vals_9_V, hw_trig_vals_10_V, hw_trig_vals_11_V, hw_trig_vals_12_V, 
  hw_trig_vals_13_V, hw_trig_vals_14_V, hw_trig_vals_15_V, rom_idx_V, lut_start_addr_V)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,hw_trig_vals_0_V[35:0],hw_trig_vals_1_V[35:0],hw_trig_vals_2_V[35:0],hw_trig_vals_3_V[35:0],hw_trig_vals_4_V[35:0],hw_trig_vals_5_V[35:0],hw_trig_vals_6_V[35:0],hw_trig_vals_7_V[35:0],hw_trig_vals_8_V[35:0],hw_trig_vals_9_V[35:0],hw_trig_vals_10_V[35:0],hw_trig_vals_11_V[35:0],hw_trig_vals_12_V[35:0],hw_trig_vals_13_V[35:0],hw_trig_vals_14_V[35:0],hw_trig_vals_15_V[35:0],rom_idx_V[2:0],lut_start_addr_V[11:0]" */;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [35:0]hw_trig_vals_0_V;
  output [35:0]hw_trig_vals_1_V;
  output [35:0]hw_trig_vals_2_V;
  output [35:0]hw_trig_vals_3_V;
  output [35:0]hw_trig_vals_4_V;
  output [35:0]hw_trig_vals_5_V;
  output [35:0]hw_trig_vals_6_V;
  output [35:0]hw_trig_vals_7_V;
  output [35:0]hw_trig_vals_8_V;
  output [35:0]hw_trig_vals_9_V;
  output [35:0]hw_trig_vals_10_V;
  output [35:0]hw_trig_vals_11_V;
  output [35:0]hw_trig_vals_12_V;
  output [35:0]hw_trig_vals_13_V;
  output [35:0]hw_trig_vals_14_V;
  output [35:0]hw_trig_vals_15_V;
  input [2:0]rom_idx_V;
  input [11:0]lut_start_addr_V;
endmodule
