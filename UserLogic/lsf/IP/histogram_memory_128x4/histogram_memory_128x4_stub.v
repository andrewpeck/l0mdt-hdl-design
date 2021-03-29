// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Mon Mar 29 15:39:10 2021
// Host        : atlas126a running 64-bit openSUSE Tumbleweed
// Command     : write_verilog -force -mode synth_stub
//               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/histogram_memory_128x4/histogram_memory_128x4_stub.v
// Design      : histogram_memory_128x4
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2.1" *)
module histogram_memory_128x4(a, d, dpra, clk, we, qdpo)
/* synthesis syn_black_box black_box_pad_pin="a[6:0],d[3:0],dpra[6:0],clk,we,qdpo[3:0]" */;
  input [6:0]a;
  input [3:0]d;
  input [6:0]dpra;
  input clk;
  input we;
  output [3:0]qdpo;
endmodule
