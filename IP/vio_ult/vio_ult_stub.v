// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Tue Jun 30 02:20:57 2020
// Host        : GLdL950 running 64-bit Ubuntu 18.04.4 LTS
// Command     : write_verilog -force -mode synth_stub /mnt/d/L0MDT/dev/hdl/l0mdt-fpga-design/IP/vio_ult/vio_ult_stub.v
// Design      : vio_ult
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2019.2" *)
module vio_ult(clk, probe_in0, probe_in1, probe_in2, probe_in3, 
  probe_in4, probe_in5, probe_in6, probe_in7, probe_in8, probe_out0, probe_out1, probe_out2, 
  probe_out3, probe_out4, probe_out5, probe_out6, probe_out7, probe_out8, probe_out9, 
  probe_out10, probe_out11, probe_out12, probe_out13, probe_out14, probe_out15, probe_out16, 
  probe_out17, probe_out18, probe_out19, probe_out20, probe_out21, probe_out22, probe_out23, 
  probe_out24, probe_out25, probe_out26, probe_out27, probe_out28, probe_out29, probe_out30, 
  probe_out31, probe_out32, probe_out33, probe_out34, probe_out35, probe_out36, probe_out37)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[60:0],probe_in1[60:0],probe_in2[58:0],probe_in3[58:0],probe_in4[40:0],probe_in5[40:0],probe_in6[40:0],probe_in7[40:0],probe_in8[0:0],probe_out0[35:0],probe_out1[35:0],probe_out2[35:0],probe_out3[35:0],probe_out4[35:0],probe_out5[35:0],probe_out6[35:0],probe_out7[35:0],probe_out8[35:0],probe_out9[35:0],probe_out10[35:0],probe_out11[35:0],probe_out12[35:0],probe_out13[35:0],probe_out14[35:0],probe_out15[35:0],probe_out16[35:0],probe_out17[35:0],probe_out18[35:0],probe_out19[35:0],probe_out20[35:0],probe_out21[35:0],probe_out22[35:0],probe_out23[35:0],probe_out24[123:0],probe_out25[123:0],probe_out26[123:0],probe_out27[123:0],probe_out28[123:0],probe_out29[123:0],probe_out30[123:0],probe_out31[123:0],probe_out32[60:0],probe_out33[58:0],probe_out34[58:0],probe_out35[58:0],probe_out36[0:0],probe_out37[0:0]" */;
  input clk;
  input [60:0]probe_in0;
  input [60:0]probe_in1;
  input [58:0]probe_in2;
  input [58:0]probe_in3;
  input [40:0]probe_in4;
  input [40:0]probe_in5;
  input [40:0]probe_in6;
  input [40:0]probe_in7;
  input [0:0]probe_in8;
  output [35:0]probe_out0;
  output [35:0]probe_out1;
  output [35:0]probe_out2;
  output [35:0]probe_out3;
  output [35:0]probe_out4;
  output [35:0]probe_out5;
  output [35:0]probe_out6;
  output [35:0]probe_out7;
  output [35:0]probe_out8;
  output [35:0]probe_out9;
  output [35:0]probe_out10;
  output [35:0]probe_out11;
  output [35:0]probe_out12;
  output [35:0]probe_out13;
  output [35:0]probe_out14;
  output [35:0]probe_out15;
  output [35:0]probe_out16;
  output [35:0]probe_out17;
  output [35:0]probe_out18;
  output [35:0]probe_out19;
  output [35:0]probe_out20;
  output [35:0]probe_out21;
  output [35:0]probe_out22;
  output [35:0]probe_out23;
  output [123:0]probe_out24;
  output [123:0]probe_out25;
  output [123:0]probe_out26;
  output [123:0]probe_out27;
  output [123:0]probe_out28;
  output [123:0]probe_out29;
  output [123:0]probe_out30;
  output [123:0]probe_out31;
  output [60:0]probe_out32;
  output [58:0]probe_out33;
  output [58:0]probe_out34;
  output [58:0]probe_out35;
  output [0:0]probe_out36;
  output [0:0]probe_out37;
endmodule
