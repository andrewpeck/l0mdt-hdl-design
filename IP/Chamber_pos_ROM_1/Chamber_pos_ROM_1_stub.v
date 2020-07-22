// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Sat Jun  6 23:12:42 2020
// Host        : GLdL950 running 64-bit Ubuntu 18.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /mnt/d/L0MDT/dev/hdl/l0mdt-fpga-design/IP/Chamber_pos_ROM_1/Chamber_pos_ROM_1_stub.v
// Design      : Chamber_pos_ROM_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *)
module Chamber_pos_ROM_1(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[2:0],douta[18:0]" */;
  input clka;
  input [2:0]addra;
  output [18:0]douta;
endmodule
