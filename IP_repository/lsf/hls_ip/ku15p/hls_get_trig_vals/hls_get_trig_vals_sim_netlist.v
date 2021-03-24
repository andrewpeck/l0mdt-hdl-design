// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Sat Mar 20 09:19:28 2021
// Host        : uciatlaslab.ps.uci.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode funcsim
//               /home/psundara/L0MDT/psundara/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_get_trig_vals/hls_get_trig_vals_sim_netlist.v
// Design      : hls_get_trig_vals
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "hls_get_trig_vals,get_trig_vals,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "HLS" *)
(* x_core_info = "get_trig_vals,Vivado 2019.2.1" *)
(* NotValidForBitStream *)
module hls_get_trig_vals
   (ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    hw_trig_vals_0_V,
    hw_trig_vals_1_V,
    hw_trig_vals_2_V,
    hw_trig_vals_3_V,
    hw_trig_vals_4_V,
    hw_trig_vals_5_V,
    hw_trig_vals_6_V,
    hw_trig_vals_7_V,
    hw_trig_vals_8_V,
    hw_trig_vals_9_V,
    hw_trig_vals_10_V,
    hw_trig_vals_11_V,
    hw_trig_vals_12_V,
    hw_trig_vals_13_V,
    hw_trig_vals_14_V,
    hw_trig_vals_15_V,
    rom_idx_V,
    lut_start_addr_V);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input ap_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ap_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input ap_rst;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) input ap_start;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_0_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_0_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_0_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_1_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_1_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_1_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_2_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_2_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_2_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_3_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_3_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_3_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_4_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_4_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_4_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_5_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_5_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_5_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_6_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_6_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_6_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_7_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_7_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_7_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_8_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_8_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_8_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_9_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_9_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_9_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_10_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_10_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_10_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_11_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_11_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_11_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_12_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_12_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_12_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_13_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_13_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_13_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_14_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_14_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_14_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_trig_vals_15_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_trig_vals_15_V, LAYERED_METADATA undef" *) output [35:0]hw_trig_vals_15_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 rom_idx_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME rom_idx_V, LAYERED_METADATA undef" *) input [2:0]rom_idx_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 lut_start_addr_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME lut_start_addr_V, LAYERED_METADATA undef" *) input [11:0]lut_start_addr_V;

  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst;
  wire ap_start;
  wire [35:0]hw_trig_vals_0_V;
  wire [35:0]hw_trig_vals_10_V;
  wire [35:0]hw_trig_vals_11_V;
  wire [35:0]hw_trig_vals_12_V;
  wire [35:0]hw_trig_vals_13_V;
  wire [35:0]hw_trig_vals_14_V;
  wire [35:0]hw_trig_vals_15_V;
  wire [35:0]hw_trig_vals_1_V;
  wire [35:0]hw_trig_vals_2_V;
  wire [35:0]hw_trig_vals_3_V;
  wire [35:0]hw_trig_vals_4_V;
  wire [35:0]hw_trig_vals_5_V;
  wire [35:0]hw_trig_vals_6_V;
  wire [35:0]hw_trig_vals_7_V;
  wire [35:0]hw_trig_vals_8_V;
  wire [35:0]hw_trig_vals_9_V;
  wire [11:0]lut_start_addr_V;
  wire [2:0]rom_idx_V;

  hls_get_trig_vals_get_trig_vals U0
       (.ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .hw_trig_vals_0_V(hw_trig_vals_0_V),
        .hw_trig_vals_10_V(hw_trig_vals_10_V),
        .hw_trig_vals_11_V(hw_trig_vals_11_V),
        .hw_trig_vals_12_V(hw_trig_vals_12_V),
        .hw_trig_vals_13_V(hw_trig_vals_13_V),
        .hw_trig_vals_14_V(hw_trig_vals_14_V),
        .hw_trig_vals_15_V(hw_trig_vals_15_V),
        .hw_trig_vals_1_V(hw_trig_vals_1_V),
        .hw_trig_vals_2_V(hw_trig_vals_2_V),
        .hw_trig_vals_3_V(hw_trig_vals_3_V),
        .hw_trig_vals_4_V(hw_trig_vals_4_V),
        .hw_trig_vals_5_V(hw_trig_vals_5_V),
        .hw_trig_vals_6_V(hw_trig_vals_6_V),
        .hw_trig_vals_7_V(hw_trig_vals_7_V),
        .hw_trig_vals_8_V(hw_trig_vals_8_V),
        .hw_trig_vals_9_V(hw_trig_vals_9_V),
        .lut_start_addr_V(lut_start_addr_V),
        .rom_idx_V(rom_idx_V));
endmodule

