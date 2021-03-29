// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Mon Mar 29 15:39:12 2021
// Host        : atlas126a running 64-bit openSUSE Tumbleweed
// Command     : write_verilog -force -mode synth_stub
//               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_compute_r_bins/hls_compute_r_bins_stub.v
// Design      : hls_compute_r_bins
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "compute_r_bins,Vivado 2019.2.1" *)
module hls_compute_r_bins(ap_clk, ap_rst_n, ap_start, ap_done, ap_idle, 
  ap_ready, mdt_r_offset_V_TVALID, mdt_r_offset_V_TREADY, mdt_r_offset_V_TDATA, 
  r_bin_V_TVALID, r_bin_V_TREADY, r_bin_V_TDATA, mdt_localx_V, mdt_localy_V, hw_sin_val_V, 
  hw_cos_val_V)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,mdt_r_offset_V_TVALID,mdt_r_offset_V_TREADY,mdt_r_offset_V_TDATA[23:0],r_bin_V_TVALID,r_bin_V_TREADY,r_bin_V_TDATA[7:0],mdt_localx_V[14:0],mdt_localy_V[14:0],hw_sin_val_V[17:0],hw_cos_val_V[17:0]" */;
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input mdt_r_offset_V_TVALID;
  output mdt_r_offset_V_TREADY;
  input [23:0]mdt_r_offset_V_TDATA;
  output r_bin_V_TVALID;
  input r_bin_V_TREADY;
  output [7:0]r_bin_V_TDATA;
  input [14:0]mdt_localx_V;
  input [14:0]mdt_localy_V;
  input [17:0]hw_sin_val_V;
  input [17:0]hw_cos_val_V;
endmodule
