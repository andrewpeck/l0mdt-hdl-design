// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Tue Jan 17 04:57:38 2023
// Host        : VBU2204-1 running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/guille/ATLAS/l0mdt-hdl-design/UserLogic/ucm/IPs/zcalc_vec_pos_div/zcalc_vec_pos_div_stub.v
// Design      : zcalc_vec_pos_div
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu13p-flga2577-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "div_gen_v5_1_17,Vivado 2020.2" *)
module zcalc_vec_pos_div(aclk, aclken, aresetn, s_axis_divisor_tvalid, 
  s_axis_divisor_tdata, s_axis_dividend_tvalid, s_axis_dividend_tdata, 
  m_axis_dout_tvalid, m_axis_dout_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,aclken,aresetn,s_axis_divisor_tvalid,s_axis_divisor_tdata[39:0],s_axis_dividend_tvalid,s_axis_dividend_tdata[39:0],m_axis_dout_tvalid,m_axis_dout_tdata[79:0]" */;
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_divisor_tvalid;
  input [39:0]s_axis_divisor_tdata;
  input s_axis_dividend_tvalid;
  input [39:0]s_axis_dividend_tdata;
  output m_axis_dout_tvalid;
  output [79:0]m_axis_dout_tdata;
endmodule
