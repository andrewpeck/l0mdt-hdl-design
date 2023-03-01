// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Mon Feb 27 19:15:33 2023
// Host        : VBU2204-1 running 64-bit Ubuntu 22.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/guille/ATLAS/l0mdt-hdl-design/HAL/IP/onboardclk/onboardclk_stub.v
// Design      : onboardclk
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module onboardclk(clk_200MHz, clk_50MHz, clk_100MHz, reset, locked, 
  clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clk_200MHz,clk_50MHz,clk_100MHz,reset,locked,clk_in1_p,clk_in1_n" */;
  output clk_200MHz;
  output clk_50MHz;
  output clk_100MHz;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
