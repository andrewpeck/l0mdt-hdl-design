// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Fri Nov 24 11:48:24 2023
// Host        : pgkounto-Latitude-5591 running 64-bit Ubuntu 22.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/pgkounto/cernbox/Projects/L0MDT/Vivado/panos/l0mdt-hdl-design/l0mdt_ku15p_ull_empty_usp.gen/sources_1/ip/ila_downlink/ila_downlink_stub.v
// Design      : ila_downlink
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2020.2" *)
module ila_downlink(clk, probe0, probe1, probe2, probe3)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[31:0],probe1[31:0],probe2[1:0],probe3[1:0]" */;
  input clk;
  input [31:0]probe0;
  input [31:0]probe1;
  input [1:0]probe2;
  input [1:0]probe3;
endmodule
