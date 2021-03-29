// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Mon Mar 29 15:39:10 2021
// Host        : atlas126a running 64-bit openSUSE Tumbleweed
// Command     : write_verilog -force -mode synth_stub
//               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_get_rom_addr/hls_get_rom_addr_stub.v
// Design      : hls_get_rom_addr
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "get_rom_addr,Vivado 2019.2.1" *)
module hls_get_rom_addr(ap_clk, ap_rst, ap_start, ap_done, ap_idle, 
  ap_ready, theta_for_lut_V, rom_index_V, lut_start_addr_V, lbins0_gbl1_V, 
  slcvec_offset_angle_int_V, slcvec_angle_polar_offset_mrad_V)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,theta_for_lut_V[13:0],rom_index_V[2:0],lut_start_addr_V[11:0],lbins0_gbl1_V[0:0],slcvec_offset_angle_int_V[10:0],slcvec_angle_polar_offset_mrad_V[13:0]" */;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [13:0]theta_for_lut_V;
  output [2:0]rom_index_V;
  output [11:0]lut_start_addr_V;
  input [0:0]lbins0_gbl1_V;
  input [10:0]slcvec_offset_angle_int_V;
  output [13:0]slcvec_angle_polar_offset_mrad_V;
endmodule