(* ORIG_REF_NAME = "get_trig_vals" *)
module hls_get_trig_vals_get_trig_vals
   (ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    hw_trig_vals_0_V,
    hw_trig_vals_1_V,
    hw_trig_vals_2_V,
    hw_trig_vals_3_V,
    hw_trig_vals_4_V,
    hw_trig_vals_5_V,
    hw_trig_vals_6_V,
    hw_trig_vals_7_V,
    hw_trig_vals_8_V,
    hw_trig_vals_9_V,
    hw_trig_vals_10_V,
    hw_trig_vals_11_V,
    hw_trig_vals_12_V,
    hw_trig_vals_13_V,
    hw_trig_vals_14_V,
    hw_trig_vals_15_V,
    rom_idx_V,
    lut_start_addr_V);
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

  wire [11:2]add_ln1353_10_fu_744_p2;
  wire [12:2]add_ln1353_10_reg_1610;
  wire \add_ln1353_10_reg_1610[11]_i_2_n_0 ;
  wire \add_ln1353_10_reg_1610[12]_i_1_n_0 ;
  wire [10:3]add_ln1353_11_fu_759_p2;
  wire [11:2]add_ln1353_12_fu_784_p2;
  wire [12:2]add_ln1353_12_reg_1632;
  wire \add_ln1353_12_reg_1632[11]_i_2_n_0 ;
  wire \add_ln1353_12_reg_1632[12]_i_1_n_0 ;
  wire [10:3]add_ln1353_13_fu_799_p2;
  wire [11:2]add_ln1353_14_fu_824_p2;
  wire [12:2]add_ln1353_14_reg_1654;
  wire \add_ln1353_14_reg_1654[11]_i_2_n_0 ;
  wire \add_ln1353_14_reg_1654[12]_i_1_n_0 ;
  wire [10:3]add_ln1353_15_fu_839_p2;
  wire [10:3]add_ln1353_1_fu_578_p2;
  wire [11:0]add_ln1353_2_fu_603_p2;
  wire [12:0]add_ln1353_2_reg_1534;
  wire \add_ln1353_2_reg_1534[11]_i_2_n_0 ;
  wire \add_ln1353_2_reg_1534[12]_i_1_n_0 ;
  wire [10:3]add_ln1353_3_fu_618_p2;
  wire [11:1]add_ln1353_4_fu_643_p2;
  wire [12:1]add_ln1353_4_reg_1556;
  wire \add_ln1353_4_reg_1556[11]_i_2_n_0 ;
  wire \add_ln1353_4_reg_1556[12]_i_1_n_0 ;
  wire [10:3]add_ln1353_5_fu_658_p2;
  wire [11:1]add_ln1353_6_fu_683_p2;
  wire [12:1]add_ln1353_6_reg_1578;
  wire \add_ln1353_6_reg_1578[11]_i_2_n_0 ;
  wire \add_ln1353_6_reg_1578[12]_i_1_n_0 ;
  wire [10:3]add_ln1353_7_fu_698_p2;
  wire [12:0]add_ln1353_8_fu_514_p2;
  wire [12:0]add_ln1353_8_reg_1484;
  wire \add_ln1353_8_reg_1484[11]_i_2_n_0 ;
  wire \add_ln1353_8_reg_1484[12]_i_2_n_0 ;
  wire \add_ln1353_8_reg_1484[12]_i_3_n_0 ;
  wire \add_ln1353_8_reg_1484[7]_i_2_n_0 ;
  wire \add_ln1353_8_reg_1484[8]_i_2_n_0 ;
  wire [12:0]add_ln1353_8_reg_1484_pp0_iter1_reg;
  wire [10:3]add_ln1353_9_fu_720_p2;
  wire [12:0]add_ln1353_reg_1512;
  wire \add_ln1353_reg_1512[0]_i_1_n_0 ;
  wire \add_ln1353_reg_1512[11]_i_1_n_0 ;
  wire \add_ln1353_reg_1512[11]_i_2_n_0 ;
  wire \add_ln1353_reg_1512[12]_i_1_n_0 ;
  wire \add_ln1353_reg_1512[12]_i_2_n_0 ;
  wire \add_ln1353_reg_1512[1]_i_1_n_0 ;
  wire \add_ln1353_reg_1512[2]_i_1_n_0 ;
  wire [2:1]add_ln647_1_fu_484_p2;
  wire [2:1]add_ln647_1_reg_1474;
  wire [2:1]add_ln647_2_reg_1479;
  wire [2:2]add_ln647_3_fu_534_p2;
  wire [2:2]add_ln647_3_reg_1497;
  wire [2:2]add_ln647_4_fu_544_p2;
  wire [2:2]add_ln647_4_reg_1502;
  wire [2:0]add_ln647_5_fu_554_p2;
  wire [2:2]add_ln647_5_reg_1507;
  wire [2:2]add_ln647_fu_474_p2;
  wire [2:0]add_ln647_reg_1469;
  wire ap_clk;
  wire ap_done;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter2;
  wire ap_enable_reg_pp0_iter3;
  wire ap_idle;
  wire ap_rst;
  wire ap_start;
  wire [35:0]hw_trig_vals_0_V;
  wire [35:0]hw_trig_vals_10_V;
  wire [35:0]hw_trig_vals_11_V;
  wire [35:0]hw_trig_vals_12_V;
  wire [35:0]hw_trig_vals_13_V;
  wire [35:0]hw_trig_vals_14_V;
  wire [35:0]hw_trig_vals_15_V;
  wire [35:0]hw_trig_vals_1_V;
  wire [35:0]hw_trig_vals_2_V;
  wire [35:0]hw_trig_vals_3_V;
  wire [35:0]hw_trig_vals_4_V;
  wire [35:0]hw_trig_vals_5_V;
  wire [35:0]hw_trig_vals_6_V;
  wire [35:0]hw_trig_vals_7_V;
  wire [35:0]hw_trig_vals_8_V;
  wire [35:0]hw_trig_vals_9_V;
  wire icmp_ln895_10_fu_664_p2;
  wire icmp_ln895_10_reg_1568;
  wire \icmp_ln895_10_reg_1568[0]_i_2_n_0 ;
  wire \icmp_ln895_10_reg_1568[0]_i_3_n_0 ;
  wire \icmp_ln895_10_reg_1568[0]_i_4_n_0 ;
  wire \icmp_ln895_10_reg_1568[0]_i_5_n_0 ;
  wire \icmp_ln895_10_reg_1568[0]_i_6_n_0 ;
  wire icmp_ln895_11_fu_704_p2;
  wire icmp_ln895_11_reg_1590;
  wire \icmp_ln895_11_reg_1590[0]_i_2_n_0 ;
  wire \icmp_ln895_11_reg_1590[0]_i_3_n_0 ;
  wire \icmp_ln895_11_reg_1590[0]_i_4_n_0 ;
  wire \icmp_ln895_11_reg_1590[0]_i_5_n_0 ;
  wire \icmp_ln895_11_reg_1590[0]_i_6_n_0 ;
  wire icmp_ln895_12_fu_725_p2;
  wire icmp_ln895_12_reg_1600;
  wire \icmp_ln895_12_reg_1600[0]_i_2_n_0 ;
  wire \icmp_ln895_12_reg_1600[0]_i_3_n_0 ;
  wire \icmp_ln895_12_reg_1600[0]_i_4_n_0 ;
  wire icmp_ln895_13_fu_765_p2;
  wire icmp_ln895_13_reg_1622;
  wire \icmp_ln895_13_reg_1622[0]_i_2_n_0 ;
  wire \icmp_ln895_13_reg_1622[0]_i_3_n_0 ;
  wire \icmp_ln895_13_reg_1622[0]_i_4_n_0 ;
  wire \icmp_ln895_13_reg_1622[0]_i_5_n_0 ;
  wire \icmp_ln895_13_reg_1622[0]_i_6_n_0 ;
  wire icmp_ln895_14_fu_805_p2;
  wire icmp_ln895_14_reg_1644;
  wire \icmp_ln895_14_reg_1644[0]_i_2_n_0 ;
  wire \icmp_ln895_14_reg_1644[0]_i_3_n_0 ;
  wire \icmp_ln895_14_reg_1644[0]_i_4_n_0 ;
  wire \icmp_ln895_14_reg_1644[0]_i_5_n_0 ;
  wire \icmp_ln895_14_reg_1644[0]_i_6_n_0 ;
  wire icmp_ln895_15_fu_845_p2;
  wire icmp_ln895_15_reg_1666;
  wire \icmp_ln895_15_reg_1666[0]_i_2_n_0 ;
  wire \icmp_ln895_15_reg_1666[0]_i_3_n_0 ;
  wire \icmp_ln895_15_reg_1666[0]_i_4_n_0 ;
  wire \icmp_ln895_15_reg_1666[0]_i_5_n_0 ;
  wire \icmp_ln895_15_reg_1666[0]_i_6_n_0 ;
  wire icmp_ln895_1_fu_584_p2;
  wire icmp_ln895_1_reg_1524;
  wire \icmp_ln895_1_reg_1524[0]_i_2_n_0 ;
  wire \icmp_ln895_1_reg_1524[0]_i_3_n_0 ;
  wire \icmp_ln895_1_reg_1524[0]_i_4_n_0 ;
  wire \icmp_ln895_1_reg_1524[0]_i_5_n_0 ;
  wire \icmp_ln895_1_reg_1524[0]_i_6_n_0 ;
  wire \icmp_ln895_1_reg_1524[0]_i_7_n_0 ;
  wire \icmp_ln895_1_reg_1524[0]_i_8_n_0 ;
  wire icmp_ln895_9_fu_624_p2;
  wire icmp_ln895_9_reg_1546;
  wire \icmp_ln895_9_reg_1546[0]_i_2_n_0 ;
  wire \icmp_ln895_9_reg_1546[0]_i_3_n_0 ;
  wire \icmp_ln895_9_reg_1546[0]_i_4_n_0 ;
  wire \icmp_ln895_9_reg_1546[0]_i_5_n_0 ;
  wire \icmp_ln895_9_reg_1546[0]_i_6_n_0 ;
  wire [11:0]lut_start_addr_V;
  wire [7:0]p_0_in;
  wire [2:1]ret_V_fu_456_p2;
  wire [2:0]rom_idx_V;
  wire [7:0]tmp_11_reg_1627;
  wire \tmp_11_reg_1627[6]_i_2_n_0 ;
  wire \tmp_11_reg_1627[7]_i_2_n_0 ;
  wire [7:0]tmp_13_reg_1649;
  wire \tmp_13_reg_1649[6]_i_2_n_0 ;
  wire \tmp_13_reg_1649[7]_i_2_n_0 ;
  wire [7:0]tmp_15_reg_1671;
  wire \tmp_15_reg_1671[6]_i_2_n_0 ;
  wire \tmp_15_reg_1671[7]_i_2_n_0 ;
  wire [7:0]tmp_1_reg_1529;
  wire \tmp_1_reg_1529[0]_i_2_n_0 ;
  wire \tmp_1_reg_1529[6]_i_2_n_0 ;
  wire \tmp_1_reg_1529[6]_i_3_n_0 ;
  wire \tmp_1_reg_1529[6]_i_4_n_0 ;
  wire \tmp_1_reg_1529[7]_i_2_n_0 ;
  wire [7:0]tmp_3_reg_1551;
  wire \tmp_3_reg_1551[6]_i_2_n_0 ;
  wire \tmp_3_reg_1551[7]_i_2_n_0 ;
  wire [7:0]tmp_5_reg_1573;
  wire \tmp_5_reg_1573[6]_i_2_n_0 ;
  wire \tmp_5_reg_1573[7]_i_2_n_0 ;
  wire [7:0]tmp_7_reg_1595;
  wire \tmp_7_reg_1595[6]_i_2_n_0 ;
  wire \tmp_7_reg_1595[7]_i_2_n_0 ;
  wire [7:0]tmp_9_reg_1605;
  wire \tmp_9_reg_1605[7]_i_2_n_0 ;
  wire [2:0]trunc_ln647_reg_1464;
  wire [11:0]zext_ln215_reg_1453;

  assign ap_ready = ap_start;
  (* SOFT_HLUTNM = "soft_lutpair27" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_10_reg_1610[10]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[7]),
        .I2(zext_ln215_reg_1453[8]),
        .I3(\add_ln1353_10_reg_1610[11]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[10]),
        .O(add_ln1353_10_fu_744_p2[10]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_10_reg_1610[11]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[10]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[8]),
        .I4(\add_ln1353_10_reg_1610[11]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[11]),
        .O(add_ln1353_10_fu_744_p2[11]));
  (* SOFT_HLUTNM = "soft_lutpair26" *)
  LUT5 #(
    .INIT(32'h80000000))
    \add_ln1353_10_reg_1610[11]_i_2
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[6]),
        .I2(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[3]),
        .O(\add_ln1353_10_reg_1610[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *)
  LUT3 #(
    .INIT(8'h80))
    \add_ln1353_10_reg_1610[12]_i_1
       (.I0(zext_ln215_reg_1453[7]),
        .I1(zext_ln215_reg_1453[8]),
        .I2(\add_ln1353_10_reg_1610[11]_i_2_n_0 ),
        .O(\add_ln1353_10_reg_1610[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9999966696666666))
    \add_ln1353_10_reg_1610[2]_i_1
       (.I0(zext_ln215_reg_1453[2]),
        .I1(add_ln647_3_reg_1497),
        .I2(add_ln647_reg_1469[0]),
        .I3(zext_ln215_reg_1453[0]),
        .I4(zext_ln215_reg_1453[1]),
        .I5(add_ln647_reg_1469[1]),
        .O(add_ln1353_10_fu_744_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair88" *)
  LUT2 #(
    .INIT(4'h6))
    \add_ln1353_10_reg_1610[3]_i_1
       (.I0(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .O(add_ln1353_10_fu_744_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair68" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_10_reg_1610[4]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(add_ln1353_10_fu_744_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair32" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_10_reg_1610[5]_i_1
       (.I0(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(add_ln1353_10_fu_744_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair45" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_10_reg_1610[6]_i_1
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[4]),
        .I3(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[6]),
        .O(add_ln1353_10_fu_744_p2[6]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_10_reg_1610[7]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[6]),
        .I4(zext_ln215_reg_1453[5]),
        .I5(zext_ln215_reg_1453[7]),
        .O(add_ln1353_10_fu_744_p2[7]));
  (* SOFT_HLUTNM = "soft_lutpair64" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_10_reg_1610[8]_i_1
       (.I0(zext_ln215_reg_1453[7]),
        .I1(\add_ln1353_10_reg_1610[11]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[8]),
        .O(add_ln1353_10_fu_744_p2[8]));
  (* SOFT_HLUTNM = "soft_lutpair27" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_10_reg_1610[9]_i_1
       (.I0(\add_ln1353_10_reg_1610[11]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[8]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[9]),
        .O(add_ln1353_10_fu_744_p2[9]));
  FDRE \add_ln1353_10_reg_1610_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_10_fu_744_p2[10]),
        .Q(add_ln1353_10_reg_1610[10]),
        .R(1'b0));
  FDRE \add_ln1353_10_reg_1610_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_10_fu_744_p2[11]),
        .Q(add_ln1353_10_reg_1610[11]),
        .R(1'b0));
  FDRE \add_ln1353_10_reg_1610_reg[12]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\add_ln1353_10_reg_1610[12]_i_1_n_0 ),
        .Q(add_ln1353_10_reg_1610[12]),
        .R(\add_ln1353_reg_1512[12]_i_1_n_0 ));
  FDRE \add_ln1353_10_reg_1610_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_10_fu_744_p2[2]),
        .Q(add_ln1353_10_reg_1610[2]),
        .R(1'b0));
  FDRE \add_ln1353_10_reg_1610_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_10_fu_744_p2[3]),
        .Q(add_ln1353_10_reg_1610[3]),
        .R(1'b0));
  FDRE \add_ln1353_10_reg_1610_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_10_fu_744_p2[4]),
        .Q(add_ln1353_10_reg_1610[4]),
        .R(1'b0));
  FDRE \add_ln1353_10_reg_1610_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_10_fu_744_p2[5]),
        .Q(add_ln1353_10_reg_1610[5]),
        .R(1'b0));
  FDRE \add_ln1353_10_reg_1610_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_10_fu_744_p2[6]),
        .Q(add_ln1353_10_reg_1610[6]),
        .R(1'b0));
  FDRE \add_ln1353_10_reg_1610_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_10_fu_744_p2[7]),
        .Q(add_ln1353_10_reg_1610[7]),
        .R(1'b0));
  FDRE \add_ln1353_10_reg_1610_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_10_fu_744_p2[8]),
        .Q(add_ln1353_10_reg_1610[8]),
        .R(1'b0));
  FDRE \add_ln1353_10_reg_1610_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_10_fu_744_p2[9]),
        .Q(add_ln1353_10_reg_1610[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair25" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_12_reg_1632[10]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[7]),
        .I2(zext_ln215_reg_1453[8]),
        .I3(\add_ln1353_12_reg_1632[11]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[10]),
        .O(add_ln1353_12_fu_784_p2[10]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_12_reg_1632[11]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[10]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[8]),
        .I4(\add_ln1353_12_reg_1632[11]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[11]),
        .O(add_ln1353_12_fu_784_p2[11]));
  (* SOFT_HLUTNM = "soft_lutpair30" *)
  LUT5 #(
    .INIT(32'h80000000))
    \add_ln1353_12_reg_1632[11]_i_2
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[6]),
        .I2(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[3]),
        .O(\add_ln1353_12_reg_1632[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *)
  LUT3 #(
    .INIT(8'h80))
    \add_ln1353_12_reg_1632[12]_i_1
       (.I0(zext_ln215_reg_1453[7]),
        .I1(zext_ln215_reg_1453[8]),
        .I2(\add_ln1353_12_reg_1632[11]_i_2_n_0 ),
        .O(\add_ln1353_12_reg_1632[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9996969696666666))
    \add_ln1353_12_reg_1632[2]_i_1
       (.I0(zext_ln215_reg_1453[2]),
        .I1(add_ln647_4_reg_1502),
        .I2(zext_ln215_reg_1453[1]),
        .I3(trunc_ln647_reg_1464[0]),
        .I4(zext_ln215_reg_1453[0]),
        .I5(add_ln647_1_reg_1474[1]),
        .O(add_ln1353_12_fu_784_p2[2]));
  LUT6 #(
    .INIT(64'h001717FFFFE8E800))
    \add_ln1353_12_reg_1632[3]_i_1
       (.I0(zext_ln215_reg_1453[1]),
        .I1(\tmp_1_reg_1529[0]_i_2_n_0 ),
        .I2(add_ln647_1_reg_1474[1]),
        .I3(zext_ln215_reg_1453[2]),
        .I4(add_ln647_4_reg_1502),
        .I5(zext_ln215_reg_1453[3]),
        .O(add_ln1353_12_fu_784_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair74" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_12_reg_1632[4]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(add_ln1353_12_fu_784_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair42" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_12_reg_1632[5]_i_1
       (.I0(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(add_ln1353_12_fu_784_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair55" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_12_reg_1632[6]_i_1
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[4]),
        .I3(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[6]),
        .O(add_ln1353_12_fu_784_p2[6]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_12_reg_1632[7]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[6]),
        .I4(zext_ln215_reg_1453[5]),
        .I5(zext_ln215_reg_1453[7]),
        .O(add_ln1353_12_fu_784_p2[7]));
  (* SOFT_HLUTNM = "soft_lutpair75" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_12_reg_1632[8]_i_1
       (.I0(zext_ln215_reg_1453[7]),
        .I1(\add_ln1353_12_reg_1632[11]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[8]),
        .O(add_ln1353_12_fu_784_p2[8]));
  (* SOFT_HLUTNM = "soft_lutpair25" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_12_reg_1632[9]_i_1
       (.I0(\add_ln1353_12_reg_1632[11]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[8]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[9]),
        .O(add_ln1353_12_fu_784_p2[9]));
  FDRE \add_ln1353_12_reg_1632_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_12_fu_784_p2[10]),
        .Q(add_ln1353_12_reg_1632[10]),
        .R(1'b0));
  FDRE \add_ln1353_12_reg_1632_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_12_fu_784_p2[11]),
        .Q(add_ln1353_12_reg_1632[11]),
        .R(1'b0));
  FDRE \add_ln1353_12_reg_1632_reg[12]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\add_ln1353_12_reg_1632[12]_i_1_n_0 ),
        .Q(add_ln1353_12_reg_1632[12]),
        .R(\add_ln1353_reg_1512[12]_i_1_n_0 ));
  FDRE \add_ln1353_12_reg_1632_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_12_fu_784_p2[2]),
        .Q(add_ln1353_12_reg_1632[2]),
        .R(1'b0));
  FDRE \add_ln1353_12_reg_1632_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_12_fu_784_p2[3]),
        .Q(add_ln1353_12_reg_1632[3]),
        .R(1'b0));
  FDRE \add_ln1353_12_reg_1632_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_12_fu_784_p2[4]),
        .Q(add_ln1353_12_reg_1632[4]),
        .R(1'b0));
  FDRE \add_ln1353_12_reg_1632_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_12_fu_784_p2[5]),
        .Q(add_ln1353_12_reg_1632[5]),
        .R(1'b0));
  FDRE \add_ln1353_12_reg_1632_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_12_fu_784_p2[6]),
        .Q(add_ln1353_12_reg_1632[6]),
        .R(1'b0));
  FDRE \add_ln1353_12_reg_1632_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_12_fu_784_p2[7]),
        .Q(add_ln1353_12_reg_1632[7]),
        .R(1'b0));
  FDRE \add_ln1353_12_reg_1632_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_12_fu_784_p2[8]),
        .Q(add_ln1353_12_reg_1632[8]),
        .R(1'b0));
  FDRE \add_ln1353_12_reg_1632_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_12_fu_784_p2[9]),
        .Q(add_ln1353_12_reg_1632[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair28" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_14_reg_1654[10]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[7]),
        .I2(zext_ln215_reg_1453[8]),
        .I3(\add_ln1353_14_reg_1654[11]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[10]),
        .O(add_ln1353_14_fu_824_p2[10]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_14_reg_1654[11]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[10]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[8]),
        .I4(\add_ln1353_14_reg_1654[11]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[11]),
        .O(add_ln1353_14_fu_824_p2[11]));
  (* SOFT_HLUTNM = "soft_lutpair39" *)
  LUT5 #(
    .INIT(32'h80000000))
    \add_ln1353_14_reg_1654[11]_i_2
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[6]),
        .I2(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[3]),
        .O(\add_ln1353_14_reg_1654[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *)
  LUT3 #(
    .INIT(8'h80))
    \add_ln1353_14_reg_1654[12]_i_1
       (.I0(zext_ln215_reg_1453[7]),
        .I1(zext_ln215_reg_1453[8]),
        .I2(\add_ln1353_14_reg_1654[11]_i_2_n_0 ),
        .O(\add_ln1353_14_reg_1654[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9999966696666666))
    \add_ln1353_14_reg_1654[2]_i_1
       (.I0(zext_ln215_reg_1453[2]),
        .I1(add_ln647_5_reg_1507),
        .I2(add_ln647_reg_1469[0]),
        .I3(zext_ln215_reg_1453[0]),
        .I4(zext_ln215_reg_1453[1]),
        .I5(add_ln647_2_reg_1479[1]),
        .O(add_ln1353_14_fu_824_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair89" *)
  LUT2 #(
    .INIT(4'h6))
    \add_ln1353_14_reg_1654[3]_i_1
       (.I0(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .O(add_ln1353_14_fu_824_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair65" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_14_reg_1654[4]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(add_ln1353_14_fu_824_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair40" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_14_reg_1654[5]_i_1
       (.I0(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(add_ln1353_14_fu_824_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair46" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_14_reg_1654[6]_i_1
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[4]),
        .I3(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[6]),
        .O(add_ln1353_14_fu_824_p2[6]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_14_reg_1654[7]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[6]),
        .I4(zext_ln215_reg_1453[5]),
        .I5(zext_ln215_reg_1453[7]),
        .O(add_ln1353_14_fu_824_p2[7]));
  (* SOFT_HLUTNM = "soft_lutpair69" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_14_reg_1654[8]_i_1
       (.I0(zext_ln215_reg_1453[7]),
        .I1(\add_ln1353_14_reg_1654[11]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[8]),
        .O(add_ln1353_14_fu_824_p2[8]));
  (* SOFT_HLUTNM = "soft_lutpair28" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_14_reg_1654[9]_i_1
       (.I0(\add_ln1353_14_reg_1654[11]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[8]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[9]),
        .O(add_ln1353_14_fu_824_p2[9]));
  FDRE \add_ln1353_14_reg_1654_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_14_fu_824_p2[10]),
        .Q(add_ln1353_14_reg_1654[10]),
        .R(1'b0));
  FDRE \add_ln1353_14_reg_1654_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_14_fu_824_p2[11]),
        .Q(add_ln1353_14_reg_1654[11]),
        .R(1'b0));
  FDRE \add_ln1353_14_reg_1654_reg[12]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\add_ln1353_14_reg_1654[12]_i_1_n_0 ),
        .Q(add_ln1353_14_reg_1654[12]),
        .R(\add_ln1353_reg_1512[12]_i_1_n_0 ));
  FDRE \add_ln1353_14_reg_1654_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_14_fu_824_p2[2]),
        .Q(add_ln1353_14_reg_1654[2]),
        .R(1'b0));
  FDRE \add_ln1353_14_reg_1654_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_14_fu_824_p2[3]),
        .Q(add_ln1353_14_reg_1654[3]),
        .R(1'b0));
  FDRE \add_ln1353_14_reg_1654_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_14_fu_824_p2[4]),
        .Q(add_ln1353_14_reg_1654[4]),
        .R(1'b0));
  FDRE \add_ln1353_14_reg_1654_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_14_fu_824_p2[5]),
        .Q(add_ln1353_14_reg_1654[5]),
        .R(1'b0));
  FDRE \add_ln1353_14_reg_1654_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_14_fu_824_p2[6]),
        .Q(add_ln1353_14_reg_1654[6]),
        .R(1'b0));
  FDRE \add_ln1353_14_reg_1654_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_14_fu_824_p2[7]),
        .Q(add_ln1353_14_reg_1654[7]),
        .R(1'b0));
  FDRE \add_ln1353_14_reg_1654_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_14_fu_824_p2[8]),
        .Q(add_ln1353_14_reg_1654[8]),
        .R(1'b0));
  FDRE \add_ln1353_14_reg_1654_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_14_fu_824_p2[9]),
        .Q(add_ln1353_14_reg_1654[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6))
    \add_ln1353_2_reg_1534[0]_i_1
       (.I0(add_ln647_reg_1469[0]),
        .I1(zext_ln215_reg_1453[0]),
        .O(add_ln1353_2_fu_603_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair38" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_2_reg_1534[10]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[7]),
        .I2(zext_ln215_reg_1453[8]),
        .I3(\add_ln1353_2_reg_1534[11]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[10]),
        .O(add_ln1353_2_fu_603_p2[10]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_2_reg_1534[11]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[10]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[8]),
        .I4(\add_ln1353_2_reg_1534[11]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[11]),
        .O(add_ln1353_2_fu_603_p2[11]));
  (* SOFT_HLUTNM = "soft_lutpair37" *)
  LUT5 #(
    .INIT(32'h80000000))
    \add_ln1353_2_reg_1534[11]_i_2
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[6]),
        .I2(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[3]),
        .O(\add_ln1353_2_reg_1534[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *)
  LUT3 #(
    .INIT(8'h80))
    \add_ln1353_2_reg_1534[12]_i_1
       (.I0(zext_ln215_reg_1453[7]),
        .I1(zext_ln215_reg_1453[8]),
        .I2(\add_ln1353_2_reg_1534[11]_i_2_n_0 ),
        .O(\add_ln1353_2_reg_1534[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *)
  LUT4 #(
    .INIT(16'h956A))
    \add_ln1353_2_reg_1534[1]_i_1
       (.I0(add_ln647_reg_1469[1]),
        .I1(add_ln647_reg_1469[0]),
        .I2(zext_ln215_reg_1453[0]),
        .I3(zext_ln215_reg_1453[1]),
        .O(add_ln1353_2_fu_603_p2[1]));
  LUT6 #(
    .INIT(64'h9999966696666666))
    \add_ln1353_2_reg_1534[2]_i_1
       (.I0(zext_ln215_reg_1453[2]),
        .I1(add_ln647_reg_1469[2]),
        .I2(add_ln647_reg_1469[0]),
        .I3(zext_ln215_reg_1453[0]),
        .I4(zext_ln215_reg_1453[1]),
        .I5(add_ln647_reg_1469[1]),
        .O(add_ln1353_2_fu_603_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair87" *)
  LUT2 #(
    .INIT(4'h6))
    \add_ln1353_2_reg_1534[3]_i_1
       (.I0(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .O(add_ln1353_2_fu_603_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair72" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_2_reg_1534[4]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(add_ln1353_2_fu_603_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair44" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_2_reg_1534[5]_i_1
       (.I0(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(add_ln1353_2_fu_603_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair49" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_2_reg_1534[6]_i_1
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[4]),
        .I3(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[6]),
        .O(add_ln1353_2_fu_603_p2[6]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_2_reg_1534[7]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[6]),
        .I4(zext_ln215_reg_1453[5]),
        .I5(zext_ln215_reg_1453[7]),
        .O(add_ln1353_2_fu_603_p2[7]));
  (* SOFT_HLUTNM = "soft_lutpair75" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_2_reg_1534[8]_i_1
       (.I0(zext_ln215_reg_1453[7]),
        .I1(\add_ln1353_2_reg_1534[11]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[8]),
        .O(add_ln1353_2_fu_603_p2[8]));
  (* SOFT_HLUTNM = "soft_lutpair38" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_2_reg_1534[9]_i_1
       (.I0(\add_ln1353_2_reg_1534[11]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[8]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[9]),
        .O(add_ln1353_2_fu_603_p2[9]));
  FDRE \add_ln1353_2_reg_1534_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_2_fu_603_p2[0]),
        .Q(add_ln1353_2_reg_1534[0]),
        .R(1'b0));
  FDRE \add_ln1353_2_reg_1534_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_2_fu_603_p2[10]),
        .Q(add_ln1353_2_reg_1534[10]),
        .R(1'b0));
  FDRE \add_ln1353_2_reg_1534_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_2_fu_603_p2[11]),
        .Q(add_ln1353_2_reg_1534[11]),
        .R(1'b0));
  FDRE \add_ln1353_2_reg_1534_reg[12]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\add_ln1353_2_reg_1534[12]_i_1_n_0 ),
        .Q(add_ln1353_2_reg_1534[12]),
        .R(\add_ln1353_reg_1512[12]_i_1_n_0 ));
  FDRE \add_ln1353_2_reg_1534_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_2_fu_603_p2[1]),
        .Q(add_ln1353_2_reg_1534[1]),
        .R(1'b0));
  FDRE \add_ln1353_2_reg_1534_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_2_fu_603_p2[2]),
        .Q(add_ln1353_2_reg_1534[2]),
        .R(1'b0));
  FDRE \add_ln1353_2_reg_1534_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_2_fu_603_p2[3]),
        .Q(add_ln1353_2_reg_1534[3]),
        .R(1'b0));
  FDRE \add_ln1353_2_reg_1534_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_2_fu_603_p2[4]),
        .Q(add_ln1353_2_reg_1534[4]),
        .R(1'b0));
  FDRE \add_ln1353_2_reg_1534_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_2_fu_603_p2[5]),
        .Q(add_ln1353_2_reg_1534[5]),
        .R(1'b0));
  FDRE \add_ln1353_2_reg_1534_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_2_fu_603_p2[6]),
        .Q(add_ln1353_2_reg_1534[6]),
        .R(1'b0));
  FDRE \add_ln1353_2_reg_1534_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_2_fu_603_p2[7]),
        .Q(add_ln1353_2_reg_1534[7]),
        .R(1'b0));
  FDRE \add_ln1353_2_reg_1534_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_2_fu_603_p2[8]),
        .Q(add_ln1353_2_reg_1534[8]),
        .R(1'b0));
  FDRE \add_ln1353_2_reg_1534_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_2_fu_603_p2[9]),
        .Q(add_ln1353_2_reg_1534[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair31" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_4_reg_1556[10]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[7]),
        .I2(zext_ln215_reg_1453[8]),
        .I3(\add_ln1353_4_reg_1556[11]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[10]),
        .O(add_ln1353_4_fu_643_p2[10]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_4_reg_1556[11]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[10]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[8]),
        .I4(\add_ln1353_4_reg_1556[11]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[11]),
        .O(add_ln1353_4_fu_643_p2[11]));
  (* SOFT_HLUTNM = "soft_lutpair29" *)
  LUT5 #(
    .INIT(32'h80000000))
    \add_ln1353_4_reg_1556[11]_i_2
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[6]),
        .I2(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[3]),
        .O(\add_ln1353_4_reg_1556[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *)
  LUT3 #(
    .INIT(8'h80))
    \add_ln1353_4_reg_1556[12]_i_1
       (.I0(zext_ln215_reg_1453[7]),
        .I1(zext_ln215_reg_1453[8]),
        .I2(\add_ln1353_4_reg_1556[11]_i_2_n_0 ),
        .O(\add_ln1353_4_reg_1556[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *)
  LUT4 #(
    .INIT(16'h9666))
    \add_ln1353_4_reg_1556[1]_i_1
       (.I0(zext_ln215_reg_1453[1]),
        .I1(add_ln647_1_reg_1474[1]),
        .I2(trunc_ln647_reg_1464[0]),
        .I3(zext_ln215_reg_1453[0]),
        .O(add_ln1353_4_fu_643_p2[1]));
  LUT6 #(
    .INIT(64'h9996969696666666))
    \add_ln1353_4_reg_1556[2]_i_1
       (.I0(zext_ln215_reg_1453[2]),
        .I1(add_ln647_1_reg_1474[2]),
        .I2(zext_ln215_reg_1453[1]),
        .I3(trunc_ln647_reg_1464[0]),
        .I4(zext_ln215_reg_1453[0]),
        .I5(add_ln647_1_reg_1474[1]),
        .O(add_ln1353_4_fu_643_p2[2]));
  LUT6 #(
    .INIT(64'h001717FFFFE8E800))
    \add_ln1353_4_reg_1556[3]_i_1
       (.I0(zext_ln215_reg_1453[1]),
        .I1(\tmp_1_reg_1529[0]_i_2_n_0 ),
        .I2(add_ln647_1_reg_1474[1]),
        .I3(zext_ln215_reg_1453[2]),
        .I4(add_ln647_1_reg_1474[2]),
        .I5(zext_ln215_reg_1453[3]),
        .O(add_ln1353_4_fu_643_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair67" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_4_reg_1556[4]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(add_ln1353_4_fu_643_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair41" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_4_reg_1556[5]_i_1
       (.I0(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(add_ln1353_4_fu_643_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair52" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_4_reg_1556[6]_i_1
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[4]),
        .I3(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[6]),
        .O(add_ln1353_4_fu_643_p2[6]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_4_reg_1556[7]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[6]),
        .I4(zext_ln215_reg_1453[5]),
        .I5(zext_ln215_reg_1453[7]),
        .O(add_ln1353_4_fu_643_p2[7]));
  (* SOFT_HLUTNM = "soft_lutpair76" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_4_reg_1556[8]_i_1
       (.I0(zext_ln215_reg_1453[7]),
        .I1(\add_ln1353_4_reg_1556[11]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[8]),
        .O(add_ln1353_4_fu_643_p2[8]));
  (* SOFT_HLUTNM = "soft_lutpair31" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_4_reg_1556[9]_i_1
       (.I0(\add_ln1353_4_reg_1556[11]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[8]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[9]),
        .O(add_ln1353_4_fu_643_p2[9]));
  FDRE \add_ln1353_4_reg_1556_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_4_fu_643_p2[10]),
        .Q(add_ln1353_4_reg_1556[10]),
        .R(1'b0));
  FDRE \add_ln1353_4_reg_1556_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_4_fu_643_p2[11]),
        .Q(add_ln1353_4_reg_1556[11]),
        .R(1'b0));
  FDRE \add_ln1353_4_reg_1556_reg[12]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\add_ln1353_4_reg_1556[12]_i_1_n_0 ),
        .Q(add_ln1353_4_reg_1556[12]),
        .R(\add_ln1353_reg_1512[12]_i_1_n_0 ));
  FDRE \add_ln1353_4_reg_1556_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_4_fu_643_p2[1]),
        .Q(add_ln1353_4_reg_1556[1]),
        .R(1'b0));
  FDRE \add_ln1353_4_reg_1556_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_4_fu_643_p2[2]),
        .Q(add_ln1353_4_reg_1556[2]),
        .R(1'b0));
  FDRE \add_ln1353_4_reg_1556_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_4_fu_643_p2[3]),
        .Q(add_ln1353_4_reg_1556[3]),
        .R(1'b0));
  FDRE \add_ln1353_4_reg_1556_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_4_fu_643_p2[4]),
        .Q(add_ln1353_4_reg_1556[4]),
        .R(1'b0));
  FDRE \add_ln1353_4_reg_1556_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_4_fu_643_p2[5]),
        .Q(add_ln1353_4_reg_1556[5]),
        .R(1'b0));
  FDRE \add_ln1353_4_reg_1556_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_4_fu_643_p2[6]),
        .Q(add_ln1353_4_reg_1556[6]),
        .R(1'b0));
  FDRE \add_ln1353_4_reg_1556_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_4_fu_643_p2[7]),
        .Q(add_ln1353_4_reg_1556[7]),
        .R(1'b0));
  FDRE \add_ln1353_4_reg_1556_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_4_fu_643_p2[8]),
        .Q(add_ln1353_4_reg_1556[8]),
        .R(1'b0));
  FDRE \add_ln1353_4_reg_1556_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_4_fu_643_p2[9]),
        .Q(add_ln1353_4_reg_1556[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair24" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_6_reg_1578[10]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[7]),
        .I2(zext_ln215_reg_1453[8]),
        .I3(\add_ln1353_6_reg_1578[11]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[10]),
        .O(add_ln1353_6_fu_683_p2[10]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_6_reg_1578[11]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[10]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[8]),
        .I4(\add_ln1353_6_reg_1578[11]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[11]),
        .O(add_ln1353_6_fu_683_p2[11]));
  (* SOFT_HLUTNM = "soft_lutpair35" *)
  LUT5 #(
    .INIT(32'h80000000))
    \add_ln1353_6_reg_1578[11]_i_2
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[6]),
        .I2(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[3]),
        .O(\add_ln1353_6_reg_1578[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *)
  LUT3 #(
    .INIT(8'h80))
    \add_ln1353_6_reg_1578[12]_i_1
       (.I0(zext_ln215_reg_1453[7]),
        .I1(zext_ln215_reg_1453[8]),
        .I2(\add_ln1353_6_reg_1578[11]_i_2_n_0 ),
        .O(\add_ln1353_6_reg_1578[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *)
  LUT4 #(
    .INIT(16'h956A))
    \add_ln1353_6_reg_1578[1]_i_1
       (.I0(add_ln647_2_reg_1479[1]),
        .I1(add_ln647_reg_1469[0]),
        .I2(zext_ln215_reg_1453[0]),
        .I3(zext_ln215_reg_1453[1]),
        .O(add_ln1353_6_fu_683_p2[1]));
  LUT6 #(
    .INIT(64'h9999966696666666))
    \add_ln1353_6_reg_1578[2]_i_1
       (.I0(zext_ln215_reg_1453[2]),
        .I1(add_ln647_2_reg_1479[2]),
        .I2(add_ln647_reg_1469[0]),
        .I3(zext_ln215_reg_1453[0]),
        .I4(zext_ln215_reg_1453[1]),
        .I5(add_ln647_2_reg_1479[1]),
        .O(add_ln1353_6_fu_683_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair90" *)
  LUT2 #(
    .INIT(4'h6))
    \add_ln1353_6_reg_1578[3]_i_1
       (.I0(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .O(add_ln1353_6_fu_683_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair77" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_6_reg_1578[4]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(add_ln1353_6_fu_683_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair43" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_6_reg_1578[5]_i_1
       (.I0(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(add_ln1353_6_fu_683_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair50" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_6_reg_1578[6]_i_1
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[4]),
        .I3(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[6]),
        .O(add_ln1353_6_fu_683_p2[6]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_6_reg_1578[7]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[6]),
        .I4(zext_ln215_reg_1453[5]),
        .I5(zext_ln215_reg_1453[7]),
        .O(add_ln1353_6_fu_683_p2[7]));
  (* SOFT_HLUTNM = "soft_lutpair69" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_6_reg_1578[8]_i_1
       (.I0(zext_ln215_reg_1453[7]),
        .I1(\add_ln1353_6_reg_1578[11]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[8]),
        .O(add_ln1353_6_fu_683_p2[8]));
  (* SOFT_HLUTNM = "soft_lutpair24" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_6_reg_1578[9]_i_1
       (.I0(\add_ln1353_6_reg_1578[11]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[8]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[9]),
        .O(add_ln1353_6_fu_683_p2[9]));
  FDRE \add_ln1353_6_reg_1578_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_6_fu_683_p2[10]),
        .Q(add_ln1353_6_reg_1578[10]),
        .R(1'b0));
  FDRE \add_ln1353_6_reg_1578_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_6_fu_683_p2[11]),
        .Q(add_ln1353_6_reg_1578[11]),
        .R(1'b0));
  FDRE \add_ln1353_6_reg_1578_reg[12]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\add_ln1353_6_reg_1578[12]_i_1_n_0 ),
        .Q(add_ln1353_6_reg_1578[12]),
        .R(\add_ln1353_reg_1512[12]_i_1_n_0 ));
  FDRE \add_ln1353_6_reg_1578_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_6_fu_683_p2[1]),
        .Q(add_ln1353_6_reg_1578[1]),
        .R(1'b0));
  FDRE \add_ln1353_6_reg_1578_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_6_fu_683_p2[2]),
        .Q(add_ln1353_6_reg_1578[2]),
        .R(1'b0));
  FDRE \add_ln1353_6_reg_1578_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_6_fu_683_p2[3]),
        .Q(add_ln1353_6_reg_1578[3]),
        .R(1'b0));
  FDRE \add_ln1353_6_reg_1578_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_6_fu_683_p2[4]),
        .Q(add_ln1353_6_reg_1578[4]),
        .R(1'b0));
  FDRE \add_ln1353_6_reg_1578_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_6_fu_683_p2[5]),
        .Q(add_ln1353_6_reg_1578[5]),
        .R(1'b0));
  FDRE \add_ln1353_6_reg_1578_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_6_fu_683_p2[6]),
        .Q(add_ln1353_6_reg_1578[6]),
        .R(1'b0));
  FDRE \add_ln1353_6_reg_1578_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_6_fu_683_p2[7]),
        .Q(add_ln1353_6_reg_1578[7]),
        .R(1'b0));
  FDRE \add_ln1353_6_reg_1578_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_6_fu_683_p2[8]),
        .Q(add_ln1353_6_reg_1578[8]),
        .R(1'b0));
  FDRE \add_ln1353_6_reg_1578_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_6_fu_683_p2[9]),
        .Q(add_ln1353_6_reg_1578[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair58" *)
  LUT2 #(
    .INIT(4'h6))
    \add_ln1353_8_reg_1484[0]_i_1
       (.I0(rom_idx_V[0]),
        .I1(lut_start_addr_V[0]),
        .O(add_ln1353_8_fu_514_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair51" *)
  LUT5 #(
    .INIT(32'hF0CAF0F0))
    \add_ln1353_8_reg_1484[10]_i_1
       (.I0(\add_ln1353_8_reg_1484[12]_i_2_n_0 ),
        .I1(\add_ln1353_8_reg_1484[11]_i_2_n_0 ),
        .I2(lut_start_addr_V[10]),
        .I3(\add_ln1353_8_reg_1484[12]_i_3_n_0 ),
        .I4(lut_start_addr_V[9]),
        .O(add_ln1353_8_fu_514_p2[10]));
  LUT6 #(
    .INIT(64'hF0F0CAF0F0F0F0F0))
    \add_ln1353_8_reg_1484[11]_i_1
       (.I0(\add_ln1353_8_reg_1484[12]_i_2_n_0 ),
        .I1(\add_ln1353_8_reg_1484[11]_i_2_n_0 ),
        .I2(lut_start_addr_V[11]),
        .I3(lut_start_addr_V[9]),
        .I4(\add_ln1353_8_reg_1484[12]_i_3_n_0 ),
        .I5(lut_start_addr_V[10]),
        .O(add_ln1353_8_fu_514_p2[11]));
  LUT6 #(
    .INIT(64'h000F7510751FFFFF))
    \add_ln1353_8_reg_1484[11]_i_2
       (.I0(lut_start_addr_V[1]),
        .I1(lut_start_addr_V[0]),
        .I2(rom_idx_V[0]),
        .I3(rom_idx_V[1]),
        .I4(rom_idx_V[2]),
        .I5(lut_start_addr_V[2]),
        .O(\add_ln1353_8_reg_1484[11]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00800000))
    \add_ln1353_8_reg_1484[12]_i_1
       (.I0(lut_start_addr_V[11]),
        .I1(\add_ln1353_8_reg_1484[12]_i_2_n_0 ),
        .I2(lut_start_addr_V[10]),
        .I3(\add_ln1353_8_reg_1484[12]_i_3_n_0 ),
        .I4(lut_start_addr_V[9]),
        .O(add_ln1353_8_fu_514_p2[12]));
  LUT6 #(
    .INIT(64'hE8FCC0E8FC30C030))
    \add_ln1353_8_reg_1484[12]_i_2
       (.I0(lut_start_addr_V[0]),
        .I1(rom_idx_V[2]),
        .I2(lut_start_addr_V[2]),
        .I3(rom_idx_V[1]),
        .I4(lut_start_addr_V[1]),
        .I5(rom_idx_V[0]),
        .O(\add_ln1353_8_reg_1484[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF))
    \add_ln1353_8_reg_1484[12]_i_3
       (.I0(lut_start_addr_V[7]),
        .I1(lut_start_addr_V[5]),
        .I2(lut_start_addr_V[3]),
        .I3(lut_start_addr_V[4]),
        .I4(lut_start_addr_V[6]),
        .I5(lut_start_addr_V[8]),
        .O(\add_ln1353_8_reg_1484[12]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *)
  LUT4 #(
    .INIT(16'h659A))
    \add_ln1353_8_reg_1484[1]_i_1
       (.I0(lut_start_addr_V[1]),
        .I1(lut_start_addr_V[0]),
        .I2(rom_idx_V[0]),
        .I3(rom_idx_V[1]),
        .O(add_ln1353_8_fu_514_p2[1]));
  LUT6 #(
    .INIT(64'h9666969699969999))
    \add_ln1353_8_reg_1484[2]_i_1
       (.I0(lut_start_addr_V[2]),
        .I1(rom_idx_V[2]),
        .I2(lut_start_addr_V[1]),
        .I3(lut_start_addr_V[0]),
        .I4(rom_idx_V[0]),
        .I5(rom_idx_V[1]),
        .O(add_ln1353_8_fu_514_p2[2]));
  (* SOFT_HLUTNM = "soft_lutpair63" *)
  LUT3 #(
    .INIT(8'hB8))
    \add_ln1353_8_reg_1484[3]_i_1
       (.I0(\add_ln1353_8_reg_1484[11]_i_2_n_0 ),
        .I1(lut_start_addr_V[3]),
        .I2(\add_ln1353_8_reg_1484[12]_i_2_n_0 ),
        .O(add_ln1353_8_fu_514_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair53" *)
  LUT4 #(
    .INIT(16'hF858))
    \add_ln1353_8_reg_1484[4]_i_1
       (.I0(lut_start_addr_V[3]),
        .I1(\add_ln1353_8_reg_1484[12]_i_2_n_0 ),
        .I2(lut_start_addr_V[4]),
        .I3(\add_ln1353_8_reg_1484[11]_i_2_n_0 ),
        .O(add_ln1353_8_fu_514_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair53" *)
  LUT5 #(
    .INIT(32'hFF807780))
    \add_ln1353_8_reg_1484[5]_i_1
       (.I0(lut_start_addr_V[3]),
        .I1(lut_start_addr_V[4]),
        .I2(\add_ln1353_8_reg_1484[12]_i_2_n_0 ),
        .I3(lut_start_addr_V[5]),
        .I4(\add_ln1353_8_reg_1484[11]_i_2_n_0 ),
        .O(add_ln1353_8_fu_514_p2[5]));
  LUT6 #(
    .INIT(64'hFFFF80007F7F8000))
    \add_ln1353_8_reg_1484[6]_i_1
       (.I0(lut_start_addr_V[4]),
        .I1(lut_start_addr_V[3]),
        .I2(lut_start_addr_V[5]),
        .I3(\add_ln1353_8_reg_1484[12]_i_2_n_0 ),
        .I4(lut_start_addr_V[6]),
        .I5(\add_ln1353_8_reg_1484[11]_i_2_n_0 ),
        .O(add_ln1353_8_fu_514_p2[6]));
  LUT4 #(
    .INIT(16'hF4A4))
    \add_ln1353_8_reg_1484[7]_i_1
       (.I0(\add_ln1353_8_reg_1484[7]_i_2_n_0 ),
        .I1(\add_ln1353_8_reg_1484[12]_i_2_n_0 ),
        .I2(lut_start_addr_V[7]),
        .I3(\add_ln1353_8_reg_1484[11]_i_2_n_0 ),
        .O(add_ln1353_8_fu_514_p2[7]));
  (* SOFT_HLUTNM = "soft_lutpair48" *)
  LUT4 #(
    .INIT(16'h7FFF))
    \add_ln1353_8_reg_1484[7]_i_2
       (.I0(lut_start_addr_V[5]),
        .I1(lut_start_addr_V[3]),
        .I2(lut_start_addr_V[4]),
        .I3(lut_start_addr_V[6]),
        .O(\add_ln1353_8_reg_1484[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *)
  LUT4 #(
    .INIT(16'hF0CA))
    \add_ln1353_8_reg_1484[8]_i_1
       (.I0(\add_ln1353_8_reg_1484[12]_i_2_n_0 ),
        .I1(\add_ln1353_8_reg_1484[11]_i_2_n_0 ),
        .I2(lut_start_addr_V[8]),
        .I3(\add_ln1353_8_reg_1484[8]_i_2_n_0 ),
        .O(add_ln1353_8_fu_514_p2[8]));
  (* SOFT_HLUTNM = "soft_lutpair48" *)
  LUT5 #(
    .INIT(32'h7FFFFFFF))
    \add_ln1353_8_reg_1484[8]_i_2
       (.I0(lut_start_addr_V[6]),
        .I1(lut_start_addr_V[4]),
        .I2(lut_start_addr_V[3]),
        .I3(lut_start_addr_V[5]),
        .I4(lut_start_addr_V[7]),
        .O(\add_ln1353_8_reg_1484[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *)
  LUT4 #(
    .INIT(16'hF0CA))
    \add_ln1353_8_reg_1484[9]_i_1
       (.I0(\add_ln1353_8_reg_1484[12]_i_2_n_0 ),
        .I1(\add_ln1353_8_reg_1484[11]_i_2_n_0 ),
        .I2(lut_start_addr_V[9]),
        .I3(\add_ln1353_8_reg_1484[12]_i_3_n_0 ),
        .O(add_ln1353_8_fu_514_p2[9]));
  FDRE \add_ln1353_8_reg_1484_pp0_iter1_reg_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_reg_1484[0]),
        .Q(add_ln1353_8_reg_1484_pp0_iter1_reg[0]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_pp0_iter1_reg_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_reg_1484[10]),
        .Q(add_ln1353_8_reg_1484_pp0_iter1_reg[10]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_pp0_iter1_reg_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_reg_1484[11]),
        .Q(add_ln1353_8_reg_1484_pp0_iter1_reg[11]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_pp0_iter1_reg_reg[12]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_reg_1484[12]),
        .Q(add_ln1353_8_reg_1484_pp0_iter1_reg[12]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_pp0_iter1_reg_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_reg_1484[1]),
        .Q(add_ln1353_8_reg_1484_pp0_iter1_reg[1]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_pp0_iter1_reg_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_reg_1484[2]),
        .Q(add_ln1353_8_reg_1484_pp0_iter1_reg[2]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_pp0_iter1_reg_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_reg_1484[3]),
        .Q(add_ln1353_8_reg_1484_pp0_iter1_reg[3]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_pp0_iter1_reg_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_reg_1484[4]),
        .Q(add_ln1353_8_reg_1484_pp0_iter1_reg[4]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_pp0_iter1_reg_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_reg_1484[5]),
        .Q(add_ln1353_8_reg_1484_pp0_iter1_reg[5]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_pp0_iter1_reg_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_reg_1484[6]),
        .Q(add_ln1353_8_reg_1484_pp0_iter1_reg[6]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_pp0_iter1_reg_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_reg_1484[7]),
        .Q(add_ln1353_8_reg_1484_pp0_iter1_reg[7]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_pp0_iter1_reg_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_reg_1484[8]),
        .Q(add_ln1353_8_reg_1484_pp0_iter1_reg[8]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_pp0_iter1_reg_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_reg_1484[9]),
        .Q(add_ln1353_8_reg_1484_pp0_iter1_reg[9]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_fu_514_p2[0]),
        .Q(add_ln1353_8_reg_1484[0]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_fu_514_p2[10]),
        .Q(add_ln1353_8_reg_1484[10]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_fu_514_p2[11]),
        .Q(add_ln1353_8_reg_1484[11]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_reg[12]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_fu_514_p2[12]),
        .Q(add_ln1353_8_reg_1484[12]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_fu_514_p2[1]),
        .Q(add_ln1353_8_reg_1484[1]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_fu_514_p2[2]),
        .Q(add_ln1353_8_reg_1484[2]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_fu_514_p2[3]),
        .Q(add_ln1353_8_reg_1484[3]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_fu_514_p2[4]),
        .Q(add_ln1353_8_reg_1484[4]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_fu_514_p2[5]),
        .Q(add_ln1353_8_reg_1484[5]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_fu_514_p2[6]),
        .Q(add_ln1353_8_reg_1484[6]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_fu_514_p2[7]),
        .Q(add_ln1353_8_reg_1484[7]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_fu_514_p2[8]),
        .Q(add_ln1353_8_reg_1484[8]),
        .R(1'b0));
  FDRE \add_ln1353_8_reg_1484_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_8_fu_514_p2[9]),
        .Q(add_ln1353_8_reg_1484[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair85" *)
  LUT2 #(
    .INIT(4'h6))
    \add_ln1353_reg_1512[0]_i_1
       (.I0(trunc_ln647_reg_1464[0]),
        .I1(zext_ln215_reg_1453[0]),
        .O(\add_ln1353_reg_1512[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_reg_1512[10]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[7]),
        .I2(zext_ln215_reg_1453[8]),
        .I3(\add_ln1353_reg_1512[11]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[10]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_reg_1512[11]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[10]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[8]),
        .I4(\add_ln1353_reg_1512[11]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[11]),
        .O(\add_ln1353_reg_1512[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *)
  LUT5 #(
    .INIT(32'h80000000))
    \add_ln1353_reg_1512[11]_i_2
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[6]),
        .I2(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[3]),
        .O(\add_ln1353_reg_1512[11]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h7F))
    \add_ln1353_reg_1512[12]_i_1
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[10]),
        .I2(zext_ln215_reg_1453[11]),
        .O(\add_ln1353_reg_1512[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *)
  LUT3 #(
    .INIT(8'h80))
    \add_ln1353_reg_1512[12]_i_2
       (.I0(zext_ln215_reg_1453[7]),
        .I1(zext_ln215_reg_1453[8]),
        .I2(\add_ln1353_reg_1512[11]_i_2_n_0 ),
        .O(\add_ln1353_reg_1512[12]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *)
  LUT4 #(
    .INIT(16'h9666))
    \add_ln1353_reg_1512[1]_i_1
       (.I0(zext_ln215_reg_1453[1]),
        .I1(trunc_ln647_reg_1464[1]),
        .I2(trunc_ln647_reg_1464[0]),
        .I3(zext_ln215_reg_1453[0]),
        .O(\add_ln1353_reg_1512[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9996969696666666))
    \add_ln1353_reg_1512[2]_i_1
       (.I0(zext_ln215_reg_1453[2]),
        .I1(trunc_ln647_reg_1464[2]),
        .I2(zext_ln215_reg_1453[1]),
        .I3(trunc_ln647_reg_1464[0]),
        .I4(zext_ln215_reg_1453[0]),
        .I5(trunc_ln647_reg_1464[1]),
        .O(\add_ln1353_reg_1512[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h11171777EEE8E888))
    \add_ln1353_reg_1512[3]_i_1
       (.I0(trunc_ln647_reg_1464[2]),
        .I1(zext_ln215_reg_1453[2]),
        .I2(trunc_ln647_reg_1464[1]),
        .I3(\tmp_1_reg_1529[0]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[1]),
        .I5(zext_ln215_reg_1453[3]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair71" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_reg_1512[4]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair34" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_reg_1512[5]_i_1
       (.I0(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair47" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \add_ln1353_reg_1512[6]_i_1
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[4]),
        .I3(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[6]),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \add_ln1353_reg_1512[7]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[6]),
        .I4(zext_ln215_reg_1453[5]),
        .I5(zext_ln215_reg_1453[7]),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair64" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln1353_reg_1512[8]_i_1
       (.I0(zext_ln215_reg_1453[7]),
        .I1(\add_ln1353_reg_1512[11]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[8]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair33" *)
  LUT4 #(
    .INIT(16'h7F80))
    \add_ln1353_reg_1512[9]_i_1
       (.I0(\add_ln1353_reg_1512[11]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[8]),
        .I2(zext_ln215_reg_1453[7]),
        .I3(zext_ln215_reg_1453[9]),
        .O(p_0_in[6]));
  FDRE \add_ln1353_reg_1512_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\add_ln1353_reg_1512[0]_i_1_n_0 ),
        .Q(add_ln1353_reg_1512[0]),
        .R(1'b0));
  FDRE \add_ln1353_reg_1512_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(p_0_in[7]),
        .Q(add_ln1353_reg_1512[10]),
        .R(1'b0));
  FDRE \add_ln1353_reg_1512_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\add_ln1353_reg_1512[11]_i_1_n_0 ),
        .Q(add_ln1353_reg_1512[11]),
        .R(1'b0));
  FDRE \add_ln1353_reg_1512_reg[12]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\add_ln1353_reg_1512[12]_i_2_n_0 ),
        .Q(add_ln1353_reg_1512[12]),
        .R(\add_ln1353_reg_1512[12]_i_1_n_0 ));
  FDRE \add_ln1353_reg_1512_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\add_ln1353_reg_1512[1]_i_1_n_0 ),
        .Q(add_ln1353_reg_1512[1]),
        .R(1'b0));
  FDRE \add_ln1353_reg_1512_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\add_ln1353_reg_1512[2]_i_1_n_0 ),
        .Q(add_ln1353_reg_1512[2]),
        .R(1'b0));
  FDRE \add_ln1353_reg_1512_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(p_0_in[0]),
        .Q(add_ln1353_reg_1512[3]),
        .R(1'b0));
  FDRE \add_ln1353_reg_1512_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(p_0_in[1]),
        .Q(add_ln1353_reg_1512[4]),
        .R(1'b0));
  FDRE \add_ln1353_reg_1512_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(p_0_in[2]),
        .Q(add_ln1353_reg_1512[5]),
        .R(1'b0));
  FDRE \add_ln1353_reg_1512_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(p_0_in[3]),
        .Q(add_ln1353_reg_1512[6]),
        .R(1'b0));
  FDRE \add_ln1353_reg_1512_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(p_0_in[4]),
        .Q(add_ln1353_reg_1512[7]),
        .R(1'b0));
  FDRE \add_ln1353_reg_1512_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(p_0_in[5]),
        .Q(add_ln1353_reg_1512[8]),
        .R(1'b0));
  FDRE \add_ln1353_reg_1512_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(p_0_in[6]),
        .Q(add_ln1353_reg_1512[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair82" *)
  LUT2 #(
    .INIT(4'h9))
    \add_ln647_1_reg_1474[1]_i_1
       (.I0(rom_idx_V[1]),
        .I1(rom_idx_V[0]),
        .O(add_ln647_1_fu_484_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair82" *)
  LUT3 #(
    .INIT(8'h78))
    \add_ln647_1_reg_1474[2]_i_1
       (.I0(rom_idx_V[1]),
        .I1(rom_idx_V[0]),
        .I2(rom_idx_V[2]),
        .O(add_ln647_1_fu_484_p2[2]));
  FDRE \add_ln647_1_reg_1474_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln647_1_fu_484_p2[1]),
        .Q(add_ln647_1_reg_1474[1]),
        .R(1'b0));
  FDRE \add_ln647_1_reg_1474_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln647_1_fu_484_p2[2]),
        .Q(add_ln647_1_reg_1474[2]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1))
    \add_ln647_2_reg_1479[1]_i_1
       (.I0(rom_idx_V[1]),
        .O(add_ln647_5_fu_554_p2[1]));
  FDRE \add_ln647_2_reg_1479_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln647_5_fu_554_p2[1]),
        .Q(add_ln647_2_reg_1479[1]),
        .R(1'b0));
  FDRE \add_ln647_2_reg_1479_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(rom_idx_V[2]),
        .Q(add_ln647_2_reg_1479[2]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair83" *)
  LUT2 #(
    .INIT(4'h9))
    \add_ln647_3_reg_1497[2]_i_1
       (.I0(rom_idx_V[2]),
        .I1(rom_idx_V[1]),
        .O(add_ln647_3_fu_534_p2));
  FDRE \add_ln647_3_reg_1497_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln647_3_fu_534_p2),
        .Q(add_ln647_3_reg_1497),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair81" *)
  LUT3 #(
    .INIT(8'h95))
    \add_ln647_4_reg_1502[2]_i_1
       (.I0(rom_idx_V[2]),
        .I1(rom_idx_V[0]),
        .I2(rom_idx_V[1]),
        .O(add_ln647_4_fu_544_p2));
  FDRE \add_ln647_4_reg_1502_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln647_4_fu_544_p2),
        .Q(add_ln647_4_reg_1502),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1))
    \add_ln647_5_reg_1507[2]_i_1
       (.I0(rom_idx_V[2]),
        .O(add_ln647_5_fu_554_p2[2]));
  FDRE \add_ln647_5_reg_1507_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln647_5_fu_554_p2[2]),
        .Q(add_ln647_5_reg_1507),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair86" *)
  LUT1 #(
    .INIT(2'h1))
    \add_ln647_reg_1469[0]_i_1
       (.I0(rom_idx_V[0]),
        .O(add_ln647_5_fu_554_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair83" *)
  LUT2 #(
    .INIT(4'h6))
    \add_ln647_reg_1469[2]_i_1
       (.I0(rom_idx_V[1]),
        .I1(rom_idx_V[2]),
        .O(add_ln647_fu_474_p2));
  FDRE \add_ln647_reg_1469_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln647_5_fu_554_p2[0]),
        .Q(add_ln647_reg_1469[0]),
        .R(1'b0));
  FDRE \add_ln647_reg_1469_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(rom_idx_V[1]),
        .Q(add_ln647_reg_1469[1]),
        .R(1'b0));
  FDRE \add_ln647_reg_1469_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln647_fu_474_p2),
        .Q(add_ln647_reg_1469[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    ap_enable_reg_pp0_iter1_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_start),
        .Q(ap_enable_reg_pp0_iter1),
        .R(ap_rst));
  FDRE #(
    .INIT(1'b0))
    ap_enable_reg_pp0_iter2_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter1),
        .Q(ap_enable_reg_pp0_iter2),
        .R(ap_rst));
  FDRE #(
    .INIT(1'b0))
    ap_enable_reg_pp0_iter3_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter2),
        .Q(ap_enable_reg_pp0_iter3),
        .R(ap_rst));
  FDRE #(
    .INIT(1'b0))
    ap_enable_reg_pp0_iter4_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter3),
        .Q(ap_done),
        .R(ap_rst));
  LUT5 #(
    .INIT(32'h00000001))
    ap_idle_INST_0
       (.I0(ap_enable_reg_pp0_iter1),
        .I1(ap_enable_reg_pp0_iter2),
        .I2(ap_done),
        .I3(ap_start),
        .I4(ap_enable_reg_pp0_iter3),
        .O(ap_idle));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    \icmp_ln895_10_reg_1568[0]_i_1
       (.I0(zext_ln215_reg_1453[11]),
        .I1(\icmp_ln895_10_reg_1568[0]_i_2_n_0 ),
        .I2(\icmp_ln895_10_reg_1568[0]_i_3_n_0 ),
        .I3(\icmp_ln895_10_reg_1568[0]_i_4_n_0 ),
        .I4(add_ln1353_5_fu_658_p2[9]),
        .I5(\icmp_ln895_10_reg_1568[0]_i_5_n_0 ),
        .O(icmp_ln895_10_fu_664_p2));
  LUT6 #(
    .INIT(64'h2000200020000000))
    \icmp_ln895_10_reg_1568[0]_i_2
       (.I0(\icmp_ln895_1_reg_1524[0]_i_6_n_0 ),
        .I1(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .I3(zext_ln215_reg_1453[5]),
        .I4(zext_ln215_reg_1453[3]),
        .I5(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .O(\icmp_ln895_10_reg_1568[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h777FFFFFFFFFEEEA))
    \icmp_ln895_10_reg_1568[0]_i_3
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[7]),
        .I5(zext_ln215_reg_1453[6]),
        .O(\icmp_ln895_10_reg_1568[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *)
  LUT5 #(
    .INIT(32'h333E8000))
    \icmp_ln895_10_reg_1568[0]_i_4
       (.I0(\icmp_ln895_10_reg_1568[0]_i_6_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[3]),
        .I4(zext_ln215_reg_1453[5]),
        .O(\icmp_ln895_10_reg_1568[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00005400))
    \icmp_ln895_10_reg_1568[0]_i_5
       (.I0(\icmp_ln895_1_reg_1524[0]_i_8_n_0 ),
        .I1(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[10]),
        .O(\icmp_ln895_10_reg_1568[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFF99FFF9FFFFFF6))
    \icmp_ln895_10_reg_1568[0]_i_6
       (.I0(add_ln647_1_reg_1474[2]),
        .I1(zext_ln215_reg_1453[2]),
        .I2(trunc_ln647_reg_1464[0]),
        .I3(zext_ln215_reg_1453[0]),
        .I4(zext_ln215_reg_1453[1]),
        .I5(add_ln647_1_reg_1474[1]),
        .O(\icmp_ln895_10_reg_1568[0]_i_6_n_0 ));
  FDRE \icmp_ln895_10_reg_1568_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_10_fu_664_p2),
        .Q(icmp_ln895_10_reg_1568),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    \icmp_ln895_11_reg_1590[0]_i_1
       (.I0(zext_ln215_reg_1453[11]),
        .I1(\icmp_ln895_11_reg_1590[0]_i_2_n_0 ),
        .I2(\icmp_ln895_11_reg_1590[0]_i_3_n_0 ),
        .I3(\icmp_ln895_11_reg_1590[0]_i_4_n_0 ),
        .I4(add_ln1353_7_fu_698_p2[9]),
        .I5(\icmp_ln895_11_reg_1590[0]_i_5_n_0 ),
        .O(icmp_ln895_11_fu_704_p2));
  LUT6 #(
    .INIT(64'h2000200020000000))
    \icmp_ln895_11_reg_1590[0]_i_2
       (.I0(\icmp_ln895_1_reg_1524[0]_i_6_n_0 ),
        .I1(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .I3(zext_ln215_reg_1453[5]),
        .I4(zext_ln215_reg_1453[3]),
        .I5(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .O(\icmp_ln895_11_reg_1590[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h777FFFFFFFFFEEEA))
    \icmp_ln895_11_reg_1590[0]_i_3
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[7]),
        .I5(zext_ln215_reg_1453[6]),
        .O(\icmp_ln895_11_reg_1590[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *)
  LUT5 #(
    .INIT(32'h333E8000))
    \icmp_ln895_11_reg_1590[0]_i_4
       (.I0(\icmp_ln895_11_reg_1590[0]_i_6_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[3]),
        .I4(zext_ln215_reg_1453[5]),
        .O(\icmp_ln895_11_reg_1590[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00005400))
    \icmp_ln895_11_reg_1590[0]_i_5
       (.I0(\icmp_ln895_1_reg_1524[0]_i_8_n_0 ),
        .I1(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[10]),
        .O(\icmp_ln895_11_reg_1590[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFF99FFF9FFFFFF6))
    \icmp_ln895_11_reg_1590[0]_i_6
       (.I0(add_ln647_2_reg_1479[2]),
        .I1(zext_ln215_reg_1453[2]),
        .I2(add_ln647_reg_1469[0]),
        .I3(zext_ln215_reg_1453[0]),
        .I4(add_ln647_2_reg_1479[1]),
        .I5(zext_ln215_reg_1453[1]),
        .O(\icmp_ln895_11_reg_1590[0]_i_6_n_0 ));
  FDRE \icmp_ln895_11_reg_1590_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_11_fu_704_p2),
        .Q(icmp_ln895_11_reg_1590),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h3FFFFFFFFFFFE800))
    \icmp_ln895_12_reg_1600[0]_i_1
       (.I0(\icmp_ln895_12_reg_1600[0]_i_2_n_0 ),
        .I1(\tmp_9_reg_1605[7]_i_2_n_0 ),
        .I2(add_ln1353_8_reg_1484[9]),
        .I3(add_ln1353_8_reg_1484[10]),
        .I4(add_ln1353_8_reg_1484[11]),
        .I5(add_ln1353_8_reg_1484[12]),
        .O(icmp_ln895_12_fu_725_p2));
  LUT5 #(
    .INIT(32'hBFFFFFFE))
    \icmp_ln895_12_reg_1600[0]_i_2
       (.I0(\icmp_ln895_12_reg_1600[0]_i_3_n_0 ),
        .I1(add_ln1353_8_reg_1484[6]),
        .I2(\icmp_ln895_12_reg_1600[0]_i_4_n_0 ),
        .I3(add_ln1353_8_reg_1484[7]),
        .I4(add_ln1353_8_reg_1484[8]),
        .O(\icmp_ln895_12_reg_1600[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000AAAAAAAAAAA8))
    \icmp_ln895_12_reg_1600[0]_i_3
       (.I0(add_ln1353_8_reg_1484[5]),
        .I1(add_ln1353_8_reg_1484[2]),
        .I2(add_ln1353_8_reg_1484[0]),
        .I3(add_ln1353_8_reg_1484[1]),
        .I4(add_ln1353_8_reg_1484[3]),
        .I5(add_ln1353_8_reg_1484[4]),
        .O(\icmp_ln895_12_reg_1600[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *)
  LUT3 #(
    .INIT(8'h80))
    \icmp_ln895_12_reg_1600[0]_i_4
       (.I0(add_ln1353_8_reg_1484[5]),
        .I1(add_ln1353_8_reg_1484[3]),
        .I2(add_ln1353_8_reg_1484[4]),
        .O(\icmp_ln895_12_reg_1600[0]_i_4_n_0 ));
  FDRE \icmp_ln895_12_reg_1600_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_12_fu_725_p2),
        .Q(icmp_ln895_12_reg_1600),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    \icmp_ln895_13_reg_1622[0]_i_1
       (.I0(zext_ln215_reg_1453[11]),
        .I1(\icmp_ln895_13_reg_1622[0]_i_2_n_0 ),
        .I2(\icmp_ln895_13_reg_1622[0]_i_3_n_0 ),
        .I3(\icmp_ln895_13_reg_1622[0]_i_4_n_0 ),
        .I4(add_ln1353_11_fu_759_p2[9]),
        .I5(\icmp_ln895_13_reg_1622[0]_i_5_n_0 ),
        .O(icmp_ln895_13_fu_765_p2));
  LUT6 #(
    .INIT(64'h2000200020000000))
    \icmp_ln895_13_reg_1622[0]_i_2
       (.I0(\icmp_ln895_1_reg_1524[0]_i_6_n_0 ),
        .I1(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .I3(zext_ln215_reg_1453[5]),
        .I4(zext_ln215_reg_1453[3]),
        .I5(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .O(\icmp_ln895_13_reg_1622[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h777FFFFFFFFFEEEA))
    \icmp_ln895_13_reg_1622[0]_i_3
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[7]),
        .I5(zext_ln215_reg_1453[6]),
        .O(\icmp_ln895_13_reg_1622[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *)
  LUT5 #(
    .INIT(32'h333E8000))
    \icmp_ln895_13_reg_1622[0]_i_4
       (.I0(\icmp_ln895_13_reg_1622[0]_i_6_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[3]),
        .I4(zext_ln215_reg_1453[5]),
        .O(\icmp_ln895_13_reg_1622[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00005400))
    \icmp_ln895_13_reg_1622[0]_i_5
       (.I0(\icmp_ln895_1_reg_1524[0]_i_8_n_0 ),
        .I1(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[10]),
        .O(\icmp_ln895_13_reg_1622[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFF99FFF9FFFFFF6))
    \icmp_ln895_13_reg_1622[0]_i_6
       (.I0(add_ln647_3_reg_1497),
        .I1(zext_ln215_reg_1453[2]),
        .I2(add_ln647_reg_1469[0]),
        .I3(zext_ln215_reg_1453[0]),
        .I4(add_ln647_reg_1469[1]),
        .I5(zext_ln215_reg_1453[1]),
        .O(\icmp_ln895_13_reg_1622[0]_i_6_n_0 ));
  FDRE \icmp_ln895_13_reg_1622_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_13_fu_765_p2),
        .Q(icmp_ln895_13_reg_1622),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    \icmp_ln895_14_reg_1644[0]_i_1
       (.I0(zext_ln215_reg_1453[11]),
        .I1(\icmp_ln895_14_reg_1644[0]_i_2_n_0 ),
        .I2(\icmp_ln895_14_reg_1644[0]_i_3_n_0 ),
        .I3(\icmp_ln895_14_reg_1644[0]_i_4_n_0 ),
        .I4(add_ln1353_13_fu_799_p2[9]),
        .I5(\icmp_ln895_14_reg_1644[0]_i_5_n_0 ),
        .O(icmp_ln895_14_fu_805_p2));
  LUT6 #(
    .INIT(64'h2000200020000000))
    \icmp_ln895_14_reg_1644[0]_i_2
       (.I0(\icmp_ln895_1_reg_1524[0]_i_6_n_0 ),
        .I1(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .I3(zext_ln215_reg_1453[5]),
        .I4(zext_ln215_reg_1453[3]),
        .I5(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .O(\icmp_ln895_14_reg_1644[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h777FFFFFFFFFEEEA))
    \icmp_ln895_14_reg_1644[0]_i_3
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[7]),
        .I5(zext_ln215_reg_1453[6]),
        .O(\icmp_ln895_14_reg_1644[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *)
  LUT5 #(
    .INIT(32'h333E8000))
    \icmp_ln895_14_reg_1644[0]_i_4
       (.I0(\icmp_ln895_14_reg_1644[0]_i_6_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[3]),
        .I4(zext_ln215_reg_1453[5]),
        .O(\icmp_ln895_14_reg_1644[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00005400))
    \icmp_ln895_14_reg_1644[0]_i_5
       (.I0(\icmp_ln895_1_reg_1524[0]_i_8_n_0 ),
        .I1(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[10]),
        .O(\icmp_ln895_14_reg_1644[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFF99FFF9FFFFFF6))
    \icmp_ln895_14_reg_1644[0]_i_6
       (.I0(add_ln647_4_reg_1502),
        .I1(zext_ln215_reg_1453[2]),
        .I2(trunc_ln647_reg_1464[0]),
        .I3(zext_ln215_reg_1453[0]),
        .I4(zext_ln215_reg_1453[1]),
        .I5(add_ln647_1_reg_1474[1]),
        .O(\icmp_ln895_14_reg_1644[0]_i_6_n_0 ));
  FDRE \icmp_ln895_14_reg_1644_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_14_fu_805_p2),
        .Q(icmp_ln895_14_reg_1644),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    \icmp_ln895_15_reg_1666[0]_i_1
       (.I0(zext_ln215_reg_1453[11]),
        .I1(\icmp_ln895_15_reg_1666[0]_i_2_n_0 ),
        .I2(\icmp_ln895_15_reg_1666[0]_i_3_n_0 ),
        .I3(\icmp_ln895_15_reg_1666[0]_i_4_n_0 ),
        .I4(add_ln1353_15_fu_839_p2[9]),
        .I5(\icmp_ln895_15_reg_1666[0]_i_5_n_0 ),
        .O(icmp_ln895_15_fu_845_p2));
  LUT6 #(
    .INIT(64'h2000200020000000))
    \icmp_ln895_15_reg_1666[0]_i_2
       (.I0(\icmp_ln895_1_reg_1524[0]_i_6_n_0 ),
        .I1(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .I3(zext_ln215_reg_1453[5]),
        .I4(zext_ln215_reg_1453[3]),
        .I5(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .O(\icmp_ln895_15_reg_1666[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h777FFFFFFFFFEEEA))
    \icmp_ln895_15_reg_1666[0]_i_3
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[7]),
        .I5(zext_ln215_reg_1453[6]),
        .O(\icmp_ln895_15_reg_1666[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *)
  LUT5 #(
    .INIT(32'h333E8000))
    \icmp_ln895_15_reg_1666[0]_i_4
       (.I0(\icmp_ln895_15_reg_1666[0]_i_6_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[3]),
        .I4(zext_ln215_reg_1453[5]),
        .O(\icmp_ln895_15_reg_1666[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00005400))
    \icmp_ln895_15_reg_1666[0]_i_5
       (.I0(\icmp_ln895_1_reg_1524[0]_i_8_n_0 ),
        .I1(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[10]),
        .O(\icmp_ln895_15_reg_1666[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFF99FFF9FFFFFF6))
    \icmp_ln895_15_reg_1666[0]_i_6
       (.I0(add_ln647_5_reg_1507),
        .I1(zext_ln215_reg_1453[2]),
        .I2(add_ln647_reg_1469[0]),
        .I3(zext_ln215_reg_1453[0]),
        .I4(add_ln647_2_reg_1479[1]),
        .I5(zext_ln215_reg_1453[1]),
        .O(\icmp_ln895_15_reg_1666[0]_i_6_n_0 ));
  FDRE \icmp_ln895_15_reg_1666_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_15_fu_845_p2),
        .Q(icmp_ln895_15_reg_1666),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    \icmp_ln895_1_reg_1524[0]_i_1
       (.I0(zext_ln215_reg_1453[11]),
        .I1(\icmp_ln895_1_reg_1524[0]_i_2_n_0 ),
        .I2(\icmp_ln895_1_reg_1524[0]_i_3_n_0 ),
        .I3(\icmp_ln895_1_reg_1524[0]_i_4_n_0 ),
        .I4(add_ln1353_1_fu_578_p2[9]),
        .I5(\icmp_ln895_1_reg_1524[0]_i_5_n_0 ),
        .O(icmp_ln895_1_fu_584_p2));
  LUT6 #(
    .INIT(64'h2000200020000000))
    \icmp_ln895_1_reg_1524[0]_i_2
       (.I0(\icmp_ln895_1_reg_1524[0]_i_6_n_0 ),
        .I1(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .I3(zext_ln215_reg_1453[5]),
        .I4(zext_ln215_reg_1453[3]),
        .I5(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .O(\icmp_ln895_1_reg_1524[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h777FFFFFFFFFEEEA))
    \icmp_ln895_1_reg_1524[0]_i_3
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[7]),
        .I5(zext_ln215_reg_1453[6]),
        .O(\icmp_ln895_1_reg_1524[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *)
  LUT5 #(
    .INIT(32'h333E8000))
    \icmp_ln895_1_reg_1524[0]_i_4
       (.I0(\icmp_ln895_1_reg_1524[0]_i_7_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[3]),
        .I4(zext_ln215_reg_1453[5]),
        .O(\icmp_ln895_1_reg_1524[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00005400))
    \icmp_ln895_1_reg_1524[0]_i_5
       (.I0(\icmp_ln895_1_reg_1524[0]_i_8_n_0 ),
        .I1(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[10]),
        .O(\icmp_ln895_1_reg_1524[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *)
  LUT3 #(
    .INIT(8'h80))
    \icmp_ln895_1_reg_1524[0]_i_6
       (.I0(zext_ln215_reg_1453[10]),
        .I1(zext_ln215_reg_1453[8]),
        .I2(zext_ln215_reg_1453[9]),
        .O(\icmp_ln895_1_reg_1524[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFEBD7FBD7FFFFE))
    \icmp_ln895_1_reg_1524[0]_i_7
       (.I0(trunc_ln647_reg_1464[1]),
        .I1(zext_ln215_reg_1453[0]),
        .I2(trunc_ln647_reg_1464[0]),
        .I3(zext_ln215_reg_1453[1]),
        .I4(trunc_ln647_reg_1464[2]),
        .I5(zext_ln215_reg_1453[2]),
        .O(\icmp_ln895_1_reg_1524[0]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *)
  LUT2 #(
    .INIT(4'h7))
    \icmp_ln895_1_reg_1524[0]_i_8
       (.I0(zext_ln215_reg_1453[9]),
        .I1(zext_ln215_reg_1453[8]),
        .O(\icmp_ln895_1_reg_1524[0]_i_8_n_0 ));
  FDRE \icmp_ln895_1_reg_1524_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_1_fu_584_p2),
        .Q(icmp_ln895_1_reg_1524),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    \icmp_ln895_9_reg_1546[0]_i_1
       (.I0(zext_ln215_reg_1453[11]),
        .I1(\icmp_ln895_9_reg_1546[0]_i_2_n_0 ),
        .I2(\icmp_ln895_9_reg_1546[0]_i_3_n_0 ),
        .I3(\icmp_ln895_9_reg_1546[0]_i_4_n_0 ),
        .I4(add_ln1353_3_fu_618_p2[9]),
        .I5(\icmp_ln895_9_reg_1546[0]_i_5_n_0 ),
        .O(icmp_ln895_9_fu_624_p2));
  LUT6 #(
    .INIT(64'h2000200020000000))
    \icmp_ln895_9_reg_1546[0]_i_2
       (.I0(\icmp_ln895_1_reg_1524[0]_i_6_n_0 ),
        .I1(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .I3(zext_ln215_reg_1453[5]),
        .I4(zext_ln215_reg_1453[3]),
        .I5(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .O(\icmp_ln895_9_reg_1546[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h777FFFFFFFFFEEEA))
    \icmp_ln895_9_reg_1546[0]_i_3
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I4(zext_ln215_reg_1453[7]),
        .I5(zext_ln215_reg_1453[6]),
        .O(\icmp_ln895_9_reg_1546[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *)
  LUT5 #(
    .INIT(32'h333E8000))
    \icmp_ln895_9_reg_1546[0]_i_4
       (.I0(\icmp_ln895_9_reg_1546[0]_i_6_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[3]),
        .I4(zext_ln215_reg_1453[5]),
        .O(\icmp_ln895_9_reg_1546[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00005400))
    \icmp_ln895_9_reg_1546[0]_i_5
       (.I0(\icmp_ln895_1_reg_1524[0]_i_8_n_0 ),
        .I1(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[10]),
        .O(\icmp_ln895_9_reg_1546[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFF99FFF9FFFFFF6))
    \icmp_ln895_9_reg_1546[0]_i_6
       (.I0(add_ln647_reg_1469[2]),
        .I1(zext_ln215_reg_1453[2]),
        .I2(add_ln647_reg_1469[0]),
        .I3(zext_ln215_reg_1453[0]),
        .I4(add_ln647_reg_1469[1]),
        .I5(zext_ln215_reg_1453[1]),
        .O(\icmp_ln895_9_reg_1546[0]_i_6_n_0 ));
  FDRE \icmp_ln895_9_reg_1546_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_9_fu_624_p2),
        .Q(icmp_ln895_9_reg_1546),
        .R(1'b0));
  hls_get_trig_vals_get_trig_vals_lutbkb lut_tables_0_U
       (.add_ln1353_reg_1512(add_ln1353_reg_1512),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ap_enable_reg_pp0_iter2),
        .hw_trig_vals_0_V(hw_trig_vals_0_V),
        .hw_trig_vals_8_V(hw_trig_vals_8_V),
        .icmp_ln895_1_reg_1524(icmp_ln895_1_reg_1524),
        .tmp_1_reg_1529(tmp_1_reg_1529));
  hls_get_trig_vals_get_trig_vals_lutcud lut_tables_1_U
       (.add_ln1353_2_reg_1534(add_ln1353_2_reg_1534),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ap_enable_reg_pp0_iter2),
        .hw_trig_vals_1_V(hw_trig_vals_1_V),
        .hw_trig_vals_9_V(hw_trig_vals_9_V),
        .icmp_ln895_9_reg_1546(icmp_ln895_9_reg_1546),
        .tmp_3_reg_1551(tmp_3_reg_1551));
  hls_get_trig_vals_get_trig_vals_lutdEe lut_tables_2_U
       (.add_ln1353_4_reg_1556(add_ln1353_4_reg_1556),
        .add_ln1353_reg_1512(add_ln1353_reg_1512[0]),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ap_enable_reg_pp0_iter2),
        .hw_trig_vals_10_V(hw_trig_vals_10_V),
        .hw_trig_vals_2_V(hw_trig_vals_2_V),
        .icmp_ln895_10_reg_1568(icmp_ln895_10_reg_1568),
        .tmp_5_reg_1573(tmp_5_reg_1573));
  hls_get_trig_vals_get_trig_vals_luteOg lut_tables_3_U
       (.add_ln1353_2_reg_1534(add_ln1353_2_reg_1534[0]),
        .add_ln1353_6_reg_1578(add_ln1353_6_reg_1578),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ap_enable_reg_pp0_iter2),
        .hw_trig_vals_11_V(hw_trig_vals_11_V),
        .hw_trig_vals_3_V(hw_trig_vals_3_V),
        .icmp_ln895_11_reg_1590(icmp_ln895_11_reg_1590),
        .tmp_7_reg_1595(tmp_7_reg_1595));
  hls_get_trig_vals_get_trig_vals_lutfYi lut_tables_4_U
       (.add_ln1353_8_reg_1484_pp0_iter1_reg(add_ln1353_8_reg_1484_pp0_iter1_reg),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ap_enable_reg_pp0_iter2),
        .hw_trig_vals_12_V(hw_trig_vals_12_V),
        .hw_trig_vals_4_V(hw_trig_vals_4_V),
        .icmp_ln895_12_reg_1600(icmp_ln895_12_reg_1600),
        .tmp_9_reg_1605(tmp_9_reg_1605));
  hls_get_trig_vals_get_trig_vals_lutg8j lut_tables_5_U
       (.add_ln1353_10_reg_1610(add_ln1353_10_reg_1610),
        .add_ln1353_2_reg_1534(add_ln1353_2_reg_1534[1:0]),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ap_enable_reg_pp0_iter2),
        .hw_trig_vals_13_V(hw_trig_vals_13_V),
        .hw_trig_vals_5_V(hw_trig_vals_5_V),
        .icmp_ln895_13_reg_1622(icmp_ln895_13_reg_1622),
        .tmp_11_reg_1627(tmp_11_reg_1627));
  hls_get_trig_vals_get_trig_vals_luthbi lut_tables_6_U
       (.add_ln1353_12_reg_1632(add_ln1353_12_reg_1632),
        .add_ln1353_4_reg_1556(add_ln1353_4_reg_1556[1]),
        .add_ln1353_reg_1512(add_ln1353_reg_1512[0]),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ap_enable_reg_pp0_iter2),
        .hw_trig_vals_14_V(hw_trig_vals_14_V),
        .hw_trig_vals_6_V(hw_trig_vals_6_V),
        .icmp_ln895_14_reg_1644(icmp_ln895_14_reg_1644),
        .tmp_13_reg_1649(tmp_13_reg_1649));
  hls_get_trig_vals_get_trig_vals_lutibs lut_tables_7_U
       (.add_ln1353_14_reg_1654(add_ln1353_14_reg_1654),
        .add_ln1353_2_reg_1534(add_ln1353_2_reg_1534[0]),
        .add_ln1353_6_reg_1578(add_ln1353_6_reg_1578[1]),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ap_enable_reg_pp0_iter2),
        .hw_trig_vals_15_V(hw_trig_vals_15_V),
        .hw_trig_vals_7_V(hw_trig_vals_7_V),
        .icmp_ln895_15_reg_1666(icmp_ln895_15_reg_1666),
        .tmp_15_reg_1671(tmp_15_reg_1671));
  (* SOFT_HLUTNM = "soft_lutpair88" *)
  LUT2 #(
    .INIT(4'h9))
    \tmp_11_reg_1627[0]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .O(add_ln1353_11_fu_759_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair68" *)
  LUT3 #(
    .INIT(8'h1E))
    \tmp_11_reg_1627[1]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(add_ln1353_11_fu_759_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair45" *)
  LUT4 #(
    .INIT(16'h57A8))
    \tmp_11_reg_1627[2]_i_1
       (.I0(zext_ln215_reg_1453[4]),
        .I1(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(add_ln1353_11_fu_759_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair26" *)
  LUT5 #(
    .INIT(32'h1FFFE000))
    \tmp_11_reg_1627[3]_i_1
       (.I0(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .O(add_ln1353_11_fu_759_p2[6]));
  LUT6 #(
    .INIT(64'h7F7F7FFF80808000))
    \tmp_11_reg_1627[4]_i_1
       (.I0(zext_ln215_reg_1453[6]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[7]),
        .O(add_ln1353_11_fu_759_p2[7]));
  LUT6 #(
    .INIT(64'hBFBFBFFF40404000))
    \tmp_11_reg_1627[5]_i_1
       (.I0(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[8]),
        .O(add_ln1353_11_fu_759_p2[8]));
  LUT6 #(
    .INIT(64'hFFFF57FF0000A800))
    \tmp_11_reg_1627[6]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[9]),
        .O(add_ln1353_11_fu_759_p2[9]));
  LUT6 #(
    .INIT(64'hEEE8E888E888E888))
    \tmp_11_reg_1627[6]_i_2
       (.I0(add_ln647_3_reg_1497),
        .I1(zext_ln215_reg_1453[2]),
        .I2(add_ln647_reg_1469[1]),
        .I3(zext_ln215_reg_1453[1]),
        .I4(zext_ln215_reg_1453[0]),
        .I5(add_ln647_reg_1469[0]),
        .O(\tmp_11_reg_1627[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *)
  LUT4 #(
    .INIT(16'h7F80))
    \tmp_11_reg_1627[7]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(zext_ln215_reg_1453[9]),
        .I2(\tmp_11_reg_1627[7]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[10]),
        .O(add_ln1353_11_fu_759_p2[10]));
  LUT6 #(
    .INIT(64'hE000000000000000))
    \tmp_11_reg_1627[7]_i_2
       (.I0(\tmp_11_reg_1627[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .I5(zext_ln215_reg_1453[7]),
        .O(\tmp_11_reg_1627[7]_i_2_n_0 ));
  FDRE \tmp_11_reg_1627_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_11_fu_759_p2[3]),
        .Q(tmp_11_reg_1627[0]),
        .R(1'b0));
  FDRE \tmp_11_reg_1627_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_11_fu_759_p2[4]),
        .Q(tmp_11_reg_1627[1]),
        .R(1'b0));
  FDRE \tmp_11_reg_1627_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_11_fu_759_p2[5]),
        .Q(tmp_11_reg_1627[2]),
        .R(1'b0));
  FDRE \tmp_11_reg_1627_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_11_fu_759_p2[6]),
        .Q(tmp_11_reg_1627[3]),
        .R(1'b0));
  FDRE \tmp_11_reg_1627_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_11_fu_759_p2[7]),
        .Q(tmp_11_reg_1627[4]),
        .R(1'b0));
  FDRE \tmp_11_reg_1627_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_11_fu_759_p2[8]),
        .Q(tmp_11_reg_1627[5]),
        .R(1'b0));
  FDRE \tmp_11_reg_1627_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_11_fu_759_p2[9]),
        .Q(tmp_11_reg_1627[6]),
        .R(1'b0));
  FDRE \tmp_11_reg_1627_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_11_fu_759_p2[10]),
        .Q(tmp_11_reg_1627[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hA9A9A995A9959595))
    \tmp_13_reg_1649[0]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(add_ln647_4_reg_1502),
        .I2(zext_ln215_reg_1453[2]),
        .I3(add_ln647_1_reg_1474[1]),
        .I4(\tmp_1_reg_1529[0]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[1]),
        .O(add_ln1353_13_fu_799_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair74" *)
  LUT3 #(
    .INIT(8'h1E))
    \tmp_13_reg_1649[1]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(add_ln1353_13_fu_799_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair55" *)
  LUT4 #(
    .INIT(16'h57A8))
    \tmp_13_reg_1649[2]_i_1
       (.I0(zext_ln215_reg_1453[4]),
        .I1(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(add_ln1353_13_fu_799_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair30" *)
  LUT5 #(
    .INIT(32'h1FFFE000))
    \tmp_13_reg_1649[3]_i_1
       (.I0(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .O(add_ln1353_13_fu_799_p2[6]));
  LUT6 #(
    .INIT(64'h7F7F7FFF80808000))
    \tmp_13_reg_1649[4]_i_1
       (.I0(zext_ln215_reg_1453[6]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[7]),
        .O(add_ln1353_13_fu_799_p2[7]));
  LUT6 #(
    .INIT(64'hBFBFBFFF40404000))
    \tmp_13_reg_1649[5]_i_1
       (.I0(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[8]),
        .O(add_ln1353_13_fu_799_p2[8]));
  LUT6 #(
    .INIT(64'hFFFF57FF0000A800))
    \tmp_13_reg_1649[6]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[9]),
        .O(add_ln1353_13_fu_799_p2[9]));
  LUT6 #(
    .INIT(64'hEEE8E8E8E8888888))
    \tmp_13_reg_1649[6]_i_2
       (.I0(add_ln647_4_reg_1502),
        .I1(zext_ln215_reg_1453[2]),
        .I2(add_ln647_1_reg_1474[1]),
        .I3(zext_ln215_reg_1453[0]),
        .I4(trunc_ln647_reg_1464[0]),
        .I5(zext_ln215_reg_1453[1]),
        .O(\tmp_13_reg_1649[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *)
  LUT4 #(
    .INIT(16'h7F80))
    \tmp_13_reg_1649[7]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(zext_ln215_reg_1453[9]),
        .I2(\tmp_13_reg_1649[7]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[10]),
        .O(add_ln1353_13_fu_799_p2[10]));
  LUT6 #(
    .INIT(64'hE000000000000000))
    \tmp_13_reg_1649[7]_i_2
       (.I0(\tmp_13_reg_1649[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .I5(zext_ln215_reg_1453[7]),
        .O(\tmp_13_reg_1649[7]_i_2_n_0 ));
  FDRE \tmp_13_reg_1649_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_13_fu_799_p2[3]),
        .Q(tmp_13_reg_1649[0]),
        .R(1'b0));
  FDRE \tmp_13_reg_1649_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_13_fu_799_p2[4]),
        .Q(tmp_13_reg_1649[1]),
        .R(1'b0));
  FDRE \tmp_13_reg_1649_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_13_fu_799_p2[5]),
        .Q(tmp_13_reg_1649[2]),
        .R(1'b0));
  FDRE \tmp_13_reg_1649_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_13_fu_799_p2[6]),
        .Q(tmp_13_reg_1649[3]),
        .R(1'b0));
  FDRE \tmp_13_reg_1649_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_13_fu_799_p2[7]),
        .Q(tmp_13_reg_1649[4]),
        .R(1'b0));
  FDRE \tmp_13_reg_1649_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_13_fu_799_p2[8]),
        .Q(tmp_13_reg_1649[5]),
        .R(1'b0));
  FDRE \tmp_13_reg_1649_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_13_fu_799_p2[9]),
        .Q(tmp_13_reg_1649[6]),
        .R(1'b0));
  FDRE \tmp_13_reg_1649_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_13_fu_799_p2[10]),
        .Q(tmp_13_reg_1649[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair89" *)
  LUT2 #(
    .INIT(4'h9))
    \tmp_15_reg_1671[0]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .O(add_ln1353_15_fu_839_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair65" *)
  LUT3 #(
    .INIT(8'h1E))
    \tmp_15_reg_1671[1]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(add_ln1353_15_fu_839_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair46" *)
  LUT4 #(
    .INIT(16'h57A8))
    \tmp_15_reg_1671[2]_i_1
       (.I0(zext_ln215_reg_1453[4]),
        .I1(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(add_ln1353_15_fu_839_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair39" *)
  LUT5 #(
    .INIT(32'h1FFFE000))
    \tmp_15_reg_1671[3]_i_1
       (.I0(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .O(add_ln1353_15_fu_839_p2[6]));
  LUT6 #(
    .INIT(64'h7F7F7FFF80808000))
    \tmp_15_reg_1671[4]_i_1
       (.I0(zext_ln215_reg_1453[6]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[7]),
        .O(add_ln1353_15_fu_839_p2[7]));
  LUT6 #(
    .INIT(64'hBFBFBFFF40404000))
    \tmp_15_reg_1671[5]_i_1
       (.I0(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[8]),
        .O(add_ln1353_15_fu_839_p2[8]));
  LUT6 #(
    .INIT(64'hFFFF57FF0000A800))
    \tmp_15_reg_1671[6]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[9]),
        .O(add_ln1353_15_fu_839_p2[9]));
  LUT6 #(
    .INIT(64'hEEE8E888E888E888))
    \tmp_15_reg_1671[6]_i_2
       (.I0(add_ln647_5_reg_1507),
        .I1(zext_ln215_reg_1453[2]),
        .I2(add_ln647_2_reg_1479[1]),
        .I3(zext_ln215_reg_1453[1]),
        .I4(zext_ln215_reg_1453[0]),
        .I5(add_ln647_reg_1469[0]),
        .O(\tmp_15_reg_1671[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *)
  LUT4 #(
    .INIT(16'h7F80))
    \tmp_15_reg_1671[7]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(zext_ln215_reg_1453[9]),
        .I2(\tmp_15_reg_1671[7]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[10]),
        .O(add_ln1353_15_fu_839_p2[10]));
  LUT6 #(
    .INIT(64'hE000000000000000))
    \tmp_15_reg_1671[7]_i_2
       (.I0(\tmp_15_reg_1671[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .I5(zext_ln215_reg_1453[7]),
        .O(\tmp_15_reg_1671[7]_i_2_n_0 ));
  FDRE \tmp_15_reg_1671_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_15_fu_839_p2[3]),
        .Q(tmp_15_reg_1671[0]),
        .R(1'b0));
  FDRE \tmp_15_reg_1671_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_15_fu_839_p2[4]),
        .Q(tmp_15_reg_1671[1]),
        .R(1'b0));
  FDRE \tmp_15_reg_1671_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_15_fu_839_p2[5]),
        .Q(tmp_15_reg_1671[2]),
        .R(1'b0));
  FDRE \tmp_15_reg_1671_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_15_fu_839_p2[6]),
        .Q(tmp_15_reg_1671[3]),
        .R(1'b0));
  FDRE \tmp_15_reg_1671_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_15_fu_839_p2[7]),
        .Q(tmp_15_reg_1671[4]),
        .R(1'b0));
  FDRE \tmp_15_reg_1671_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_15_fu_839_p2[8]),
        .Q(tmp_15_reg_1671[5]),
        .R(1'b0));
  FDRE \tmp_15_reg_1671_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_15_fu_839_p2[9]),
        .Q(tmp_15_reg_1671[6]),
        .R(1'b0));
  FDRE \tmp_15_reg_1671_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_15_fu_839_p2[10]),
        .Q(tmp_15_reg_1671[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAAA995A9955555))
    \tmp_1_reg_1529[0]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(zext_ln215_reg_1453[1]),
        .I2(\tmp_1_reg_1529[0]_i_2_n_0 ),
        .I3(trunc_ln647_reg_1464[1]),
        .I4(zext_ln215_reg_1453[2]),
        .I5(trunc_ln647_reg_1464[2]),
        .O(add_ln1353_1_fu_578_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair85" *)
  LUT2 #(
    .INIT(4'h8))
    \tmp_1_reg_1529[0]_i_2
       (.I0(zext_ln215_reg_1453[0]),
        .I1(trunc_ln647_reg_1464[0]),
        .O(\tmp_1_reg_1529[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *)
  LUT3 #(
    .INIT(8'h1E))
    \tmp_1_reg_1529[1]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(add_ln1353_1_fu_578_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair47" *)
  LUT4 #(
    .INIT(16'h57A8))
    \tmp_1_reg_1529[2]_i_1
       (.I0(zext_ln215_reg_1453[4]),
        .I1(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(add_ln1353_1_fu_578_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair36" *)
  LUT5 #(
    .INIT(32'h1FFFE000))
    \tmp_1_reg_1529[3]_i_1
       (.I0(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .O(add_ln1353_1_fu_578_p2[6]));
  LUT6 #(
    .INIT(64'h7F7F7FFF80808000))
    \tmp_1_reg_1529[4]_i_1
       (.I0(zext_ln215_reg_1453[6]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[7]),
        .O(add_ln1353_1_fu_578_p2[7]));
  LUT6 #(
    .INIT(64'hBFBFBFFF40404000))
    \tmp_1_reg_1529[5]_i_1
       (.I0(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[8]),
        .O(add_ln1353_1_fu_578_p2[8]));
  LUT6 #(
    .INIT(64'hFFFF57FF0000A800))
    \tmp_1_reg_1529[6]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[9]),
        .O(add_ln1353_1_fu_578_p2[9]));
  LUT6 #(
    .INIT(64'hFFFFEA80EA800000))
    \tmp_1_reg_1529[6]_i_2
       (.I0(zext_ln215_reg_1453[1]),
        .I1(trunc_ln647_reg_1464[0]),
        .I2(zext_ln215_reg_1453[0]),
        .I3(trunc_ln647_reg_1464[1]),
        .I4(zext_ln215_reg_1453[2]),
        .I5(trunc_ln647_reg_1464[2]),
        .O(\tmp_1_reg_1529[6]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8))
    \tmp_1_reg_1529[6]_i_3
       (.I0(zext_ln215_reg_1453[5]),
        .I1(zext_ln215_reg_1453[4]),
        .O(\tmp_1_reg_1529[6]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *)
  LUT2 #(
    .INIT(4'h7))
    \tmp_1_reg_1529[6]_i_4
       (.I0(zext_ln215_reg_1453[7]),
        .I1(zext_ln215_reg_1453[6]),
        .O(\tmp_1_reg_1529[6]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *)
  LUT4 #(
    .INIT(16'h7F80))
    \tmp_1_reg_1529[7]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(zext_ln215_reg_1453[9]),
        .I2(\tmp_1_reg_1529[7]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[10]),
        .O(add_ln1353_1_fu_578_p2[10]));
  LUT6 #(
    .INIT(64'hE000000000000000))
    \tmp_1_reg_1529[7]_i_2
       (.I0(\tmp_1_reg_1529[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .I5(zext_ln215_reg_1453[7]),
        .O(\tmp_1_reg_1529[7]_i_2_n_0 ));
  FDRE \tmp_1_reg_1529_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_1_fu_578_p2[3]),
        .Q(tmp_1_reg_1529[0]),
        .R(1'b0));
  FDRE \tmp_1_reg_1529_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_1_fu_578_p2[4]),
        .Q(tmp_1_reg_1529[1]),
        .R(1'b0));
  FDRE \tmp_1_reg_1529_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_1_fu_578_p2[5]),
        .Q(tmp_1_reg_1529[2]),
        .R(1'b0));
  FDRE \tmp_1_reg_1529_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_1_fu_578_p2[6]),
        .Q(tmp_1_reg_1529[3]),
        .R(1'b0));
  FDRE \tmp_1_reg_1529_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_1_fu_578_p2[7]),
        .Q(tmp_1_reg_1529[4]),
        .R(1'b0));
  FDRE \tmp_1_reg_1529_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_1_fu_578_p2[8]),
        .Q(tmp_1_reg_1529[5]),
        .R(1'b0));
  FDRE \tmp_1_reg_1529_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_1_fu_578_p2[9]),
        .Q(tmp_1_reg_1529[6]),
        .R(1'b0));
  FDRE \tmp_1_reg_1529_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_1_fu_578_p2[10]),
        .Q(tmp_1_reg_1529[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair87" *)
  LUT2 #(
    .INIT(4'h9))
    \tmp_3_reg_1551[0]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .O(add_ln1353_3_fu_618_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair72" *)
  LUT3 #(
    .INIT(8'h1E))
    \tmp_3_reg_1551[1]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(add_ln1353_3_fu_618_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair49" *)
  LUT4 #(
    .INIT(16'h57A8))
    \tmp_3_reg_1551[2]_i_1
       (.I0(zext_ln215_reg_1453[4]),
        .I1(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(add_ln1353_3_fu_618_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair37" *)
  LUT5 #(
    .INIT(32'h1FFFE000))
    \tmp_3_reg_1551[3]_i_1
       (.I0(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .O(add_ln1353_3_fu_618_p2[6]));
  LUT6 #(
    .INIT(64'h7F7F7FFF80808000))
    \tmp_3_reg_1551[4]_i_1
       (.I0(zext_ln215_reg_1453[6]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[7]),
        .O(add_ln1353_3_fu_618_p2[7]));
  LUT6 #(
    .INIT(64'hBFBFBFFF40404000))
    \tmp_3_reg_1551[5]_i_1
       (.I0(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[8]),
        .O(add_ln1353_3_fu_618_p2[8]));
  LUT6 #(
    .INIT(64'hFFFF57FF0000A800))
    \tmp_3_reg_1551[6]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[9]),
        .O(add_ln1353_3_fu_618_p2[9]));
  LUT6 #(
    .INIT(64'hEEE8E888E888E888))
    \tmp_3_reg_1551[6]_i_2
       (.I0(add_ln647_reg_1469[2]),
        .I1(zext_ln215_reg_1453[2]),
        .I2(add_ln647_reg_1469[1]),
        .I3(zext_ln215_reg_1453[1]),
        .I4(zext_ln215_reg_1453[0]),
        .I5(add_ln647_reg_1469[0]),
        .O(\tmp_3_reg_1551[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *)
  LUT4 #(
    .INIT(16'h7F80))
    \tmp_3_reg_1551[7]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(zext_ln215_reg_1453[9]),
        .I2(\tmp_3_reg_1551[7]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[10]),
        .O(add_ln1353_3_fu_618_p2[10]));
  LUT6 #(
    .INIT(64'hE000000000000000))
    \tmp_3_reg_1551[7]_i_2
       (.I0(\tmp_3_reg_1551[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .I5(zext_ln215_reg_1453[7]),
        .O(\tmp_3_reg_1551[7]_i_2_n_0 ));
  FDRE \tmp_3_reg_1551_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_3_fu_618_p2[3]),
        .Q(tmp_3_reg_1551[0]),
        .R(1'b0));
  FDRE \tmp_3_reg_1551_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_3_fu_618_p2[4]),
        .Q(tmp_3_reg_1551[1]),
        .R(1'b0));
  FDRE \tmp_3_reg_1551_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_3_fu_618_p2[5]),
        .Q(tmp_3_reg_1551[2]),
        .R(1'b0));
  FDRE \tmp_3_reg_1551_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_3_fu_618_p2[6]),
        .Q(tmp_3_reg_1551[3]),
        .R(1'b0));
  FDRE \tmp_3_reg_1551_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_3_fu_618_p2[7]),
        .Q(tmp_3_reg_1551[4]),
        .R(1'b0));
  FDRE \tmp_3_reg_1551_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_3_fu_618_p2[8]),
        .Q(tmp_3_reg_1551[5]),
        .R(1'b0));
  FDRE \tmp_3_reg_1551_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_3_fu_618_p2[9]),
        .Q(tmp_3_reg_1551[6]),
        .R(1'b0));
  FDRE \tmp_3_reg_1551_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_3_fu_618_p2[10]),
        .Q(tmp_3_reg_1551[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hA9A9A995A9959595))
    \tmp_5_reg_1573[0]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(add_ln647_1_reg_1474[2]),
        .I2(zext_ln215_reg_1453[2]),
        .I3(add_ln647_1_reg_1474[1]),
        .I4(\tmp_1_reg_1529[0]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[1]),
        .O(add_ln1353_5_fu_658_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair67" *)
  LUT3 #(
    .INIT(8'h1E))
    \tmp_5_reg_1573[1]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(add_ln1353_5_fu_658_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair52" *)
  LUT4 #(
    .INIT(16'h57A8))
    \tmp_5_reg_1573[2]_i_1
       (.I0(zext_ln215_reg_1453[4]),
        .I1(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(add_ln1353_5_fu_658_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair29" *)
  LUT5 #(
    .INIT(32'h1FFFE000))
    \tmp_5_reg_1573[3]_i_1
       (.I0(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .O(add_ln1353_5_fu_658_p2[6]));
  LUT6 #(
    .INIT(64'h7F7F7FFF80808000))
    \tmp_5_reg_1573[4]_i_1
       (.I0(zext_ln215_reg_1453[6]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[7]),
        .O(add_ln1353_5_fu_658_p2[7]));
  LUT6 #(
    .INIT(64'hBFBFBFFF40404000))
    \tmp_5_reg_1573[5]_i_1
       (.I0(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[8]),
        .O(add_ln1353_5_fu_658_p2[8]));
  LUT6 #(
    .INIT(64'hFFFF57FF0000A800))
    \tmp_5_reg_1573[6]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[9]),
        .O(add_ln1353_5_fu_658_p2[9]));
  LUT6 #(
    .INIT(64'hEEE8E8E8E8888888))
    \tmp_5_reg_1573[6]_i_2
       (.I0(add_ln647_1_reg_1474[2]),
        .I1(zext_ln215_reg_1453[2]),
        .I2(add_ln647_1_reg_1474[1]),
        .I3(zext_ln215_reg_1453[0]),
        .I4(trunc_ln647_reg_1464[0]),
        .I5(zext_ln215_reg_1453[1]),
        .O(\tmp_5_reg_1573[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *)
  LUT4 #(
    .INIT(16'h7F80))
    \tmp_5_reg_1573[7]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(zext_ln215_reg_1453[9]),
        .I2(\tmp_5_reg_1573[7]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[10]),
        .O(add_ln1353_5_fu_658_p2[10]));
  LUT6 #(
    .INIT(64'hE000000000000000))
    \tmp_5_reg_1573[7]_i_2
       (.I0(\tmp_5_reg_1573[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .I5(zext_ln215_reg_1453[7]),
        .O(\tmp_5_reg_1573[7]_i_2_n_0 ));
  FDRE \tmp_5_reg_1573_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_5_fu_658_p2[3]),
        .Q(tmp_5_reg_1573[0]),
        .R(1'b0));
  FDRE \tmp_5_reg_1573_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_5_fu_658_p2[4]),
        .Q(tmp_5_reg_1573[1]),
        .R(1'b0));
  FDRE \tmp_5_reg_1573_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_5_fu_658_p2[5]),
        .Q(tmp_5_reg_1573[2]),
        .R(1'b0));
  FDRE \tmp_5_reg_1573_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_5_fu_658_p2[6]),
        .Q(tmp_5_reg_1573[3]),
        .R(1'b0));
  FDRE \tmp_5_reg_1573_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_5_fu_658_p2[7]),
        .Q(tmp_5_reg_1573[4]),
        .R(1'b0));
  FDRE \tmp_5_reg_1573_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_5_fu_658_p2[8]),
        .Q(tmp_5_reg_1573[5]),
        .R(1'b0));
  FDRE \tmp_5_reg_1573_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_5_fu_658_p2[9]),
        .Q(tmp_5_reg_1573[6]),
        .R(1'b0));
  FDRE \tmp_5_reg_1573_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_5_fu_658_p2[10]),
        .Q(tmp_5_reg_1573[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair90" *)
  LUT2 #(
    .INIT(4'h9))
    \tmp_7_reg_1595[0]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .O(add_ln1353_7_fu_698_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair77" *)
  LUT3 #(
    .INIT(8'h1E))
    \tmp_7_reg_1595[1]_i_1
       (.I0(zext_ln215_reg_1453[3]),
        .I1(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[4]),
        .O(add_ln1353_7_fu_698_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair50" *)
  LUT4 #(
    .INIT(16'h57A8))
    \tmp_7_reg_1595[2]_i_1
       (.I0(zext_ln215_reg_1453[4]),
        .I1(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(zext_ln215_reg_1453[5]),
        .O(add_ln1353_7_fu_698_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair35" *)
  LUT5 #(
    .INIT(32'h1FFFE000))
    \tmp_7_reg_1595[3]_i_1
       (.I0(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .O(add_ln1353_7_fu_698_p2[6]));
  LUT6 #(
    .INIT(64'h7F7F7FFF80808000))
    \tmp_7_reg_1595[4]_i_1
       (.I0(zext_ln215_reg_1453[6]),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[7]),
        .O(add_ln1353_7_fu_698_p2[7]));
  LUT6 #(
    .INIT(64'hBFBFBFFF40404000))
    \tmp_7_reg_1595[5]_i_1
       (.I0(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I1(zext_ln215_reg_1453[4]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[3]),
        .I4(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I5(zext_ln215_reg_1453[8]),
        .O(add_ln1353_7_fu_698_p2[8]));
  LUT6 #(
    .INIT(64'hFFFF57FF0000A800))
    \tmp_7_reg_1595[6]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I2(zext_ln215_reg_1453[3]),
        .I3(\tmp_1_reg_1529[6]_i_3_n_0 ),
        .I4(\tmp_1_reg_1529[6]_i_4_n_0 ),
        .I5(zext_ln215_reg_1453[9]),
        .O(add_ln1353_7_fu_698_p2[9]));
  LUT6 #(
    .INIT(64'hEEE8E888E888E888))
    \tmp_7_reg_1595[6]_i_2
       (.I0(add_ln647_2_reg_1479[2]),
        .I1(zext_ln215_reg_1453[2]),
        .I2(add_ln647_2_reg_1479[1]),
        .I3(zext_ln215_reg_1453[1]),
        .I4(zext_ln215_reg_1453[0]),
        .I5(add_ln647_reg_1469[0]),
        .O(\tmp_7_reg_1595[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *)
  LUT4 #(
    .INIT(16'h7F80))
    \tmp_7_reg_1595[7]_i_1
       (.I0(zext_ln215_reg_1453[8]),
        .I1(zext_ln215_reg_1453[9]),
        .I2(\tmp_7_reg_1595[7]_i_2_n_0 ),
        .I3(zext_ln215_reg_1453[10]),
        .O(add_ln1353_7_fu_698_p2[10]));
  LUT6 #(
    .INIT(64'hE000000000000000))
    \tmp_7_reg_1595[7]_i_2
       (.I0(\tmp_7_reg_1595[6]_i_2_n_0 ),
        .I1(zext_ln215_reg_1453[3]),
        .I2(zext_ln215_reg_1453[5]),
        .I3(zext_ln215_reg_1453[4]),
        .I4(zext_ln215_reg_1453[6]),
        .I5(zext_ln215_reg_1453[7]),
        .O(\tmp_7_reg_1595[7]_i_2_n_0 ));
  FDRE \tmp_7_reg_1595_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_7_fu_698_p2[3]),
        .Q(tmp_7_reg_1595[0]),
        .R(1'b0));
  FDRE \tmp_7_reg_1595_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_7_fu_698_p2[4]),
        .Q(tmp_7_reg_1595[1]),
        .R(1'b0));
  FDRE \tmp_7_reg_1595_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_7_fu_698_p2[5]),
        .Q(tmp_7_reg_1595[2]),
        .R(1'b0));
  FDRE \tmp_7_reg_1595_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_7_fu_698_p2[6]),
        .Q(tmp_7_reg_1595[3]),
        .R(1'b0));
  FDRE \tmp_7_reg_1595_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_7_fu_698_p2[7]),
        .Q(tmp_7_reg_1595[4]),
        .R(1'b0));
  FDRE \tmp_7_reg_1595_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_7_fu_698_p2[8]),
        .Q(tmp_7_reg_1595[5]),
        .R(1'b0));
  FDRE \tmp_7_reg_1595_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_7_fu_698_p2[9]),
        .Q(tmp_7_reg_1595[6]),
        .R(1'b0));
  FDRE \tmp_7_reg_1595_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_7_fu_698_p2[10]),
        .Q(tmp_7_reg_1595[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair84" *)
  LUT1 #(
    .INIT(2'h1))
    \tmp_9_reg_1605[0]_i_1
       (.I0(add_ln1353_8_reg_1484[3]),
        .O(add_ln1353_9_fu_720_p2[3]));
  (* SOFT_HLUTNM = "soft_lutpair84" *)
  LUT2 #(
    .INIT(4'h6))
    \tmp_9_reg_1605[1]_i_1
       (.I0(add_ln1353_8_reg_1484[3]),
        .I1(add_ln1353_8_reg_1484[4]),
        .O(add_ln1353_9_fu_720_p2[4]));
  (* SOFT_HLUTNM = "soft_lutpair79" *)
  LUT3 #(
    .INIT(8'h78))
    \tmp_9_reg_1605[2]_i_1
       (.I0(add_ln1353_8_reg_1484[3]),
        .I1(add_ln1353_8_reg_1484[4]),
        .I2(add_ln1353_8_reg_1484[5]),
        .O(add_ln1353_9_fu_720_p2[5]));
  (* SOFT_HLUTNM = "soft_lutpair54" *)
  LUT4 #(
    .INIT(16'h7F80))
    \tmp_9_reg_1605[3]_i_1
       (.I0(add_ln1353_8_reg_1484[4]),
        .I1(add_ln1353_8_reg_1484[3]),
        .I2(add_ln1353_8_reg_1484[5]),
        .I3(add_ln1353_8_reg_1484[6]),
        .O(add_ln1353_9_fu_720_p2[6]));
  (* SOFT_HLUTNM = "soft_lutpair54" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \tmp_9_reg_1605[4]_i_1
       (.I0(add_ln1353_8_reg_1484[5]),
        .I1(add_ln1353_8_reg_1484[3]),
        .I2(add_ln1353_8_reg_1484[4]),
        .I3(add_ln1353_8_reg_1484[6]),
        .I4(add_ln1353_8_reg_1484[7]),
        .O(add_ln1353_9_fu_720_p2[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \tmp_9_reg_1605[5]_i_1
       (.I0(add_ln1353_8_reg_1484[6]),
        .I1(add_ln1353_8_reg_1484[4]),
        .I2(add_ln1353_8_reg_1484[3]),
        .I3(add_ln1353_8_reg_1484[5]),
        .I4(add_ln1353_8_reg_1484[7]),
        .I5(add_ln1353_8_reg_1484[8]),
        .O(add_ln1353_9_fu_720_p2[8]));
  (* SOFT_HLUTNM = "soft_lutpair66" *)
  LUT2 #(
    .INIT(4'h6))
    \tmp_9_reg_1605[6]_i_1
       (.I0(\tmp_9_reg_1605[7]_i_2_n_0 ),
        .I1(add_ln1353_8_reg_1484[9]),
        .O(add_ln1353_9_fu_720_p2[9]));
  (* SOFT_HLUTNM = "soft_lutpair66" *)
  LUT3 #(
    .INIT(8'h78))
    \tmp_9_reg_1605[7]_i_1
       (.I0(\tmp_9_reg_1605[7]_i_2_n_0 ),
        .I1(add_ln1353_8_reg_1484[9]),
        .I2(add_ln1353_8_reg_1484[10]),
        .O(add_ln1353_9_fu_720_p2[10]));
  LUT6 #(
    .INIT(64'h8000000000000000))
    \tmp_9_reg_1605[7]_i_2
       (.I0(add_ln1353_8_reg_1484[8]),
        .I1(add_ln1353_8_reg_1484[6]),
        .I2(add_ln1353_8_reg_1484[4]),
        .I3(add_ln1353_8_reg_1484[3]),
        .I4(add_ln1353_8_reg_1484[5]),
        .I5(add_ln1353_8_reg_1484[7]),
        .O(\tmp_9_reg_1605[7]_i_2_n_0 ));
  FDRE \tmp_9_reg_1605_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_9_fu_720_p2[3]),
        .Q(tmp_9_reg_1605[0]),
        .R(1'b0));
  FDRE \tmp_9_reg_1605_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_9_fu_720_p2[4]),
        .Q(tmp_9_reg_1605[1]),
        .R(1'b0));
  FDRE \tmp_9_reg_1605_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_9_fu_720_p2[5]),
        .Q(tmp_9_reg_1605[2]),
        .R(1'b0));
  FDRE \tmp_9_reg_1605_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_9_fu_720_p2[6]),
        .Q(tmp_9_reg_1605[3]),
        .R(1'b0));
  FDRE \tmp_9_reg_1605_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_9_fu_720_p2[7]),
        .Q(tmp_9_reg_1605[4]),
        .R(1'b0));
  FDRE \tmp_9_reg_1605_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_9_fu_720_p2[8]),
        .Q(tmp_9_reg_1605[5]),
        .R(1'b0));
  FDRE \tmp_9_reg_1605_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_9_fu_720_p2[9]),
        .Q(tmp_9_reg_1605[6]),
        .R(1'b0));
  FDRE \tmp_9_reg_1605_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(add_ln1353_9_fu_720_p2[10]),
        .Q(tmp_9_reg_1605[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair86" *)
  LUT2 #(
    .INIT(4'h6))
    \trunc_ln647_reg_1464[1]_i_1
       (.I0(rom_idx_V[0]),
        .I1(rom_idx_V[1]),
        .O(ret_V_fu_456_p2[1]));
  (* SOFT_HLUTNM = "soft_lutpair81" *)
  LUT3 #(
    .INIT(8'h1E))
    \trunc_ln647_reg_1464[2]_i_1
       (.I0(rom_idx_V[1]),
        .I1(rom_idx_V[0]),
        .I2(rom_idx_V[2]),
        .O(ret_V_fu_456_p2[2]));
  FDRE \trunc_ln647_reg_1464_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(rom_idx_V[0]),
        .Q(trunc_ln647_reg_1464[0]),
        .R(1'b0));
  FDRE \trunc_ln647_reg_1464_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(ret_V_fu_456_p2[1]),
        .Q(trunc_ln647_reg_1464[1]),
        .R(1'b0));
  FDRE \trunc_ln647_reg_1464_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(ret_V_fu_456_p2[2]),
        .Q(trunc_ln647_reg_1464[2]),
        .R(1'b0));
  FDRE \zext_ln215_reg_1453_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(lut_start_addr_V[0]),
        .Q(zext_ln215_reg_1453[0]),
        .R(1'b0));
  FDRE \zext_ln215_reg_1453_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(lut_start_addr_V[10]),
        .Q(zext_ln215_reg_1453[10]),
        .R(1'b0));
  FDRE \zext_ln215_reg_1453_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(lut_start_addr_V[11]),
        .Q(zext_ln215_reg_1453[11]),
        .R(1'b0));
  FDRE \zext_ln215_reg_1453_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(lut_start_addr_V[1]),
        .Q(zext_ln215_reg_1453[1]),
        .R(1'b0));
  FDRE \zext_ln215_reg_1453_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(lut_start_addr_V[2]),
        .Q(zext_ln215_reg_1453[2]),
        .R(1'b0));
  FDRE \zext_ln215_reg_1453_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(lut_start_addr_V[3]),
        .Q(zext_ln215_reg_1453[3]),
        .R(1'b0));
  FDRE \zext_ln215_reg_1453_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(lut_start_addr_V[4]),
        .Q(zext_ln215_reg_1453[4]),
        .R(1'b0));
  FDRE \zext_ln215_reg_1453_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(lut_start_addr_V[5]),
        .Q(zext_ln215_reg_1453[5]),
        .R(1'b0));
  FDRE \zext_ln215_reg_1453_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(lut_start_addr_V[6]),
        .Q(zext_ln215_reg_1453[6]),
        .R(1'b0));
  FDRE \zext_ln215_reg_1453_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(lut_start_addr_V[7]),
        .Q(zext_ln215_reg_1453[7]),
        .R(1'b0));
  FDRE \zext_ln215_reg_1453_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(lut_start_addr_V[8]),
        .Q(zext_ln215_reg_1453[8]),
        .R(1'b0));
  FDRE \zext_ln215_reg_1453_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(lut_start_addr_V[9]),
        .Q(zext_ln215_reg_1453[9]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_lutbkb" *)
module hls_get_trig_vals_get_trig_vals_lutbkb
   (hw_trig_vals_0_V,
    hw_trig_vals_8_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_reg_1512,
    tmp_1_reg_1529,
    icmp_ln895_1_reg_1524);
  output [35:0]hw_trig_vals_0_V;
  output [35:0]hw_trig_vals_8_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [12:0]add_ln1353_reg_1512;
  input [7:0]tmp_1_reg_1529;
  input icmp_ln895_1_reg_1524;

  wire [12:0]add_ln1353_reg_1512;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_0_V;
  wire [35:0]hw_trig_vals_8_V;
  wire icmp_ln895_1_reg_1524;
  wire [7:0]tmp_1_reg_1529;

  hls_get_trig_vals_get_trig_vals_lutbkb_rom get_trig_vals_lutbkb_rom_U
       (.add_ln1353_reg_1512(add_ln1353_reg_1512),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ce1),
        .hw_trig_vals_0_V(hw_trig_vals_0_V),
        .hw_trig_vals_8_V(hw_trig_vals_8_V),
        .icmp_ln895_1_reg_1524(icmp_ln895_1_reg_1524),
        .tmp_1_reg_1529(tmp_1_reg_1529));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_lutbkb_rom" *)
module hls_get_trig_vals_get_trig_vals_lutbkb_rom
   (hw_trig_vals_0_V,
    hw_trig_vals_8_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_reg_1512,
    tmp_1_reg_1529,
    icmp_ln895_1_reg_1524);
  output [35:0]hw_trig_vals_0_V;
  output [35:0]hw_trig_vals_8_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [12:0]add_ln1353_reg_1512;
  input [7:0]tmp_1_reg_1529;
  input icmp_ln895_1_reg_1524;

  wire [12:0]add_ln1353_reg_1512;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_0_V;
  wire [35:0]hw_trig_vals_8_V;
  wire icmp_ln895_1_reg_1524;
  wire q0_reg_i_10_n_0;
  wire q0_reg_i_11_n_0;
  wire q0_reg_i_12_n_0;
  wire q0_reg_i_13_n_0;
  wire q0_reg_i_9_n_0;
  wire q1_reg_i_1_n_0;
  wire q1_reg_i_2_n_0;
  wire q1_reg_i_3_n_0;
  wire q1_reg_i_4_n_0;
  wire q1_reg_i_5_n_0;
  wire q1_reg_i_6_n_0;
  wire q1_reg_i_7_n_0;
  wire q1_reg_i_8_n_0;
  wire q1_reg_i_9_n_0;
  wire [7:0]sel;
  wire [7:0]tmp_1_reg_1529;
  wire [15:0]NLW_q0_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q0_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPB_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_0_U/get_trig_vals_lutbkb_rom_U/q0" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555000000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000015555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h020801AE015E011500D5009E006E004700290013000500000003000E0022003E),
    .INIT_01(256'h0C030B250A50098208BD0801074C06A005FC056004CD044203BF034502D30269),
    .INIT_02(256'h1E2A1CCB1B751A2618DF17A1166A153B141512F611DF10D10FCB0ECC0DD60CE8),
    .INIT_03(256'h38303657348532BA30F72F3C2D882BDC2A37289A2705257823F2227420FE1F90),
    .INIT_04(256'h59AB575E551752D850A04E6F4C464A23480745F343E641E03FE13DEA3BFA3A12),
    .INIT_05(256'h820C7F557CA479FA775674B972226F926D086A8568086592632360BB5E595BFE),
    .INIT_06(256'hB0ABAD96AA86A77CA477A1799E809B8C989F95B892D68FFA8D258A55878C84C9),
    .INIT_07(256'hE4C5E15EDDFCDA9FD746D3F3D0A4CD5ACA16C6D6C39BC066BD36BA0BB6E6B3C5),
    .INIT_08(256'h1D8019D61630128D0EEF0B5407BE042B009DFD13F98DF60BF28EEF15EBA0E830),
    .INIT_09(256'h59EF561152364E5E4A8846B642E63F1A3B51378B33C830092C4D289424DF212E),
    .INIT_0A(256'h9915951391138D158918851E81267D2F793B7549715A6D6C6981659961B35DD0),
    .INIT_0B(256'hD9E9D5D4D1C0CDADC99AC589C178BD68B95AB54CB140AD35A92CA524A11D9D18),
    .INIT_0C(256'h00000000000000000000000000000000000000000000EE59EA42E62BE214DDFE),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h2D90297C256721511D3B1925150E10F70CDF08C704AF0097FC7FF867F450F038),
    .INIT_21(256'h6E416A40663E623B5E355A2E5626521C4E114A0545F741E83DD939C835B631A3),
    .INIT_22(256'hAD24A948A56AA1899DA599BF95D691EA8DFD8A0D861A82267E2F7A36763C723F),
    .INIT_23(256'hE933E58CE1E1DE33DA81D6CBD312CF56CB96C7D3C40CC042BC76B8A6B4D3B0FD),
    .INIT_24(256'h21721E0F1AA8173C13CB10560CDC095E05DC0255FECAFB3BF7A8F410F075ECD6),
    .INIT_25(256'h54F651E64ECF4BB44893456C42413F103BD9389E355E32182ECD2B7E282924D0),
    .INIT_26(256'h82E880367D7E7AC077FC753272616F8A6CAE69CB66E363F461005E065B075801),
    .INIT_27(256'hAA86A83FA5F1A39CA1409EDD9C749A03978C950F928A90008D6E8AD688388593),
    .INIT_28(256'hCB2DC959C77EC59CC3B2C1C1BFC9BDC9BBC2B9B4B79EB581B35DB132AF00ACC7),
    .INIT_29(256'hE452E2FAE19AE032DEC3DD4BDBCCDA45D8B7D720D582D3DCD22FD07ACEBDCCF9),
    .INIT_2A(256'hF58CF4B5F3D7F2EFF200F109F009EF01EDF2ECDAEBBAEA92E962E82AE6EAE5A2),
    .INIT_2B(256'hFE94FE42FDE8FD85FD1AFCA6FC2AFBA6FB1AFA85F9E8F943F895F7DFF721F65B),
    .INIT_2C(256'h00000000000000000000000000000000000000000000FFB2FF89FF59FF20FEDE),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q0_reg
       (.ADDRARDADDR({1'b0,1'b0,sel,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,sel,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q0_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q0_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q0_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q0_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_0_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_0_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_0_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_0_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h7777777F88888880))
    q0_reg_i_1
       (.I0(add_ln1353_reg_1512[9]),
        .I1(q0_reg_i_9_n_0),
        .I2(q0_reg_i_10_n_0),
        .I3(add_ln1353_reg_1512[8]),
        .I4(q0_reg_i_11_n_0),
        .I5(add_ln1353_reg_1512[10]),
        .O(sel[7]));
  (* SOFT_HLUTNM = "soft_lutpair2" *)
  LUT3 #(
    .INIT(8'hE0))
    q0_reg_i_10
       (.I0(add_ln1353_reg_1512[4]),
        .I1(add_ln1353_reg_1512[3]),
        .I2(add_ln1353_reg_1512[5]),
        .O(q0_reg_i_10_n_0));
  LUT2 #(
    .INIT(4'hE))
    q0_reg_i_11
       (.I0(add_ln1353_reg_1512[7]),
        .I1(add_ln1353_reg_1512[6]),
        .O(q0_reg_i_11_n_0));
  LUT5 #(
    .INIT(32'hFFFEFEFE))
    q0_reg_i_12
       (.I0(add_ln1353_reg_1512[7]),
        .I1(add_ln1353_reg_1512[6]),
        .I2(add_ln1353_reg_1512[8]),
        .I3(add_ln1353_reg_1512[4]),
        .I4(add_ln1353_reg_1512[5]),
        .O(q0_reg_i_12_n_0));
  LUT5 #(
    .INIT(32'h88888880))
    q0_reg_i_13
       (.I0(add_ln1353_reg_1512[3]),
        .I1(add_ln1353_reg_1512[5]),
        .I2(add_ln1353_reg_1512[1]),
        .I3(add_ln1353_reg_1512[2]),
        .I4(add_ln1353_reg_1512[0]),
        .O(q0_reg_i_13_n_0));
  LUT6 #(
    .INIT(64'h0001FFFFFFFE0000))
    q0_reg_i_2
       (.I0(add_ln1353_reg_1512[7]),
        .I1(add_ln1353_reg_1512[6]),
        .I2(add_ln1353_reg_1512[8]),
        .I3(q0_reg_i_10_n_0),
        .I4(q0_reg_i_9_n_0),
        .I5(add_ln1353_reg_1512[9]),
        .O(sel[6]));
  LUT6 #(
    .INIT(64'hEEEAFFFF11150000))
    q0_reg_i_3
       (.I0(q0_reg_i_11_n_0),
        .I1(add_ln1353_reg_1512[5]),
        .I2(add_ln1353_reg_1512[3]),
        .I3(add_ln1353_reg_1512[4]),
        .I4(q0_reg_i_9_n_0),
        .I5(add_ln1353_reg_1512[8]),
        .O(sel[5]));
  LUT6 #(
    .INIT(64'hA9A9A999AAAAAAAA))
    q0_reg_i_4
       (.I0(add_ln1353_reg_1512[7]),
        .I1(add_ln1353_reg_1512[6]),
        .I2(add_ln1353_reg_1512[5]),
        .I3(add_ln1353_reg_1512[3]),
        .I4(add_ln1353_reg_1512[4]),
        .I5(q0_reg_i_9_n_0),
        .O(sel[4]));
  LUT5 #(
    .INIT(32'h9995AAAA))
    q0_reg_i_5
       (.I0(add_ln1353_reg_1512[6]),
        .I1(add_ln1353_reg_1512[5]),
        .I2(add_ln1353_reg_1512[3]),
        .I3(add_ln1353_reg_1512[4]),
        .I4(q0_reg_i_9_n_0),
        .O(sel[3]));
  LUT4 #(
    .INIT(16'h57A8))
    q0_reg_i_6
       (.I0(q0_reg_i_9_n_0),
        .I1(add_ln1353_reg_1512[3]),
        .I2(add_ln1353_reg_1512[4]),
        .I3(add_ln1353_reg_1512[5]),
        .O(sel[2]));
  LUT3 #(
    .INIT(8'h9C))
    q0_reg_i_7
       (.I0(add_ln1353_reg_1512[3]),
        .I1(add_ln1353_reg_1512[4]),
        .I2(q0_reg_i_9_n_0),
        .O(sel[1]));
  LUT2 #(
    .INIT(4'h6))
    q0_reg_i_8
       (.I0(q0_reg_i_9_n_0),
        .I1(add_ln1353_reg_1512[3]),
        .O(sel[0]));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    q0_reg_i_9
       (.I0(add_ln1353_reg_1512[12]),
        .I1(add_ln1353_reg_1512[11]),
        .I2(q0_reg_i_12_n_0),
        .I3(q0_reg_i_13_n_0),
        .I4(add_ln1353_reg_1512[9]),
        .I5(add_ln1353_reg_1512[10]),
        .O(q0_reg_i_9_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_0_U/get_trig_vals_lutbkb_rom_U/q1" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555000000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000015555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h020801AE015E011500D5009E006E004700290013000500000003000E0022003E),
    .INIT_01(256'h0C030B250A50098208BD0801074C06A005FC056004CD044203BF034502D30269),
    .INIT_02(256'h1E2A1CCB1B751A2618DF17A1166A153B141512F611DF10D10FCB0ECC0DD60CE8),
    .INIT_03(256'h38303657348532BA30F72F3C2D882BDC2A37289A2705257823F2227420FE1F90),
    .INIT_04(256'h59AB575E551752D850A04E6F4C464A23480745F343E641E03FE13DEA3BFA3A12),
    .INIT_05(256'h820C7F557CA479FA775674B972226F926D086A8568086592632360BB5E595BFE),
    .INIT_06(256'hB0ABAD96AA86A77CA477A1799E809B8C989F95B892D68FFA8D258A55878C84C9),
    .INIT_07(256'hE4C5E15EDDFCDA9FD746D3F3D0A4CD5ACA16C6D6C39BC066BD36BA0BB6E6B3C5),
    .INIT_08(256'h1D8019D61630128D0EEF0B5407BE042B009DFD13F98DF60BF28EEF15EBA0E830),
    .INIT_09(256'h59EF561152364E5E4A8846B642E63F1A3B51378B33C830092C4D289424DF212E),
    .INIT_0A(256'h9915951391138D158918851E81267D2F793B7549715A6D6C6981659961B35DD0),
    .INIT_0B(256'hD9E9D5D4D1C0CDADC99AC589C178BD68B95AB54CB140AD35A92CA524A11D9D18),
    .INIT_0C(256'h00000000000000000000000000000000000000000000EE59EA42E62BE214DDFE),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h2D90297C256721511D3B1925150E10F70CDF08C704AF0097FC7FF867F450F038),
    .INIT_21(256'h6E416A40663E623B5E355A2E5626521C4E114A0545F741E83DD939C835B631A3),
    .INIT_22(256'hAD24A948A56AA1899DA599BF95D691EA8DFD8A0D861A82267E2F7A36763C723F),
    .INIT_23(256'hE933E58CE1E1DE33DA81D6CBD312CF56CB96C7D3C40CC042BC76B8A6B4D3B0FD),
    .INIT_24(256'h21721E0F1AA8173C13CB10560CDC095E05DC0255FECAFB3BF7A8F410F075ECD6),
    .INIT_25(256'h54F651E64ECF4BB44893456C42413F103BD9389E355E32182ECD2B7E282924D0),
    .INIT_26(256'h82E880367D7E7AC077FC753272616F8A6CAE69CB66E363F461005E065B075801),
    .INIT_27(256'hAA86A83FA5F1A39CA1409EDD9C749A03978C950F928A90008D6E8AD688388593),
    .INIT_28(256'hCB2DC959C77EC59CC3B2C1C1BFC9BDC9BBC2B9B4B79EB581B35DB132AF00ACC7),
    .INIT_29(256'hE452E2FAE19AE032DEC3DD4BDBCCDA45D8B7D720D582D3DCD22FD07ACEBDCCF9),
    .INIT_2A(256'hF58CF4B5F3D7F2EFF200F109F009EF01EDF2ECDAEBBAEA92E962E82AE6EAE5A2),
    .INIT_2B(256'hFE94FE42FDE8FD85FD1AFCA6FC2AFBA6FB1AFA85F9E8F943F895F7DFF721F65B),
    .INIT_2C(256'h00000000000000000000000000000000000000000000FFB2FF89FF59FF20FEDE),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q1_reg
       (.ADDRARDADDR({1'b0,1'b0,q1_reg_i_1_n_0,q1_reg_i_2_n_0,q1_reg_i_3_n_0,q1_reg_i_4_n_0,q1_reg_i_5_n_0,q1_reg_i_6_n_0,q1_reg_i_7_n_0,q1_reg_i_8_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q1_reg_i_1_n_0,q1_reg_i_2_n_0,q1_reg_i_3_n_0,q1_reg_i_4_n_0,q1_reg_i_5_n_0,q1_reg_i_6_n_0,q1_reg_i_7_n_0,q1_reg_i_8_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q1_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q1_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q1_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q1_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_8_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_8_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_8_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_8_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h03FFAAAAFC00AAAA))
    q1_reg_i_1
       (.I0(tmp_1_reg_1529[7]),
        .I1(add_ln1353_reg_1512[8]),
        .I2(q1_reg_i_9_n_0),
        .I3(add_ln1353_reg_1512[9]),
        .I4(icmp_ln895_1_reg_1524),
        .I5(add_ln1353_reg_1512[10]),
        .O(q1_reg_i_1_n_0));
  LUT5 #(
    .INIT(32'h03AAFCAA))
    q1_reg_i_2
       (.I0(tmp_1_reg_1529[6]),
        .I1(q1_reg_i_9_n_0),
        .I2(add_ln1353_reg_1512[8]),
        .I3(icmp_ln895_1_reg_1524),
        .I4(add_ln1353_reg_1512[9]),
        .O(q1_reg_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFCAAAA0003AAAA))
    q1_reg_i_3
       (.I0(tmp_1_reg_1529[5]),
        .I1(add_ln1353_reg_1512[6]),
        .I2(add_ln1353_reg_1512[7]),
        .I3(add_ln1353_reg_1512[5]),
        .I4(icmp_ln895_1_reg_1524),
        .I5(add_ln1353_reg_1512[8]),
        .O(q1_reg_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *)
  LUT5 #(
    .INIT(32'hF0C3AAAA))
    q1_reg_i_4
       (.I0(tmp_1_reg_1529[4]),
        .I1(add_ln1353_reg_1512[6]),
        .I2(add_ln1353_reg_1512[7]),
        .I3(add_ln1353_reg_1512[5]),
        .I4(icmp_ln895_1_reg_1524),
        .O(q1_reg_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *)
  LUT4 #(
    .INIT(16'hE22E))
    q1_reg_i_5
       (.I0(tmp_1_reg_1529[3]),
        .I1(icmp_ln895_1_reg_1524),
        .I2(add_ln1353_reg_1512[5]),
        .I3(add_ln1353_reg_1512[6]),
        .O(q1_reg_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *)
  LUT3 #(
    .INIT(8'h74))
    q1_reg_i_6
       (.I0(add_ln1353_reg_1512[5]),
        .I1(icmp_ln895_1_reg_1524),
        .I2(tmp_1_reg_1529[2]),
        .O(q1_reg_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *)
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_7
       (.I0(add_ln1353_reg_1512[4]),
        .I1(icmp_ln895_1_reg_1524),
        .I2(tmp_1_reg_1529[1]),
        .O(q1_reg_i_7_n_0));
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_8
       (.I0(add_ln1353_reg_1512[3]),
        .I1(icmp_ln895_1_reg_1524),
        .I2(tmp_1_reg_1529[0]),
        .O(q1_reg_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *)
  LUT3 #(
    .INIT(8'hFE))
    q1_reg_i_9
       (.I0(add_ln1353_reg_1512[6]),
        .I1(add_ln1353_reg_1512[7]),
        .I2(add_ln1353_reg_1512[5]),
        .O(q1_reg_i_9_n_0));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_lutcud" *)
module hls_get_trig_vals_get_trig_vals_lutcud
   (hw_trig_vals_1_V,
    hw_trig_vals_9_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_2_reg_1534,
    tmp_3_reg_1551,
    icmp_ln895_9_reg_1546);
  output [35:0]hw_trig_vals_1_V;
  output [35:0]hw_trig_vals_9_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [12:0]add_ln1353_2_reg_1534;
  input [7:0]tmp_3_reg_1551;
  input icmp_ln895_9_reg_1546;

  wire [12:0]add_ln1353_2_reg_1534;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_1_V;
  wire [35:0]hw_trig_vals_9_V;
  wire icmp_ln895_9_reg_1546;
  wire [7:0]tmp_3_reg_1551;

  hls_get_trig_vals_get_trig_vals_lutcud_rom get_trig_vals_lutcud_rom_U
       (.add_ln1353_2_reg_1534(add_ln1353_2_reg_1534),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ce1),
        .hw_trig_vals_1_V(hw_trig_vals_1_V),
        .hw_trig_vals_9_V(hw_trig_vals_9_V),
        .icmp_ln895_9_reg_1546(icmp_ln895_9_reg_1546),
        .tmp_3_reg_1551(tmp_3_reg_1551));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_lutcud_rom" *)
module hls_get_trig_vals_get_trig_vals_lutcud_rom
   (hw_trig_vals_1_V,
    hw_trig_vals_9_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_2_reg_1534,
    tmp_3_reg_1551,
    icmp_ln895_9_reg_1546);
  output [35:0]hw_trig_vals_1_V;
  output [35:0]hw_trig_vals_9_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [12:0]add_ln1353_2_reg_1534;
  input [7:0]tmp_3_reg_1551;
  input icmp_ln895_9_reg_1546;

  wire [12:0]add_ln1353_2_reg_1534;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_1_V;
  wire [35:0]hw_trig_vals_9_V;
  wire icmp_ln895_9_reg_1546;
  wire q0_reg_i_10__0_n_0;
  wire q0_reg_i_11__0_n_0;
  wire q0_reg_i_12__0_n_0;
  wire q0_reg_i_13__0_n_0;
  wire q0_reg_i_1__0_n_0;
  wire q0_reg_i_2__0_n_0;
  wire q0_reg_i_3__0_n_0;
  wire q0_reg_i_4__0_n_0;
  wire q0_reg_i_5__0_n_0;
  wire q0_reg_i_6__0_n_0;
  wire q0_reg_i_7__0_n_0;
  wire q0_reg_i_8__0_n_0;
  wire q0_reg_i_9__0_n_0;
  wire q1_reg_i_1__0_n_0;
  wire q1_reg_i_2__0_n_0;
  wire q1_reg_i_3__0_n_0;
  wire q1_reg_i_4__0_n_0;
  wire q1_reg_i_5__0_n_0;
  wire q1_reg_i_6__0_n_0;
  wire q1_reg_i_7__0_n_0;
  wire q1_reg_i_8__0_n_0;
  wire q1_reg_i_9__0_n_0;
  wire [7:0]tmp_3_reg_1551;
  wire [15:0]NLW_q0_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q0_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPB_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_1_U/get_trig_vals_lutcud_rom_U/q0" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555000000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000015555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h021301B90167011E00DD00A40074004C002C0015000600000002000C001F003A),
    .INIT_01(256'h0C1F0B400A6A099C08D60818076206B50610057304DF045303CF035402E10276),
    .INIT_02(256'h1E561CF61B9F1A4F190817C81690156114391319120210F20FEB0EEC0DF50D06),
    .INIT_03(256'h386C369234BF32F3312F2F732DBE2C112A6B28CD273725A9242222A3212C1FBD),
    .INIT_04(256'h59F557A75560532050E74EB54C8A4A67484A46354427422040213E283C383A4E),
    .INIT_05(256'h82637FAB7CFA7A4F77AB750C72756FE46D596AD5685865E1637161085EA55C49),
    .INIT_06(256'hB10EADF8AAE8A7DDA4D8A1D89EDE9BEB98FC9614933290558D7F8AAF87E58521),
    .INIT_07(256'hE532E1CBDE68DB0AD7B1D45DD10ECDC3CA7EC73EC402C0CCBD9CBA70B74AB429),
    .INIT_08(256'h1DF61A4B16A413020F630BC70830049D010EFD84F9FDF67BF2FDEF84EC0FE89E),
    .INIT_09(256'h5A6B568D52B14ED84B03473043603F933BCA3803344030802CC4290B255621A4),
    .INIT_0A(256'h9995959391938D948998859D81A57DAE79BA75C871D86DEA69FF661662305E4C),
    .INIT_0B(256'hDA6CD657D243CE2FCA1DC60BC1FABDEAB9DCB5CEB1C2ADB7A9ADA5A5A19E9D99),
    .INIT_0C(256'h00000000000000000000000000000000000000000000EEDCEAC5E6AEE297DE81),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h2E1229FE25EA21D41DBE19A81591117A0D62094A0532011AFD02F8EAF4D3F0BB),
    .INIT_21(256'h6EC16AC066BF62BB5EB65AAF56A7529E4E934A864679426A3E5B3A4A36383226),
    .INIT_22(256'hAD9FA9C4A5E6A2059E229A3B965392688E7A8A8B869982A47EAE7AB676BB72BF),
    .INIT_23(256'hE9A7E601E257DEA9DAF7D742D38ACFCECC0EC84BC485C0BCBCEFB920B54DB178),
    .INIT_24(256'h21DE1E7C1B1517A9143910C50D4B09CE064C02C6FF3BFBADF81AF483F0E9ED4A),
    .INIT_25(256'h555852484F334C1848F745D242A63F763C41390635C632812F372BE82894253C),
    .INIT_26(256'h833D808D7DD67B187855758B72BB6FE66D0A6A2867406453615F5E665B675862),
    .INIT_27(256'hAACFA889A63BA3E7A18C9F2A9CC19A5297DC955F92DB90518DC18B2A888C85E8),
    .INIT_28(256'hCB67C994C7BAC5D9C3F0C200C008BE09BC03B9F6B7E1B5C5B3A2B178AF47AD0E),
    .INIT_29(256'hE47CE325E1C6E060DEF1DD7BDBFDDA77D8E9D753D5B6D411D265D0B1CEF5CD31),
    .INIT_2A(256'hF5A6F4D1F3F3F30DF21EF128F029EF23EE14ECFDEBDEEAB7E988E851E712E5CB),
    .INIT_2B(256'hFE9EFE4DFDF3FD92FD28FCB5FC3AFBB7FB2CFA98F9FCF958F8ABF7F6F739F674),
    .INIT_2C(256'h00000000000000000000000000000000000000000000FFB6FF8FFF5FFF27FEE7),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q0_reg
       (.ADDRARDADDR({1'b0,1'b0,q0_reg_i_1__0_n_0,q0_reg_i_2__0_n_0,q0_reg_i_3__0_n_0,q0_reg_i_4__0_n_0,q0_reg_i_5__0_n_0,q0_reg_i_6__0_n_0,q0_reg_i_7__0_n_0,q0_reg_i_8__0_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q0_reg_i_1__0_n_0,q0_reg_i_2__0_n_0,q0_reg_i_3__0_n_0,q0_reg_i_4__0_n_0,q0_reg_i_5__0_n_0,q0_reg_i_6__0_n_0,q0_reg_i_7__0_n_0,q0_reg_i_8__0_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q0_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q0_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q0_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q0_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_1_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_1_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_1_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_1_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair5" *)
  LUT3 #(
    .INIT(8'hE0))
    q0_reg_i_10__0
       (.I0(add_ln1353_2_reg_1534[4]),
        .I1(add_ln1353_2_reg_1534[3]),
        .I2(add_ln1353_2_reg_1534[5]),
        .O(q0_reg_i_10__0_n_0));
  LUT2 #(
    .INIT(4'hE))
    q0_reg_i_11__0
       (.I0(add_ln1353_2_reg_1534[7]),
        .I1(add_ln1353_2_reg_1534[6]),
        .O(q0_reg_i_11__0_n_0));
  LUT5 #(
    .INIT(32'hFFFEFEFE))
    q0_reg_i_12__0
       (.I0(add_ln1353_2_reg_1534[7]),
        .I1(add_ln1353_2_reg_1534[6]),
        .I2(add_ln1353_2_reg_1534[8]),
        .I3(add_ln1353_2_reg_1534[4]),
        .I4(add_ln1353_2_reg_1534[5]),
        .O(q0_reg_i_12__0_n_0));
  LUT5 #(
    .INIT(32'h88888880))
    q0_reg_i_13__0
       (.I0(add_ln1353_2_reg_1534[3]),
        .I1(add_ln1353_2_reg_1534[5]),
        .I2(add_ln1353_2_reg_1534[1]),
        .I3(add_ln1353_2_reg_1534[2]),
        .I4(add_ln1353_2_reg_1534[0]),
        .O(q0_reg_i_13__0_n_0));
  LUT6 #(
    .INIT(64'h7777777F88888880))
    q0_reg_i_1__0
       (.I0(add_ln1353_2_reg_1534[9]),
        .I1(q0_reg_i_9__0_n_0),
        .I2(q0_reg_i_10__0_n_0),
        .I3(add_ln1353_2_reg_1534[8]),
        .I4(q0_reg_i_11__0_n_0),
        .I5(add_ln1353_2_reg_1534[10]),
        .O(q0_reg_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h0001FFFFFFFE0000))
    q0_reg_i_2__0
       (.I0(add_ln1353_2_reg_1534[7]),
        .I1(add_ln1353_2_reg_1534[6]),
        .I2(add_ln1353_2_reg_1534[8]),
        .I3(q0_reg_i_10__0_n_0),
        .I4(q0_reg_i_9__0_n_0),
        .I5(add_ln1353_2_reg_1534[9]),
        .O(q0_reg_i_2__0_n_0));
  LUT6 #(
    .INIT(64'hEEEAFFFF11150000))
    q0_reg_i_3__0
       (.I0(q0_reg_i_11__0_n_0),
        .I1(add_ln1353_2_reg_1534[5]),
        .I2(add_ln1353_2_reg_1534[3]),
        .I3(add_ln1353_2_reg_1534[4]),
        .I4(q0_reg_i_9__0_n_0),
        .I5(add_ln1353_2_reg_1534[8]),
        .O(q0_reg_i_3__0_n_0));
  LUT6 #(
    .INIT(64'hA9A9A999AAAAAAAA))
    q0_reg_i_4__0
       (.I0(add_ln1353_2_reg_1534[7]),
        .I1(add_ln1353_2_reg_1534[6]),
        .I2(add_ln1353_2_reg_1534[5]),
        .I3(add_ln1353_2_reg_1534[3]),
        .I4(add_ln1353_2_reg_1534[4]),
        .I5(q0_reg_i_9__0_n_0),
        .O(q0_reg_i_4__0_n_0));
  LUT5 #(
    .INIT(32'h9995AAAA))
    q0_reg_i_5__0
       (.I0(add_ln1353_2_reg_1534[6]),
        .I1(add_ln1353_2_reg_1534[5]),
        .I2(add_ln1353_2_reg_1534[3]),
        .I3(add_ln1353_2_reg_1534[4]),
        .I4(q0_reg_i_9__0_n_0),
        .O(q0_reg_i_5__0_n_0));
  LUT4 #(
    .INIT(16'h57A8))
    q0_reg_i_6__0
       (.I0(q0_reg_i_9__0_n_0),
        .I1(add_ln1353_2_reg_1534[3]),
        .I2(add_ln1353_2_reg_1534[4]),
        .I3(add_ln1353_2_reg_1534[5]),
        .O(q0_reg_i_6__0_n_0));
  LUT3 #(
    .INIT(8'h9C))
    q0_reg_i_7__0
       (.I0(add_ln1353_2_reg_1534[3]),
        .I1(add_ln1353_2_reg_1534[4]),
        .I2(q0_reg_i_9__0_n_0),
        .O(q0_reg_i_7__0_n_0));
  LUT2 #(
    .INIT(4'h6))
    q0_reg_i_8__0
       (.I0(q0_reg_i_9__0_n_0),
        .I1(add_ln1353_2_reg_1534[3]),
        .O(q0_reg_i_8__0_n_0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    q0_reg_i_9__0
       (.I0(add_ln1353_2_reg_1534[12]),
        .I1(add_ln1353_2_reg_1534[11]),
        .I2(q0_reg_i_12__0_n_0),
        .I3(q0_reg_i_13__0_n_0),
        .I4(add_ln1353_2_reg_1534[9]),
        .I5(add_ln1353_2_reg_1534[10]),
        .O(q0_reg_i_9__0_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_1_U/get_trig_vals_lutcud_rom_U/q1" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555000000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000015555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h021301B90167011E00DD00A40074004C002C0015000600000002000C001F003A),
    .INIT_01(256'h0C1F0B400A6A099C08D60818076206B50610057304DF045303CF035402E10276),
    .INIT_02(256'h1E561CF61B9F1A4F190817C81690156114391319120210F20FEB0EEC0DF50D06),
    .INIT_03(256'h386C369234BF32F3312F2F732DBE2C112A6B28CD273725A9242222A3212C1FBD),
    .INIT_04(256'h59F557A75560532050E74EB54C8A4A67484A46354427422040213E283C383A4E),
    .INIT_05(256'h82637FAB7CFA7A4F77AB750C72756FE46D596AD5685865E1637161085EA55C49),
    .INIT_06(256'hB10EADF8AAE8A7DDA4D8A1D89EDE9BEB98FC9614933290558D7F8AAF87E58521),
    .INIT_07(256'hE532E1CBDE68DB0AD7B1D45DD10ECDC3CA7EC73EC402C0CCBD9CBA70B74AB429),
    .INIT_08(256'h1DF61A4B16A413020F630BC70830049D010EFD84F9FDF67BF2FDEF84EC0FE89E),
    .INIT_09(256'h5A6B568D52B14ED84B03473043603F933BCA3803344030802CC4290B255621A4),
    .INIT_0A(256'h9995959391938D948998859D81A57DAE79BA75C871D86DEA69FF661662305E4C),
    .INIT_0B(256'hDA6CD657D243CE2FCA1DC60BC1FABDEAB9DCB5CEB1C2ADB7A9ADA5A5A19E9D99),
    .INIT_0C(256'h00000000000000000000000000000000000000000000EEDCEAC5E6AEE297DE81),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h2E1229FE25EA21D41DBE19A81591117A0D62094A0532011AFD02F8EAF4D3F0BB),
    .INIT_21(256'h6EC16AC066BF62BB5EB65AAF56A7529E4E934A864679426A3E5B3A4A36383226),
    .INIT_22(256'hAD9FA9C4A5E6A2059E229A3B965392688E7A8A8B869982A47EAE7AB676BB72BF),
    .INIT_23(256'hE9A7E601E257DEA9DAF7D742D38ACFCECC0EC84BC485C0BCBCEFB920B54DB178),
    .INIT_24(256'h21DE1E7C1B1517A9143910C50D4B09CE064C02C6FF3BFBADF81AF483F0E9ED4A),
    .INIT_25(256'h555852484F334C1848F745D242A63F763C41390635C632812F372BE82894253C),
    .INIT_26(256'h833D808D7DD67B187855758B72BB6FE66D0A6A2867406453615F5E665B675862),
    .INIT_27(256'hAACFA889A63BA3E7A18C9F2A9CC19A5297DC955F92DB90518DC18B2A888C85E8),
    .INIT_28(256'hCB67C994C7BAC5D9C3F0C200C008BE09BC03B9F6B7E1B5C5B3A2B178AF47AD0E),
    .INIT_29(256'hE47CE325E1C6E060DEF1DD7BDBFDDA77D8E9D753D5B6D411D265D0B1CEF5CD31),
    .INIT_2A(256'hF5A6F4D1F3F3F30DF21EF128F029EF23EE14ECFDEBDEEAB7E988E851E712E5CB),
    .INIT_2B(256'hFE9EFE4DFDF3FD92FD28FCB5FC3AFBB7FB2CFA98F9FCF958F8ABF7F6F739F674),
    .INIT_2C(256'h00000000000000000000000000000000000000000000FFB6FF8FFF5FFF27FEE7),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q1_reg
       (.ADDRARDADDR({1'b0,1'b0,q1_reg_i_1__0_n_0,q1_reg_i_2__0_n_0,q1_reg_i_3__0_n_0,q1_reg_i_4__0_n_0,q1_reg_i_5__0_n_0,q1_reg_i_6__0_n_0,q1_reg_i_7__0_n_0,q1_reg_i_8__0_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q1_reg_i_1__0_n_0,q1_reg_i_2__0_n_0,q1_reg_i_3__0_n_0,q1_reg_i_4__0_n_0,q1_reg_i_5__0_n_0,q1_reg_i_6__0_n_0,q1_reg_i_7__0_n_0,q1_reg_i_8__0_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q1_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q1_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q1_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q1_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_9_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_9_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_9_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_9_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h03FFAAAAFC00AAAA))
    q1_reg_i_1__0
       (.I0(tmp_3_reg_1551[7]),
        .I1(add_ln1353_2_reg_1534[8]),
        .I2(q1_reg_i_9__0_n_0),
        .I3(add_ln1353_2_reg_1534[9]),
        .I4(icmp_ln895_9_reg_1546),
        .I5(add_ln1353_2_reg_1534[10]),
        .O(q1_reg_i_1__0_n_0));
  LUT5 #(
    .INIT(32'h03AAFCAA))
    q1_reg_i_2__0
       (.I0(tmp_3_reg_1551[6]),
        .I1(q1_reg_i_9__0_n_0),
        .I2(add_ln1353_2_reg_1534[8]),
        .I3(icmp_ln895_9_reg_1546),
        .I4(add_ln1353_2_reg_1534[9]),
        .O(q1_reg_i_2__0_n_0));
  LUT6 #(
    .INIT(64'hFFFCAAAA0003AAAA))
    q1_reg_i_3__0
       (.I0(tmp_3_reg_1551[5]),
        .I1(add_ln1353_2_reg_1534[6]),
        .I2(add_ln1353_2_reg_1534[7]),
        .I3(add_ln1353_2_reg_1534[5]),
        .I4(icmp_ln895_9_reg_1546),
        .I5(add_ln1353_2_reg_1534[8]),
        .O(q1_reg_i_3__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *)
  LUT5 #(
    .INIT(32'hF0C3AAAA))
    q1_reg_i_4__0
       (.I0(tmp_3_reg_1551[4]),
        .I1(add_ln1353_2_reg_1534[6]),
        .I2(add_ln1353_2_reg_1534[7]),
        .I3(add_ln1353_2_reg_1534[5]),
        .I4(icmp_ln895_9_reg_1546),
        .O(q1_reg_i_4__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *)
  LUT4 #(
    .INIT(16'hE22E))
    q1_reg_i_5__0
       (.I0(tmp_3_reg_1551[3]),
        .I1(icmp_ln895_9_reg_1546),
        .I2(add_ln1353_2_reg_1534[5]),
        .I3(add_ln1353_2_reg_1534[6]),
        .O(q1_reg_i_5__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *)
  LUT3 #(
    .INIT(8'h74))
    q1_reg_i_6__0
       (.I0(add_ln1353_2_reg_1534[5]),
        .I1(icmp_ln895_9_reg_1546),
        .I2(tmp_3_reg_1551[2]),
        .O(q1_reg_i_6__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *)
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_7__0
       (.I0(add_ln1353_2_reg_1534[4]),
        .I1(icmp_ln895_9_reg_1546),
        .I2(tmp_3_reg_1551[1]),
        .O(q1_reg_i_7__0_n_0));
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_8__0
       (.I0(add_ln1353_2_reg_1534[3]),
        .I1(icmp_ln895_9_reg_1546),
        .I2(tmp_3_reg_1551[0]),
        .O(q1_reg_i_8__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *)
  LUT3 #(
    .INIT(8'hFE))
    q1_reg_i_9__0
       (.I0(add_ln1353_2_reg_1534[6]),
        .I1(add_ln1353_2_reg_1534[7]),
        .I2(add_ln1353_2_reg_1534[5]),
        .O(q1_reg_i_9__0_n_0));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_lutdEe" *)
module hls_get_trig_vals_get_trig_vals_lutdEe
   (hw_trig_vals_2_V,
    hw_trig_vals_10_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_4_reg_1556,
    tmp_5_reg_1573,
    icmp_ln895_10_reg_1568,
    add_ln1353_reg_1512);
  output [35:0]hw_trig_vals_2_V;
  output [35:0]hw_trig_vals_10_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [11:0]add_ln1353_4_reg_1556;
  input [7:0]tmp_5_reg_1573;
  input icmp_ln895_10_reg_1568;
  input [0:0]add_ln1353_reg_1512;

  wire [11:0]add_ln1353_4_reg_1556;
  wire [0:0]add_ln1353_reg_1512;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_10_V;
  wire [35:0]hw_trig_vals_2_V;
  wire icmp_ln895_10_reg_1568;
  wire [7:0]tmp_5_reg_1573;

  hls_get_trig_vals_get_trig_vals_lutdEe_rom get_trig_vals_lutdEe_rom_U
       (.add_ln1353_4_reg_1556(add_ln1353_4_reg_1556),
        .add_ln1353_reg_1512(add_ln1353_reg_1512),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ce1),
        .hw_trig_vals_10_V(hw_trig_vals_10_V),
        .hw_trig_vals_2_V(hw_trig_vals_2_V),
        .icmp_ln895_10_reg_1568(icmp_ln895_10_reg_1568),
        .tmp_5_reg_1573(tmp_5_reg_1573));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_lutdEe_rom" *)
module hls_get_trig_vals_get_trig_vals_lutdEe_rom
   (hw_trig_vals_2_V,
    hw_trig_vals_10_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_4_reg_1556,
    tmp_5_reg_1573,
    icmp_ln895_10_reg_1568,
    add_ln1353_reg_1512);
  output [35:0]hw_trig_vals_2_V;
  output [35:0]hw_trig_vals_10_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [11:0]add_ln1353_4_reg_1556;
  input [7:0]tmp_5_reg_1573;
  input icmp_ln895_10_reg_1568;
  input [0:0]add_ln1353_reg_1512;

  wire [11:0]add_ln1353_4_reg_1556;
  wire [0:0]add_ln1353_reg_1512;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_10_V;
  wire [35:0]hw_trig_vals_2_V;
  wire icmp_ln895_10_reg_1568;
  wire q0_reg_i_10__1_n_0;
  wire q0_reg_i_11__1_n_0;
  wire q0_reg_i_12__1_n_0;
  wire q0_reg_i_13__1_n_0;
  wire q0_reg_i_1__1_n_0;
  wire q0_reg_i_2__1_n_0;
  wire q0_reg_i_3__1_n_0;
  wire q0_reg_i_4__1_n_0;
  wire q0_reg_i_5__1_n_0;
  wire q0_reg_i_6__1_n_0;
  wire q0_reg_i_7__1_n_0;
  wire q0_reg_i_8__1_n_0;
  wire q0_reg_i_9__1_n_0;
  wire q1_reg_i_1__1_n_0;
  wire q1_reg_i_2__1_n_0;
  wire q1_reg_i_3__1_n_0;
  wire q1_reg_i_4__1_n_0;
  wire q1_reg_i_5__1_n_0;
  wire q1_reg_i_6__1_n_0;
  wire q1_reg_i_7__1_n_0;
  wire q1_reg_i_8__1_n_0;
  wire q1_reg_i_9__1_n_0;
  wire [7:0]tmp_5_reg_1573;
  wire [15:0]NLW_q0_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q0_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPB_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_2_U/get_trig_vals_lutdEe_rom_U/q0" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555000000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000015555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h021F01C40171012700E500AB0079005000300018000800000001000A001C0036),
    .INIT_01(256'h0C3B0B5C0A8409B508EE082F077906CA0624058704F1046403DF036302EF0283),
    .INIT_02(256'h1E821D221BC91A79193017EF16B71586145D133D12241114100B0F0B0E130D23),
    .INIT_03(256'h38A836CD34F9332C31672FAA2DF42C462A9F2901276A25DA245322D3215B1FEB),
    .INIT_04(256'h5A3F57F055A85368512E4EFB4CCF4AAB488D46774468426140603E673C753A8B),
    .INIT_05(256'h82BA80027D507AA477FF756072C770356DAA6B2568A7662F63BE61545EF15C94),
    .INIT_06(256'hB171AE5AAB49A83EA538A2389F3D9C49995A9671938E90B18DDA8B09883E8579),
    .INIT_07(256'hE59FE237DED4DB76D81CD4C7D177CE2CCAE6C7A5C46AC133BE01BAD5B7AEB48D),
    .INIT_08(256'h1E6B1AC0171913760FD60C3B08A305100180FDF5FA6EF6EBF36DEFF3EC7DE90C),
    .INIT_09(256'h5AE75708532C4F534B7D47AA43DA400D3C43387C34B830F82D3B298225CC221A),
    .INIT_0A(256'h9A15961392138E148A17861D82247E2D7A38764672556E686A7C669362AC5EC8),
    .INIT_0B(256'hDAEED6D9D2C5CEB2CA9FC68DC27CBE6CBA5DB650B243AE38AA2EA626A21F9E19),
    .INIT_0C(256'h00000000000000000000000000000000000000000000EF5FEB47E730E31ADF04),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h2E952A81266C22571E411A2A161411FC0DE509CD05B5019DFD85F96DF556F13E),
    .INIT_21(256'h6F406B41673F633C5F375B305728531F4F144B0846FB42EC3EDD3ACC36BB32A8),
    .INIT_22(256'hAE1AAA3FA662A2819E9E9AB896D092E58EF88B09871783237F2D7B35773B733E),
    .INIT_23(256'hEA1CE676E2CCDF1FDB6ED7B9D401D045CC86C8C4C4FEC135BD69B99AB5C8B1F3),
    .INIT_24(256'h224A1EE81B82181714A711330DBB0A3E06BD0337FFADFC1FF88DF4F7F15CEDBE),
    .INIT_25(256'h55B952AA4F964C7B495C4637430C3FDC3CA7396D362E32EA2FA02C5228FF25A7),
    .INIT_26(256'h839380E37E2D7B7078AE75E5731670416D666A85679D64B161BE5EC55BC758C3),
    .INIT_27(256'hAB17A8D2A685A432A1D89F779D0F9AA0982B95AF932C90A38E138B7D88E0863D),
    .INIT_28(256'hCBA0C9CFC7F6C615C42EC23EC048BE4ABC44BA38B824B609B3E7B1BEAF8DAD56),
    .INIT_29(256'hE4A6E350E1F3E08DDF1FDDAADC2DDAA8D91BD787D5EAD446D29BD0E8CF2DCD6A),
    .INIT_2A(256'hF5C1F4ECF40FF32AF23DF147F04AEF44EE36ED20EC02EADCE9AEE878E73AE5F4),
    .INIT_2B(256'hFEA8FE58FDFFFD9EFD35FCC4FC4AFBC8FB3EFAABFA10F96DF8C1F80DF751F68D),
    .INIT_2C(256'h00000000000000000000000000000000000000000000FFBAFF94FF66FF2FFEEF),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q0_reg
       (.ADDRARDADDR({1'b0,1'b0,q0_reg_i_1__1_n_0,q0_reg_i_2__1_n_0,q0_reg_i_3__1_n_0,q0_reg_i_4__1_n_0,q0_reg_i_5__1_n_0,q0_reg_i_6__1_n_0,q0_reg_i_7__1_n_0,q0_reg_i_8__1_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q0_reg_i_1__1_n_0,q0_reg_i_2__1_n_0,q0_reg_i_3__1_n_0,q0_reg_i_4__1_n_0,q0_reg_i_5__1_n_0,q0_reg_i_6__1_n_0,q0_reg_i_7__1_n_0,q0_reg_i_8__1_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q0_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q0_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q0_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q0_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_2_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_2_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_2_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_2_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair8" *)
  LUT3 #(
    .INIT(8'hE0))
    q0_reg_i_10__1
       (.I0(add_ln1353_4_reg_1556[3]),
        .I1(add_ln1353_4_reg_1556[2]),
        .I2(add_ln1353_4_reg_1556[4]),
        .O(q0_reg_i_10__1_n_0));
  LUT2 #(
    .INIT(4'hE))
    q0_reg_i_11__1
       (.I0(add_ln1353_4_reg_1556[6]),
        .I1(add_ln1353_4_reg_1556[5]),
        .O(q0_reg_i_11__1_n_0));
  LUT5 #(
    .INIT(32'hFFFEFEFE))
    q0_reg_i_12__1
       (.I0(add_ln1353_4_reg_1556[6]),
        .I1(add_ln1353_4_reg_1556[5]),
        .I2(add_ln1353_4_reg_1556[7]),
        .I3(add_ln1353_4_reg_1556[3]),
        .I4(add_ln1353_4_reg_1556[4]),
        .O(q0_reg_i_12__1_n_0));
  LUT5 #(
    .INIT(32'h88888880))
    q0_reg_i_13__1
       (.I0(add_ln1353_4_reg_1556[2]),
        .I1(add_ln1353_4_reg_1556[4]),
        .I2(add_ln1353_4_reg_1556[0]),
        .I3(add_ln1353_4_reg_1556[1]),
        .I4(add_ln1353_reg_1512),
        .O(q0_reg_i_13__1_n_0));
  LUT6 #(
    .INIT(64'h7777777F88888880))
    q0_reg_i_1__1
       (.I0(add_ln1353_4_reg_1556[8]),
        .I1(q0_reg_i_9__1_n_0),
        .I2(q0_reg_i_10__1_n_0),
        .I3(add_ln1353_4_reg_1556[7]),
        .I4(q0_reg_i_11__1_n_0),
        .I5(add_ln1353_4_reg_1556[9]),
        .O(q0_reg_i_1__1_n_0));
  LUT6 #(
    .INIT(64'h0001FFFFFFFE0000))
    q0_reg_i_2__1
       (.I0(add_ln1353_4_reg_1556[6]),
        .I1(add_ln1353_4_reg_1556[5]),
        .I2(add_ln1353_4_reg_1556[7]),
        .I3(q0_reg_i_10__1_n_0),
        .I4(q0_reg_i_9__1_n_0),
        .I5(add_ln1353_4_reg_1556[8]),
        .O(q0_reg_i_2__1_n_0));
  LUT6 #(
    .INIT(64'hEEEAFFFF11150000))
    q0_reg_i_3__1
       (.I0(q0_reg_i_11__1_n_0),
        .I1(add_ln1353_4_reg_1556[4]),
        .I2(add_ln1353_4_reg_1556[2]),
        .I3(add_ln1353_4_reg_1556[3]),
        .I4(q0_reg_i_9__1_n_0),
        .I5(add_ln1353_4_reg_1556[7]),
        .O(q0_reg_i_3__1_n_0));
  LUT6 #(
    .INIT(64'hA9A9A999AAAAAAAA))
    q0_reg_i_4__1
       (.I0(add_ln1353_4_reg_1556[6]),
        .I1(add_ln1353_4_reg_1556[5]),
        .I2(add_ln1353_4_reg_1556[4]),
        .I3(add_ln1353_4_reg_1556[2]),
        .I4(add_ln1353_4_reg_1556[3]),
        .I5(q0_reg_i_9__1_n_0),
        .O(q0_reg_i_4__1_n_0));
  LUT5 #(
    .INIT(32'h9995AAAA))
    q0_reg_i_5__1
       (.I0(add_ln1353_4_reg_1556[5]),
        .I1(add_ln1353_4_reg_1556[4]),
        .I2(add_ln1353_4_reg_1556[2]),
        .I3(add_ln1353_4_reg_1556[3]),
        .I4(q0_reg_i_9__1_n_0),
        .O(q0_reg_i_5__1_n_0));
  LUT4 #(
    .INIT(16'h57A8))
    q0_reg_i_6__1
       (.I0(q0_reg_i_9__1_n_0),
        .I1(add_ln1353_4_reg_1556[2]),
        .I2(add_ln1353_4_reg_1556[3]),
        .I3(add_ln1353_4_reg_1556[4]),
        .O(q0_reg_i_6__1_n_0));
  LUT3 #(
    .INIT(8'h9C))
    q0_reg_i_7__1
       (.I0(add_ln1353_4_reg_1556[2]),
        .I1(add_ln1353_4_reg_1556[3]),
        .I2(q0_reg_i_9__1_n_0),
        .O(q0_reg_i_7__1_n_0));
  LUT2 #(
    .INIT(4'h6))
    q0_reg_i_8__1
       (.I0(q0_reg_i_9__1_n_0),
        .I1(add_ln1353_4_reg_1556[2]),
        .O(q0_reg_i_8__1_n_0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    q0_reg_i_9__1
       (.I0(add_ln1353_4_reg_1556[11]),
        .I1(add_ln1353_4_reg_1556[10]),
        .I2(q0_reg_i_12__1_n_0),
        .I3(q0_reg_i_13__1_n_0),
        .I4(add_ln1353_4_reg_1556[8]),
        .I5(add_ln1353_4_reg_1556[9]),
        .O(q0_reg_i_9__1_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_2_U/get_trig_vals_lutdEe_rom_U/q1" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555000000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000015555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h021F01C40171012700E500AB0079005000300018000800000001000A001C0036),
    .INIT_01(256'h0C3B0B5C0A8409B508EE082F077906CA0624058704F1046403DF036302EF0283),
    .INIT_02(256'h1E821D221BC91A79193017EF16B71586145D133D12241114100B0F0B0E130D23),
    .INIT_03(256'h38A836CD34F9332C31672FAA2DF42C462A9F2901276A25DA245322D3215B1FEB),
    .INIT_04(256'h5A3F57F055A85368512E4EFB4CCF4AAB488D46774468426140603E673C753A8B),
    .INIT_05(256'h82BA80027D507AA477FF756072C770356DAA6B2568A7662F63BE61545EF15C94),
    .INIT_06(256'hB171AE5AAB49A83EA538A2389F3D9C49995A9671938E90B18DDA8B09883E8579),
    .INIT_07(256'hE59FE237DED4DB76D81CD4C7D177CE2CCAE6C7A5C46AC133BE01BAD5B7AEB48D),
    .INIT_08(256'h1E6B1AC0171913760FD60C3B08A305100180FDF5FA6EF6EBF36DEFF3EC7DE90C),
    .INIT_09(256'h5AE75708532C4F534B7D47AA43DA400D3C43387C34B830F82D3B298225CC221A),
    .INIT_0A(256'h9A15961392138E148A17861D82247E2D7A38764672556E686A7C669362AC5EC8),
    .INIT_0B(256'hDAEED6D9D2C5CEB2CA9FC68DC27CBE6CBA5DB650B243AE38AA2EA626A21F9E19),
    .INIT_0C(256'h00000000000000000000000000000000000000000000EF5FEB47E730E31ADF04),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h2E952A81266C22571E411A2A161411FC0DE509CD05B5019DFD85F96DF556F13E),
    .INIT_21(256'h6F406B41673F633C5F375B305728531F4F144B0846FB42EC3EDD3ACC36BB32A8),
    .INIT_22(256'hAE1AAA3FA662A2819E9E9AB896D092E58EF88B09871783237F2D7B35773B733E),
    .INIT_23(256'hEA1CE676E2CCDF1FDB6ED7B9D401D045CC86C8C4C4FEC135BD69B99AB5C8B1F3),
    .INIT_24(256'h224A1EE81B82181714A711330DBB0A3E06BD0337FFADFC1FF88DF4F7F15CEDBE),
    .INIT_25(256'h55B952AA4F964C7B495C4637430C3FDC3CA7396D362E32EA2FA02C5228FF25A7),
    .INIT_26(256'h839380E37E2D7B7078AE75E5731670416D666A85679D64B161BE5EC55BC758C3),
    .INIT_27(256'hAB17A8D2A685A432A1D89F779D0F9AA0982B95AF932C90A38E138B7D88E0863D),
    .INIT_28(256'hCBA0C9CFC7F6C615C42EC23EC048BE4ABC44BA38B824B609B3E7B1BEAF8DAD56),
    .INIT_29(256'hE4A6E350E1F3E08DDF1FDDAADC2DDAA8D91BD787D5EAD446D29BD0E8CF2DCD6A),
    .INIT_2A(256'hF5C1F4ECF40FF32AF23DF147F04AEF44EE36ED20EC02EADCE9AEE878E73AE5F4),
    .INIT_2B(256'hFEA8FE58FDFFFD9EFD35FCC4FC4AFBC8FB3EFAABFA10F96DF8C1F80DF751F68D),
    .INIT_2C(256'h00000000000000000000000000000000000000000000FFBAFF94FF66FF2FFEEF),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q1_reg
       (.ADDRARDADDR({1'b0,1'b0,q1_reg_i_1__1_n_0,q1_reg_i_2__1_n_0,q1_reg_i_3__1_n_0,q1_reg_i_4__1_n_0,q1_reg_i_5__1_n_0,q1_reg_i_6__1_n_0,q1_reg_i_7__1_n_0,q1_reg_i_8__1_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q1_reg_i_1__1_n_0,q1_reg_i_2__1_n_0,q1_reg_i_3__1_n_0,q1_reg_i_4__1_n_0,q1_reg_i_5__1_n_0,q1_reg_i_6__1_n_0,q1_reg_i_7__1_n_0,q1_reg_i_8__1_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q1_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q1_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q1_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q1_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_10_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_10_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_10_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_10_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h03FFAAAAFC00AAAA))
    q1_reg_i_1__1
       (.I0(tmp_5_reg_1573[7]),
        .I1(add_ln1353_4_reg_1556[7]),
        .I2(q1_reg_i_9__1_n_0),
        .I3(add_ln1353_4_reg_1556[8]),
        .I4(icmp_ln895_10_reg_1568),
        .I5(add_ln1353_4_reg_1556[9]),
        .O(q1_reg_i_1__1_n_0));
  LUT5 #(
    .INIT(32'h03AAFCAA))
    q1_reg_i_2__1
       (.I0(tmp_5_reg_1573[6]),
        .I1(q1_reg_i_9__1_n_0),
        .I2(add_ln1353_4_reg_1556[7]),
        .I3(icmp_ln895_10_reg_1568),
        .I4(add_ln1353_4_reg_1556[8]),
        .O(q1_reg_i_2__1_n_0));
  LUT6 #(
    .INIT(64'hFFFCAAAA0003AAAA))
    q1_reg_i_3__1
       (.I0(tmp_5_reg_1573[5]),
        .I1(add_ln1353_4_reg_1556[5]),
        .I2(add_ln1353_4_reg_1556[6]),
        .I3(add_ln1353_4_reg_1556[4]),
        .I4(icmp_ln895_10_reg_1568),
        .I5(add_ln1353_4_reg_1556[7]),
        .O(q1_reg_i_3__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *)
  LUT5 #(
    .INIT(32'hF0C3AAAA))
    q1_reg_i_4__1
       (.I0(tmp_5_reg_1573[4]),
        .I1(add_ln1353_4_reg_1556[5]),
        .I2(add_ln1353_4_reg_1556[6]),
        .I3(add_ln1353_4_reg_1556[4]),
        .I4(icmp_ln895_10_reg_1568),
        .O(q1_reg_i_4__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *)
  LUT4 #(
    .INIT(16'hE22E))
    q1_reg_i_5__1
       (.I0(tmp_5_reg_1573[3]),
        .I1(icmp_ln895_10_reg_1568),
        .I2(add_ln1353_4_reg_1556[4]),
        .I3(add_ln1353_4_reg_1556[5]),
        .O(q1_reg_i_5__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *)
  LUT3 #(
    .INIT(8'h74))
    q1_reg_i_6__1
       (.I0(add_ln1353_4_reg_1556[4]),
        .I1(icmp_ln895_10_reg_1568),
        .I2(tmp_5_reg_1573[2]),
        .O(q1_reg_i_6__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *)
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_7__1
       (.I0(add_ln1353_4_reg_1556[3]),
        .I1(icmp_ln895_10_reg_1568),
        .I2(tmp_5_reg_1573[1]),
        .O(q1_reg_i_7__1_n_0));
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_8__1
       (.I0(add_ln1353_4_reg_1556[2]),
        .I1(icmp_ln895_10_reg_1568),
        .I2(tmp_5_reg_1573[0]),
        .O(q1_reg_i_8__1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *)
  LUT3 #(
    .INIT(8'hFE))
    q1_reg_i_9__1
       (.I0(add_ln1353_4_reg_1556[5]),
        .I1(add_ln1353_4_reg_1556[6]),
        .I2(add_ln1353_4_reg_1556[4]),
        .O(q1_reg_i_9__1_n_0));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_luteOg" *)
module hls_get_trig_vals_get_trig_vals_luteOg
   (hw_trig_vals_3_V,
    hw_trig_vals_11_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_6_reg_1578,
    tmp_7_reg_1595,
    icmp_ln895_11_reg_1590,
    add_ln1353_2_reg_1534);
  output [35:0]hw_trig_vals_3_V;
  output [35:0]hw_trig_vals_11_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [11:0]add_ln1353_6_reg_1578;
  input [7:0]tmp_7_reg_1595;
  input icmp_ln895_11_reg_1590;
  input [0:0]add_ln1353_2_reg_1534;

  wire [0:0]add_ln1353_2_reg_1534;
  wire [11:0]add_ln1353_6_reg_1578;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_11_V;
  wire [35:0]hw_trig_vals_3_V;
  wire icmp_ln895_11_reg_1590;
  wire [7:0]tmp_7_reg_1595;

  hls_get_trig_vals_get_trig_vals_luteOg_rom get_trig_vals_luteOg_rom_U
       (.add_ln1353_2_reg_1534(add_ln1353_2_reg_1534),
        .add_ln1353_6_reg_1578(add_ln1353_6_reg_1578),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ce1),
        .hw_trig_vals_11_V(hw_trig_vals_11_V),
        .hw_trig_vals_3_V(hw_trig_vals_3_V),
        .icmp_ln895_11_reg_1590(icmp_ln895_11_reg_1590),
        .tmp_7_reg_1595(tmp_7_reg_1595));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_luteOg_rom" *)
module hls_get_trig_vals_get_trig_vals_luteOg_rom
   (hw_trig_vals_3_V,
    hw_trig_vals_11_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_6_reg_1578,
    tmp_7_reg_1595,
    icmp_ln895_11_reg_1590,
    add_ln1353_2_reg_1534);
  output [35:0]hw_trig_vals_3_V;
  output [35:0]hw_trig_vals_11_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [11:0]add_ln1353_6_reg_1578;
  input [7:0]tmp_7_reg_1595;
  input icmp_ln895_11_reg_1590;
  input [0:0]add_ln1353_2_reg_1534;

  wire [0:0]add_ln1353_2_reg_1534;
  wire [11:0]add_ln1353_6_reg_1578;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_11_V;
  wire [35:0]hw_trig_vals_3_V;
  wire icmp_ln895_11_reg_1590;
  wire q0_reg_i_10__2_n_0;
  wire q0_reg_i_11__2_n_0;
  wire q0_reg_i_12__2_n_0;
  wire q0_reg_i_13__2_n_0;
  wire q0_reg_i_1__2_n_0;
  wire q0_reg_i_2__2_n_0;
  wire q0_reg_i_3__2_n_0;
  wire q0_reg_i_4__2_n_0;
  wire q0_reg_i_5__2_n_0;
  wire q0_reg_i_6__2_n_0;
  wire q0_reg_i_7__2_n_0;
  wire q0_reg_i_8__2_n_0;
  wire q0_reg_i_9__2_n_0;
  wire q1_reg_i_1__2_n_0;
  wire q1_reg_i_2__2_n_0;
  wire q1_reg_i_3__2_n_0;
  wire q1_reg_i_4__2_n_0;
  wire q1_reg_i_5__2_n_0;
  wire q1_reg_i_6__2_n_0;
  wire q1_reg_i_7__2_n_0;
  wire q1_reg_i_8__2_n_0;
  wire q1_reg_i_9__2_n_0;
  wire [7:0]tmp_7_reg_1595;
  wire [15:0]NLW_q0_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q0_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPB_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_3_U/get_trig_vals_luteOg_rom_U/q0" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555400000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000005555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h022B01CF017B013000EC00B2007F00550033001A000900010000000900190032),
    .INIT_01(256'h0C580B770A9F09CE09060847078F06E00639059A0503047503EF037202FD0290),
    .INIT_02(256'h1EAF1D4E1BF41AA21959181716DD15AC1482136012471135102C0F2B0E320D41),
    .INIT_03(256'h38E4370835333365319F2FE12E2A2C7B2AD42934279C260C2483230221892018),
    .INIT_04(256'h5A89583A55F153AF51754F414D144AEF48D146BA44AA42A140A03EA63CB33AC8),
    .INIT_05(256'h831280597DA67AF9785375B3731A70876DFB6B7568F6667E640C61A15F3D5CE0),
    .INIT_06(256'hB1D4AEBDABABA89FA598A2989F9C9CA799B796CE93EA910C8E348B62889785D1),
    .INIT_07(256'hE60DE2A4DF40DBE1D887D532D1E1CE95CB4FC80DC4D1C199BE67BB3BB813B4F1),
    .INIT_08(256'h1EE11B35178E13EA104A0CAE0916058201F2FE66FADEF75BF3DCF062ECEBE97A),
    .INIT_09(256'h5B63578453A84FCE4BF84824445440863CBC38F5353131702DB329F926432290),
    .INIT_0A(256'h9A96969392938E948A97869C82A37EAC7AB776C472D36EE56AF9671063295F45),
    .INIT_0B(256'hDB71D75CD348CF34CB21C70FC2FEBEEEBADFB6D1B2C5AEB9AAAFA6A7A2A09E9A),
    .INIT_0C(256'h000000000000000000000000000000000000000000000000EBCAE7B3E39DDF87),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h2F172B0326EF22DA1EC41AAD1697127F0E680A5006380220FE08F9F0F5D9F1C1),
    .INIT_21(256'h6FC06BC167BF63BC5FB75BB157A953A04F954B8A477C436E3F5F3B4E373D332B),
    .INIT_22(256'hAE96AABBA6DEA2FD9F1B9B35974D93638F768B87879583A27FAC7BB477BA73BE),
    .INIT_23(256'hEA90E6EBE342DF95DBE4D830D478D0BDCCFEC93CC577C1AEBDE3BA14B642B26D),
    .INIT_24(256'h22B61F551BEF1885151611A20E2A0AAE072D03A8001EFC91F8FFF56AF1D0EE32),
    .INIT_25(256'h561B530C4FF84CDF49C0469B437240433D0E39D536963353300A2CBC296A2612),
    .INIT_26(256'h83E9813A7E847BC87906763E7370709C6DC16AE167FB650F621C5F255C275924),
    .INIT_27(256'hAB5FA91BA6CFA47DA2239FC39D5C9AEE987A95FF937D90F48E658BD089348692),
    .INIT_28(256'hCBDACA09C831C652C46BC27DC087BE8ABC85BA7AB867B64DB42CB203AFD4AD9D),
    .INIT_29(256'hE4D1E37CE21FE0BADF4EDDD9DC5DDAD9D94DD7B9D61ED47BD2D1D11ECF64CDA3),
    .INIT_2A(256'hF5DBF507F42BF347F25BF166F06AEF65EE58ED44EC27EB02E9D5E8A0E763E61E),
    .INIT_2B(256'hFEB1FE62FE0BFDABFD43FCD2FC5AFBD9FB4FFABEFA24F982F8D7F824F769F6A6),
    .INIT_2C(256'h000000000000000000000000000000000000000000000000FF99FF6CFF36FEF8),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q0_reg
       (.ADDRARDADDR({1'b0,1'b0,q0_reg_i_1__2_n_0,q0_reg_i_2__2_n_0,q0_reg_i_3__2_n_0,q0_reg_i_4__2_n_0,q0_reg_i_5__2_n_0,q0_reg_i_6__2_n_0,q0_reg_i_7__2_n_0,q0_reg_i_8__2_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q0_reg_i_1__2_n_0,q0_reg_i_2__2_n_0,q0_reg_i_3__2_n_0,q0_reg_i_4__2_n_0,q0_reg_i_5__2_n_0,q0_reg_i_6__2_n_0,q0_reg_i_7__2_n_0,q0_reg_i_8__2_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q0_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q0_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q0_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q0_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_3_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_3_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_3_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_3_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair11" *)
  LUT3 #(
    .INIT(8'hE0))
    q0_reg_i_10__2
       (.I0(add_ln1353_6_reg_1578[3]),
        .I1(add_ln1353_6_reg_1578[2]),
        .I2(add_ln1353_6_reg_1578[4]),
        .O(q0_reg_i_10__2_n_0));
  LUT2 #(
    .INIT(4'hE))
    q0_reg_i_11__2
       (.I0(add_ln1353_6_reg_1578[6]),
        .I1(add_ln1353_6_reg_1578[5]),
        .O(q0_reg_i_11__2_n_0));
  LUT5 #(
    .INIT(32'hFFFEFEFE))
    q0_reg_i_12__2
       (.I0(add_ln1353_6_reg_1578[6]),
        .I1(add_ln1353_6_reg_1578[5]),
        .I2(add_ln1353_6_reg_1578[7]),
        .I3(add_ln1353_6_reg_1578[3]),
        .I4(add_ln1353_6_reg_1578[4]),
        .O(q0_reg_i_12__2_n_0));
  LUT5 #(
    .INIT(32'h88888880))
    q0_reg_i_13__2
       (.I0(add_ln1353_6_reg_1578[2]),
        .I1(add_ln1353_6_reg_1578[4]),
        .I2(add_ln1353_6_reg_1578[0]),
        .I3(add_ln1353_6_reg_1578[1]),
        .I4(add_ln1353_2_reg_1534),
        .O(q0_reg_i_13__2_n_0));
  LUT6 #(
    .INIT(64'h7777777F88888880))
    q0_reg_i_1__2
       (.I0(add_ln1353_6_reg_1578[8]),
        .I1(q0_reg_i_9__2_n_0),
        .I2(q0_reg_i_10__2_n_0),
        .I3(add_ln1353_6_reg_1578[7]),
        .I4(q0_reg_i_11__2_n_0),
        .I5(add_ln1353_6_reg_1578[9]),
        .O(q0_reg_i_1__2_n_0));
  LUT6 #(
    .INIT(64'h0001FFFFFFFE0000))
    q0_reg_i_2__2
       (.I0(add_ln1353_6_reg_1578[6]),
        .I1(add_ln1353_6_reg_1578[5]),
        .I2(add_ln1353_6_reg_1578[7]),
        .I3(q0_reg_i_10__2_n_0),
        .I4(q0_reg_i_9__2_n_0),
        .I5(add_ln1353_6_reg_1578[8]),
        .O(q0_reg_i_2__2_n_0));
  LUT6 #(
    .INIT(64'hEEEAFFFF11150000))
    q0_reg_i_3__2
       (.I0(q0_reg_i_11__2_n_0),
        .I1(add_ln1353_6_reg_1578[4]),
        .I2(add_ln1353_6_reg_1578[2]),
        .I3(add_ln1353_6_reg_1578[3]),
        .I4(q0_reg_i_9__2_n_0),
        .I5(add_ln1353_6_reg_1578[7]),
        .O(q0_reg_i_3__2_n_0));
  LUT6 #(
    .INIT(64'hA9A9A999AAAAAAAA))
    q0_reg_i_4__2
       (.I0(add_ln1353_6_reg_1578[6]),
        .I1(add_ln1353_6_reg_1578[5]),
        .I2(add_ln1353_6_reg_1578[4]),
        .I3(add_ln1353_6_reg_1578[2]),
        .I4(add_ln1353_6_reg_1578[3]),
        .I5(q0_reg_i_9__2_n_0),
        .O(q0_reg_i_4__2_n_0));
  LUT5 #(
    .INIT(32'h9995AAAA))
    q0_reg_i_5__2
       (.I0(add_ln1353_6_reg_1578[5]),
        .I1(add_ln1353_6_reg_1578[4]),
        .I2(add_ln1353_6_reg_1578[2]),
        .I3(add_ln1353_6_reg_1578[3]),
        .I4(q0_reg_i_9__2_n_0),
        .O(q0_reg_i_5__2_n_0));
  LUT4 #(
    .INIT(16'h57A8))
    q0_reg_i_6__2
       (.I0(q0_reg_i_9__2_n_0),
        .I1(add_ln1353_6_reg_1578[2]),
        .I2(add_ln1353_6_reg_1578[3]),
        .I3(add_ln1353_6_reg_1578[4]),
        .O(q0_reg_i_6__2_n_0));
  LUT3 #(
    .INIT(8'h9C))
    q0_reg_i_7__2
       (.I0(add_ln1353_6_reg_1578[2]),
        .I1(add_ln1353_6_reg_1578[3]),
        .I2(q0_reg_i_9__2_n_0),
        .O(q0_reg_i_7__2_n_0));
  LUT2 #(
    .INIT(4'h6))
    q0_reg_i_8__2
       (.I0(q0_reg_i_9__2_n_0),
        .I1(add_ln1353_6_reg_1578[2]),
        .O(q0_reg_i_8__2_n_0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    q0_reg_i_9__2
       (.I0(add_ln1353_6_reg_1578[11]),
        .I1(add_ln1353_6_reg_1578[10]),
        .I2(q0_reg_i_12__2_n_0),
        .I3(q0_reg_i_13__2_n_0),
        .I4(add_ln1353_6_reg_1578[8]),
        .I5(add_ln1353_6_reg_1578[9]),
        .O(q0_reg_i_9__2_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_3_U/get_trig_vals_luteOg_rom_U/q1" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555400000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000005555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h022B01CF017B013000EC00B2007F00550033001A000900010000000900190032),
    .INIT_01(256'h0C580B770A9F09CE09060847078F06E00639059A0503047503EF037202FD0290),
    .INIT_02(256'h1EAF1D4E1BF41AA21959181716DD15AC1482136012471135102C0F2B0E320D41),
    .INIT_03(256'h38E4370835333365319F2FE12E2A2C7B2AD42934279C260C2483230221892018),
    .INIT_04(256'h5A89583A55F153AF51754F414D144AEF48D146BA44AA42A140A03EA63CB33AC8),
    .INIT_05(256'h831280597DA67AF9785375B3731A70876DFB6B7568F6667E640C61A15F3D5CE0),
    .INIT_06(256'hB1D4AEBDABABA89FA598A2989F9C9CA799B796CE93EA910C8E348B62889785D1),
    .INIT_07(256'hE60DE2A4DF40DBE1D887D532D1E1CE95CB4FC80DC4D1C199BE67BB3BB813B4F1),
    .INIT_08(256'h1EE11B35178E13EA104A0CAE0916058201F2FE66FADEF75BF3DCF062ECEBE97A),
    .INIT_09(256'h5B63578453A84FCE4BF84824445440863CBC38F5353131702DB329F926432290),
    .INIT_0A(256'h9A96969392938E948A97869C82A37EAC7AB776C472D36EE56AF9671063295F45),
    .INIT_0B(256'hDB71D75CD348CF34CB21C70FC2FEBEEEBADFB6D1B2C5AEB9AAAFA6A7A2A09E9A),
    .INIT_0C(256'h000000000000000000000000000000000000000000000000EBCAE7B3E39DDF87),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h2F172B0326EF22DA1EC41AAD1697127F0E680A5006380220FE08F9F0F5D9F1C1),
    .INIT_21(256'h6FC06BC167BF63BC5FB75BB157A953A04F954B8A477C436E3F5F3B4E373D332B),
    .INIT_22(256'hAE96AABBA6DEA2FD9F1B9B35974D93638F768B87879583A27FAC7BB477BA73BE),
    .INIT_23(256'hEA90E6EBE342DF95DBE4D830D478D0BDCCFEC93CC577C1AEBDE3BA14B642B26D),
    .INIT_24(256'h22B61F551BEF1885151611A20E2A0AAE072D03A8001EFC91F8FFF56AF1D0EE32),
    .INIT_25(256'h561B530C4FF84CDF49C0469B437240433D0E39D536963353300A2CBC296A2612),
    .INIT_26(256'h83E9813A7E847BC87906763E7370709C6DC16AE167FB650F621C5F255C275924),
    .INIT_27(256'hAB5FA91BA6CFA47DA2239FC39D5C9AEE987A95FF937D90F48E658BD089348692),
    .INIT_28(256'hCBDACA09C831C652C46BC27DC087BE8ABC85BA7AB867B64DB42CB203AFD4AD9D),
    .INIT_29(256'hE4D1E37CE21FE0BADF4EDDD9DC5DDAD9D94DD7B9D61ED47BD2D1D11ECF64CDA3),
    .INIT_2A(256'hF5DBF507F42BF347F25BF166F06AEF65EE58ED44EC27EB02E9D5E8A0E763E61E),
    .INIT_2B(256'hFEB1FE62FE0BFDABFD43FCD2FC5AFBD9FB4FFABEFA24F982F8D7F824F769F6A6),
    .INIT_2C(256'h000000000000000000000000000000000000000000000000FF99FF6CFF36FEF8),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q1_reg
       (.ADDRARDADDR({1'b0,1'b0,q1_reg_i_1__2_n_0,q1_reg_i_2__2_n_0,q1_reg_i_3__2_n_0,q1_reg_i_4__2_n_0,q1_reg_i_5__2_n_0,q1_reg_i_6__2_n_0,q1_reg_i_7__2_n_0,q1_reg_i_8__2_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q1_reg_i_1__2_n_0,q1_reg_i_2__2_n_0,q1_reg_i_3__2_n_0,q1_reg_i_4__2_n_0,q1_reg_i_5__2_n_0,q1_reg_i_6__2_n_0,q1_reg_i_7__2_n_0,q1_reg_i_8__2_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q1_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q1_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q1_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q1_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_11_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_11_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_11_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_11_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h03FFAAAAFC00AAAA))
    q1_reg_i_1__2
       (.I0(tmp_7_reg_1595[7]),
        .I1(add_ln1353_6_reg_1578[7]),
        .I2(q1_reg_i_9__2_n_0),
        .I3(add_ln1353_6_reg_1578[8]),
        .I4(icmp_ln895_11_reg_1590),
        .I5(add_ln1353_6_reg_1578[9]),
        .O(q1_reg_i_1__2_n_0));
  LUT5 #(
    .INIT(32'h03AAFCAA))
    q1_reg_i_2__2
       (.I0(tmp_7_reg_1595[6]),
        .I1(q1_reg_i_9__2_n_0),
        .I2(add_ln1353_6_reg_1578[7]),
        .I3(icmp_ln895_11_reg_1590),
        .I4(add_ln1353_6_reg_1578[8]),
        .O(q1_reg_i_2__2_n_0));
  LUT6 #(
    .INIT(64'hFFFCAAAA0003AAAA))
    q1_reg_i_3__2
       (.I0(tmp_7_reg_1595[5]),
        .I1(add_ln1353_6_reg_1578[5]),
        .I2(add_ln1353_6_reg_1578[6]),
        .I3(add_ln1353_6_reg_1578[4]),
        .I4(icmp_ln895_11_reg_1590),
        .I5(add_ln1353_6_reg_1578[7]),
        .O(q1_reg_i_3__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *)
  LUT5 #(
    .INIT(32'hF0C3AAAA))
    q1_reg_i_4__2
       (.I0(tmp_7_reg_1595[4]),
        .I1(add_ln1353_6_reg_1578[5]),
        .I2(add_ln1353_6_reg_1578[6]),
        .I3(add_ln1353_6_reg_1578[4]),
        .I4(icmp_ln895_11_reg_1590),
        .O(q1_reg_i_4__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *)
  LUT4 #(
    .INIT(16'hE22E))
    q1_reg_i_5__2
       (.I0(tmp_7_reg_1595[3]),
        .I1(icmp_ln895_11_reg_1590),
        .I2(add_ln1353_6_reg_1578[4]),
        .I3(add_ln1353_6_reg_1578[5]),
        .O(q1_reg_i_5__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *)
  LUT3 #(
    .INIT(8'h74))
    q1_reg_i_6__2
       (.I0(add_ln1353_6_reg_1578[4]),
        .I1(icmp_ln895_11_reg_1590),
        .I2(tmp_7_reg_1595[2]),
        .O(q1_reg_i_6__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *)
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_7__2
       (.I0(add_ln1353_6_reg_1578[3]),
        .I1(icmp_ln895_11_reg_1590),
        .I2(tmp_7_reg_1595[1]),
        .O(q1_reg_i_7__2_n_0));
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_8__2
       (.I0(add_ln1353_6_reg_1578[2]),
        .I1(icmp_ln895_11_reg_1590),
        .I2(tmp_7_reg_1595[0]),
        .O(q1_reg_i_8__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *)
  LUT3 #(
    .INIT(8'hFE))
    q1_reg_i_9__2
       (.I0(add_ln1353_6_reg_1578[5]),
        .I1(add_ln1353_6_reg_1578[6]),
        .I2(add_ln1353_6_reg_1578[4]),
        .O(q1_reg_i_9__2_n_0));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_lutfYi" *)
module hls_get_trig_vals_get_trig_vals_lutfYi
   (hw_trig_vals_4_V,
    hw_trig_vals_12_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_8_reg_1484_pp0_iter1_reg,
    tmp_9_reg_1605,
    icmp_ln895_12_reg_1600);
  output [35:0]hw_trig_vals_4_V;
  output [35:0]hw_trig_vals_12_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [12:0]add_ln1353_8_reg_1484_pp0_iter1_reg;
  input [7:0]tmp_9_reg_1605;
  input icmp_ln895_12_reg_1600;

  wire [12:0]add_ln1353_8_reg_1484_pp0_iter1_reg;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_12_V;
  wire [35:0]hw_trig_vals_4_V;
  wire icmp_ln895_12_reg_1600;
  wire [7:0]tmp_9_reg_1605;

  hls_get_trig_vals_get_trig_vals_lutfYi_rom get_trig_vals_lutfYi_rom_U
       (.add_ln1353_8_reg_1484_pp0_iter1_reg(add_ln1353_8_reg_1484_pp0_iter1_reg),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ce1),
        .hw_trig_vals_12_V(hw_trig_vals_12_V),
        .hw_trig_vals_4_V(hw_trig_vals_4_V),
        .icmp_ln895_12_reg_1600(icmp_ln895_12_reg_1600),
        .tmp_9_reg_1605(tmp_9_reg_1605));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_lutfYi_rom" *)
module hls_get_trig_vals_get_trig_vals_lutfYi_rom
   (hw_trig_vals_4_V,
    hw_trig_vals_12_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_8_reg_1484_pp0_iter1_reg,
    tmp_9_reg_1605,
    icmp_ln895_12_reg_1600);
  output [35:0]hw_trig_vals_4_V;
  output [35:0]hw_trig_vals_12_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [12:0]add_ln1353_8_reg_1484_pp0_iter1_reg;
  input [7:0]tmp_9_reg_1605;
  input icmp_ln895_12_reg_1600;

  wire [12:0]add_ln1353_8_reg_1484_pp0_iter1_reg;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_12_V;
  wire [35:0]hw_trig_vals_4_V;
  wire icmp_ln895_12_reg_1600;
  wire q0_reg_i_10__3_n_0;
  wire q0_reg_i_11__3_n_0;
  wire q0_reg_i_12__3_n_0;
  wire q0_reg_i_13__3_n_0;
  wire q0_reg_i_1__3_n_0;
  wire q0_reg_i_2__3_n_0;
  wire q0_reg_i_3__3_n_0;
  wire q0_reg_i_4__3_n_0;
  wire q0_reg_i_5__3_n_0;
  wire q0_reg_i_6__3_n_0;
  wire q0_reg_i_7__3_n_0;
  wire q0_reg_i_8__3_n_0;
  wire q0_reg_i_9__3_n_0;
  wire q1_reg_i_1__3_n_0;
  wire q1_reg_i_2__3_n_0;
  wire q1_reg_i_3__3_n_0;
  wire q1_reg_i_4__3_n_0;
  wire q1_reg_i_5__3_n_0;
  wire q1_reg_i_6__3_n_0;
  wire q1_reg_i_7__3_n_0;
  wire q1_reg_i_8__3_n_0;
  wire q1_reg_i_9__3_n_0;
  wire [7:0]tmp_9_reg_1605;
  wire [15:0]NLW_q0_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q0_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPB_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_4_U/get_trig_vals_lutfYi_rom_U/q0" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555400000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000005555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h023701DA0185013800F400B80085005A0037001D000B0001000000070017002F),
    .INIT_01(256'h0C740B930AB909E8091F085E07A506F5064D05AD0516048704000381030B029D),
    .INIT_02(256'h1EDC1D791C1F1ACC1982183F170415D214A71384126A1157104D0F4A0E500D5E),
    .INIT_03(256'h39203743356D339F31D830182E612CB12B08296827CF263D24B4233221B82046),
    .INIT_04(256'h5AD45883563A53F751BC4F874D5A4B33491446FC44EB42E240E03EE53CF13B05),
    .INIT_05(256'h836980AF7DFC7B4E78A87607736D70D96E4C6BC6694666CD645A61EE5F895D2B),
    .INIT_06(256'hB237AF1FAC0DA900A5F9A2F79FFB9D059A15972B944691678E8F8BBC88F08629),
    .INIT_07(256'hE67AE311DFADDC4DD8F2D59CD24BCEFFCBB7C875C538C200BECDBBA0B878B555),
    .INIT_08(256'h1F571BAB1803145E10BE0D21098905F40264FED7FB4FF7CBF44CF0D1ED5AE9E8),
    .INIT_09(256'h5BDF5800542350494C72489E44CE41003D35396D35A931E82E2A2A7026B92306),
    .INIT_0A(256'h9B16971493138F148B16871B83227F2A7B35774273516F636B77678D63A65FC1),
    .INIT_0B(256'hDBF4D7DFD3CACFB6CBA3C791C380BF70BB61B753B346AF3BAB31A728A3209F1B),
    .INIT_0C(256'h000000000000000000000000000000000000000000000000EC4DE836E420E009),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h2F9A2B862771235C1F461B30171913020EEB0AD306BB02A3FE8BFA73F65CF244),
    .INIT_21(256'h70406C41683F643D60385C32582A542150174C0B47FE43F03FE13BD037BF33AD),
    .INIT_22(256'hAF11AB36A759A37A9F979BB297CA93E08FF48C0588148420802B7C337839743E),
    .INIT_23(256'hEB05E760E3B7E00BDC5AD8A7D4EFD135CD76C9B5C5F0C228BE5CBA8EB6BDB2E8),
    .INIT_24(256'h23221FC11C5C18F2158412110E990B1E079D04190090FD03F972F5DCF243EEA6),
    .INIT_25(256'h567C536F505B4D424A24470043D740A93D753A3C36FE33BB30732D2629D4267D),
    .INIT_26(256'h843E81907EDB7C20795F769873CA70F76E1D6B3D6858656C627B5F845C875985),
    .INIT_27(256'hABA7A964A719A4C7A26FA0109DA99B3C98C9964E93CD91468EB88C23898886E6),
    .INIT_28(256'hCC14CA44C86DC68EC4A8C2BBC0C6BECABCC6BABCB8AAB690B470B249B01AADE4),
    .INIT_29(256'hE4FBE3A7E24BE0E7DF7CDE08DC8DDB0AD97FD7ECD652D4B0D306D155CF9CCDDC),
    .INIT_2A(256'hF5F5F522F447F364F279F185F08AEF86EE7AED67EC4BEB27E9FBE8C7E78BE647),
    .INIT_2B(256'hFEBAFE6CFE16FDB7FD50FCE1FC69FBE9FB61FAD0FA38F996F8EDF83BF781F6BF),
    .INIT_2C(256'h000000000000000000000000000000000000000000000000FF9EFF72FF3DFF00),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q0_reg
       (.ADDRARDADDR({1'b0,1'b0,q0_reg_i_1__3_n_0,q0_reg_i_2__3_n_0,q0_reg_i_3__3_n_0,q0_reg_i_4__3_n_0,q0_reg_i_5__3_n_0,q0_reg_i_6__3_n_0,q0_reg_i_7__3_n_0,q0_reg_i_8__3_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q0_reg_i_1__3_n_0,q0_reg_i_2__3_n_0,q0_reg_i_3__3_n_0,q0_reg_i_4__3_n_0,q0_reg_i_5__3_n_0,q0_reg_i_6__3_n_0,q0_reg_i_7__3_n_0,q0_reg_i_8__3_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q0_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q0_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q0_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q0_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_4_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_4_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_4_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_4_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair14" *)
  LUT3 #(
    .INIT(8'hE0))
    q0_reg_i_10__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[4]),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[3]),
        .I2(add_ln1353_8_reg_1484_pp0_iter1_reg[5]),
        .O(q0_reg_i_10__3_n_0));
  LUT2 #(
    .INIT(4'hE))
    q0_reg_i_11__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[7]),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[6]),
        .O(q0_reg_i_11__3_n_0));
  LUT5 #(
    .INIT(32'hFFFEFEFE))
    q0_reg_i_12__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[7]),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[6]),
        .I2(add_ln1353_8_reg_1484_pp0_iter1_reg[8]),
        .I3(add_ln1353_8_reg_1484_pp0_iter1_reg[4]),
        .I4(add_ln1353_8_reg_1484_pp0_iter1_reg[5]),
        .O(q0_reg_i_12__3_n_0));
  LUT5 #(
    .INIT(32'h88888880))
    q0_reg_i_13__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[3]),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[5]),
        .I2(add_ln1353_8_reg_1484_pp0_iter1_reg[1]),
        .I3(add_ln1353_8_reg_1484_pp0_iter1_reg[2]),
        .I4(add_ln1353_8_reg_1484_pp0_iter1_reg[0]),
        .O(q0_reg_i_13__3_n_0));
  LUT6 #(
    .INIT(64'h7777777F88888880))
    q0_reg_i_1__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[9]),
        .I1(q0_reg_i_9__3_n_0),
        .I2(q0_reg_i_10__3_n_0),
        .I3(add_ln1353_8_reg_1484_pp0_iter1_reg[8]),
        .I4(q0_reg_i_11__3_n_0),
        .I5(add_ln1353_8_reg_1484_pp0_iter1_reg[10]),
        .O(q0_reg_i_1__3_n_0));
  LUT6 #(
    .INIT(64'h0001FFFFFFFE0000))
    q0_reg_i_2__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[7]),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[6]),
        .I2(add_ln1353_8_reg_1484_pp0_iter1_reg[8]),
        .I3(q0_reg_i_10__3_n_0),
        .I4(q0_reg_i_9__3_n_0),
        .I5(add_ln1353_8_reg_1484_pp0_iter1_reg[9]),
        .O(q0_reg_i_2__3_n_0));
  LUT6 #(
    .INIT(64'hEEEAFFFF11150000))
    q0_reg_i_3__3
       (.I0(q0_reg_i_11__3_n_0),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[5]),
        .I2(add_ln1353_8_reg_1484_pp0_iter1_reg[3]),
        .I3(add_ln1353_8_reg_1484_pp0_iter1_reg[4]),
        .I4(q0_reg_i_9__3_n_0),
        .I5(add_ln1353_8_reg_1484_pp0_iter1_reg[8]),
        .O(q0_reg_i_3__3_n_0));
  LUT6 #(
    .INIT(64'hA9A9A999AAAAAAAA))
    q0_reg_i_4__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[7]),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[6]),
        .I2(add_ln1353_8_reg_1484_pp0_iter1_reg[5]),
        .I3(add_ln1353_8_reg_1484_pp0_iter1_reg[3]),
        .I4(add_ln1353_8_reg_1484_pp0_iter1_reg[4]),
        .I5(q0_reg_i_9__3_n_0),
        .O(q0_reg_i_4__3_n_0));
  LUT5 #(
    .INIT(32'h9995AAAA))
    q0_reg_i_5__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[6]),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[5]),
        .I2(add_ln1353_8_reg_1484_pp0_iter1_reg[3]),
        .I3(add_ln1353_8_reg_1484_pp0_iter1_reg[4]),
        .I4(q0_reg_i_9__3_n_0),
        .O(q0_reg_i_5__3_n_0));
  LUT4 #(
    .INIT(16'h57A8))
    q0_reg_i_6__3
       (.I0(q0_reg_i_9__3_n_0),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[3]),
        .I2(add_ln1353_8_reg_1484_pp0_iter1_reg[4]),
        .I3(add_ln1353_8_reg_1484_pp0_iter1_reg[5]),
        .O(q0_reg_i_6__3_n_0));
  LUT3 #(
    .INIT(8'h9C))
    q0_reg_i_7__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[3]),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[4]),
        .I2(q0_reg_i_9__3_n_0),
        .O(q0_reg_i_7__3_n_0));
  LUT2 #(
    .INIT(4'h6))
    q0_reg_i_8__3
       (.I0(q0_reg_i_9__3_n_0),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[3]),
        .O(q0_reg_i_8__3_n_0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    q0_reg_i_9__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[12]),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[11]),
        .I2(q0_reg_i_12__3_n_0),
        .I3(q0_reg_i_13__3_n_0),
        .I4(add_ln1353_8_reg_1484_pp0_iter1_reg[9]),
        .I5(add_ln1353_8_reg_1484_pp0_iter1_reg[10]),
        .O(q0_reg_i_9__3_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_4_U/get_trig_vals_lutfYi_rom_U/q1" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555400000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000005555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h023701DA0185013800F400B80085005A0037001D000B0001000000070017002F),
    .INIT_01(256'h0C740B930AB909E8091F085E07A506F5064D05AD0516048704000381030B029D),
    .INIT_02(256'h1EDC1D791C1F1ACC1982183F170415D214A71384126A1157104D0F4A0E500D5E),
    .INIT_03(256'h39203743356D339F31D830182E612CB12B08296827CF263D24B4233221B82046),
    .INIT_04(256'h5AD45883563A53F751BC4F874D5A4B33491446FC44EB42E240E03EE53CF13B05),
    .INIT_05(256'h836980AF7DFC7B4E78A87607736D70D96E4C6BC6694666CD645A61EE5F895D2B),
    .INIT_06(256'hB237AF1FAC0DA900A5F9A2F79FFB9D059A15972B944691678E8F8BBC88F08629),
    .INIT_07(256'hE67AE311DFADDC4DD8F2D59CD24BCEFFCBB7C875C538C200BECDBBA0B878B555),
    .INIT_08(256'h1F571BAB1803145E10BE0D21098905F40264FED7FB4FF7CBF44CF0D1ED5AE9E8),
    .INIT_09(256'h5BDF5800542350494C72489E44CE41003D35396D35A931E82E2A2A7026B92306),
    .INIT_0A(256'h9B16971493138F148B16871B83227F2A7B35774273516F636B77678D63A65FC1),
    .INIT_0B(256'hDBF4D7DFD3CACFB6CBA3C791C380BF70BB61B753B346AF3BAB31A728A3209F1B),
    .INIT_0C(256'h000000000000000000000000000000000000000000000000EC4DE836E420E009),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h2F9A2B862771235C1F461B30171913020EEB0AD306BB02A3FE8BFA73F65CF244),
    .INIT_21(256'h70406C41683F643D60385C32582A542150174C0B47FE43F03FE13BD037BF33AD),
    .INIT_22(256'hAF11AB36A759A37A9F979BB297CA93E08FF48C0588148420802B7C337839743E),
    .INIT_23(256'hEB05E760E3B7E00BDC5AD8A7D4EFD135CD76C9B5C5F0C228BE5CBA8EB6BDB2E8),
    .INIT_24(256'h23221FC11C5C18F2158412110E990B1E079D04190090FD03F972F5DCF243EEA6),
    .INIT_25(256'h567C536F505B4D424A24470043D740A93D753A3C36FE33BB30732D2629D4267D),
    .INIT_26(256'h843E81907EDB7C20795F769873CA70F76E1D6B3D6858656C627B5F845C875985),
    .INIT_27(256'hABA7A964A719A4C7A26FA0109DA99B3C98C9964E93CD91468EB88C23898886E6),
    .INIT_28(256'hCC14CA44C86DC68EC4A8C2BBC0C6BECABCC6BABCB8AAB690B470B249B01AADE4),
    .INIT_29(256'hE4FBE3A7E24BE0E7DF7CDE08DC8DDB0AD97FD7ECD652D4B0D306D155CF9CCDDC),
    .INIT_2A(256'hF5F5F522F447F364F279F185F08AEF86EE7AED67EC4BEB27E9FBE8C7E78BE647),
    .INIT_2B(256'hFEBAFE6CFE16FDB7FD50FCE1FC69FBE9FB61FAD0FA38F996F8EDF83BF781F6BF),
    .INIT_2C(256'h000000000000000000000000000000000000000000000000FF9EFF72FF3DFF00),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q1_reg
       (.ADDRARDADDR({1'b0,1'b0,q1_reg_i_1__3_n_0,q1_reg_i_2__3_n_0,q1_reg_i_3__3_n_0,q1_reg_i_4__3_n_0,q1_reg_i_5__3_n_0,q1_reg_i_6__3_n_0,q1_reg_i_7__3_n_0,q1_reg_i_8__3_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q1_reg_i_1__3_n_0,q1_reg_i_2__3_n_0,q1_reg_i_3__3_n_0,q1_reg_i_4__3_n_0,q1_reg_i_5__3_n_0,q1_reg_i_6__3_n_0,q1_reg_i_7__3_n_0,q1_reg_i_8__3_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q1_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q1_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q1_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q1_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_12_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_12_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_12_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_12_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h03FFAAAAFC00AAAA))
    q1_reg_i_1__3
       (.I0(tmp_9_reg_1605[7]),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[8]),
        .I2(q1_reg_i_9__3_n_0),
        .I3(add_ln1353_8_reg_1484_pp0_iter1_reg[9]),
        .I4(icmp_ln895_12_reg_1600),
        .I5(add_ln1353_8_reg_1484_pp0_iter1_reg[10]),
        .O(q1_reg_i_1__3_n_0));
  LUT5 #(
    .INIT(32'h03AAFCAA))
    q1_reg_i_2__3
       (.I0(tmp_9_reg_1605[6]),
        .I1(q1_reg_i_9__3_n_0),
        .I2(add_ln1353_8_reg_1484_pp0_iter1_reg[8]),
        .I3(icmp_ln895_12_reg_1600),
        .I4(add_ln1353_8_reg_1484_pp0_iter1_reg[9]),
        .O(q1_reg_i_2__3_n_0));
  LUT6 #(
    .INIT(64'hFFFCAAAA0003AAAA))
    q1_reg_i_3__3
       (.I0(tmp_9_reg_1605[5]),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[6]),
        .I2(add_ln1353_8_reg_1484_pp0_iter1_reg[7]),
        .I3(add_ln1353_8_reg_1484_pp0_iter1_reg[5]),
        .I4(icmp_ln895_12_reg_1600),
        .I5(add_ln1353_8_reg_1484_pp0_iter1_reg[8]),
        .O(q1_reg_i_3__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *)
  LUT5 #(
    .INIT(32'hF0C3AAAA))
    q1_reg_i_4__3
       (.I0(tmp_9_reg_1605[4]),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[6]),
        .I2(add_ln1353_8_reg_1484_pp0_iter1_reg[7]),
        .I3(add_ln1353_8_reg_1484_pp0_iter1_reg[5]),
        .I4(icmp_ln895_12_reg_1600),
        .O(q1_reg_i_4__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *)
  LUT4 #(
    .INIT(16'hE22E))
    q1_reg_i_5__3
       (.I0(tmp_9_reg_1605[3]),
        .I1(icmp_ln895_12_reg_1600),
        .I2(add_ln1353_8_reg_1484_pp0_iter1_reg[5]),
        .I3(add_ln1353_8_reg_1484_pp0_iter1_reg[6]),
        .O(q1_reg_i_5__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *)
  LUT3 #(
    .INIT(8'h74))
    q1_reg_i_6__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[5]),
        .I1(icmp_ln895_12_reg_1600),
        .I2(tmp_9_reg_1605[2]),
        .O(q1_reg_i_6__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *)
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_7__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[4]),
        .I1(icmp_ln895_12_reg_1600),
        .I2(tmp_9_reg_1605[1]),
        .O(q1_reg_i_7__3_n_0));
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_8__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[3]),
        .I1(icmp_ln895_12_reg_1600),
        .I2(tmp_9_reg_1605[0]),
        .O(q1_reg_i_8__3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *)
  LUT3 #(
    .INIT(8'hFE))
    q1_reg_i_9__3
       (.I0(add_ln1353_8_reg_1484_pp0_iter1_reg[6]),
        .I1(add_ln1353_8_reg_1484_pp0_iter1_reg[7]),
        .I2(add_ln1353_8_reg_1484_pp0_iter1_reg[5]),
        .O(q1_reg_i_9__3_n_0));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_lutg8j" *)
module hls_get_trig_vals_get_trig_vals_lutg8j
   (hw_trig_vals_5_V,
    hw_trig_vals_13_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_10_reg_1610,
    tmp_11_reg_1627,
    icmp_ln895_13_reg_1622,
    add_ln1353_2_reg_1534);
  output [35:0]hw_trig_vals_5_V;
  output [35:0]hw_trig_vals_13_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [10:0]add_ln1353_10_reg_1610;
  input [7:0]tmp_11_reg_1627;
  input icmp_ln895_13_reg_1622;
  input [1:0]add_ln1353_2_reg_1534;

  wire [10:0]add_ln1353_10_reg_1610;
  wire [1:0]add_ln1353_2_reg_1534;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_13_V;
  wire [35:0]hw_trig_vals_5_V;
  wire icmp_ln895_13_reg_1622;
  wire [7:0]tmp_11_reg_1627;

  hls_get_trig_vals_get_trig_vals_lutg8j_rom get_trig_vals_lutg8j_rom_U
       (.add_ln1353_10_reg_1610(add_ln1353_10_reg_1610),
        .add_ln1353_2_reg_1534(add_ln1353_2_reg_1534),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ce1),
        .hw_trig_vals_13_V(hw_trig_vals_13_V),
        .hw_trig_vals_5_V(hw_trig_vals_5_V),
        .icmp_ln895_13_reg_1622(icmp_ln895_13_reg_1622),
        .tmp_11_reg_1627(tmp_11_reg_1627));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_lutg8j_rom" *)
module hls_get_trig_vals_get_trig_vals_lutg8j_rom
   (hw_trig_vals_5_V,
    hw_trig_vals_13_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_10_reg_1610,
    tmp_11_reg_1627,
    icmp_ln895_13_reg_1622,
    add_ln1353_2_reg_1534);
  output [35:0]hw_trig_vals_5_V;
  output [35:0]hw_trig_vals_13_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [10:0]add_ln1353_10_reg_1610;
  input [7:0]tmp_11_reg_1627;
  input icmp_ln895_13_reg_1622;
  input [1:0]add_ln1353_2_reg_1534;

  wire [10:0]add_ln1353_10_reg_1610;
  wire [1:0]add_ln1353_2_reg_1534;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_13_V;
  wire [35:0]hw_trig_vals_5_V;
  wire icmp_ln895_13_reg_1622;
  wire q0_reg_i_10__4_n_0;
  wire q0_reg_i_11__4_n_0;
  wire q0_reg_i_12__4_n_0;
  wire q0_reg_i_13__4_n_0;
  wire q0_reg_i_1__4_n_0;
  wire q0_reg_i_2__4_n_0;
  wire q0_reg_i_3__4_n_0;
  wire q0_reg_i_4__4_n_0;
  wire q0_reg_i_5__4_n_0;
  wire q0_reg_i_6__4_n_0;
  wire q0_reg_i_7__4_n_0;
  wire q0_reg_i_8__4_n_0;
  wire q0_reg_i_9__4_n_0;
  wire q1_reg_i_1__4_n_0;
  wire q1_reg_i_2__4_n_0;
  wire q1_reg_i_3__4_n_0;
  wire q1_reg_i_4__4_n_0;
  wire q1_reg_i_5__4_n_0;
  wire q1_reg_i_6__4_n_0;
  wire q1_reg_i_7__4_n_0;
  wire q1_reg_i_8__4_n_0;
  wire q1_reg_i_9__4_n_0;
  wire [7:0]tmp_11_reg_1627;
  wire [15:0]NLW_q0_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q0_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPB_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_5_U/get_trig_vals_lutg8j_rom_U/q0" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555400000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000005555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h024301E5018F014200FC00BF008B005F003B0020000D0002000000060014002B),
    .INIT_01(256'h0C910BAF0AD40A020938087607BC070B066205C10528049804100390031902AA),
    .INIT_02(256'h1F091DA51C4A1AF619AA1867172B15F714CC13A8128D1179106E0F6A0E6F0D7C),
    .INIT_03(256'h395C377E35A733D8321030502E972CE62B3D299B2801266F24E5236221E72074),
    .INIT_04(256'h5B1E58CD5682543F52034FCD4D9F4B784958473F452D4323411F3F243D2F3B42),
    .INIT_05(256'h83C181067E527BA478FC765B73C0712B6E9D6C166995671B64A8623B5FD55D76),
    .INIT_06(256'hB29BAF82AC6FA961A65AA357A05B9D649A73978894A291C38EEA8C1689498682),
    .INIT_07(256'hE6E8E37EE019DCB9D95DD607D2B5CF68CC20C8DDC59FC267BF33BC05B8DCB5B9),
    .INIT_08(256'h1FCC1C20187714D311320D9509FB066602D5FF49FBC0F83CF4BBF140EDC9EA56),
    .INIT_09(256'h5C5B587B549F50C44CED4919454741793DAE39E6362132602EA22AE72730237C),
    .INIT_0A(256'h9B97979493938F938B96879A83A17FA97BB477C073CF6FE06BF4680A6422603E),
    .INIT_0B(256'hDC76D861D44DD039CC26C814C402BFF2BBE3B7D5B3C8AFBCABB2A7A9A3A19F9B),
    .INIT_0C(256'h000000000000000000000000000000000000000000000000ECD0E8B9E4A2E08C),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h301C2C0827F423DF1FC91BB3179C13850F6E0B56073E0326FF0EFAF6F6DFF2C7),
    .INIT_21(256'h70C06CC168C064BD60B95CB358AB54A350984C8D4880447240633C523841342F),
    .INIT_22(256'hAF8CABB2A7D5A3F6A0149C2F9847945E90718C838892849F80AA7CB278B974BD),
    .INIT_23(256'hEB79E7D5E42CE080DCD1D91DD566D1ACCDEECA2DC669C2A1BED6BB08B737B363),
    .INIT_24(256'h238D202E1CC9196015F2127F0F090B8D080E048A0101FD75F9E4F64FF2B7EF1A),
    .INIT_25(256'h56DE53D150BE4DA64A884765443D410F3DDC3AA43766342430DD2D902A3F26E8),
    .INIT_26(256'h849381E67F327C7879B776F1742471516E786B9A68B565CA62DA5FE35CE759E5),
    .INIT_27(256'hABEFA9ADA763A512A2BAA05C9DF79B8A9918969E941E91978F0A8C7689DC873B),
    .INIT_28(256'hCC4DCA7EC8A8C6CAC4E5C2F9C105BF0ABD07BAFDB8ECB6D4B4B4B28EB060AE2B),
    .INIT_29(256'hE525E3D2E277E114DFA9DE37DCBDDB3BD9B1D81FD686D4E5D33CD18CCFD4CE14),
    .INIT_2A(256'hF60EF53DF463F381F297F1A4F0AAEFA7EE9CED8AEC6FEB4CEA21E8EEE7B3E670),
    .INIT_2B(256'hFEC3FE77FE21FDC4FD5EFCEFFC79FBFAFB73FAE3FA4BF9ABF903F852F799F6D8),
    .INIT_2C(256'h000000000000000000000000000000000000000000000000FFA3FF78FF44FF08),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q0_reg
       (.ADDRARDADDR({1'b0,1'b0,q0_reg_i_1__4_n_0,q0_reg_i_2__4_n_0,q0_reg_i_3__4_n_0,q0_reg_i_4__4_n_0,q0_reg_i_5__4_n_0,q0_reg_i_6__4_n_0,q0_reg_i_7__4_n_0,q0_reg_i_8__4_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q0_reg_i_1__4_n_0,q0_reg_i_2__4_n_0,q0_reg_i_3__4_n_0,q0_reg_i_4__4_n_0,q0_reg_i_5__4_n_0,q0_reg_i_6__4_n_0,q0_reg_i_7__4_n_0,q0_reg_i_8__4_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q0_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q0_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q0_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q0_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_5_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_5_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_5_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_5_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair17" *)
  LUT3 #(
    .INIT(8'hE0))
    q0_reg_i_10__4
       (.I0(add_ln1353_10_reg_1610[2]),
        .I1(add_ln1353_10_reg_1610[1]),
        .I2(add_ln1353_10_reg_1610[3]),
        .O(q0_reg_i_10__4_n_0));
  LUT2 #(
    .INIT(4'hE))
    q0_reg_i_11__4
       (.I0(add_ln1353_10_reg_1610[5]),
        .I1(add_ln1353_10_reg_1610[4]),
        .O(q0_reg_i_11__4_n_0));
  LUT5 #(
    .INIT(32'hFFFEFEFE))
    q0_reg_i_12__4
       (.I0(add_ln1353_10_reg_1610[5]),
        .I1(add_ln1353_10_reg_1610[4]),
        .I2(add_ln1353_10_reg_1610[6]),
        .I3(add_ln1353_10_reg_1610[2]),
        .I4(add_ln1353_10_reg_1610[3]),
        .O(q0_reg_i_12__4_n_0));
  LUT5 #(
    .INIT(32'h88888880))
    q0_reg_i_13__4
       (.I0(add_ln1353_10_reg_1610[1]),
        .I1(add_ln1353_10_reg_1610[3]),
        .I2(add_ln1353_2_reg_1534[1]),
        .I3(add_ln1353_10_reg_1610[0]),
        .I4(add_ln1353_2_reg_1534[0]),
        .O(q0_reg_i_13__4_n_0));
  LUT6 #(
    .INIT(64'h7777777F88888880))
    q0_reg_i_1__4
       (.I0(add_ln1353_10_reg_1610[7]),
        .I1(q0_reg_i_9__4_n_0),
        .I2(q0_reg_i_10__4_n_0),
        .I3(add_ln1353_10_reg_1610[6]),
        .I4(q0_reg_i_11__4_n_0),
        .I5(add_ln1353_10_reg_1610[8]),
        .O(q0_reg_i_1__4_n_0));
  LUT6 #(
    .INIT(64'h0001FFFFFFFE0000))
    q0_reg_i_2__4
       (.I0(add_ln1353_10_reg_1610[5]),
        .I1(add_ln1353_10_reg_1610[4]),
        .I2(add_ln1353_10_reg_1610[6]),
        .I3(q0_reg_i_10__4_n_0),
        .I4(q0_reg_i_9__4_n_0),
        .I5(add_ln1353_10_reg_1610[7]),
        .O(q0_reg_i_2__4_n_0));
  LUT6 #(
    .INIT(64'hEEEAFFFF11150000))
    q0_reg_i_3__4
       (.I0(q0_reg_i_11__4_n_0),
        .I1(add_ln1353_10_reg_1610[3]),
        .I2(add_ln1353_10_reg_1610[1]),
        .I3(add_ln1353_10_reg_1610[2]),
        .I4(q0_reg_i_9__4_n_0),
        .I5(add_ln1353_10_reg_1610[6]),
        .O(q0_reg_i_3__4_n_0));
  LUT6 #(
    .INIT(64'hA9A9A999AAAAAAAA))
    q0_reg_i_4__4
       (.I0(add_ln1353_10_reg_1610[5]),
        .I1(add_ln1353_10_reg_1610[4]),
        .I2(add_ln1353_10_reg_1610[3]),
        .I3(add_ln1353_10_reg_1610[1]),
        .I4(add_ln1353_10_reg_1610[2]),
        .I5(q0_reg_i_9__4_n_0),
        .O(q0_reg_i_4__4_n_0));
  LUT5 #(
    .INIT(32'h9995AAAA))
    q0_reg_i_5__4
       (.I0(add_ln1353_10_reg_1610[4]),
        .I1(add_ln1353_10_reg_1610[3]),
        .I2(add_ln1353_10_reg_1610[1]),
        .I3(add_ln1353_10_reg_1610[2]),
        .I4(q0_reg_i_9__4_n_0),
        .O(q0_reg_i_5__4_n_0));
  LUT4 #(
    .INIT(16'h57A8))
    q0_reg_i_6__4
       (.I0(q0_reg_i_9__4_n_0),
        .I1(add_ln1353_10_reg_1610[1]),
        .I2(add_ln1353_10_reg_1610[2]),
        .I3(add_ln1353_10_reg_1610[3]),
        .O(q0_reg_i_6__4_n_0));
  LUT3 #(
    .INIT(8'h9C))
    q0_reg_i_7__4
       (.I0(add_ln1353_10_reg_1610[1]),
        .I1(add_ln1353_10_reg_1610[2]),
        .I2(q0_reg_i_9__4_n_0),
        .O(q0_reg_i_7__4_n_0));
  LUT2 #(
    .INIT(4'h6))
    q0_reg_i_8__4
       (.I0(q0_reg_i_9__4_n_0),
        .I1(add_ln1353_10_reg_1610[1]),
        .O(q0_reg_i_8__4_n_0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    q0_reg_i_9__4
       (.I0(add_ln1353_10_reg_1610[10]),
        .I1(add_ln1353_10_reg_1610[9]),
        .I2(q0_reg_i_12__4_n_0),
        .I3(q0_reg_i_13__4_n_0),
        .I4(add_ln1353_10_reg_1610[7]),
        .I5(add_ln1353_10_reg_1610[8]),
        .O(q0_reg_i_9__4_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_5_U/get_trig_vals_lutg8j_rom_U/q1" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555400000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000005555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h024301E5018F014200FC00BF008B005F003B0020000D0002000000060014002B),
    .INIT_01(256'h0C910BAF0AD40A020938087607BC070B066205C10528049804100390031902AA),
    .INIT_02(256'h1F091DA51C4A1AF619AA1867172B15F714CC13A8128D1179106E0F6A0E6F0D7C),
    .INIT_03(256'h395C377E35A733D8321030502E972CE62B3D299B2801266F24E5236221E72074),
    .INIT_04(256'h5B1E58CD5682543F52034FCD4D9F4B784958473F452D4323411F3F243D2F3B42),
    .INIT_05(256'h83C181067E527BA478FC765B73C0712B6E9D6C166995671B64A8623B5FD55D76),
    .INIT_06(256'hB29BAF82AC6FA961A65AA357A05B9D649A73978894A291C38EEA8C1689498682),
    .INIT_07(256'hE6E8E37EE019DCB9D95DD607D2B5CF68CC20C8DDC59FC267BF33BC05B8DCB5B9),
    .INIT_08(256'h1FCC1C20187714D311320D9509FB066602D5FF49FBC0F83CF4BBF140EDC9EA56),
    .INIT_09(256'h5C5B587B549F50C44CED4919454741793DAE39E6362132602EA22AE72730237C),
    .INIT_0A(256'h9B97979493938F938B96879A83A17FA97BB477C073CF6FE06BF4680A6422603E),
    .INIT_0B(256'hDC76D861D44DD039CC26C814C402BFF2BBE3B7D5B3C8AFBCABB2A7A9A3A19F9B),
    .INIT_0C(256'h000000000000000000000000000000000000000000000000ECD0E8B9E4A2E08C),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h301C2C0827F423DF1FC91BB3179C13850F6E0B56073E0326FF0EFAF6F6DFF2C7),
    .INIT_21(256'h70C06CC168C064BD60B95CB358AB54A350984C8D4880447240633C523841342F),
    .INIT_22(256'hAF8CABB2A7D5A3F6A0149C2F9847945E90718C838892849F80AA7CB278B974BD),
    .INIT_23(256'hEB79E7D5E42CE080DCD1D91DD566D1ACCDEECA2DC669C2A1BED6BB08B737B363),
    .INIT_24(256'h238D202E1CC9196015F2127F0F090B8D080E048A0101FD75F9E4F64FF2B7EF1A),
    .INIT_25(256'h56DE53D150BE4DA64A884765443D410F3DDC3AA43766342430DD2D902A3F26E8),
    .INIT_26(256'h849381E67F327C7879B776F1742471516E786B9A68B565CA62DA5FE35CE759E5),
    .INIT_27(256'hABEFA9ADA763A512A2BAA05C9DF79B8A9918969E941E91978F0A8C7689DC873B),
    .INIT_28(256'hCC4DCA7EC8A8C6CAC4E5C2F9C105BF0ABD07BAFDB8ECB6D4B4B4B28EB060AE2B),
    .INIT_29(256'hE525E3D2E277E114DFA9DE37DCBDDB3BD9B1D81FD686D4E5D33CD18CCFD4CE14),
    .INIT_2A(256'hF60EF53DF463F381F297F1A4F0AAEFA7EE9CED8AEC6FEB4CEA21E8EEE7B3E670),
    .INIT_2B(256'hFEC3FE77FE21FDC4FD5EFCEFFC79FBFAFB73FAE3FA4BF9ABF903F852F799F6D8),
    .INIT_2C(256'h000000000000000000000000000000000000000000000000FFA3FF78FF44FF08),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q1_reg
       (.ADDRARDADDR({1'b0,1'b0,q1_reg_i_1__4_n_0,q1_reg_i_2__4_n_0,q1_reg_i_3__4_n_0,q1_reg_i_4__4_n_0,q1_reg_i_5__4_n_0,q1_reg_i_6__4_n_0,q1_reg_i_7__4_n_0,q1_reg_i_8__4_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q1_reg_i_1__4_n_0,q1_reg_i_2__4_n_0,q1_reg_i_3__4_n_0,q1_reg_i_4__4_n_0,q1_reg_i_5__4_n_0,q1_reg_i_6__4_n_0,q1_reg_i_7__4_n_0,q1_reg_i_8__4_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q1_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q1_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q1_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q1_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_13_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_13_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_13_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_13_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h03FFAAAAFC00AAAA))
    q1_reg_i_1__4
       (.I0(tmp_11_reg_1627[7]),
        .I1(add_ln1353_10_reg_1610[6]),
        .I2(q1_reg_i_9__4_n_0),
        .I3(add_ln1353_10_reg_1610[7]),
        .I4(icmp_ln895_13_reg_1622),
        .I5(add_ln1353_10_reg_1610[8]),
        .O(q1_reg_i_1__4_n_0));
  LUT5 #(
    .INIT(32'h03AAFCAA))
    q1_reg_i_2__4
       (.I0(tmp_11_reg_1627[6]),
        .I1(q1_reg_i_9__4_n_0),
        .I2(add_ln1353_10_reg_1610[6]),
        .I3(icmp_ln895_13_reg_1622),
        .I4(add_ln1353_10_reg_1610[7]),
        .O(q1_reg_i_2__4_n_0));
  LUT6 #(
    .INIT(64'hFFFCAAAA0003AAAA))
    q1_reg_i_3__4
       (.I0(tmp_11_reg_1627[5]),
        .I1(add_ln1353_10_reg_1610[4]),
        .I2(add_ln1353_10_reg_1610[5]),
        .I3(add_ln1353_10_reg_1610[3]),
        .I4(icmp_ln895_13_reg_1622),
        .I5(add_ln1353_10_reg_1610[6]),
        .O(q1_reg_i_3__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *)
  LUT5 #(
    .INIT(32'hF0C3AAAA))
    q1_reg_i_4__4
       (.I0(tmp_11_reg_1627[4]),
        .I1(add_ln1353_10_reg_1610[4]),
        .I2(add_ln1353_10_reg_1610[5]),
        .I3(add_ln1353_10_reg_1610[3]),
        .I4(icmp_ln895_13_reg_1622),
        .O(q1_reg_i_4__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *)
  LUT4 #(
    .INIT(16'hE22E))
    q1_reg_i_5__4
       (.I0(tmp_11_reg_1627[3]),
        .I1(icmp_ln895_13_reg_1622),
        .I2(add_ln1353_10_reg_1610[3]),
        .I3(add_ln1353_10_reg_1610[4]),
        .O(q1_reg_i_5__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *)
  LUT3 #(
    .INIT(8'h74))
    q1_reg_i_6__4
       (.I0(add_ln1353_10_reg_1610[3]),
        .I1(icmp_ln895_13_reg_1622),
        .I2(tmp_11_reg_1627[2]),
        .O(q1_reg_i_6__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *)
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_7__4
       (.I0(add_ln1353_10_reg_1610[2]),
        .I1(icmp_ln895_13_reg_1622),
        .I2(tmp_11_reg_1627[1]),
        .O(q1_reg_i_7__4_n_0));
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_8__4
       (.I0(add_ln1353_10_reg_1610[1]),
        .I1(icmp_ln895_13_reg_1622),
        .I2(tmp_11_reg_1627[0]),
        .O(q1_reg_i_8__4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *)
  LUT3 #(
    .INIT(8'hFE))
    q1_reg_i_9__4
       (.I0(add_ln1353_10_reg_1610[4]),
        .I1(add_ln1353_10_reg_1610[5]),
        .I2(add_ln1353_10_reg_1610[3]),
        .O(q1_reg_i_9__4_n_0));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_luthbi" *)
module hls_get_trig_vals_get_trig_vals_luthbi
   (hw_trig_vals_6_V,
    hw_trig_vals_14_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_12_reg_1632,
    tmp_13_reg_1649,
    icmp_ln895_14_reg_1644,
    add_ln1353_4_reg_1556,
    add_ln1353_reg_1512);
  output [35:0]hw_trig_vals_6_V;
  output [35:0]hw_trig_vals_14_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [10:0]add_ln1353_12_reg_1632;
  input [7:0]tmp_13_reg_1649;
  input icmp_ln895_14_reg_1644;
  input [0:0]add_ln1353_4_reg_1556;
  input [0:0]add_ln1353_reg_1512;

  wire [10:0]add_ln1353_12_reg_1632;
  wire [0:0]add_ln1353_4_reg_1556;
  wire [0:0]add_ln1353_reg_1512;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_14_V;
  wire [35:0]hw_trig_vals_6_V;
  wire icmp_ln895_14_reg_1644;
  wire [7:0]tmp_13_reg_1649;

  hls_get_trig_vals_get_trig_vals_luthbi_rom get_trig_vals_luthbi_rom_U
       (.add_ln1353_12_reg_1632(add_ln1353_12_reg_1632),
        .add_ln1353_4_reg_1556(add_ln1353_4_reg_1556),
        .add_ln1353_reg_1512(add_ln1353_reg_1512),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ce1),
        .hw_trig_vals_14_V(hw_trig_vals_14_V),
        .hw_trig_vals_6_V(hw_trig_vals_6_V),
        .icmp_ln895_14_reg_1644(icmp_ln895_14_reg_1644),
        .tmp_13_reg_1649(tmp_13_reg_1649));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_luthbi_rom" *)
module hls_get_trig_vals_get_trig_vals_luthbi_rom
   (hw_trig_vals_6_V,
    hw_trig_vals_14_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_12_reg_1632,
    tmp_13_reg_1649,
    icmp_ln895_14_reg_1644,
    add_ln1353_4_reg_1556,
    add_ln1353_reg_1512);
  output [35:0]hw_trig_vals_6_V;
  output [35:0]hw_trig_vals_14_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [10:0]add_ln1353_12_reg_1632;
  input [7:0]tmp_13_reg_1649;
  input icmp_ln895_14_reg_1644;
  input [0:0]add_ln1353_4_reg_1556;
  input [0:0]add_ln1353_reg_1512;

  wire [10:0]add_ln1353_12_reg_1632;
  wire [0:0]add_ln1353_4_reg_1556;
  wire [0:0]add_ln1353_reg_1512;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_14_V;
  wire [35:0]hw_trig_vals_6_V;
  wire icmp_ln895_14_reg_1644;
  wire q0_reg_i_10__5_n_0;
  wire q0_reg_i_11__5_n_0;
  wire q0_reg_i_12__5_n_0;
  wire q0_reg_i_13__5_n_0;
  wire q0_reg_i_1__5_n_0;
  wire q0_reg_i_2__5_n_0;
  wire q0_reg_i_3__5_n_0;
  wire q0_reg_i_4__5_n_0;
  wire q0_reg_i_5__5_n_0;
  wire q0_reg_i_6__5_n_0;
  wire q0_reg_i_7__5_n_0;
  wire q0_reg_i_8__5_n_0;
  wire q0_reg_i_9__5_n_0;
  wire q1_reg_i_1__5_n_0;
  wire q1_reg_i_2__5_n_0;
  wire q1_reg_i_3__5_n_0;
  wire q1_reg_i_4__5_n_0;
  wire q1_reg_i_5__5_n_0;
  wire q1_reg_i_6__5_n_0;
  wire q1_reg_i_7__5_n_0;
  wire q1_reg_i_8__5_n_0;
  wire q1_reg_i_9__5_n_0;
  wire [7:0]tmp_13_reg_1649;
  wire [15:0]NLW_q0_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q0_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPB_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_6_U/get_trig_vals_luthbi_rom_U/q0" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555400000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000005555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h025001F1019A014B010500C700910064003F0023000F00030000000500120028),
    .INIT_01(256'h0CAE0BCA0AEF0A1C0950088E07D30720067605D4053B04AA042103A0032802B8),
    .INIT_02(256'h1F361DD11C751B2019D4188F1752161D14F113CC12B0119B108F0F8A0E8E0D9A),
    .INIT_03(256'h399937B935E23411324930882ECE2D1C2B7229CF283426A125152392221620A2),
    .INIT_04(256'h5B69591756CB5487524A50134DE44BBC499B4781456F4363415F3F633D6D3B7F),
    .INIT_05(256'h8419815D7EA87BF9795176AF7413717E6EEF6C6769E5676A64F6628960225DC2),
    .INIT_06(256'hB2FEAFE5ACD1A9C3A6BAA3B7A0BA9DC29AD197E594FF921F8F448C7089A286DA),
    .INIT_07(256'hE755E3EBE085DD24D9C8D671D31FCFD1CC89C945C607C2CEBF9ABC6BB941B61D),
    .INIT_08(256'h20421C9518EC154711A50E080A6E06D90347FFBAFC31F8ACF52BF1AFEE37EAC4),
    .INIT_09(256'h5CD758F7551A51404D68499345C141F33E273A5F369A32D82F192B5E27A723F3),
    .INIT_0A(256'h9C179814941390138C16881A842080287C32783F744D705E6C716887649F60BA),
    .INIT_0B(256'hDCF9D8E4D4CFD0BBCCA8C896C484C074BC65B856B449B03DAC33A82AA422A01C),
    .INIT_0C(256'h000000000000000000000000000000000000000000000000ED53E93CE525E10F),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h309F2C8B28772462204C1C36181F14080FF10BD907C103A9FF91FB79F762F34A),
    .INIT_21(256'h71406D416940653D61395D34592C5524511A4D0E490144F440E53CD538C334B1),
    .INIT_22(256'hB007AC2DA851A472A0909CAC98C594DB90EF8D018910851D81287D317938753D),
    .INIT_23(256'hEBEDE849E4A2E0F6DD47D994D5DED224CE66CAA5C6E1C31ABF50BB82B7B1B3DD),
    .INIT_24(256'h23F9209A1D3619CD166012EE0F780BFD087E04FA0172FDE7FA56F6C2F32AEF8E),
    .INIT_25(256'h573F543351214E094AEC47CA44A241753E433B0B37CE348D31462DFA2AA92754),
    .INIT_26(256'h84E9823C7F897CCF7A10774A747E71AC6ED46BF669126628633860425D475A46),
    .INIT_27(256'hAC37A9F5A7ACA55CA306A0A89E449BD8996696EE946E91E88F5C8CC98A2F878F),
    .INIT_28(256'hCC86CAB9C8E3C707C522C337C144BF4ABD48BB3FB92FB717B4F9B2D3B0A6AE72),
    .INIT_29(256'hE54EE3FCE2A3E141DFD7DE66DCECDB6BD9E2D852D6B9D519D372D1C2D00BCE4C),
    .INIT_2A(256'hF628F557F47EF39DF2B4F1C3F0C9EFC8EEBEEDACEC92EB70EA46E914E7DAE698),
    .INIT_2B(256'hFECCFE81FE2CFDD0FD6BFCFEFC88FC0AFB84FAF5FA5FF9BFF918F868F7B0F6F0),
    .INIT_2C(256'h000000000000000000000000000000000000000000000000FFA8FF7EFF4BFF10),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q0_reg
       (.ADDRARDADDR({1'b0,1'b0,q0_reg_i_1__5_n_0,q0_reg_i_2__5_n_0,q0_reg_i_3__5_n_0,q0_reg_i_4__5_n_0,q0_reg_i_5__5_n_0,q0_reg_i_6__5_n_0,q0_reg_i_7__5_n_0,q0_reg_i_8__5_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q0_reg_i_1__5_n_0,q0_reg_i_2__5_n_0,q0_reg_i_3__5_n_0,q0_reg_i_4__5_n_0,q0_reg_i_5__5_n_0,q0_reg_i_6__5_n_0,q0_reg_i_7__5_n_0,q0_reg_i_8__5_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q0_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q0_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q0_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q0_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_6_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_6_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_6_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_6_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair20" *)
  LUT3 #(
    .INIT(8'hE0))
    q0_reg_i_10__5
       (.I0(add_ln1353_12_reg_1632[2]),
        .I1(add_ln1353_12_reg_1632[1]),
        .I2(add_ln1353_12_reg_1632[3]),
        .O(q0_reg_i_10__5_n_0));
  LUT2 #(
    .INIT(4'hE))
    q0_reg_i_11__5
       (.I0(add_ln1353_12_reg_1632[5]),
        .I1(add_ln1353_12_reg_1632[4]),
        .O(q0_reg_i_11__5_n_0));
  LUT5 #(
    .INIT(32'hFFFEFEFE))
    q0_reg_i_12__5
       (.I0(add_ln1353_12_reg_1632[5]),
        .I1(add_ln1353_12_reg_1632[4]),
        .I2(add_ln1353_12_reg_1632[6]),
        .I3(add_ln1353_12_reg_1632[2]),
        .I4(add_ln1353_12_reg_1632[3]),
        .O(q0_reg_i_12__5_n_0));
  LUT5 #(
    .INIT(32'h88888880))
    q0_reg_i_13__5
       (.I0(add_ln1353_12_reg_1632[1]),
        .I1(add_ln1353_12_reg_1632[3]),
        .I2(add_ln1353_4_reg_1556),
        .I3(add_ln1353_12_reg_1632[0]),
        .I4(add_ln1353_reg_1512),
        .O(q0_reg_i_13__5_n_0));
  LUT6 #(
    .INIT(64'h7777777F88888880))
    q0_reg_i_1__5
       (.I0(add_ln1353_12_reg_1632[7]),
        .I1(q0_reg_i_9__5_n_0),
        .I2(q0_reg_i_10__5_n_0),
        .I3(add_ln1353_12_reg_1632[6]),
        .I4(q0_reg_i_11__5_n_0),
        .I5(add_ln1353_12_reg_1632[8]),
        .O(q0_reg_i_1__5_n_0));
  LUT6 #(
    .INIT(64'h0001FFFFFFFE0000))
    q0_reg_i_2__5
       (.I0(add_ln1353_12_reg_1632[5]),
        .I1(add_ln1353_12_reg_1632[4]),
        .I2(add_ln1353_12_reg_1632[6]),
        .I3(q0_reg_i_10__5_n_0),
        .I4(q0_reg_i_9__5_n_0),
        .I5(add_ln1353_12_reg_1632[7]),
        .O(q0_reg_i_2__5_n_0));
  LUT6 #(
    .INIT(64'hEEEAFFFF11150000))
    q0_reg_i_3__5
       (.I0(q0_reg_i_11__5_n_0),
        .I1(add_ln1353_12_reg_1632[3]),
        .I2(add_ln1353_12_reg_1632[1]),
        .I3(add_ln1353_12_reg_1632[2]),
        .I4(q0_reg_i_9__5_n_0),
        .I5(add_ln1353_12_reg_1632[6]),
        .O(q0_reg_i_3__5_n_0));
  LUT6 #(
    .INIT(64'hA9A9A999AAAAAAAA))
    q0_reg_i_4__5
       (.I0(add_ln1353_12_reg_1632[5]),
        .I1(add_ln1353_12_reg_1632[4]),
        .I2(add_ln1353_12_reg_1632[3]),
        .I3(add_ln1353_12_reg_1632[1]),
        .I4(add_ln1353_12_reg_1632[2]),
        .I5(q0_reg_i_9__5_n_0),
        .O(q0_reg_i_4__5_n_0));
  LUT5 #(
    .INIT(32'h9995AAAA))
    q0_reg_i_5__5
       (.I0(add_ln1353_12_reg_1632[4]),
        .I1(add_ln1353_12_reg_1632[3]),
        .I2(add_ln1353_12_reg_1632[1]),
        .I3(add_ln1353_12_reg_1632[2]),
        .I4(q0_reg_i_9__5_n_0),
        .O(q0_reg_i_5__5_n_0));
  LUT4 #(
    .INIT(16'h57A8))
    q0_reg_i_6__5
       (.I0(q0_reg_i_9__5_n_0),
        .I1(add_ln1353_12_reg_1632[1]),
        .I2(add_ln1353_12_reg_1632[2]),
        .I3(add_ln1353_12_reg_1632[3]),
        .O(q0_reg_i_6__5_n_0));
  LUT3 #(
    .INIT(8'h9C))
    q0_reg_i_7__5
       (.I0(add_ln1353_12_reg_1632[1]),
        .I1(add_ln1353_12_reg_1632[2]),
        .I2(q0_reg_i_9__5_n_0),
        .O(q0_reg_i_7__5_n_0));
  LUT2 #(
    .INIT(4'h6))
    q0_reg_i_8__5
       (.I0(q0_reg_i_9__5_n_0),
        .I1(add_ln1353_12_reg_1632[1]),
        .O(q0_reg_i_8__5_n_0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    q0_reg_i_9__5
       (.I0(add_ln1353_12_reg_1632[10]),
        .I1(add_ln1353_12_reg_1632[9]),
        .I2(q0_reg_i_12__5_n_0),
        .I3(q0_reg_i_13__5_n_0),
        .I4(add_ln1353_12_reg_1632[7]),
        .I5(add_ln1353_12_reg_1632[8]),
        .O(q0_reg_i_9__5_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_6_U/get_trig_vals_luthbi_rom_U/q1" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h55555555555555555555555555555400000000000000000000000000000000FF),
    .INITP_05(256'h0000000000000000000000000000005555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h025001F1019A014B010500C700910064003F0023000F00030000000500120028),
    .INIT_01(256'h0CAE0BCA0AEF0A1C0950088E07D30720067605D4053B04AA042103A0032802B8),
    .INIT_02(256'h1F361DD11C751B2019D4188F1752161D14F113CC12B0119B108F0F8A0E8E0D9A),
    .INIT_03(256'h399937B935E23411324930882ECE2D1C2B7229CF283426A125152392221620A2),
    .INIT_04(256'h5B69591756CB5487524A50134DE44BBC499B4781456F4363415F3F633D6D3B7F),
    .INIT_05(256'h8419815D7EA87BF9795176AF7413717E6EEF6C6769E5676A64F6628960225DC2),
    .INIT_06(256'hB2FEAFE5ACD1A9C3A6BAA3B7A0BA9DC29AD197E594FF921F8F448C7089A286DA),
    .INIT_07(256'hE755E3EBE085DD24D9C8D671D31FCFD1CC89C945C607C2CEBF9ABC6BB941B61D),
    .INIT_08(256'h20421C9518EC154711A50E080A6E06D90347FFBAFC31F8ACF52BF1AFEE37EAC4),
    .INIT_09(256'h5CD758F7551A51404D68499345C141F33E273A5F369A32D82F192B5E27A723F3),
    .INIT_0A(256'h9C179814941390138C16881A842080287C32783F744D705E6C716887649F60BA),
    .INIT_0B(256'hDCF9D8E4D4CFD0BBCCA8C896C484C074BC65B856B449B03DAC33A82AA422A01C),
    .INIT_0C(256'h000000000000000000000000000000000000000000000000ED53E93CE525E10F),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h309F2C8B28772462204C1C36181F14080FF10BD907C103A9FF91FB79F762F34A),
    .INIT_21(256'h71406D416940653D61395D34592C5524511A4D0E490144F440E53CD538C334B1),
    .INIT_22(256'hB007AC2DA851A472A0909CAC98C594DB90EF8D018910851D81287D317938753D),
    .INIT_23(256'hEBEDE849E4A2E0F6DD47D994D5DED224CE66CAA5C6E1C31ABF50BB82B7B1B3DD),
    .INIT_24(256'h23F9209A1D3619CD166012EE0F780BFD087E04FA0172FDE7FA56F6C2F32AEF8E),
    .INIT_25(256'h573F543351214E094AEC47CA44A241753E433B0B37CE348D31462DFA2AA92754),
    .INIT_26(256'h84E9823C7F897CCF7A10774A747E71AC6ED46BF669126628633860425D475A46),
    .INIT_27(256'hAC37A9F5A7ACA55CA306A0A89E449BD8996696EE946E91E88F5C8CC98A2F878F),
    .INIT_28(256'hCC86CAB9C8E3C707C522C337C144BF4ABD48BB3FB92FB717B4F9B2D3B0A6AE72),
    .INIT_29(256'hE54EE3FCE2A3E141DFD7DE66DCECDB6BD9E2D852D6B9D519D372D1C2D00BCE4C),
    .INIT_2A(256'hF628F557F47EF39DF2B4F1C3F0C9EFC8EEBEEDACEC92EB70EA46E914E7DAE698),
    .INIT_2B(256'hFECCFE81FE2CFDD0FD6BFCFEFC88FC0AFB84FAF5FA5FF9BFF918F868F7B0F6F0),
    .INIT_2C(256'h000000000000000000000000000000000000000000000000FFA8FF7EFF4BFF10),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q1_reg
       (.ADDRARDADDR({1'b0,1'b0,q1_reg_i_1__5_n_0,q1_reg_i_2__5_n_0,q1_reg_i_3__5_n_0,q1_reg_i_4__5_n_0,q1_reg_i_5__5_n_0,q1_reg_i_6__5_n_0,q1_reg_i_7__5_n_0,q1_reg_i_8__5_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q1_reg_i_1__5_n_0,q1_reg_i_2__5_n_0,q1_reg_i_3__5_n_0,q1_reg_i_4__5_n_0,q1_reg_i_5__5_n_0,q1_reg_i_6__5_n_0,q1_reg_i_7__5_n_0,q1_reg_i_8__5_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q1_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q1_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q1_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q1_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_14_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_14_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_14_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_14_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h03FFAAAAFC00AAAA))
    q1_reg_i_1__5
       (.I0(tmp_13_reg_1649[7]),
        .I1(add_ln1353_12_reg_1632[6]),
        .I2(q1_reg_i_9__5_n_0),
        .I3(add_ln1353_12_reg_1632[7]),
        .I4(icmp_ln895_14_reg_1644),
        .I5(add_ln1353_12_reg_1632[8]),
        .O(q1_reg_i_1__5_n_0));
  LUT5 #(
    .INIT(32'h03AAFCAA))
    q1_reg_i_2__5
       (.I0(tmp_13_reg_1649[6]),
        .I1(q1_reg_i_9__5_n_0),
        .I2(add_ln1353_12_reg_1632[6]),
        .I3(icmp_ln895_14_reg_1644),
        .I4(add_ln1353_12_reg_1632[7]),
        .O(q1_reg_i_2__5_n_0));
  LUT6 #(
    .INIT(64'hFFFCAAAA0003AAAA))
    q1_reg_i_3__5
       (.I0(tmp_13_reg_1649[5]),
        .I1(add_ln1353_12_reg_1632[4]),
        .I2(add_ln1353_12_reg_1632[5]),
        .I3(add_ln1353_12_reg_1632[3]),
        .I4(icmp_ln895_14_reg_1644),
        .I5(add_ln1353_12_reg_1632[6]),
        .O(q1_reg_i_3__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *)
  LUT5 #(
    .INIT(32'hF0C3AAAA))
    q1_reg_i_4__5
       (.I0(tmp_13_reg_1649[4]),
        .I1(add_ln1353_12_reg_1632[4]),
        .I2(add_ln1353_12_reg_1632[5]),
        .I3(add_ln1353_12_reg_1632[3]),
        .I4(icmp_ln895_14_reg_1644),
        .O(q1_reg_i_4__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *)
  LUT4 #(
    .INIT(16'hE22E))
    q1_reg_i_5__5
       (.I0(tmp_13_reg_1649[3]),
        .I1(icmp_ln895_14_reg_1644),
        .I2(add_ln1353_12_reg_1632[3]),
        .I3(add_ln1353_12_reg_1632[4]),
        .O(q1_reg_i_5__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *)
  LUT3 #(
    .INIT(8'h74))
    q1_reg_i_6__5
       (.I0(add_ln1353_12_reg_1632[3]),
        .I1(icmp_ln895_14_reg_1644),
        .I2(tmp_13_reg_1649[2]),
        .O(q1_reg_i_6__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *)
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_7__5
       (.I0(add_ln1353_12_reg_1632[2]),
        .I1(icmp_ln895_14_reg_1644),
        .I2(tmp_13_reg_1649[1]),
        .O(q1_reg_i_7__5_n_0));
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_8__5
       (.I0(add_ln1353_12_reg_1632[1]),
        .I1(icmp_ln895_14_reg_1644),
        .I2(tmp_13_reg_1649[0]),
        .O(q1_reg_i_8__5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *)
  LUT3 #(
    .INIT(8'hFE))
    q1_reg_i_9__5
       (.I0(add_ln1353_12_reg_1632[4]),
        .I1(add_ln1353_12_reg_1632[5]),
        .I2(add_ln1353_12_reg_1632[3]),
        .O(q1_reg_i_9__5_n_0));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_lutibs" *)
module hls_get_trig_vals_get_trig_vals_lutibs
   (hw_trig_vals_7_V,
    hw_trig_vals_15_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_14_reg_1654,
    tmp_15_reg_1671,
    icmp_ln895_15_reg_1666,
    add_ln1353_6_reg_1578,
    add_ln1353_2_reg_1534);
  output [35:0]hw_trig_vals_7_V;
  output [35:0]hw_trig_vals_15_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [10:0]add_ln1353_14_reg_1654;
  input [7:0]tmp_15_reg_1671;
  input icmp_ln895_15_reg_1666;
  input [0:0]add_ln1353_6_reg_1578;
  input [0:0]add_ln1353_2_reg_1534;

  wire [10:0]add_ln1353_14_reg_1654;
  wire [0:0]add_ln1353_2_reg_1534;
  wire [0:0]add_ln1353_6_reg_1578;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_15_V;
  wire [35:0]hw_trig_vals_7_V;
  wire icmp_ln895_15_reg_1666;
  wire [7:0]tmp_15_reg_1671;

  hls_get_trig_vals_get_trig_vals_lutibs_rom get_trig_vals_lutibs_rom_U
       (.add_ln1353_14_reg_1654(add_ln1353_14_reg_1654),
        .add_ln1353_2_reg_1534(add_ln1353_2_reg_1534),
        .add_ln1353_6_reg_1578(add_ln1353_6_reg_1578),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter3(ap_enable_reg_pp0_iter3),
        .ce1(ce1),
        .hw_trig_vals_15_V(hw_trig_vals_15_V),
        .hw_trig_vals_7_V(hw_trig_vals_7_V),
        .icmp_ln895_15_reg_1666(icmp_ln895_15_reg_1666),
        .tmp_15_reg_1671(tmp_15_reg_1671));
endmodule

(* ORIG_REF_NAME = "get_trig_vals_lutibs_rom" *)
module hls_get_trig_vals_get_trig_vals_lutibs_rom
   (hw_trig_vals_7_V,
    hw_trig_vals_15_V,
    ap_clk,
    ce1,
    ap_enable_reg_pp0_iter3,
    add_ln1353_14_reg_1654,
    tmp_15_reg_1671,
    icmp_ln895_15_reg_1666,
    add_ln1353_6_reg_1578,
    add_ln1353_2_reg_1534);
  output [35:0]hw_trig_vals_7_V;
  output [35:0]hw_trig_vals_15_V;
  input ap_clk;
  input ce1;
  input ap_enable_reg_pp0_iter3;
  input [10:0]add_ln1353_14_reg_1654;
  input [7:0]tmp_15_reg_1671;
  input icmp_ln895_15_reg_1666;
  input [0:0]add_ln1353_6_reg_1578;
  input [0:0]add_ln1353_2_reg_1534;

  wire [10:0]add_ln1353_14_reg_1654;
  wire [0:0]add_ln1353_2_reg_1534;
  wire [0:0]add_ln1353_6_reg_1578;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter3;
  wire ce1;
  wire [35:0]hw_trig_vals_15_V;
  wire [35:0]hw_trig_vals_7_V;
  wire icmp_ln895_15_reg_1666;
  wire q0_reg_i_10__6_n_0;
  wire q0_reg_i_11__6_n_0;
  wire q0_reg_i_12__6_n_0;
  wire q0_reg_i_13__6_n_0;
  wire q0_reg_i_1__6_n_0;
  wire q0_reg_i_2__6_n_0;
  wire q0_reg_i_3__6_n_0;
  wire q0_reg_i_4__6_n_0;
  wire q0_reg_i_5__6_n_0;
  wire q0_reg_i_6__6_n_0;
  wire q0_reg_i_7__6_n_0;
  wire q0_reg_i_8__6_n_0;
  wire q0_reg_i_9__6_n_0;
  wire q1_reg_i_1__6_n_0;
  wire q1_reg_i_2__6_n_0;
  wire q1_reg_i_3__6_n_0;
  wire q1_reg_i_4__6_n_0;
  wire q1_reg_i_5__6_n_0;
  wire q1_reg_i_6__6_n_0;
  wire q1_reg_i_7__6_n_0;
  wire q1_reg_i_8__6_n_0;
  wire q1_reg_i_9__6_n_0;
  wire [7:0]tmp_15_reg_1671;
  wire [15:0]NLW_q0_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q0_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPB_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q1_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q1_reg_CASDOUTPB_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_7_U/get_trig_vals_lutibs_rom_U/q0" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h555555555555555555555555555554000000000000000000000000000000003F),
    .INITP_05(256'h0000000000000000000000000000005555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h025C01FC01A40154010D00CE0097006900430026001100040000000400100025),
    .INIT_01(256'h0CCB0BE60B0A0A36096908A507EA0736068B05E8054E04BB043103B0033602C5),
    .INIT_02(256'h1F631DFD1CA01B4A19FD18B717791644151613F012D311BD10B00FAA0EAD0DB8),
    .INIT_03(256'h39D537F5361C344B328130BF2F052D522BA72A03286726D3254623C2224520D0),
    .INIT_04(256'h5BB45961571454CF5291505A4E2A4C0149DF47C445B143A441A03FA23DAC3BBD),
    .INIT_05(256'h847181B47EFE7C4F79A57702746671D06F406CB76A3567B9654462D6606E5E0E),
    .INIT_06(256'hB362B048AD33AA24A71BA417A1199E219B2E9842955B927A8F9F8CCB89FC8733),
    .INIT_07(256'hE7C3E458E0F2DD90DA34D6DCD389D03BCCF1C9ADC66EC334C000BCD0B9A6B681),
    .INIT_08(256'h20B81D0B196115BB12190E7B0AE1074B03B9002BFCA2F91CF59BF21EEEA6EB32),
    .INIT_09(256'h5D545973559651BB4DE34A0E463C426C3EA13AD8371233502F912BD5281D2469),
    .INIT_0A(256'h9C989894949390938C958899849F80A77CB178BD74CB70DC6CEF6904651C6137),
    .INIT_0B(256'hDD7CD966D552D13ECD2AC918C507C0F6BCE7B8D8B4CBB0BFACB4A8ABA4A3A09D),
    .INIT_0C(256'h000000000000000000000000000000000000000000000000EDD6E9BFE5A8E192),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h31212D0D28F924E420CF1CB918A2148B10740C5C0844042C0014FBFCF7E5F3CD),
    .INIT_21(256'h71BF6DC169C065BE61BA5DB459AD55A5519B4D904983457541673D5739463534),
    .INIT_22(256'hB082ACA9A8CDA4EEA10C9D2899429558916D8D7F898E859C81A77DB079B775BC),
    .INIT_23(256'hEC62E8BEE517E16CDDBDDA0AD655D29BCEDECB1EC75AC393BFC9BBFCB82BB458),
    .INIT_24(256'h246521061DA31A3A16CE135C0FE70C6C08EE056B01E4FE58FAC9F735F39DF001),
    .INIT_25(256'h57A0549451834E6C4B50482E450741DB3EA93B72383634F531AF2E642B1427BE),
    .INIT_26(256'h853E82927FE07D277A6877A374D872076F2F6C52696F6685639660A15DA75AA6),
    .INIT_27(256'hAC7FAA3EA7F6A5A7A351A0F49E919C2699B5973D94BF92398FAE8D1B8A8387E4),
    .INIT_28(256'hCCBFCAF3C91EC743C55FC375C183BF89BD89BB80B971B75BB53DB318B0ECAEB9),
    .INIT_29(256'hE578E427E2CEE16DE005DE94DD1CDB9CDA14D884D6EDD54ED3A7D1F8D042CE85),
    .INIT_2A(256'hF641F572F49AF3BAF2D2F1E2F0E9EFE9EEE0EDCFECB6EB95EA6CE93BE802E6C1),
    .INIT_2B(256'hFED5FE8BFE37FDDCFD78FD0CFC97FC1AFB95FB08FA72F9D4F92DF87FF7C8F709),
    .INIT_2C(256'h000000000000000000000000000000000000000000000000FFADFF84FF52FF18),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q0_reg
       (.ADDRARDADDR({1'b0,1'b0,q0_reg_i_1__6_n_0,q0_reg_i_2__6_n_0,q0_reg_i_3__6_n_0,q0_reg_i_4__6_n_0,q0_reg_i_5__6_n_0,q0_reg_i_6__6_n_0,q0_reg_i_7__6_n_0,q0_reg_i_8__6_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q0_reg_i_1__6_n_0,q0_reg_i_2__6_n_0,q0_reg_i_3__6_n_0,q0_reg_i_4__6_n_0,q0_reg_i_5__6_n_0,q0_reg_i_6__6_n_0,q0_reg_i_7__6_n_0,q0_reg_i_8__6_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q0_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q0_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q0_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q0_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_7_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_7_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_7_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_7_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair23" *)
  LUT3 #(
    .INIT(8'hE0))
    q0_reg_i_10__6
       (.I0(add_ln1353_14_reg_1654[2]),
        .I1(add_ln1353_14_reg_1654[1]),
        .I2(add_ln1353_14_reg_1654[3]),
        .O(q0_reg_i_10__6_n_0));
  LUT2 #(
    .INIT(4'hE))
    q0_reg_i_11__6
       (.I0(add_ln1353_14_reg_1654[5]),
        .I1(add_ln1353_14_reg_1654[4]),
        .O(q0_reg_i_11__6_n_0));
  LUT5 #(
    .INIT(32'hFFFEFEFE))
    q0_reg_i_12__6
       (.I0(add_ln1353_14_reg_1654[5]),
        .I1(add_ln1353_14_reg_1654[4]),
        .I2(add_ln1353_14_reg_1654[6]),
        .I3(add_ln1353_14_reg_1654[2]),
        .I4(add_ln1353_14_reg_1654[3]),
        .O(q0_reg_i_12__6_n_0));
  LUT5 #(
    .INIT(32'h88888880))
    q0_reg_i_13__6
       (.I0(add_ln1353_14_reg_1654[1]),
        .I1(add_ln1353_14_reg_1654[3]),
        .I2(add_ln1353_6_reg_1578),
        .I3(add_ln1353_14_reg_1654[0]),
        .I4(add_ln1353_2_reg_1534),
        .O(q0_reg_i_13__6_n_0));
  LUT6 #(
    .INIT(64'h7777777F88888880))
    q0_reg_i_1__6
       (.I0(add_ln1353_14_reg_1654[7]),
        .I1(q0_reg_i_9__6_n_0),
        .I2(q0_reg_i_10__6_n_0),
        .I3(add_ln1353_14_reg_1654[6]),
        .I4(q0_reg_i_11__6_n_0),
        .I5(add_ln1353_14_reg_1654[8]),
        .O(q0_reg_i_1__6_n_0));
  LUT6 #(
    .INIT(64'h0001FFFFFFFE0000))
    q0_reg_i_2__6
       (.I0(add_ln1353_14_reg_1654[5]),
        .I1(add_ln1353_14_reg_1654[4]),
        .I2(add_ln1353_14_reg_1654[6]),
        .I3(q0_reg_i_10__6_n_0),
        .I4(q0_reg_i_9__6_n_0),
        .I5(add_ln1353_14_reg_1654[7]),
        .O(q0_reg_i_2__6_n_0));
  LUT6 #(
    .INIT(64'hEEEAFFFF11150000))
    q0_reg_i_3__6
       (.I0(q0_reg_i_11__6_n_0),
        .I1(add_ln1353_14_reg_1654[3]),
        .I2(add_ln1353_14_reg_1654[1]),
        .I3(add_ln1353_14_reg_1654[2]),
        .I4(q0_reg_i_9__6_n_0),
        .I5(add_ln1353_14_reg_1654[6]),
        .O(q0_reg_i_3__6_n_0));
  LUT6 #(
    .INIT(64'hA9A9A999AAAAAAAA))
    q0_reg_i_4__6
       (.I0(add_ln1353_14_reg_1654[5]),
        .I1(add_ln1353_14_reg_1654[4]),
        .I2(add_ln1353_14_reg_1654[3]),
        .I3(add_ln1353_14_reg_1654[1]),
        .I4(add_ln1353_14_reg_1654[2]),
        .I5(q0_reg_i_9__6_n_0),
        .O(q0_reg_i_4__6_n_0));
  LUT5 #(
    .INIT(32'h9995AAAA))
    q0_reg_i_5__6
       (.I0(add_ln1353_14_reg_1654[4]),
        .I1(add_ln1353_14_reg_1654[3]),
        .I2(add_ln1353_14_reg_1654[1]),
        .I3(add_ln1353_14_reg_1654[2]),
        .I4(q0_reg_i_9__6_n_0),
        .O(q0_reg_i_5__6_n_0));
  LUT4 #(
    .INIT(16'h57A8))
    q0_reg_i_6__6
       (.I0(q0_reg_i_9__6_n_0),
        .I1(add_ln1353_14_reg_1654[1]),
        .I2(add_ln1353_14_reg_1654[2]),
        .I3(add_ln1353_14_reg_1654[3]),
        .O(q0_reg_i_6__6_n_0));
  LUT3 #(
    .INIT(8'h9C))
    q0_reg_i_7__6
       (.I0(add_ln1353_14_reg_1654[1]),
        .I1(add_ln1353_14_reg_1654[2]),
        .I2(q0_reg_i_9__6_n_0),
        .O(q0_reg_i_7__6_n_0));
  LUT2 #(
    .INIT(4'h6))
    q0_reg_i_8__6
       (.I0(q0_reg_i_9__6_n_0),
        .I1(add_ln1353_14_reg_1654[1]),
        .O(q0_reg_i_8__6_n_0));
  LUT6 #(
    .INIT(64'hFFFEEEEEEEEEEEEE))
    q0_reg_i_9__6
       (.I0(add_ln1353_14_reg_1654[10]),
        .I1(add_ln1353_14_reg_1654[9]),
        .I2(q0_reg_i_12__6_n_0),
        .I3(q0_reg_i_13__6_n_0),
        .I4(add_ln1353_14_reg_1654[7]),
        .I5(add_ln1353_14_reg_1654[8]),
        .O(q0_reg_i_9__6_n_0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *)
  (* METHODOLOGY_DRC_VIOS = "" *)
  (* OPT_MODIFIED = "MLO" *)
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *)
  (* RTL_RAM_BITS = "9216" *)
  (* RTL_RAM_NAME = "lut_tables_7_U/get_trig_vals_lutibs_rom_U/q1" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "255" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  (* ram_addr_begin = "0" *)
  (* ram_addr_end = "255" *)
  (* ram_ext_slice_begin = "18" *)
  (* ram_ext_slice_end = "35" *)
  (* ram_offset = "0" *)
  (* ram_slice_begin = "0" *)
  (* ram_slice_end = "17" *)
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA),
    .INITP_01(256'h000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAA),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h555555555555555555555555555554000000000000000000000000000000003F),
    .INITP_05(256'h0000000000000000000000000000005555555555555555555555555555555555),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h025C01FC01A40154010D00CE0097006900430026001100040000000400100025),
    .INIT_01(256'h0CCB0BE60B0A0A36096908A507EA0736068B05E8054E04BB043103B0033602C5),
    .INIT_02(256'h1F631DFD1CA01B4A19FD18B717791644151613F012D311BD10B00FAA0EAD0DB8),
    .INIT_03(256'h39D537F5361C344B328130BF2F052D522BA72A03286726D3254623C2224520D0),
    .INIT_04(256'h5BB45961571454CF5291505A4E2A4C0149DF47C445B143A441A03FA23DAC3BBD),
    .INIT_05(256'h847181B47EFE7C4F79A57702746671D06F406CB76A3567B9654462D6606E5E0E),
    .INIT_06(256'hB362B048AD33AA24A71BA417A1199E219B2E9842955B927A8F9F8CCB89FC8733),
    .INIT_07(256'hE7C3E458E0F2DD90DA34D6DCD389D03BCCF1C9ADC66EC334C000BCD0B9A6B681),
    .INIT_08(256'h20B81D0B196115BB12190E7B0AE1074B03B9002BFCA2F91CF59BF21EEEA6EB32),
    .INIT_09(256'h5D545973559651BB4DE34A0E463C426C3EA13AD8371233502F912BD5281D2469),
    .INIT_0A(256'h9C989894949390938C958899849F80A77CB178BD74CB70DC6CEF6904651C6137),
    .INIT_0B(256'hDD7CD966D552D13ECD2AC918C507C0F6BCE7B8D8B4CBB0BFACB4A8ABA4A3A09D),
    .INIT_0C(256'h000000000000000000000000000000000000000000000000EDD6E9BFE5A8E192),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h31212D0D28F924E420CF1CB918A2148B10740C5C0844042C0014FBFCF7E5F3CD),
    .INIT_21(256'h71BF6DC169C065BE61BA5DB459AD55A5519B4D904983457541673D5739463534),
    .INIT_22(256'hB082ACA9A8CDA4EEA10C9D2899429558916D8D7F898E859C81A77DB079B775BC),
    .INIT_23(256'hEC62E8BEE517E16CDDBDDA0AD655D29BCEDECB1EC75AC393BFC9BBFCB82BB458),
    .INIT_24(256'h246521061DA31A3A16CE135C0FE70C6C08EE056B01E4FE58FAC9F735F39DF001),
    .INIT_25(256'h57A0549451834E6C4B50482E450741DB3EA93B72383634F531AF2E642B1427BE),
    .INIT_26(256'h853E82927FE07D277A6877A374D872076F2F6C52696F6685639660A15DA75AA6),
    .INIT_27(256'hAC7FAA3EA7F6A5A7A351A0F49E919C2699B5973D94BF92398FAE8D1B8A8387E4),
    .INIT_28(256'hCCBFCAF3C91EC743C55FC375C183BF89BD89BB80B971B75BB53DB318B0ECAEB9),
    .INIT_29(256'hE578E427E2CEE16DE005DE94DD1CDB9CDA14D884D6EDD54ED3A7D1F8D042CE85),
    .INIT_2A(256'hF641F572F49AF3BAF2D2F1E2F0E9EFE9EEE0EDCFECB6EB95EA6CE93BE802E6C1),
    .INIT_2B(256'hFED5FE8BFE37FDDCFD78FD0CFC97FC1AFB95FB08FA72F9D4F92DF87FF7C8F709),
    .INIT_2C(256'h000000000000000000000000000000000000000000000000FFADFF84FF52FF18),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    q1_reg
       (.ADDRARDADDR({1'b0,1'b0,q1_reg_i_1__6_n_0,q1_reg_i_2__6_n_0,q1_reg_i_3__6_n_0,q1_reg_i_4__6_n_0,q1_reg_i_5__6_n_0,q1_reg_i_6__6_n_0,q1_reg_i_7__6_n_0,q1_reg_i_8__6_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b0,q1_reg_i_1__6_n_0,q1_reg_i_2__6_n_0,q1_reg_i_3__6_n_0,q1_reg_i_4__6_n_0,q1_reg_i_5__6_n_0,q1_reg_i_6__6_n_0,q1_reg_i_7__6_n_0,q1_reg_i_8__6_n_0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b0),
        .ADDRENB(1'b0),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(NLW_q1_reg_CASDOUTA_UNCONNECTED[15:0]),
        .CASDOUTB(NLW_q1_reg_CASDOUTB_UNCONNECTED[15:0]),
        .CASDOUTPA(NLW_q1_reg_CASDOUTPA_UNCONNECTED[1:0]),
        .CASDOUTPB(NLW_q1_reg_CASDOUTPB_UNCONNECTED[1:0]),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CLKARDCLK(ap_clk),
        .CLKBWRCLK(ap_clk),
        .DINADIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b1,1'b1}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT(hw_trig_vals_15_V[15:0]),
        .DOUTBDOUT(hw_trig_vals_15_V[33:18]),
        .DOUTPADOUTP(hw_trig_vals_15_V[17:16]),
        .DOUTPBDOUTP(hw_trig_vals_15_V[35:34]),
        .ENARDEN(ce1),
        .ENBWREN(ce1),
        .REGCEAREGCE(ap_enable_reg_pp0_iter3),
        .REGCEB(ap_enable_reg_pp0_iter3),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h03FFAAAAFC00AAAA))
    q1_reg_i_1__6
       (.I0(tmp_15_reg_1671[7]),
        .I1(add_ln1353_14_reg_1654[6]),
        .I2(q1_reg_i_9__6_n_0),
        .I3(add_ln1353_14_reg_1654[7]),
        .I4(icmp_ln895_15_reg_1666),
        .I5(add_ln1353_14_reg_1654[8]),
        .O(q1_reg_i_1__6_n_0));
  LUT5 #(
    .INIT(32'h03AAFCAA))
    q1_reg_i_2__6
       (.I0(tmp_15_reg_1671[6]),
        .I1(q1_reg_i_9__6_n_0),
        .I2(add_ln1353_14_reg_1654[6]),
        .I3(icmp_ln895_15_reg_1666),
        .I4(add_ln1353_14_reg_1654[7]),
        .O(q1_reg_i_2__6_n_0));
  LUT6 #(
    .INIT(64'hFFFCAAAA0003AAAA))
    q1_reg_i_3__6
       (.I0(tmp_15_reg_1671[5]),
        .I1(add_ln1353_14_reg_1654[4]),
        .I2(add_ln1353_14_reg_1654[5]),
        .I3(add_ln1353_14_reg_1654[3]),
        .I4(icmp_ln895_15_reg_1666),
        .I5(add_ln1353_14_reg_1654[6]),
        .O(q1_reg_i_3__6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *)
  LUT5 #(
    .INIT(32'hF0C3AAAA))
    q1_reg_i_4__6
       (.I0(tmp_15_reg_1671[4]),
        .I1(add_ln1353_14_reg_1654[4]),
        .I2(add_ln1353_14_reg_1654[5]),
        .I3(add_ln1353_14_reg_1654[3]),
        .I4(icmp_ln895_15_reg_1666),
        .O(q1_reg_i_4__6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *)
  LUT4 #(
    .INIT(16'hE22E))
    q1_reg_i_5__6
       (.I0(tmp_15_reg_1671[3]),
        .I1(icmp_ln895_15_reg_1666),
        .I2(add_ln1353_14_reg_1654[3]),
        .I3(add_ln1353_14_reg_1654[4]),
        .O(q1_reg_i_5__6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *)
  LUT3 #(
    .INIT(8'h74))
    q1_reg_i_6__6
       (.I0(add_ln1353_14_reg_1654[3]),
        .I1(icmp_ln895_15_reg_1666),
        .I2(tmp_15_reg_1671[2]),
        .O(q1_reg_i_6__6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *)
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_7__6
       (.I0(add_ln1353_14_reg_1654[2]),
        .I1(icmp_ln895_15_reg_1666),
        .I2(tmp_15_reg_1671[1]),
        .O(q1_reg_i_7__6_n_0));
  LUT3 #(
    .INIT(8'hB8))
    q1_reg_i_8__6
       (.I0(add_ln1353_14_reg_1654[1]),
        .I1(icmp_ln895_15_reg_1666),
        .I2(tmp_15_reg_1671[0]),
        .O(q1_reg_i_8__6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *)
  LUT3 #(
    .INIT(8'hFE))
    q1_reg_i_9__6
       (.I0(add_ln1353_14_reg_1654[4]),
        .I1(add_ln1353_14_reg_1654[5]),
        .I2(add_ln1353_14_reg_1654[3]),
        .O(q1_reg_i_9__6_n_0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
