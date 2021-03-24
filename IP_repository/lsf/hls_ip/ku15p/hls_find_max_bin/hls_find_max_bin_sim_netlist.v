// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Sat Mar 20 09:19:40 2021
// Host        : uciatlaslab.ps.uci.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode funcsim
//               /home/psundara/L0MDT/psundara/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_find_max_bin/hls_find_max_bin_sim_netlist.v
// Design      : hls_find_max_bin
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "hls_find_max_bin,find_max_bin,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "HLS" *)
(* x_core_info = "find_max_bin,Vivado 2019.2.1" *)
(* NotValidForBitStream *)
module hls_find_max_bin
   (hls_LT_theta_global_V_ap_vld,
    hls_LT_r_global_V_ap_vld,
    hls_LT_theta_V_ap_vld,
    hls_LT_r_V_ap_vld,
    res_max_bin_count_V_ap_vld,
    res_max_bin_theta_V_ap_vld,
    res_max_bin_r_V_ap_vld,
    ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    slcvec_angle_polar_offset_mrad_V,
    roi_seed_r_V,
    max_bin_count_0_V,
    max_bin_count_1_V,
    max_bin_count_2_V,
    max_bin_count_3_V,
    max_bin_count_4_V,
    max_bin_count_5_V,
    max_bin_count_6_V,
    max_bin_count_7_V,
    max_bin_count_8_V,
    max_bin_count_9_V,
    max_bin_count_10_V,
    max_bin_count_11_V,
    max_bin_count_12_V,
    max_bin_count_13_V,
    max_bin_count_14_V,
    max_bin_count_15_V,
    max_bin_count_16_V,
    max_bin_count_17_V,
    max_bin_count_18_V,
    max_bin_count_19_V,
    max_bin_count_20_V,
    max_bin_count_21_V,
    max_bin_count_22_V,
    max_bin_count_23_V,
    max_bin_count_24_V,
    max_bin_count_25_V,
    max_bin_count_26_V,
    max_bin_count_27_V,
    max_bin_count_28_V,
    max_bin_count_29_V,
    max_bin_count_30_V,
    max_bin_count_31_V,
    max_bin_count_32_V,
    max_bin_count_33_V,
    max_bin_count_34_V,
    max_bin_count_35_V,
    max_bin_count_36_V,
    max_bin_count_37_V,
    max_bin_count_38_V,
    max_bin_count_39_V,
    max_bin_count_40_V,
    max_bin_count_41_V,
    max_bin_count_42_V,
    max_bin_count_43_V,
    max_bin_count_44_V,
    max_bin_count_45_V,
    max_bin_count_46_V,
    max_bin_count_47_V,
    max_bin_count_48_V,
    max_bin_count_49_V,
    max_bin_count_50_V,
    max_bin_count_51_V,
    max_bin_count_52_V,
    max_bin_count_53_V,
    max_bin_count_54_V,
    max_bin_count_55_V,
    max_bin_count_56_V,
    max_bin_count_57_V,
    max_bin_count_58_V,
    max_bin_count_59_V,
    max_bin_count_60_V,
    max_bin_count_61_V,
    max_bin_count_62_V,
    max_bin_count_63_V,
    max_bin_r_0_V,
    max_bin_r_1_V,
    max_bin_r_2_V,
    max_bin_r_3_V,
    max_bin_r_4_V,
    max_bin_r_5_V,
    max_bin_r_6_V,
    max_bin_r_7_V,
    max_bin_r_8_V,
    max_bin_r_9_V,
    max_bin_r_10_V,
    max_bin_r_11_V,
    max_bin_r_12_V,
    max_bin_r_13_V,
    max_bin_r_14_V,
    max_bin_r_15_V,
    max_bin_r_16_V,
    max_bin_r_17_V,
    max_bin_r_18_V,
    max_bin_r_19_V,
    max_bin_r_20_V,
    max_bin_r_21_V,
    max_bin_r_22_V,
    max_bin_r_23_V,
    max_bin_r_24_V,
    max_bin_r_25_V,
    max_bin_r_26_V,
    max_bin_r_27_V,
    max_bin_r_28_V,
    max_bin_r_29_V,
    max_bin_r_30_V,
    max_bin_r_31_V,
    max_bin_r_32_V,
    max_bin_r_33_V,
    max_bin_r_34_V,
    max_bin_r_35_V,
    max_bin_r_36_V,
    max_bin_r_37_V,
    max_bin_r_38_V,
    max_bin_r_39_V,
    max_bin_r_40_V,
    max_bin_r_41_V,
    max_bin_r_42_V,
    max_bin_r_43_V,
    max_bin_r_44_V,
    max_bin_r_45_V,
    max_bin_r_46_V,
    max_bin_r_47_V,
    max_bin_r_48_V,
    max_bin_r_49_V,
    max_bin_r_50_V,
    max_bin_r_51_V,
    max_bin_r_52_V,
    max_bin_r_53_V,
    max_bin_r_54_V,
    max_bin_r_55_V,
    max_bin_r_56_V,
    max_bin_r_57_V,
    max_bin_r_58_V,
    max_bin_r_59_V,
    max_bin_r_60_V,
    max_bin_r_61_V,
    max_bin_r_62_V,
    max_bin_r_63_V,
    hls_LT_theta_global_V,
    hls_LT_r_global_V,
    hls_LT_theta_V,
    hls_LT_r_V,
    res_max_bin_count_V,
    res_max_bin_theta_V,
    res_max_bin_r_V);
  output hls_LT_theta_global_V_ap_vld;
  output hls_LT_r_global_V_ap_vld;
  output hls_LT_theta_V_ap_vld;
  output hls_LT_r_V_ap_vld;
  output res_max_bin_count_V_ap_vld;
  output res_max_bin_theta_V_ap_vld;
  output res_max_bin_r_V_ap_vld;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input ap_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ap_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input ap_rst;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) input ap_start;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* x_interface_info = "xilinx.com:signal:data:1.0 slcvec_angle_polar_offset_mrad_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME slcvec_angle_polar_offset_mrad_V, LAYERED_METADATA undef" *) input [13:0]slcvec_angle_polar_offset_mrad_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 roi_seed_r_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME roi_seed_r_V, LAYERED_METADATA undef" *) input [21:0]roi_seed_r_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_0_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_0_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_0_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_1_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_1_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_1_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_2_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_2_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_2_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_3_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_3_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_3_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_4_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_4_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_4_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_5_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_5_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_5_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_6_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_6_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_6_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_7_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_7_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_7_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_8_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_8_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_8_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_9_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_9_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_9_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_10_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_10_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_10_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_11_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_11_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_11_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_12_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_12_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_12_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_13_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_13_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_13_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_14_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_14_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_14_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_15_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_15_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_15_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_16_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_16_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_16_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_17_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_17_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_17_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_18_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_18_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_18_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_19_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_19_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_19_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_20_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_20_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_20_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_21_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_21_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_21_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_22_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_22_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_22_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_23_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_23_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_23_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_24_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_24_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_24_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_25_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_25_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_25_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_26_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_26_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_26_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_27_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_27_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_27_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_28_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_28_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_28_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_29_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_29_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_29_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_30_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_30_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_30_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_31_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_31_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_31_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_32_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_32_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_32_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_33_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_33_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_33_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_34_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_34_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_34_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_35_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_35_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_35_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_36_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_36_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_36_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_37_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_37_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_37_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_38_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_38_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_38_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_39_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_39_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_39_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_40_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_40_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_40_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_41_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_41_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_41_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_42_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_42_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_42_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_43_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_43_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_43_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_44_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_44_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_44_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_45_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_45_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_45_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_46_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_46_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_46_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_47_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_47_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_47_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_48_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_48_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_48_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_49_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_49_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_49_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_50_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_50_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_50_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_51_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_51_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_51_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_52_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_52_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_52_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_53_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_53_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_53_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_54_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_54_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_54_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_55_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_55_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_55_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_56_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_56_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_56_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_57_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_57_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_57_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_58_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_58_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_58_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_59_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_59_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_59_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_60_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_60_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_60_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_61_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_61_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_61_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_62_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_62_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_62_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_count_63_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_count_63_V, LAYERED_METADATA undef" *) input [3:0]max_bin_count_63_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_0_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_0_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_0_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_1_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_1_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_1_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_2_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_2_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_2_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_3_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_3_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_3_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_4_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_4_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_4_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_5_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_5_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_5_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_6_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_6_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_6_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_7_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_7_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_7_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_8_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_8_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_8_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_9_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_9_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_9_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_10_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_10_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_10_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_11_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_11_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_11_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_12_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_12_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_12_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_13_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_13_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_13_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_14_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_14_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_14_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_15_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_15_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_15_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_16_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_16_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_16_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_17_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_17_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_17_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_18_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_18_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_18_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_19_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_19_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_19_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_20_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_20_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_20_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_21_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_21_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_21_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_22_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_22_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_22_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_23_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_23_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_23_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_24_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_24_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_24_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_25_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_25_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_25_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_26_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_26_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_26_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_27_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_27_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_27_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_28_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_28_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_28_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_29_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_29_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_29_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_30_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_30_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_30_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_31_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_31_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_31_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_32_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_32_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_32_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_33_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_33_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_33_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_34_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_34_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_34_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_35_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_35_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_35_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_36_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_36_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_36_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_37_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_37_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_37_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_38_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_38_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_38_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_39_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_39_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_39_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_40_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_40_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_40_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_41_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_41_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_41_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_42_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_42_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_42_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_43_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_43_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_43_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_44_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_44_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_44_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_45_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_45_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_45_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_46_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_46_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_46_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_47_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_47_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_47_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_48_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_48_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_48_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_49_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_49_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_49_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_50_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_50_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_50_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_51_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_51_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_51_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_52_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_52_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_52_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_53_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_53_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_53_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_54_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_54_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_54_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_55_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_55_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_55_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_56_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_56_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_56_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_57_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_57_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_57_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_58_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_58_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_58_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_59_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_59_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_59_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_60_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_60_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_60_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_61_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_61_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_61_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_62_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_62_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_62_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 max_bin_r_63_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME max_bin_r_63_V, LAYERED_METADATA undef" *) input [6:0]max_bin_r_63_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hls_LT_theta_global_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hls_LT_theta_global_V, LAYERED_METADATA undef" *) output [13:0]hls_LT_theta_global_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hls_LT_r_global_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hls_LT_r_global_V, LAYERED_METADATA undef" *) output [21:0]hls_LT_r_global_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hls_LT_theta_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hls_LT_theta_V, LAYERED_METADATA undef" *) output [13:0]hls_LT_theta_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hls_LT_r_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hls_LT_r_V, LAYERED_METADATA undef" *) output [21:0]hls_LT_r_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 res_max_bin_count_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME res_max_bin_count_V, LAYERED_METADATA undef" *) output [3:0]res_max_bin_count_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 res_max_bin_theta_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME res_max_bin_theta_V, LAYERED_METADATA undef" *) output [6:0]res_max_bin_theta_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 res_max_bin_r_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME res_max_bin_r_V, LAYERED_METADATA undef" *) output [6:0]res_max_bin_r_V;

  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst;
  wire ap_start;
  wire [21:0]hls_LT_r_V;
  wire hls_LT_r_V_ap_vld;
  wire [21:0]hls_LT_r_global_V;
  wire hls_LT_r_global_V_ap_vld;
  wire [13:0]hls_LT_theta_V;
  wire hls_LT_theta_V_ap_vld;
  wire [13:0]hls_LT_theta_global_V;
  wire hls_LT_theta_global_V_ap_vld;
  wire [3:0]max_bin_count_0_V;
  wire [3:0]max_bin_count_10_V;
  wire [3:0]max_bin_count_11_V;
  wire [3:0]max_bin_count_12_V;
  wire [3:0]max_bin_count_13_V;
  wire [3:0]max_bin_count_14_V;
  wire [3:0]max_bin_count_15_V;
  wire [3:0]max_bin_count_16_V;
  wire [3:0]max_bin_count_17_V;
  wire [3:0]max_bin_count_18_V;
  wire [3:0]max_bin_count_19_V;
  wire [3:0]max_bin_count_1_V;
  wire [3:0]max_bin_count_20_V;
  wire [3:0]max_bin_count_21_V;
  wire [3:0]max_bin_count_22_V;
  wire [3:0]max_bin_count_23_V;
  wire [3:0]max_bin_count_24_V;
  wire [3:0]max_bin_count_25_V;
  wire [3:0]max_bin_count_26_V;
  wire [3:0]max_bin_count_27_V;
  wire [3:0]max_bin_count_28_V;
  wire [3:0]max_bin_count_29_V;
  wire [3:0]max_bin_count_2_V;
  wire [3:0]max_bin_count_30_V;
  wire [3:0]max_bin_count_31_V;
  wire [3:0]max_bin_count_32_V;
  wire [3:0]max_bin_count_33_V;
  wire [3:0]max_bin_count_34_V;
  wire [3:0]max_bin_count_35_V;
  wire [3:0]max_bin_count_36_V;
  wire [3:0]max_bin_count_37_V;
  wire [3:0]max_bin_count_38_V;
  wire [3:0]max_bin_count_39_V;
  wire [3:0]max_bin_count_3_V;
  wire [3:0]max_bin_count_40_V;
  wire [3:0]max_bin_count_41_V;
  wire [3:0]max_bin_count_42_V;
  wire [3:0]max_bin_count_43_V;
  wire [3:0]max_bin_count_44_V;
  wire [3:0]max_bin_count_45_V;
  wire [3:0]max_bin_count_46_V;
  wire [3:0]max_bin_count_47_V;
  wire [3:0]max_bin_count_48_V;
  wire [3:0]max_bin_count_49_V;
  wire [3:0]max_bin_count_4_V;
  wire [3:0]max_bin_count_50_V;
  wire [3:0]max_bin_count_51_V;
  wire [3:0]max_bin_count_52_V;
  wire [3:0]max_bin_count_53_V;
  wire [3:0]max_bin_count_54_V;
  wire [3:0]max_bin_count_55_V;
  wire [3:0]max_bin_count_56_V;
  wire [3:0]max_bin_count_57_V;
  wire [3:0]max_bin_count_58_V;
  wire [3:0]max_bin_count_59_V;
  wire [3:0]max_bin_count_5_V;
  wire [3:0]max_bin_count_60_V;
  wire [3:0]max_bin_count_61_V;
  wire [3:0]max_bin_count_62_V;
  wire [3:0]max_bin_count_63_V;
  wire [3:0]max_bin_count_6_V;
  wire [3:0]max_bin_count_7_V;
  wire [3:0]max_bin_count_8_V;
  wire [3:0]max_bin_count_9_V;
  wire [6:0]max_bin_r_0_V;
  wire [6:0]max_bin_r_10_V;
  wire [6:0]max_bin_r_11_V;
  wire [6:0]max_bin_r_12_V;
  wire [6:0]max_bin_r_13_V;
  wire [6:0]max_bin_r_14_V;
  wire [6:0]max_bin_r_15_V;
  wire [6:0]max_bin_r_16_V;
  wire [6:0]max_bin_r_17_V;
  wire [6:0]max_bin_r_18_V;
  wire [6:0]max_bin_r_19_V;
  wire [6:0]max_bin_r_1_V;
  wire [6:0]max_bin_r_20_V;
  wire [6:0]max_bin_r_21_V;
  wire [6:0]max_bin_r_22_V;
  wire [6:0]max_bin_r_23_V;
  wire [6:0]max_bin_r_24_V;
  wire [6:0]max_bin_r_25_V;
  wire [6:0]max_bin_r_26_V;
  wire [6:0]max_bin_r_27_V;
  wire [6:0]max_bin_r_28_V;
  wire [6:0]max_bin_r_29_V;
  wire [6:0]max_bin_r_2_V;
  wire [6:0]max_bin_r_30_V;
  wire [6:0]max_bin_r_31_V;
  wire [6:0]max_bin_r_32_V;
  wire [6:0]max_bin_r_33_V;
  wire [6:0]max_bin_r_34_V;
  wire [6:0]max_bin_r_35_V;
  wire [6:0]max_bin_r_36_V;
  wire [6:0]max_bin_r_37_V;
  wire [6:0]max_bin_r_38_V;
  wire [6:0]max_bin_r_39_V;
  wire [6:0]max_bin_r_3_V;
  wire [6:0]max_bin_r_40_V;
  wire [6:0]max_bin_r_41_V;
  wire [6:0]max_bin_r_42_V;
  wire [6:0]max_bin_r_43_V;
  wire [6:0]max_bin_r_44_V;
  wire [6:0]max_bin_r_45_V;
  wire [6:0]max_bin_r_46_V;
  wire [6:0]max_bin_r_47_V;
  wire [6:0]max_bin_r_48_V;
  wire [6:0]max_bin_r_49_V;
  wire [6:0]max_bin_r_4_V;
  wire [6:0]max_bin_r_50_V;
  wire [6:0]max_bin_r_51_V;
  wire [6:0]max_bin_r_52_V;
  wire [6:0]max_bin_r_53_V;
  wire [6:0]max_bin_r_54_V;
  wire [6:0]max_bin_r_55_V;
  wire [6:0]max_bin_r_56_V;
  wire [6:0]max_bin_r_57_V;
  wire [6:0]max_bin_r_58_V;
  wire [6:0]max_bin_r_59_V;
  wire [6:0]max_bin_r_5_V;
  wire [6:0]max_bin_r_60_V;
  wire [6:0]max_bin_r_61_V;
  wire [6:0]max_bin_r_62_V;
  wire [6:0]max_bin_r_63_V;
  wire [6:0]max_bin_r_6_V;
  wire [6:0]max_bin_r_7_V;
  wire [6:0]max_bin_r_8_V;
  wire [6:0]max_bin_r_9_V;
  wire [3:0]res_max_bin_count_V;
  wire res_max_bin_count_V_ap_vld;
  wire [6:0]res_max_bin_r_V;
  wire res_max_bin_r_V_ap_vld;
  wire [6:0]res_max_bin_theta_V;
  wire res_max_bin_theta_V_ap_vld;
  wire [21:0]roi_seed_r_V;
  wire [13:0]slcvec_angle_polar_offset_mrad_V;

  hls_find_max_bin_find_max_bin U0
       (.ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .hls_LT_r_V(hls_LT_r_V),
        .hls_LT_r_V_ap_vld(hls_LT_r_V_ap_vld),
        .hls_LT_r_global_V(hls_LT_r_global_V),
        .hls_LT_r_global_V_ap_vld(hls_LT_r_global_V_ap_vld),
        .hls_LT_theta_V(hls_LT_theta_V),
        .hls_LT_theta_V_ap_vld(hls_LT_theta_V_ap_vld),
        .hls_LT_theta_global_V(hls_LT_theta_global_V),
        .hls_LT_theta_global_V_ap_vld(hls_LT_theta_global_V_ap_vld),
        .max_bin_count_0_V(max_bin_count_0_V),
        .max_bin_count_10_V(max_bin_count_10_V),
        .max_bin_count_11_V(max_bin_count_11_V),
        .max_bin_count_12_V(max_bin_count_12_V),
        .max_bin_count_13_V(max_bin_count_13_V),
        .max_bin_count_14_V(max_bin_count_14_V),
        .max_bin_count_15_V(max_bin_count_15_V),
        .max_bin_count_16_V(max_bin_count_16_V),
        .max_bin_count_17_V(max_bin_count_17_V),
        .max_bin_count_18_V(max_bin_count_18_V),
        .max_bin_count_19_V(max_bin_count_19_V),
        .max_bin_count_1_V(max_bin_count_1_V),
        .max_bin_count_20_V(max_bin_count_20_V),
        .max_bin_count_21_V(max_bin_count_21_V),
        .max_bin_count_22_V(max_bin_count_22_V),
        .max_bin_count_23_V(max_bin_count_23_V),
        .max_bin_count_24_V(max_bin_count_24_V),
        .max_bin_count_25_V(max_bin_count_25_V),
        .max_bin_count_26_V(max_bin_count_26_V),
        .max_bin_count_27_V(max_bin_count_27_V),
        .max_bin_count_28_V(max_bin_count_28_V),
        .max_bin_count_29_V(max_bin_count_29_V),
        .max_bin_count_2_V(max_bin_count_2_V),
        .max_bin_count_30_V(max_bin_count_30_V),
        .max_bin_count_31_V(max_bin_count_31_V),
        .max_bin_count_32_V(max_bin_count_32_V),
        .max_bin_count_33_V(max_bin_count_33_V),
        .max_bin_count_34_V(max_bin_count_34_V),
        .max_bin_count_35_V(max_bin_count_35_V),
        .max_bin_count_36_V(max_bin_count_36_V),
        .max_bin_count_37_V(max_bin_count_37_V),
        .max_bin_count_38_V(max_bin_count_38_V),
        .max_bin_count_39_V(max_bin_count_39_V),
        .max_bin_count_3_V(max_bin_count_3_V),
        .max_bin_count_40_V(max_bin_count_40_V),
        .max_bin_count_41_V(max_bin_count_41_V),
        .max_bin_count_42_V(max_bin_count_42_V),
        .max_bin_count_43_V(max_bin_count_43_V),
        .max_bin_count_44_V(max_bin_count_44_V),
        .max_bin_count_45_V(max_bin_count_45_V),
        .max_bin_count_46_V(max_bin_count_46_V),
        .max_bin_count_47_V(max_bin_count_47_V),
        .max_bin_count_48_V(max_bin_count_48_V),
        .max_bin_count_49_V(max_bin_count_49_V),
        .max_bin_count_4_V(max_bin_count_4_V),
        .max_bin_count_50_V(max_bin_count_50_V),
        .max_bin_count_51_V(max_bin_count_51_V),
        .max_bin_count_52_V(max_bin_count_52_V),
        .max_bin_count_53_V(max_bin_count_53_V),
        .max_bin_count_54_V(max_bin_count_54_V),
        .max_bin_count_55_V(max_bin_count_55_V),
        .max_bin_count_56_V(max_bin_count_56_V),
        .max_bin_count_57_V(max_bin_count_57_V),
        .max_bin_count_58_V(max_bin_count_58_V),
        .max_bin_count_59_V(max_bin_count_59_V),
        .max_bin_count_5_V(max_bin_count_5_V),
        .max_bin_count_60_V(max_bin_count_60_V),
        .max_bin_count_61_V(max_bin_count_61_V),
        .max_bin_count_62_V(max_bin_count_62_V),
        .max_bin_count_63_V(max_bin_count_63_V),
        .max_bin_count_6_V(max_bin_count_6_V),
        .max_bin_count_7_V(max_bin_count_7_V),
        .max_bin_count_8_V(max_bin_count_8_V),
        .max_bin_count_9_V(max_bin_count_9_V),
        .max_bin_r_0_V(max_bin_r_0_V),
        .max_bin_r_10_V(max_bin_r_10_V),
        .max_bin_r_11_V(max_bin_r_11_V),
        .max_bin_r_12_V(max_bin_r_12_V),
        .max_bin_r_13_V(max_bin_r_13_V),
        .max_bin_r_14_V(max_bin_r_14_V),
        .max_bin_r_15_V(max_bin_r_15_V),
        .max_bin_r_16_V(max_bin_r_16_V),
        .max_bin_r_17_V(max_bin_r_17_V),
        .max_bin_r_18_V(max_bin_r_18_V),
        .max_bin_r_19_V(max_bin_r_19_V),
        .max_bin_r_1_V(max_bin_r_1_V),
        .max_bin_r_20_V(max_bin_r_20_V),
        .max_bin_r_21_V(max_bin_r_21_V),
        .max_bin_r_22_V(max_bin_r_22_V),
        .max_bin_r_23_V(max_bin_r_23_V),
        .max_bin_r_24_V(max_bin_r_24_V),
        .max_bin_r_25_V(max_bin_r_25_V),
        .max_bin_r_26_V(max_bin_r_26_V),
        .max_bin_r_27_V(max_bin_r_27_V),
        .max_bin_r_28_V(max_bin_r_28_V),
        .max_bin_r_29_V(max_bin_r_29_V),
        .max_bin_r_2_V(max_bin_r_2_V),
        .max_bin_r_30_V(max_bin_r_30_V),
        .max_bin_r_31_V(max_bin_r_31_V),
        .max_bin_r_32_V(max_bin_r_32_V),
        .max_bin_r_33_V(max_bin_r_33_V),
        .max_bin_r_34_V(max_bin_r_34_V),
        .max_bin_r_35_V(max_bin_r_35_V),
        .max_bin_r_36_V(max_bin_r_36_V),
        .max_bin_r_37_V(max_bin_r_37_V),
        .max_bin_r_38_V(max_bin_r_38_V),
        .max_bin_r_39_V(max_bin_r_39_V),
        .max_bin_r_3_V(max_bin_r_3_V),
        .max_bin_r_40_V(max_bin_r_40_V),
        .max_bin_r_41_V(max_bin_r_41_V),
        .max_bin_r_42_V(max_bin_r_42_V),
        .max_bin_r_43_V(max_bin_r_43_V),
        .max_bin_r_44_V(max_bin_r_44_V),
        .max_bin_r_45_V(max_bin_r_45_V),
        .max_bin_r_46_V(max_bin_r_46_V),
        .max_bin_r_47_V(max_bin_r_47_V),
        .max_bin_r_48_V(max_bin_r_48_V),
        .max_bin_r_49_V(max_bin_r_49_V),
        .max_bin_r_4_V(max_bin_r_4_V),
        .max_bin_r_50_V(max_bin_r_50_V),
        .max_bin_r_51_V(max_bin_r_51_V),
        .max_bin_r_52_V(max_bin_r_52_V),
        .max_bin_r_53_V(max_bin_r_53_V),
        .max_bin_r_54_V(max_bin_r_54_V),
        .max_bin_r_55_V(max_bin_r_55_V),
        .max_bin_r_56_V(max_bin_r_56_V),
        .max_bin_r_57_V(max_bin_r_57_V),
        .max_bin_r_58_V(max_bin_r_58_V),
        .max_bin_r_59_V(max_bin_r_59_V),
        .max_bin_r_5_V(max_bin_r_5_V),
        .max_bin_r_60_V(max_bin_r_60_V),
        .max_bin_r_61_V(max_bin_r_61_V),
        .max_bin_r_62_V(max_bin_r_62_V),
        .max_bin_r_63_V(max_bin_r_63_V),
        .max_bin_r_6_V(max_bin_r_6_V),
        .max_bin_r_7_V(max_bin_r_7_V),
        .max_bin_r_8_V(max_bin_r_8_V),
        .max_bin_r_9_V(max_bin_r_9_V),
        .res_max_bin_count_V(res_max_bin_count_V),
        .res_max_bin_count_V_ap_vld(res_max_bin_count_V_ap_vld),
        .res_max_bin_r_V(res_max_bin_r_V),
        .res_max_bin_r_V_ap_vld(res_max_bin_r_V_ap_vld),
        .res_max_bin_theta_V(res_max_bin_theta_V),
        .res_max_bin_theta_V_ap_vld(res_max_bin_theta_V_ap_vld),
        .roi_seed_r_V(roi_seed_r_V),
        .slcvec_angle_polar_offset_mrad_V(slcvec_angle_polar_offset_mrad_V));
endmodule

(* ORIG_REF_NAME = "find_max_bin" *)
module hls_find_max_bin_find_max_bin
   (ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    slcvec_angle_polar_offset_mrad_V,
    roi_seed_r_V,
    max_bin_count_0_V,
    max_bin_count_1_V,
    max_bin_count_2_V,
    max_bin_count_3_V,
    max_bin_count_4_V,
    max_bin_count_5_V,
    max_bin_count_6_V,
    max_bin_count_7_V,
    max_bin_count_8_V,
    max_bin_count_9_V,
    max_bin_count_10_V,
    max_bin_count_11_V,
    max_bin_count_12_V,
    max_bin_count_13_V,
    max_bin_count_14_V,
    max_bin_count_15_V,
    max_bin_count_16_V,
    max_bin_count_17_V,
    max_bin_count_18_V,
    max_bin_count_19_V,
    max_bin_count_20_V,
    max_bin_count_21_V,
    max_bin_count_22_V,
    max_bin_count_23_V,
    max_bin_count_24_V,
    max_bin_count_25_V,
    max_bin_count_26_V,
    max_bin_count_27_V,
    max_bin_count_28_V,
    max_bin_count_29_V,
    max_bin_count_30_V,
    max_bin_count_31_V,
    max_bin_count_32_V,
    max_bin_count_33_V,
    max_bin_count_34_V,
    max_bin_count_35_V,
    max_bin_count_36_V,
    max_bin_count_37_V,
    max_bin_count_38_V,
    max_bin_count_39_V,
    max_bin_count_40_V,
    max_bin_count_41_V,
    max_bin_count_42_V,
    max_bin_count_43_V,
    max_bin_count_44_V,
    max_bin_count_45_V,
    max_bin_count_46_V,
    max_bin_count_47_V,
    max_bin_count_48_V,
    max_bin_count_49_V,
    max_bin_count_50_V,
    max_bin_count_51_V,
    max_bin_count_52_V,
    max_bin_count_53_V,
    max_bin_count_54_V,
    max_bin_count_55_V,
    max_bin_count_56_V,
    max_bin_count_57_V,
    max_bin_count_58_V,
    max_bin_count_59_V,
    max_bin_count_60_V,
    max_bin_count_61_V,
    max_bin_count_62_V,
    max_bin_count_63_V,
    max_bin_r_0_V,
    max_bin_r_1_V,
    max_bin_r_2_V,
    max_bin_r_3_V,
    max_bin_r_4_V,
    max_bin_r_5_V,
    max_bin_r_6_V,
    max_bin_r_7_V,
    max_bin_r_8_V,
    max_bin_r_9_V,
    max_bin_r_10_V,
    max_bin_r_11_V,
    max_bin_r_12_V,
    max_bin_r_13_V,
    max_bin_r_14_V,
    max_bin_r_15_V,
    max_bin_r_16_V,
    max_bin_r_17_V,
    max_bin_r_18_V,
    max_bin_r_19_V,
    max_bin_r_20_V,
    max_bin_r_21_V,
    max_bin_r_22_V,
    max_bin_r_23_V,
    max_bin_r_24_V,
    max_bin_r_25_V,
    max_bin_r_26_V,
    max_bin_r_27_V,
    max_bin_r_28_V,
    max_bin_r_29_V,
    max_bin_r_30_V,
    max_bin_r_31_V,
    max_bin_r_32_V,
    max_bin_r_33_V,
    max_bin_r_34_V,
    max_bin_r_35_V,
    max_bin_r_36_V,
    max_bin_r_37_V,
    max_bin_r_38_V,
    max_bin_r_39_V,
    max_bin_r_40_V,
    max_bin_r_41_V,
    max_bin_r_42_V,
    max_bin_r_43_V,
    max_bin_r_44_V,
    max_bin_r_45_V,
    max_bin_r_46_V,
    max_bin_r_47_V,
    max_bin_r_48_V,
    max_bin_r_49_V,
    max_bin_r_50_V,
    max_bin_r_51_V,
    max_bin_r_52_V,
    max_bin_r_53_V,
    max_bin_r_54_V,
    max_bin_r_55_V,
    max_bin_r_56_V,
    max_bin_r_57_V,
    max_bin_r_58_V,
    max_bin_r_59_V,
    max_bin_r_60_V,
    max_bin_r_61_V,
    max_bin_r_62_V,
    max_bin_r_63_V,
    hls_LT_theta_global_V,
    hls_LT_theta_global_V_ap_vld,
    hls_LT_r_global_V,
    hls_LT_r_global_V_ap_vld,
    hls_LT_theta_V,
    hls_LT_theta_V_ap_vld,
    hls_LT_r_V,
    hls_LT_r_V_ap_vld,
    res_max_bin_count_V,
    res_max_bin_count_V_ap_vld,
    res_max_bin_theta_V,
    res_max_bin_theta_V_ap_vld,
    res_max_bin_r_V,
    res_max_bin_r_V_ap_vld);
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [13:0]slcvec_angle_polar_offset_mrad_V;
  input [21:0]roi_seed_r_V;
  input [3:0]max_bin_count_0_V;
  input [3:0]max_bin_count_1_V;
  input [3:0]max_bin_count_2_V;
  input [3:0]max_bin_count_3_V;
  input [3:0]max_bin_count_4_V;
  input [3:0]max_bin_count_5_V;
  input [3:0]max_bin_count_6_V;
  input [3:0]max_bin_count_7_V;
  input [3:0]max_bin_count_8_V;
  input [3:0]max_bin_count_9_V;
  input [3:0]max_bin_count_10_V;
  input [3:0]max_bin_count_11_V;
  input [3:0]max_bin_count_12_V;
  input [3:0]max_bin_count_13_V;
  input [3:0]max_bin_count_14_V;
  input [3:0]max_bin_count_15_V;
  input [3:0]max_bin_count_16_V;
  input [3:0]max_bin_count_17_V;
  input [3:0]max_bin_count_18_V;
  input [3:0]max_bin_count_19_V;
  input [3:0]max_bin_count_20_V;
  input [3:0]max_bin_count_21_V;
  input [3:0]max_bin_count_22_V;
  input [3:0]max_bin_count_23_V;
  input [3:0]max_bin_count_24_V;
  input [3:0]max_bin_count_25_V;
  input [3:0]max_bin_count_26_V;
  input [3:0]max_bin_count_27_V;
  input [3:0]max_bin_count_28_V;
  input [3:0]max_bin_count_29_V;
  input [3:0]max_bin_count_30_V;
  input [3:0]max_bin_count_31_V;
  input [3:0]max_bin_count_32_V;
  input [3:0]max_bin_count_33_V;
  input [3:0]max_bin_count_34_V;
  input [3:0]max_bin_count_35_V;
  input [3:0]max_bin_count_36_V;
  input [3:0]max_bin_count_37_V;
  input [3:0]max_bin_count_38_V;
  input [3:0]max_bin_count_39_V;
  input [3:0]max_bin_count_40_V;
  input [3:0]max_bin_count_41_V;
  input [3:0]max_bin_count_42_V;
  input [3:0]max_bin_count_43_V;
  input [3:0]max_bin_count_44_V;
  input [3:0]max_bin_count_45_V;
  input [3:0]max_bin_count_46_V;
  input [3:0]max_bin_count_47_V;
  input [3:0]max_bin_count_48_V;
  input [3:0]max_bin_count_49_V;
  input [3:0]max_bin_count_50_V;
  input [3:0]max_bin_count_51_V;
  input [3:0]max_bin_count_52_V;
  input [3:0]max_bin_count_53_V;
  input [3:0]max_bin_count_54_V;
  input [3:0]max_bin_count_55_V;
  input [3:0]max_bin_count_56_V;
  input [3:0]max_bin_count_57_V;
  input [3:0]max_bin_count_58_V;
  input [3:0]max_bin_count_59_V;
  input [3:0]max_bin_count_60_V;
  input [3:0]max_bin_count_61_V;
  input [3:0]max_bin_count_62_V;
  input [3:0]max_bin_count_63_V;
  input [6:0]max_bin_r_0_V;
  input [6:0]max_bin_r_1_V;
  input [6:0]max_bin_r_2_V;
  input [6:0]max_bin_r_3_V;
  input [6:0]max_bin_r_4_V;
  input [6:0]max_bin_r_5_V;
  input [6:0]max_bin_r_6_V;
  input [6:0]max_bin_r_7_V;
  input [6:0]max_bin_r_8_V;
  input [6:0]max_bin_r_9_V;
  input [6:0]max_bin_r_10_V;
  input [6:0]max_bin_r_11_V;
  input [6:0]max_bin_r_12_V;
  input [6:0]max_bin_r_13_V;
  input [6:0]max_bin_r_14_V;
  input [6:0]max_bin_r_15_V;
  input [6:0]max_bin_r_16_V;
  input [6:0]max_bin_r_17_V;
  input [6:0]max_bin_r_18_V;
  input [6:0]max_bin_r_19_V;
  input [6:0]max_bin_r_20_V;
  input [6:0]max_bin_r_21_V;
  input [6:0]max_bin_r_22_V;
  input [6:0]max_bin_r_23_V;
  input [6:0]max_bin_r_24_V;
  input [6:0]max_bin_r_25_V;
  input [6:0]max_bin_r_26_V;
  input [6:0]max_bin_r_27_V;
  input [6:0]max_bin_r_28_V;
  input [6:0]max_bin_r_29_V;
  input [6:0]max_bin_r_30_V;
  input [6:0]max_bin_r_31_V;
  input [6:0]max_bin_r_32_V;
  input [6:0]max_bin_r_33_V;
  input [6:0]max_bin_r_34_V;
  input [6:0]max_bin_r_35_V;
  input [6:0]max_bin_r_36_V;
  input [6:0]max_bin_r_37_V;
  input [6:0]max_bin_r_38_V;
  input [6:0]max_bin_r_39_V;
  input [6:0]max_bin_r_40_V;
  input [6:0]max_bin_r_41_V;
  input [6:0]max_bin_r_42_V;
  input [6:0]max_bin_r_43_V;
  input [6:0]max_bin_r_44_V;
  input [6:0]max_bin_r_45_V;
  input [6:0]max_bin_r_46_V;
  input [6:0]max_bin_r_47_V;
  input [6:0]max_bin_r_48_V;
  input [6:0]max_bin_r_49_V;
  input [6:0]max_bin_r_50_V;
  input [6:0]max_bin_r_51_V;
  input [6:0]max_bin_r_52_V;
  input [6:0]max_bin_r_53_V;
  input [6:0]max_bin_r_54_V;
  input [6:0]max_bin_r_55_V;
  input [6:0]max_bin_r_56_V;
  input [6:0]max_bin_r_57_V;
  input [6:0]max_bin_r_58_V;
  input [6:0]max_bin_r_59_V;
  input [6:0]max_bin_r_60_V;
  input [6:0]max_bin_r_61_V;
  input [6:0]max_bin_r_62_V;
  input [6:0]max_bin_r_63_V;
  output [13:0]hls_LT_theta_global_V;
  output hls_LT_theta_global_V_ap_vld;
  output [21:0]hls_LT_r_global_V;
  output hls_LT_r_global_V_ap_vld;
  output [13:0]hls_LT_theta_V;
  output hls_LT_theta_V_ap_vld;
  output [21:0]hls_LT_r_V;
  output hls_LT_r_V_ap_vld;
  output [3:0]res_max_bin_count_V;
  output res_max_bin_count_V_ap_vld;
  output [6:0]res_max_bin_theta_V;
  output res_max_bin_theta_V_ap_vld;
  output [6:0]res_max_bin_r_V;
  output res_max_bin_r_V_ap_vld;

  wire \<const0> ;
  wire [13:0]add_ln703_1_fu_4702_p2;
  wire [21:3]add_ln703_2_fu_4727_p2;
  wire ap_clk;
  wire ap_done;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter2;
  wire ap_idle;
  wire ap_rst;
  wire ap_start;
  wire [4:4]\^hls_LT_r_V ;
  wire \hls_LT_r_V_1_data_reg[10]_i_2_n_0 ;
  wire \hls_LT_r_V_1_data_reg[11]_i_2_n_0 ;
  wire \hls_LT_r_V_1_data_reg[8]_i_2_n_0 ;
  wire \hls_LT_r_V_1_data_reg[9]_i_2_n_0 ;
  wire [21:0]hls_LT_r_global_V;
  wire \hls_LT_r_global_V_1_data_reg[10]_i_2_n_0 ;
  wire \hls_LT_r_global_V_1_data_reg[10]_i_3_n_0 ;
  wire \hls_LT_r_global_V_1_data_reg[10]_i_4_n_0 ;
  wire \hls_LT_r_global_V_1_data_reg[10]_i_5_n_0 ;
  wire \hls_LT_r_global_V_1_data_reg[10]_i_6_n_0 ;
  wire \hls_LT_r_global_V_1_data_reg[10]_i_7_n_0 ;
  wire \hls_LT_r_global_V_1_data_reg[10]_i_8_n_0 ;
  wire \hls_LT_r_global_V_1_data_reg[18]_i_2_n_0 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_0 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_1 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_2 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_3 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_4 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_5 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_6 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_7 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_0 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_1 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_2 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_3 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_4 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_5 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_6 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_7 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[21]_i_1_n_6 ;
  wire \hls_LT_r_global_V_1_data_reg_reg[21]_i_1_n_7 ;
  wire hls_LT_r_global_V_ap_vld;
  wire \hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ;
  wire \hls_LT_theta_V_1_data_reg[8]_i_3_n_0 ;
  wire [13:0]hls_LT_theta_global_V;
  wire \hls_LT_theta_global_V_1_data_reg[13]_i_2_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg[13]_i_3_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg[13]_i_4_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg[13]_i_5_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg[8]_i_10_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg[8]_i_11_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg[8]_i_2_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg[8]_i_3_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg[8]_i_4_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg[8]_i_5_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg[8]_i_6_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg[8]_i_7_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg[8]_i_8_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg[8]_i_9_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_4 ;
  wire \hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_5 ;
  wire \hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_6 ;
  wire \hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_7 ;
  wire \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_0 ;
  wire \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_1 ;
  wire \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_2 ;
  wire \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_3 ;
  wire \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_4 ;
  wire \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_5 ;
  wire \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_6 ;
  wire \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_7 ;
  wire icmp_ln895_100_reg_5336;
  wire \icmp_ln895_100_reg_5336[0]_i_1_n_0 ;
  wire \icmp_ln895_100_reg_5336[0]_i_2_n_0 ;
  wire icmp_ln895_101_reg_5347;
  wire \icmp_ln895_101_reg_5347[0]_i_1_n_0 ;
  wire \icmp_ln895_101_reg_5347[0]_i_2_n_0 ;
  wire icmp_ln895_102_reg_5358;
  wire \icmp_ln895_102_reg_5358[0]_i_1_n_0 ;
  wire \icmp_ln895_102_reg_5358[0]_i_2_n_0 ;
  wire icmp_ln895_103_reg_5369;
  wire \icmp_ln895_103_reg_5369[0]_i_1_n_0 ;
  wire \icmp_ln895_103_reg_5369[0]_i_2_n_0 ;
  wire icmp_ln895_104_reg_5380;
  wire \icmp_ln895_104_reg_5380[0]_i_1_n_0 ;
  wire \icmp_ln895_104_reg_5380[0]_i_2_n_0 ;
  wire icmp_ln895_105_reg_5391;
  wire \icmp_ln895_105_reg_5391[0]_i_1_n_0 ;
  wire \icmp_ln895_105_reg_5391[0]_i_2_n_0 ;
  wire icmp_ln895_106_reg_5406;
  wire \icmp_ln895_106_reg_5406[0]_i_1_n_0 ;
  wire \icmp_ln895_106_reg_5406[0]_i_2_n_0 ;
  wire icmp_ln895_107_reg_5421;
  wire \icmp_ln895_107_reg_5421[0]_i_1_n_0 ;
  wire \icmp_ln895_107_reg_5421[0]_i_2_n_0 ;
  wire icmp_ln895_108_reg_5436;
  wire \icmp_ln895_108_reg_5436[0]_i_1_n_0 ;
  wire \icmp_ln895_108_reg_5436[0]_i_2_n_0 ;
  wire icmp_ln895_109_reg_5451;
  wire \icmp_ln895_109_reg_5451[0]_i_1_n_0 ;
  wire \icmp_ln895_109_reg_5451[0]_i_2_n_0 ;
  wire icmp_ln895_10_reg_4793;
  wire icmp_ln895_110_reg_5466;
  wire \icmp_ln895_110_reg_5466[0]_i_1_n_0 ;
  wire \icmp_ln895_110_reg_5466[0]_i_2_n_0 ;
  wire icmp_ln895_111_reg_5481;
  wire \icmp_ln895_111_reg_5481[0]_i_1_n_0 ;
  wire \icmp_ln895_111_reg_5481[0]_i_2_n_0 ;
  wire icmp_ln895_112_reg_5496;
  wire \icmp_ln895_112_reg_5496[0]_i_1_n_0 ;
  wire \icmp_ln895_112_reg_5496[0]_i_2_n_0 ;
  wire icmp_ln895_113_fu_2192_p2;
  wire icmp_ln895_113_reg_5511;
  wire \icmp_ln895_113_reg_5511[0]_i_2_n_0 ;
  wire icmp_ln895_114_fu_2196_p2;
  wire icmp_ln895_114_reg_5518;
  wire \icmp_ln895_114_reg_5518[0]_i_2_n_0 ;
  wire icmp_ln895_115_fu_2200_p2;
  wire icmp_ln895_115_reg_5525;
  wire \icmp_ln895_115_reg_5525[0]_i_2_n_0 ;
  wire icmp_ln895_116_fu_2204_p2;
  wire icmp_ln895_116_reg_5532;
  wire \icmp_ln895_116_reg_5532[0]_i_2_n_0 ;
  wire icmp_ln895_117_fu_2208_p2;
  wire icmp_ln895_117_reg_5539;
  wire \icmp_ln895_117_reg_5539[0]_i_2_n_0 ;
  wire icmp_ln895_118_fu_2212_p2;
  wire icmp_ln895_118_reg_5546;
  wire \icmp_ln895_118_reg_5546[0]_i_2_n_0 ;
  wire icmp_ln895_119_fu_2216_p2;
  wire icmp_ln895_119_reg_5553;
  wire \icmp_ln895_119_reg_5553[0]_i_2_n_0 ;
  wire icmp_ln895_11_reg_4798;
  wire \icmp_ln895_11_reg_4798[0]_i_1_n_0 ;
  wire icmp_ln895_120_fu_2220_p2;
  wire icmp_ln895_120_reg_5560;
  wire \icmp_ln895_120_reg_5560[0]_i_2_n_0 ;
  wire icmp_ln895_125_reg_5577;
  wire \icmp_ln895_125_reg_5577[0]_i_1_n_0 ;
  wire icmp_ln895_12_reg_4803;
  wire \icmp_ln895_12_reg_4803[0]_i_1_n_0 ;
  wire icmp_ln895_13_reg_4808;
  wire \icmp_ln895_13_reg_4808[0]_i_1_n_0 ;
  wire icmp_ln895_14_reg_4813;
  wire \icmp_ln895_14_reg_4813[0]_i_1_n_0 ;
  wire icmp_ln895_15_reg_4818;
  wire \icmp_ln895_15_reg_4818[0]_i_1_n_0 ;
  wire icmp_ln895_16_reg_4823;
  wire \icmp_ln895_16_reg_4823[0]_i_1_n_0 ;
  wire icmp_ln895_17_reg_4828;
  wire \icmp_ln895_17_reg_4828[0]_i_1_n_0 ;
  wire icmp_ln895_18_reg_4833;
  wire \icmp_ln895_18_reg_4833[0]_i_1_n_0 ;
  wire icmp_ln895_19_reg_4838;
  wire \icmp_ln895_19_reg_4838[0]_i_1_n_0 ;
  wire icmp_ln895_1_reg_4748;
  wire \icmp_ln895_1_reg_4748[0]_i_1_n_0 ;
  wire icmp_ln895_20_reg_4843;
  wire \icmp_ln895_20_reg_4843[0]_i_1_n_0 ;
  wire icmp_ln895_21_reg_4848;
  wire \icmp_ln895_21_reg_4848[0]_i_1_n_0 ;
  wire icmp_ln895_22_reg_4853;
  wire \icmp_ln895_22_reg_4853[0]_i_1_n_0 ;
  wire icmp_ln895_23_reg_4858;
  wire \icmp_ln895_23_reg_4858[0]_i_1_n_0 ;
  wire icmp_ln895_24_reg_4863;
  wire \icmp_ln895_24_reg_4863[0]_i_1_n_0 ;
  wire icmp_ln895_25_reg_4868;
  wire \icmp_ln895_25_reg_4868[0]_i_1_n_0 ;
  wire icmp_ln895_26_reg_4873;
  wire \icmp_ln895_26_reg_4873[0]_i_1_n_0 ;
  wire icmp_ln895_27_reg_4878;
  wire \icmp_ln895_27_reg_4878[0]_i_1_n_0 ;
  wire icmp_ln895_28_reg_4883;
  wire \icmp_ln895_28_reg_4883[0]_i_1_n_0 ;
  wire icmp_ln895_29_reg_4888;
  wire \icmp_ln895_29_reg_4888[0]_i_1_n_0 ;
  wire icmp_ln895_2_reg_4753;
  wire \icmp_ln895_2_reg_4753[0]_i_1_n_0 ;
  wire icmp_ln895_30_reg_4893;
  wire \icmp_ln895_30_reg_4893[0]_i_1_n_0 ;
  wire icmp_ln895_31_reg_4898;
  wire \icmp_ln895_31_reg_4898[0]_i_1_n_0 ;
  wire icmp_ln895_32_reg_4903;
  wire \icmp_ln895_32_reg_4903[0]_i_1_n_0 ;
  wire icmp_ln895_33_reg_4908;
  wire \icmp_ln895_33_reg_4908[0]_i_1_n_0 ;
  wire icmp_ln895_34_reg_4913;
  wire \icmp_ln895_34_reg_4913[0]_i_1_n_0 ;
  wire icmp_ln895_35_reg_4918;
  wire \icmp_ln895_35_reg_4918[0]_i_1_n_0 ;
  wire icmp_ln895_36_reg_4923;
  wire \icmp_ln895_36_reg_4923[0]_i_1_n_0 ;
  wire icmp_ln895_37_reg_4928;
  wire \icmp_ln895_37_reg_4928[0]_i_1_n_0 ;
  wire icmp_ln895_38_reg_4933;
  wire \icmp_ln895_38_reg_4933[0]_i_1_n_0 ;
  wire icmp_ln895_39_reg_4938;
  wire \icmp_ln895_39_reg_4938[0]_i_1_n_0 ;
  wire icmp_ln895_3_reg_4758;
  wire \icmp_ln895_3_reg_4758[0]_i_1_n_0 ;
  wire icmp_ln895_40_reg_4943;
  wire icmp_ln895_41_reg_4948;
  wire \icmp_ln895_41_reg_4948[0]_i_1_n_0 ;
  wire icmp_ln895_42_reg_4953;
  wire \icmp_ln895_42_reg_4953[0]_i_1_n_0 ;
  wire icmp_ln895_43_reg_4958;
  wire \icmp_ln895_43_reg_4958[0]_i_1_n_0 ;
  wire icmp_ln895_44_reg_4963;
  wire \icmp_ln895_44_reg_4963[0]_i_1_n_0 ;
  wire icmp_ln895_45_reg_4968;
  wire \icmp_ln895_45_reg_4968[0]_i_1_n_0 ;
  wire icmp_ln895_46_reg_4973;
  wire \icmp_ln895_46_reg_4973[0]_i_1_n_0 ;
  wire icmp_ln895_47_reg_4978;
  wire \icmp_ln895_47_reg_4978[0]_i_1_n_0 ;
  wire icmp_ln895_48_reg_4983;
  wire \icmp_ln895_48_reg_4983[0]_i_1_n_0 ;
  wire icmp_ln895_49_reg_4988;
  wire \icmp_ln895_49_reg_4988[0]_i_1_n_0 ;
  wire icmp_ln895_4_reg_4763;
  wire \icmp_ln895_4_reg_4763[0]_i_1_n_0 ;
  wire icmp_ln895_50_reg_4993;
  wire \icmp_ln895_50_reg_4993[0]_i_1_n_0 ;
  wire icmp_ln895_51_reg_4998;
  wire \icmp_ln895_51_reg_4998[0]_i_1_n_0 ;
  wire icmp_ln895_52_reg_5003;
  wire \icmp_ln895_52_reg_5003[0]_i_1_n_0 ;
  wire icmp_ln895_53_reg_5008;
  wire \icmp_ln895_53_reg_5008[0]_i_1_n_0 ;
  wire icmp_ln895_54_reg_5013;
  wire \icmp_ln895_54_reg_5013[0]_i_1_n_0 ;
  wire icmp_ln895_55_reg_5018;
  wire \icmp_ln895_55_reg_5018[0]_i_1_n_0 ;
  wire icmp_ln895_56_reg_5023;
  wire \icmp_ln895_56_reg_5023[0]_i_1_n_0 ;
  wire icmp_ln895_57_reg_5028;
  wire \icmp_ln895_57_reg_5028[0]_i_1_n_0 ;
  wire icmp_ln895_58_reg_5033;
  wire \icmp_ln895_58_reg_5033[0]_i_1_n_0 ;
  wire icmp_ln895_59_reg_5038;
  wire \icmp_ln895_59_reg_5038[0]_i_1_n_0 ;
  wire icmp_ln895_60_reg_5043;
  wire \icmp_ln895_60_reg_5043[0]_i_1_n_0 ;
  wire icmp_ln895_61_reg_5048;
  wire \icmp_ln895_61_reg_5048[0]_i_1_n_0 ;
  wire icmp_ln895_62_reg_5053;
  wire \icmp_ln895_62_reg_5053[0]_i_1_n_0 ;
  wire icmp_ln895_63_reg_5058;
  wire \icmp_ln895_63_reg_5058[0]_i_1_n_0 ;
  wire icmp_ln895_64_reg_4773;
  wire \icmp_ln895_64_reg_4773[0]_i_1_n_0 ;
  wire icmp_ln895_65_reg_5063;
  wire \icmp_ln895_65_reg_5063[0]_i_1_n_0 ;
  wire \icmp_ln895_65_reg_5063[0]_i_2_n_0 ;
  wire icmp_ln895_66_reg_5073;
  wire \icmp_ln895_66_reg_5073[0]_i_1_n_0 ;
  wire \icmp_ln895_66_reg_5073[0]_i_2_n_0 ;
  wire icmp_ln895_67_reg_5083;
  wire \icmp_ln895_67_reg_5083[0]_i_1_n_0 ;
  wire \icmp_ln895_67_reg_5083[0]_i_2_n_0 ;
  wire icmp_ln895_68_reg_5093;
  wire \icmp_ln895_68_reg_5093[0]_i_1_n_0 ;
  wire \icmp_ln895_68_reg_5093[0]_i_2_n_0 ;
  wire icmp_ln895_69_reg_5103;
  wire \icmp_ln895_69_reg_5103[0]_i_1_n_0 ;
  wire \icmp_ln895_69_reg_5103[0]_i_2_n_0 ;
  wire icmp_ln895_6_reg_4768;
  wire \icmp_ln895_6_reg_4768[0]_i_1_n_0 ;
  wire icmp_ln895_70_reg_5113;
  wire \icmp_ln895_70_reg_5113[0]_i_1_n_0 ;
  wire \icmp_ln895_70_reg_5113[0]_i_2_n_0 ;
  wire icmp_ln895_71_reg_5123;
  wire \icmp_ln895_71_reg_5123[0]_i_1_n_0 ;
  wire \icmp_ln895_71_reg_5123[0]_i_2_n_0 ;
  wire icmp_ln895_72_reg_5133;
  wire \icmp_ln895_72_reg_5133[0]_i_1_n_0 ;
  wire \icmp_ln895_72_reg_5133[0]_i_2_n_0 ;
  wire icmp_ln895_73_reg_5143;
  wire \icmp_ln895_73_reg_5143[0]_i_1_n_0 ;
  wire \icmp_ln895_73_reg_5143[0]_i_2_n_0 ;
  wire icmp_ln895_74_reg_5148;
  wire \icmp_ln895_74_reg_5148[0]_i_1_n_0 ;
  wire \icmp_ln895_74_reg_5148[0]_i_2_n_0 ;
  wire icmp_ln895_75_reg_5153;
  wire \icmp_ln895_75_reg_5153[0]_i_1_n_0 ;
  wire \icmp_ln895_75_reg_5153[0]_i_2_n_0 ;
  wire icmp_ln895_76_reg_5158;
  wire \icmp_ln895_76_reg_5158[0]_i_1_n_0 ;
  wire \icmp_ln895_76_reg_5158[0]_i_2_n_0 ;
  wire icmp_ln895_77_reg_5163;
  wire \icmp_ln895_77_reg_5163[0]_i_1_n_0 ;
  wire \icmp_ln895_77_reg_5163[0]_i_2_n_0 ;
  wire icmp_ln895_78_reg_5168;
  wire \icmp_ln895_78_reg_5168[0]_i_1_n_0 ;
  wire \icmp_ln895_78_reg_5168[0]_i_2_n_0 ;
  wire icmp_ln895_79_reg_5173;
  wire \icmp_ln895_79_reg_5173[0]_i_1_n_0 ;
  wire \icmp_ln895_79_reg_5173[0]_i_2_n_0 ;
  wire icmp_ln895_7_reg_4778;
  wire \icmp_ln895_7_reg_4778[0]_i_1_n_0 ;
  wire icmp_ln895_80_reg_5178;
  wire \icmp_ln895_80_reg_5178[0]_i_1_n_0 ;
  wire \icmp_ln895_80_reg_5178[0]_i_2_n_0 ;
  wire icmp_ln895_81_reg_5183;
  wire \icmp_ln895_81_reg_5183[0]_i_1_n_0 ;
  wire icmp_ln895_82_reg_5193;
  wire \icmp_ln895_82_reg_5193[0]_i_1_n_0 ;
  wire icmp_ln895_83_reg_5203;
  wire \icmp_ln895_83_reg_5203[0]_i_1_n_0 ;
  wire icmp_ln895_84_reg_5213;
  wire \icmp_ln895_84_reg_5213[0]_i_1_n_0 ;
  wire icmp_ln895_85_reg_5223;
  wire \icmp_ln895_85_reg_5223[0]_i_1_n_0 ;
  wire icmp_ln895_86_reg_5233;
  wire \icmp_ln895_86_reg_5233[0]_i_1_n_0 ;
  wire icmp_ln895_87_reg_5243;
  wire \icmp_ln895_87_reg_5243[0]_i_1_n_0 ;
  wire icmp_ln895_88_reg_5253;
  wire \icmp_ln895_88_reg_5253[0]_i_1_n_0 ;
  wire icmp_ln895_89_reg_5263;
  wire \icmp_ln895_89_reg_5263[0]_i_1_n_0 ;
  wire \icmp_ln895_89_reg_5263[0]_i_2_n_0 ;
  wire icmp_ln895_8_reg_4783;
  wire \icmp_ln895_8_reg_4783[0]_i_1_n_0 ;
  wire icmp_ln895_90_reg_5268;
  wire \icmp_ln895_90_reg_5268[0]_i_1_n_0 ;
  wire \icmp_ln895_90_reg_5268[0]_i_2_n_0 ;
  wire icmp_ln895_91_reg_5273;
  wire \icmp_ln895_91_reg_5273[0]_i_1_n_0 ;
  wire \icmp_ln895_91_reg_5273[0]_i_2_n_0 ;
  wire icmp_ln895_92_reg_5278;
  wire \icmp_ln895_92_reg_5278[0]_i_1_n_0 ;
  wire \icmp_ln895_92_reg_5278[0]_i_2_n_0 ;
  wire icmp_ln895_93_reg_5283;
  wire \icmp_ln895_93_reg_5283[0]_i_1_n_0 ;
  wire \icmp_ln895_93_reg_5283[0]_i_2_n_0 ;
  wire icmp_ln895_94_reg_5288;
  wire \icmp_ln895_94_reg_5288[0]_i_1_n_0 ;
  wire \icmp_ln895_94_reg_5288[0]_i_2_n_0 ;
  wire icmp_ln895_95_reg_5293;
  wire \icmp_ln895_95_reg_5293[0]_i_1_n_0 ;
  wire \icmp_ln895_95_reg_5293[0]_i_2_n_0 ;
  wire icmp_ln895_96_reg_5298;
  wire \icmp_ln895_96_reg_5298[0]_i_1_n_0 ;
  wire \icmp_ln895_96_reg_5298[0]_i_2_n_0 ;
  wire icmp_ln895_97_reg_5303;
  wire \icmp_ln895_97_reg_5303[0]_i_1_n_0 ;
  wire \icmp_ln895_97_reg_5303[0]_i_2_n_0 ;
  wire icmp_ln895_98_reg_5314;
  wire \icmp_ln895_98_reg_5314[0]_i_1_n_0 ;
  wire \icmp_ln895_98_reg_5314[0]_i_2_n_0 ;
  wire icmp_ln895_99_reg_5325;
  wire \icmp_ln895_99_reg_5325[0]_i_1_n_0 ;
  wire \icmp_ln895_99_reg_5325[0]_i_2_n_0 ;
  wire icmp_ln895_9_reg_4788;
  wire \icmp_ln895_9_reg_4788[0]_i_1_n_0 ;
  wire icmp_ln895_reg_4743;
  wire \icmp_ln895_reg_4743[0]_i_1_n_0 ;
  wire [3:0]max_bin_count_0_V;
  wire [3:0]max_bin_count_10_V;
  wire [3:0]max_bin_count_11_V;
  wire [3:0]max_bin_count_12_V;
  wire [3:0]max_bin_count_13_V;
  wire [3:0]max_bin_count_14_V;
  wire [3:0]max_bin_count_15_V;
  wire [3:0]max_bin_count_16_V;
  wire [3:0]max_bin_count_17_V;
  wire [3:0]max_bin_count_18_V;
  wire [3:0]max_bin_count_19_V;
  wire [3:0]max_bin_count_1_V;
  wire [3:0]max_bin_count_20_V;
  wire [3:0]max_bin_count_21_V;
  wire [3:0]max_bin_count_22_V;
  wire [3:0]max_bin_count_23_V;
  wire [3:0]max_bin_count_24_V;
  wire [3:0]max_bin_count_25_V;
  wire [3:0]max_bin_count_26_V;
  wire [3:0]max_bin_count_27_V;
  wire [3:0]max_bin_count_28_V;
  wire [3:0]max_bin_count_29_V;
  wire [3:0]max_bin_count_2_V;
  wire [3:0]max_bin_count_30_V;
  wire [3:0]max_bin_count_31_V;
  wire [3:0]max_bin_count_32_V;
  wire [3:0]max_bin_count_33_V;
  wire [3:0]max_bin_count_34_V;
  wire [3:0]max_bin_count_35_V;
  wire [3:0]max_bin_count_36_V;
  wire [3:0]max_bin_count_37_V;
  wire [3:0]max_bin_count_38_V;
  wire [3:0]max_bin_count_39_V;
  wire [3:0]max_bin_count_3_V;
  wire [3:0]max_bin_count_40_V;
  wire [3:0]max_bin_count_41_V;
  wire [3:0]max_bin_count_42_V;
  wire [3:0]max_bin_count_43_V;
  wire [3:0]max_bin_count_44_V;
  wire [3:0]max_bin_count_45_V;
  wire [3:0]max_bin_count_46_V;
  wire [3:0]max_bin_count_47_V;
  wire [3:0]max_bin_count_48_V;
  wire [3:0]max_bin_count_49_V;
  wire [3:0]max_bin_count_4_V;
  wire [3:0]max_bin_count_50_V;
  wire [3:0]max_bin_count_51_V;
  wire [3:0]max_bin_count_52_V;
  wire [3:0]max_bin_count_53_V;
  wire [3:0]max_bin_count_54_V;
  wire [3:0]max_bin_count_55_V;
  wire [3:0]max_bin_count_56_V;
  wire [3:0]max_bin_count_57_V;
  wire [3:0]max_bin_count_58_V;
  wire [3:0]max_bin_count_59_V;
  wire [3:0]max_bin_count_5_V;
  wire [3:0]max_bin_count_60_V;
  wire [3:0]max_bin_count_61_V;
  wire [3:0]max_bin_count_62_V;
  wire [3:0]max_bin_count_63_V;
  wire [3:0]max_bin_count_6_V;
  wire [3:0]max_bin_count_7_V;
  wire [3:0]max_bin_count_8_V;
  wire [3:0]max_bin_count_9_V;
  wire [6:0]max_bin_r_0_V;
  wire [6:0]max_bin_r_10_V;
  wire [6:0]max_bin_r_11_V;
  wire [6:0]max_bin_r_12_V;
  wire [6:0]max_bin_r_13_V;
  wire [6:0]max_bin_r_14_V;
  wire [6:0]max_bin_r_15_V;
  wire [6:0]max_bin_r_16_V;
  wire [6:0]max_bin_r_17_V;
  wire [6:0]max_bin_r_18_V;
  wire [6:0]max_bin_r_19_V;
  wire [6:0]max_bin_r_1_V;
  wire [6:0]max_bin_r_20_V;
  wire [6:0]max_bin_r_21_V;
  wire [6:0]max_bin_r_22_V;
  wire [6:0]max_bin_r_23_V;
  wire [6:0]max_bin_r_24_V;
  wire [6:0]max_bin_r_25_V;
  wire [6:0]max_bin_r_26_V;
  wire [6:0]max_bin_r_27_V;
  wire [6:0]max_bin_r_28_V;
  wire [6:0]max_bin_r_29_V;
  wire [6:0]max_bin_r_2_V;
  wire [6:0]max_bin_r_30_V;
  wire [6:0]max_bin_r_31_V;
  wire [6:0]max_bin_r_32_V;
  wire [6:0]max_bin_r_33_V;
  wire [6:0]max_bin_r_34_V;
  wire [6:0]max_bin_r_35_V;
  wire [6:0]max_bin_r_36_V;
  wire [6:0]max_bin_r_37_V;
  wire [6:0]max_bin_r_38_V;
  wire [6:0]max_bin_r_39_V;
  wire [6:0]max_bin_r_3_V;
  wire [6:0]max_bin_r_40_V;
  wire [6:0]max_bin_r_41_V;
  wire [6:0]max_bin_r_42_V;
  wire [6:0]max_bin_r_43_V;
  wire [6:0]max_bin_r_44_V;
  wire [6:0]max_bin_r_45_V;
  wire [6:0]max_bin_r_46_V;
  wire [6:0]max_bin_r_47_V;
  wire [6:0]max_bin_r_48_V;
  wire [6:0]max_bin_r_49_V;
  wire [6:0]max_bin_r_4_V;
  wire [6:0]max_bin_r_50_V;
  wire [6:0]max_bin_r_51_V;
  wire [6:0]max_bin_r_52_V;
  wire [6:0]max_bin_r_53_V;
  wire [6:0]max_bin_r_54_V;
  wire [6:0]max_bin_r_55_V;
  wire [6:0]max_bin_r_56_V;
  wire [6:0]max_bin_r_57_V;
  wire [6:0]max_bin_r_58_V;
  wire [6:0]max_bin_r_59_V;
  wire [6:0]max_bin_r_5_V;
  wire [6:0]max_bin_r_60_V;
  wire [6:0]max_bin_r_61_V;
  wire [6:0]max_bin_r_62_V;
  wire [6:0]max_bin_r_63_V;
  wire [6:0]max_bin_r_6_V;
  wire [6:0]max_bin_r_7_V;
  wire [6:0]max_bin_r_8_V;
  wire [6:0]max_bin_r_9_V;
  wire [6:6]p_0_out;
  wire p_1_in;
  wire p_3_in;
  wire [3:0]res_max_bin_count_V;
  wire [3:0]res_max_bin_count_t_1_fu_4624_p3;
  wire [3:0]res_max_bin_count_t_1_reg_5603;
  wire \res_max_bin_count_t_1_reg_5603[0]_i_2_n_0 ;
  wire \res_max_bin_count_t_1_reg_5603[0]_i_3_n_0 ;
  wire \res_max_bin_count_t_1_reg_5603[0]_i_4_n_0 ;
  wire \res_max_bin_count_t_1_reg_5603[0]_i_5_n_0 ;
  wire \res_max_bin_count_t_1_reg_5603[1]_i_2_n_0 ;
  wire \res_max_bin_count_t_1_reg_5603[1]_i_3_n_0 ;
  wire \res_max_bin_count_t_1_reg_5603[1]_i_4_n_0 ;
  wire \res_max_bin_count_t_1_reg_5603[1]_i_5_n_0 ;
  wire \res_max_bin_count_t_1_reg_5603[2]_i_2_n_0 ;
  wire \res_max_bin_count_t_1_reg_5603[2]_i_3_n_0 ;
  wire \res_max_bin_count_t_1_reg_5603[2]_i_4_n_0 ;
  wire \res_max_bin_count_t_1_reg_5603[3]_i_2_n_0 ;
  wire \res_max_bin_count_t_1_reg_5603[3]_i_3_n_0 ;
  wire [3:0]res_max_bin_count_t_2_fu_4637_p3;
  wire [3:0]res_max_bin_count_t_s_fu_4600_p3;
  wire [3:0]res_max_bin_count_t_s_reg_5587;
  wire \res_max_bin_count_t_s_reg_5587[1]_i_4_n_0 ;
  wire [6:0]res_max_bin_r_V;
  wire [6:0]res_max_bin_r_t_V_1_fu_4616_p3;
  wire [6:0]res_max_bin_r_t_V_1_reg_5598;
  wire \res_max_bin_r_t_V_1_reg_5598[0]_i_2_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[0]_i_3_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[0]_i_5_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[0]_i_6_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[1]_i_2_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[1]_i_3_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[1]_i_5_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[1]_i_6_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[2]_i_2_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[2]_i_3_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[2]_i_5_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[2]_i_6_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[3]_i_2_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[3]_i_3_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[3]_i_5_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[3]_i_6_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[4]_i_2_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[4]_i_3_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[4]_i_5_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[4]_i_6_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[5]_i_2_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[5]_i_3_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[5]_i_5_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[5]_i_6_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[6]_i_2_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[6]_i_3_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[6]_i_5_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598[6]_i_6_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598_reg[0]_i_4_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598_reg[1]_i_4_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598_reg[2]_i_4_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598_reg[3]_i_4_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598_reg[4]_i_4_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598_reg[5]_i_4_n_0 ;
  wire \res_max_bin_r_t_V_1_reg_5598_reg[6]_i_4_n_0 ;
  wire [5:0]res_max_bin_r_t_V_2_fu_4652_p3;
  wire [6:0]res_max_bin_r_t_V_fu_4592_p3;
  wire [6:0]res_max_bin_r_t_V_reg_5582;
  wire [6:0]res_max_bin_theta_V;
  wire [6:1]res_max_bin_theta_t_1_fu_4608_p3;
  wire [6:1]res_max_bin_theta_t_1_reg_5593;
  wire \res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[2]_i_3_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[2]_i_4_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[2]_i_6_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[2]_i_7_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[2]_i_8_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[2]_i_9_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[3]_i_2_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[4]_i_2_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[4]_i_3_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[4]_i_4_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[4]_i_5_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[5]_i_10_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[5]_i_2_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[5]_i_3_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[5]_i_5_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[5]_i_6_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[5]_i_7_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[5]_i_8_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[5]_i_9_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_10_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_11_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_12_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_13_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_14_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_15_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_16_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_17_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_18_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_19_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_20_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_21_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_22_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_23_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_25_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_26_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_27_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_28_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_29_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_30_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_31_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_32_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_33_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_34_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_7_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_8_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593[6]_i_9_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593_reg[5]_i_4_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593_reg[6]_i_24_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593_reg[6]_i_2_n_0 ;
  wire \res_max_bin_theta_t_1_reg_5593_reg[6]_i_5_n_0 ;
  wire [6:0]res_max_bin_theta_t_2_fu_4644_p3;
  wire [21:0]roi_seed_r_V;
  wire [21:0]roi_seed_r_V_read_reg_4733;
  wire [21:0]roi_seed_r_V_read_reg_4733_pp0_iter1_reg;
  wire [6:0]select_ln422_10_fu_2815_p3;
  wire select_ln422_10_reg_5098;
  wire \select_ln422_10_reg_5098_reg_n_0_[0] ;
  wire \select_ln422_10_reg_5098_reg_n_0_[1] ;
  wire \select_ln422_10_reg_5098_reg_n_0_[2] ;
  wire \select_ln422_10_reg_5098_reg_n_0_[3] ;
  wire \select_ln422_10_reg_5098_reg_n_0_[4] ;
  wire \select_ln422_10_reg_5098_reg_n_0_[5] ;
  wire \select_ln422_10_reg_5098_reg_n_0_[6] ;
  wire [3:0]select_ln422_11_fu_2823_p3;
  wire [6:0]select_ln422_13_fu_2832_p3;
  wire select_ln422_13_reg_5108;
  wire \select_ln422_13_reg_5108_reg_n_0_[0] ;
  wire \select_ln422_13_reg_5108_reg_n_0_[1] ;
  wire \select_ln422_13_reg_5108_reg_n_0_[2] ;
  wire \select_ln422_13_reg_5108_reg_n_0_[3] ;
  wire \select_ln422_13_reg_5108_reg_n_0_[4] ;
  wire \select_ln422_13_reg_5108_reg_n_0_[5] ;
  wire \select_ln422_13_reg_5108_reg_n_0_[6] ;
  wire [3:0]select_ln422_14_fu_2840_p3;
  wire [6:0]select_ln422_16_fu_2849_p3;
  wire select_ln422_16_reg_5118;
  wire \select_ln422_16_reg_5118_reg_n_0_[0] ;
  wire \select_ln422_16_reg_5118_reg_n_0_[1] ;
  wire \select_ln422_16_reg_5118_reg_n_0_[2] ;
  wire \select_ln422_16_reg_5118_reg_n_0_[3] ;
  wire \select_ln422_16_reg_5118_reg_n_0_[4] ;
  wire \select_ln422_16_reg_5118_reg_n_0_[5] ;
  wire \select_ln422_16_reg_5118_reg_n_0_[6] ;
  wire [3:0]select_ln422_17_fu_2857_p3;
  wire [6:0]select_ln422_19_fu_2866_p3;
  wire select_ln422_19_reg_5128;
  wire \select_ln422_19_reg_5128_reg_n_0_[0] ;
  wire \select_ln422_19_reg_5128_reg_n_0_[1] ;
  wire \select_ln422_19_reg_5128_reg_n_0_[2] ;
  wire \select_ln422_19_reg_5128_reg_n_0_[3] ;
  wire \select_ln422_19_reg_5128_reg_n_0_[4] ;
  wire \select_ln422_19_reg_5128_reg_n_0_[5] ;
  wire \select_ln422_19_reg_5128_reg_n_0_[6] ;
  wire [6:0]select_ln422_1_fu_2764_p3;
  wire select_ln422_1_reg_5068;
  wire \select_ln422_1_reg_5068_reg_n_0_[0] ;
  wire \select_ln422_1_reg_5068_reg_n_0_[1] ;
  wire \select_ln422_1_reg_5068_reg_n_0_[2] ;
  wire \select_ln422_1_reg_5068_reg_n_0_[3] ;
  wire \select_ln422_1_reg_5068_reg_n_0_[4] ;
  wire \select_ln422_1_reg_5068_reg_n_0_[5] ;
  wire \select_ln422_1_reg_5068_reg_n_0_[6] ;
  wire [3:0]select_ln422_20_fu_2874_p3;
  wire [6:0]select_ln422_22_fu_2883_p3;
  wire select_ln422_22_reg_5138;
  wire \select_ln422_22_reg_5138_reg_n_0_[0] ;
  wire \select_ln422_22_reg_5138_reg_n_0_[1] ;
  wire \select_ln422_22_reg_5138_reg_n_0_[2] ;
  wire \select_ln422_22_reg_5138_reg_n_0_[3] ;
  wire \select_ln422_22_reg_5138_reg_n_0_[4] ;
  wire \select_ln422_22_reg_5138_reg_n_0_[5] ;
  wire \select_ln422_22_reg_5138_reg_n_0_[6] ;
  wire [3:0]select_ln422_23_fu_2891_p3;
  wire [3:0]select_ln422_26_fu_2908_p3;
  wire [3:0]select_ln422_29_fu_2925_p3;
  wire [3:0]select_ln422_2_fu_2772_p3;
  wire [3:0]select_ln422_32_fu_2942_p3;
  wire [3:0]select_ln422_35_fu_2959_p3;
  wire [3:0]select_ln422_38_fu_2976_p3;
  wire [3:0]select_ln422_41_fu_2993_p3;
  wire [3:0]select_ln422_44_fu_3010_p3;
  wire [3:0]select_ln422_47_fu_3027_p3;
  wire [6:0]select_ln422_49_fu_3036_p3;
  wire select_ln422_49_reg_5188;
  wire \select_ln422_49_reg_5188[6]_i_3_n_0 ;
  wire \select_ln422_49_reg_5188_reg_n_0_[0] ;
  wire \select_ln422_49_reg_5188_reg_n_0_[1] ;
  wire \select_ln422_49_reg_5188_reg_n_0_[2] ;
  wire \select_ln422_49_reg_5188_reg_n_0_[3] ;
  wire \select_ln422_49_reg_5188_reg_n_0_[4] ;
  wire \select_ln422_49_reg_5188_reg_n_0_[5] ;
  wire \select_ln422_49_reg_5188_reg_n_0_[6] ;
  wire [6:0]select_ln422_4_fu_2781_p3;
  wire select_ln422_4_reg_5078;
  wire \select_ln422_4_reg_5078_reg_n_0_[0] ;
  wire \select_ln422_4_reg_5078_reg_n_0_[1] ;
  wire \select_ln422_4_reg_5078_reg_n_0_[2] ;
  wire \select_ln422_4_reg_5078_reg_n_0_[3] ;
  wire \select_ln422_4_reg_5078_reg_n_0_[4] ;
  wire \select_ln422_4_reg_5078_reg_n_0_[5] ;
  wire \select_ln422_4_reg_5078_reg_n_0_[6] ;
  wire [2:0]select_ln422_50_fu_3044_p3;
  wire [6:0]select_ln422_52_fu_3053_p3;
  wire select_ln422_52_reg_5198;
  wire \select_ln422_52_reg_5198[6]_i_3_n_0 ;
  wire \select_ln422_52_reg_5198_reg_n_0_[0] ;
  wire \select_ln422_52_reg_5198_reg_n_0_[1] ;
  wire \select_ln422_52_reg_5198_reg_n_0_[2] ;
  wire \select_ln422_52_reg_5198_reg_n_0_[3] ;
  wire \select_ln422_52_reg_5198_reg_n_0_[4] ;
  wire \select_ln422_52_reg_5198_reg_n_0_[5] ;
  wire \select_ln422_52_reg_5198_reg_n_0_[6] ;
  wire [2:0]select_ln422_53_fu_3061_p3;
  wire [6:0]select_ln422_55_fu_3070_p3;
  wire select_ln422_55_reg_5208;
  wire \select_ln422_55_reg_5208[6]_i_3_n_0 ;
  wire \select_ln422_55_reg_5208_reg_n_0_[0] ;
  wire \select_ln422_55_reg_5208_reg_n_0_[1] ;
  wire \select_ln422_55_reg_5208_reg_n_0_[2] ;
  wire \select_ln422_55_reg_5208_reg_n_0_[3] ;
  wire \select_ln422_55_reg_5208_reg_n_0_[4] ;
  wire \select_ln422_55_reg_5208_reg_n_0_[5] ;
  wire \select_ln422_55_reg_5208_reg_n_0_[6] ;
  wire [2:0]select_ln422_56_fu_3078_p3;
  wire [6:0]select_ln422_58_fu_3087_p3;
  wire select_ln422_58_reg_5218;
  wire \select_ln422_58_reg_5218[6]_i_3_n_0 ;
  wire \select_ln422_58_reg_5218_reg_n_0_[0] ;
  wire \select_ln422_58_reg_5218_reg_n_0_[1] ;
  wire \select_ln422_58_reg_5218_reg_n_0_[2] ;
  wire \select_ln422_58_reg_5218_reg_n_0_[3] ;
  wire \select_ln422_58_reg_5218_reg_n_0_[4] ;
  wire \select_ln422_58_reg_5218_reg_n_0_[5] ;
  wire \select_ln422_58_reg_5218_reg_n_0_[6] ;
  wire [2:0]select_ln422_59_fu_3095_p3;
  wire [3:0]select_ln422_5_fu_2789_p3;
  wire [6:0]select_ln422_61_fu_3104_p3;
  wire select_ln422_61_reg_5228;
  wire \select_ln422_61_reg_5228[6]_i_3_n_0 ;
  wire \select_ln422_61_reg_5228_reg_n_0_[0] ;
  wire \select_ln422_61_reg_5228_reg_n_0_[1] ;
  wire \select_ln422_61_reg_5228_reg_n_0_[2] ;
  wire \select_ln422_61_reg_5228_reg_n_0_[3] ;
  wire \select_ln422_61_reg_5228_reg_n_0_[4] ;
  wire \select_ln422_61_reg_5228_reg_n_0_[5] ;
  wire \select_ln422_61_reg_5228_reg_n_0_[6] ;
  wire [2:0]select_ln422_62_fu_3112_p3;
  wire [6:0]select_ln422_64_fu_3121_p3;
  wire select_ln422_64_reg_5238;
  wire \select_ln422_64_reg_5238[6]_i_3_n_0 ;
  wire \select_ln422_64_reg_5238_reg_n_0_[0] ;
  wire \select_ln422_64_reg_5238_reg_n_0_[1] ;
  wire \select_ln422_64_reg_5238_reg_n_0_[2] ;
  wire \select_ln422_64_reg_5238_reg_n_0_[3] ;
  wire \select_ln422_64_reg_5238_reg_n_0_[4] ;
  wire \select_ln422_64_reg_5238_reg_n_0_[5] ;
  wire \select_ln422_64_reg_5238_reg_n_0_[6] ;
  wire [2:0]select_ln422_65_fu_3129_p3;
  wire [6:0]select_ln422_67_fu_3138_p3;
  wire select_ln422_67_reg_5248;
  wire \select_ln422_67_reg_5248[6]_i_3_n_0 ;
  wire \select_ln422_67_reg_5248_reg_n_0_[0] ;
  wire \select_ln422_67_reg_5248_reg_n_0_[1] ;
  wire \select_ln422_67_reg_5248_reg_n_0_[2] ;
  wire \select_ln422_67_reg_5248_reg_n_0_[3] ;
  wire \select_ln422_67_reg_5248_reg_n_0_[4] ;
  wire \select_ln422_67_reg_5248_reg_n_0_[5] ;
  wire \select_ln422_67_reg_5248_reg_n_0_[6] ;
  wire [2:0]select_ln422_68_fu_3146_p3;
  wire [6:0]select_ln422_70_fu_3155_p3;
  wire select_ln422_70_reg_5258;
  wire \select_ln422_70_reg_5258[6]_i_3_n_0 ;
  wire \select_ln422_70_reg_5258_reg_n_0_[0] ;
  wire \select_ln422_70_reg_5258_reg_n_0_[1] ;
  wire \select_ln422_70_reg_5258_reg_n_0_[2] ;
  wire \select_ln422_70_reg_5258_reg_n_0_[3] ;
  wire \select_ln422_70_reg_5258_reg_n_0_[4] ;
  wire \select_ln422_70_reg_5258_reg_n_0_[5] ;
  wire \select_ln422_70_reg_5258_reg_n_0_[6] ;
  wire [2:0]select_ln422_71_fu_3163_p3;
  wire [6:0]select_ln422_73_fu_3172_p3;
  wire [3:0]select_ln422_74_fu_3180_p3;
  wire [6:0]select_ln422_76_fu_3189_p3;
  wire [3:0]select_ln422_77_fu_3197_p3;
  wire [6:0]select_ln422_79_fu_3206_p3;
  wire [6:0]select_ln422_7_fu_2798_p3;
  wire select_ln422_7_reg_5088;
  wire \select_ln422_7_reg_5088_reg_n_0_[0] ;
  wire \select_ln422_7_reg_5088_reg_n_0_[1] ;
  wire \select_ln422_7_reg_5088_reg_n_0_[2] ;
  wire \select_ln422_7_reg_5088_reg_n_0_[3] ;
  wire \select_ln422_7_reg_5088_reg_n_0_[4] ;
  wire \select_ln422_7_reg_5088_reg_n_0_[5] ;
  wire \select_ln422_7_reg_5088_reg_n_0_[6] ;
  wire [3:0]select_ln422_80_fu_3214_p3;
  wire [6:0]select_ln422_82_fu_3223_p3;
  wire [3:0]select_ln422_83_fu_3231_p3;
  wire [6:0]select_ln422_85_fu_3240_p3;
  wire [3:0]select_ln422_86_fu_3248_p3;
  wire [6:0]select_ln422_88_fu_3257_p3;
  wire [3:0]select_ln422_89_fu_3265_p3;
  wire [3:0]select_ln422_8_fu_2806_p3;
  wire [6:0]select_ln422_91_fu_3274_p3;
  wire [3:0]select_ln422_92_fu_3282_p3;
  wire [6:0]select_ln422_94_fu_3291_p3;
  wire [3:0]select_ln422_95_fu_3299_p3;
  wire [3:0]select_ln440_11_fu_3335_p3;
  wire [3:0]select_ln440_11_reg_5342;
  wire \select_ln440_11_reg_5342[1]_i_4_n_0 ;
  wire [3:0]select_ln440_14_fu_3344_p3;
  wire [3:0]select_ln440_14_reg_5353;
  wire \select_ln440_14_reg_5353[1]_i_4_n_0 ;
  wire [3:0]select_ln440_17_fu_3353_p3;
  wire [3:0]select_ln440_17_reg_5364;
  wire \select_ln440_17_reg_5364[1]_i_4_n_0 ;
  wire [3:0]select_ln440_20_fu_3362_p3;
  wire [3:0]select_ln440_20_reg_5375;
  wire \select_ln440_20_reg_5375[1]_i_4_n_0 ;
  wire [3:0]select_ln440_23_fu_3371_p3;
  wire [3:0]select_ln440_23_reg_5386;
  wire \select_ln440_23_reg_5386[1]_i_4_n_0 ;
  wire [6:0]select_ln440_25_fu_3380_p3;
  wire \select_ln440_25_reg_5396[6]_i_1_n_0 ;
  wire \select_ln440_25_reg_5396_reg_n_0_[0] ;
  wire \select_ln440_25_reg_5396_reg_n_0_[1] ;
  wire \select_ln440_25_reg_5396_reg_n_0_[2] ;
  wire \select_ln440_25_reg_5396_reg_n_0_[3] ;
  wire \select_ln440_25_reg_5396_reg_n_0_[4] ;
  wire \select_ln440_25_reg_5396_reg_n_0_[5] ;
  wire \select_ln440_25_reg_5396_reg_n_0_[6] ;
  wire [3:0]select_ln440_26_fu_3388_p3;
  wire [3:0]select_ln440_26_reg_5401;
  wire \select_ln440_26_reg_5401[1]_i_4_n_0 ;
  wire [6:0]select_ln440_28_fu_3397_p3;
  wire \select_ln440_28_reg_5411[6]_i_1_n_0 ;
  wire \select_ln440_28_reg_5411_reg_n_0_[0] ;
  wire \select_ln440_28_reg_5411_reg_n_0_[1] ;
  wire \select_ln440_28_reg_5411_reg_n_0_[2] ;
  wire \select_ln440_28_reg_5411_reg_n_0_[3] ;
  wire \select_ln440_28_reg_5411_reg_n_0_[4] ;
  wire \select_ln440_28_reg_5411_reg_n_0_[5] ;
  wire \select_ln440_28_reg_5411_reg_n_0_[6] ;
  wire [3:0]select_ln440_29_fu_3405_p3;
  wire [3:0]select_ln440_29_reg_5416;
  wire \select_ln440_29_reg_5416[1]_i_4_n_0 ;
  wire [3:0]select_ln440_2_fu_3308_p3;
  wire [3:0]select_ln440_2_reg_5309;
  wire \select_ln440_2_reg_5309[1]_i_4_n_0 ;
  wire [6:0]select_ln440_31_fu_3414_p3;
  wire \select_ln440_31_reg_5426[6]_i_1_n_0 ;
  wire \select_ln440_31_reg_5426_reg_n_0_[0] ;
  wire \select_ln440_31_reg_5426_reg_n_0_[1] ;
  wire \select_ln440_31_reg_5426_reg_n_0_[2] ;
  wire \select_ln440_31_reg_5426_reg_n_0_[3] ;
  wire \select_ln440_31_reg_5426_reg_n_0_[4] ;
  wire \select_ln440_31_reg_5426_reg_n_0_[5] ;
  wire \select_ln440_31_reg_5426_reg_n_0_[6] ;
  wire [3:0]select_ln440_32_fu_3422_p3;
  wire [3:0]select_ln440_32_reg_5431;
  wire \select_ln440_32_reg_5431[1]_i_4_n_0 ;
  wire [6:0]select_ln440_34_fu_3431_p3;
  wire \select_ln440_34_reg_5441[6]_i_1_n_0 ;
  wire \select_ln440_34_reg_5441_reg_n_0_[0] ;
  wire \select_ln440_34_reg_5441_reg_n_0_[1] ;
  wire \select_ln440_34_reg_5441_reg_n_0_[2] ;
  wire \select_ln440_34_reg_5441_reg_n_0_[3] ;
  wire \select_ln440_34_reg_5441_reg_n_0_[4] ;
  wire \select_ln440_34_reg_5441_reg_n_0_[5] ;
  wire \select_ln440_34_reg_5441_reg_n_0_[6] ;
  wire [3:0]select_ln440_35_fu_3439_p3;
  wire [3:0]select_ln440_35_reg_5446;
  wire \select_ln440_35_reg_5446[1]_i_4_n_0 ;
  wire [6:0]select_ln440_37_fu_3448_p3;
  wire \select_ln440_37_reg_5456[6]_i_1_n_0 ;
  wire \select_ln440_37_reg_5456_reg_n_0_[0] ;
  wire \select_ln440_37_reg_5456_reg_n_0_[1] ;
  wire \select_ln440_37_reg_5456_reg_n_0_[2] ;
  wire \select_ln440_37_reg_5456_reg_n_0_[3] ;
  wire \select_ln440_37_reg_5456_reg_n_0_[4] ;
  wire \select_ln440_37_reg_5456_reg_n_0_[5] ;
  wire \select_ln440_37_reg_5456_reg_n_0_[6] ;
  wire [3:0]select_ln440_38_fu_3456_p3;
  wire [3:0]select_ln440_38_reg_5461;
  wire \select_ln440_38_reg_5461[1]_i_4_n_0 ;
  wire [6:0]select_ln440_40_fu_3465_p3;
  wire \select_ln440_40_reg_5471[6]_i_1_n_0 ;
  wire \select_ln440_40_reg_5471_reg_n_0_[0] ;
  wire \select_ln440_40_reg_5471_reg_n_0_[1] ;
  wire \select_ln440_40_reg_5471_reg_n_0_[2] ;
  wire \select_ln440_40_reg_5471_reg_n_0_[3] ;
  wire \select_ln440_40_reg_5471_reg_n_0_[4] ;
  wire \select_ln440_40_reg_5471_reg_n_0_[5] ;
  wire \select_ln440_40_reg_5471_reg_n_0_[6] ;
  wire [3:0]select_ln440_41_fu_3473_p3;
  wire [3:0]select_ln440_41_reg_5476;
  wire \select_ln440_41_reg_5476[1]_i_4_n_0 ;
  wire [6:0]select_ln440_43_fu_3482_p3;
  wire \select_ln440_43_reg_5486[6]_i_1_n_0 ;
  wire \select_ln440_43_reg_5486_reg_n_0_[0] ;
  wire \select_ln440_43_reg_5486_reg_n_0_[1] ;
  wire \select_ln440_43_reg_5486_reg_n_0_[2] ;
  wire \select_ln440_43_reg_5486_reg_n_0_[3] ;
  wire \select_ln440_43_reg_5486_reg_n_0_[4] ;
  wire \select_ln440_43_reg_5486_reg_n_0_[5] ;
  wire \select_ln440_43_reg_5486_reg_n_0_[6] ;
  wire [3:0]select_ln440_44_fu_3490_p3;
  wire [3:0]select_ln440_44_reg_5491;
  wire \select_ln440_44_reg_5491[1]_i_4_n_0 ;
  wire [6:0]select_ln440_46_fu_3499_p3;
  wire \select_ln440_46_reg_5501[6]_i_1_n_0 ;
  wire \select_ln440_46_reg_5501_reg_n_0_[0] ;
  wire \select_ln440_46_reg_5501_reg_n_0_[1] ;
  wire \select_ln440_46_reg_5501_reg_n_0_[2] ;
  wire \select_ln440_46_reg_5501_reg_n_0_[3] ;
  wire \select_ln440_46_reg_5501_reg_n_0_[4] ;
  wire \select_ln440_46_reg_5501_reg_n_0_[5] ;
  wire \select_ln440_46_reg_5501_reg_n_0_[6] ;
  wire [3:0]select_ln440_47_fu_3507_p3;
  wire [3:0]select_ln440_47_reg_5506;
  wire \select_ln440_47_reg_5506[1]_i_4_n_0 ;
  wire [3:0]select_ln440_5_fu_3317_p3;
  wire [3:0]select_ln440_5_reg_5320;
  wire \select_ln440_5_reg_5320[1]_i_4_n_0 ;
  wire [3:0]select_ln440_8_fu_3326_p3;
  wire [3:0]select_ln440_8_reg_5331;
  wire \select_ln440_8_reg_5331[1]_i_4_n_0 ;
  wire [6:6]select_ln440_fu_4188_p3;
  wire [6:0]select_ln458_13_fu_4423_p3;
  wire [3:0]select_ln458_14_fu_4429_p3;
  wire [6:0]select_ln458_19_fu_4461_p3;
  wire [6:0]select_ln458_1_fu_4347_p3;
  wire [3:0]select_ln458_20_fu_4467_p3;
  wire [3:1]select_ln458_2_fu_4353_p3;
  wire [6:0]select_ln458_7_fu_4385_p3;
  wire [3:1]select_ln458_8_fu_4391_p3;
  wire [6:0]select_ln476_1_fu_4500_p3;
  wire [3:0]select_ln476_2_fu_4508_p3;
  wire [6:2]select_ln476_6_fu_4542_p3;
  wire [6:2]select_ln476_6_reg_5572;
  wire \select_ln476_6_reg_5572[4]_i_2_n_0 ;
  wire \select_ln476_6_reg_5572[5]_i_2_n_0 ;
  wire \select_ln476_6_reg_5572[5]_i_3_n_0 ;
  wire \select_ln476_6_reg_5572[5]_i_4_n_0 ;
  wire \select_ln476_6_reg_5572[5]_i_5_n_0 ;
  wire \select_ln476_6_reg_5572[6]_i_14_n_0 ;
  wire \select_ln476_6_reg_5572[6]_i_16_n_0 ;
  wire \select_ln476_6_reg_5572[6]_i_17_n_0 ;
  wire \select_ln476_6_reg_5572[6]_i_2_n_0 ;
  wire \select_ln476_6_reg_5572[6]_i_3_n_0 ;
  wire \select_ln476_6_reg_5572[6]_i_4_n_0 ;
  wire \select_ln476_6_reg_5572[6]_i_6_n_0 ;
  wire \select_ln476_6_reg_5572[6]_i_7_n_0 ;
  wire \select_ln476_6_reg_5572[6]_i_8_n_0 ;
  wire \select_ln476_6_reg_5572_reg[6]_i_5_n_0 ;
  wire [6:0]select_ln476_7_fu_4550_p3;
  wire [3:0]select_ln476_8_fu_4558_p3;
  wire [6:2]select_ln476_fu_4492_p3;
  wire [6:2]select_ln476_reg_5567;
  wire \select_ln476_reg_5567[4]_i_2_n_0 ;
  wire \select_ln476_reg_5567[5]_i_2_n_0 ;
  wire \select_ln476_reg_5567[5]_i_3_n_0 ;
  wire \select_ln476_reg_5567[5]_i_4_n_0 ;
  wire \select_ln476_reg_5567[5]_i_5_n_0 ;
  wire \select_ln476_reg_5567[6]_i_13_n_0 ;
  wire \select_ln476_reg_5567[6]_i_14_n_0 ;
  wire \select_ln476_reg_5567[6]_i_16_n_0 ;
  wire \select_ln476_reg_5567[6]_i_17_n_0 ;
  wire \select_ln476_reg_5567[6]_i_3_n_0 ;
  wire \select_ln476_reg_5567[6]_i_4_n_0 ;
  wire \select_ln476_reg_5567[6]_i_6_n_0 ;
  wire \select_ln476_reg_5567[6]_i_7_n_0 ;
  wire \select_ln476_reg_5567[6]_i_8_n_0 ;
  wire \select_ln476_reg_5567_reg[6]_i_5_n_0 ;
  wire [13:0]slcvec_angle_polar_o_reg_4738;
  wire [13:0]slcvec_angle_polar_o_reg_4738_pp0_iter1_reg;
  wire [13:0]slcvec_angle_polar_offset_mrad_V;
  wire [6:0]tmp_V_fu_4658_p2;
  wire [7:2]\NLW_hls_LT_r_global_V_1_data_reg_reg[21]_i_1_CO_UNCONNECTED ;
  wire [7:3]\NLW_hls_LT_r_global_V_1_data_reg_reg[21]_i_1_O_UNCONNECTED ;
  wire [7:4]\NLW_hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_CO_UNCONNECTED ;
  wire [7:5]\NLW_hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_O_UNCONNECTED ;

  assign ap_ready = ap_start;
  assign hls_LT_r_V[21] = \<const0> ;
  assign hls_LT_r_V[20] = \<const0> ;
  assign hls_LT_r_V[19] = \<const0> ;
  assign hls_LT_r_V[18] = \<const0> ;
  assign hls_LT_r_V[17] = \<const0> ;
  assign hls_LT_r_V[16] = \<const0> ;
  assign hls_LT_r_V[15] = \<const0> ;
  assign hls_LT_r_V[14] = \<const0> ;
  assign hls_LT_r_V[13] = \<const0> ;
  assign hls_LT_r_V[12] = \<const0> ;
  assign hls_LT_r_V[11:5] = res_max_bin_r_V;
  assign hls_LT_r_V[4] = \^hls_LT_r_V [4];
  assign hls_LT_r_V[3] = \<const0> ;
  assign hls_LT_r_V[2] = \<const0> ;
  assign hls_LT_r_V[1] = \<const0> ;
  assign hls_LT_r_V[0] = \<const0> ;
  assign hls_LT_r_V_ap_vld = hls_LT_r_global_V_ap_vld;
  assign hls_LT_theta_V[13] = \<const0> ;
  assign hls_LT_theta_V[12] = \<const0> ;
  assign hls_LT_theta_V[11] = \<const0> ;
  assign hls_LT_theta_V[10] = \<const0> ;
  assign hls_LT_theta_V[9] = \<const0> ;
  assign hls_LT_theta_V[8:2] = res_max_bin_theta_V;
  assign hls_LT_theta_V[1] = \^hls_LT_r_V [4];
  assign hls_LT_theta_V[0] = \<const0> ;
  assign hls_LT_theta_V_ap_vld = hls_LT_r_global_V_ap_vld;
  assign hls_LT_theta_global_V_ap_vld = hls_LT_r_global_V_ap_vld;
  assign res_max_bin_count_V_ap_vld = hls_LT_r_global_V_ap_vld;
  assign res_max_bin_r_V_ap_vld = hls_LT_r_global_V_ap_vld;
  assign res_max_bin_theta_V_ap_vld = hls_LT_r_global_V_ap_vld;
  GND GND
       (.G(\<const0> ));
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
        .Q(ap_done),
        .R(ap_rst));
  LUT4 #(
    .INIT(16'h0001))
    ap_idle_INST_0
       (.I0(ap_enable_reg_pp0_iter2),
        .I1(ap_done),
        .I2(ap_start),
        .I3(ap_enable_reg_pp0_iter1),
        .O(ap_idle));
  LUT6 #(
    .INIT(64'h775F77A0885F88A0))
    \hls_LT_r_V_1_data_reg[10]_i_1
       (.I0(\hls_LT_r_V_1_data_reg[10]_i_2_n_0 ),
        .I1(res_max_bin_r_t_V_reg_5582[4]),
        .I2(res_max_bin_r_t_V_1_reg_5598[4]),
        .I3(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I4(res_max_bin_r_t_V_1_reg_5598[5]),
        .I5(res_max_bin_r_t_V_reg_5582[5]),
        .O(tmp_V_fu_4658_p2[5]));
  LUT6 #(
    .INIT(64'hC000C000A0A00000))
    \hls_LT_r_V_1_data_reg[10]_i_2
       (.I0(res_max_bin_r_t_V_1_reg_5598[3]),
        .I1(res_max_bin_r_t_V_reg_5582[3]),
        .I2(\hls_LT_r_V_1_data_reg[8]_i_2_n_0 ),
        .I3(res_max_bin_r_t_V_reg_5582[2]),
        .I4(res_max_bin_r_t_V_1_reg_5598[2]),
        .I5(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .O(\hls_LT_r_V_1_data_reg[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h775F77A0885F88A0))
    \hls_LT_r_V_1_data_reg[11]_i_1
       (.I0(\hls_LT_r_V_1_data_reg[11]_i_2_n_0 ),
        .I1(res_max_bin_r_t_V_reg_5582[5]),
        .I2(res_max_bin_r_t_V_1_reg_5598[5]),
        .I3(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I4(res_max_bin_r_t_V_1_reg_5598[6]),
        .I5(res_max_bin_r_t_V_reg_5582[6]),
        .O(tmp_V_fu_4658_p2[6]));
  LUT6 #(
    .INIT(64'hC000C000A0A00000))
    \hls_LT_r_V_1_data_reg[11]_i_2
       (.I0(res_max_bin_r_t_V_1_reg_5598[4]),
        .I1(res_max_bin_r_t_V_reg_5582[4]),
        .I2(\hls_LT_r_V_1_data_reg[9]_i_2_n_0 ),
        .I3(res_max_bin_r_t_V_reg_5582[3]),
        .I4(res_max_bin_r_t_V_1_reg_5598[3]),
        .I5(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .O(\hls_LT_r_V_1_data_reg[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *)
  LUT3 #(
    .INIT(8'h1B))
    \hls_LT_r_V_1_data_reg[5]_i_1
       (.I0(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I1(res_max_bin_r_t_V_1_reg_5598[0]),
        .I2(res_max_bin_r_t_V_reg_5582[0]),
        .O(tmp_V_fu_4658_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *)
  LUT5 #(
    .INIT(32'h353AC5CA))
    \hls_LT_r_V_1_data_reg[6]_i_1
       (.I0(res_max_bin_r_t_V_1_reg_5598[0]),
        .I1(res_max_bin_r_t_V_reg_5582[0]),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I3(res_max_bin_r_t_V_1_reg_5598[1]),
        .I4(res_max_bin_r_t_V_reg_5582[1]),
        .O(tmp_V_fu_4658_p2[1]));
  LUT6 #(
    .INIT(64'h775F77A0885F88A0))
    \hls_LT_r_V_1_data_reg[7]_i_1
       (.I0(res_max_bin_r_t_V_2_fu_4652_p3[0]),
        .I1(res_max_bin_r_t_V_reg_5582[1]),
        .I2(res_max_bin_r_t_V_1_reg_5598[1]),
        .I3(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I4(res_max_bin_r_t_V_1_reg_5598[2]),
        .I5(res_max_bin_r_t_V_reg_5582[2]),
        .O(tmp_V_fu_4658_p2[2]));
  LUT5 #(
    .INIT(32'hFF4DB200))
    \hls_LT_r_V_1_data_reg[7]_i_2
       (.I0(\hls_LT_theta_V_1_data_reg[8]_i_3_n_0 ),
        .I1(res_max_bin_count_t_1_reg_5603[3]),
        .I2(res_max_bin_count_t_s_reg_5587[3]),
        .I3(res_max_bin_r_t_V_reg_5582[0]),
        .I4(res_max_bin_r_t_V_1_reg_5598[0]),
        .O(res_max_bin_r_t_V_2_fu_4652_p3[0]));
  LUT6 #(
    .INIT(64'h775F77A0885F88A0))
    \hls_LT_r_V_1_data_reg[8]_i_1
       (.I0(\hls_LT_r_V_1_data_reg[8]_i_2_n_0 ),
        .I1(res_max_bin_r_t_V_reg_5582[2]),
        .I2(res_max_bin_r_t_V_1_reg_5598[2]),
        .I3(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I4(res_max_bin_r_t_V_1_reg_5598[3]),
        .I5(res_max_bin_r_t_V_reg_5582[3]),
        .O(tmp_V_fu_4658_p2[3]));
  LUT5 #(
    .INIT(32'hCAC00A00))
    \hls_LT_r_V_1_data_reg[8]_i_2
       (.I0(res_max_bin_r_t_V_1_reg_5598[1]),
        .I1(res_max_bin_r_t_V_reg_5582[1]),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I3(res_max_bin_r_t_V_1_reg_5598[0]),
        .I4(res_max_bin_r_t_V_reg_5582[0]),
        .O(\hls_LT_r_V_1_data_reg[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h775F77A0885F88A0))
    \hls_LT_r_V_1_data_reg[9]_i_1
       (.I0(\hls_LT_r_V_1_data_reg[9]_i_2_n_0 ),
        .I1(res_max_bin_r_t_V_reg_5582[3]),
        .I2(res_max_bin_r_t_V_1_reg_5598[3]),
        .I3(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I4(res_max_bin_r_t_V_1_reg_5598[4]),
        .I5(res_max_bin_r_t_V_reg_5582[4]),
        .O(tmp_V_fu_4658_p2[4]));
  LUT6 #(
    .INIT(64'hC000C000A0A00000))
    \hls_LT_r_V_1_data_reg[9]_i_2
       (.I0(res_max_bin_r_t_V_1_reg_5598[2]),
        .I1(res_max_bin_r_t_V_reg_5582[2]),
        .I2(res_max_bin_r_t_V_2_fu_4652_p3[0]),
        .I3(res_max_bin_r_t_V_reg_5582[1]),
        .I4(res_max_bin_r_t_V_1_reg_5598[1]),
        .I5(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .O(\hls_LT_r_V_1_data_reg[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_V_1_data_reg_reg[10]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(tmp_V_fu_4658_p2[5]),
        .Q(res_max_bin_r_V[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_V_1_data_reg_reg[11]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(tmp_V_fu_4658_p2[6]),
        .Q(res_max_bin_r_V[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_V_1_data_reg_reg[5]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(tmp_V_fu_4658_p2[0]),
        .Q(res_max_bin_r_V[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_V_1_data_reg_reg[6]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(tmp_V_fu_4658_p2[1]),
        .Q(res_max_bin_r_V[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_V_1_data_reg_reg[7]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(tmp_V_fu_4658_p2[2]),
        .Q(res_max_bin_r_V[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_V_1_data_reg_reg[8]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(tmp_V_fu_4658_p2[3]),
        .Q(res_max_bin_r_V[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_V_1_data_reg_reg[9]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(tmp_V_fu_4658_p2[4]),
        .Q(res_max_bin_r_V[4]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6))
    \hls_LT_r_global_V_1_data_reg[10]_i_2
       (.I0(tmp_V_fu_4658_p2[5]),
        .I1(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[10]),
        .O(\hls_LT_r_global_V_1_data_reg[10]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \hls_LT_r_global_V_1_data_reg[10]_i_3
       (.I0(tmp_V_fu_4658_p2[4]),
        .I1(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[9]),
        .O(\hls_LT_r_global_V_1_data_reg[10]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \hls_LT_r_global_V_1_data_reg[10]_i_4
       (.I0(tmp_V_fu_4658_p2[3]),
        .I1(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[8]),
        .O(\hls_LT_r_global_V_1_data_reg[10]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \hls_LT_r_global_V_1_data_reg[10]_i_5
       (.I0(tmp_V_fu_4658_p2[2]),
        .I1(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[7]),
        .O(\hls_LT_r_global_V_1_data_reg[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAC5CA35353A35CAC))
    \hls_LT_r_global_V_1_data_reg[10]_i_6
       (.I0(res_max_bin_r_t_V_reg_5582[1]),
        .I1(res_max_bin_r_t_V_1_reg_5598[1]),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I3(res_max_bin_r_t_V_reg_5582[0]),
        .I4(res_max_bin_r_t_V_1_reg_5598[0]),
        .I5(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[6]),
        .O(\hls_LT_r_global_V_1_data_reg[10]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hE41B))
    \hls_LT_r_global_V_1_data_reg[10]_i_7
       (.I0(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I1(res_max_bin_r_t_V_1_reg_5598[0]),
        .I2(res_max_bin_r_t_V_reg_5582[0]),
        .I3(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[5]),
        .O(\hls_LT_r_global_V_1_data_reg[10]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1))
    \hls_LT_r_global_V_1_data_reg[10]_i_8
       (.I0(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[4]),
        .O(\hls_LT_r_global_V_1_data_reg[10]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAC53535353ACACAC))
    \hls_LT_r_global_V_1_data_reg[18]_i_2
       (.I0(res_max_bin_r_t_V_reg_5582[6]),
        .I1(res_max_bin_r_t_V_1_reg_5598[6]),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I3(res_max_bin_r_t_V_2_fu_4652_p3[5]),
        .I4(\hls_LT_r_V_1_data_reg[11]_i_2_n_0 ),
        .I5(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[11]),
        .O(\hls_LT_r_global_V_1_data_reg[18]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *)
  LUT3 #(
    .INIT(8'hAC))
    \hls_LT_r_global_V_1_data_reg[18]_i_3
       (.I0(res_max_bin_r_t_V_reg_5582[5]),
        .I1(res_max_bin_r_t_V_1_reg_5598[5]),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .O(res_max_bin_r_t_V_2_fu_4652_p3[5]));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[0]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[0]),
        .Q(hls_LT_r_global_V[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[10]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[10]),
        .Q(hls_LT_r_global_V[10]),
        .R(1'b0));
  CARRY8 \hls_LT_r_global_V_1_data_reg_reg[10]_i_1
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_0 ,\hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_1 ,\hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_2 ,\hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_3 ,\hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_4 ,\hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_5 ,\hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_6 ,\hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_7 }),
        .DI({roi_seed_r_V_read_reg_4733_pp0_iter1_reg[10:4],1'b0}),
        .O(add_ln703_2_fu_4727_p2[10:3]),
        .S({\hls_LT_r_global_V_1_data_reg[10]_i_2_n_0 ,\hls_LT_r_global_V_1_data_reg[10]_i_3_n_0 ,\hls_LT_r_global_V_1_data_reg[10]_i_4_n_0 ,\hls_LT_r_global_V_1_data_reg[10]_i_5_n_0 ,\hls_LT_r_global_V_1_data_reg[10]_i_6_n_0 ,\hls_LT_r_global_V_1_data_reg[10]_i_7_n_0 ,\hls_LT_r_global_V_1_data_reg[10]_i_8_n_0 ,roi_seed_r_V_read_reg_4733_pp0_iter1_reg[3]}));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[11]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[11]),
        .Q(hls_LT_r_global_V[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[12]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[12]),
        .Q(hls_LT_r_global_V[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[13]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[13]),
        .Q(hls_LT_r_global_V[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[14]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[14]),
        .Q(hls_LT_r_global_V[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[15]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[15]),
        .Q(hls_LT_r_global_V[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[16]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[16]),
        .Q(hls_LT_r_global_V[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[17]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[17]),
        .Q(hls_LT_r_global_V[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[18]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[18]),
        .Q(hls_LT_r_global_V[18]),
        .R(1'b0));
  CARRY8 \hls_LT_r_global_V_1_data_reg_reg[18]_i_1
       (.CI(\hls_LT_r_global_V_1_data_reg_reg[10]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_0 ,\hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_1 ,\hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_2 ,\hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_3 ,\hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_4 ,\hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_5 ,\hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_6 ,\hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,roi_seed_r_V_read_reg_4733_pp0_iter1_reg[11]}),
        .O(add_ln703_2_fu_4727_p2[18:11]),
        .S({roi_seed_r_V_read_reg_4733_pp0_iter1_reg[18:12],\hls_LT_r_global_V_1_data_reg[18]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[19]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[19]),
        .Q(hls_LT_r_global_V[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[1]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[1]),
        .Q(hls_LT_r_global_V[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[20]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[20]),
        .Q(hls_LT_r_global_V[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[21]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[21]),
        .Q(hls_LT_r_global_V[21]),
        .R(1'b0));
  CARRY8 \hls_LT_r_global_V_1_data_reg_reg[21]_i_1
       (.CI(\hls_LT_r_global_V_1_data_reg_reg[18]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_hls_LT_r_global_V_1_data_reg_reg[21]_i_1_CO_UNCONNECTED [7:2],\hls_LT_r_global_V_1_data_reg_reg[21]_i_1_n_6 ,\hls_LT_r_global_V_1_data_reg_reg[21]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_hls_LT_r_global_V_1_data_reg_reg[21]_i_1_O_UNCONNECTED [7:3],add_ln703_2_fu_4727_p2[21:19]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,roi_seed_r_V_read_reg_4733_pp0_iter1_reg[21:19]}));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[2]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[2]),
        .Q(hls_LT_r_global_V[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[3]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[3]),
        .Q(hls_LT_r_global_V[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[4]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[4]),
        .Q(hls_LT_r_global_V[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[5]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[5]),
        .Q(hls_LT_r_global_V[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[6]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[6]),
        .Q(hls_LT_r_global_V[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[7]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[7]),
        .Q(hls_LT_r_global_V[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[8]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[8]),
        .Q(hls_LT_r_global_V[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_r_global_V_1_data_reg_reg[9]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_2_fu_4727_p2[9]),
        .Q(hls_LT_r_global_V[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *)
  LUT1 #(
    .INIT(2'h1))
    \hls_LT_theta_V_1_data_reg[2]_i_1
       (.I0(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .O(res_max_bin_theta_t_2_fu_4644_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair55" *)
  LUT3 #(
    .INIT(8'h74))
    \hls_LT_theta_V_1_data_reg[3]_i_1
       (.I0(icmp_ln895_125_reg_5577),
        .I1(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I2(res_max_bin_theta_t_1_reg_5593[1]),
        .O(res_max_bin_theta_t_2_fu_4644_p3[1]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \hls_LT_theta_V_1_data_reg[4]_i_1
       (.I0(select_ln476_reg_5567[2]),
        .I1(icmp_ln895_125_reg_5577),
        .I2(select_ln476_6_reg_5572[2]),
        .I3(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I4(res_max_bin_theta_t_1_reg_5593[2]),
        .O(res_max_bin_theta_t_2_fu_4644_p3[2]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \hls_LT_theta_V_1_data_reg[5]_i_1
       (.I0(select_ln476_reg_5567[3]),
        .I1(icmp_ln895_125_reg_5577),
        .I2(select_ln476_6_reg_5572[3]),
        .I3(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I4(res_max_bin_theta_t_1_reg_5593[3]),
        .O(res_max_bin_theta_t_2_fu_4644_p3[3]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \hls_LT_theta_V_1_data_reg[6]_i_1
       (.I0(select_ln476_reg_5567[4]),
        .I1(icmp_ln895_125_reg_5577),
        .I2(select_ln476_6_reg_5572[4]),
        .I3(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I4(res_max_bin_theta_t_1_reg_5593[4]),
        .O(res_max_bin_theta_t_2_fu_4644_p3[4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *)
  LUT5 #(
    .INIT(32'hB8FFB800))
    \hls_LT_theta_V_1_data_reg[7]_i_1
       (.I0(select_ln476_reg_5567[5]),
        .I1(icmp_ln895_125_reg_5577),
        .I2(select_ln476_6_reg_5572[5]),
        .I3(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I4(res_max_bin_theta_t_1_reg_5593[5]),
        .O(res_max_bin_theta_t_2_fu_4644_p3[5]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \hls_LT_theta_V_1_data_reg[8]_i_1
       (.I0(select_ln476_reg_5567[6]),
        .I1(icmp_ln895_125_reg_5577),
        .I2(select_ln476_6_reg_5572[6]),
        .I3(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I4(res_max_bin_theta_t_1_reg_5593[6]),
        .O(res_max_bin_theta_t_2_fu_4644_p3[6]));
  LUT3 #(
    .INIT(8'hB2))
    \hls_LT_theta_V_1_data_reg[8]_i_2
       (.I0(\hls_LT_theta_V_1_data_reg[8]_i_3_n_0 ),
        .I1(res_max_bin_count_t_1_reg_5603[3]),
        .I2(res_max_bin_count_t_s_reg_5587[3]),
        .O(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \hls_LT_theta_V_1_data_reg[8]_i_3
       (.I0(res_max_bin_count_t_s_reg_5587[0]),
        .I1(res_max_bin_count_t_1_reg_5603[0]),
        .I2(res_max_bin_count_t_1_reg_5603[1]),
        .I3(res_max_bin_count_t_s_reg_5587[1]),
        .I4(res_max_bin_count_t_1_reg_5603[2]),
        .I5(res_max_bin_count_t_s_reg_5587[2]),
        .O(\hls_LT_theta_V_1_data_reg[8]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_V_1_data_reg_reg[1]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(1'b1),
        .Q(\^hls_LT_r_V ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_V_1_data_reg_reg[2]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(res_max_bin_theta_t_2_fu_4644_p3[0]),
        .Q(res_max_bin_theta_V[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_V_1_data_reg_reg[3]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(res_max_bin_theta_t_2_fu_4644_p3[1]),
        .Q(res_max_bin_theta_V[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_V_1_data_reg_reg[4]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(res_max_bin_theta_t_2_fu_4644_p3[2]),
        .Q(res_max_bin_theta_V[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_V_1_data_reg_reg[5]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(res_max_bin_theta_t_2_fu_4644_p3[3]),
        .Q(res_max_bin_theta_V[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_V_1_data_reg_reg[6]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(res_max_bin_theta_t_2_fu_4644_p3[4]),
        .Q(res_max_bin_theta_V[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_V_1_data_reg_reg[7]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(res_max_bin_theta_t_2_fu_4644_p3[5]),
        .Q(res_max_bin_theta_V[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_V_1_data_reg_reg[8]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(res_max_bin_theta_t_2_fu_4644_p3[6]),
        .Q(res_max_bin_theta_V[6]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1))
    \hls_LT_theta_global_V_1_data_reg[0]_i_1
       (.I0(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[0]),
        .O(add_ln703_1_fu_4702_p2[0]));
  LUT1 #(
    .INIT(2'h1))
    \hls_LT_theta_global_V_1_data_reg[13]_i_2
       (.I0(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[12]),
        .O(\hls_LT_theta_global_V_1_data_reg[13]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1))
    \hls_LT_theta_global_V_1_data_reg[13]_i_3
       (.I0(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[11]),
        .O(\hls_LT_theta_global_V_1_data_reg[13]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h78))
    \hls_LT_theta_global_V_1_data_reg[13]_i_4
       (.I0(\hls_LT_theta_global_V_1_data_reg[13]_i_5_n_0 ),
        .I1(res_max_bin_theta_t_2_fu_4644_p3[6]),
        .I2(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[9]),
        .O(\hls_LT_theta_global_V_1_data_reg[13]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFEAEAEAEFEAE))
    \hls_LT_theta_global_V_1_data_reg[13]_i_5
       (.I0(\hls_LT_theta_global_V_1_data_reg[8]_i_10_n_0 ),
        .I1(res_max_bin_theta_t_1_reg_5593[5]),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I3(select_ln476_6_reg_5572[5]),
        .I4(icmp_ln895_125_reg_5577),
        .I5(select_ln476_reg_5567[5]),
        .O(\hls_LT_theta_global_V_1_data_reg[13]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h08880000))
    \hls_LT_theta_global_V_1_data_reg[8]_i_10
       (.I0(res_max_bin_theta_t_2_fu_4644_p3[4]),
        .I1(res_max_bin_theta_t_2_fu_4644_p3[2]),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I3(icmp_ln895_125_reg_5577),
        .I4(res_max_bin_theta_t_2_fu_4644_p3[3]),
        .O(\hls_LT_theta_global_V_1_data_reg[8]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *)
  LUT4 #(
    .INIT(16'h0ACA))
    \hls_LT_theta_global_V_1_data_reg[8]_i_11
       (.I0(res_max_bin_theta_t_1_reg_5593[2]),
        .I1(select_ln476_6_reg_5572[2]),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I3(icmp_ln895_125_reg_5577),
        .O(\hls_LT_theta_global_V_1_data_reg[8]_i_11_n_0 ));
  LUT3 #(
    .INIT(8'h96))
    \hls_LT_theta_global_V_1_data_reg[8]_i_2
       (.I0(res_max_bin_theta_t_2_fu_4644_p3[6]),
        .I1(\hls_LT_theta_global_V_1_data_reg[13]_i_5_n_0 ),
        .I2(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[8]),
        .O(\hls_LT_theta_global_V_1_data_reg[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h69))
    \hls_LT_theta_global_V_1_data_reg[8]_i_3
       (.I0(res_max_bin_theta_t_2_fu_4644_p3[5]),
        .I1(\hls_LT_theta_global_V_1_data_reg[8]_i_10_n_0 ),
        .I2(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[7]),
        .O(\hls_LT_theta_global_V_1_data_reg[8]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h956A))
    \hls_LT_theta_global_V_1_data_reg[8]_i_4
       (.I0(res_max_bin_theta_t_2_fu_4644_p3[4]),
        .I1(res_max_bin_theta_t_2_fu_4644_p3[3]),
        .I2(\hls_LT_theta_global_V_1_data_reg[8]_i_11_n_0 ),
        .I3(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[6]),
        .O(\hls_LT_theta_global_V_1_data_reg[8]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h5999A666))
    \hls_LT_theta_global_V_1_data_reg[8]_i_5
       (.I0(res_max_bin_theta_t_2_fu_4644_p3[3]),
        .I1(res_max_bin_theta_t_2_fu_4644_p3[2]),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I3(icmp_ln895_125_reg_5577),
        .I4(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[5]),
        .O(\hls_LT_theta_global_V_1_data_reg[8]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h6A95))
    \hls_LT_theta_global_V_1_data_reg[8]_i_6
       (.I0(res_max_bin_theta_t_2_fu_4644_p3[2]),
        .I1(icmp_ln895_125_reg_5577),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I3(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[4]),
        .O(\hls_LT_theta_global_V_1_data_reg[8]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h47B8))
    \hls_LT_theta_global_V_1_data_reg[8]_i_7
       (.I0(icmp_ln895_125_reg_5577),
        .I1(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I2(res_max_bin_theta_t_1_reg_5593[1]),
        .I3(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[3]),
        .O(\hls_LT_theta_global_V_1_data_reg[8]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \hls_LT_theta_global_V_1_data_reg[8]_i_8
       (.I0(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .I1(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[2]),
        .O(\hls_LT_theta_global_V_1_data_reg[8]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1))
    \hls_LT_theta_global_V_1_data_reg[8]_i_9
       (.I0(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[1]),
        .O(\hls_LT_theta_global_V_1_data_reg[8]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[0]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[0]),
        .Q(hls_LT_theta_global_V[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[10]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[10]),
        .Q(hls_LT_theta_global_V[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[11]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[11]),
        .Q(hls_LT_theta_global_V[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[12]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[12]),
        .Q(hls_LT_theta_global_V[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[13]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[13]),
        .Q(hls_LT_theta_global_V[13]),
        .R(1'b0));
  CARRY8 \hls_LT_theta_global_V_1_data_reg_reg[13]_i_1
       (.CI(\hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_CO_UNCONNECTED [7:4],\hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_4 ,\hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_5 ,\hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_6 ,\hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[12:11],1'b0,slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[9]}),
        .O({\NLW_hls_LT_theta_global_V_1_data_reg_reg[13]_i_1_O_UNCONNECTED [7:5],add_ln703_1_fu_4702_p2[13:9]}),
        .S({1'b0,1'b0,1'b0,slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[13],\hls_LT_theta_global_V_1_data_reg[13]_i_2_n_0 ,\hls_LT_theta_global_V_1_data_reg[13]_i_3_n_0 ,slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[10],\hls_LT_theta_global_V_1_data_reg[13]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[1]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[1]),
        .Q(hls_LT_theta_global_V[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[2]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[2]),
        .Q(hls_LT_theta_global_V[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[3]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[3]),
        .Q(hls_LT_theta_global_V[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[4]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[4]),
        .Q(hls_LT_theta_global_V[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[5]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[5]),
        .Q(hls_LT_theta_global_V[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[6]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[6]),
        .Q(hls_LT_theta_global_V[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[7]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[7]),
        .Q(hls_LT_theta_global_V[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[8]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[8]),
        .Q(hls_LT_theta_global_V[8]),
        .R(1'b0));
  CARRY8 \hls_LT_theta_global_V_1_data_reg_reg[8]_i_1
       (.CI(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[0]),
        .CI_TOP(1'b0),
        .CO({\hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_0 ,\hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_1 ,\hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_2 ,\hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_3 ,\hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_4 ,\hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_5 ,\hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_6 ,\hls_LT_theta_global_V_1_data_reg_reg[8]_i_1_n_7 }),
        .DI(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[8:1]),
        .O(add_ln703_1_fu_4702_p2[8:1]),
        .S({\hls_LT_theta_global_V_1_data_reg[8]_i_2_n_0 ,\hls_LT_theta_global_V_1_data_reg[8]_i_3_n_0 ,\hls_LT_theta_global_V_1_data_reg[8]_i_4_n_0 ,\hls_LT_theta_global_V_1_data_reg[8]_i_5_n_0 ,\hls_LT_theta_global_V_1_data_reg[8]_i_6_n_0 ,\hls_LT_theta_global_V_1_data_reg[8]_i_7_n_0 ,\hls_LT_theta_global_V_1_data_reg[8]_i_8_n_0 ,\hls_LT_theta_global_V_1_data_reg[8]_i_9_n_0 }));
  FDRE #(
    .INIT(1'b0))
    \hls_LT_theta_global_V_1_data_reg_reg[9]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(add_ln703_1_fu_4702_p2[9]),
        .Q(hls_LT_theta_global_V[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    hls_LT_theta_global_V_1_vld_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter2),
        .Q(hls_LT_r_global_V_ap_vld),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF1FF11F110110010))
    \icmp_ln895_100_reg_5336[0]_i_1
       (.I0(max_bin_count_51_V[3]),
        .I1(max_bin_count_19_V[3]),
        .I2(\icmp_ln895_100_reg_5336[0]_i_2_n_0 ),
        .I3(select_ln422_59_fu_3095_p3[2]),
        .I4(select_ln422_11_fu_2823_p3[2]),
        .I5(select_ln422_11_fu_2823_p3[3]),
        .O(\icmp_ln895_100_reg_5336[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_100_reg_5336[0]_i_2
       (.I0(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ),
        .I1(max_bin_count_35_V[0]),
        .I2(max_bin_count_3_V[0]),
        .I3(select_ln422_59_fu_3095_p3[0]),
        .I4(select_ln422_59_fu_3095_p3[1]),
        .I5(select_ln422_11_fu_2823_p3[1]),
        .O(\icmp_ln895_100_reg_5336[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_100_reg_5336[0]_i_3
       (.I0(max_bin_count_3_V[2]),
        .I1(max_bin_count_35_V[2]),
        .I2(\icmp_ln895_68_reg_5093[0]_i_2_n_0 ),
        .I3(max_bin_count_35_V[3]),
        .I4(max_bin_count_3_V[3]),
        .O(select_ln422_11_fu_2823_p3[2]));
  FDRE \icmp_ln895_100_reg_5336_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_100_reg_5336[0]_i_1_n_0 ),
        .Q(icmp_ln895_100_reg_5336),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF1FF11F110110010))
    \icmp_ln895_101_reg_5347[0]_i_1
       (.I0(max_bin_count_52_V[3]),
        .I1(max_bin_count_20_V[3]),
        .I2(\icmp_ln895_101_reg_5347[0]_i_2_n_0 ),
        .I3(select_ln422_62_fu_3112_p3[2]),
        .I4(select_ln422_14_fu_2840_p3[2]),
        .I5(select_ln422_14_fu_2840_p3[3]),
        .O(\icmp_ln895_101_reg_5347[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_101_reg_5347[0]_i_2
       (.I0(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ),
        .I1(max_bin_count_36_V[0]),
        .I2(max_bin_count_4_V[0]),
        .I3(select_ln422_62_fu_3112_p3[0]),
        .I4(select_ln422_62_fu_3112_p3[1]),
        .I5(select_ln422_14_fu_2840_p3[1]),
        .O(\icmp_ln895_101_reg_5347[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_101_reg_5347[0]_i_3
       (.I0(max_bin_count_4_V[2]),
        .I1(max_bin_count_36_V[2]),
        .I2(\icmp_ln895_69_reg_5103[0]_i_2_n_0 ),
        .I3(max_bin_count_36_V[3]),
        .I4(max_bin_count_4_V[3]),
        .O(select_ln422_14_fu_2840_p3[2]));
  FDRE \icmp_ln895_101_reg_5347_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_101_reg_5347[0]_i_1_n_0 ),
        .Q(icmp_ln895_101_reg_5347),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF1FF11F110110010))
    \icmp_ln895_102_reg_5358[0]_i_1
       (.I0(max_bin_count_53_V[3]),
        .I1(max_bin_count_21_V[3]),
        .I2(\icmp_ln895_102_reg_5358[0]_i_2_n_0 ),
        .I3(select_ln422_65_fu_3129_p3[2]),
        .I4(select_ln422_17_fu_2857_p3[2]),
        .I5(select_ln422_17_fu_2857_p3[3]),
        .O(\icmp_ln895_102_reg_5358[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_102_reg_5358[0]_i_2
       (.I0(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ),
        .I1(max_bin_count_37_V[0]),
        .I2(max_bin_count_5_V[0]),
        .I3(select_ln422_65_fu_3129_p3[0]),
        .I4(select_ln422_65_fu_3129_p3[1]),
        .I5(select_ln422_17_fu_2857_p3[1]),
        .O(\icmp_ln895_102_reg_5358[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_102_reg_5358[0]_i_3
       (.I0(max_bin_count_5_V[2]),
        .I1(max_bin_count_37_V[2]),
        .I2(\icmp_ln895_70_reg_5113[0]_i_2_n_0 ),
        .I3(max_bin_count_37_V[3]),
        .I4(max_bin_count_5_V[3]),
        .O(select_ln422_17_fu_2857_p3[2]));
  FDRE \icmp_ln895_102_reg_5358_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_102_reg_5358[0]_i_1_n_0 ),
        .Q(icmp_ln895_102_reg_5358),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF1FF11F110110010))
    \icmp_ln895_103_reg_5369[0]_i_1
       (.I0(max_bin_count_54_V[3]),
        .I1(max_bin_count_22_V[3]),
        .I2(\icmp_ln895_103_reg_5369[0]_i_2_n_0 ),
        .I3(select_ln422_68_fu_3146_p3[2]),
        .I4(select_ln422_20_fu_2874_p3[2]),
        .I5(select_ln422_20_fu_2874_p3[3]),
        .O(\icmp_ln895_103_reg_5369[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_103_reg_5369[0]_i_2
       (.I0(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ),
        .I1(max_bin_count_38_V[0]),
        .I2(max_bin_count_6_V[0]),
        .I3(select_ln422_68_fu_3146_p3[0]),
        .I4(select_ln422_68_fu_3146_p3[1]),
        .I5(select_ln422_20_fu_2874_p3[1]),
        .O(\icmp_ln895_103_reg_5369[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_103_reg_5369[0]_i_3
       (.I0(max_bin_count_6_V[2]),
        .I1(max_bin_count_38_V[2]),
        .I2(\icmp_ln895_71_reg_5123[0]_i_2_n_0 ),
        .I3(max_bin_count_38_V[3]),
        .I4(max_bin_count_6_V[3]),
        .O(select_ln422_20_fu_2874_p3[2]));
  FDRE \icmp_ln895_103_reg_5369_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_103_reg_5369[0]_i_1_n_0 ),
        .Q(icmp_ln895_103_reg_5369),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF1FF11F110110010))
    \icmp_ln895_104_reg_5380[0]_i_1
       (.I0(max_bin_count_55_V[3]),
        .I1(max_bin_count_23_V[3]),
        .I2(\icmp_ln895_104_reg_5380[0]_i_2_n_0 ),
        .I3(select_ln422_71_fu_3163_p3[2]),
        .I4(select_ln422_23_fu_2891_p3[2]),
        .I5(select_ln422_23_fu_2891_p3[3]),
        .O(\icmp_ln895_104_reg_5380[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_104_reg_5380[0]_i_2
       (.I0(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ),
        .I1(max_bin_count_39_V[0]),
        .I2(max_bin_count_7_V[0]),
        .I3(select_ln422_71_fu_3163_p3[0]),
        .I4(select_ln422_71_fu_3163_p3[1]),
        .I5(select_ln422_23_fu_2891_p3[1]),
        .O(\icmp_ln895_104_reg_5380[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_104_reg_5380[0]_i_3
       (.I0(max_bin_count_7_V[2]),
        .I1(max_bin_count_39_V[2]),
        .I2(\icmp_ln895_72_reg_5133[0]_i_2_n_0 ),
        .I3(max_bin_count_39_V[3]),
        .I4(max_bin_count_7_V[3]),
        .O(select_ln422_23_fu_2891_p3[2]));
  FDRE \icmp_ln895_104_reg_5380_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_104_reg_5380[0]_i_1_n_0 ),
        .Q(icmp_ln895_104_reg_5380),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_105_reg_5391[0]_i_1
       (.I0(\icmp_ln895_105_reg_5391[0]_i_2_n_0 ),
        .I1(select_ln422_74_fu_3180_p3[2]),
        .I2(select_ln422_26_fu_2908_p3[2]),
        .I3(select_ln422_74_fu_3180_p3[3]),
        .I4(select_ln422_26_fu_2908_p3[3]),
        .O(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_105_reg_5391[0]_i_2
       (.I0(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .I1(max_bin_count_40_V[0]),
        .I2(max_bin_count_8_V[0]),
        .I3(select_ln422_74_fu_3180_p3[0]),
        .I4(select_ln422_74_fu_3180_p3[1]),
        .I5(select_ln422_26_fu_2908_p3[1]),
        .O(\icmp_ln895_105_reg_5391[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_105_reg_5391[0]_i_3
       (.I0(max_bin_count_8_V[2]),
        .I1(max_bin_count_40_V[2]),
        .I2(\icmp_ln895_73_reg_5143[0]_i_2_n_0 ),
        .I3(max_bin_count_40_V[3]),
        .I4(max_bin_count_8_V[3]),
        .O(select_ln422_26_fu_2908_p3[2]));
  FDRE \icmp_ln895_105_reg_5391_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ),
        .Q(icmp_ln895_105_reg_5391),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_106_reg_5406[0]_i_1
       (.I0(\icmp_ln895_106_reg_5406[0]_i_2_n_0 ),
        .I1(select_ln422_77_fu_3197_p3[2]),
        .I2(select_ln422_29_fu_2925_p3[2]),
        .I3(select_ln422_77_fu_3197_p3[3]),
        .I4(select_ln422_29_fu_2925_p3[3]),
        .O(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_106_reg_5406[0]_i_2
       (.I0(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .I1(max_bin_count_41_V[0]),
        .I2(max_bin_count_9_V[0]),
        .I3(select_ln422_77_fu_3197_p3[0]),
        .I4(select_ln422_77_fu_3197_p3[1]),
        .I5(select_ln422_29_fu_2925_p3[1]),
        .O(\icmp_ln895_106_reg_5406[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_106_reg_5406[0]_i_3
       (.I0(max_bin_count_9_V[2]),
        .I1(max_bin_count_41_V[2]),
        .I2(\icmp_ln895_74_reg_5148[0]_i_2_n_0 ),
        .I3(max_bin_count_41_V[3]),
        .I4(max_bin_count_9_V[3]),
        .O(select_ln422_29_fu_2925_p3[2]));
  FDRE \icmp_ln895_106_reg_5406_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ),
        .Q(icmp_ln895_106_reg_5406),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_107_reg_5421[0]_i_1
       (.I0(\icmp_ln895_107_reg_5421[0]_i_2_n_0 ),
        .I1(select_ln422_80_fu_3214_p3[2]),
        .I2(select_ln422_32_fu_2942_p3[2]),
        .I3(select_ln422_80_fu_3214_p3[3]),
        .I4(select_ln422_32_fu_2942_p3[3]),
        .O(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_107_reg_5421[0]_i_2
       (.I0(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .I1(max_bin_count_42_V[0]),
        .I2(max_bin_count_10_V[0]),
        .I3(select_ln422_80_fu_3214_p3[0]),
        .I4(select_ln422_80_fu_3214_p3[1]),
        .I5(select_ln422_32_fu_2942_p3[1]),
        .O(\icmp_ln895_107_reg_5421[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_107_reg_5421[0]_i_3
       (.I0(max_bin_count_10_V[2]),
        .I1(max_bin_count_42_V[2]),
        .I2(\icmp_ln895_75_reg_5153[0]_i_2_n_0 ),
        .I3(max_bin_count_42_V[3]),
        .I4(max_bin_count_10_V[3]),
        .O(select_ln422_32_fu_2942_p3[2]));
  FDRE \icmp_ln895_107_reg_5421_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ),
        .Q(icmp_ln895_107_reg_5421),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_108_reg_5436[0]_i_1
       (.I0(\icmp_ln895_108_reg_5436[0]_i_2_n_0 ),
        .I1(select_ln422_83_fu_3231_p3[2]),
        .I2(select_ln422_35_fu_2959_p3[2]),
        .I3(select_ln422_83_fu_3231_p3[3]),
        .I4(select_ln422_35_fu_2959_p3[3]),
        .O(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_108_reg_5436[0]_i_2
       (.I0(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .I1(max_bin_count_43_V[0]),
        .I2(max_bin_count_11_V[0]),
        .I3(select_ln422_83_fu_3231_p3[0]),
        .I4(select_ln422_83_fu_3231_p3[1]),
        .I5(select_ln422_35_fu_2959_p3[1]),
        .O(\icmp_ln895_108_reg_5436[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_108_reg_5436[0]_i_3
       (.I0(max_bin_count_11_V[2]),
        .I1(max_bin_count_43_V[2]),
        .I2(\icmp_ln895_76_reg_5158[0]_i_2_n_0 ),
        .I3(max_bin_count_43_V[3]),
        .I4(max_bin_count_11_V[3]),
        .O(select_ln422_35_fu_2959_p3[2]));
  FDRE \icmp_ln895_108_reg_5436_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ),
        .Q(icmp_ln895_108_reg_5436),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_109_reg_5451[0]_i_1
       (.I0(\icmp_ln895_109_reg_5451[0]_i_2_n_0 ),
        .I1(select_ln422_86_fu_3248_p3[2]),
        .I2(select_ln422_38_fu_2976_p3[2]),
        .I3(select_ln422_86_fu_3248_p3[3]),
        .I4(select_ln422_38_fu_2976_p3[3]),
        .O(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_109_reg_5451[0]_i_2
       (.I0(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .I1(max_bin_count_44_V[0]),
        .I2(max_bin_count_12_V[0]),
        .I3(select_ln422_86_fu_3248_p3[0]),
        .I4(select_ln422_86_fu_3248_p3[1]),
        .I5(select_ln422_38_fu_2976_p3[1]),
        .O(\icmp_ln895_109_reg_5451[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_109_reg_5451[0]_i_3
       (.I0(max_bin_count_12_V[2]),
        .I1(max_bin_count_44_V[2]),
        .I2(\icmp_ln895_77_reg_5163[0]_i_2_n_0 ),
        .I3(max_bin_count_44_V[3]),
        .I4(max_bin_count_12_V[3]),
        .O(select_ln422_38_fu_2976_p3[2]));
  FDRE \icmp_ln895_109_reg_5451_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ),
        .Q(icmp_ln895_109_reg_5451),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_10_reg_4793[0]_i_1
       (.I0(max_bin_count_10_V[2]),
        .I1(max_bin_count_10_V[3]),
        .I2(max_bin_count_10_V[1]),
        .I3(max_bin_count_10_V[0]),
        .O(p_1_in));
  FDRE \icmp_ln895_10_reg_4793_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(p_1_in),
        .Q(icmp_ln895_10_reg_4793),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_110_reg_5466[0]_i_1
       (.I0(\icmp_ln895_110_reg_5466[0]_i_2_n_0 ),
        .I1(select_ln422_89_fu_3265_p3[2]),
        .I2(select_ln422_41_fu_2993_p3[2]),
        .I3(select_ln422_89_fu_3265_p3[3]),
        .I4(select_ln422_41_fu_2993_p3[3]),
        .O(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_110_reg_5466[0]_i_2
       (.I0(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .I1(max_bin_count_45_V[0]),
        .I2(max_bin_count_13_V[0]),
        .I3(select_ln422_89_fu_3265_p3[0]),
        .I4(select_ln422_89_fu_3265_p3[1]),
        .I5(select_ln422_41_fu_2993_p3[1]),
        .O(\icmp_ln895_110_reg_5466[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_110_reg_5466[0]_i_3
       (.I0(max_bin_count_13_V[2]),
        .I1(max_bin_count_45_V[2]),
        .I2(\icmp_ln895_78_reg_5168[0]_i_2_n_0 ),
        .I3(max_bin_count_45_V[3]),
        .I4(max_bin_count_13_V[3]),
        .O(select_ln422_41_fu_2993_p3[2]));
  FDRE \icmp_ln895_110_reg_5466_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ),
        .Q(icmp_ln895_110_reg_5466),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_111_reg_5481[0]_i_1
       (.I0(\icmp_ln895_111_reg_5481[0]_i_2_n_0 ),
        .I1(select_ln422_92_fu_3282_p3[2]),
        .I2(select_ln422_44_fu_3010_p3[2]),
        .I3(select_ln422_92_fu_3282_p3[3]),
        .I4(select_ln422_44_fu_3010_p3[3]),
        .O(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_111_reg_5481[0]_i_2
       (.I0(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .I1(max_bin_count_46_V[0]),
        .I2(max_bin_count_14_V[0]),
        .I3(select_ln422_92_fu_3282_p3[0]),
        .I4(select_ln422_92_fu_3282_p3[1]),
        .I5(select_ln422_44_fu_3010_p3[1]),
        .O(\icmp_ln895_111_reg_5481[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_111_reg_5481[0]_i_3
       (.I0(max_bin_count_14_V[2]),
        .I1(max_bin_count_46_V[2]),
        .I2(\icmp_ln895_79_reg_5173[0]_i_2_n_0 ),
        .I3(max_bin_count_46_V[3]),
        .I4(max_bin_count_14_V[3]),
        .O(select_ln422_44_fu_3010_p3[2]));
  FDRE \icmp_ln895_111_reg_5481_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ),
        .Q(icmp_ln895_111_reg_5481),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_112_reg_5496[0]_i_1
       (.I0(\icmp_ln895_112_reg_5496[0]_i_2_n_0 ),
        .I1(select_ln422_95_fu_3299_p3[2]),
        .I2(select_ln422_47_fu_3027_p3[2]),
        .I3(select_ln422_95_fu_3299_p3[3]),
        .I4(select_ln422_47_fu_3027_p3[3]),
        .O(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_112_reg_5496[0]_i_2
       (.I0(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .I1(max_bin_count_47_V[0]),
        .I2(max_bin_count_15_V[0]),
        .I3(select_ln422_95_fu_3299_p3[0]),
        .I4(select_ln422_95_fu_3299_p3[1]),
        .I5(select_ln422_47_fu_3027_p3[1]),
        .O(\icmp_ln895_112_reg_5496[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_112_reg_5496[0]_i_3
       (.I0(max_bin_count_15_V[2]),
        .I1(max_bin_count_47_V[2]),
        .I2(\icmp_ln895_80_reg_5178[0]_i_2_n_0 ),
        .I3(max_bin_count_47_V[3]),
        .I4(max_bin_count_15_V[3]),
        .O(select_ln422_47_fu_3027_p3[2]));
  FDRE \icmp_ln895_112_reg_5496_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ),
        .Q(icmp_ln895_112_reg_5496),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_113_reg_5511[0]_i_1
       (.I0(\icmp_ln895_113_reg_5511[0]_i_2_n_0 ),
        .I1(select_ln440_26_fu_3388_p3[2]),
        .I2(select_ln440_2_fu_3308_p3[2]),
        .I3(select_ln440_26_fu_3388_p3[3]),
        .I4(select_ln440_2_fu_3308_p3[3]),
        .O(icmp_ln895_113_fu_2192_p2));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A))
    \icmp_ln895_113_reg_5511[0]_i_2
       (.I0(select_ln440_2_fu_3308_p3[0]),
        .I1(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ),
        .I2(select_ln422_74_fu_3180_p3[0]),
        .I3(select_ln422_26_fu_2908_p3[0]),
        .I4(select_ln440_26_fu_3388_p3[1]),
        .I5(select_ln440_2_fu_3308_p3[1]),
        .O(\icmp_ln895_113_reg_5511[0]_i_2_n_0 ));
  FDRE \icmp_ln895_113_reg_5511_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_113_fu_2192_p2),
        .Q(icmp_ln895_113_reg_5511),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_114_reg_5518[0]_i_1
       (.I0(\icmp_ln895_114_reg_5518[0]_i_2_n_0 ),
        .I1(select_ln440_29_fu_3405_p3[2]),
        .I2(select_ln440_5_fu_3317_p3[2]),
        .I3(select_ln440_29_fu_3405_p3[3]),
        .I4(select_ln440_5_fu_3317_p3[3]),
        .O(icmp_ln895_114_fu_2196_p2));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A))
    \icmp_ln895_114_reg_5518[0]_i_2
       (.I0(select_ln440_5_fu_3317_p3[0]),
        .I1(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ),
        .I2(select_ln422_77_fu_3197_p3[0]),
        .I3(select_ln422_29_fu_2925_p3[0]),
        .I4(select_ln440_29_fu_3405_p3[1]),
        .I5(select_ln440_5_fu_3317_p3[1]),
        .O(\icmp_ln895_114_reg_5518[0]_i_2_n_0 ));
  FDRE \icmp_ln895_114_reg_5518_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_114_fu_2196_p2),
        .Q(icmp_ln895_114_reg_5518),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_115_reg_5525[0]_i_1
       (.I0(\icmp_ln895_115_reg_5525[0]_i_2_n_0 ),
        .I1(select_ln440_32_fu_3422_p3[2]),
        .I2(select_ln440_8_fu_3326_p3[2]),
        .I3(select_ln440_32_fu_3422_p3[3]),
        .I4(select_ln440_8_fu_3326_p3[3]),
        .O(icmp_ln895_115_fu_2200_p2));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A))
    \icmp_ln895_115_reg_5525[0]_i_2
       (.I0(select_ln440_8_fu_3326_p3[0]),
        .I1(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ),
        .I2(select_ln422_80_fu_3214_p3[0]),
        .I3(select_ln422_32_fu_2942_p3[0]),
        .I4(select_ln440_32_fu_3422_p3[1]),
        .I5(select_ln440_8_fu_3326_p3[1]),
        .O(\icmp_ln895_115_reg_5525[0]_i_2_n_0 ));
  FDRE \icmp_ln895_115_reg_5525_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_115_fu_2200_p2),
        .Q(icmp_ln895_115_reg_5525),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_116_reg_5532[0]_i_1
       (.I0(\icmp_ln895_116_reg_5532[0]_i_2_n_0 ),
        .I1(select_ln440_35_fu_3439_p3[2]),
        .I2(select_ln440_11_fu_3335_p3[2]),
        .I3(select_ln440_35_fu_3439_p3[3]),
        .I4(select_ln440_11_fu_3335_p3[3]),
        .O(icmp_ln895_116_fu_2204_p2));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A))
    \icmp_ln895_116_reg_5532[0]_i_2
       (.I0(select_ln440_11_fu_3335_p3[0]),
        .I1(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ),
        .I2(select_ln422_83_fu_3231_p3[0]),
        .I3(select_ln422_35_fu_2959_p3[0]),
        .I4(select_ln440_35_fu_3439_p3[1]),
        .I5(select_ln440_11_fu_3335_p3[1]),
        .O(\icmp_ln895_116_reg_5532[0]_i_2_n_0 ));
  FDRE \icmp_ln895_116_reg_5532_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_116_fu_2204_p2),
        .Q(icmp_ln895_116_reg_5532),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_117_reg_5539[0]_i_1
       (.I0(\icmp_ln895_117_reg_5539[0]_i_2_n_0 ),
        .I1(select_ln440_38_fu_3456_p3[2]),
        .I2(select_ln440_14_fu_3344_p3[2]),
        .I3(select_ln440_38_fu_3456_p3[3]),
        .I4(select_ln440_14_fu_3344_p3[3]),
        .O(icmp_ln895_117_fu_2208_p2));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A))
    \icmp_ln895_117_reg_5539[0]_i_2
       (.I0(select_ln440_14_fu_3344_p3[0]),
        .I1(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ),
        .I2(select_ln422_86_fu_3248_p3[0]),
        .I3(select_ln422_38_fu_2976_p3[0]),
        .I4(select_ln440_38_fu_3456_p3[1]),
        .I5(select_ln440_14_fu_3344_p3[1]),
        .O(\icmp_ln895_117_reg_5539[0]_i_2_n_0 ));
  FDRE \icmp_ln895_117_reg_5539_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_117_fu_2208_p2),
        .Q(icmp_ln895_117_reg_5539),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_118_reg_5546[0]_i_1
       (.I0(\icmp_ln895_118_reg_5546[0]_i_2_n_0 ),
        .I1(select_ln440_41_fu_3473_p3[2]),
        .I2(select_ln440_17_fu_3353_p3[2]),
        .I3(select_ln440_41_fu_3473_p3[3]),
        .I4(select_ln440_17_fu_3353_p3[3]),
        .O(icmp_ln895_118_fu_2212_p2));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A))
    \icmp_ln895_118_reg_5546[0]_i_2
       (.I0(select_ln440_17_fu_3353_p3[0]),
        .I1(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ),
        .I2(select_ln422_89_fu_3265_p3[0]),
        .I3(select_ln422_41_fu_2993_p3[0]),
        .I4(select_ln440_41_fu_3473_p3[1]),
        .I5(select_ln440_17_fu_3353_p3[1]),
        .O(\icmp_ln895_118_reg_5546[0]_i_2_n_0 ));
  FDRE \icmp_ln895_118_reg_5546_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_118_fu_2212_p2),
        .Q(icmp_ln895_118_reg_5546),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_119_reg_5553[0]_i_1
       (.I0(\icmp_ln895_119_reg_5553[0]_i_2_n_0 ),
        .I1(select_ln440_44_fu_3490_p3[2]),
        .I2(select_ln440_20_fu_3362_p3[2]),
        .I3(select_ln440_44_fu_3490_p3[3]),
        .I4(select_ln440_20_fu_3362_p3[3]),
        .O(icmp_ln895_119_fu_2216_p2));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A))
    \icmp_ln895_119_reg_5553[0]_i_2
       (.I0(select_ln440_20_fu_3362_p3[0]),
        .I1(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ),
        .I2(select_ln422_92_fu_3282_p3[0]),
        .I3(select_ln422_44_fu_3010_p3[0]),
        .I4(select_ln440_44_fu_3490_p3[1]),
        .I5(select_ln440_20_fu_3362_p3[1]),
        .O(\icmp_ln895_119_reg_5553[0]_i_2_n_0 ));
  FDRE \icmp_ln895_119_reg_5553_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_119_fu_2216_p2),
        .Q(icmp_ln895_119_reg_5553),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_11_reg_4798[0]_i_1
       (.I0(max_bin_count_11_V[2]),
        .I1(max_bin_count_11_V[3]),
        .I2(max_bin_count_11_V[1]),
        .I3(max_bin_count_11_V[0]),
        .O(\icmp_ln895_11_reg_4798[0]_i_1_n_0 ));
  FDRE \icmp_ln895_11_reg_4798_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_11_reg_4798[0]_i_1_n_0 ),
        .Q(icmp_ln895_11_reg_4798),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \icmp_ln895_120_reg_5560[0]_i_1
       (.I0(\icmp_ln895_120_reg_5560[0]_i_2_n_0 ),
        .I1(select_ln440_47_fu_3507_p3[2]),
        .I2(select_ln440_23_fu_3371_p3[2]),
        .I3(select_ln440_47_fu_3507_p3[3]),
        .I4(select_ln440_23_fu_3371_p3[3]),
        .O(icmp_ln895_120_fu_2220_p2));
  LUT6 #(
    .INIT(64'h028AFFFF0000028A))
    \icmp_ln895_120_reg_5560[0]_i_2
       (.I0(select_ln440_23_fu_3371_p3[0]),
        .I1(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ),
        .I2(select_ln422_95_fu_3299_p3[0]),
        .I3(select_ln422_47_fu_3027_p3[0]),
        .I4(select_ln440_47_fu_3507_p3[1]),
        .I5(select_ln440_23_fu_3371_p3[1]),
        .O(\icmp_ln895_120_reg_5560[0]_i_2_n_0 ));
  FDRE \icmp_ln895_120_reg_5560_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(icmp_ln895_120_fu_2220_p2),
        .Q(icmp_ln895_120_reg_5560),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair16" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_125_reg_5577[0]_i_1
       (.I0(\res_max_bin_count_t_s_reg_5587[1]_i_4_n_0 ),
        .I1(select_ln476_8_fu_4558_p3[3]),
        .I2(select_ln476_2_fu_4508_p3[3]),
        .O(\icmp_ln895_125_reg_5577[0]_i_1_n_0 ));
  FDRE \icmp_ln895_125_reg_5577_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_125_reg_5577[0]_i_1_n_0 ),
        .Q(icmp_ln895_125_reg_5577),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_12_reg_4803[0]_i_1
       (.I0(max_bin_count_12_V[2]),
        .I1(max_bin_count_12_V[3]),
        .I2(max_bin_count_12_V[1]),
        .I3(max_bin_count_12_V[0]),
        .O(\icmp_ln895_12_reg_4803[0]_i_1_n_0 ));
  FDRE \icmp_ln895_12_reg_4803_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_12_reg_4803[0]_i_1_n_0 ),
        .Q(icmp_ln895_12_reg_4803),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_13_reg_4808[0]_i_1
       (.I0(max_bin_count_13_V[2]),
        .I1(max_bin_count_13_V[3]),
        .I2(max_bin_count_13_V[1]),
        .I3(max_bin_count_13_V[0]),
        .O(\icmp_ln895_13_reg_4808[0]_i_1_n_0 ));
  FDRE \icmp_ln895_13_reg_4808_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_13_reg_4808[0]_i_1_n_0 ),
        .Q(icmp_ln895_13_reg_4808),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_14_reg_4813[0]_i_1
       (.I0(max_bin_count_14_V[2]),
        .I1(max_bin_count_14_V[3]),
        .I2(max_bin_count_14_V[1]),
        .I3(max_bin_count_14_V[0]),
        .O(\icmp_ln895_14_reg_4813[0]_i_1_n_0 ));
  FDRE \icmp_ln895_14_reg_4813_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_14_reg_4813[0]_i_1_n_0 ),
        .Q(icmp_ln895_14_reg_4813),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_15_reg_4818[0]_i_1
       (.I0(max_bin_count_15_V[2]),
        .I1(max_bin_count_15_V[3]),
        .I2(max_bin_count_15_V[1]),
        .I3(max_bin_count_15_V[0]),
        .O(\icmp_ln895_15_reg_4818[0]_i_1_n_0 ));
  FDRE \icmp_ln895_15_reg_4818_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_15_reg_4818[0]_i_1_n_0 ),
        .Q(icmp_ln895_15_reg_4818),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_16_reg_4823[0]_i_1
       (.I0(max_bin_count_16_V[2]),
        .I1(max_bin_count_16_V[3]),
        .I2(max_bin_count_16_V[1]),
        .I3(max_bin_count_16_V[0]),
        .O(\icmp_ln895_16_reg_4823[0]_i_1_n_0 ));
  FDRE \icmp_ln895_16_reg_4823_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_16_reg_4823[0]_i_1_n_0 ),
        .Q(icmp_ln895_16_reg_4823),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_17_reg_4828[0]_i_1
       (.I0(max_bin_count_17_V[2]),
        .I1(max_bin_count_17_V[3]),
        .I2(max_bin_count_17_V[1]),
        .I3(max_bin_count_17_V[0]),
        .O(\icmp_ln895_17_reg_4828[0]_i_1_n_0 ));
  FDRE \icmp_ln895_17_reg_4828_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_17_reg_4828[0]_i_1_n_0 ),
        .Q(icmp_ln895_17_reg_4828),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_18_reg_4833[0]_i_1
       (.I0(max_bin_count_18_V[2]),
        .I1(max_bin_count_18_V[3]),
        .I2(max_bin_count_18_V[1]),
        .I3(max_bin_count_18_V[0]),
        .O(\icmp_ln895_18_reg_4833[0]_i_1_n_0 ));
  FDRE \icmp_ln895_18_reg_4833_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_18_reg_4833[0]_i_1_n_0 ),
        .Q(icmp_ln895_18_reg_4833),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_19_reg_4838[0]_i_1
       (.I0(max_bin_count_19_V[2]),
        .I1(max_bin_count_19_V[3]),
        .I2(max_bin_count_19_V[1]),
        .I3(max_bin_count_19_V[0]),
        .O(\icmp_ln895_19_reg_4838[0]_i_1_n_0 ));
  FDRE \icmp_ln895_19_reg_4838_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_19_reg_4838[0]_i_1_n_0 ),
        .Q(icmp_ln895_19_reg_4838),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_1_reg_4748[0]_i_1
       (.I0(max_bin_count_1_V[2]),
        .I1(max_bin_count_1_V[3]),
        .I2(max_bin_count_1_V[1]),
        .I3(max_bin_count_1_V[0]),
        .O(\icmp_ln895_1_reg_4748[0]_i_1_n_0 ));
  FDRE \icmp_ln895_1_reg_4748_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_1_reg_4748[0]_i_1_n_0 ),
        .Q(icmp_ln895_1_reg_4748),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_20_reg_4843[0]_i_1
       (.I0(max_bin_count_20_V[2]),
        .I1(max_bin_count_20_V[3]),
        .I2(max_bin_count_20_V[1]),
        .I3(max_bin_count_20_V[0]),
        .O(\icmp_ln895_20_reg_4843[0]_i_1_n_0 ));
  FDRE \icmp_ln895_20_reg_4843_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_20_reg_4843[0]_i_1_n_0 ),
        .Q(icmp_ln895_20_reg_4843),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_21_reg_4848[0]_i_1
       (.I0(max_bin_count_21_V[2]),
        .I1(max_bin_count_21_V[3]),
        .I2(max_bin_count_21_V[1]),
        .I3(max_bin_count_21_V[0]),
        .O(\icmp_ln895_21_reg_4848[0]_i_1_n_0 ));
  FDRE \icmp_ln895_21_reg_4848_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_21_reg_4848[0]_i_1_n_0 ),
        .Q(icmp_ln895_21_reg_4848),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_22_reg_4853[0]_i_1
       (.I0(max_bin_count_22_V[2]),
        .I1(max_bin_count_22_V[3]),
        .I2(max_bin_count_22_V[1]),
        .I3(max_bin_count_22_V[0]),
        .O(\icmp_ln895_22_reg_4853[0]_i_1_n_0 ));
  FDRE \icmp_ln895_22_reg_4853_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_22_reg_4853[0]_i_1_n_0 ),
        .Q(icmp_ln895_22_reg_4853),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_23_reg_4858[0]_i_1
       (.I0(max_bin_count_23_V[2]),
        .I1(max_bin_count_23_V[3]),
        .I2(max_bin_count_23_V[1]),
        .I3(max_bin_count_23_V[0]),
        .O(\icmp_ln895_23_reg_4858[0]_i_1_n_0 ));
  FDRE \icmp_ln895_23_reg_4858_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_23_reg_4858[0]_i_1_n_0 ),
        .Q(icmp_ln895_23_reg_4858),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_24_reg_4863[0]_i_1
       (.I0(max_bin_count_24_V[2]),
        .I1(max_bin_count_24_V[3]),
        .I2(max_bin_count_24_V[1]),
        .I3(max_bin_count_24_V[0]),
        .O(\icmp_ln895_24_reg_4863[0]_i_1_n_0 ));
  FDRE \icmp_ln895_24_reg_4863_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_24_reg_4863[0]_i_1_n_0 ),
        .Q(icmp_ln895_24_reg_4863),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_25_reg_4868[0]_i_1
       (.I0(max_bin_count_25_V[2]),
        .I1(max_bin_count_25_V[3]),
        .I2(max_bin_count_25_V[1]),
        .I3(max_bin_count_25_V[0]),
        .O(\icmp_ln895_25_reg_4868[0]_i_1_n_0 ));
  FDRE \icmp_ln895_25_reg_4868_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_25_reg_4868[0]_i_1_n_0 ),
        .Q(icmp_ln895_25_reg_4868),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_26_reg_4873[0]_i_1
       (.I0(max_bin_count_26_V[2]),
        .I1(max_bin_count_26_V[3]),
        .I2(max_bin_count_26_V[1]),
        .I3(max_bin_count_26_V[0]),
        .O(\icmp_ln895_26_reg_4873[0]_i_1_n_0 ));
  FDRE \icmp_ln895_26_reg_4873_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_26_reg_4873[0]_i_1_n_0 ),
        .Q(icmp_ln895_26_reg_4873),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_27_reg_4878[0]_i_1
       (.I0(max_bin_count_27_V[2]),
        .I1(max_bin_count_27_V[3]),
        .I2(max_bin_count_27_V[1]),
        .I3(max_bin_count_27_V[0]),
        .O(\icmp_ln895_27_reg_4878[0]_i_1_n_0 ));
  FDRE \icmp_ln895_27_reg_4878_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_27_reg_4878[0]_i_1_n_0 ),
        .Q(icmp_ln895_27_reg_4878),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_28_reg_4883[0]_i_1
       (.I0(max_bin_count_28_V[2]),
        .I1(max_bin_count_28_V[3]),
        .I2(max_bin_count_28_V[1]),
        .I3(max_bin_count_28_V[0]),
        .O(\icmp_ln895_28_reg_4883[0]_i_1_n_0 ));
  FDRE \icmp_ln895_28_reg_4883_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_28_reg_4883[0]_i_1_n_0 ),
        .Q(icmp_ln895_28_reg_4883),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_29_reg_4888[0]_i_1
       (.I0(max_bin_count_29_V[2]),
        .I1(max_bin_count_29_V[3]),
        .I2(max_bin_count_29_V[1]),
        .I3(max_bin_count_29_V[0]),
        .O(\icmp_ln895_29_reg_4888[0]_i_1_n_0 ));
  FDRE \icmp_ln895_29_reg_4888_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_29_reg_4888[0]_i_1_n_0 ),
        .Q(icmp_ln895_29_reg_4888),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_2_reg_4753[0]_i_1
       (.I0(max_bin_count_2_V[2]),
        .I1(max_bin_count_2_V[3]),
        .I2(max_bin_count_2_V[1]),
        .I3(max_bin_count_2_V[0]),
        .O(\icmp_ln895_2_reg_4753[0]_i_1_n_0 ));
  FDRE \icmp_ln895_2_reg_4753_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_2_reg_4753[0]_i_1_n_0 ),
        .Q(icmp_ln895_2_reg_4753),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_30_reg_4893[0]_i_1
       (.I0(max_bin_count_30_V[2]),
        .I1(max_bin_count_30_V[3]),
        .I2(max_bin_count_30_V[1]),
        .I3(max_bin_count_30_V[0]),
        .O(\icmp_ln895_30_reg_4893[0]_i_1_n_0 ));
  FDRE \icmp_ln895_30_reg_4893_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_30_reg_4893[0]_i_1_n_0 ),
        .Q(icmp_ln895_30_reg_4893),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_31_reg_4898[0]_i_1
       (.I0(max_bin_count_31_V[2]),
        .I1(max_bin_count_31_V[3]),
        .I2(max_bin_count_31_V[1]),
        .I3(max_bin_count_31_V[0]),
        .O(\icmp_ln895_31_reg_4898[0]_i_1_n_0 ));
  FDRE \icmp_ln895_31_reg_4898_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_31_reg_4898[0]_i_1_n_0 ),
        .Q(icmp_ln895_31_reg_4898),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_32_reg_4903[0]_i_1
       (.I0(max_bin_count_32_V[2]),
        .I1(max_bin_count_32_V[3]),
        .I2(max_bin_count_32_V[1]),
        .I3(max_bin_count_32_V[0]),
        .O(\icmp_ln895_32_reg_4903[0]_i_1_n_0 ));
  FDRE \icmp_ln895_32_reg_4903_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_32_reg_4903[0]_i_1_n_0 ),
        .Q(icmp_ln895_32_reg_4903),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_33_reg_4908[0]_i_1
       (.I0(max_bin_count_33_V[2]),
        .I1(max_bin_count_33_V[3]),
        .I2(max_bin_count_33_V[1]),
        .I3(max_bin_count_33_V[0]),
        .O(\icmp_ln895_33_reg_4908[0]_i_1_n_0 ));
  FDRE \icmp_ln895_33_reg_4908_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_33_reg_4908[0]_i_1_n_0 ),
        .Q(icmp_ln895_33_reg_4908),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_34_reg_4913[0]_i_1
       (.I0(max_bin_count_34_V[2]),
        .I1(max_bin_count_34_V[3]),
        .I2(max_bin_count_34_V[1]),
        .I3(max_bin_count_34_V[0]),
        .O(\icmp_ln895_34_reg_4913[0]_i_1_n_0 ));
  FDRE \icmp_ln895_34_reg_4913_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_34_reg_4913[0]_i_1_n_0 ),
        .Q(icmp_ln895_34_reg_4913),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_35_reg_4918[0]_i_1
       (.I0(max_bin_count_35_V[2]),
        .I1(max_bin_count_35_V[3]),
        .I2(max_bin_count_35_V[1]),
        .I3(max_bin_count_35_V[0]),
        .O(\icmp_ln895_35_reg_4918[0]_i_1_n_0 ));
  FDRE \icmp_ln895_35_reg_4918_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_35_reg_4918[0]_i_1_n_0 ),
        .Q(icmp_ln895_35_reg_4918),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_36_reg_4923[0]_i_1
       (.I0(max_bin_count_36_V[2]),
        .I1(max_bin_count_36_V[3]),
        .I2(max_bin_count_36_V[1]),
        .I3(max_bin_count_36_V[0]),
        .O(\icmp_ln895_36_reg_4923[0]_i_1_n_0 ));
  FDRE \icmp_ln895_36_reg_4923_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_36_reg_4923[0]_i_1_n_0 ),
        .Q(icmp_ln895_36_reg_4923),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_37_reg_4928[0]_i_1
       (.I0(max_bin_count_37_V[2]),
        .I1(max_bin_count_37_V[3]),
        .I2(max_bin_count_37_V[1]),
        .I3(max_bin_count_37_V[0]),
        .O(\icmp_ln895_37_reg_4928[0]_i_1_n_0 ));
  FDRE \icmp_ln895_37_reg_4928_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_37_reg_4928[0]_i_1_n_0 ),
        .Q(icmp_ln895_37_reg_4928),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_38_reg_4933[0]_i_1
       (.I0(max_bin_count_38_V[2]),
        .I1(max_bin_count_38_V[3]),
        .I2(max_bin_count_38_V[1]),
        .I3(max_bin_count_38_V[0]),
        .O(\icmp_ln895_38_reg_4933[0]_i_1_n_0 ));
  FDRE \icmp_ln895_38_reg_4933_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_38_reg_4933[0]_i_1_n_0 ),
        .Q(icmp_ln895_38_reg_4933),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_39_reg_4938[0]_i_1
       (.I0(max_bin_count_39_V[2]),
        .I1(max_bin_count_39_V[3]),
        .I2(max_bin_count_39_V[1]),
        .I3(max_bin_count_39_V[0]),
        .O(\icmp_ln895_39_reg_4938[0]_i_1_n_0 ));
  FDRE \icmp_ln895_39_reg_4938_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_39_reg_4938[0]_i_1_n_0 ),
        .Q(icmp_ln895_39_reg_4938),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_3_reg_4758[0]_i_1
       (.I0(max_bin_count_3_V[2]),
        .I1(max_bin_count_3_V[3]),
        .I2(max_bin_count_3_V[1]),
        .I3(max_bin_count_3_V[0]),
        .O(\icmp_ln895_3_reg_4758[0]_i_1_n_0 ));
  FDRE \icmp_ln895_3_reg_4758_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_3_reg_4758[0]_i_1_n_0 ),
        .Q(icmp_ln895_3_reg_4758),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_40_reg_4943[0]_i_1
       (.I0(max_bin_count_40_V[2]),
        .I1(max_bin_count_40_V[3]),
        .I2(max_bin_count_40_V[1]),
        .I3(max_bin_count_40_V[0]),
        .O(p_3_in));
  FDRE \icmp_ln895_40_reg_4943_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(p_3_in),
        .Q(icmp_ln895_40_reg_4943),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_41_reg_4948[0]_i_1
       (.I0(max_bin_count_41_V[2]),
        .I1(max_bin_count_41_V[3]),
        .I2(max_bin_count_41_V[1]),
        .I3(max_bin_count_41_V[0]),
        .O(\icmp_ln895_41_reg_4948[0]_i_1_n_0 ));
  FDRE \icmp_ln895_41_reg_4948_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_41_reg_4948[0]_i_1_n_0 ),
        .Q(icmp_ln895_41_reg_4948),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_42_reg_4953[0]_i_1
       (.I0(max_bin_count_42_V[2]),
        .I1(max_bin_count_42_V[3]),
        .I2(max_bin_count_42_V[1]),
        .I3(max_bin_count_42_V[0]),
        .O(\icmp_ln895_42_reg_4953[0]_i_1_n_0 ));
  FDRE \icmp_ln895_42_reg_4953_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_42_reg_4953[0]_i_1_n_0 ),
        .Q(icmp_ln895_42_reg_4953),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_43_reg_4958[0]_i_1
       (.I0(max_bin_count_43_V[2]),
        .I1(max_bin_count_43_V[3]),
        .I2(max_bin_count_43_V[1]),
        .I3(max_bin_count_43_V[0]),
        .O(\icmp_ln895_43_reg_4958[0]_i_1_n_0 ));
  FDRE \icmp_ln895_43_reg_4958_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_43_reg_4958[0]_i_1_n_0 ),
        .Q(icmp_ln895_43_reg_4958),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_44_reg_4963[0]_i_1
       (.I0(max_bin_count_44_V[2]),
        .I1(max_bin_count_44_V[3]),
        .I2(max_bin_count_44_V[1]),
        .I3(max_bin_count_44_V[0]),
        .O(\icmp_ln895_44_reg_4963[0]_i_1_n_0 ));
  FDRE \icmp_ln895_44_reg_4963_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_44_reg_4963[0]_i_1_n_0 ),
        .Q(icmp_ln895_44_reg_4963),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_45_reg_4968[0]_i_1
       (.I0(max_bin_count_45_V[2]),
        .I1(max_bin_count_45_V[3]),
        .I2(max_bin_count_45_V[1]),
        .I3(max_bin_count_45_V[0]),
        .O(\icmp_ln895_45_reg_4968[0]_i_1_n_0 ));
  FDRE \icmp_ln895_45_reg_4968_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_45_reg_4968[0]_i_1_n_0 ),
        .Q(icmp_ln895_45_reg_4968),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_46_reg_4973[0]_i_1
       (.I0(max_bin_count_46_V[2]),
        .I1(max_bin_count_46_V[3]),
        .I2(max_bin_count_46_V[1]),
        .I3(max_bin_count_46_V[0]),
        .O(\icmp_ln895_46_reg_4973[0]_i_1_n_0 ));
  FDRE \icmp_ln895_46_reg_4973_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_46_reg_4973[0]_i_1_n_0 ),
        .Q(icmp_ln895_46_reg_4973),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_47_reg_4978[0]_i_1
       (.I0(max_bin_count_47_V[2]),
        .I1(max_bin_count_47_V[3]),
        .I2(max_bin_count_47_V[1]),
        .I3(max_bin_count_47_V[0]),
        .O(\icmp_ln895_47_reg_4978[0]_i_1_n_0 ));
  FDRE \icmp_ln895_47_reg_4978_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_47_reg_4978[0]_i_1_n_0 ),
        .Q(icmp_ln895_47_reg_4978),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_48_reg_4983[0]_i_1
       (.I0(max_bin_count_48_V[2]),
        .I1(max_bin_count_48_V[3]),
        .I2(max_bin_count_48_V[1]),
        .I3(max_bin_count_48_V[0]),
        .O(\icmp_ln895_48_reg_4983[0]_i_1_n_0 ));
  FDRE \icmp_ln895_48_reg_4983_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_48_reg_4983[0]_i_1_n_0 ),
        .Q(icmp_ln895_48_reg_4983),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_49_reg_4988[0]_i_1
       (.I0(max_bin_count_49_V[2]),
        .I1(max_bin_count_49_V[3]),
        .I2(max_bin_count_49_V[1]),
        .I3(max_bin_count_49_V[0]),
        .O(\icmp_ln895_49_reg_4988[0]_i_1_n_0 ));
  FDRE \icmp_ln895_49_reg_4988_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_49_reg_4988[0]_i_1_n_0 ),
        .Q(icmp_ln895_49_reg_4988),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_4_reg_4763[0]_i_1
       (.I0(max_bin_count_4_V[2]),
        .I1(max_bin_count_4_V[3]),
        .I2(max_bin_count_4_V[1]),
        .I3(max_bin_count_4_V[0]),
        .O(\icmp_ln895_4_reg_4763[0]_i_1_n_0 ));
  FDRE \icmp_ln895_4_reg_4763_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_4_reg_4763[0]_i_1_n_0 ),
        .Q(icmp_ln895_4_reg_4763),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_50_reg_4993[0]_i_1
       (.I0(max_bin_count_50_V[2]),
        .I1(max_bin_count_50_V[3]),
        .I2(max_bin_count_50_V[1]),
        .I3(max_bin_count_50_V[0]),
        .O(\icmp_ln895_50_reg_4993[0]_i_1_n_0 ));
  FDRE \icmp_ln895_50_reg_4993_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_50_reg_4993[0]_i_1_n_0 ),
        .Q(icmp_ln895_50_reg_4993),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_51_reg_4998[0]_i_1
       (.I0(max_bin_count_51_V[2]),
        .I1(max_bin_count_51_V[3]),
        .I2(max_bin_count_51_V[1]),
        .I3(max_bin_count_51_V[0]),
        .O(\icmp_ln895_51_reg_4998[0]_i_1_n_0 ));
  FDRE \icmp_ln895_51_reg_4998_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_51_reg_4998[0]_i_1_n_0 ),
        .Q(icmp_ln895_51_reg_4998),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_52_reg_5003[0]_i_1
       (.I0(max_bin_count_52_V[2]),
        .I1(max_bin_count_52_V[3]),
        .I2(max_bin_count_52_V[1]),
        .I3(max_bin_count_52_V[0]),
        .O(\icmp_ln895_52_reg_5003[0]_i_1_n_0 ));
  FDRE \icmp_ln895_52_reg_5003_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_52_reg_5003[0]_i_1_n_0 ),
        .Q(icmp_ln895_52_reg_5003),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_53_reg_5008[0]_i_1
       (.I0(max_bin_count_53_V[2]),
        .I1(max_bin_count_53_V[3]),
        .I2(max_bin_count_53_V[1]),
        .I3(max_bin_count_53_V[0]),
        .O(\icmp_ln895_53_reg_5008[0]_i_1_n_0 ));
  FDRE \icmp_ln895_53_reg_5008_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_53_reg_5008[0]_i_1_n_0 ),
        .Q(icmp_ln895_53_reg_5008),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_54_reg_5013[0]_i_1
       (.I0(max_bin_count_54_V[2]),
        .I1(max_bin_count_54_V[3]),
        .I2(max_bin_count_54_V[1]),
        .I3(max_bin_count_54_V[0]),
        .O(\icmp_ln895_54_reg_5013[0]_i_1_n_0 ));
  FDRE \icmp_ln895_54_reg_5013_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_54_reg_5013[0]_i_1_n_0 ),
        .Q(icmp_ln895_54_reg_5013),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_55_reg_5018[0]_i_1
       (.I0(max_bin_count_55_V[2]),
        .I1(max_bin_count_55_V[3]),
        .I2(max_bin_count_55_V[1]),
        .I3(max_bin_count_55_V[0]),
        .O(\icmp_ln895_55_reg_5018[0]_i_1_n_0 ));
  FDRE \icmp_ln895_55_reg_5018_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_55_reg_5018[0]_i_1_n_0 ),
        .Q(icmp_ln895_55_reg_5018),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_56_reg_5023[0]_i_1
       (.I0(max_bin_count_56_V[2]),
        .I1(max_bin_count_56_V[3]),
        .I2(max_bin_count_56_V[1]),
        .I3(max_bin_count_56_V[0]),
        .O(\icmp_ln895_56_reg_5023[0]_i_1_n_0 ));
  FDRE \icmp_ln895_56_reg_5023_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_56_reg_5023[0]_i_1_n_0 ),
        .Q(icmp_ln895_56_reg_5023),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_57_reg_5028[0]_i_1
       (.I0(max_bin_count_57_V[2]),
        .I1(max_bin_count_57_V[3]),
        .I2(max_bin_count_57_V[1]),
        .I3(max_bin_count_57_V[0]),
        .O(\icmp_ln895_57_reg_5028[0]_i_1_n_0 ));
  FDRE \icmp_ln895_57_reg_5028_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_57_reg_5028[0]_i_1_n_0 ),
        .Q(icmp_ln895_57_reg_5028),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_58_reg_5033[0]_i_1
       (.I0(max_bin_count_58_V[2]),
        .I1(max_bin_count_58_V[3]),
        .I2(max_bin_count_58_V[1]),
        .I3(max_bin_count_58_V[0]),
        .O(\icmp_ln895_58_reg_5033[0]_i_1_n_0 ));
  FDRE \icmp_ln895_58_reg_5033_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_58_reg_5033[0]_i_1_n_0 ),
        .Q(icmp_ln895_58_reg_5033),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_59_reg_5038[0]_i_1
       (.I0(max_bin_count_59_V[2]),
        .I1(max_bin_count_59_V[3]),
        .I2(max_bin_count_59_V[1]),
        .I3(max_bin_count_59_V[0]),
        .O(\icmp_ln895_59_reg_5038[0]_i_1_n_0 ));
  FDRE \icmp_ln895_59_reg_5038_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_59_reg_5038[0]_i_1_n_0 ),
        .Q(icmp_ln895_59_reg_5038),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_60_reg_5043[0]_i_1
       (.I0(max_bin_count_60_V[2]),
        .I1(max_bin_count_60_V[3]),
        .I2(max_bin_count_60_V[1]),
        .I3(max_bin_count_60_V[0]),
        .O(\icmp_ln895_60_reg_5043[0]_i_1_n_0 ));
  FDRE \icmp_ln895_60_reg_5043_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_60_reg_5043[0]_i_1_n_0 ),
        .Q(icmp_ln895_60_reg_5043),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_61_reg_5048[0]_i_1
       (.I0(max_bin_count_61_V[2]),
        .I1(max_bin_count_61_V[3]),
        .I2(max_bin_count_61_V[1]),
        .I3(max_bin_count_61_V[0]),
        .O(\icmp_ln895_61_reg_5048[0]_i_1_n_0 ));
  FDRE \icmp_ln895_61_reg_5048_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_61_reg_5048[0]_i_1_n_0 ),
        .Q(icmp_ln895_61_reg_5048),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_62_reg_5053[0]_i_1
       (.I0(max_bin_count_62_V[2]),
        .I1(max_bin_count_62_V[3]),
        .I2(max_bin_count_62_V[1]),
        .I3(max_bin_count_62_V[0]),
        .O(\icmp_ln895_62_reg_5053[0]_i_1_n_0 ));
  FDRE \icmp_ln895_62_reg_5053_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_62_reg_5053[0]_i_1_n_0 ),
        .Q(icmp_ln895_62_reg_5053),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_63_reg_5058[0]_i_1
       (.I0(max_bin_count_63_V[2]),
        .I1(max_bin_count_63_V[3]),
        .I2(max_bin_count_63_V[1]),
        .I3(max_bin_count_63_V[0]),
        .O(\icmp_ln895_63_reg_5058[0]_i_1_n_0 ));
  FDRE \icmp_ln895_63_reg_5058_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_63_reg_5058[0]_i_1_n_0 ),
        .Q(icmp_ln895_63_reg_5058),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_64_reg_4773[0]_i_1
       (.I0(max_bin_count_6_V[2]),
        .I1(max_bin_count_6_V[3]),
        .I2(max_bin_count_6_V[1]),
        .I3(max_bin_count_6_V[0]),
        .O(\icmp_ln895_64_reg_4773[0]_i_1_n_0 ));
  FDRE \icmp_ln895_64_reg_4773_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_64_reg_4773[0]_i_1_n_0 ),
        .Q(icmp_ln895_64_reg_4773),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair35" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_65_reg_5063[0]_i_1
       (.I0(\icmp_ln895_65_reg_5063[0]_i_2_n_0 ),
        .I1(max_bin_count_32_V[3]),
        .I2(max_bin_count_0_V[3]),
        .O(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_65_reg_5063[0]_i_2
       (.I0(max_bin_count_0_V[0]),
        .I1(max_bin_count_32_V[0]),
        .I2(max_bin_count_32_V[1]),
        .I3(max_bin_count_0_V[1]),
        .I4(max_bin_count_32_V[2]),
        .I5(max_bin_count_0_V[2]),
        .O(\icmp_ln895_65_reg_5063[0]_i_2_n_0 ));
  FDRE \icmp_ln895_65_reg_5063_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ),
        .Q(icmp_ln895_65_reg_5063),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair37" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_66_reg_5073[0]_i_1
       (.I0(\icmp_ln895_66_reg_5073[0]_i_2_n_0 ),
        .I1(max_bin_count_33_V[3]),
        .I2(max_bin_count_1_V[3]),
        .O(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_66_reg_5073[0]_i_2
       (.I0(max_bin_count_1_V[0]),
        .I1(max_bin_count_33_V[0]),
        .I2(max_bin_count_33_V[1]),
        .I3(max_bin_count_1_V[1]),
        .I4(max_bin_count_33_V[2]),
        .I5(max_bin_count_1_V[2]),
        .O(\icmp_ln895_66_reg_5073[0]_i_2_n_0 ));
  FDRE \icmp_ln895_66_reg_5073_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ),
        .Q(icmp_ln895_66_reg_5073),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair52" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_67_reg_5083[0]_i_1
       (.I0(\icmp_ln895_67_reg_5083[0]_i_2_n_0 ),
        .I1(max_bin_count_34_V[3]),
        .I2(max_bin_count_2_V[3]),
        .O(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_67_reg_5083[0]_i_2
       (.I0(max_bin_count_2_V[0]),
        .I1(max_bin_count_34_V[0]),
        .I2(max_bin_count_34_V[1]),
        .I3(max_bin_count_2_V[1]),
        .I4(max_bin_count_34_V[2]),
        .I5(max_bin_count_2_V[2]),
        .O(\icmp_ln895_67_reg_5083[0]_i_2_n_0 ));
  FDRE \icmp_ln895_67_reg_5083_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ),
        .Q(icmp_ln895_67_reg_5083),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair10" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_68_reg_5093[0]_i_1
       (.I0(\icmp_ln895_68_reg_5093[0]_i_2_n_0 ),
        .I1(max_bin_count_35_V[3]),
        .I2(max_bin_count_3_V[3]),
        .O(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_68_reg_5093[0]_i_2
       (.I0(max_bin_count_3_V[0]),
        .I1(max_bin_count_35_V[0]),
        .I2(max_bin_count_35_V[1]),
        .I3(max_bin_count_3_V[1]),
        .I4(max_bin_count_35_V[2]),
        .I5(max_bin_count_3_V[2]),
        .O(\icmp_ln895_68_reg_5093[0]_i_2_n_0 ));
  FDRE \icmp_ln895_68_reg_5093_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ),
        .Q(icmp_ln895_68_reg_5093),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair51" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_69_reg_5103[0]_i_1
       (.I0(\icmp_ln895_69_reg_5103[0]_i_2_n_0 ),
        .I1(max_bin_count_36_V[3]),
        .I2(max_bin_count_4_V[3]),
        .O(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_69_reg_5103[0]_i_2
       (.I0(max_bin_count_4_V[0]),
        .I1(max_bin_count_36_V[0]),
        .I2(max_bin_count_36_V[1]),
        .I3(max_bin_count_4_V[1]),
        .I4(max_bin_count_36_V[2]),
        .I5(max_bin_count_4_V[2]),
        .O(\icmp_ln895_69_reg_5103[0]_i_2_n_0 ));
  FDRE \icmp_ln895_69_reg_5103_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ),
        .Q(icmp_ln895_69_reg_5103),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_6_reg_4768[0]_i_1
       (.I0(max_bin_count_5_V[2]),
        .I1(max_bin_count_5_V[3]),
        .I2(max_bin_count_5_V[1]),
        .I3(max_bin_count_5_V[0]),
        .O(\icmp_ln895_6_reg_4768[0]_i_1_n_0 ));
  FDRE \icmp_ln895_6_reg_4768_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_6_reg_4768[0]_i_1_n_0 ),
        .Q(icmp_ln895_6_reg_4768),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair24" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_70_reg_5113[0]_i_1
       (.I0(\icmp_ln895_70_reg_5113[0]_i_2_n_0 ),
        .I1(max_bin_count_37_V[3]),
        .I2(max_bin_count_5_V[3]),
        .O(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_70_reg_5113[0]_i_2
       (.I0(max_bin_count_5_V[0]),
        .I1(max_bin_count_37_V[0]),
        .I2(max_bin_count_37_V[1]),
        .I3(max_bin_count_5_V[1]),
        .I4(max_bin_count_37_V[2]),
        .I5(max_bin_count_5_V[2]),
        .O(\icmp_ln895_70_reg_5113[0]_i_2_n_0 ));
  FDRE \icmp_ln895_70_reg_5113_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ),
        .Q(icmp_ln895_70_reg_5113),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair49" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_71_reg_5123[0]_i_1
       (.I0(\icmp_ln895_71_reg_5123[0]_i_2_n_0 ),
        .I1(max_bin_count_38_V[3]),
        .I2(max_bin_count_6_V[3]),
        .O(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_71_reg_5123[0]_i_2
       (.I0(max_bin_count_6_V[0]),
        .I1(max_bin_count_38_V[0]),
        .I2(max_bin_count_38_V[1]),
        .I3(max_bin_count_6_V[1]),
        .I4(max_bin_count_38_V[2]),
        .I5(max_bin_count_6_V[2]),
        .O(\icmp_ln895_71_reg_5123[0]_i_2_n_0 ));
  FDRE \icmp_ln895_71_reg_5123_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ),
        .Q(icmp_ln895_71_reg_5123),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair13" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_72_reg_5133[0]_i_1
       (.I0(\icmp_ln895_72_reg_5133[0]_i_2_n_0 ),
        .I1(max_bin_count_39_V[3]),
        .I2(max_bin_count_7_V[3]),
        .O(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_72_reg_5133[0]_i_2
       (.I0(max_bin_count_7_V[0]),
        .I1(max_bin_count_39_V[0]),
        .I2(max_bin_count_39_V[1]),
        .I3(max_bin_count_7_V[1]),
        .I4(max_bin_count_39_V[2]),
        .I5(max_bin_count_7_V[2]),
        .O(\icmp_ln895_72_reg_5133[0]_i_2_n_0 ));
  FDRE \icmp_ln895_72_reg_5133_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ),
        .Q(icmp_ln895_72_reg_5133),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair44" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_73_reg_5143[0]_i_1
       (.I0(\icmp_ln895_73_reg_5143[0]_i_2_n_0 ),
        .I1(max_bin_count_40_V[3]),
        .I2(max_bin_count_8_V[3]),
        .O(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_73_reg_5143[0]_i_2
       (.I0(max_bin_count_8_V[0]),
        .I1(max_bin_count_40_V[0]),
        .I2(max_bin_count_40_V[1]),
        .I3(max_bin_count_8_V[1]),
        .I4(max_bin_count_40_V[2]),
        .I5(max_bin_count_8_V[2]),
        .O(\icmp_ln895_73_reg_5143[0]_i_2_n_0 ));
  FDRE \icmp_ln895_73_reg_5143_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .Q(icmp_ln895_73_reg_5143),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair32" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_74_reg_5148[0]_i_1
       (.I0(\icmp_ln895_74_reg_5148[0]_i_2_n_0 ),
        .I1(max_bin_count_41_V[3]),
        .I2(max_bin_count_9_V[3]),
        .O(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_74_reg_5148[0]_i_2
       (.I0(max_bin_count_9_V[0]),
        .I1(max_bin_count_41_V[0]),
        .I2(max_bin_count_41_V[1]),
        .I3(max_bin_count_9_V[1]),
        .I4(max_bin_count_41_V[2]),
        .I5(max_bin_count_9_V[2]),
        .O(\icmp_ln895_74_reg_5148[0]_i_2_n_0 ));
  FDRE \icmp_ln895_74_reg_5148_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .Q(icmp_ln895_74_reg_5148),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair50" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_75_reg_5153[0]_i_1
       (.I0(\icmp_ln895_75_reg_5153[0]_i_2_n_0 ),
        .I1(max_bin_count_42_V[3]),
        .I2(max_bin_count_10_V[3]),
        .O(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_75_reg_5153[0]_i_2
       (.I0(max_bin_count_10_V[0]),
        .I1(max_bin_count_42_V[0]),
        .I2(max_bin_count_42_V[1]),
        .I3(max_bin_count_10_V[1]),
        .I4(max_bin_count_42_V[2]),
        .I5(max_bin_count_10_V[2]),
        .O(\icmp_ln895_75_reg_5153[0]_i_2_n_0 ));
  FDRE \icmp_ln895_75_reg_5153_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .Q(icmp_ln895_75_reg_5153),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_76_reg_5158[0]_i_1
       (.I0(\icmp_ln895_76_reg_5158[0]_i_2_n_0 ),
        .I1(max_bin_count_43_V[3]),
        .I2(max_bin_count_11_V[3]),
        .O(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_76_reg_5158[0]_i_2
       (.I0(max_bin_count_11_V[0]),
        .I1(max_bin_count_43_V[0]),
        .I2(max_bin_count_43_V[1]),
        .I3(max_bin_count_11_V[1]),
        .I4(max_bin_count_43_V[2]),
        .I5(max_bin_count_11_V[2]),
        .O(\icmp_ln895_76_reg_5158[0]_i_2_n_0 ));
  FDRE \icmp_ln895_76_reg_5158_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .Q(icmp_ln895_76_reg_5158),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair38" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_77_reg_5163[0]_i_1
       (.I0(\icmp_ln895_77_reg_5163[0]_i_2_n_0 ),
        .I1(max_bin_count_44_V[3]),
        .I2(max_bin_count_12_V[3]),
        .O(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_77_reg_5163[0]_i_2
       (.I0(max_bin_count_12_V[0]),
        .I1(max_bin_count_44_V[0]),
        .I2(max_bin_count_44_V[1]),
        .I3(max_bin_count_12_V[1]),
        .I4(max_bin_count_44_V[2]),
        .I5(max_bin_count_12_V[2]),
        .O(\icmp_ln895_77_reg_5163[0]_i_2_n_0 ));
  FDRE \icmp_ln895_77_reg_5163_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .Q(icmp_ln895_77_reg_5163),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair22" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_78_reg_5168[0]_i_1
       (.I0(\icmp_ln895_78_reg_5168[0]_i_2_n_0 ),
        .I1(max_bin_count_45_V[3]),
        .I2(max_bin_count_13_V[3]),
        .O(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_78_reg_5168[0]_i_2
       (.I0(max_bin_count_13_V[0]),
        .I1(max_bin_count_45_V[0]),
        .I2(max_bin_count_45_V[1]),
        .I3(max_bin_count_13_V[1]),
        .I4(max_bin_count_45_V[2]),
        .I5(max_bin_count_13_V[2]),
        .O(\icmp_ln895_78_reg_5168[0]_i_2_n_0 ));
  FDRE \icmp_ln895_78_reg_5168_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .Q(icmp_ln895_78_reg_5168),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair45" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_79_reg_5173[0]_i_1
       (.I0(\icmp_ln895_79_reg_5173[0]_i_2_n_0 ),
        .I1(max_bin_count_46_V[3]),
        .I2(max_bin_count_14_V[3]),
        .O(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_79_reg_5173[0]_i_2
       (.I0(max_bin_count_14_V[0]),
        .I1(max_bin_count_46_V[0]),
        .I2(max_bin_count_46_V[1]),
        .I3(max_bin_count_14_V[1]),
        .I4(max_bin_count_46_V[2]),
        .I5(max_bin_count_14_V[2]),
        .O(\icmp_ln895_79_reg_5173[0]_i_2_n_0 ));
  FDRE \icmp_ln895_79_reg_5173_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .Q(icmp_ln895_79_reg_5173),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_7_reg_4778[0]_i_1
       (.I0(max_bin_count_7_V[2]),
        .I1(max_bin_count_7_V[3]),
        .I2(max_bin_count_7_V[1]),
        .I3(max_bin_count_7_V[0]),
        .O(\icmp_ln895_7_reg_4778[0]_i_1_n_0 ));
  FDRE \icmp_ln895_7_reg_4778_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_7_reg_4778[0]_i_1_n_0 ),
        .Q(icmp_ln895_7_reg_4778),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair29" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_80_reg_5178[0]_i_1
       (.I0(\icmp_ln895_80_reg_5178[0]_i_2_n_0 ),
        .I1(max_bin_count_47_V[3]),
        .I2(max_bin_count_15_V[3]),
        .O(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_80_reg_5178[0]_i_2
       (.I0(max_bin_count_15_V[0]),
        .I1(max_bin_count_47_V[0]),
        .I2(max_bin_count_47_V[1]),
        .I3(max_bin_count_15_V[1]),
        .I4(max_bin_count_47_V[2]),
        .I5(max_bin_count_15_V[2]),
        .O(\icmp_ln895_80_reg_5178[0]_i_2_n_0 ));
  FDRE \icmp_ln895_80_reg_5178_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .Q(icmp_ln895_80_reg_5178),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair36" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_81_reg_5183[0]_i_1
       (.I0(\select_ln422_49_reg_5188[6]_i_3_n_0 ),
        .I1(max_bin_count_48_V[3]),
        .I2(max_bin_count_16_V[3]),
        .O(\icmp_ln895_81_reg_5183[0]_i_1_n_0 ));
  FDRE \icmp_ln895_81_reg_5183_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_81_reg_5183[0]_i_1_n_0 ),
        .Q(icmp_ln895_81_reg_5183),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair34" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_82_reg_5193[0]_i_1
       (.I0(\select_ln422_52_reg_5198[6]_i_3_n_0 ),
        .I1(max_bin_count_49_V[3]),
        .I2(max_bin_count_17_V[3]),
        .O(\icmp_ln895_82_reg_5193[0]_i_1_n_0 ));
  FDRE \icmp_ln895_82_reg_5193_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_82_reg_5193[0]_i_1_n_0 ),
        .Q(icmp_ln895_82_reg_5193),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair54" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_83_reg_5203[0]_i_1
       (.I0(\select_ln422_55_reg_5208[6]_i_3_n_0 ),
        .I1(max_bin_count_50_V[3]),
        .I2(max_bin_count_18_V[3]),
        .O(\icmp_ln895_83_reg_5203[0]_i_1_n_0 ));
  FDRE \icmp_ln895_83_reg_5203_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_83_reg_5203[0]_i_1_n_0 ),
        .Q(icmp_ln895_83_reg_5203),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair7" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_84_reg_5213[0]_i_1
       (.I0(\select_ln422_58_reg_5218[6]_i_3_n_0 ),
        .I1(max_bin_count_51_V[3]),
        .I2(max_bin_count_19_V[3]),
        .O(\icmp_ln895_84_reg_5213[0]_i_1_n_0 ));
  FDRE \icmp_ln895_84_reg_5213_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_84_reg_5213[0]_i_1_n_0 ),
        .Q(icmp_ln895_84_reg_5213),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair39" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_85_reg_5223[0]_i_1
       (.I0(\select_ln422_61_reg_5228[6]_i_3_n_0 ),
        .I1(max_bin_count_52_V[3]),
        .I2(max_bin_count_20_V[3]),
        .O(\icmp_ln895_85_reg_5223[0]_i_1_n_0 ));
  FDRE \icmp_ln895_85_reg_5223_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_85_reg_5223[0]_i_1_n_0 ),
        .Q(icmp_ln895_85_reg_5223),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair23" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_86_reg_5233[0]_i_1
       (.I0(\select_ln422_64_reg_5238[6]_i_3_n_0 ),
        .I1(max_bin_count_53_V[3]),
        .I2(max_bin_count_21_V[3]),
        .O(\icmp_ln895_86_reg_5233[0]_i_1_n_0 ));
  FDRE \icmp_ln895_86_reg_5233_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_86_reg_5233[0]_i_1_n_0 ),
        .Q(icmp_ln895_86_reg_5233),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair47" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_87_reg_5243[0]_i_1
       (.I0(\select_ln422_67_reg_5248[6]_i_3_n_0 ),
        .I1(max_bin_count_54_V[3]),
        .I2(max_bin_count_22_V[3]),
        .O(\icmp_ln895_87_reg_5243[0]_i_1_n_0 ));
  FDRE \icmp_ln895_87_reg_5243_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_87_reg_5243[0]_i_1_n_0 ),
        .Q(icmp_ln895_87_reg_5243),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair28" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_88_reg_5253[0]_i_1
       (.I0(\select_ln422_70_reg_5258[6]_i_3_n_0 ),
        .I1(max_bin_count_55_V[3]),
        .I2(max_bin_count_23_V[3]),
        .O(\icmp_ln895_88_reg_5253[0]_i_1_n_0 ));
  FDRE \icmp_ln895_88_reg_5253_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_88_reg_5253[0]_i_1_n_0 ),
        .Q(icmp_ln895_88_reg_5253),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair48" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_89_reg_5263[0]_i_1
       (.I0(\icmp_ln895_89_reg_5263[0]_i_2_n_0 ),
        .I1(max_bin_count_56_V[3]),
        .I2(max_bin_count_24_V[3]),
        .O(\icmp_ln895_89_reg_5263[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_89_reg_5263[0]_i_2
       (.I0(max_bin_count_24_V[0]),
        .I1(max_bin_count_56_V[0]),
        .I2(max_bin_count_56_V[1]),
        .I3(max_bin_count_24_V[1]),
        .I4(max_bin_count_56_V[2]),
        .I5(max_bin_count_24_V[2]),
        .O(\icmp_ln895_89_reg_5263[0]_i_2_n_0 ));
  FDRE \icmp_ln895_89_reg_5263_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_89_reg_5263[0]_i_1_n_0 ),
        .Q(icmp_ln895_89_reg_5263),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_8_reg_4783[0]_i_1
       (.I0(max_bin_count_8_V[2]),
        .I1(max_bin_count_8_V[3]),
        .I2(max_bin_count_8_V[1]),
        .I3(max_bin_count_8_V[0]),
        .O(\icmp_ln895_8_reg_4783[0]_i_1_n_0 ));
  FDRE \icmp_ln895_8_reg_4783_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_8_reg_4783[0]_i_1_n_0 ),
        .Q(icmp_ln895_8_reg_4783),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair31" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_90_reg_5268[0]_i_1
       (.I0(\icmp_ln895_90_reg_5268[0]_i_2_n_0 ),
        .I1(max_bin_count_57_V[3]),
        .I2(max_bin_count_25_V[3]),
        .O(\icmp_ln895_90_reg_5268[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_90_reg_5268[0]_i_2
       (.I0(max_bin_count_25_V[0]),
        .I1(max_bin_count_57_V[0]),
        .I2(max_bin_count_57_V[1]),
        .I3(max_bin_count_25_V[1]),
        .I4(max_bin_count_57_V[2]),
        .I5(max_bin_count_25_V[2]),
        .O(\icmp_ln895_90_reg_5268[0]_i_2_n_0 ));
  FDRE \icmp_ln895_90_reg_5268_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_90_reg_5268[0]_i_1_n_0 ),
        .Q(icmp_ln895_90_reg_5268),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair46" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_91_reg_5273[0]_i_1
       (.I0(\icmp_ln895_91_reg_5273[0]_i_2_n_0 ),
        .I1(max_bin_count_58_V[3]),
        .I2(max_bin_count_26_V[3]),
        .O(\icmp_ln895_91_reg_5273[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_91_reg_5273[0]_i_2
       (.I0(max_bin_count_26_V[0]),
        .I1(max_bin_count_58_V[0]),
        .I2(max_bin_count_58_V[1]),
        .I3(max_bin_count_26_V[1]),
        .I4(max_bin_count_58_V[2]),
        .I5(max_bin_count_26_V[2]),
        .O(\icmp_ln895_91_reg_5273[0]_i_2_n_0 ));
  FDRE \icmp_ln895_91_reg_5273_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_91_reg_5273[0]_i_1_n_0 ),
        .Q(icmp_ln895_91_reg_5273),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_92_reg_5278[0]_i_1
       (.I0(\icmp_ln895_92_reg_5278[0]_i_2_n_0 ),
        .I1(max_bin_count_59_V[3]),
        .I2(max_bin_count_27_V[3]),
        .O(\icmp_ln895_92_reg_5278[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_92_reg_5278[0]_i_2
       (.I0(max_bin_count_27_V[0]),
        .I1(max_bin_count_59_V[0]),
        .I2(max_bin_count_59_V[1]),
        .I3(max_bin_count_27_V[1]),
        .I4(max_bin_count_59_V[2]),
        .I5(max_bin_count_27_V[2]),
        .O(\icmp_ln895_92_reg_5278[0]_i_2_n_0 ));
  FDRE \icmp_ln895_92_reg_5278_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_92_reg_5278[0]_i_1_n_0 ),
        .Q(icmp_ln895_92_reg_5278),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair33" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_93_reg_5283[0]_i_1
       (.I0(\icmp_ln895_93_reg_5283[0]_i_2_n_0 ),
        .I1(max_bin_count_60_V[3]),
        .I2(max_bin_count_28_V[3]),
        .O(\icmp_ln895_93_reg_5283[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_93_reg_5283[0]_i_2
       (.I0(max_bin_count_28_V[0]),
        .I1(max_bin_count_60_V[0]),
        .I2(max_bin_count_60_V[1]),
        .I3(max_bin_count_28_V[1]),
        .I4(max_bin_count_60_V[2]),
        .I5(max_bin_count_28_V[2]),
        .O(\icmp_ln895_93_reg_5283[0]_i_2_n_0 ));
  FDRE \icmp_ln895_93_reg_5283_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_93_reg_5283[0]_i_1_n_0 ),
        .Q(icmp_ln895_93_reg_5283),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair21" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_94_reg_5288[0]_i_1
       (.I0(\icmp_ln895_94_reg_5288[0]_i_2_n_0 ),
        .I1(max_bin_count_61_V[3]),
        .I2(max_bin_count_29_V[3]),
        .O(\icmp_ln895_94_reg_5288[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_94_reg_5288[0]_i_2
       (.I0(max_bin_count_29_V[0]),
        .I1(max_bin_count_61_V[0]),
        .I2(max_bin_count_61_V[1]),
        .I3(max_bin_count_29_V[1]),
        .I4(max_bin_count_61_V[2]),
        .I5(max_bin_count_29_V[2]),
        .O(\icmp_ln895_94_reg_5288[0]_i_2_n_0 ));
  FDRE \icmp_ln895_94_reg_5288_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_94_reg_5288[0]_i_1_n_0 ),
        .Q(icmp_ln895_94_reg_5288),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair43" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_95_reg_5293[0]_i_1
       (.I0(\icmp_ln895_95_reg_5293[0]_i_2_n_0 ),
        .I1(max_bin_count_62_V[3]),
        .I2(max_bin_count_30_V[3]),
        .O(\icmp_ln895_95_reg_5293[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_95_reg_5293[0]_i_2
       (.I0(max_bin_count_30_V[0]),
        .I1(max_bin_count_62_V[0]),
        .I2(max_bin_count_62_V[1]),
        .I3(max_bin_count_30_V[1]),
        .I4(max_bin_count_62_V[2]),
        .I5(max_bin_count_30_V[2]),
        .O(\icmp_ln895_95_reg_5293[0]_i_2_n_0 ));
  FDRE \icmp_ln895_95_reg_5293_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_95_reg_5293[0]_i_1_n_0 ),
        .Q(icmp_ln895_95_reg_5293),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *)
  LUT3 #(
    .INIT(8'hB2))
    \icmp_ln895_96_reg_5298[0]_i_1
       (.I0(\icmp_ln895_96_reg_5298[0]_i_2_n_0 ),
        .I1(max_bin_count_63_V[3]),
        .I2(max_bin_count_31_V[3]),
        .O(\icmp_ln895_96_reg_5298[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \icmp_ln895_96_reg_5298[0]_i_2
       (.I0(max_bin_count_31_V[0]),
        .I1(max_bin_count_63_V[0]),
        .I2(max_bin_count_63_V[1]),
        .I3(max_bin_count_31_V[1]),
        .I4(max_bin_count_63_V[2]),
        .I5(max_bin_count_31_V[2]),
        .O(\icmp_ln895_96_reg_5298[0]_i_2_n_0 ));
  FDRE \icmp_ln895_96_reg_5298_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_96_reg_5298[0]_i_1_n_0 ),
        .Q(icmp_ln895_96_reg_5298),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF1FF11F110110010))
    \icmp_ln895_97_reg_5303[0]_i_1
       (.I0(max_bin_count_48_V[3]),
        .I1(max_bin_count_16_V[3]),
        .I2(\icmp_ln895_97_reg_5303[0]_i_2_n_0 ),
        .I3(select_ln422_50_fu_3044_p3[2]),
        .I4(select_ln422_2_fu_2772_p3[2]),
        .I5(select_ln422_2_fu_2772_p3[3]),
        .O(\icmp_ln895_97_reg_5303[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_97_reg_5303[0]_i_2
       (.I0(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ),
        .I1(max_bin_count_32_V[0]),
        .I2(max_bin_count_0_V[0]),
        .I3(select_ln422_50_fu_3044_p3[0]),
        .I4(select_ln422_50_fu_3044_p3[1]),
        .I5(select_ln422_2_fu_2772_p3[1]),
        .O(\icmp_ln895_97_reg_5303[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_97_reg_5303[0]_i_3
       (.I0(max_bin_count_0_V[2]),
        .I1(max_bin_count_32_V[2]),
        .I2(\icmp_ln895_65_reg_5063[0]_i_2_n_0 ),
        .I3(max_bin_count_32_V[3]),
        .I4(max_bin_count_0_V[3]),
        .O(select_ln422_2_fu_2772_p3[2]));
  FDRE \icmp_ln895_97_reg_5303_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_97_reg_5303[0]_i_1_n_0 ),
        .Q(icmp_ln895_97_reg_5303),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF1FF11F110110010))
    \icmp_ln895_98_reg_5314[0]_i_1
       (.I0(max_bin_count_49_V[3]),
        .I1(max_bin_count_17_V[3]),
        .I2(\icmp_ln895_98_reg_5314[0]_i_2_n_0 ),
        .I3(select_ln422_53_fu_3061_p3[2]),
        .I4(select_ln422_5_fu_2789_p3[2]),
        .I5(select_ln422_5_fu_2789_p3[3]),
        .O(\icmp_ln895_98_reg_5314[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_98_reg_5314[0]_i_2
       (.I0(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ),
        .I1(max_bin_count_33_V[0]),
        .I2(max_bin_count_1_V[0]),
        .I3(select_ln422_53_fu_3061_p3[0]),
        .I4(select_ln422_53_fu_3061_p3[1]),
        .I5(select_ln422_5_fu_2789_p3[1]),
        .O(\icmp_ln895_98_reg_5314[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_98_reg_5314[0]_i_3
       (.I0(max_bin_count_1_V[2]),
        .I1(max_bin_count_33_V[2]),
        .I2(\icmp_ln895_66_reg_5073[0]_i_2_n_0 ),
        .I3(max_bin_count_33_V[3]),
        .I4(max_bin_count_1_V[3]),
        .O(select_ln422_5_fu_2789_p3[2]));
  FDRE \icmp_ln895_98_reg_5314_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_98_reg_5314[0]_i_1_n_0 ),
        .Q(icmp_ln895_98_reg_5314),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF1FF11F110110010))
    \icmp_ln895_99_reg_5325[0]_i_1
       (.I0(max_bin_count_50_V[3]),
        .I1(max_bin_count_18_V[3]),
        .I2(\icmp_ln895_99_reg_5325[0]_i_2_n_0 ),
        .I3(select_ln422_56_fu_3078_p3[2]),
        .I4(select_ln422_8_fu_2806_p3[2]),
        .I5(select_ln422_8_fu_2806_p3[3]),
        .O(\icmp_ln895_99_reg_5325[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \icmp_ln895_99_reg_5325[0]_i_2
       (.I0(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ),
        .I1(max_bin_count_34_V[0]),
        .I2(max_bin_count_2_V[0]),
        .I3(select_ln422_56_fu_3078_p3[0]),
        .I4(select_ln422_56_fu_3078_p3[1]),
        .I5(select_ln422_8_fu_2806_p3[1]),
        .O(\icmp_ln895_99_reg_5325[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \icmp_ln895_99_reg_5325[0]_i_3
       (.I0(max_bin_count_2_V[2]),
        .I1(max_bin_count_34_V[2]),
        .I2(\icmp_ln895_67_reg_5083[0]_i_2_n_0 ),
        .I3(max_bin_count_34_V[3]),
        .I4(max_bin_count_2_V[3]),
        .O(select_ln422_8_fu_2806_p3[2]));
  FDRE \icmp_ln895_99_reg_5325_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_99_reg_5325[0]_i_1_n_0 ),
        .Q(icmp_ln895_99_reg_5325),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_9_reg_4788[0]_i_1
       (.I0(max_bin_count_9_V[2]),
        .I1(max_bin_count_9_V[3]),
        .I2(max_bin_count_9_V[1]),
        .I3(max_bin_count_9_V[0]),
        .O(\icmp_ln895_9_reg_4788[0]_i_1_n_0 ));
  FDRE \icmp_ln895_9_reg_4788_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_9_reg_4788[0]_i_1_n_0 ),
        .Q(icmp_ln895_9_reg_4788),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001))
    \icmp_ln895_reg_4743[0]_i_1
       (.I0(max_bin_count_0_V[2]),
        .I1(max_bin_count_0_V[3]),
        .I2(max_bin_count_0_V[1]),
        .I3(max_bin_count_0_V[0]),
        .O(\icmp_ln895_reg_4743[0]_i_1_n_0 ));
  FDRE \icmp_ln895_reg_4743_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(\icmp_ln895_reg_4743[0]_i_1_n_0 ),
        .Q(icmp_ln895_reg_4743),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair66" *)
  LUT3 #(
    .INIT(8'hAC))
    \res_max_bin_count_V_1_data_reg[0]_i_1
       (.I0(res_max_bin_count_t_s_reg_5587[0]),
        .I1(res_max_bin_count_t_1_reg_5603[0]),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .O(res_max_bin_count_t_2_fu_4637_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair67" *)
  LUT3 #(
    .INIT(8'hAC))
    \res_max_bin_count_V_1_data_reg[1]_i_1
       (.I0(res_max_bin_count_t_s_reg_5587[1]),
        .I1(res_max_bin_count_t_1_reg_5603[1]),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .O(res_max_bin_count_t_2_fu_4637_p3[1]));
  LUT3 #(
    .INIT(8'hAC))
    \res_max_bin_count_V_1_data_reg[2]_i_1
       (.I0(res_max_bin_count_t_s_reg_5587[2]),
        .I1(res_max_bin_count_t_1_reg_5603[2]),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .O(res_max_bin_count_t_2_fu_4637_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair67" *)
  LUT3 #(
    .INIT(8'hAC))
    \res_max_bin_count_V_1_data_reg[3]_i_1
       (.I0(res_max_bin_count_t_s_reg_5587[3]),
        .I1(res_max_bin_count_t_1_reg_5603[3]),
        .I2(\hls_LT_theta_V_1_data_reg[8]_i_2_n_0 ),
        .O(res_max_bin_count_t_2_fu_4637_p3[3]));
  FDRE #(
    .INIT(1'b0))
    \res_max_bin_count_V_1_data_reg_reg[0]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(res_max_bin_count_t_2_fu_4637_p3[0]),
        .Q(res_max_bin_count_V[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \res_max_bin_count_V_1_data_reg_reg[1]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(res_max_bin_count_t_2_fu_4637_p3[1]),
        .Q(res_max_bin_count_V[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \res_max_bin_count_V_1_data_reg_reg[2]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(res_max_bin_count_t_2_fu_4637_p3[2]),
        .Q(res_max_bin_count_V[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0))
    \res_max_bin_count_V_1_data_reg_reg[3]
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(res_max_bin_count_t_2_fu_4637_p3[3]),
        .Q(res_max_bin_count_V[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hBFB0BFBF8F808080))
    \res_max_bin_count_t_1_reg_5603[0]_i_1
       (.I0(\res_max_bin_count_t_1_reg_5603[0]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_count_t_1_reg_5603[0]_i_3_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_count_t_1_reg_5603[0]_i_4_n_0 ),
        .O(res_max_bin_count_t_1_fu_4624_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair72" *)
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_count_t_1_reg_5603[0]_i_2
       (.I0(select_ln440_5_reg_5320[0]),
        .I1(icmp_ln895_114_reg_5518),
        .I2(select_ln440_29_reg_5416[0]),
        .O(\res_max_bin_count_t_1_reg_5603[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *)
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_count_t_1_reg_5603[0]_i_3
       (.I0(select_ln440_17_reg_5364[0]),
        .I1(icmp_ln895_118_reg_5546),
        .I2(select_ln440_41_reg_5476[0]),
        .O(\res_max_bin_count_t_1_reg_5603[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_count_t_1_reg_5603[0]_i_4
       (.I0(select_ln440_11_reg_5342[0]),
        .I1(icmp_ln895_116_reg_5532),
        .I2(select_ln440_35_reg_5446[0]),
        .I3(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ),
        .I4(\res_max_bin_count_t_1_reg_5603[0]_i_5_n_0 ),
        .O(\res_max_bin_count_t_1_reg_5603[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *)
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_count_t_1_reg_5603[0]_i_5
       (.I0(select_ln440_23_reg_5386[0]),
        .I1(icmp_ln895_120_reg_5560),
        .I2(select_ln440_47_reg_5506[0]),
        .O(\res_max_bin_count_t_1_reg_5603[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hBFB0BFBF8F808080))
    \res_max_bin_count_t_1_reg_5603[1]_i_1
       (.I0(\res_max_bin_count_t_1_reg_5603[1]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_count_t_1_reg_5603[1]_i_3_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_count_t_1_reg_5603[1]_i_4_n_0 ),
        .O(res_max_bin_count_t_1_fu_4624_p3[1]));
  (* SOFT_HLUTNM = "soft_lutpair69" *)
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_count_t_1_reg_5603[1]_i_2
       (.I0(select_ln440_5_reg_5320[1]),
        .I1(icmp_ln895_114_reg_5518),
        .I2(select_ln440_29_reg_5416[1]),
        .O(\res_max_bin_count_t_1_reg_5603[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *)
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_count_t_1_reg_5603[1]_i_3
       (.I0(select_ln440_17_reg_5364[1]),
        .I1(icmp_ln895_118_reg_5546),
        .I2(select_ln440_41_reg_5476[1]),
        .O(\res_max_bin_count_t_1_reg_5603[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *)
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_count_t_1_reg_5603[1]_i_4
       (.I0(select_ln440_11_reg_5342[1]),
        .I1(icmp_ln895_116_reg_5532),
        .I2(select_ln440_35_reg_5446[1]),
        .I3(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ),
        .I4(\res_max_bin_count_t_1_reg_5603[1]_i_5_n_0 ),
        .O(\res_max_bin_count_t_1_reg_5603[1]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_count_t_1_reg_5603[1]_i_5
       (.I0(select_ln440_23_reg_5386[1]),
        .I1(icmp_ln895_120_reg_5560),
        .I2(select_ln440_47_reg_5506[1]),
        .O(\res_max_bin_count_t_1_reg_5603[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hBFB0BFBF8F808080))
    \res_max_bin_count_t_1_reg_5603[2]_i_1
       (.I0(\res_max_bin_count_t_1_reg_5603[2]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_count_t_1_reg_5603[2]_i_3_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_count_t_1_reg_5603[2]_i_4_n_0 ),
        .O(res_max_bin_count_t_1_fu_4624_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair72" *)
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_count_t_1_reg_5603[2]_i_2
       (.I0(select_ln440_5_reg_5320[2]),
        .I1(icmp_ln895_114_reg_5518),
        .I2(select_ln440_29_reg_5416[2]),
        .O(\res_max_bin_count_t_1_reg_5603[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_count_t_1_reg_5603[2]_i_3
       (.I0(select_ln440_17_reg_5364[2]),
        .I1(icmp_ln895_118_reg_5546),
        .I2(select_ln440_41_reg_5476[2]),
        .O(\res_max_bin_count_t_1_reg_5603[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *)
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_count_t_1_reg_5603[2]_i_4
       (.I0(select_ln440_11_reg_5342[2]),
        .I1(icmp_ln895_116_reg_5532),
        .I2(select_ln440_35_reg_5446[2]),
        .I3(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0 ),
        .O(\res_max_bin_count_t_1_reg_5603[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *)
  LUT5 #(
    .INIT(32'hEFEAFFFF))
    \res_max_bin_count_t_1_reg_5603[3]_i_1
       (.I0(\res_max_bin_count_t_1_reg_5603[3]_i_2_n_0 ),
        .I1(select_ln440_5_reg_5320[3]),
        .I2(icmp_ln895_114_reg_5518),
        .I3(select_ln440_29_reg_5416[3]),
        .I4(\res_max_bin_count_t_1_reg_5603[3]_i_3_n_0 ),
        .O(res_max_bin_count_t_1_fu_4624_p3[3]));
  (* SOFT_HLUTNM = "soft_lutpair56" *)
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_count_t_1_reg_5603[3]_i_2
       (.I0(select_ln440_17_reg_5364[3]),
        .I1(icmp_ln895_118_reg_5546),
        .I2(select_ln440_41_reg_5476[3]),
        .O(\res_max_bin_count_t_1_reg_5603[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000001D1D1D001D))
    \res_max_bin_count_t_1_reg_5603[3]_i_3
       (.I0(select_ln440_47_reg_5506[3]),
        .I1(icmp_ln895_120_reg_5560),
        .I2(select_ln440_23_reg_5386[3]),
        .I3(select_ln440_35_reg_5446[3]),
        .I4(icmp_ln895_116_reg_5532),
        .I5(select_ln440_11_reg_5342[3]),
        .O(\res_max_bin_count_t_1_reg_5603[3]_i_3_n_0 ));
  FDRE \res_max_bin_count_t_1_reg_5603_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_count_t_1_fu_4624_p3[0]),
        .Q(res_max_bin_count_t_1_reg_5603[0]),
        .R(1'b0));
  FDRE \res_max_bin_count_t_1_reg_5603_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_count_t_1_fu_4624_p3[1]),
        .Q(res_max_bin_count_t_1_reg_5603[1]),
        .R(1'b0));
  FDRE \res_max_bin_count_t_1_reg_5603_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_count_t_1_fu_4624_p3[2]),
        .Q(res_max_bin_count_t_1_reg_5603[2]),
        .R(1'b0));
  FDRE \res_max_bin_count_t_1_reg_5603_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_count_t_1_fu_4624_p3[3]),
        .Q(res_max_bin_count_t_1_reg_5603[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair18" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \res_max_bin_count_t_s_reg_5587[0]_i_1
       (.I0(select_ln476_2_fu_4508_p3[0]),
        .I1(select_ln476_8_fu_4558_p3[0]),
        .I2(\res_max_bin_count_t_s_reg_5587[1]_i_4_n_0 ),
        .I3(select_ln476_8_fu_4558_p3[3]),
        .I4(select_ln476_2_fu_4508_p3[3]),
        .O(res_max_bin_count_t_s_fu_4600_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \res_max_bin_count_t_s_reg_5587[0]_i_2
       (.I0(select_ln440_2_reg_5309[0]),
        .I1(select_ln440_26_reg_5401[0]),
        .I2(icmp_ln895_113_reg_5511),
        .I3(select_ln458_14_fu_4429_p3[0]),
        .I4(\select_ln476_reg_5567[6]_i_4_n_0 ),
        .O(select_ln476_2_fu_4508_p3[0]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \res_max_bin_count_t_s_reg_5587[0]_i_3
       (.I0(select_ln440_8_reg_5331[0]),
        .I1(select_ln440_32_reg_5431[0]),
        .I2(icmp_ln895_115_reg_5525),
        .I3(select_ln458_20_fu_4467_p3[0]),
        .I4(\select_ln476_6_reg_5572[6]_i_4_n_0 ),
        .O(select_ln476_8_fu_4558_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair60" *)
  LUT3 #(
    .INIT(8'hAC))
    \res_max_bin_count_t_s_reg_5587[0]_i_4
       (.I0(select_ln440_14_reg_5353[0]),
        .I1(select_ln440_38_reg_5461[0]),
        .I2(icmp_ln895_117_reg_5539),
        .O(select_ln458_14_fu_4429_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair61" *)
  LUT3 #(
    .INIT(8'hAC))
    \res_max_bin_count_t_s_reg_5587[0]_i_5
       (.I0(select_ln440_20_reg_5375[0]),
        .I1(select_ln440_44_reg_5491[0]),
        .I2(icmp_ln895_119_reg_5553),
        .O(select_ln458_20_fu_4467_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \res_max_bin_count_t_s_reg_5587[1]_i_1
       (.I0(select_ln476_2_fu_4508_p3[1]),
        .I1(select_ln476_8_fu_4558_p3[1]),
        .I2(\res_max_bin_count_t_s_reg_5587[1]_i_4_n_0 ),
        .I3(select_ln476_8_fu_4558_p3[3]),
        .I4(select_ln476_2_fu_4508_p3[3]),
        .O(res_max_bin_count_t_s_fu_4600_p3[1]));
  (* SOFT_HLUTNM = "soft_lutpair27" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \res_max_bin_count_t_s_reg_5587[1]_i_2
       (.I0(select_ln440_2_reg_5309[1]),
        .I1(select_ln440_26_reg_5401[1]),
        .I2(icmp_ln895_113_reg_5511),
        .I3(select_ln458_14_fu_4429_p3[1]),
        .I4(\select_ln476_reg_5567[6]_i_4_n_0 ),
        .O(select_ln476_2_fu_4508_p3[1]));
  (* SOFT_HLUTNM = "soft_lutpair17" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \res_max_bin_count_t_s_reg_5587[1]_i_3
       (.I0(select_ln440_8_reg_5331[1]),
        .I1(select_ln440_32_reg_5431[1]),
        .I2(icmp_ln895_115_reg_5525),
        .I3(select_ln458_20_fu_4467_p3[1]),
        .I4(\select_ln476_6_reg_5572[6]_i_4_n_0 ),
        .O(select_ln476_8_fu_4558_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \res_max_bin_count_t_s_reg_5587[1]_i_4
       (.I0(select_ln476_2_fu_4508_p3[0]),
        .I1(select_ln476_8_fu_4558_p3[0]),
        .I2(select_ln476_8_fu_4558_p3[1]),
        .I3(select_ln476_2_fu_4508_p3[1]),
        .I4(select_ln476_8_fu_4558_p3[2]),
        .I5(select_ln476_2_fu_4508_p3[2]),
        .O(\res_max_bin_count_t_s_reg_5587[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *)
  LUT3 #(
    .INIT(8'hAC))
    \res_max_bin_count_t_s_reg_5587[1]_i_5
       (.I0(select_ln440_14_reg_5353[1]),
        .I1(select_ln440_38_reg_5461[1]),
        .I2(icmp_ln895_117_reg_5539),
        .O(select_ln458_14_fu_4429_p3[1]));
  (* SOFT_HLUTNM = "soft_lutpair71" *)
  LUT3 #(
    .INIT(8'hAC))
    \res_max_bin_count_t_s_reg_5587[1]_i_6
       (.I0(select_ln440_20_reg_5375[1]),
        .I1(select_ln440_44_reg_5491[1]),
        .I2(icmp_ln895_119_reg_5553),
        .O(select_ln458_20_fu_4467_p3[1]));
  LUT4 #(
    .INIT(16'hECAE))
    \res_max_bin_count_t_s_reg_5587[2]_i_1
       (.I0(select_ln476_8_fu_4558_p3[2]),
        .I1(select_ln476_2_fu_4508_p3[2]),
        .I2(select_ln476_8_fu_4558_p3[3]),
        .I3(select_ln476_2_fu_4508_p3[3]),
        .O(res_max_bin_count_t_s_fu_4600_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair15" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \res_max_bin_count_t_s_reg_5587[2]_i_2
       (.I0(select_ln440_8_reg_5331[2]),
        .I1(select_ln440_32_reg_5431[2]),
        .I2(icmp_ln895_115_reg_5525),
        .I3(select_ln458_20_fu_4467_p3[2]),
        .I4(\select_ln476_6_reg_5572[6]_i_4_n_0 ),
        .O(select_ln476_8_fu_4558_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair14" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \res_max_bin_count_t_s_reg_5587[2]_i_3
       (.I0(select_ln440_2_reg_5309[2]),
        .I1(select_ln440_26_reg_5401[2]),
        .I2(icmp_ln895_113_reg_5511),
        .I3(select_ln458_14_fu_4429_p3[2]),
        .I4(\select_ln476_reg_5567[6]_i_4_n_0 ),
        .O(select_ln476_2_fu_4508_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair18" *)
  LUT2 #(
    .INIT(4'hE))
    \res_max_bin_count_t_s_reg_5587[3]_i_1
       (.I0(select_ln476_8_fu_4558_p3[3]),
        .I1(select_ln476_2_fu_4508_p3[3]),
        .O(res_max_bin_count_t_s_fu_4600_p3[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \res_max_bin_count_t_s_reg_5587[3]_i_2
       (.I0(select_ln440_8_reg_5331[3]),
        .I1(select_ln440_32_reg_5431[3]),
        .I2(icmp_ln895_115_reg_5525),
        .I3(select_ln458_20_fu_4467_p3[3]),
        .I4(\select_ln476_6_reg_5572[6]_i_4_n_0 ),
        .O(select_ln476_8_fu_4558_p3[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \res_max_bin_count_t_s_reg_5587[3]_i_3
       (.I0(select_ln440_2_reg_5309[3]),
        .I1(select_ln440_26_reg_5401[3]),
        .I2(icmp_ln895_113_reg_5511),
        .I3(select_ln458_14_fu_4429_p3[3]),
        .I4(\select_ln476_reg_5567[6]_i_4_n_0 ),
        .O(select_ln476_2_fu_4508_p3[3]));
  FDRE \res_max_bin_count_t_s_reg_5587_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_count_t_s_fu_4600_p3[0]),
        .Q(res_max_bin_count_t_s_reg_5587[0]),
        .R(1'b0));
  FDRE \res_max_bin_count_t_s_reg_5587_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_count_t_s_fu_4600_p3[1]),
        .Q(res_max_bin_count_t_s_reg_5587[1]),
        .R(1'b0));
  FDRE \res_max_bin_count_t_s_reg_5587_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_count_t_s_fu_4600_p3[2]),
        .Q(res_max_bin_count_t_s_reg_5587[2]),
        .R(1'b0));
  FDRE \res_max_bin_count_t_s_reg_5587_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_count_t_s_fu_4600_p3[3]),
        .Q(res_max_bin_count_t_s_reg_5587[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hBFB0BFBF8F808080))
    \res_max_bin_r_t_V_1_reg_5598[0]_i_1
       (.I0(\res_max_bin_r_t_V_1_reg_5598[0]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_r_t_V_1_reg_5598[0]_i_3_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_r_t_V_1_reg_5598_reg[0]_i_4_n_0 ),
        .O(res_max_bin_r_t_V_1_fu_4616_p3[0]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[0]_i_2
       (.I0(\select_ln422_4_reg_5078_reg_n_0_[0] ),
        .I1(icmp_ln895_98_reg_5314),
        .I2(\select_ln422_52_reg_5198_reg_n_0_[0] ),
        .I3(icmp_ln895_114_reg_5518),
        .I4(\select_ln440_28_reg_5411_reg_n_0_[0] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[0]_i_3
       (.I0(\select_ln422_16_reg_5118_reg_n_0_[0] ),
        .I1(icmp_ln895_102_reg_5358),
        .I2(\select_ln422_64_reg_5238_reg_n_0_[0] ),
        .I3(icmp_ln895_118_reg_5546),
        .I4(\select_ln440_40_reg_5471_reg_n_0_[0] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[0]_i_5
       (.I0(\select_ln422_22_reg_5138_reg_n_0_[0] ),
        .I1(icmp_ln895_104_reg_5380),
        .I2(\select_ln422_70_reg_5258_reg_n_0_[0] ),
        .I3(icmp_ln895_120_reg_5560),
        .I4(\select_ln440_46_reg_5501_reg_n_0_[0] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[0]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[0]_i_6
       (.I0(\select_ln422_10_reg_5098_reg_n_0_[0] ),
        .I1(icmp_ln895_100_reg_5336),
        .I2(\select_ln422_58_reg_5218_reg_n_0_[0] ),
        .I3(icmp_ln895_116_reg_5532),
        .I4(\select_ln440_34_reg_5441_reg_n_0_[0] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hBFB0BFBF8F808080))
    \res_max_bin_r_t_V_1_reg_5598[1]_i_1
       (.I0(\res_max_bin_r_t_V_1_reg_5598[1]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_r_t_V_1_reg_5598[1]_i_3_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_r_t_V_1_reg_5598_reg[1]_i_4_n_0 ),
        .O(res_max_bin_r_t_V_1_fu_4616_p3[1]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[1]_i_2
       (.I0(\select_ln422_4_reg_5078_reg_n_0_[1] ),
        .I1(icmp_ln895_98_reg_5314),
        .I2(\select_ln422_52_reg_5198_reg_n_0_[1] ),
        .I3(icmp_ln895_114_reg_5518),
        .I4(\select_ln440_28_reg_5411_reg_n_0_[1] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[1]_i_3
       (.I0(\select_ln422_16_reg_5118_reg_n_0_[1] ),
        .I1(icmp_ln895_102_reg_5358),
        .I2(\select_ln422_64_reg_5238_reg_n_0_[1] ),
        .I3(icmp_ln895_118_reg_5546),
        .I4(\select_ln440_40_reg_5471_reg_n_0_[1] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[1]_i_5
       (.I0(\select_ln422_22_reg_5138_reg_n_0_[1] ),
        .I1(icmp_ln895_104_reg_5380),
        .I2(\select_ln422_70_reg_5258_reg_n_0_[1] ),
        .I3(icmp_ln895_120_reg_5560),
        .I4(\select_ln440_46_reg_5501_reg_n_0_[1] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[1]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[1]_i_6
       (.I0(\select_ln422_10_reg_5098_reg_n_0_[1] ),
        .I1(icmp_ln895_100_reg_5336),
        .I2(\select_ln422_58_reg_5218_reg_n_0_[1] ),
        .I3(icmp_ln895_116_reg_5532),
        .I4(\select_ln440_34_reg_5441_reg_n_0_[1] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[1]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hBFB0BFBF8F808080))
    \res_max_bin_r_t_V_1_reg_5598[2]_i_1
       (.I0(\res_max_bin_r_t_V_1_reg_5598[2]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_r_t_V_1_reg_5598[2]_i_3_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_r_t_V_1_reg_5598_reg[2]_i_4_n_0 ),
        .O(res_max_bin_r_t_V_1_fu_4616_p3[2]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[2]_i_2
       (.I0(\select_ln422_4_reg_5078_reg_n_0_[2] ),
        .I1(icmp_ln895_98_reg_5314),
        .I2(\select_ln422_52_reg_5198_reg_n_0_[2] ),
        .I3(icmp_ln895_114_reg_5518),
        .I4(\select_ln440_28_reg_5411_reg_n_0_[2] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[2]_i_3
       (.I0(\select_ln422_16_reg_5118_reg_n_0_[2] ),
        .I1(icmp_ln895_102_reg_5358),
        .I2(\select_ln422_64_reg_5238_reg_n_0_[2] ),
        .I3(icmp_ln895_118_reg_5546),
        .I4(\select_ln440_40_reg_5471_reg_n_0_[2] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[2]_i_5
       (.I0(\select_ln422_22_reg_5138_reg_n_0_[2] ),
        .I1(icmp_ln895_104_reg_5380),
        .I2(\select_ln422_70_reg_5258_reg_n_0_[2] ),
        .I3(icmp_ln895_120_reg_5560),
        .I4(\select_ln440_46_reg_5501_reg_n_0_[2] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[2]_i_6
       (.I0(\select_ln422_10_reg_5098_reg_n_0_[2] ),
        .I1(icmp_ln895_100_reg_5336),
        .I2(\select_ln422_58_reg_5218_reg_n_0_[2] ),
        .I3(icmp_ln895_116_reg_5532),
        .I4(\select_ln440_34_reg_5441_reg_n_0_[2] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hBFB0BFBF8F808080))
    \res_max_bin_r_t_V_1_reg_5598[3]_i_1
       (.I0(\res_max_bin_r_t_V_1_reg_5598[3]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_r_t_V_1_reg_5598[3]_i_3_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_r_t_V_1_reg_5598_reg[3]_i_4_n_0 ),
        .O(res_max_bin_r_t_V_1_fu_4616_p3[3]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[3]_i_2
       (.I0(\select_ln422_4_reg_5078_reg_n_0_[3] ),
        .I1(icmp_ln895_98_reg_5314),
        .I2(\select_ln422_52_reg_5198_reg_n_0_[3] ),
        .I3(icmp_ln895_114_reg_5518),
        .I4(\select_ln440_28_reg_5411_reg_n_0_[3] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[3]_i_3
       (.I0(\select_ln422_16_reg_5118_reg_n_0_[3] ),
        .I1(icmp_ln895_102_reg_5358),
        .I2(\select_ln422_64_reg_5238_reg_n_0_[3] ),
        .I3(icmp_ln895_118_reg_5546),
        .I4(\select_ln440_40_reg_5471_reg_n_0_[3] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[3]_i_5
       (.I0(\select_ln422_22_reg_5138_reg_n_0_[3] ),
        .I1(icmp_ln895_104_reg_5380),
        .I2(\select_ln422_70_reg_5258_reg_n_0_[3] ),
        .I3(icmp_ln895_120_reg_5560),
        .I4(\select_ln440_46_reg_5501_reg_n_0_[3] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[3]_i_6
       (.I0(\select_ln422_10_reg_5098_reg_n_0_[3] ),
        .I1(icmp_ln895_100_reg_5336),
        .I2(\select_ln422_58_reg_5218_reg_n_0_[3] ),
        .I3(icmp_ln895_116_reg_5532),
        .I4(\select_ln440_34_reg_5441_reg_n_0_[3] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hBFB0BFBF8F808080))
    \res_max_bin_r_t_V_1_reg_5598[4]_i_1
       (.I0(\res_max_bin_r_t_V_1_reg_5598[4]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_r_t_V_1_reg_5598[4]_i_3_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_r_t_V_1_reg_5598_reg[4]_i_4_n_0 ),
        .O(res_max_bin_r_t_V_1_fu_4616_p3[4]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[4]_i_2
       (.I0(\select_ln422_4_reg_5078_reg_n_0_[4] ),
        .I1(icmp_ln895_98_reg_5314),
        .I2(\select_ln422_52_reg_5198_reg_n_0_[4] ),
        .I3(icmp_ln895_114_reg_5518),
        .I4(\select_ln440_28_reg_5411_reg_n_0_[4] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[4]_i_3
       (.I0(\select_ln422_16_reg_5118_reg_n_0_[4] ),
        .I1(icmp_ln895_102_reg_5358),
        .I2(\select_ln422_64_reg_5238_reg_n_0_[4] ),
        .I3(icmp_ln895_118_reg_5546),
        .I4(\select_ln440_40_reg_5471_reg_n_0_[4] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[4]_i_5
       (.I0(\select_ln422_22_reg_5138_reg_n_0_[4] ),
        .I1(icmp_ln895_104_reg_5380),
        .I2(\select_ln422_70_reg_5258_reg_n_0_[4] ),
        .I3(icmp_ln895_120_reg_5560),
        .I4(\select_ln440_46_reg_5501_reg_n_0_[4] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[4]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[4]_i_6
       (.I0(\select_ln422_10_reg_5098_reg_n_0_[4] ),
        .I1(icmp_ln895_100_reg_5336),
        .I2(\select_ln422_58_reg_5218_reg_n_0_[4] ),
        .I3(icmp_ln895_116_reg_5532),
        .I4(\select_ln440_34_reg_5441_reg_n_0_[4] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hBFB0BFBF8F808080))
    \res_max_bin_r_t_V_1_reg_5598[5]_i_1
       (.I0(\res_max_bin_r_t_V_1_reg_5598[5]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_r_t_V_1_reg_5598[5]_i_3_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_r_t_V_1_reg_5598_reg[5]_i_4_n_0 ),
        .O(res_max_bin_r_t_V_1_fu_4616_p3[5]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[5]_i_2
       (.I0(\select_ln422_4_reg_5078_reg_n_0_[5] ),
        .I1(icmp_ln895_98_reg_5314),
        .I2(\select_ln422_52_reg_5198_reg_n_0_[5] ),
        .I3(icmp_ln895_114_reg_5518),
        .I4(\select_ln440_28_reg_5411_reg_n_0_[5] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[5]_i_3
       (.I0(\select_ln422_16_reg_5118_reg_n_0_[5] ),
        .I1(icmp_ln895_102_reg_5358),
        .I2(\select_ln422_64_reg_5238_reg_n_0_[5] ),
        .I3(icmp_ln895_118_reg_5546),
        .I4(\select_ln440_40_reg_5471_reg_n_0_[5] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[5]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[5]_i_5
       (.I0(\select_ln422_22_reg_5138_reg_n_0_[5] ),
        .I1(icmp_ln895_104_reg_5380),
        .I2(\select_ln422_70_reg_5258_reg_n_0_[5] ),
        .I3(icmp_ln895_120_reg_5560),
        .I4(\select_ln440_46_reg_5501_reg_n_0_[5] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[5]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[5]_i_6
       (.I0(\select_ln422_10_reg_5098_reg_n_0_[5] ),
        .I1(icmp_ln895_100_reg_5336),
        .I2(\select_ln422_58_reg_5218_reg_n_0_[5] ),
        .I3(icmp_ln895_116_reg_5532),
        .I4(\select_ln440_34_reg_5441_reg_n_0_[5] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hBFB0BFBF8F808080))
    \res_max_bin_r_t_V_1_reg_5598[6]_i_1
       (.I0(\res_max_bin_r_t_V_1_reg_5598[6]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_r_t_V_1_reg_5598[6]_i_3_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_r_t_V_1_reg_5598_reg[6]_i_4_n_0 ),
        .O(res_max_bin_r_t_V_1_fu_4616_p3[6]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[6]_i_2
       (.I0(\select_ln422_4_reg_5078_reg_n_0_[6] ),
        .I1(icmp_ln895_98_reg_5314),
        .I2(\select_ln422_52_reg_5198_reg_n_0_[6] ),
        .I3(icmp_ln895_114_reg_5518),
        .I4(\select_ln440_28_reg_5411_reg_n_0_[6] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[6]_i_3
       (.I0(\select_ln422_16_reg_5118_reg_n_0_[6] ),
        .I1(icmp_ln895_102_reg_5358),
        .I2(\select_ln422_64_reg_5238_reg_n_0_[6] ),
        .I3(icmp_ln895_118_reg_5546),
        .I4(\select_ln440_40_reg_5471_reg_n_0_[6] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[6]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[6]_i_5
       (.I0(\select_ln422_22_reg_5138_reg_n_0_[6] ),
        .I1(icmp_ln895_104_reg_5380),
        .I2(\select_ln422_70_reg_5258_reg_n_0_[6] ),
        .I3(icmp_ln895_120_reg_5560),
        .I4(\select_ln440_46_reg_5501_reg_n_0_[6] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[6]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_1_reg_5598[6]_i_6
       (.I0(\select_ln422_10_reg_5098_reg_n_0_[6] ),
        .I1(icmp_ln895_100_reg_5336),
        .I2(\select_ln422_58_reg_5218_reg_n_0_[6] ),
        .I3(icmp_ln895_116_reg_5532),
        .I4(\select_ln440_34_reg_5441_reg_n_0_[6] ),
        .O(\res_max_bin_r_t_V_1_reg_5598[6]_i_6_n_0 ));
  FDRE \res_max_bin_r_t_V_1_reg_5598_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_1_fu_4616_p3[0]),
        .Q(res_max_bin_r_t_V_1_reg_5598[0]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_1_reg_5598_reg[0]_i_4
       (.I0(\res_max_bin_r_t_V_1_reg_5598[0]_i_5_n_0 ),
        .I1(\res_max_bin_r_t_V_1_reg_5598[0]_i_6_n_0 ),
        .O(\res_max_bin_r_t_V_1_reg_5598_reg[0]_i_4_n_0 ),
        .S(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ));
  FDRE \res_max_bin_r_t_V_1_reg_5598_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_1_fu_4616_p3[1]),
        .Q(res_max_bin_r_t_V_1_reg_5598[1]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_1_reg_5598_reg[1]_i_4
       (.I0(\res_max_bin_r_t_V_1_reg_5598[1]_i_5_n_0 ),
        .I1(\res_max_bin_r_t_V_1_reg_5598[1]_i_6_n_0 ),
        .O(\res_max_bin_r_t_V_1_reg_5598_reg[1]_i_4_n_0 ),
        .S(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ));
  FDRE \res_max_bin_r_t_V_1_reg_5598_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_1_fu_4616_p3[2]),
        .Q(res_max_bin_r_t_V_1_reg_5598[2]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_1_reg_5598_reg[2]_i_4
       (.I0(\res_max_bin_r_t_V_1_reg_5598[2]_i_5_n_0 ),
        .I1(\res_max_bin_r_t_V_1_reg_5598[2]_i_6_n_0 ),
        .O(\res_max_bin_r_t_V_1_reg_5598_reg[2]_i_4_n_0 ),
        .S(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ));
  FDRE \res_max_bin_r_t_V_1_reg_5598_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_1_fu_4616_p3[3]),
        .Q(res_max_bin_r_t_V_1_reg_5598[3]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_1_reg_5598_reg[3]_i_4
       (.I0(\res_max_bin_r_t_V_1_reg_5598[3]_i_5_n_0 ),
        .I1(\res_max_bin_r_t_V_1_reg_5598[3]_i_6_n_0 ),
        .O(\res_max_bin_r_t_V_1_reg_5598_reg[3]_i_4_n_0 ),
        .S(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ));
  FDRE \res_max_bin_r_t_V_1_reg_5598_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_1_fu_4616_p3[4]),
        .Q(res_max_bin_r_t_V_1_reg_5598[4]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_1_reg_5598_reg[4]_i_4
       (.I0(\res_max_bin_r_t_V_1_reg_5598[4]_i_5_n_0 ),
        .I1(\res_max_bin_r_t_V_1_reg_5598[4]_i_6_n_0 ),
        .O(\res_max_bin_r_t_V_1_reg_5598_reg[4]_i_4_n_0 ),
        .S(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ));
  FDRE \res_max_bin_r_t_V_1_reg_5598_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_1_fu_4616_p3[5]),
        .Q(res_max_bin_r_t_V_1_reg_5598[5]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_1_reg_5598_reg[5]_i_4
       (.I0(\res_max_bin_r_t_V_1_reg_5598[5]_i_5_n_0 ),
        .I1(\res_max_bin_r_t_V_1_reg_5598[5]_i_6_n_0 ),
        .O(\res_max_bin_r_t_V_1_reg_5598_reg[5]_i_4_n_0 ),
        .S(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ));
  FDRE \res_max_bin_r_t_V_1_reg_5598_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_1_fu_4616_p3[6]),
        .Q(res_max_bin_r_t_V_1_reg_5598[6]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_1_reg_5598_reg[6]_i_4
       (.I0(\res_max_bin_r_t_V_1_reg_5598[6]_i_5_n_0 ),
        .I1(\res_max_bin_r_t_V_1_reg_5598[6]_i_6_n_0 ),
        .O(\res_max_bin_r_t_V_1_reg_5598_reg[6]_i_4_n_0 ),
        .S(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hBAFB8A08))
    \res_max_bin_r_t_V_reg_5582[0]_i_1
       (.I0(select_ln476_1_fu_4500_p3[0]),
        .I1(\res_max_bin_count_t_s_reg_5587[1]_i_4_n_0 ),
        .I2(select_ln476_8_fu_4558_p3[3]),
        .I3(select_ln476_2_fu_4508_p3[3]),
        .I4(select_ln476_7_fu_4550_p3[0]),
        .O(res_max_bin_r_t_V_fu_4592_p3[0]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[0]_i_4
       (.I0(\select_ln422_13_reg_5108_reg_n_0_[0] ),
        .I1(icmp_ln895_101_reg_5347),
        .I2(\select_ln422_61_reg_5228_reg_n_0_[0] ),
        .I3(icmp_ln895_117_reg_5539),
        .I4(\select_ln440_37_reg_5456_reg_n_0_[0] ),
        .O(select_ln458_13_fu_4423_p3[0]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[0]_i_5
       (.I0(\select_ln422_1_reg_5068_reg_n_0_[0] ),
        .I1(icmp_ln895_97_reg_5303),
        .I2(\select_ln422_49_reg_5188_reg_n_0_[0] ),
        .I3(icmp_ln895_113_reg_5511),
        .I4(\select_ln440_25_reg_5396_reg_n_0_[0] ),
        .O(select_ln458_1_fu_4347_p3[0]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[0]_i_6
       (.I0(\select_ln422_19_reg_5128_reg_n_0_[0] ),
        .I1(icmp_ln895_103_reg_5369),
        .I2(\select_ln422_67_reg_5248_reg_n_0_[0] ),
        .I3(icmp_ln895_119_reg_5553),
        .I4(\select_ln440_43_reg_5486_reg_n_0_[0] ),
        .O(select_ln458_19_fu_4461_p3[0]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[0]_i_7
       (.I0(\select_ln422_7_reg_5088_reg_n_0_[0] ),
        .I1(icmp_ln895_99_reg_5325),
        .I2(\select_ln422_55_reg_5208_reg_n_0_[0] ),
        .I3(icmp_ln895_115_reg_5525),
        .I4(\select_ln440_31_reg_5426_reg_n_0_[0] ),
        .O(select_ln458_7_fu_4385_p3[0]));
  LUT5 #(
    .INIT(32'hBAFB8A08))
    \res_max_bin_r_t_V_reg_5582[1]_i_1
       (.I0(select_ln476_1_fu_4500_p3[1]),
        .I1(\res_max_bin_count_t_s_reg_5587[1]_i_4_n_0 ),
        .I2(select_ln476_8_fu_4558_p3[3]),
        .I3(select_ln476_2_fu_4508_p3[3]),
        .I4(select_ln476_7_fu_4550_p3[1]),
        .O(res_max_bin_r_t_V_fu_4592_p3[1]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[1]_i_4
       (.I0(\select_ln422_13_reg_5108_reg_n_0_[1] ),
        .I1(icmp_ln895_101_reg_5347),
        .I2(\select_ln422_61_reg_5228_reg_n_0_[1] ),
        .I3(icmp_ln895_117_reg_5539),
        .I4(\select_ln440_37_reg_5456_reg_n_0_[1] ),
        .O(select_ln458_13_fu_4423_p3[1]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[1]_i_5
       (.I0(\select_ln422_1_reg_5068_reg_n_0_[1] ),
        .I1(icmp_ln895_97_reg_5303),
        .I2(\select_ln422_49_reg_5188_reg_n_0_[1] ),
        .I3(icmp_ln895_113_reg_5511),
        .I4(\select_ln440_25_reg_5396_reg_n_0_[1] ),
        .O(select_ln458_1_fu_4347_p3[1]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[1]_i_6
       (.I0(\select_ln422_19_reg_5128_reg_n_0_[1] ),
        .I1(icmp_ln895_103_reg_5369),
        .I2(\select_ln422_67_reg_5248_reg_n_0_[1] ),
        .I3(icmp_ln895_119_reg_5553),
        .I4(\select_ln440_43_reg_5486_reg_n_0_[1] ),
        .O(select_ln458_19_fu_4461_p3[1]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[1]_i_7
       (.I0(\select_ln422_7_reg_5088_reg_n_0_[1] ),
        .I1(icmp_ln895_99_reg_5325),
        .I2(\select_ln422_55_reg_5208_reg_n_0_[1] ),
        .I3(icmp_ln895_115_reg_5525),
        .I4(\select_ln440_31_reg_5426_reg_n_0_[1] ),
        .O(select_ln458_7_fu_4385_p3[1]));
  LUT5 #(
    .INIT(32'hBAFB8A08))
    \res_max_bin_r_t_V_reg_5582[2]_i_1
       (.I0(select_ln476_1_fu_4500_p3[2]),
        .I1(\res_max_bin_count_t_s_reg_5587[1]_i_4_n_0 ),
        .I2(select_ln476_8_fu_4558_p3[3]),
        .I3(select_ln476_2_fu_4508_p3[3]),
        .I4(select_ln476_7_fu_4550_p3[2]),
        .O(res_max_bin_r_t_V_fu_4592_p3[2]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[2]_i_4
       (.I0(\select_ln422_13_reg_5108_reg_n_0_[2] ),
        .I1(icmp_ln895_101_reg_5347),
        .I2(\select_ln422_61_reg_5228_reg_n_0_[2] ),
        .I3(icmp_ln895_117_reg_5539),
        .I4(\select_ln440_37_reg_5456_reg_n_0_[2] ),
        .O(select_ln458_13_fu_4423_p3[2]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[2]_i_5
       (.I0(\select_ln422_1_reg_5068_reg_n_0_[2] ),
        .I1(icmp_ln895_97_reg_5303),
        .I2(\select_ln422_49_reg_5188_reg_n_0_[2] ),
        .I3(icmp_ln895_113_reg_5511),
        .I4(\select_ln440_25_reg_5396_reg_n_0_[2] ),
        .O(select_ln458_1_fu_4347_p3[2]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[2]_i_6
       (.I0(\select_ln422_19_reg_5128_reg_n_0_[2] ),
        .I1(icmp_ln895_103_reg_5369),
        .I2(\select_ln422_67_reg_5248_reg_n_0_[2] ),
        .I3(icmp_ln895_119_reg_5553),
        .I4(\select_ln440_43_reg_5486_reg_n_0_[2] ),
        .O(select_ln458_19_fu_4461_p3[2]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[2]_i_7
       (.I0(\select_ln422_7_reg_5088_reg_n_0_[2] ),
        .I1(icmp_ln895_99_reg_5325),
        .I2(\select_ln422_55_reg_5208_reg_n_0_[2] ),
        .I3(icmp_ln895_115_reg_5525),
        .I4(\select_ln440_31_reg_5426_reg_n_0_[2] ),
        .O(select_ln458_7_fu_4385_p3[2]));
  LUT5 #(
    .INIT(32'hBAFB8A08))
    \res_max_bin_r_t_V_reg_5582[3]_i_1
       (.I0(select_ln476_1_fu_4500_p3[3]),
        .I1(\res_max_bin_count_t_s_reg_5587[1]_i_4_n_0 ),
        .I2(select_ln476_8_fu_4558_p3[3]),
        .I3(select_ln476_2_fu_4508_p3[3]),
        .I4(select_ln476_7_fu_4550_p3[3]),
        .O(res_max_bin_r_t_V_fu_4592_p3[3]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[3]_i_4
       (.I0(\select_ln422_13_reg_5108_reg_n_0_[3] ),
        .I1(icmp_ln895_101_reg_5347),
        .I2(\select_ln422_61_reg_5228_reg_n_0_[3] ),
        .I3(icmp_ln895_117_reg_5539),
        .I4(\select_ln440_37_reg_5456_reg_n_0_[3] ),
        .O(select_ln458_13_fu_4423_p3[3]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[3]_i_5
       (.I0(\select_ln422_1_reg_5068_reg_n_0_[3] ),
        .I1(icmp_ln895_97_reg_5303),
        .I2(\select_ln422_49_reg_5188_reg_n_0_[3] ),
        .I3(icmp_ln895_113_reg_5511),
        .I4(\select_ln440_25_reg_5396_reg_n_0_[3] ),
        .O(select_ln458_1_fu_4347_p3[3]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[3]_i_6
       (.I0(\select_ln422_19_reg_5128_reg_n_0_[3] ),
        .I1(icmp_ln895_103_reg_5369),
        .I2(\select_ln422_67_reg_5248_reg_n_0_[3] ),
        .I3(icmp_ln895_119_reg_5553),
        .I4(\select_ln440_43_reg_5486_reg_n_0_[3] ),
        .O(select_ln458_19_fu_4461_p3[3]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[3]_i_7
       (.I0(\select_ln422_7_reg_5088_reg_n_0_[3] ),
        .I1(icmp_ln895_99_reg_5325),
        .I2(\select_ln422_55_reg_5208_reg_n_0_[3] ),
        .I3(icmp_ln895_115_reg_5525),
        .I4(\select_ln440_31_reg_5426_reg_n_0_[3] ),
        .O(select_ln458_7_fu_4385_p3[3]));
  LUT5 #(
    .INIT(32'hBAFB8A08))
    \res_max_bin_r_t_V_reg_5582[4]_i_1
       (.I0(select_ln476_1_fu_4500_p3[4]),
        .I1(\res_max_bin_count_t_s_reg_5587[1]_i_4_n_0 ),
        .I2(select_ln476_8_fu_4558_p3[3]),
        .I3(select_ln476_2_fu_4508_p3[3]),
        .I4(select_ln476_7_fu_4550_p3[4]),
        .O(res_max_bin_r_t_V_fu_4592_p3[4]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[4]_i_4
       (.I0(\select_ln422_13_reg_5108_reg_n_0_[4] ),
        .I1(icmp_ln895_101_reg_5347),
        .I2(\select_ln422_61_reg_5228_reg_n_0_[4] ),
        .I3(icmp_ln895_117_reg_5539),
        .I4(\select_ln440_37_reg_5456_reg_n_0_[4] ),
        .O(select_ln458_13_fu_4423_p3[4]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[4]_i_5
       (.I0(\select_ln422_1_reg_5068_reg_n_0_[4] ),
        .I1(icmp_ln895_97_reg_5303),
        .I2(\select_ln422_49_reg_5188_reg_n_0_[4] ),
        .I3(icmp_ln895_113_reg_5511),
        .I4(\select_ln440_25_reg_5396_reg_n_0_[4] ),
        .O(select_ln458_1_fu_4347_p3[4]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[4]_i_6
       (.I0(\select_ln422_19_reg_5128_reg_n_0_[4] ),
        .I1(icmp_ln895_103_reg_5369),
        .I2(\select_ln422_67_reg_5248_reg_n_0_[4] ),
        .I3(icmp_ln895_119_reg_5553),
        .I4(\select_ln440_43_reg_5486_reg_n_0_[4] ),
        .O(select_ln458_19_fu_4461_p3[4]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[4]_i_7
       (.I0(\select_ln422_7_reg_5088_reg_n_0_[4] ),
        .I1(icmp_ln895_99_reg_5325),
        .I2(\select_ln422_55_reg_5208_reg_n_0_[4] ),
        .I3(icmp_ln895_115_reg_5525),
        .I4(\select_ln440_31_reg_5426_reg_n_0_[4] ),
        .O(select_ln458_7_fu_4385_p3[4]));
  LUT5 #(
    .INIT(32'hBAFB8A08))
    \res_max_bin_r_t_V_reg_5582[5]_i_1
       (.I0(select_ln476_1_fu_4500_p3[5]),
        .I1(\res_max_bin_count_t_s_reg_5587[1]_i_4_n_0 ),
        .I2(select_ln476_8_fu_4558_p3[3]),
        .I3(select_ln476_2_fu_4508_p3[3]),
        .I4(select_ln476_7_fu_4550_p3[5]),
        .O(res_max_bin_r_t_V_fu_4592_p3[5]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[5]_i_4
       (.I0(\select_ln422_13_reg_5108_reg_n_0_[5] ),
        .I1(icmp_ln895_101_reg_5347),
        .I2(\select_ln422_61_reg_5228_reg_n_0_[5] ),
        .I3(icmp_ln895_117_reg_5539),
        .I4(\select_ln440_37_reg_5456_reg_n_0_[5] ),
        .O(select_ln458_13_fu_4423_p3[5]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[5]_i_5
       (.I0(\select_ln422_1_reg_5068_reg_n_0_[5] ),
        .I1(icmp_ln895_97_reg_5303),
        .I2(\select_ln422_49_reg_5188_reg_n_0_[5] ),
        .I3(icmp_ln895_113_reg_5511),
        .I4(\select_ln440_25_reg_5396_reg_n_0_[5] ),
        .O(select_ln458_1_fu_4347_p3[5]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[5]_i_6
       (.I0(\select_ln422_19_reg_5128_reg_n_0_[5] ),
        .I1(icmp_ln895_103_reg_5369),
        .I2(\select_ln422_67_reg_5248_reg_n_0_[5] ),
        .I3(icmp_ln895_119_reg_5553),
        .I4(\select_ln440_43_reg_5486_reg_n_0_[5] ),
        .O(select_ln458_19_fu_4461_p3[5]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[5]_i_7
       (.I0(\select_ln422_7_reg_5088_reg_n_0_[5] ),
        .I1(icmp_ln895_99_reg_5325),
        .I2(\select_ln422_55_reg_5208_reg_n_0_[5] ),
        .I3(icmp_ln895_115_reg_5525),
        .I4(\select_ln440_31_reg_5426_reg_n_0_[5] ),
        .O(select_ln458_7_fu_4385_p3[5]));
  (* SOFT_HLUTNM = "soft_lutpair16" *)
  LUT5 #(
    .INIT(32'hBAFB8A08))
    \res_max_bin_r_t_V_reg_5582[6]_i_1
       (.I0(select_ln476_1_fu_4500_p3[6]),
        .I1(\res_max_bin_count_t_s_reg_5587[1]_i_4_n_0 ),
        .I2(select_ln476_8_fu_4558_p3[3]),
        .I3(select_ln476_2_fu_4508_p3[3]),
        .I4(select_ln476_7_fu_4550_p3[6]),
        .O(res_max_bin_r_t_V_fu_4592_p3[6]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[6]_i_4
       (.I0(\select_ln422_13_reg_5108_reg_n_0_[6] ),
        .I1(icmp_ln895_101_reg_5347),
        .I2(\select_ln422_61_reg_5228_reg_n_0_[6] ),
        .I3(icmp_ln895_117_reg_5539),
        .I4(\select_ln440_37_reg_5456_reg_n_0_[6] ),
        .O(select_ln458_13_fu_4423_p3[6]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[6]_i_5
       (.I0(\select_ln422_1_reg_5068_reg_n_0_[6] ),
        .I1(icmp_ln895_97_reg_5303),
        .I2(\select_ln422_49_reg_5188_reg_n_0_[6] ),
        .I3(icmp_ln895_113_reg_5511),
        .I4(\select_ln440_25_reg_5396_reg_n_0_[6] ),
        .O(select_ln458_1_fu_4347_p3[6]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[6]_i_6
       (.I0(\select_ln422_19_reg_5128_reg_n_0_[6] ),
        .I1(icmp_ln895_103_reg_5369),
        .I2(\select_ln422_67_reg_5248_reg_n_0_[6] ),
        .I3(icmp_ln895_119_reg_5553),
        .I4(\select_ln440_43_reg_5486_reg_n_0_[6] ),
        .O(select_ln458_19_fu_4461_p3[6]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_r_t_V_reg_5582[6]_i_7
       (.I0(\select_ln422_7_reg_5088_reg_n_0_[6] ),
        .I1(icmp_ln895_99_reg_5325),
        .I2(\select_ln422_55_reg_5208_reg_n_0_[6] ),
        .I3(icmp_ln895_115_reg_5525),
        .I4(\select_ln440_31_reg_5426_reg_n_0_[6] ),
        .O(select_ln458_7_fu_4385_p3[6]));
  FDRE \res_max_bin_r_t_V_reg_5582_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_fu_4592_p3[0]),
        .Q(res_max_bin_r_t_V_reg_5582[0]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[0]_i_2
       (.I0(select_ln458_13_fu_4423_p3[0]),
        .I1(select_ln458_1_fu_4347_p3[0]),
        .O(select_ln476_1_fu_4500_p3[0]),
        .S(\select_ln476_reg_5567[6]_i_4_n_0 ));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[0]_i_3
       (.I0(select_ln458_19_fu_4461_p3[0]),
        .I1(select_ln458_7_fu_4385_p3[0]),
        .O(select_ln476_7_fu_4550_p3[0]),
        .S(\select_ln476_6_reg_5572[6]_i_4_n_0 ));
  FDRE \res_max_bin_r_t_V_reg_5582_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_fu_4592_p3[1]),
        .Q(res_max_bin_r_t_V_reg_5582[1]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[1]_i_2
       (.I0(select_ln458_13_fu_4423_p3[1]),
        .I1(select_ln458_1_fu_4347_p3[1]),
        .O(select_ln476_1_fu_4500_p3[1]),
        .S(\select_ln476_reg_5567[6]_i_4_n_0 ));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[1]_i_3
       (.I0(select_ln458_19_fu_4461_p3[1]),
        .I1(select_ln458_7_fu_4385_p3[1]),
        .O(select_ln476_7_fu_4550_p3[1]),
        .S(\select_ln476_6_reg_5572[6]_i_4_n_0 ));
  FDRE \res_max_bin_r_t_V_reg_5582_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_fu_4592_p3[2]),
        .Q(res_max_bin_r_t_V_reg_5582[2]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[2]_i_2
       (.I0(select_ln458_13_fu_4423_p3[2]),
        .I1(select_ln458_1_fu_4347_p3[2]),
        .O(select_ln476_1_fu_4500_p3[2]),
        .S(\select_ln476_reg_5567[6]_i_4_n_0 ));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[2]_i_3
       (.I0(select_ln458_19_fu_4461_p3[2]),
        .I1(select_ln458_7_fu_4385_p3[2]),
        .O(select_ln476_7_fu_4550_p3[2]),
        .S(\select_ln476_6_reg_5572[6]_i_4_n_0 ));
  FDRE \res_max_bin_r_t_V_reg_5582_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_fu_4592_p3[3]),
        .Q(res_max_bin_r_t_V_reg_5582[3]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[3]_i_2
       (.I0(select_ln458_13_fu_4423_p3[3]),
        .I1(select_ln458_1_fu_4347_p3[3]),
        .O(select_ln476_1_fu_4500_p3[3]),
        .S(\select_ln476_reg_5567[6]_i_4_n_0 ));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[3]_i_3
       (.I0(select_ln458_19_fu_4461_p3[3]),
        .I1(select_ln458_7_fu_4385_p3[3]),
        .O(select_ln476_7_fu_4550_p3[3]),
        .S(\select_ln476_6_reg_5572[6]_i_4_n_0 ));
  FDRE \res_max_bin_r_t_V_reg_5582_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_fu_4592_p3[4]),
        .Q(res_max_bin_r_t_V_reg_5582[4]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[4]_i_2
       (.I0(select_ln458_13_fu_4423_p3[4]),
        .I1(select_ln458_1_fu_4347_p3[4]),
        .O(select_ln476_1_fu_4500_p3[4]),
        .S(\select_ln476_reg_5567[6]_i_4_n_0 ));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[4]_i_3
       (.I0(select_ln458_19_fu_4461_p3[4]),
        .I1(select_ln458_7_fu_4385_p3[4]),
        .O(select_ln476_7_fu_4550_p3[4]),
        .S(\select_ln476_6_reg_5572[6]_i_4_n_0 ));
  FDRE \res_max_bin_r_t_V_reg_5582_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_fu_4592_p3[5]),
        .Q(res_max_bin_r_t_V_reg_5582[5]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[5]_i_2
       (.I0(select_ln458_13_fu_4423_p3[5]),
        .I1(select_ln458_1_fu_4347_p3[5]),
        .O(select_ln476_1_fu_4500_p3[5]),
        .S(\select_ln476_reg_5567[6]_i_4_n_0 ));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[5]_i_3
       (.I0(select_ln458_19_fu_4461_p3[5]),
        .I1(select_ln458_7_fu_4385_p3[5]),
        .O(select_ln476_7_fu_4550_p3[5]),
        .S(\select_ln476_6_reg_5572[6]_i_4_n_0 ));
  FDRE \res_max_bin_r_t_V_reg_5582_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_r_t_V_fu_4592_p3[6]),
        .Q(res_max_bin_r_t_V_reg_5582[6]),
        .R(1'b0));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[6]_i_2
       (.I0(select_ln458_13_fu_4423_p3[6]),
        .I1(select_ln458_1_fu_4347_p3[6]),
        .O(select_ln476_1_fu_4500_p3[6]),
        .S(\select_ln476_reg_5567[6]_i_4_n_0 ));
  MUXF7 \res_max_bin_r_t_V_reg_5582_reg[6]_i_3
       (.I0(select_ln458_19_fu_4461_p3[6]),
        .I1(select_ln458_7_fu_4385_p3[6]),
        .O(select_ln476_7_fu_4550_p3[6]),
        .S(\select_ln476_6_reg_5572[6]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h47))
    \res_max_bin_theta_t_1_reg_5593[1]_i_1
       (.I0(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .O(res_max_bin_theta_t_1_fu_4608_p3[1]));
  LUT4 #(
    .INIT(16'h0C5F))
    \res_max_bin_theta_t_1_reg_5593[2]_i_1
       (.I0(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ),
        .O(res_max_bin_theta_t_1_fu_4608_p3[2]));
  LUT6 #(
    .INIT(64'h4D444D444D44DD4D))
    \res_max_bin_theta_t_1_reg_5593[2]_i_2
       (.I0(\res_max_bin_theta_t_1_reg_5593[2]_i_3_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[2]_i_4_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0 ),
        .I3(\res_max_bin_theta_t_1_reg_5593[2]_i_6_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[2]_i_7_n_0 ),
        .I5(\res_max_bin_theta_t_1_reg_5593[2]_i_8_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *)
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[2]_i_3
       (.I0(select_ln440_23_reg_5386[3]),
        .I1(icmp_ln895_120_reg_5560),
        .I2(select_ln440_47_reg_5506[3]),
        .O(\res_max_bin_theta_t_1_reg_5593[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *)
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[2]_i_4
       (.I0(select_ln440_11_reg_5342[3]),
        .I1(icmp_ln895_116_reg_5532),
        .I2(select_ln440_35_reg_5446[3]),
        .O(\res_max_bin_theta_t_1_reg_5593[2]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[2]_i_5
       (.I0(select_ln440_23_reg_5386[2]),
        .I1(icmp_ln895_120_reg_5560),
        .I2(select_ln440_47_reg_5506[2]),
        .O(\res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *)
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[2]_i_6
       (.I0(select_ln440_11_reg_5342[2]),
        .I1(icmp_ln895_116_reg_5532),
        .I2(select_ln440_35_reg_5446[2]),
        .O(\res_max_bin_theta_t_1_reg_5593[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hD0DDD0D0D0DDDDDD))
    \res_max_bin_theta_t_1_reg_5593[2]_i_7
       (.I0(\res_max_bin_theta_t_1_reg_5593[2]_i_9_n_0 ),
        .I1(\res_max_bin_count_t_1_reg_5603[1]_i_5_n_0 ),
        .I2(\res_max_bin_count_t_1_reg_5603[0]_i_5_n_0 ),
        .I3(select_ln440_11_reg_5342[0]),
        .I4(icmp_ln895_116_reg_5532),
        .I5(select_ln440_35_reg_5446[0]),
        .O(\res_max_bin_theta_t_1_reg_5593[2]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h000000E2E2E200E2))
    \res_max_bin_theta_t_1_reg_5593[2]_i_8
       (.I0(select_ln440_47_reg_5506[1]),
        .I1(icmp_ln895_120_reg_5560),
        .I2(select_ln440_23_reg_5386[1]),
        .I3(select_ln440_35_reg_5446[1]),
        .I4(icmp_ln895_116_reg_5532),
        .I5(select_ln440_11_reg_5342[1]),
        .O(\res_max_bin_theta_t_1_reg_5593[2]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *)
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[2]_i_9
       (.I0(select_ln440_11_reg_5342[1]),
        .I1(icmp_ln895_116_reg_5532),
        .I2(select_ln440_35_reg_5446[1]),
        .O(\res_max_bin_theta_t_1_reg_5593[2]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h707F7F7F404F4040))
    \res_max_bin_theta_t_1_reg_5593[3]_i_1
       (.I0(icmp_ln895_114_reg_5518),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(icmp_ln895_118_reg_5546),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_theta_t_1_reg_5593[3]_i_2_n_0 ),
        .O(res_max_bin_theta_t_1_fu_4608_p3[3]));
  (* SOFT_HLUTNM = "soft_lutpair74" *)
  LUT3 #(
    .INIT(8'h47))
    \res_max_bin_theta_t_1_reg_5593[3]_i_2
       (.I0(icmp_ln895_116_reg_5532),
        .I1(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ),
        .I2(icmp_ln895_120_reg_5560),
        .O(\res_max_bin_theta_t_1_reg_5593[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBFB0BFBF8F808080))
    \res_max_bin_theta_t_1_reg_5593[4]_i_1
       (.I0(\res_max_bin_theta_t_1_reg_5593[4]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_theta_t_1_reg_5593[4]_i_3_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_theta_t_1_reg_5593[4]_i_4_n_0 ),
        .O(res_max_bin_theta_t_1_fu_4608_p3[4]));
  (* SOFT_HLUTNM = "soft_lutpair59" *)
  LUT3 #(
    .INIT(8'h35))
    \res_max_bin_theta_t_1_reg_5593[4]_i_2
       (.I0(icmp_ln895_106_reg_5406),
        .I1(icmp_ln895_98_reg_5314),
        .I2(icmp_ln895_114_reg_5518),
        .O(\res_max_bin_theta_t_1_reg_5593[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *)
  LUT3 #(
    .INIT(8'h35))
    \res_max_bin_theta_t_1_reg_5593[4]_i_3
       (.I0(icmp_ln895_110_reg_5466),
        .I1(icmp_ln895_102_reg_5358),
        .I2(icmp_ln895_118_reg_5546),
        .O(\res_max_bin_theta_t_1_reg_5593[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h35FF3500))
    \res_max_bin_theta_t_1_reg_5593[4]_i_4
       (.I0(icmp_ln895_108_reg_5436),
        .I1(icmp_ln895_100_reg_5336),
        .I2(icmp_ln895_116_reg_5532),
        .I3(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[4]_i_5_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *)
  LUT3 #(
    .INIT(8'h35))
    \res_max_bin_theta_t_1_reg_5593[4]_i_5
       (.I0(icmp_ln895_112_reg_5496),
        .I1(icmp_ln895_104_reg_5380),
        .I2(icmp_ln895_120_reg_5560),
        .O(\res_max_bin_theta_t_1_reg_5593[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hBFB0BFBF8F808080))
    \res_max_bin_theta_t_1_reg_5593[5]_i_1
       (.I0(\res_max_bin_theta_t_1_reg_5593[5]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_theta_t_1_reg_5593[5]_i_3_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_theta_t_1_reg_5593_reg[5]_i_4_n_0 ),
        .O(res_max_bin_theta_t_1_fu_4608_p3[5]));
  LUT4 #(
    .INIT(16'h0151))
    \res_max_bin_theta_t_1_reg_5593[5]_i_10
       (.I0(icmp_ln895_116_reg_5532),
        .I1(icmp_ln895_92_reg_5278),
        .I2(icmp_ln895_108_reg_5436),
        .I3(icmp_ln895_76_reg_5158),
        .O(\res_max_bin_theta_t_1_reg_5593[5]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF4700))
    \res_max_bin_theta_t_1_reg_5593[5]_i_2
       (.I0(icmp_ln895_66_reg_5073),
        .I1(icmp_ln895_98_reg_5314),
        .I2(icmp_ln895_82_reg_5193),
        .I3(icmp_ln895_114_reg_5518),
        .I4(\res_max_bin_theta_t_1_reg_5593[5]_i_5_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF4700))
    \res_max_bin_theta_t_1_reg_5593[5]_i_3
       (.I0(icmp_ln895_70_reg_5113),
        .I1(icmp_ln895_102_reg_5358),
        .I2(icmp_ln895_86_reg_5233),
        .I3(icmp_ln895_118_reg_5546),
        .I4(\res_max_bin_theta_t_1_reg_5593[5]_i_6_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *)
  LUT4 #(
    .INIT(16'h0151))
    \res_max_bin_theta_t_1_reg_5593[5]_i_5
       (.I0(icmp_ln895_114_reg_5518),
        .I1(icmp_ln895_90_reg_5268),
        .I2(icmp_ln895_106_reg_5406),
        .I3(icmp_ln895_74_reg_5148),
        .O(\res_max_bin_theta_t_1_reg_5593[5]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *)
  LUT4 #(
    .INIT(16'h0151))
    \res_max_bin_theta_t_1_reg_5593[5]_i_6
       (.I0(icmp_ln895_118_reg_5546),
        .I1(icmp_ln895_94_reg_5288),
        .I2(icmp_ln895_110_reg_5466),
        .I3(icmp_ln895_78_reg_5168),
        .O(\res_max_bin_theta_t_1_reg_5593[5]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF4700))
    \res_max_bin_theta_t_1_reg_5593[5]_i_7
       (.I0(icmp_ln895_72_reg_5133),
        .I1(icmp_ln895_104_reg_5380),
        .I2(icmp_ln895_88_reg_5253),
        .I3(icmp_ln895_120_reg_5560),
        .I4(\res_max_bin_theta_t_1_reg_5593[5]_i_9_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[5]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF4700))
    \res_max_bin_theta_t_1_reg_5593[5]_i_8
       (.I0(icmp_ln895_68_reg_5093),
        .I1(icmp_ln895_100_reg_5336),
        .I2(icmp_ln895_84_reg_5213),
        .I3(icmp_ln895_116_reg_5532),
        .I4(\res_max_bin_theta_t_1_reg_5593[5]_i_10_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[5]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *)
  LUT4 #(
    .INIT(16'h0151))
    \res_max_bin_theta_t_1_reg_5593[5]_i_9
       (.I0(icmp_ln895_120_reg_5560),
        .I1(icmp_ln895_96_reg_5298),
        .I2(icmp_ln895_112_reg_5496),
        .I3(icmp_ln895_80_reg_5178),
        .O(\res_max_bin_theta_t_1_reg_5593[5]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hBFB0BFBF8F808080))
    \res_max_bin_theta_t_1_reg_5593[6]_i_1
       (.I0(\res_max_bin_theta_t_1_reg_5593_reg[6]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ),
        .I3(\res_max_bin_theta_t_1_reg_5593_reg[6]_i_5_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ),
        .I5(\res_max_bin_theta_t_1_reg_5593[6]_i_7_n_0 ),
        .O(res_max_bin_theta_t_1_fu_4608_p3[6]));
  (* SOFT_HLUTNM = "soft_lutpair26" *)
  LUT4 #(
    .INIT(16'h001D))
    \res_max_bin_theta_t_1_reg_5593[6]_i_10
       (.I0(select_ln440_29_reg_5416[3]),
        .I1(icmp_ln895_114_reg_5518),
        .I2(select_ln440_5_reg_5320[3]),
        .I3(\res_max_bin_count_t_1_reg_5603[3]_i_3_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h8F888FFF88888888))
    \res_max_bin_theta_t_1_reg_5593[6]_i_11
       (.I0(\res_max_bin_count_t_1_reg_5603[3]_i_3_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_14_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[2]_i_6_n_0 ),
        .I3(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0 ),
        .I5(\res_max_bin_count_t_1_reg_5603[2]_i_2_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h020202A2A2A202A2))
    \res_max_bin_theta_t_1_reg_5593[6]_i_12
       (.I0(\res_max_bin_count_t_1_reg_5603[0]_i_2_n_0 ),
        .I1(\res_max_bin_count_t_1_reg_5603[0]_i_5_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ),
        .I3(select_ln440_35_reg_5446[0]),
        .I4(icmp_ln895_116_reg_5532),
        .I5(select_ln440_11_reg_5342[0]),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EEE222E2))
    \res_max_bin_theta_t_1_reg_5593[6]_i_13
       (.I0(\res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ),
        .I2(select_ln440_35_reg_5446[2]),
        .I3(icmp_ln895_116_reg_5532),
        .I4(select_ln440_11_reg_5342[2]),
        .I5(\res_max_bin_count_t_1_reg_5603[2]_i_2_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *)
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[6]_i_14
       (.I0(select_ln440_5_reg_5320[3]),
        .I1(icmp_ln895_114_reg_5518),
        .I2(select_ln440_29_reg_5416[3]),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hE2FFFFFF0000E2FF))
    \res_max_bin_theta_t_1_reg_5593[6]_i_15
       (.I0(select_ln440_41_reg_5476[0]),
        .I1(icmp_ln895_118_reg_5546),
        .I2(select_ln440_17_reg_5364[0]),
        .I3(\res_max_bin_count_t_1_reg_5603[0]_i_2_n_0 ),
        .I4(\res_max_bin_count_t_1_reg_5603[1]_i_2_n_0 ),
        .I5(\res_max_bin_count_t_1_reg_5603[1]_i_3_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_theta_t_1_reg_5593[6]_i_16
       (.I0(icmp_ln895_13_reg_4808),
        .I1(icmp_ln895_78_reg_5168),
        .I2(icmp_ln895_45_reg_4968),
        .I3(icmp_ln895_110_reg_5466),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_27_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_16_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_theta_t_1_reg_5593[6]_i_17
       (.I0(icmp_ln895_6_reg_4768),
        .I1(icmp_ln895_70_reg_5113),
        .I2(icmp_ln895_37_reg_4928),
        .I3(icmp_ln895_102_reg_5358),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_28_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *)
  LUT4 #(
    .INIT(16'h001D))
    \res_max_bin_theta_t_1_reg_5593[6]_i_18
       (.I0(select_ln440_41_reg_5476[3]),
        .I1(icmp_ln895_118_reg_5546),
        .I2(select_ln440_17_reg_5364[3]),
        .I3(\res_max_bin_count_t_1_reg_5603[3]_i_3_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h8F888FFF88888888))
    \res_max_bin_theta_t_1_reg_5593[6]_i_19
       (.I0(\res_max_bin_count_t_1_reg_5603[3]_i_3_n_0 ),
        .I1(\res_max_bin_count_t_1_reg_5603[3]_i_2_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[2]_i_6_n_0 ),
        .I3(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0 ),
        .I5(\res_max_bin_count_t_1_reg_5603[2]_i_3_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'h020202A2A2A202A2))
    \res_max_bin_theta_t_1_reg_5593[6]_i_20
       (.I0(\res_max_bin_count_t_1_reg_5603[0]_i_3_n_0 ),
        .I1(\res_max_bin_count_t_1_reg_5603[0]_i_5_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ),
        .I3(select_ln440_35_reg_5446[0]),
        .I4(icmp_ln895_116_reg_5532),
        .I5(select_ln440_11_reg_5342[0]),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EEE222E2))
    \res_max_bin_theta_t_1_reg_5593[6]_i_21
       (.I0(\res_max_bin_theta_t_1_reg_5593[2]_i_5_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ),
        .I2(select_ln440_35_reg_5446[2]),
        .I3(icmp_ln895_116_reg_5532),
        .I4(select_ln440_11_reg_5342[2]),
        .I5(\res_max_bin_count_t_1_reg_5603[2]_i_3_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_21_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_theta_t_1_reg_5593[6]_i_22
       (.I0(icmp_ln895_3_reg_4758),
        .I1(icmp_ln895_68_reg_5093),
        .I2(icmp_ln895_35_reg_4918),
        .I3(icmp_ln895_100_reg_5336),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_29_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_22_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_theta_t_1_reg_5593[6]_i_23
       (.I0(icmp_ln895_11_reg_4798),
        .I1(icmp_ln895_76_reg_5158),
        .I2(icmp_ln895_43_reg_4958),
        .I3(icmp_ln895_108_reg_5436),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_30_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_23_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[6]_i_25
       (.I0(icmp_ln895_25_reg_4868),
        .I1(icmp_ln895_90_reg_5268),
        .I2(icmp_ln895_57_reg_5028),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_25_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[6]_i_26
       (.I0(icmp_ln895_17_reg_4828),
        .I1(icmp_ln895_82_reg_5193),
        .I2(icmp_ln895_49_reg_4988),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_26_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[6]_i_27
       (.I0(icmp_ln895_29_reg_4888),
        .I1(icmp_ln895_94_reg_5288),
        .I2(icmp_ln895_61_reg_5048),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_27_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[6]_i_28
       (.I0(icmp_ln895_21_reg_4848),
        .I1(icmp_ln895_86_reg_5233),
        .I2(icmp_ln895_53_reg_5008),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_28_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[6]_i_29
       (.I0(icmp_ln895_19_reg_4838),
        .I1(icmp_ln895_84_reg_5213),
        .I2(icmp_ln895_51_reg_4998),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_29_n_0 ));
  LUT6 #(
    .INIT(64'h4444444454554454))
    \res_max_bin_theta_t_1_reg_5593[6]_i_3
       (.I0(\res_max_bin_theta_t_1_reg_5593[6]_i_10_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_11_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_12_n_0 ),
        .I3(\res_max_bin_count_t_1_reg_5603[1]_i_4_n_0 ),
        .I4(\res_max_bin_count_t_1_reg_5603[1]_i_2_n_0 ),
        .I5(\res_max_bin_theta_t_1_reg_5593[6]_i_13_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[6]_i_30
       (.I0(icmp_ln895_27_reg_4878),
        .I1(icmp_ln895_92_reg_5278),
        .I2(icmp_ln895_59_reg_5038),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_30_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_theta_t_1_reg_5593[6]_i_31
       (.I0(icmp_ln895_15_reg_4818),
        .I1(icmp_ln895_80_reg_5178),
        .I2(icmp_ln895_47_reg_4978),
        .I3(icmp_ln895_112_reg_5496),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_33_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_31_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_theta_t_1_reg_5593[6]_i_32
       (.I0(icmp_ln895_7_reg_4778),
        .I1(icmp_ln895_72_reg_5133),
        .I2(icmp_ln895_39_reg_4938),
        .I3(icmp_ln895_104_reg_5380),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_34_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_32_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[6]_i_33
       (.I0(icmp_ln895_31_reg_4898),
        .I1(icmp_ln895_96_reg_5298),
        .I2(icmp_ln895_63_reg_5058),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_33_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \res_max_bin_theta_t_1_reg_5593[6]_i_34
       (.I0(icmp_ln895_23_reg_4858),
        .I1(icmp_ln895_88_reg_5253),
        .I2(icmp_ln895_55_reg_5018),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_34_n_0 ));
  LUT5 #(
    .INIT(32'h4D44DD4D))
    \res_max_bin_theta_t_1_reg_5593[6]_i_4
       (.I0(\res_max_bin_count_t_1_reg_5603[3]_i_2_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_14_n_0 ),
        .I2(\res_max_bin_count_t_1_reg_5603[2]_i_3_n_0 ),
        .I3(\res_max_bin_count_t_1_reg_5603[2]_i_2_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_15_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h4444444454554454))
    \res_max_bin_theta_t_1_reg_5593[6]_i_6
       (.I0(\res_max_bin_theta_t_1_reg_5593[6]_i_18_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_19_n_0 ),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_20_n_0 ),
        .I3(\res_max_bin_count_t_1_reg_5603[1]_i_4_n_0 ),
        .I4(\res_max_bin_count_t_1_reg_5603[1]_i_3_n_0 ),
        .I5(\res_max_bin_theta_t_1_reg_5593[6]_i_21_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_theta_t_1_reg_5593[6]_i_7
       (.I0(\res_max_bin_theta_t_1_reg_5593[6]_i_22_n_0 ),
        .I1(icmp_ln895_116_reg_5532),
        .I2(\res_max_bin_theta_t_1_reg_5593[6]_i_23_n_0 ),
        .I3(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ),
        .I4(\res_max_bin_theta_t_1_reg_5593_reg[6]_i_24_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_theta_t_1_reg_5593[6]_i_8
       (.I0(icmp_ln895_9_reg_4788),
        .I1(icmp_ln895_74_reg_5148),
        .I2(icmp_ln895_41_reg_4948),
        .I3(icmp_ln895_106_reg_5406),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_25_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \res_max_bin_theta_t_1_reg_5593[6]_i_9
       (.I0(icmp_ln895_1_reg_4748),
        .I1(icmp_ln895_66_reg_5073),
        .I2(icmp_ln895_33_reg_4908),
        .I3(icmp_ln895_98_reg_5314),
        .I4(\res_max_bin_theta_t_1_reg_5593[6]_i_26_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593[6]_i_9_n_0 ));
  FDRE \res_max_bin_theta_t_1_reg_5593_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_theta_t_1_fu_4608_p3[1]),
        .Q(res_max_bin_theta_t_1_reg_5593[1]),
        .R(1'b0));
  FDRE \res_max_bin_theta_t_1_reg_5593_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_theta_t_1_fu_4608_p3[2]),
        .Q(res_max_bin_theta_t_1_reg_5593[2]),
        .R(1'b0));
  FDRE \res_max_bin_theta_t_1_reg_5593_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_theta_t_1_fu_4608_p3[3]),
        .Q(res_max_bin_theta_t_1_reg_5593[3]),
        .R(1'b0));
  FDRE \res_max_bin_theta_t_1_reg_5593_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_theta_t_1_fu_4608_p3[4]),
        .Q(res_max_bin_theta_t_1_reg_5593[4]),
        .R(1'b0));
  FDRE \res_max_bin_theta_t_1_reg_5593_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_theta_t_1_fu_4608_p3[5]),
        .Q(res_max_bin_theta_t_1_reg_5593[5]),
        .R(1'b0));
  MUXF7 \res_max_bin_theta_t_1_reg_5593_reg[5]_i_4
       (.I0(\res_max_bin_theta_t_1_reg_5593[5]_i_7_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[5]_i_8_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593_reg[5]_i_4_n_0 ),
        .S(\res_max_bin_theta_t_1_reg_5593[2]_i_2_n_0 ));
  FDRE \res_max_bin_theta_t_1_reg_5593_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(res_max_bin_theta_t_1_fu_4608_p3[6]),
        .Q(res_max_bin_theta_t_1_reg_5593[6]),
        .R(1'b0));
  MUXF7 \res_max_bin_theta_t_1_reg_5593_reg[6]_i_2
       (.I0(\res_max_bin_theta_t_1_reg_5593[6]_i_8_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_9_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593_reg[6]_i_2_n_0 ),
        .S(icmp_ln895_114_reg_5518));
  MUXF7 \res_max_bin_theta_t_1_reg_5593_reg[6]_i_24
       (.I0(\res_max_bin_theta_t_1_reg_5593[6]_i_31_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_32_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593_reg[6]_i_24_n_0 ),
        .S(icmp_ln895_120_reg_5560));
  MUXF7 \res_max_bin_theta_t_1_reg_5593_reg[6]_i_5
       (.I0(\res_max_bin_theta_t_1_reg_5593[6]_i_16_n_0 ),
        .I1(\res_max_bin_theta_t_1_reg_5593[6]_i_17_n_0 ),
        .O(\res_max_bin_theta_t_1_reg_5593_reg[6]_i_5_n_0 ),
        .S(icmp_ln895_118_reg_5546));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[0]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[0]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[10]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[10]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[11]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[11]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[12]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[12]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[12]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[13]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[13]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[13]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[14]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[14]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[14]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[15]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[15]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[15]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[16]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[16]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[16]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[17]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[17]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[17]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[18]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[18]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[18]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[19]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[19]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[19]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[1]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[1]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[20]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[20]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[20]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[21]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[21]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[21]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[2]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[2]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[3]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[3]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[4]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[4]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[5]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[5]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[6]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[6]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[7]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[7]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[8]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[8]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_pp0_iter1_reg_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V_read_reg_4733[9]),
        .Q(roi_seed_r_V_read_reg_4733_pp0_iter1_reg[9]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[0]),
        .Q(roi_seed_r_V_read_reg_4733[0]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[10]),
        .Q(roi_seed_r_V_read_reg_4733[10]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[11]),
        .Q(roi_seed_r_V_read_reg_4733[11]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[12]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[12]),
        .Q(roi_seed_r_V_read_reg_4733[12]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[13]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[13]),
        .Q(roi_seed_r_V_read_reg_4733[13]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[14]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[14]),
        .Q(roi_seed_r_V_read_reg_4733[14]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[15]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[15]),
        .Q(roi_seed_r_V_read_reg_4733[15]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[16]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[16]),
        .Q(roi_seed_r_V_read_reg_4733[16]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[17]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[17]),
        .Q(roi_seed_r_V_read_reg_4733[17]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[18]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[18]),
        .Q(roi_seed_r_V_read_reg_4733[18]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[19]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[19]),
        .Q(roi_seed_r_V_read_reg_4733[19]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[1]),
        .Q(roi_seed_r_V_read_reg_4733[1]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[20]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[20]),
        .Q(roi_seed_r_V_read_reg_4733[20]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[21]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[21]),
        .Q(roi_seed_r_V_read_reg_4733[21]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[2]),
        .Q(roi_seed_r_V_read_reg_4733[2]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[3]),
        .Q(roi_seed_r_V_read_reg_4733[3]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[4]),
        .Q(roi_seed_r_V_read_reg_4733[4]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[5]),
        .Q(roi_seed_r_V_read_reg_4733[5]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[6]),
        .Q(roi_seed_r_V_read_reg_4733[6]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[7]),
        .Q(roi_seed_r_V_read_reg_4733[7]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[8]),
        .Q(roi_seed_r_V_read_reg_4733[8]),
        .R(1'b0));
  FDRE \roi_seed_r_V_read_reg_4733_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(roi_seed_r_V[9]),
        .Q(roi_seed_r_V_read_reg_4733[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_10_reg_5098[0]_i_1
       (.I0(max_bin_r_3_V[0]),
        .I1(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ),
        .I2(max_bin_r_35_V[0]),
        .I3(\icmp_ln895_35_reg_4918[0]_i_1_n_0 ),
        .O(select_ln422_10_fu_2815_p3[0]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_10_reg_5098[1]_i_1
       (.I0(max_bin_r_3_V[1]),
        .I1(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ),
        .I2(max_bin_r_35_V[1]),
        .I3(\icmp_ln895_35_reg_4918[0]_i_1_n_0 ),
        .O(select_ln422_10_fu_2815_p3[1]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_10_reg_5098[2]_i_1
       (.I0(max_bin_r_3_V[2]),
        .I1(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ),
        .I2(max_bin_r_35_V[2]),
        .I3(\icmp_ln895_35_reg_4918[0]_i_1_n_0 ),
        .O(select_ln422_10_fu_2815_p3[2]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_10_reg_5098[3]_i_1
       (.I0(max_bin_r_3_V[3]),
        .I1(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ),
        .I2(max_bin_r_35_V[3]),
        .I3(\icmp_ln895_35_reg_4918[0]_i_1_n_0 ),
        .O(select_ln422_10_fu_2815_p3[3]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_10_reg_5098[4]_i_1
       (.I0(max_bin_r_3_V[4]),
        .I1(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ),
        .I2(max_bin_r_35_V[4]),
        .I3(\icmp_ln895_35_reg_4918[0]_i_1_n_0 ),
        .O(select_ln422_10_fu_2815_p3[4]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_10_reg_5098[5]_i_1
       (.I0(max_bin_r_3_V[5]),
        .I1(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ),
        .I2(max_bin_r_35_V[5]),
        .I3(\icmp_ln895_35_reg_4918[0]_i_1_n_0 ),
        .O(select_ln422_10_fu_2815_p3[5]));
  LUT5 #(
    .INIT(32'h00000002))
    \select_ln422_10_reg_5098[6]_i_1
       (.I0(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ),
        .I1(max_bin_count_3_V[0]),
        .I2(max_bin_count_3_V[1]),
        .I3(max_bin_count_3_V[3]),
        .I4(max_bin_count_3_V[2]),
        .O(select_ln422_10_reg_5098));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_10_reg_5098[6]_i_2
       (.I0(max_bin_r_3_V[6]),
        .I1(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ),
        .I2(max_bin_r_35_V[6]),
        .I3(\icmp_ln895_35_reg_4918[0]_i_1_n_0 ),
        .O(select_ln422_10_fu_2815_p3[6]));
  FDRE \select_ln422_10_reg_5098_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_10_fu_2815_p3[0]),
        .Q(\select_ln422_10_reg_5098_reg_n_0_[0] ),
        .R(select_ln422_10_reg_5098));
  FDRE \select_ln422_10_reg_5098_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_10_fu_2815_p3[1]),
        .Q(\select_ln422_10_reg_5098_reg_n_0_[1] ),
        .R(select_ln422_10_reg_5098));
  FDRE \select_ln422_10_reg_5098_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_10_fu_2815_p3[2]),
        .Q(\select_ln422_10_reg_5098_reg_n_0_[2] ),
        .R(select_ln422_10_reg_5098));
  FDRE \select_ln422_10_reg_5098_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_10_fu_2815_p3[3]),
        .Q(\select_ln422_10_reg_5098_reg_n_0_[3] ),
        .R(select_ln422_10_reg_5098));
  FDRE \select_ln422_10_reg_5098_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_10_fu_2815_p3[4]),
        .Q(\select_ln422_10_reg_5098_reg_n_0_[4] ),
        .R(select_ln422_10_reg_5098));
  FDRE \select_ln422_10_reg_5098_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_10_fu_2815_p3[5]),
        .Q(\select_ln422_10_reg_5098_reg_n_0_[5] ),
        .R(select_ln422_10_reg_5098));
  FDRE \select_ln422_10_reg_5098_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_10_fu_2815_p3[6]),
        .Q(\select_ln422_10_reg_5098_reg_n_0_[6] ),
        .R(select_ln422_10_reg_5098));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_13_reg_5108[0]_i_1
       (.I0(max_bin_r_4_V[0]),
        .I1(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ),
        .I2(max_bin_r_36_V[0]),
        .I3(\icmp_ln895_36_reg_4923[0]_i_1_n_0 ),
        .O(select_ln422_13_fu_2832_p3[0]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_13_reg_5108[1]_i_1
       (.I0(max_bin_r_4_V[1]),
        .I1(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ),
        .I2(max_bin_r_36_V[1]),
        .I3(\icmp_ln895_36_reg_4923[0]_i_1_n_0 ),
        .O(select_ln422_13_fu_2832_p3[1]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_13_reg_5108[2]_i_1
       (.I0(max_bin_r_4_V[2]),
        .I1(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ),
        .I2(max_bin_r_36_V[2]),
        .I3(\icmp_ln895_36_reg_4923[0]_i_1_n_0 ),
        .O(select_ln422_13_fu_2832_p3[2]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_13_reg_5108[3]_i_1
       (.I0(max_bin_r_4_V[3]),
        .I1(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ),
        .I2(max_bin_r_36_V[3]),
        .I3(\icmp_ln895_36_reg_4923[0]_i_1_n_0 ),
        .O(select_ln422_13_fu_2832_p3[3]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_13_reg_5108[4]_i_1
       (.I0(max_bin_r_4_V[4]),
        .I1(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ),
        .I2(max_bin_r_36_V[4]),
        .I3(\icmp_ln895_36_reg_4923[0]_i_1_n_0 ),
        .O(select_ln422_13_fu_2832_p3[4]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_13_reg_5108[5]_i_1
       (.I0(max_bin_r_4_V[5]),
        .I1(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ),
        .I2(max_bin_r_36_V[5]),
        .I3(\icmp_ln895_36_reg_4923[0]_i_1_n_0 ),
        .O(select_ln422_13_fu_2832_p3[5]));
  LUT5 #(
    .INIT(32'h00000002))
    \select_ln422_13_reg_5108[6]_i_1
       (.I0(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ),
        .I1(max_bin_count_4_V[0]),
        .I2(max_bin_count_4_V[1]),
        .I3(max_bin_count_4_V[3]),
        .I4(max_bin_count_4_V[2]),
        .O(select_ln422_13_reg_5108));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_13_reg_5108[6]_i_2
       (.I0(max_bin_r_4_V[6]),
        .I1(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ),
        .I2(max_bin_r_36_V[6]),
        .I3(\icmp_ln895_36_reg_4923[0]_i_1_n_0 ),
        .O(select_ln422_13_fu_2832_p3[6]));
  FDRE \select_ln422_13_reg_5108_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_13_fu_2832_p3[0]),
        .Q(\select_ln422_13_reg_5108_reg_n_0_[0] ),
        .R(select_ln422_13_reg_5108));
  FDRE \select_ln422_13_reg_5108_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_13_fu_2832_p3[1]),
        .Q(\select_ln422_13_reg_5108_reg_n_0_[1] ),
        .R(select_ln422_13_reg_5108));
  FDRE \select_ln422_13_reg_5108_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_13_fu_2832_p3[2]),
        .Q(\select_ln422_13_reg_5108_reg_n_0_[2] ),
        .R(select_ln422_13_reg_5108));
  FDRE \select_ln422_13_reg_5108_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_13_fu_2832_p3[3]),
        .Q(\select_ln422_13_reg_5108_reg_n_0_[3] ),
        .R(select_ln422_13_reg_5108));
  FDRE \select_ln422_13_reg_5108_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_13_fu_2832_p3[4]),
        .Q(\select_ln422_13_reg_5108_reg_n_0_[4] ),
        .R(select_ln422_13_reg_5108));
  FDRE \select_ln422_13_reg_5108_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_13_fu_2832_p3[5]),
        .Q(\select_ln422_13_reg_5108_reg_n_0_[5] ),
        .R(select_ln422_13_reg_5108));
  FDRE \select_ln422_13_reg_5108_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_13_fu_2832_p3[6]),
        .Q(\select_ln422_13_reg_5108_reg_n_0_[6] ),
        .R(select_ln422_13_reg_5108));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_16_reg_5118[0]_i_1
       (.I0(max_bin_r_5_V[0]),
        .I1(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ),
        .I2(max_bin_r_37_V[0]),
        .I3(\icmp_ln895_37_reg_4928[0]_i_1_n_0 ),
        .O(select_ln422_16_fu_2849_p3[0]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_16_reg_5118[1]_i_1
       (.I0(max_bin_r_5_V[1]),
        .I1(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ),
        .I2(max_bin_r_37_V[1]),
        .I3(\icmp_ln895_37_reg_4928[0]_i_1_n_0 ),
        .O(select_ln422_16_fu_2849_p3[1]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_16_reg_5118[2]_i_1
       (.I0(max_bin_r_5_V[2]),
        .I1(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ),
        .I2(max_bin_r_37_V[2]),
        .I3(\icmp_ln895_37_reg_4928[0]_i_1_n_0 ),
        .O(select_ln422_16_fu_2849_p3[2]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_16_reg_5118[3]_i_1
       (.I0(max_bin_r_5_V[3]),
        .I1(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ),
        .I2(max_bin_r_37_V[3]),
        .I3(\icmp_ln895_37_reg_4928[0]_i_1_n_0 ),
        .O(select_ln422_16_fu_2849_p3[3]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_16_reg_5118[4]_i_1
       (.I0(max_bin_r_5_V[4]),
        .I1(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ),
        .I2(max_bin_r_37_V[4]),
        .I3(\icmp_ln895_37_reg_4928[0]_i_1_n_0 ),
        .O(select_ln422_16_fu_2849_p3[4]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_16_reg_5118[5]_i_1
       (.I0(max_bin_r_5_V[5]),
        .I1(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ),
        .I2(max_bin_r_37_V[5]),
        .I3(\icmp_ln895_37_reg_4928[0]_i_1_n_0 ),
        .O(select_ln422_16_fu_2849_p3[5]));
  LUT5 #(
    .INIT(32'h00000002))
    \select_ln422_16_reg_5118[6]_i_1
       (.I0(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ),
        .I1(max_bin_count_5_V[0]),
        .I2(max_bin_count_5_V[1]),
        .I3(max_bin_count_5_V[3]),
        .I4(max_bin_count_5_V[2]),
        .O(select_ln422_16_reg_5118));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_16_reg_5118[6]_i_2
       (.I0(max_bin_r_5_V[6]),
        .I1(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ),
        .I2(max_bin_r_37_V[6]),
        .I3(\icmp_ln895_37_reg_4928[0]_i_1_n_0 ),
        .O(select_ln422_16_fu_2849_p3[6]));
  FDRE \select_ln422_16_reg_5118_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_16_fu_2849_p3[0]),
        .Q(\select_ln422_16_reg_5118_reg_n_0_[0] ),
        .R(select_ln422_16_reg_5118));
  FDRE \select_ln422_16_reg_5118_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_16_fu_2849_p3[1]),
        .Q(\select_ln422_16_reg_5118_reg_n_0_[1] ),
        .R(select_ln422_16_reg_5118));
  FDRE \select_ln422_16_reg_5118_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_16_fu_2849_p3[2]),
        .Q(\select_ln422_16_reg_5118_reg_n_0_[2] ),
        .R(select_ln422_16_reg_5118));
  FDRE \select_ln422_16_reg_5118_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_16_fu_2849_p3[3]),
        .Q(\select_ln422_16_reg_5118_reg_n_0_[3] ),
        .R(select_ln422_16_reg_5118));
  FDRE \select_ln422_16_reg_5118_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_16_fu_2849_p3[4]),
        .Q(\select_ln422_16_reg_5118_reg_n_0_[4] ),
        .R(select_ln422_16_reg_5118));
  FDRE \select_ln422_16_reg_5118_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_16_fu_2849_p3[5]),
        .Q(\select_ln422_16_reg_5118_reg_n_0_[5] ),
        .R(select_ln422_16_reg_5118));
  FDRE \select_ln422_16_reg_5118_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_16_fu_2849_p3[6]),
        .Q(\select_ln422_16_reg_5118_reg_n_0_[6] ),
        .R(select_ln422_16_reg_5118));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_19_reg_5128[0]_i_1
       (.I0(max_bin_r_6_V[0]),
        .I1(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ),
        .I2(max_bin_r_38_V[0]),
        .I3(\icmp_ln895_38_reg_4933[0]_i_1_n_0 ),
        .O(select_ln422_19_fu_2866_p3[0]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_19_reg_5128[1]_i_1
       (.I0(max_bin_r_6_V[1]),
        .I1(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ),
        .I2(max_bin_r_38_V[1]),
        .I3(\icmp_ln895_38_reg_4933[0]_i_1_n_0 ),
        .O(select_ln422_19_fu_2866_p3[1]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_19_reg_5128[2]_i_1
       (.I0(max_bin_r_6_V[2]),
        .I1(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ),
        .I2(max_bin_r_38_V[2]),
        .I3(\icmp_ln895_38_reg_4933[0]_i_1_n_0 ),
        .O(select_ln422_19_fu_2866_p3[2]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_19_reg_5128[3]_i_1
       (.I0(max_bin_r_6_V[3]),
        .I1(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ),
        .I2(max_bin_r_38_V[3]),
        .I3(\icmp_ln895_38_reg_4933[0]_i_1_n_0 ),
        .O(select_ln422_19_fu_2866_p3[3]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_19_reg_5128[4]_i_1
       (.I0(max_bin_r_6_V[4]),
        .I1(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ),
        .I2(max_bin_r_38_V[4]),
        .I3(\icmp_ln895_38_reg_4933[0]_i_1_n_0 ),
        .O(select_ln422_19_fu_2866_p3[4]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_19_reg_5128[5]_i_1
       (.I0(max_bin_r_6_V[5]),
        .I1(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ),
        .I2(max_bin_r_38_V[5]),
        .I3(\icmp_ln895_38_reg_4933[0]_i_1_n_0 ),
        .O(select_ln422_19_fu_2866_p3[5]));
  LUT5 #(
    .INIT(32'h00000002))
    \select_ln422_19_reg_5128[6]_i_1
       (.I0(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ),
        .I1(max_bin_count_6_V[0]),
        .I2(max_bin_count_6_V[1]),
        .I3(max_bin_count_6_V[3]),
        .I4(max_bin_count_6_V[2]),
        .O(select_ln422_19_reg_5128));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_19_reg_5128[6]_i_2
       (.I0(max_bin_r_6_V[6]),
        .I1(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ),
        .I2(max_bin_r_38_V[6]),
        .I3(\icmp_ln895_38_reg_4933[0]_i_1_n_0 ),
        .O(select_ln422_19_fu_2866_p3[6]));
  FDRE \select_ln422_19_reg_5128_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_19_fu_2866_p3[0]),
        .Q(\select_ln422_19_reg_5128_reg_n_0_[0] ),
        .R(select_ln422_19_reg_5128));
  FDRE \select_ln422_19_reg_5128_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_19_fu_2866_p3[1]),
        .Q(\select_ln422_19_reg_5128_reg_n_0_[1] ),
        .R(select_ln422_19_reg_5128));
  FDRE \select_ln422_19_reg_5128_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_19_fu_2866_p3[2]),
        .Q(\select_ln422_19_reg_5128_reg_n_0_[2] ),
        .R(select_ln422_19_reg_5128));
  FDRE \select_ln422_19_reg_5128_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_19_fu_2866_p3[3]),
        .Q(\select_ln422_19_reg_5128_reg_n_0_[3] ),
        .R(select_ln422_19_reg_5128));
  FDRE \select_ln422_19_reg_5128_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_19_fu_2866_p3[4]),
        .Q(\select_ln422_19_reg_5128_reg_n_0_[4] ),
        .R(select_ln422_19_reg_5128));
  FDRE \select_ln422_19_reg_5128_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_19_fu_2866_p3[5]),
        .Q(\select_ln422_19_reg_5128_reg_n_0_[5] ),
        .R(select_ln422_19_reg_5128));
  FDRE \select_ln422_19_reg_5128_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_19_fu_2866_p3[6]),
        .Q(\select_ln422_19_reg_5128_reg_n_0_[6] ),
        .R(select_ln422_19_reg_5128));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_1_reg_5068[0]_i_1
       (.I0(max_bin_r_0_V[0]),
        .I1(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ),
        .I2(max_bin_r_32_V[0]),
        .I3(\icmp_ln895_32_reg_4903[0]_i_1_n_0 ),
        .O(select_ln422_1_fu_2764_p3[0]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_1_reg_5068[1]_i_1
       (.I0(max_bin_r_0_V[1]),
        .I1(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ),
        .I2(max_bin_r_32_V[1]),
        .I3(\icmp_ln895_32_reg_4903[0]_i_1_n_0 ),
        .O(select_ln422_1_fu_2764_p3[1]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_1_reg_5068[2]_i_1
       (.I0(max_bin_r_0_V[2]),
        .I1(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ),
        .I2(max_bin_r_32_V[2]),
        .I3(\icmp_ln895_32_reg_4903[0]_i_1_n_0 ),
        .O(select_ln422_1_fu_2764_p3[2]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_1_reg_5068[3]_i_1
       (.I0(max_bin_r_0_V[3]),
        .I1(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ),
        .I2(max_bin_r_32_V[3]),
        .I3(\icmp_ln895_32_reg_4903[0]_i_1_n_0 ),
        .O(select_ln422_1_fu_2764_p3[3]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_1_reg_5068[4]_i_1
       (.I0(max_bin_r_0_V[4]),
        .I1(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ),
        .I2(max_bin_r_32_V[4]),
        .I3(\icmp_ln895_32_reg_4903[0]_i_1_n_0 ),
        .O(select_ln422_1_fu_2764_p3[4]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_1_reg_5068[5]_i_1
       (.I0(max_bin_r_0_V[5]),
        .I1(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ),
        .I2(max_bin_r_32_V[5]),
        .I3(\icmp_ln895_32_reg_4903[0]_i_1_n_0 ),
        .O(select_ln422_1_fu_2764_p3[5]));
  LUT5 #(
    .INIT(32'h00000002))
    \select_ln422_1_reg_5068[6]_i_1
       (.I0(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ),
        .I1(max_bin_count_0_V[0]),
        .I2(max_bin_count_0_V[1]),
        .I3(max_bin_count_0_V[3]),
        .I4(max_bin_count_0_V[2]),
        .O(select_ln422_1_reg_5068));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_1_reg_5068[6]_i_2
       (.I0(max_bin_r_0_V[6]),
        .I1(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ),
        .I2(max_bin_r_32_V[6]),
        .I3(\icmp_ln895_32_reg_4903[0]_i_1_n_0 ),
        .O(select_ln422_1_fu_2764_p3[6]));
  FDRE \select_ln422_1_reg_5068_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_1_fu_2764_p3[0]),
        .Q(\select_ln422_1_reg_5068_reg_n_0_[0] ),
        .R(select_ln422_1_reg_5068));
  FDRE \select_ln422_1_reg_5068_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_1_fu_2764_p3[1]),
        .Q(\select_ln422_1_reg_5068_reg_n_0_[1] ),
        .R(select_ln422_1_reg_5068));
  FDRE \select_ln422_1_reg_5068_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_1_fu_2764_p3[2]),
        .Q(\select_ln422_1_reg_5068_reg_n_0_[2] ),
        .R(select_ln422_1_reg_5068));
  FDRE \select_ln422_1_reg_5068_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_1_fu_2764_p3[3]),
        .Q(\select_ln422_1_reg_5068_reg_n_0_[3] ),
        .R(select_ln422_1_reg_5068));
  FDRE \select_ln422_1_reg_5068_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_1_fu_2764_p3[4]),
        .Q(\select_ln422_1_reg_5068_reg_n_0_[4] ),
        .R(select_ln422_1_reg_5068));
  FDRE \select_ln422_1_reg_5068_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_1_fu_2764_p3[5]),
        .Q(\select_ln422_1_reg_5068_reg_n_0_[5] ),
        .R(select_ln422_1_reg_5068));
  FDRE \select_ln422_1_reg_5068_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_1_fu_2764_p3[6]),
        .Q(\select_ln422_1_reg_5068_reg_n_0_[6] ),
        .R(select_ln422_1_reg_5068));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_22_reg_5138[0]_i_1
       (.I0(max_bin_r_7_V[0]),
        .I1(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ),
        .I2(max_bin_r_39_V[0]),
        .I3(\icmp_ln895_39_reg_4938[0]_i_1_n_0 ),
        .O(select_ln422_22_fu_2883_p3[0]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_22_reg_5138[1]_i_1
       (.I0(max_bin_r_7_V[1]),
        .I1(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ),
        .I2(max_bin_r_39_V[1]),
        .I3(\icmp_ln895_39_reg_4938[0]_i_1_n_0 ),
        .O(select_ln422_22_fu_2883_p3[1]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_22_reg_5138[2]_i_1
       (.I0(max_bin_r_7_V[2]),
        .I1(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ),
        .I2(max_bin_r_39_V[2]),
        .I3(\icmp_ln895_39_reg_4938[0]_i_1_n_0 ),
        .O(select_ln422_22_fu_2883_p3[2]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_22_reg_5138[3]_i_1
       (.I0(max_bin_r_7_V[3]),
        .I1(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ),
        .I2(max_bin_r_39_V[3]),
        .I3(\icmp_ln895_39_reg_4938[0]_i_1_n_0 ),
        .O(select_ln422_22_fu_2883_p3[3]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_22_reg_5138[4]_i_1
       (.I0(max_bin_r_7_V[4]),
        .I1(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ),
        .I2(max_bin_r_39_V[4]),
        .I3(\icmp_ln895_39_reg_4938[0]_i_1_n_0 ),
        .O(select_ln422_22_fu_2883_p3[4]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_22_reg_5138[5]_i_1
       (.I0(max_bin_r_7_V[5]),
        .I1(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ),
        .I2(max_bin_r_39_V[5]),
        .I3(\icmp_ln895_39_reg_4938[0]_i_1_n_0 ),
        .O(select_ln422_22_fu_2883_p3[5]));
  LUT5 #(
    .INIT(32'h00000002))
    \select_ln422_22_reg_5138[6]_i_1
       (.I0(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ),
        .I1(max_bin_count_7_V[0]),
        .I2(max_bin_count_7_V[1]),
        .I3(max_bin_count_7_V[3]),
        .I4(max_bin_count_7_V[2]),
        .O(select_ln422_22_reg_5138));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_22_reg_5138[6]_i_2
       (.I0(max_bin_r_7_V[6]),
        .I1(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ),
        .I2(max_bin_r_39_V[6]),
        .I3(\icmp_ln895_39_reg_4938[0]_i_1_n_0 ),
        .O(select_ln422_22_fu_2883_p3[6]));
  FDRE \select_ln422_22_reg_5138_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_22_fu_2883_p3[0]),
        .Q(\select_ln422_22_reg_5138_reg_n_0_[0] ),
        .R(select_ln422_22_reg_5138));
  FDRE \select_ln422_22_reg_5138_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_22_fu_2883_p3[1]),
        .Q(\select_ln422_22_reg_5138_reg_n_0_[1] ),
        .R(select_ln422_22_reg_5138));
  FDRE \select_ln422_22_reg_5138_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_22_fu_2883_p3[2]),
        .Q(\select_ln422_22_reg_5138_reg_n_0_[2] ),
        .R(select_ln422_22_reg_5138));
  FDRE \select_ln422_22_reg_5138_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_22_fu_2883_p3[3]),
        .Q(\select_ln422_22_reg_5138_reg_n_0_[3] ),
        .R(select_ln422_22_reg_5138));
  FDRE \select_ln422_22_reg_5138_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_22_fu_2883_p3[4]),
        .Q(\select_ln422_22_reg_5138_reg_n_0_[4] ),
        .R(select_ln422_22_reg_5138));
  FDRE \select_ln422_22_reg_5138_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_22_fu_2883_p3[5]),
        .Q(\select_ln422_22_reg_5138_reg_n_0_[5] ),
        .R(select_ln422_22_reg_5138));
  FDRE \select_ln422_22_reg_5138_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_22_fu_2883_p3[6]),
        .Q(\select_ln422_22_reg_5138_reg_n_0_[6] ),
        .R(select_ln422_22_reg_5138));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_49_reg_5188[0]_i_1
       (.I0(\select_ln422_49_reg_5188[6]_i_3_n_0 ),
        .I1(max_bin_count_48_V[3]),
        .I2(max_bin_count_16_V[3]),
        .I3(max_bin_r_16_V[0]),
        .I4(max_bin_r_48_V[0]),
        .I5(\icmp_ln895_48_reg_4983[0]_i_1_n_0 ),
        .O(select_ln422_49_fu_3036_p3[0]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_49_reg_5188[1]_i_1
       (.I0(\select_ln422_49_reg_5188[6]_i_3_n_0 ),
        .I1(max_bin_count_48_V[3]),
        .I2(max_bin_count_16_V[3]),
        .I3(max_bin_r_16_V[1]),
        .I4(max_bin_r_48_V[1]),
        .I5(\icmp_ln895_48_reg_4983[0]_i_1_n_0 ),
        .O(select_ln422_49_fu_3036_p3[1]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_49_reg_5188[2]_i_1
       (.I0(\select_ln422_49_reg_5188[6]_i_3_n_0 ),
        .I1(max_bin_count_48_V[3]),
        .I2(max_bin_count_16_V[3]),
        .I3(max_bin_r_16_V[2]),
        .I4(max_bin_r_48_V[2]),
        .I5(\icmp_ln895_48_reg_4983[0]_i_1_n_0 ),
        .O(select_ln422_49_fu_3036_p3[2]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_49_reg_5188[3]_i_1
       (.I0(\select_ln422_49_reg_5188[6]_i_3_n_0 ),
        .I1(max_bin_count_48_V[3]),
        .I2(max_bin_count_16_V[3]),
        .I3(max_bin_r_16_V[3]),
        .I4(max_bin_r_48_V[3]),
        .I5(\icmp_ln895_48_reg_4983[0]_i_1_n_0 ),
        .O(select_ln422_49_fu_3036_p3[3]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_49_reg_5188[4]_i_1
       (.I0(\select_ln422_49_reg_5188[6]_i_3_n_0 ),
        .I1(max_bin_count_48_V[3]),
        .I2(max_bin_count_16_V[3]),
        .I3(max_bin_r_16_V[4]),
        .I4(max_bin_r_48_V[4]),
        .I5(\icmp_ln895_48_reg_4983[0]_i_1_n_0 ),
        .O(select_ln422_49_fu_3036_p3[4]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_49_reg_5188[5]_i_1
       (.I0(\select_ln422_49_reg_5188[6]_i_3_n_0 ),
        .I1(max_bin_count_48_V[3]),
        .I2(max_bin_count_16_V[3]),
        .I3(max_bin_r_16_V[5]),
        .I4(max_bin_r_48_V[5]),
        .I5(\icmp_ln895_48_reg_4983[0]_i_1_n_0 ),
        .O(select_ln422_49_fu_3036_p3[5]));
  LUT6 #(
    .INIT(64'h0000000000000002))
    \select_ln422_49_reg_5188[6]_i_1
       (.I0(\select_ln422_49_reg_5188[6]_i_3_n_0 ),
        .I1(max_bin_count_48_V[3]),
        .I2(max_bin_count_16_V[3]),
        .I3(max_bin_count_16_V[0]),
        .I4(max_bin_count_16_V[1]),
        .I5(max_bin_count_16_V[2]),
        .O(select_ln422_49_reg_5188));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_49_reg_5188[6]_i_2
       (.I0(\select_ln422_49_reg_5188[6]_i_3_n_0 ),
        .I1(max_bin_count_48_V[3]),
        .I2(max_bin_count_16_V[3]),
        .I3(max_bin_r_16_V[6]),
        .I4(max_bin_r_48_V[6]),
        .I5(\icmp_ln895_48_reg_4983[0]_i_1_n_0 ),
        .O(select_ln422_49_fu_3036_p3[6]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln422_49_reg_5188[6]_i_3
       (.I0(max_bin_count_16_V[0]),
        .I1(max_bin_count_48_V[0]),
        .I2(max_bin_count_48_V[1]),
        .I3(max_bin_count_16_V[1]),
        .I4(max_bin_count_48_V[2]),
        .I5(max_bin_count_16_V[2]),
        .O(\select_ln422_49_reg_5188[6]_i_3_n_0 ));
  FDRE \select_ln422_49_reg_5188_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_49_fu_3036_p3[0]),
        .Q(\select_ln422_49_reg_5188_reg_n_0_[0] ),
        .R(select_ln422_49_reg_5188));
  FDRE \select_ln422_49_reg_5188_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_49_fu_3036_p3[1]),
        .Q(\select_ln422_49_reg_5188_reg_n_0_[1] ),
        .R(select_ln422_49_reg_5188));
  FDRE \select_ln422_49_reg_5188_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_49_fu_3036_p3[2]),
        .Q(\select_ln422_49_reg_5188_reg_n_0_[2] ),
        .R(select_ln422_49_reg_5188));
  FDRE \select_ln422_49_reg_5188_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_49_fu_3036_p3[3]),
        .Q(\select_ln422_49_reg_5188_reg_n_0_[3] ),
        .R(select_ln422_49_reg_5188));
  FDRE \select_ln422_49_reg_5188_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_49_fu_3036_p3[4]),
        .Q(\select_ln422_49_reg_5188_reg_n_0_[4] ),
        .R(select_ln422_49_reg_5188));
  FDRE \select_ln422_49_reg_5188_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_49_fu_3036_p3[5]),
        .Q(\select_ln422_49_reg_5188_reg_n_0_[5] ),
        .R(select_ln422_49_reg_5188));
  FDRE \select_ln422_49_reg_5188_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_49_fu_3036_p3[6]),
        .Q(\select_ln422_49_reg_5188_reg_n_0_[6] ),
        .R(select_ln422_49_reg_5188));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_4_reg_5078[0]_i_1
       (.I0(max_bin_r_1_V[0]),
        .I1(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ),
        .I2(max_bin_r_33_V[0]),
        .I3(\icmp_ln895_33_reg_4908[0]_i_1_n_0 ),
        .O(select_ln422_4_fu_2781_p3[0]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_4_reg_5078[1]_i_1
       (.I0(max_bin_r_1_V[1]),
        .I1(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ),
        .I2(max_bin_r_33_V[1]),
        .I3(\icmp_ln895_33_reg_4908[0]_i_1_n_0 ),
        .O(select_ln422_4_fu_2781_p3[1]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_4_reg_5078[2]_i_1
       (.I0(max_bin_r_1_V[2]),
        .I1(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ),
        .I2(max_bin_r_33_V[2]),
        .I3(\icmp_ln895_33_reg_4908[0]_i_1_n_0 ),
        .O(select_ln422_4_fu_2781_p3[2]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_4_reg_5078[3]_i_1
       (.I0(max_bin_r_1_V[3]),
        .I1(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ),
        .I2(max_bin_r_33_V[3]),
        .I3(\icmp_ln895_33_reg_4908[0]_i_1_n_0 ),
        .O(select_ln422_4_fu_2781_p3[3]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_4_reg_5078[4]_i_1
       (.I0(max_bin_r_1_V[4]),
        .I1(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ),
        .I2(max_bin_r_33_V[4]),
        .I3(\icmp_ln895_33_reg_4908[0]_i_1_n_0 ),
        .O(select_ln422_4_fu_2781_p3[4]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_4_reg_5078[5]_i_1
       (.I0(max_bin_r_1_V[5]),
        .I1(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ),
        .I2(max_bin_r_33_V[5]),
        .I3(\icmp_ln895_33_reg_4908[0]_i_1_n_0 ),
        .O(select_ln422_4_fu_2781_p3[5]));
  LUT5 #(
    .INIT(32'h00000002))
    \select_ln422_4_reg_5078[6]_i_1
       (.I0(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ),
        .I1(max_bin_count_1_V[0]),
        .I2(max_bin_count_1_V[1]),
        .I3(max_bin_count_1_V[3]),
        .I4(max_bin_count_1_V[2]),
        .O(select_ln422_4_reg_5078));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_4_reg_5078[6]_i_2
       (.I0(max_bin_r_1_V[6]),
        .I1(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ),
        .I2(max_bin_r_33_V[6]),
        .I3(\icmp_ln895_33_reg_4908[0]_i_1_n_0 ),
        .O(select_ln422_4_fu_2781_p3[6]));
  FDRE \select_ln422_4_reg_5078_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_4_fu_2781_p3[0]),
        .Q(\select_ln422_4_reg_5078_reg_n_0_[0] ),
        .R(select_ln422_4_reg_5078));
  FDRE \select_ln422_4_reg_5078_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_4_fu_2781_p3[1]),
        .Q(\select_ln422_4_reg_5078_reg_n_0_[1] ),
        .R(select_ln422_4_reg_5078));
  FDRE \select_ln422_4_reg_5078_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_4_fu_2781_p3[2]),
        .Q(\select_ln422_4_reg_5078_reg_n_0_[2] ),
        .R(select_ln422_4_reg_5078));
  FDRE \select_ln422_4_reg_5078_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_4_fu_2781_p3[3]),
        .Q(\select_ln422_4_reg_5078_reg_n_0_[3] ),
        .R(select_ln422_4_reg_5078));
  FDRE \select_ln422_4_reg_5078_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_4_fu_2781_p3[4]),
        .Q(\select_ln422_4_reg_5078_reg_n_0_[4] ),
        .R(select_ln422_4_reg_5078));
  FDRE \select_ln422_4_reg_5078_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_4_fu_2781_p3[5]),
        .Q(\select_ln422_4_reg_5078_reg_n_0_[5] ),
        .R(select_ln422_4_reg_5078));
  FDRE \select_ln422_4_reg_5078_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_4_fu_2781_p3[6]),
        .Q(\select_ln422_4_reg_5078_reg_n_0_[6] ),
        .R(select_ln422_4_reg_5078));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_52_reg_5198[0]_i_1
       (.I0(\select_ln422_52_reg_5198[6]_i_3_n_0 ),
        .I1(max_bin_count_49_V[3]),
        .I2(max_bin_count_17_V[3]),
        .I3(max_bin_r_17_V[0]),
        .I4(max_bin_r_49_V[0]),
        .I5(\icmp_ln895_49_reg_4988[0]_i_1_n_0 ),
        .O(select_ln422_52_fu_3053_p3[0]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_52_reg_5198[1]_i_1
       (.I0(\select_ln422_52_reg_5198[6]_i_3_n_0 ),
        .I1(max_bin_count_49_V[3]),
        .I2(max_bin_count_17_V[3]),
        .I3(max_bin_r_17_V[1]),
        .I4(max_bin_r_49_V[1]),
        .I5(\icmp_ln895_49_reg_4988[0]_i_1_n_0 ),
        .O(select_ln422_52_fu_3053_p3[1]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_52_reg_5198[2]_i_1
       (.I0(\select_ln422_52_reg_5198[6]_i_3_n_0 ),
        .I1(max_bin_count_49_V[3]),
        .I2(max_bin_count_17_V[3]),
        .I3(max_bin_r_17_V[2]),
        .I4(max_bin_r_49_V[2]),
        .I5(\icmp_ln895_49_reg_4988[0]_i_1_n_0 ),
        .O(select_ln422_52_fu_3053_p3[2]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_52_reg_5198[3]_i_1
       (.I0(\select_ln422_52_reg_5198[6]_i_3_n_0 ),
        .I1(max_bin_count_49_V[3]),
        .I2(max_bin_count_17_V[3]),
        .I3(max_bin_r_17_V[3]),
        .I4(max_bin_r_49_V[3]),
        .I5(\icmp_ln895_49_reg_4988[0]_i_1_n_0 ),
        .O(select_ln422_52_fu_3053_p3[3]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_52_reg_5198[4]_i_1
       (.I0(\select_ln422_52_reg_5198[6]_i_3_n_0 ),
        .I1(max_bin_count_49_V[3]),
        .I2(max_bin_count_17_V[3]),
        .I3(max_bin_r_17_V[4]),
        .I4(max_bin_r_49_V[4]),
        .I5(\icmp_ln895_49_reg_4988[0]_i_1_n_0 ),
        .O(select_ln422_52_fu_3053_p3[4]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_52_reg_5198[5]_i_1
       (.I0(\select_ln422_52_reg_5198[6]_i_3_n_0 ),
        .I1(max_bin_count_49_V[3]),
        .I2(max_bin_count_17_V[3]),
        .I3(max_bin_r_17_V[5]),
        .I4(max_bin_r_49_V[5]),
        .I5(\icmp_ln895_49_reg_4988[0]_i_1_n_0 ),
        .O(select_ln422_52_fu_3053_p3[5]));
  LUT6 #(
    .INIT(64'h0000000000000002))
    \select_ln422_52_reg_5198[6]_i_1
       (.I0(\select_ln422_52_reg_5198[6]_i_3_n_0 ),
        .I1(max_bin_count_49_V[3]),
        .I2(max_bin_count_17_V[3]),
        .I3(max_bin_count_17_V[0]),
        .I4(max_bin_count_17_V[1]),
        .I5(max_bin_count_17_V[2]),
        .O(select_ln422_52_reg_5198));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_52_reg_5198[6]_i_2
       (.I0(\select_ln422_52_reg_5198[6]_i_3_n_0 ),
        .I1(max_bin_count_49_V[3]),
        .I2(max_bin_count_17_V[3]),
        .I3(max_bin_r_17_V[6]),
        .I4(max_bin_r_49_V[6]),
        .I5(\icmp_ln895_49_reg_4988[0]_i_1_n_0 ),
        .O(select_ln422_52_fu_3053_p3[6]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln422_52_reg_5198[6]_i_3
       (.I0(max_bin_count_17_V[0]),
        .I1(max_bin_count_49_V[0]),
        .I2(max_bin_count_49_V[1]),
        .I3(max_bin_count_17_V[1]),
        .I4(max_bin_count_49_V[2]),
        .I5(max_bin_count_17_V[2]),
        .O(\select_ln422_52_reg_5198[6]_i_3_n_0 ));
  FDRE \select_ln422_52_reg_5198_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_52_fu_3053_p3[0]),
        .Q(\select_ln422_52_reg_5198_reg_n_0_[0] ),
        .R(select_ln422_52_reg_5198));
  FDRE \select_ln422_52_reg_5198_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_52_fu_3053_p3[1]),
        .Q(\select_ln422_52_reg_5198_reg_n_0_[1] ),
        .R(select_ln422_52_reg_5198));
  FDRE \select_ln422_52_reg_5198_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_52_fu_3053_p3[2]),
        .Q(\select_ln422_52_reg_5198_reg_n_0_[2] ),
        .R(select_ln422_52_reg_5198));
  FDRE \select_ln422_52_reg_5198_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_52_fu_3053_p3[3]),
        .Q(\select_ln422_52_reg_5198_reg_n_0_[3] ),
        .R(select_ln422_52_reg_5198));
  FDRE \select_ln422_52_reg_5198_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_52_fu_3053_p3[4]),
        .Q(\select_ln422_52_reg_5198_reg_n_0_[4] ),
        .R(select_ln422_52_reg_5198));
  FDRE \select_ln422_52_reg_5198_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_52_fu_3053_p3[5]),
        .Q(\select_ln422_52_reg_5198_reg_n_0_[5] ),
        .R(select_ln422_52_reg_5198));
  FDRE \select_ln422_52_reg_5198_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_52_fu_3053_p3[6]),
        .Q(\select_ln422_52_reg_5198_reg_n_0_[6] ),
        .R(select_ln422_52_reg_5198));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_55_reg_5208[0]_i_1
       (.I0(\select_ln422_55_reg_5208[6]_i_3_n_0 ),
        .I1(max_bin_count_50_V[3]),
        .I2(max_bin_count_18_V[3]),
        .I3(max_bin_r_18_V[0]),
        .I4(max_bin_r_50_V[0]),
        .I5(\icmp_ln895_50_reg_4993[0]_i_1_n_0 ),
        .O(select_ln422_55_fu_3070_p3[0]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_55_reg_5208[1]_i_1
       (.I0(\select_ln422_55_reg_5208[6]_i_3_n_0 ),
        .I1(max_bin_count_50_V[3]),
        .I2(max_bin_count_18_V[3]),
        .I3(max_bin_r_18_V[1]),
        .I4(max_bin_r_50_V[1]),
        .I5(\icmp_ln895_50_reg_4993[0]_i_1_n_0 ),
        .O(select_ln422_55_fu_3070_p3[1]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_55_reg_5208[2]_i_1
       (.I0(\select_ln422_55_reg_5208[6]_i_3_n_0 ),
        .I1(max_bin_count_50_V[3]),
        .I2(max_bin_count_18_V[3]),
        .I3(max_bin_r_18_V[2]),
        .I4(max_bin_r_50_V[2]),
        .I5(\icmp_ln895_50_reg_4993[0]_i_1_n_0 ),
        .O(select_ln422_55_fu_3070_p3[2]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_55_reg_5208[3]_i_1
       (.I0(\select_ln422_55_reg_5208[6]_i_3_n_0 ),
        .I1(max_bin_count_50_V[3]),
        .I2(max_bin_count_18_V[3]),
        .I3(max_bin_r_18_V[3]),
        .I4(max_bin_r_50_V[3]),
        .I5(\icmp_ln895_50_reg_4993[0]_i_1_n_0 ),
        .O(select_ln422_55_fu_3070_p3[3]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_55_reg_5208[4]_i_1
       (.I0(\select_ln422_55_reg_5208[6]_i_3_n_0 ),
        .I1(max_bin_count_50_V[3]),
        .I2(max_bin_count_18_V[3]),
        .I3(max_bin_r_18_V[4]),
        .I4(max_bin_r_50_V[4]),
        .I5(\icmp_ln895_50_reg_4993[0]_i_1_n_0 ),
        .O(select_ln422_55_fu_3070_p3[4]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_55_reg_5208[5]_i_1
       (.I0(\select_ln422_55_reg_5208[6]_i_3_n_0 ),
        .I1(max_bin_count_50_V[3]),
        .I2(max_bin_count_18_V[3]),
        .I3(max_bin_r_18_V[5]),
        .I4(max_bin_r_50_V[5]),
        .I5(\icmp_ln895_50_reg_4993[0]_i_1_n_0 ),
        .O(select_ln422_55_fu_3070_p3[5]));
  LUT6 #(
    .INIT(64'h0000000000000002))
    \select_ln422_55_reg_5208[6]_i_1
       (.I0(\select_ln422_55_reg_5208[6]_i_3_n_0 ),
        .I1(max_bin_count_50_V[3]),
        .I2(max_bin_count_18_V[3]),
        .I3(max_bin_count_18_V[0]),
        .I4(max_bin_count_18_V[1]),
        .I5(max_bin_count_18_V[2]),
        .O(select_ln422_55_reg_5208));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_55_reg_5208[6]_i_2
       (.I0(\select_ln422_55_reg_5208[6]_i_3_n_0 ),
        .I1(max_bin_count_50_V[3]),
        .I2(max_bin_count_18_V[3]),
        .I3(max_bin_r_18_V[6]),
        .I4(max_bin_r_50_V[6]),
        .I5(\icmp_ln895_50_reg_4993[0]_i_1_n_0 ),
        .O(select_ln422_55_fu_3070_p3[6]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln422_55_reg_5208[6]_i_3
       (.I0(max_bin_count_18_V[0]),
        .I1(max_bin_count_50_V[0]),
        .I2(max_bin_count_50_V[1]),
        .I3(max_bin_count_18_V[1]),
        .I4(max_bin_count_50_V[2]),
        .I5(max_bin_count_18_V[2]),
        .O(\select_ln422_55_reg_5208[6]_i_3_n_0 ));
  FDRE \select_ln422_55_reg_5208_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_55_fu_3070_p3[0]),
        .Q(\select_ln422_55_reg_5208_reg_n_0_[0] ),
        .R(select_ln422_55_reg_5208));
  FDRE \select_ln422_55_reg_5208_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_55_fu_3070_p3[1]),
        .Q(\select_ln422_55_reg_5208_reg_n_0_[1] ),
        .R(select_ln422_55_reg_5208));
  FDRE \select_ln422_55_reg_5208_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_55_fu_3070_p3[2]),
        .Q(\select_ln422_55_reg_5208_reg_n_0_[2] ),
        .R(select_ln422_55_reg_5208));
  FDRE \select_ln422_55_reg_5208_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_55_fu_3070_p3[3]),
        .Q(\select_ln422_55_reg_5208_reg_n_0_[3] ),
        .R(select_ln422_55_reg_5208));
  FDRE \select_ln422_55_reg_5208_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_55_fu_3070_p3[4]),
        .Q(\select_ln422_55_reg_5208_reg_n_0_[4] ),
        .R(select_ln422_55_reg_5208));
  FDRE \select_ln422_55_reg_5208_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_55_fu_3070_p3[5]),
        .Q(\select_ln422_55_reg_5208_reg_n_0_[5] ),
        .R(select_ln422_55_reg_5208));
  FDRE \select_ln422_55_reg_5208_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_55_fu_3070_p3[6]),
        .Q(\select_ln422_55_reg_5208_reg_n_0_[6] ),
        .R(select_ln422_55_reg_5208));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_58_reg_5218[0]_i_1
       (.I0(\select_ln422_58_reg_5218[6]_i_3_n_0 ),
        .I1(max_bin_count_51_V[3]),
        .I2(max_bin_count_19_V[3]),
        .I3(max_bin_r_19_V[0]),
        .I4(max_bin_r_51_V[0]),
        .I5(\icmp_ln895_51_reg_4998[0]_i_1_n_0 ),
        .O(select_ln422_58_fu_3087_p3[0]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_58_reg_5218[1]_i_1
       (.I0(\select_ln422_58_reg_5218[6]_i_3_n_0 ),
        .I1(max_bin_count_51_V[3]),
        .I2(max_bin_count_19_V[3]),
        .I3(max_bin_r_19_V[1]),
        .I4(max_bin_r_51_V[1]),
        .I5(\icmp_ln895_51_reg_4998[0]_i_1_n_0 ),
        .O(select_ln422_58_fu_3087_p3[1]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_58_reg_5218[2]_i_1
       (.I0(\select_ln422_58_reg_5218[6]_i_3_n_0 ),
        .I1(max_bin_count_51_V[3]),
        .I2(max_bin_count_19_V[3]),
        .I3(max_bin_r_19_V[2]),
        .I4(max_bin_r_51_V[2]),
        .I5(\icmp_ln895_51_reg_4998[0]_i_1_n_0 ),
        .O(select_ln422_58_fu_3087_p3[2]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_58_reg_5218[3]_i_1
       (.I0(\select_ln422_58_reg_5218[6]_i_3_n_0 ),
        .I1(max_bin_count_51_V[3]),
        .I2(max_bin_count_19_V[3]),
        .I3(max_bin_r_19_V[3]),
        .I4(max_bin_r_51_V[3]),
        .I5(\icmp_ln895_51_reg_4998[0]_i_1_n_0 ),
        .O(select_ln422_58_fu_3087_p3[3]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_58_reg_5218[4]_i_1
       (.I0(\select_ln422_58_reg_5218[6]_i_3_n_0 ),
        .I1(max_bin_count_51_V[3]),
        .I2(max_bin_count_19_V[3]),
        .I3(max_bin_r_19_V[4]),
        .I4(max_bin_r_51_V[4]),
        .I5(\icmp_ln895_51_reg_4998[0]_i_1_n_0 ),
        .O(select_ln422_58_fu_3087_p3[4]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_58_reg_5218[5]_i_1
       (.I0(\select_ln422_58_reg_5218[6]_i_3_n_0 ),
        .I1(max_bin_count_51_V[3]),
        .I2(max_bin_count_19_V[3]),
        .I3(max_bin_r_19_V[5]),
        .I4(max_bin_r_51_V[5]),
        .I5(\icmp_ln895_51_reg_4998[0]_i_1_n_0 ),
        .O(select_ln422_58_fu_3087_p3[5]));
  LUT6 #(
    .INIT(64'h0000000000000002))
    \select_ln422_58_reg_5218[6]_i_1
       (.I0(\select_ln422_58_reg_5218[6]_i_3_n_0 ),
        .I1(max_bin_count_51_V[3]),
        .I2(max_bin_count_19_V[3]),
        .I3(max_bin_count_19_V[0]),
        .I4(max_bin_count_19_V[1]),
        .I5(max_bin_count_19_V[2]),
        .O(select_ln422_58_reg_5218));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_58_reg_5218[6]_i_2
       (.I0(\select_ln422_58_reg_5218[6]_i_3_n_0 ),
        .I1(max_bin_count_51_V[3]),
        .I2(max_bin_count_19_V[3]),
        .I3(max_bin_r_19_V[6]),
        .I4(max_bin_r_51_V[6]),
        .I5(\icmp_ln895_51_reg_4998[0]_i_1_n_0 ),
        .O(select_ln422_58_fu_3087_p3[6]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln422_58_reg_5218[6]_i_3
       (.I0(max_bin_count_19_V[0]),
        .I1(max_bin_count_51_V[0]),
        .I2(max_bin_count_51_V[1]),
        .I3(max_bin_count_19_V[1]),
        .I4(max_bin_count_51_V[2]),
        .I5(max_bin_count_19_V[2]),
        .O(\select_ln422_58_reg_5218[6]_i_3_n_0 ));
  FDRE \select_ln422_58_reg_5218_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_58_fu_3087_p3[0]),
        .Q(\select_ln422_58_reg_5218_reg_n_0_[0] ),
        .R(select_ln422_58_reg_5218));
  FDRE \select_ln422_58_reg_5218_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_58_fu_3087_p3[1]),
        .Q(\select_ln422_58_reg_5218_reg_n_0_[1] ),
        .R(select_ln422_58_reg_5218));
  FDRE \select_ln422_58_reg_5218_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_58_fu_3087_p3[2]),
        .Q(\select_ln422_58_reg_5218_reg_n_0_[2] ),
        .R(select_ln422_58_reg_5218));
  FDRE \select_ln422_58_reg_5218_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_58_fu_3087_p3[3]),
        .Q(\select_ln422_58_reg_5218_reg_n_0_[3] ),
        .R(select_ln422_58_reg_5218));
  FDRE \select_ln422_58_reg_5218_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_58_fu_3087_p3[4]),
        .Q(\select_ln422_58_reg_5218_reg_n_0_[4] ),
        .R(select_ln422_58_reg_5218));
  FDRE \select_ln422_58_reg_5218_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_58_fu_3087_p3[5]),
        .Q(\select_ln422_58_reg_5218_reg_n_0_[5] ),
        .R(select_ln422_58_reg_5218));
  FDRE \select_ln422_58_reg_5218_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_58_fu_3087_p3[6]),
        .Q(\select_ln422_58_reg_5218_reg_n_0_[6] ),
        .R(select_ln422_58_reg_5218));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_61_reg_5228[0]_i_1
       (.I0(\select_ln422_61_reg_5228[6]_i_3_n_0 ),
        .I1(max_bin_count_52_V[3]),
        .I2(max_bin_count_20_V[3]),
        .I3(max_bin_r_20_V[0]),
        .I4(max_bin_r_52_V[0]),
        .I5(\icmp_ln895_52_reg_5003[0]_i_1_n_0 ),
        .O(select_ln422_61_fu_3104_p3[0]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_61_reg_5228[1]_i_1
       (.I0(\select_ln422_61_reg_5228[6]_i_3_n_0 ),
        .I1(max_bin_count_52_V[3]),
        .I2(max_bin_count_20_V[3]),
        .I3(max_bin_r_20_V[1]),
        .I4(max_bin_r_52_V[1]),
        .I5(\icmp_ln895_52_reg_5003[0]_i_1_n_0 ),
        .O(select_ln422_61_fu_3104_p3[1]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_61_reg_5228[2]_i_1
       (.I0(\select_ln422_61_reg_5228[6]_i_3_n_0 ),
        .I1(max_bin_count_52_V[3]),
        .I2(max_bin_count_20_V[3]),
        .I3(max_bin_r_20_V[2]),
        .I4(max_bin_r_52_V[2]),
        .I5(\icmp_ln895_52_reg_5003[0]_i_1_n_0 ),
        .O(select_ln422_61_fu_3104_p3[2]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_61_reg_5228[3]_i_1
       (.I0(\select_ln422_61_reg_5228[6]_i_3_n_0 ),
        .I1(max_bin_count_52_V[3]),
        .I2(max_bin_count_20_V[3]),
        .I3(max_bin_r_20_V[3]),
        .I4(max_bin_r_52_V[3]),
        .I5(\icmp_ln895_52_reg_5003[0]_i_1_n_0 ),
        .O(select_ln422_61_fu_3104_p3[3]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_61_reg_5228[4]_i_1
       (.I0(\select_ln422_61_reg_5228[6]_i_3_n_0 ),
        .I1(max_bin_count_52_V[3]),
        .I2(max_bin_count_20_V[3]),
        .I3(max_bin_r_20_V[4]),
        .I4(max_bin_r_52_V[4]),
        .I5(\icmp_ln895_52_reg_5003[0]_i_1_n_0 ),
        .O(select_ln422_61_fu_3104_p3[4]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_61_reg_5228[5]_i_1
       (.I0(\select_ln422_61_reg_5228[6]_i_3_n_0 ),
        .I1(max_bin_count_52_V[3]),
        .I2(max_bin_count_20_V[3]),
        .I3(max_bin_r_20_V[5]),
        .I4(max_bin_r_52_V[5]),
        .I5(\icmp_ln895_52_reg_5003[0]_i_1_n_0 ),
        .O(select_ln422_61_fu_3104_p3[5]));
  LUT6 #(
    .INIT(64'h0000000000000002))
    \select_ln422_61_reg_5228[6]_i_1
       (.I0(\select_ln422_61_reg_5228[6]_i_3_n_0 ),
        .I1(max_bin_count_52_V[3]),
        .I2(max_bin_count_20_V[3]),
        .I3(max_bin_count_20_V[0]),
        .I4(max_bin_count_20_V[1]),
        .I5(max_bin_count_20_V[2]),
        .O(select_ln422_61_reg_5228));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_61_reg_5228[6]_i_2
       (.I0(\select_ln422_61_reg_5228[6]_i_3_n_0 ),
        .I1(max_bin_count_52_V[3]),
        .I2(max_bin_count_20_V[3]),
        .I3(max_bin_r_20_V[6]),
        .I4(max_bin_r_52_V[6]),
        .I5(\icmp_ln895_52_reg_5003[0]_i_1_n_0 ),
        .O(select_ln422_61_fu_3104_p3[6]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln422_61_reg_5228[6]_i_3
       (.I0(max_bin_count_20_V[0]),
        .I1(max_bin_count_52_V[0]),
        .I2(max_bin_count_52_V[1]),
        .I3(max_bin_count_20_V[1]),
        .I4(max_bin_count_52_V[2]),
        .I5(max_bin_count_20_V[2]),
        .O(\select_ln422_61_reg_5228[6]_i_3_n_0 ));
  FDRE \select_ln422_61_reg_5228_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_61_fu_3104_p3[0]),
        .Q(\select_ln422_61_reg_5228_reg_n_0_[0] ),
        .R(select_ln422_61_reg_5228));
  FDRE \select_ln422_61_reg_5228_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_61_fu_3104_p3[1]),
        .Q(\select_ln422_61_reg_5228_reg_n_0_[1] ),
        .R(select_ln422_61_reg_5228));
  FDRE \select_ln422_61_reg_5228_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_61_fu_3104_p3[2]),
        .Q(\select_ln422_61_reg_5228_reg_n_0_[2] ),
        .R(select_ln422_61_reg_5228));
  FDRE \select_ln422_61_reg_5228_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_61_fu_3104_p3[3]),
        .Q(\select_ln422_61_reg_5228_reg_n_0_[3] ),
        .R(select_ln422_61_reg_5228));
  FDRE \select_ln422_61_reg_5228_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_61_fu_3104_p3[4]),
        .Q(\select_ln422_61_reg_5228_reg_n_0_[4] ),
        .R(select_ln422_61_reg_5228));
  FDRE \select_ln422_61_reg_5228_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_61_fu_3104_p3[5]),
        .Q(\select_ln422_61_reg_5228_reg_n_0_[5] ),
        .R(select_ln422_61_reg_5228));
  FDRE \select_ln422_61_reg_5228_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_61_fu_3104_p3[6]),
        .Q(\select_ln422_61_reg_5228_reg_n_0_[6] ),
        .R(select_ln422_61_reg_5228));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_64_reg_5238[0]_i_1
       (.I0(\select_ln422_64_reg_5238[6]_i_3_n_0 ),
        .I1(max_bin_count_53_V[3]),
        .I2(max_bin_count_21_V[3]),
        .I3(max_bin_r_21_V[0]),
        .I4(max_bin_r_53_V[0]),
        .I5(\icmp_ln895_53_reg_5008[0]_i_1_n_0 ),
        .O(select_ln422_64_fu_3121_p3[0]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_64_reg_5238[1]_i_1
       (.I0(\select_ln422_64_reg_5238[6]_i_3_n_0 ),
        .I1(max_bin_count_53_V[3]),
        .I2(max_bin_count_21_V[3]),
        .I3(max_bin_r_21_V[1]),
        .I4(max_bin_r_53_V[1]),
        .I5(\icmp_ln895_53_reg_5008[0]_i_1_n_0 ),
        .O(select_ln422_64_fu_3121_p3[1]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_64_reg_5238[2]_i_1
       (.I0(\select_ln422_64_reg_5238[6]_i_3_n_0 ),
        .I1(max_bin_count_53_V[3]),
        .I2(max_bin_count_21_V[3]),
        .I3(max_bin_r_21_V[2]),
        .I4(max_bin_r_53_V[2]),
        .I5(\icmp_ln895_53_reg_5008[0]_i_1_n_0 ),
        .O(select_ln422_64_fu_3121_p3[2]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_64_reg_5238[3]_i_1
       (.I0(\select_ln422_64_reg_5238[6]_i_3_n_0 ),
        .I1(max_bin_count_53_V[3]),
        .I2(max_bin_count_21_V[3]),
        .I3(max_bin_r_21_V[3]),
        .I4(max_bin_r_53_V[3]),
        .I5(\icmp_ln895_53_reg_5008[0]_i_1_n_0 ),
        .O(select_ln422_64_fu_3121_p3[3]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_64_reg_5238[4]_i_1
       (.I0(\select_ln422_64_reg_5238[6]_i_3_n_0 ),
        .I1(max_bin_count_53_V[3]),
        .I2(max_bin_count_21_V[3]),
        .I3(max_bin_r_21_V[4]),
        .I4(max_bin_r_53_V[4]),
        .I5(\icmp_ln895_53_reg_5008[0]_i_1_n_0 ),
        .O(select_ln422_64_fu_3121_p3[4]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_64_reg_5238[5]_i_1
       (.I0(\select_ln422_64_reg_5238[6]_i_3_n_0 ),
        .I1(max_bin_count_53_V[3]),
        .I2(max_bin_count_21_V[3]),
        .I3(max_bin_r_21_V[5]),
        .I4(max_bin_r_53_V[5]),
        .I5(\icmp_ln895_53_reg_5008[0]_i_1_n_0 ),
        .O(select_ln422_64_fu_3121_p3[5]));
  LUT6 #(
    .INIT(64'h0000000000000002))
    \select_ln422_64_reg_5238[6]_i_1
       (.I0(\select_ln422_64_reg_5238[6]_i_3_n_0 ),
        .I1(max_bin_count_53_V[3]),
        .I2(max_bin_count_21_V[3]),
        .I3(max_bin_count_21_V[0]),
        .I4(max_bin_count_21_V[1]),
        .I5(max_bin_count_21_V[2]),
        .O(select_ln422_64_reg_5238));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_64_reg_5238[6]_i_2
       (.I0(\select_ln422_64_reg_5238[6]_i_3_n_0 ),
        .I1(max_bin_count_53_V[3]),
        .I2(max_bin_count_21_V[3]),
        .I3(max_bin_r_21_V[6]),
        .I4(max_bin_r_53_V[6]),
        .I5(\icmp_ln895_53_reg_5008[0]_i_1_n_0 ),
        .O(select_ln422_64_fu_3121_p3[6]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln422_64_reg_5238[6]_i_3
       (.I0(max_bin_count_21_V[0]),
        .I1(max_bin_count_53_V[0]),
        .I2(max_bin_count_53_V[1]),
        .I3(max_bin_count_21_V[1]),
        .I4(max_bin_count_53_V[2]),
        .I5(max_bin_count_21_V[2]),
        .O(\select_ln422_64_reg_5238[6]_i_3_n_0 ));
  FDRE \select_ln422_64_reg_5238_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_64_fu_3121_p3[0]),
        .Q(\select_ln422_64_reg_5238_reg_n_0_[0] ),
        .R(select_ln422_64_reg_5238));
  FDRE \select_ln422_64_reg_5238_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_64_fu_3121_p3[1]),
        .Q(\select_ln422_64_reg_5238_reg_n_0_[1] ),
        .R(select_ln422_64_reg_5238));
  FDRE \select_ln422_64_reg_5238_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_64_fu_3121_p3[2]),
        .Q(\select_ln422_64_reg_5238_reg_n_0_[2] ),
        .R(select_ln422_64_reg_5238));
  FDRE \select_ln422_64_reg_5238_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_64_fu_3121_p3[3]),
        .Q(\select_ln422_64_reg_5238_reg_n_0_[3] ),
        .R(select_ln422_64_reg_5238));
  FDRE \select_ln422_64_reg_5238_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_64_fu_3121_p3[4]),
        .Q(\select_ln422_64_reg_5238_reg_n_0_[4] ),
        .R(select_ln422_64_reg_5238));
  FDRE \select_ln422_64_reg_5238_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_64_fu_3121_p3[5]),
        .Q(\select_ln422_64_reg_5238_reg_n_0_[5] ),
        .R(select_ln422_64_reg_5238));
  FDRE \select_ln422_64_reg_5238_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_64_fu_3121_p3[6]),
        .Q(\select_ln422_64_reg_5238_reg_n_0_[6] ),
        .R(select_ln422_64_reg_5238));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_67_reg_5248[0]_i_1
       (.I0(\select_ln422_67_reg_5248[6]_i_3_n_0 ),
        .I1(max_bin_count_54_V[3]),
        .I2(max_bin_count_22_V[3]),
        .I3(max_bin_r_22_V[0]),
        .I4(max_bin_r_54_V[0]),
        .I5(\icmp_ln895_54_reg_5013[0]_i_1_n_0 ),
        .O(select_ln422_67_fu_3138_p3[0]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_67_reg_5248[1]_i_1
       (.I0(\select_ln422_67_reg_5248[6]_i_3_n_0 ),
        .I1(max_bin_count_54_V[3]),
        .I2(max_bin_count_22_V[3]),
        .I3(max_bin_r_22_V[1]),
        .I4(max_bin_r_54_V[1]),
        .I5(\icmp_ln895_54_reg_5013[0]_i_1_n_0 ),
        .O(select_ln422_67_fu_3138_p3[1]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_67_reg_5248[2]_i_1
       (.I0(\select_ln422_67_reg_5248[6]_i_3_n_0 ),
        .I1(max_bin_count_54_V[3]),
        .I2(max_bin_count_22_V[3]),
        .I3(max_bin_r_22_V[2]),
        .I4(max_bin_r_54_V[2]),
        .I5(\icmp_ln895_54_reg_5013[0]_i_1_n_0 ),
        .O(select_ln422_67_fu_3138_p3[2]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_67_reg_5248[3]_i_1
       (.I0(\select_ln422_67_reg_5248[6]_i_3_n_0 ),
        .I1(max_bin_count_54_V[3]),
        .I2(max_bin_count_22_V[3]),
        .I3(max_bin_r_22_V[3]),
        .I4(max_bin_r_54_V[3]),
        .I5(\icmp_ln895_54_reg_5013[0]_i_1_n_0 ),
        .O(select_ln422_67_fu_3138_p3[3]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_67_reg_5248[4]_i_1
       (.I0(\select_ln422_67_reg_5248[6]_i_3_n_0 ),
        .I1(max_bin_count_54_V[3]),
        .I2(max_bin_count_22_V[3]),
        .I3(max_bin_r_22_V[4]),
        .I4(max_bin_r_54_V[4]),
        .I5(\icmp_ln895_54_reg_5013[0]_i_1_n_0 ),
        .O(select_ln422_67_fu_3138_p3[4]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_67_reg_5248[5]_i_1
       (.I0(\select_ln422_67_reg_5248[6]_i_3_n_0 ),
        .I1(max_bin_count_54_V[3]),
        .I2(max_bin_count_22_V[3]),
        .I3(max_bin_r_22_V[5]),
        .I4(max_bin_r_54_V[5]),
        .I5(\icmp_ln895_54_reg_5013[0]_i_1_n_0 ),
        .O(select_ln422_67_fu_3138_p3[5]));
  LUT6 #(
    .INIT(64'h0000000000000002))
    \select_ln422_67_reg_5248[6]_i_1
       (.I0(\select_ln422_67_reg_5248[6]_i_3_n_0 ),
        .I1(max_bin_count_54_V[3]),
        .I2(max_bin_count_22_V[3]),
        .I3(max_bin_count_22_V[0]),
        .I4(max_bin_count_22_V[1]),
        .I5(max_bin_count_22_V[2]),
        .O(select_ln422_67_reg_5248));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_67_reg_5248[6]_i_2
       (.I0(\select_ln422_67_reg_5248[6]_i_3_n_0 ),
        .I1(max_bin_count_54_V[3]),
        .I2(max_bin_count_22_V[3]),
        .I3(max_bin_r_22_V[6]),
        .I4(max_bin_r_54_V[6]),
        .I5(\icmp_ln895_54_reg_5013[0]_i_1_n_0 ),
        .O(select_ln422_67_fu_3138_p3[6]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln422_67_reg_5248[6]_i_3
       (.I0(max_bin_count_22_V[0]),
        .I1(max_bin_count_54_V[0]),
        .I2(max_bin_count_54_V[1]),
        .I3(max_bin_count_22_V[1]),
        .I4(max_bin_count_54_V[2]),
        .I5(max_bin_count_22_V[2]),
        .O(\select_ln422_67_reg_5248[6]_i_3_n_0 ));
  FDRE \select_ln422_67_reg_5248_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_67_fu_3138_p3[0]),
        .Q(\select_ln422_67_reg_5248_reg_n_0_[0] ),
        .R(select_ln422_67_reg_5248));
  FDRE \select_ln422_67_reg_5248_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_67_fu_3138_p3[1]),
        .Q(\select_ln422_67_reg_5248_reg_n_0_[1] ),
        .R(select_ln422_67_reg_5248));
  FDRE \select_ln422_67_reg_5248_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_67_fu_3138_p3[2]),
        .Q(\select_ln422_67_reg_5248_reg_n_0_[2] ),
        .R(select_ln422_67_reg_5248));
  FDRE \select_ln422_67_reg_5248_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_67_fu_3138_p3[3]),
        .Q(\select_ln422_67_reg_5248_reg_n_0_[3] ),
        .R(select_ln422_67_reg_5248));
  FDRE \select_ln422_67_reg_5248_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_67_fu_3138_p3[4]),
        .Q(\select_ln422_67_reg_5248_reg_n_0_[4] ),
        .R(select_ln422_67_reg_5248));
  FDRE \select_ln422_67_reg_5248_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_67_fu_3138_p3[5]),
        .Q(\select_ln422_67_reg_5248_reg_n_0_[5] ),
        .R(select_ln422_67_reg_5248));
  FDRE \select_ln422_67_reg_5248_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_67_fu_3138_p3[6]),
        .Q(\select_ln422_67_reg_5248_reg_n_0_[6] ),
        .R(select_ln422_67_reg_5248));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_70_reg_5258[0]_i_1
       (.I0(\select_ln422_70_reg_5258[6]_i_3_n_0 ),
        .I1(max_bin_count_55_V[3]),
        .I2(max_bin_count_23_V[3]),
        .I3(max_bin_r_23_V[0]),
        .I4(max_bin_r_55_V[0]),
        .I5(\icmp_ln895_55_reg_5018[0]_i_1_n_0 ),
        .O(select_ln422_70_fu_3155_p3[0]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_70_reg_5258[1]_i_1
       (.I0(\select_ln422_70_reg_5258[6]_i_3_n_0 ),
        .I1(max_bin_count_55_V[3]),
        .I2(max_bin_count_23_V[3]),
        .I3(max_bin_r_23_V[1]),
        .I4(max_bin_r_55_V[1]),
        .I5(\icmp_ln895_55_reg_5018[0]_i_1_n_0 ),
        .O(select_ln422_70_fu_3155_p3[1]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_70_reg_5258[2]_i_1
       (.I0(\select_ln422_70_reg_5258[6]_i_3_n_0 ),
        .I1(max_bin_count_55_V[3]),
        .I2(max_bin_count_23_V[3]),
        .I3(max_bin_r_23_V[2]),
        .I4(max_bin_r_55_V[2]),
        .I5(\icmp_ln895_55_reg_5018[0]_i_1_n_0 ),
        .O(select_ln422_70_fu_3155_p3[2]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_70_reg_5258[3]_i_1
       (.I0(\select_ln422_70_reg_5258[6]_i_3_n_0 ),
        .I1(max_bin_count_55_V[3]),
        .I2(max_bin_count_23_V[3]),
        .I3(max_bin_r_23_V[3]),
        .I4(max_bin_r_55_V[3]),
        .I5(\icmp_ln895_55_reg_5018[0]_i_1_n_0 ),
        .O(select_ln422_70_fu_3155_p3[3]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_70_reg_5258[4]_i_1
       (.I0(\select_ln422_70_reg_5258[6]_i_3_n_0 ),
        .I1(max_bin_count_55_V[3]),
        .I2(max_bin_count_23_V[3]),
        .I3(max_bin_r_23_V[4]),
        .I4(max_bin_r_55_V[4]),
        .I5(\icmp_ln895_55_reg_5018[0]_i_1_n_0 ),
        .O(select_ln422_70_fu_3155_p3[4]));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_70_reg_5258[5]_i_1
       (.I0(\select_ln422_70_reg_5258[6]_i_3_n_0 ),
        .I1(max_bin_count_55_V[3]),
        .I2(max_bin_count_23_V[3]),
        .I3(max_bin_r_23_V[5]),
        .I4(max_bin_r_55_V[5]),
        .I5(\icmp_ln895_55_reg_5018[0]_i_1_n_0 ),
        .O(select_ln422_70_fu_3155_p3[5]));
  LUT6 #(
    .INIT(64'h0000000000000002))
    \select_ln422_70_reg_5258[6]_i_1
       (.I0(\select_ln422_70_reg_5258[6]_i_3_n_0 ),
        .I1(max_bin_count_55_V[3]),
        .I2(max_bin_count_23_V[3]),
        .I3(max_bin_count_23_V[0]),
        .I4(max_bin_count_23_V[1]),
        .I5(max_bin_count_23_V[2]),
        .O(select_ln422_70_reg_5258));
  LUT6 #(
    .INIT(64'hB200B200FF4DB200))
    \select_ln422_70_reg_5258[6]_i_2
       (.I0(\select_ln422_70_reg_5258[6]_i_3_n_0 ),
        .I1(max_bin_count_55_V[3]),
        .I2(max_bin_count_23_V[3]),
        .I3(max_bin_r_23_V[6]),
        .I4(max_bin_r_55_V[6]),
        .I5(\icmp_ln895_55_reg_5018[0]_i_1_n_0 ),
        .O(select_ln422_70_fu_3155_p3[6]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln422_70_reg_5258[6]_i_3
       (.I0(max_bin_count_23_V[0]),
        .I1(max_bin_count_55_V[0]),
        .I2(max_bin_count_55_V[1]),
        .I3(max_bin_count_23_V[1]),
        .I4(max_bin_count_55_V[2]),
        .I5(max_bin_count_23_V[2]),
        .O(\select_ln422_70_reg_5258[6]_i_3_n_0 ));
  FDRE \select_ln422_70_reg_5258_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_70_fu_3155_p3[0]),
        .Q(\select_ln422_70_reg_5258_reg_n_0_[0] ),
        .R(select_ln422_70_reg_5258));
  FDRE \select_ln422_70_reg_5258_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_70_fu_3155_p3[1]),
        .Q(\select_ln422_70_reg_5258_reg_n_0_[1] ),
        .R(select_ln422_70_reg_5258));
  FDRE \select_ln422_70_reg_5258_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_70_fu_3155_p3[2]),
        .Q(\select_ln422_70_reg_5258_reg_n_0_[2] ),
        .R(select_ln422_70_reg_5258));
  FDRE \select_ln422_70_reg_5258_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_70_fu_3155_p3[3]),
        .Q(\select_ln422_70_reg_5258_reg_n_0_[3] ),
        .R(select_ln422_70_reg_5258));
  FDRE \select_ln422_70_reg_5258_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_70_fu_3155_p3[4]),
        .Q(\select_ln422_70_reg_5258_reg_n_0_[4] ),
        .R(select_ln422_70_reg_5258));
  FDRE \select_ln422_70_reg_5258_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_70_fu_3155_p3[5]),
        .Q(\select_ln422_70_reg_5258_reg_n_0_[5] ),
        .R(select_ln422_70_reg_5258));
  FDRE \select_ln422_70_reg_5258_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_70_fu_3155_p3[6]),
        .Q(\select_ln422_70_reg_5258_reg_n_0_[6] ),
        .R(select_ln422_70_reg_5258));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_7_reg_5088[0]_i_1
       (.I0(max_bin_r_2_V[0]),
        .I1(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ),
        .I2(max_bin_r_34_V[0]),
        .I3(\icmp_ln895_34_reg_4913[0]_i_1_n_0 ),
        .O(select_ln422_7_fu_2798_p3[0]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_7_reg_5088[1]_i_1
       (.I0(max_bin_r_2_V[1]),
        .I1(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ),
        .I2(max_bin_r_34_V[1]),
        .I3(\icmp_ln895_34_reg_4913[0]_i_1_n_0 ),
        .O(select_ln422_7_fu_2798_p3[1]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_7_reg_5088[2]_i_1
       (.I0(max_bin_r_2_V[2]),
        .I1(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ),
        .I2(max_bin_r_34_V[2]),
        .I3(\icmp_ln895_34_reg_4913[0]_i_1_n_0 ),
        .O(select_ln422_7_fu_2798_p3[2]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_7_reg_5088[3]_i_1
       (.I0(max_bin_r_2_V[3]),
        .I1(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ),
        .I2(max_bin_r_34_V[3]),
        .I3(\icmp_ln895_34_reg_4913[0]_i_1_n_0 ),
        .O(select_ln422_7_fu_2798_p3[3]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_7_reg_5088[4]_i_1
       (.I0(max_bin_r_2_V[4]),
        .I1(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ),
        .I2(max_bin_r_34_V[4]),
        .I3(\icmp_ln895_34_reg_4913[0]_i_1_n_0 ),
        .O(select_ln422_7_fu_2798_p3[4]));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_7_reg_5088[5]_i_1
       (.I0(max_bin_r_2_V[5]),
        .I1(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ),
        .I2(max_bin_r_34_V[5]),
        .I3(\icmp_ln895_34_reg_4913[0]_i_1_n_0 ),
        .O(select_ln422_7_fu_2798_p3[5]));
  LUT5 #(
    .INIT(32'h00000002))
    \select_ln422_7_reg_5088[6]_i_1
       (.I0(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ),
        .I1(max_bin_count_2_V[0]),
        .I2(max_bin_count_2_V[1]),
        .I3(max_bin_count_2_V[3]),
        .I4(max_bin_count_2_V[2]),
        .O(select_ln422_7_reg_5088));
  LUT4 #(
    .INIT(16'h88B8))
    \select_ln422_7_reg_5088[6]_i_2
       (.I0(max_bin_r_2_V[6]),
        .I1(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ),
        .I2(max_bin_r_34_V[6]),
        .I3(\icmp_ln895_34_reg_4913[0]_i_1_n_0 ),
        .O(select_ln422_7_fu_2798_p3[6]));
  FDRE \select_ln422_7_reg_5088_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_7_fu_2798_p3[0]),
        .Q(\select_ln422_7_reg_5088_reg_n_0_[0] ),
        .R(select_ln422_7_reg_5088));
  FDRE \select_ln422_7_reg_5088_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_7_fu_2798_p3[1]),
        .Q(\select_ln422_7_reg_5088_reg_n_0_[1] ),
        .R(select_ln422_7_reg_5088));
  FDRE \select_ln422_7_reg_5088_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_7_fu_2798_p3[2]),
        .Q(\select_ln422_7_reg_5088_reg_n_0_[2] ),
        .R(select_ln422_7_reg_5088));
  FDRE \select_ln422_7_reg_5088_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_7_fu_2798_p3[3]),
        .Q(\select_ln422_7_reg_5088_reg_n_0_[3] ),
        .R(select_ln422_7_reg_5088));
  FDRE \select_ln422_7_reg_5088_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_7_fu_2798_p3[4]),
        .Q(\select_ln422_7_reg_5088_reg_n_0_[4] ),
        .R(select_ln422_7_reg_5088));
  FDRE \select_ln422_7_reg_5088_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_7_fu_2798_p3[5]),
        .Q(\select_ln422_7_reg_5088_reg_n_0_[5] ),
        .R(select_ln422_7_reg_5088));
  FDRE \select_ln422_7_reg_5088_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln422_7_fu_2798_p3[6]),
        .Q(\select_ln422_7_reg_5088_reg_n_0_[6] ),
        .R(select_ln422_7_reg_5088));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_11_reg_5342[0]_i_1
       (.I0(max_bin_count_51_V[3]),
        .I1(max_bin_count_19_V[3]),
        .I2(select_ln422_11_fu_2823_p3[0]),
        .I3(select_ln422_59_fu_3095_p3[0]),
        .I4(\select_ln440_11_reg_5342[1]_i_4_n_0 ),
        .I5(select_ln422_11_fu_2823_p3[3]),
        .O(select_ln440_11_fu_3335_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_11_reg_5342[0]_i_2
       (.I0(max_bin_count_3_V[0]),
        .I1(max_bin_count_35_V[0]),
        .I2(\icmp_ln895_68_reg_5093[0]_i_2_n_0 ),
        .I3(max_bin_count_35_V[3]),
        .I4(max_bin_count_3_V[3]),
        .O(select_ln422_11_fu_2823_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_11_reg_5342[0]_i_3
       (.I0(max_bin_count_19_V[0]),
        .I1(max_bin_count_51_V[0]),
        .I2(\select_ln422_58_reg_5218[6]_i_3_n_0 ),
        .I3(max_bin_count_51_V[3]),
        .I4(max_bin_count_19_V[3]),
        .O(select_ln422_59_fu_3095_p3[0]));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_11_reg_5342[1]_i_1
       (.I0(max_bin_count_51_V[3]),
        .I1(max_bin_count_19_V[3]),
        .I2(select_ln422_11_fu_2823_p3[1]),
        .I3(select_ln422_59_fu_3095_p3[1]),
        .I4(\select_ln440_11_reg_5342[1]_i_4_n_0 ),
        .I5(select_ln422_11_fu_2823_p3[3]),
        .O(select_ln440_11_fu_3335_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_11_reg_5342[1]_i_2
       (.I0(max_bin_count_3_V[1]),
        .I1(max_bin_count_35_V[1]),
        .I2(\icmp_ln895_68_reg_5093[0]_i_2_n_0 ),
        .I3(max_bin_count_35_V[3]),
        .I4(max_bin_count_3_V[3]),
        .O(select_ln422_11_fu_2823_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_11_reg_5342[1]_i_3
       (.I0(max_bin_count_19_V[1]),
        .I1(max_bin_count_51_V[1]),
        .I2(\select_ln422_58_reg_5218[6]_i_3_n_0 ),
        .I3(max_bin_count_51_V[3]),
        .I4(max_bin_count_19_V[3]),
        .O(select_ln422_59_fu_3095_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_11_reg_5342[1]_i_4
       (.I0(select_ln422_11_fu_2823_p3[0]),
        .I1(select_ln422_59_fu_3095_p3[0]),
        .I2(select_ln422_59_fu_3095_p3[1]),
        .I3(select_ln422_11_fu_2823_p3[1]),
        .I4(select_ln422_59_fu_3095_p3[2]),
        .I5(select_ln422_11_fu_2823_p3[2]),
        .O(\select_ln440_11_reg_5342[1]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_11_reg_5342[1]_i_5
       (.I0(max_bin_count_3_V[3]),
        .I1(max_bin_count_35_V[3]),
        .I2(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ),
        .O(select_ln422_11_fu_2823_p3[3]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_11_reg_5342[2]_i_1
       (.I0(max_bin_count_3_V[2]),
        .I1(max_bin_count_35_V[2]),
        .I2(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ),
        .I3(select_ln422_59_fu_3095_p3[2]),
        .I4(\icmp_ln895_100_reg_5336[0]_i_1_n_0 ),
        .O(select_ln440_11_fu_3335_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_11_reg_5342[2]_i_2
       (.I0(max_bin_count_19_V[2]),
        .I1(max_bin_count_51_V[2]),
        .I2(\select_ln422_58_reg_5218[6]_i_3_n_0 ),
        .I3(max_bin_count_51_V[3]),
        .I4(max_bin_count_19_V[3]),
        .O(select_ln422_59_fu_3095_p3[2]));
  LUT6 #(
    .INIT(64'hF0F0FF00EEEEEEEE))
    \select_ln440_11_reg_5342[3]_i_1
       (.I0(max_bin_count_51_V[3]),
        .I1(max_bin_count_19_V[3]),
        .I2(max_bin_count_3_V[3]),
        .I3(max_bin_count_35_V[3]),
        .I4(\icmp_ln895_68_reg_5093[0]_i_1_n_0 ),
        .I5(\icmp_ln895_100_reg_5336[0]_i_1_n_0 ),
        .O(select_ln440_11_fu_3335_p3[3]));
  FDRE \select_ln440_11_reg_5342_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_11_fu_3335_p3[0]),
        .Q(select_ln440_11_reg_5342[0]),
        .R(1'b0));
  FDRE \select_ln440_11_reg_5342_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_11_fu_3335_p3[1]),
        .Q(select_ln440_11_reg_5342[1]),
        .R(1'b0));
  FDRE \select_ln440_11_reg_5342_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_11_fu_3335_p3[2]),
        .Q(select_ln440_11_reg_5342[2]),
        .R(1'b0));
  FDRE \select_ln440_11_reg_5342_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_11_fu_3335_p3[3]),
        .Q(select_ln440_11_reg_5342[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_14_reg_5353[0]_i_1
       (.I0(max_bin_count_52_V[3]),
        .I1(max_bin_count_20_V[3]),
        .I2(select_ln422_14_fu_2840_p3[0]),
        .I3(select_ln422_62_fu_3112_p3[0]),
        .I4(\select_ln440_14_reg_5353[1]_i_4_n_0 ),
        .I5(select_ln422_14_fu_2840_p3[3]),
        .O(select_ln440_14_fu_3344_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_14_reg_5353[0]_i_2
       (.I0(max_bin_count_4_V[0]),
        .I1(max_bin_count_36_V[0]),
        .I2(\icmp_ln895_69_reg_5103[0]_i_2_n_0 ),
        .I3(max_bin_count_36_V[3]),
        .I4(max_bin_count_4_V[3]),
        .O(select_ln422_14_fu_2840_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_14_reg_5353[0]_i_3
       (.I0(max_bin_count_20_V[0]),
        .I1(max_bin_count_52_V[0]),
        .I2(\select_ln422_61_reg_5228[6]_i_3_n_0 ),
        .I3(max_bin_count_52_V[3]),
        .I4(max_bin_count_20_V[3]),
        .O(select_ln422_62_fu_3112_p3[0]));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_14_reg_5353[1]_i_1
       (.I0(max_bin_count_52_V[3]),
        .I1(max_bin_count_20_V[3]),
        .I2(select_ln422_14_fu_2840_p3[1]),
        .I3(select_ln422_62_fu_3112_p3[1]),
        .I4(\select_ln440_14_reg_5353[1]_i_4_n_0 ),
        .I5(select_ln422_14_fu_2840_p3[3]),
        .O(select_ln440_14_fu_3344_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_14_reg_5353[1]_i_2
       (.I0(max_bin_count_4_V[1]),
        .I1(max_bin_count_36_V[1]),
        .I2(\icmp_ln895_69_reg_5103[0]_i_2_n_0 ),
        .I3(max_bin_count_36_V[3]),
        .I4(max_bin_count_4_V[3]),
        .O(select_ln422_14_fu_2840_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_14_reg_5353[1]_i_3
       (.I0(max_bin_count_20_V[1]),
        .I1(max_bin_count_52_V[1]),
        .I2(\select_ln422_61_reg_5228[6]_i_3_n_0 ),
        .I3(max_bin_count_52_V[3]),
        .I4(max_bin_count_20_V[3]),
        .O(select_ln422_62_fu_3112_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_14_reg_5353[1]_i_4
       (.I0(select_ln422_14_fu_2840_p3[0]),
        .I1(select_ln422_62_fu_3112_p3[0]),
        .I2(select_ln422_62_fu_3112_p3[1]),
        .I3(select_ln422_14_fu_2840_p3[1]),
        .I4(select_ln422_62_fu_3112_p3[2]),
        .I5(select_ln422_14_fu_2840_p3[2]),
        .O(\select_ln440_14_reg_5353[1]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_14_reg_5353[1]_i_5
       (.I0(max_bin_count_4_V[3]),
        .I1(max_bin_count_36_V[3]),
        .I2(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ),
        .O(select_ln422_14_fu_2840_p3[3]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_14_reg_5353[2]_i_1
       (.I0(max_bin_count_4_V[2]),
        .I1(max_bin_count_36_V[2]),
        .I2(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ),
        .I3(select_ln422_62_fu_3112_p3[2]),
        .I4(\icmp_ln895_101_reg_5347[0]_i_1_n_0 ),
        .O(select_ln440_14_fu_3344_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair39" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_14_reg_5353[2]_i_2
       (.I0(max_bin_count_20_V[2]),
        .I1(max_bin_count_52_V[2]),
        .I2(\select_ln422_61_reg_5228[6]_i_3_n_0 ),
        .I3(max_bin_count_52_V[3]),
        .I4(max_bin_count_20_V[3]),
        .O(select_ln422_62_fu_3112_p3[2]));
  LUT6 #(
    .INIT(64'hF0F0FF00EEEEEEEE))
    \select_ln440_14_reg_5353[3]_i_1
       (.I0(max_bin_count_52_V[3]),
        .I1(max_bin_count_20_V[3]),
        .I2(max_bin_count_4_V[3]),
        .I3(max_bin_count_36_V[3]),
        .I4(\icmp_ln895_69_reg_5103[0]_i_1_n_0 ),
        .I5(\icmp_ln895_101_reg_5347[0]_i_1_n_0 ),
        .O(select_ln440_14_fu_3344_p3[3]));
  FDRE \select_ln440_14_reg_5353_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_14_fu_3344_p3[0]),
        .Q(select_ln440_14_reg_5353[0]),
        .R(1'b0));
  FDRE \select_ln440_14_reg_5353_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_14_fu_3344_p3[1]),
        .Q(select_ln440_14_reg_5353[1]),
        .R(1'b0));
  FDRE \select_ln440_14_reg_5353_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_14_fu_3344_p3[2]),
        .Q(select_ln440_14_reg_5353[2]),
        .R(1'b0));
  FDRE \select_ln440_14_reg_5353_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_14_fu_3344_p3[3]),
        .Q(select_ln440_14_reg_5353[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_17_reg_5364[0]_i_1
       (.I0(max_bin_count_53_V[3]),
        .I1(max_bin_count_21_V[3]),
        .I2(select_ln422_17_fu_2857_p3[0]),
        .I3(select_ln422_65_fu_3129_p3[0]),
        .I4(\select_ln440_17_reg_5364[1]_i_4_n_0 ),
        .I5(select_ln422_17_fu_2857_p3[3]),
        .O(select_ln440_17_fu_3353_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_17_reg_5364[0]_i_2
       (.I0(max_bin_count_5_V[0]),
        .I1(max_bin_count_37_V[0]),
        .I2(\icmp_ln895_70_reg_5113[0]_i_2_n_0 ),
        .I3(max_bin_count_37_V[3]),
        .I4(max_bin_count_5_V[3]),
        .O(select_ln422_17_fu_2857_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_17_reg_5364[0]_i_3
       (.I0(max_bin_count_21_V[0]),
        .I1(max_bin_count_53_V[0]),
        .I2(\select_ln422_64_reg_5238[6]_i_3_n_0 ),
        .I3(max_bin_count_53_V[3]),
        .I4(max_bin_count_21_V[3]),
        .O(select_ln422_65_fu_3129_p3[0]));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_17_reg_5364[1]_i_1
       (.I0(max_bin_count_53_V[3]),
        .I1(max_bin_count_21_V[3]),
        .I2(select_ln422_17_fu_2857_p3[1]),
        .I3(select_ln422_65_fu_3129_p3[1]),
        .I4(\select_ln440_17_reg_5364[1]_i_4_n_0 ),
        .I5(select_ln422_17_fu_2857_p3[3]),
        .O(select_ln440_17_fu_3353_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_17_reg_5364[1]_i_2
       (.I0(max_bin_count_5_V[1]),
        .I1(max_bin_count_37_V[1]),
        .I2(\icmp_ln895_70_reg_5113[0]_i_2_n_0 ),
        .I3(max_bin_count_37_V[3]),
        .I4(max_bin_count_5_V[3]),
        .O(select_ln422_17_fu_2857_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_17_reg_5364[1]_i_3
       (.I0(max_bin_count_21_V[1]),
        .I1(max_bin_count_53_V[1]),
        .I2(\select_ln422_64_reg_5238[6]_i_3_n_0 ),
        .I3(max_bin_count_53_V[3]),
        .I4(max_bin_count_21_V[3]),
        .O(select_ln422_65_fu_3129_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_17_reg_5364[1]_i_4
       (.I0(select_ln422_17_fu_2857_p3[0]),
        .I1(select_ln422_65_fu_3129_p3[0]),
        .I2(select_ln422_65_fu_3129_p3[1]),
        .I3(select_ln422_17_fu_2857_p3[1]),
        .I4(select_ln422_65_fu_3129_p3[2]),
        .I5(select_ln422_17_fu_2857_p3[2]),
        .O(\select_ln440_17_reg_5364[1]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_17_reg_5364[1]_i_5
       (.I0(max_bin_count_5_V[3]),
        .I1(max_bin_count_37_V[3]),
        .I2(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ),
        .O(select_ln422_17_fu_2857_p3[3]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_17_reg_5364[2]_i_1
       (.I0(max_bin_count_5_V[2]),
        .I1(max_bin_count_37_V[2]),
        .I2(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ),
        .I3(select_ln422_65_fu_3129_p3[2]),
        .I4(\icmp_ln895_102_reg_5358[0]_i_1_n_0 ),
        .O(select_ln440_17_fu_3353_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_17_reg_5364[2]_i_2
       (.I0(max_bin_count_21_V[2]),
        .I1(max_bin_count_53_V[2]),
        .I2(\select_ln422_64_reg_5238[6]_i_3_n_0 ),
        .I3(max_bin_count_53_V[3]),
        .I4(max_bin_count_21_V[3]),
        .O(select_ln422_65_fu_3129_p3[2]));
  LUT6 #(
    .INIT(64'hF0F0FF00EEEEEEEE))
    \select_ln440_17_reg_5364[3]_i_1
       (.I0(max_bin_count_53_V[3]),
        .I1(max_bin_count_21_V[3]),
        .I2(max_bin_count_5_V[3]),
        .I3(max_bin_count_37_V[3]),
        .I4(\icmp_ln895_70_reg_5113[0]_i_1_n_0 ),
        .I5(\icmp_ln895_102_reg_5358[0]_i_1_n_0 ),
        .O(select_ln440_17_fu_3353_p3[3]));
  FDRE \select_ln440_17_reg_5364_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_17_fu_3353_p3[0]),
        .Q(select_ln440_17_reg_5364[0]),
        .R(1'b0));
  FDRE \select_ln440_17_reg_5364_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_17_fu_3353_p3[1]),
        .Q(select_ln440_17_reg_5364[1]),
        .R(1'b0));
  FDRE \select_ln440_17_reg_5364_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_17_fu_3353_p3[2]),
        .Q(select_ln440_17_reg_5364[2]),
        .R(1'b0));
  FDRE \select_ln440_17_reg_5364_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_17_fu_3353_p3[3]),
        .Q(select_ln440_17_reg_5364[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_20_reg_5375[0]_i_1
       (.I0(max_bin_count_54_V[3]),
        .I1(max_bin_count_22_V[3]),
        .I2(select_ln422_20_fu_2874_p3[0]),
        .I3(select_ln422_68_fu_3146_p3[0]),
        .I4(\select_ln440_20_reg_5375[1]_i_4_n_0 ),
        .I5(select_ln422_20_fu_2874_p3[3]),
        .O(select_ln440_20_fu_3362_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_20_reg_5375[0]_i_2
       (.I0(max_bin_count_6_V[0]),
        .I1(max_bin_count_38_V[0]),
        .I2(\icmp_ln895_71_reg_5123[0]_i_2_n_0 ),
        .I3(max_bin_count_38_V[3]),
        .I4(max_bin_count_6_V[3]),
        .O(select_ln422_20_fu_2874_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_20_reg_5375[0]_i_3
       (.I0(max_bin_count_22_V[0]),
        .I1(max_bin_count_54_V[0]),
        .I2(\select_ln422_67_reg_5248[6]_i_3_n_0 ),
        .I3(max_bin_count_54_V[3]),
        .I4(max_bin_count_22_V[3]),
        .O(select_ln422_68_fu_3146_p3[0]));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_20_reg_5375[1]_i_1
       (.I0(max_bin_count_54_V[3]),
        .I1(max_bin_count_22_V[3]),
        .I2(select_ln422_20_fu_2874_p3[1]),
        .I3(select_ln422_68_fu_3146_p3[1]),
        .I4(\select_ln440_20_reg_5375[1]_i_4_n_0 ),
        .I5(select_ln422_20_fu_2874_p3[3]),
        .O(select_ln440_20_fu_3362_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_20_reg_5375[1]_i_2
       (.I0(max_bin_count_6_V[1]),
        .I1(max_bin_count_38_V[1]),
        .I2(\icmp_ln895_71_reg_5123[0]_i_2_n_0 ),
        .I3(max_bin_count_38_V[3]),
        .I4(max_bin_count_6_V[3]),
        .O(select_ln422_20_fu_2874_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_20_reg_5375[1]_i_3
       (.I0(max_bin_count_22_V[1]),
        .I1(max_bin_count_54_V[1]),
        .I2(\select_ln422_67_reg_5248[6]_i_3_n_0 ),
        .I3(max_bin_count_54_V[3]),
        .I4(max_bin_count_22_V[3]),
        .O(select_ln422_68_fu_3146_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_20_reg_5375[1]_i_4
       (.I0(select_ln422_20_fu_2874_p3[0]),
        .I1(select_ln422_68_fu_3146_p3[0]),
        .I2(select_ln422_68_fu_3146_p3[1]),
        .I3(select_ln422_20_fu_2874_p3[1]),
        .I4(select_ln422_68_fu_3146_p3[2]),
        .I5(select_ln422_20_fu_2874_p3[2]),
        .O(\select_ln440_20_reg_5375[1]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_20_reg_5375[1]_i_5
       (.I0(max_bin_count_6_V[3]),
        .I1(max_bin_count_38_V[3]),
        .I2(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ),
        .O(select_ln422_20_fu_2874_p3[3]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_20_reg_5375[2]_i_1
       (.I0(max_bin_count_6_V[2]),
        .I1(max_bin_count_38_V[2]),
        .I2(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ),
        .I3(select_ln422_68_fu_3146_p3[2]),
        .I4(\icmp_ln895_103_reg_5369[0]_i_1_n_0 ),
        .O(select_ln440_20_fu_3362_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair47" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_20_reg_5375[2]_i_2
       (.I0(max_bin_count_22_V[2]),
        .I1(max_bin_count_54_V[2]),
        .I2(\select_ln422_67_reg_5248[6]_i_3_n_0 ),
        .I3(max_bin_count_54_V[3]),
        .I4(max_bin_count_22_V[3]),
        .O(select_ln422_68_fu_3146_p3[2]));
  LUT6 #(
    .INIT(64'hF0F0FF00EEEEEEEE))
    \select_ln440_20_reg_5375[3]_i_1
       (.I0(max_bin_count_54_V[3]),
        .I1(max_bin_count_22_V[3]),
        .I2(max_bin_count_6_V[3]),
        .I3(max_bin_count_38_V[3]),
        .I4(\icmp_ln895_71_reg_5123[0]_i_1_n_0 ),
        .I5(\icmp_ln895_103_reg_5369[0]_i_1_n_0 ),
        .O(select_ln440_20_fu_3362_p3[3]));
  FDRE \select_ln440_20_reg_5375_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_20_fu_3362_p3[0]),
        .Q(select_ln440_20_reg_5375[0]),
        .R(1'b0));
  FDRE \select_ln440_20_reg_5375_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_20_fu_3362_p3[1]),
        .Q(select_ln440_20_reg_5375[1]),
        .R(1'b0));
  FDRE \select_ln440_20_reg_5375_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_20_fu_3362_p3[2]),
        .Q(select_ln440_20_reg_5375[2]),
        .R(1'b0));
  FDRE \select_ln440_20_reg_5375_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_20_fu_3362_p3[3]),
        .Q(select_ln440_20_reg_5375[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_23_reg_5386[0]_i_1
       (.I0(max_bin_count_55_V[3]),
        .I1(max_bin_count_23_V[3]),
        .I2(select_ln422_23_fu_2891_p3[0]),
        .I3(select_ln422_71_fu_3163_p3[0]),
        .I4(\select_ln440_23_reg_5386[1]_i_4_n_0 ),
        .I5(select_ln422_23_fu_2891_p3[3]),
        .O(select_ln440_23_fu_3371_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_23_reg_5386[0]_i_2
       (.I0(max_bin_count_7_V[0]),
        .I1(max_bin_count_39_V[0]),
        .I2(\icmp_ln895_72_reg_5133[0]_i_2_n_0 ),
        .I3(max_bin_count_39_V[3]),
        .I4(max_bin_count_7_V[3]),
        .O(select_ln422_23_fu_2891_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_23_reg_5386[0]_i_3
       (.I0(max_bin_count_23_V[0]),
        .I1(max_bin_count_55_V[0]),
        .I2(\select_ln422_70_reg_5258[6]_i_3_n_0 ),
        .I3(max_bin_count_55_V[3]),
        .I4(max_bin_count_23_V[3]),
        .O(select_ln422_71_fu_3163_p3[0]));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_23_reg_5386[1]_i_1
       (.I0(max_bin_count_55_V[3]),
        .I1(max_bin_count_23_V[3]),
        .I2(select_ln422_23_fu_2891_p3[1]),
        .I3(select_ln422_71_fu_3163_p3[1]),
        .I4(\select_ln440_23_reg_5386[1]_i_4_n_0 ),
        .I5(select_ln422_23_fu_2891_p3[3]),
        .O(select_ln440_23_fu_3371_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_23_reg_5386[1]_i_2
       (.I0(max_bin_count_7_V[1]),
        .I1(max_bin_count_39_V[1]),
        .I2(\icmp_ln895_72_reg_5133[0]_i_2_n_0 ),
        .I3(max_bin_count_39_V[3]),
        .I4(max_bin_count_7_V[3]),
        .O(select_ln422_23_fu_2891_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_23_reg_5386[1]_i_3
       (.I0(max_bin_count_23_V[1]),
        .I1(max_bin_count_55_V[1]),
        .I2(\select_ln422_70_reg_5258[6]_i_3_n_0 ),
        .I3(max_bin_count_55_V[3]),
        .I4(max_bin_count_23_V[3]),
        .O(select_ln422_71_fu_3163_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_23_reg_5386[1]_i_4
       (.I0(select_ln422_23_fu_2891_p3[0]),
        .I1(select_ln422_71_fu_3163_p3[0]),
        .I2(select_ln422_71_fu_3163_p3[1]),
        .I3(select_ln422_23_fu_2891_p3[1]),
        .I4(select_ln422_71_fu_3163_p3[2]),
        .I5(select_ln422_23_fu_2891_p3[2]),
        .O(\select_ln440_23_reg_5386[1]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_23_reg_5386[1]_i_5
       (.I0(max_bin_count_7_V[3]),
        .I1(max_bin_count_39_V[3]),
        .I2(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ),
        .O(select_ln422_23_fu_2891_p3[3]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_23_reg_5386[2]_i_1
       (.I0(max_bin_count_7_V[2]),
        .I1(max_bin_count_39_V[2]),
        .I2(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ),
        .I3(select_ln422_71_fu_3163_p3[2]),
        .I4(\icmp_ln895_104_reg_5380[0]_i_1_n_0 ),
        .O(select_ln440_23_fu_3371_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair28" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_23_reg_5386[2]_i_2
       (.I0(max_bin_count_23_V[2]),
        .I1(max_bin_count_55_V[2]),
        .I2(\select_ln422_70_reg_5258[6]_i_3_n_0 ),
        .I3(max_bin_count_55_V[3]),
        .I4(max_bin_count_23_V[3]),
        .O(select_ln422_71_fu_3163_p3[2]));
  LUT6 #(
    .INIT(64'hF0F0FF00EEEEEEEE))
    \select_ln440_23_reg_5386[3]_i_1
       (.I0(max_bin_count_55_V[3]),
        .I1(max_bin_count_23_V[3]),
        .I2(max_bin_count_7_V[3]),
        .I3(max_bin_count_39_V[3]),
        .I4(\icmp_ln895_72_reg_5133[0]_i_1_n_0 ),
        .I5(\icmp_ln895_104_reg_5380[0]_i_1_n_0 ),
        .O(select_ln440_23_fu_3371_p3[3]));
  FDRE \select_ln440_23_reg_5386_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_23_fu_3371_p3[0]),
        .Q(select_ln440_23_reg_5386[0]),
        .R(1'b0));
  FDRE \select_ln440_23_reg_5386_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_23_fu_3371_p3[1]),
        .Q(select_ln440_23_reg_5386[1]),
        .R(1'b0));
  FDRE \select_ln440_23_reg_5386_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_23_fu_3371_p3[2]),
        .Q(select_ln440_23_reg_5386[2]),
        .R(1'b0));
  FDRE \select_ln440_23_reg_5386_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_23_fu_3371_p3[3]),
        .Q(select_ln440_23_reg_5386[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_25_reg_5396[0]_i_1
       (.I0(max_bin_r_8_V[0]),
        .I1(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .I2(max_bin_r_40_V[0]),
        .I3(p_3_in),
        .I4(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ),
        .I5(select_ln422_73_fu_3172_p3[0]),
        .O(select_ln440_25_fu_3380_p3[0]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_25_reg_5396[0]_i_2
       (.I0(max_bin_r_24_V[0]),
        .I1(\icmp_ln895_24_reg_4863[0]_i_1_n_0 ),
        .I2(\icmp_ln895_89_reg_5263[0]_i_1_n_0 ),
        .I3(max_bin_r_56_V[0]),
        .I4(\icmp_ln895_56_reg_5023[0]_i_1_n_0 ),
        .O(select_ln422_73_fu_3172_p3[0]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_25_reg_5396[1]_i_1
       (.I0(max_bin_r_8_V[1]),
        .I1(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .I2(max_bin_r_40_V[1]),
        .I3(p_3_in),
        .I4(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ),
        .I5(select_ln422_73_fu_3172_p3[1]),
        .O(select_ln440_25_fu_3380_p3[1]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_25_reg_5396[1]_i_2
       (.I0(max_bin_r_24_V[1]),
        .I1(\icmp_ln895_24_reg_4863[0]_i_1_n_0 ),
        .I2(\icmp_ln895_89_reg_5263[0]_i_1_n_0 ),
        .I3(max_bin_r_56_V[1]),
        .I4(\icmp_ln895_56_reg_5023[0]_i_1_n_0 ),
        .O(select_ln422_73_fu_3172_p3[1]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_25_reg_5396[2]_i_1
       (.I0(max_bin_r_8_V[2]),
        .I1(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .I2(max_bin_r_40_V[2]),
        .I3(p_3_in),
        .I4(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ),
        .I5(select_ln422_73_fu_3172_p3[2]),
        .O(select_ln440_25_fu_3380_p3[2]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_25_reg_5396[2]_i_2
       (.I0(max_bin_r_24_V[2]),
        .I1(\icmp_ln895_24_reg_4863[0]_i_1_n_0 ),
        .I2(\icmp_ln895_89_reg_5263[0]_i_1_n_0 ),
        .I3(max_bin_r_56_V[2]),
        .I4(\icmp_ln895_56_reg_5023[0]_i_1_n_0 ),
        .O(select_ln422_73_fu_3172_p3[2]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_25_reg_5396[3]_i_1
       (.I0(max_bin_r_8_V[3]),
        .I1(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .I2(max_bin_r_40_V[3]),
        .I3(p_3_in),
        .I4(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ),
        .I5(select_ln422_73_fu_3172_p3[3]),
        .O(select_ln440_25_fu_3380_p3[3]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_25_reg_5396[3]_i_2
       (.I0(max_bin_r_24_V[3]),
        .I1(\icmp_ln895_24_reg_4863[0]_i_1_n_0 ),
        .I2(\icmp_ln895_89_reg_5263[0]_i_1_n_0 ),
        .I3(max_bin_r_56_V[3]),
        .I4(\icmp_ln895_56_reg_5023[0]_i_1_n_0 ),
        .O(select_ln422_73_fu_3172_p3[3]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_25_reg_5396[4]_i_1
       (.I0(max_bin_r_8_V[4]),
        .I1(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .I2(max_bin_r_40_V[4]),
        .I3(p_3_in),
        .I4(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ),
        .I5(select_ln422_73_fu_3172_p3[4]),
        .O(select_ln440_25_fu_3380_p3[4]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_25_reg_5396[4]_i_2
       (.I0(max_bin_r_24_V[4]),
        .I1(\icmp_ln895_24_reg_4863[0]_i_1_n_0 ),
        .I2(\icmp_ln895_89_reg_5263[0]_i_1_n_0 ),
        .I3(max_bin_r_56_V[4]),
        .I4(\icmp_ln895_56_reg_5023[0]_i_1_n_0 ),
        .O(select_ln422_73_fu_3172_p3[4]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_25_reg_5396[5]_i_1
       (.I0(max_bin_r_8_V[5]),
        .I1(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .I2(max_bin_r_40_V[5]),
        .I3(p_3_in),
        .I4(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ),
        .I5(select_ln422_73_fu_3172_p3[5]),
        .O(select_ln440_25_fu_3380_p3[5]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_25_reg_5396[5]_i_2
       (.I0(max_bin_r_24_V[5]),
        .I1(\icmp_ln895_24_reg_4863[0]_i_1_n_0 ),
        .I2(\icmp_ln895_89_reg_5263[0]_i_1_n_0 ),
        .I3(max_bin_r_56_V[5]),
        .I4(\icmp_ln895_56_reg_5023[0]_i_1_n_0 ),
        .O(select_ln422_73_fu_3172_p3[5]));
  LUT6 #(
    .INIT(64'h0000000200000000))
    \select_ln440_25_reg_5396[6]_i_1
       (.I0(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ),
        .I1(max_bin_count_8_V[2]),
        .I2(max_bin_count_8_V[3]),
        .I3(max_bin_count_8_V[1]),
        .I4(max_bin_count_8_V[0]),
        .I5(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .O(\select_ln440_25_reg_5396[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_25_reg_5396[6]_i_2
       (.I0(max_bin_r_8_V[6]),
        .I1(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .I2(max_bin_r_40_V[6]),
        .I3(p_3_in),
        .I4(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ),
        .I5(select_ln422_73_fu_3172_p3[6]),
        .O(select_ln440_25_fu_3380_p3[6]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_25_reg_5396[6]_i_3
       (.I0(max_bin_r_24_V[6]),
        .I1(\icmp_ln895_24_reg_4863[0]_i_1_n_0 ),
        .I2(\icmp_ln895_89_reg_5263[0]_i_1_n_0 ),
        .I3(max_bin_r_56_V[6]),
        .I4(\icmp_ln895_56_reg_5023[0]_i_1_n_0 ),
        .O(select_ln422_73_fu_3172_p3[6]));
  FDRE \select_ln440_25_reg_5396_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_25_fu_3380_p3[0]),
        .Q(\select_ln440_25_reg_5396_reg_n_0_[0] ),
        .R(\select_ln440_25_reg_5396[6]_i_1_n_0 ));
  FDRE \select_ln440_25_reg_5396_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_25_fu_3380_p3[1]),
        .Q(\select_ln440_25_reg_5396_reg_n_0_[1] ),
        .R(\select_ln440_25_reg_5396[6]_i_1_n_0 ));
  FDRE \select_ln440_25_reg_5396_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_25_fu_3380_p3[2]),
        .Q(\select_ln440_25_reg_5396_reg_n_0_[2] ),
        .R(\select_ln440_25_reg_5396[6]_i_1_n_0 ));
  FDRE \select_ln440_25_reg_5396_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_25_fu_3380_p3[3]),
        .Q(\select_ln440_25_reg_5396_reg_n_0_[3] ),
        .R(\select_ln440_25_reg_5396[6]_i_1_n_0 ));
  FDRE \select_ln440_25_reg_5396_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_25_fu_3380_p3[4]),
        .Q(\select_ln440_25_reg_5396_reg_n_0_[4] ),
        .R(\select_ln440_25_reg_5396[6]_i_1_n_0 ));
  FDRE \select_ln440_25_reg_5396_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_25_fu_3380_p3[5]),
        .Q(\select_ln440_25_reg_5396_reg_n_0_[5] ),
        .R(\select_ln440_25_reg_5396[6]_i_1_n_0 ));
  FDRE \select_ln440_25_reg_5396_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_25_fu_3380_p3[6]),
        .Q(\select_ln440_25_reg_5396_reg_n_0_[6] ),
        .R(\select_ln440_25_reg_5396[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_26_reg_5401[0]_i_1
       (.I0(max_bin_count_8_V[0]),
        .I1(max_bin_count_40_V[0]),
        .I2(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .I3(select_ln422_74_fu_3180_p3[0]),
        .I4(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ),
        .O(select_ln440_26_fu_3388_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair48" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_26_reg_5401[0]_i_2
       (.I0(max_bin_count_24_V[0]),
        .I1(max_bin_count_56_V[0]),
        .I2(\icmp_ln895_89_reg_5263[0]_i_2_n_0 ),
        .I3(max_bin_count_56_V[3]),
        .I4(max_bin_count_24_V[3]),
        .O(select_ln422_74_fu_3180_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_26_reg_5401[1]_i_1
       (.I0(select_ln422_26_fu_2908_p3[1]),
        .I1(select_ln422_74_fu_3180_p3[1]),
        .I2(\select_ln440_26_reg_5401[1]_i_4_n_0 ),
        .I3(select_ln422_74_fu_3180_p3[3]),
        .I4(select_ln422_26_fu_2908_p3[3]),
        .O(select_ln440_26_fu_3388_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_26_reg_5401[1]_i_2
       (.I0(max_bin_count_8_V[1]),
        .I1(max_bin_count_40_V[1]),
        .I2(\icmp_ln895_73_reg_5143[0]_i_2_n_0 ),
        .I3(max_bin_count_40_V[3]),
        .I4(max_bin_count_8_V[3]),
        .O(select_ln422_26_fu_2908_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_26_reg_5401[1]_i_3
       (.I0(max_bin_count_24_V[1]),
        .I1(max_bin_count_56_V[1]),
        .I2(\icmp_ln895_89_reg_5263[0]_i_2_n_0 ),
        .I3(max_bin_count_56_V[3]),
        .I4(max_bin_count_24_V[3]),
        .O(select_ln422_74_fu_3180_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_26_reg_5401[1]_i_4
       (.I0(select_ln422_26_fu_2908_p3[0]),
        .I1(select_ln422_74_fu_3180_p3[0]),
        .I2(select_ln422_74_fu_3180_p3[1]),
        .I3(select_ln422_26_fu_2908_p3[1]),
        .I4(select_ln422_74_fu_3180_p3[2]),
        .I5(select_ln422_26_fu_2908_p3[2]),
        .O(\select_ln440_26_reg_5401[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_26_reg_5401[1]_i_5
       (.I0(max_bin_count_8_V[3]),
        .I1(max_bin_count_40_V[3]),
        .I2(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .O(select_ln422_26_fu_2908_p3[3]));
  (* SOFT_HLUTNM = "soft_lutpair44" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_26_reg_5401[1]_i_6
       (.I0(max_bin_count_8_V[0]),
        .I1(max_bin_count_40_V[0]),
        .I2(\icmp_ln895_73_reg_5143[0]_i_2_n_0 ),
        .I3(max_bin_count_40_V[3]),
        .I4(max_bin_count_8_V[3]),
        .O(select_ln422_26_fu_2908_p3[0]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_26_reg_5401[2]_i_1
       (.I0(max_bin_count_8_V[2]),
        .I1(max_bin_count_40_V[2]),
        .I2(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .I3(select_ln422_74_fu_3180_p3[2]),
        .I4(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ),
        .O(select_ln440_26_fu_3388_p3[2]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_26_reg_5401[2]_i_2
       (.I0(max_bin_count_24_V[2]),
        .I1(max_bin_count_56_V[2]),
        .I2(\icmp_ln895_89_reg_5263[0]_i_2_n_0 ),
        .I3(max_bin_count_56_V[3]),
        .I4(max_bin_count_24_V[3]),
        .O(select_ln422_74_fu_3180_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair53" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_26_reg_5401[3]_i_1
       (.I0(max_bin_count_8_V[3]),
        .I1(max_bin_count_40_V[3]),
        .I2(\icmp_ln895_73_reg_5143[0]_i_1_n_0 ),
        .I3(select_ln422_74_fu_3180_p3[3]),
        .I4(\icmp_ln895_105_reg_5391[0]_i_1_n_0 ),
        .O(select_ln440_26_fu_3388_p3[3]));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_26_reg_5401[3]_i_2
       (.I0(max_bin_count_24_V[3]),
        .I1(max_bin_count_56_V[3]),
        .I2(\icmp_ln895_89_reg_5263[0]_i_1_n_0 ),
        .O(select_ln422_74_fu_3180_p3[3]));
  FDRE \select_ln440_26_reg_5401_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_26_fu_3388_p3[0]),
        .Q(select_ln440_26_reg_5401[0]),
        .R(1'b0));
  FDRE \select_ln440_26_reg_5401_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_26_fu_3388_p3[1]),
        .Q(select_ln440_26_reg_5401[1]),
        .R(1'b0));
  FDRE \select_ln440_26_reg_5401_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_26_fu_3388_p3[2]),
        .Q(select_ln440_26_reg_5401[2]),
        .R(1'b0));
  FDRE \select_ln440_26_reg_5401_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_26_fu_3388_p3[3]),
        .Q(select_ln440_26_reg_5401[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_28_reg_5411[0]_i_1
       (.I0(max_bin_r_9_V[0]),
        .I1(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .I2(max_bin_r_41_V[0]),
        .I3(\icmp_ln895_41_reg_4948[0]_i_1_n_0 ),
        .I4(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ),
        .I5(select_ln422_76_fu_3189_p3[0]),
        .O(select_ln440_28_fu_3397_p3[0]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_28_reg_5411[0]_i_2
       (.I0(max_bin_r_25_V[0]),
        .I1(\icmp_ln895_25_reg_4868[0]_i_1_n_0 ),
        .I2(\icmp_ln895_90_reg_5268[0]_i_1_n_0 ),
        .I3(max_bin_r_57_V[0]),
        .I4(\icmp_ln895_57_reg_5028[0]_i_1_n_0 ),
        .O(select_ln422_76_fu_3189_p3[0]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_28_reg_5411[1]_i_1
       (.I0(max_bin_r_9_V[1]),
        .I1(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .I2(max_bin_r_41_V[1]),
        .I3(\icmp_ln895_41_reg_4948[0]_i_1_n_0 ),
        .I4(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ),
        .I5(select_ln422_76_fu_3189_p3[1]),
        .O(select_ln440_28_fu_3397_p3[1]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_28_reg_5411[1]_i_2
       (.I0(max_bin_r_25_V[1]),
        .I1(\icmp_ln895_25_reg_4868[0]_i_1_n_0 ),
        .I2(\icmp_ln895_90_reg_5268[0]_i_1_n_0 ),
        .I3(max_bin_r_57_V[1]),
        .I4(\icmp_ln895_57_reg_5028[0]_i_1_n_0 ),
        .O(select_ln422_76_fu_3189_p3[1]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_28_reg_5411[2]_i_1
       (.I0(max_bin_r_9_V[2]),
        .I1(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .I2(max_bin_r_41_V[2]),
        .I3(\icmp_ln895_41_reg_4948[0]_i_1_n_0 ),
        .I4(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ),
        .I5(select_ln422_76_fu_3189_p3[2]),
        .O(select_ln440_28_fu_3397_p3[2]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_28_reg_5411[2]_i_2
       (.I0(max_bin_r_25_V[2]),
        .I1(\icmp_ln895_25_reg_4868[0]_i_1_n_0 ),
        .I2(\icmp_ln895_90_reg_5268[0]_i_1_n_0 ),
        .I3(max_bin_r_57_V[2]),
        .I4(\icmp_ln895_57_reg_5028[0]_i_1_n_0 ),
        .O(select_ln422_76_fu_3189_p3[2]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_28_reg_5411[3]_i_1
       (.I0(max_bin_r_9_V[3]),
        .I1(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .I2(max_bin_r_41_V[3]),
        .I3(\icmp_ln895_41_reg_4948[0]_i_1_n_0 ),
        .I4(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ),
        .I5(select_ln422_76_fu_3189_p3[3]),
        .O(select_ln440_28_fu_3397_p3[3]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_28_reg_5411[3]_i_2
       (.I0(max_bin_r_25_V[3]),
        .I1(\icmp_ln895_25_reg_4868[0]_i_1_n_0 ),
        .I2(\icmp_ln895_90_reg_5268[0]_i_1_n_0 ),
        .I3(max_bin_r_57_V[3]),
        .I4(\icmp_ln895_57_reg_5028[0]_i_1_n_0 ),
        .O(select_ln422_76_fu_3189_p3[3]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_28_reg_5411[4]_i_1
       (.I0(max_bin_r_9_V[4]),
        .I1(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .I2(max_bin_r_41_V[4]),
        .I3(\icmp_ln895_41_reg_4948[0]_i_1_n_0 ),
        .I4(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ),
        .I5(select_ln422_76_fu_3189_p3[4]),
        .O(select_ln440_28_fu_3397_p3[4]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_28_reg_5411[4]_i_2
       (.I0(max_bin_r_25_V[4]),
        .I1(\icmp_ln895_25_reg_4868[0]_i_1_n_0 ),
        .I2(\icmp_ln895_90_reg_5268[0]_i_1_n_0 ),
        .I3(max_bin_r_57_V[4]),
        .I4(\icmp_ln895_57_reg_5028[0]_i_1_n_0 ),
        .O(select_ln422_76_fu_3189_p3[4]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_28_reg_5411[5]_i_1
       (.I0(max_bin_r_9_V[5]),
        .I1(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .I2(max_bin_r_41_V[5]),
        .I3(\icmp_ln895_41_reg_4948[0]_i_1_n_0 ),
        .I4(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ),
        .I5(select_ln422_76_fu_3189_p3[5]),
        .O(select_ln440_28_fu_3397_p3[5]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_28_reg_5411[5]_i_2
       (.I0(max_bin_r_25_V[5]),
        .I1(\icmp_ln895_25_reg_4868[0]_i_1_n_0 ),
        .I2(\icmp_ln895_90_reg_5268[0]_i_1_n_0 ),
        .I3(max_bin_r_57_V[5]),
        .I4(\icmp_ln895_57_reg_5028[0]_i_1_n_0 ),
        .O(select_ln422_76_fu_3189_p3[5]));
  LUT6 #(
    .INIT(64'h0000000200000000))
    \select_ln440_28_reg_5411[6]_i_1
       (.I0(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ),
        .I1(max_bin_count_9_V[2]),
        .I2(max_bin_count_9_V[3]),
        .I3(max_bin_count_9_V[1]),
        .I4(max_bin_count_9_V[0]),
        .I5(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .O(\select_ln440_28_reg_5411[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_28_reg_5411[6]_i_2
       (.I0(max_bin_r_9_V[6]),
        .I1(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .I2(max_bin_r_41_V[6]),
        .I3(\icmp_ln895_41_reg_4948[0]_i_1_n_0 ),
        .I4(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ),
        .I5(select_ln422_76_fu_3189_p3[6]),
        .O(select_ln440_28_fu_3397_p3[6]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_28_reg_5411[6]_i_3
       (.I0(max_bin_r_25_V[6]),
        .I1(\icmp_ln895_25_reg_4868[0]_i_1_n_0 ),
        .I2(\icmp_ln895_90_reg_5268[0]_i_1_n_0 ),
        .I3(max_bin_r_57_V[6]),
        .I4(\icmp_ln895_57_reg_5028[0]_i_1_n_0 ),
        .O(select_ln422_76_fu_3189_p3[6]));
  FDRE \select_ln440_28_reg_5411_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_28_fu_3397_p3[0]),
        .Q(\select_ln440_28_reg_5411_reg_n_0_[0] ),
        .R(\select_ln440_28_reg_5411[6]_i_1_n_0 ));
  FDRE \select_ln440_28_reg_5411_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_28_fu_3397_p3[1]),
        .Q(\select_ln440_28_reg_5411_reg_n_0_[1] ),
        .R(\select_ln440_28_reg_5411[6]_i_1_n_0 ));
  FDRE \select_ln440_28_reg_5411_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_28_fu_3397_p3[2]),
        .Q(\select_ln440_28_reg_5411_reg_n_0_[2] ),
        .R(\select_ln440_28_reg_5411[6]_i_1_n_0 ));
  FDRE \select_ln440_28_reg_5411_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_28_fu_3397_p3[3]),
        .Q(\select_ln440_28_reg_5411_reg_n_0_[3] ),
        .R(\select_ln440_28_reg_5411[6]_i_1_n_0 ));
  FDRE \select_ln440_28_reg_5411_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_28_fu_3397_p3[4]),
        .Q(\select_ln440_28_reg_5411_reg_n_0_[4] ),
        .R(\select_ln440_28_reg_5411[6]_i_1_n_0 ));
  FDRE \select_ln440_28_reg_5411_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_28_fu_3397_p3[5]),
        .Q(\select_ln440_28_reg_5411_reg_n_0_[5] ),
        .R(\select_ln440_28_reg_5411[6]_i_1_n_0 ));
  FDRE \select_ln440_28_reg_5411_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_28_fu_3397_p3[6]),
        .Q(\select_ln440_28_reg_5411_reg_n_0_[6] ),
        .R(\select_ln440_28_reg_5411[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_29_reg_5416[0]_i_1
       (.I0(max_bin_count_9_V[0]),
        .I1(max_bin_count_41_V[0]),
        .I2(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .I3(select_ln422_77_fu_3197_p3[0]),
        .I4(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ),
        .O(select_ln440_29_fu_3405_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_29_reg_5416[0]_i_2
       (.I0(max_bin_count_25_V[0]),
        .I1(max_bin_count_57_V[0]),
        .I2(\icmp_ln895_90_reg_5268[0]_i_2_n_0 ),
        .I3(max_bin_count_57_V[3]),
        .I4(max_bin_count_25_V[3]),
        .O(select_ln422_77_fu_3197_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_29_reg_5416[1]_i_1
       (.I0(select_ln422_29_fu_2925_p3[1]),
        .I1(select_ln422_77_fu_3197_p3[1]),
        .I2(\select_ln440_29_reg_5416[1]_i_4_n_0 ),
        .I3(select_ln422_77_fu_3197_p3[3]),
        .I4(select_ln422_29_fu_2925_p3[3]),
        .O(select_ln440_29_fu_3405_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_29_reg_5416[1]_i_2
       (.I0(max_bin_count_9_V[1]),
        .I1(max_bin_count_41_V[1]),
        .I2(\icmp_ln895_74_reg_5148[0]_i_2_n_0 ),
        .I3(max_bin_count_41_V[3]),
        .I4(max_bin_count_9_V[3]),
        .O(select_ln422_29_fu_2925_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_29_reg_5416[1]_i_3
       (.I0(max_bin_count_25_V[1]),
        .I1(max_bin_count_57_V[1]),
        .I2(\icmp_ln895_90_reg_5268[0]_i_2_n_0 ),
        .I3(max_bin_count_57_V[3]),
        .I4(max_bin_count_25_V[3]),
        .O(select_ln422_77_fu_3197_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_29_reg_5416[1]_i_4
       (.I0(select_ln422_29_fu_2925_p3[0]),
        .I1(select_ln422_77_fu_3197_p3[0]),
        .I2(select_ln422_77_fu_3197_p3[1]),
        .I3(select_ln422_29_fu_2925_p3[1]),
        .I4(select_ln422_77_fu_3197_p3[2]),
        .I5(select_ln422_29_fu_2925_p3[2]),
        .O(\select_ln440_29_reg_5416[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_29_reg_5416[1]_i_5
       (.I0(max_bin_count_9_V[3]),
        .I1(max_bin_count_41_V[3]),
        .I2(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .O(select_ln422_29_fu_2925_p3[3]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_29_reg_5416[1]_i_6
       (.I0(max_bin_count_9_V[0]),
        .I1(max_bin_count_41_V[0]),
        .I2(\icmp_ln895_74_reg_5148[0]_i_2_n_0 ),
        .I3(max_bin_count_41_V[3]),
        .I4(max_bin_count_9_V[3]),
        .O(select_ln422_29_fu_2925_p3[0]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_29_reg_5416[2]_i_1
       (.I0(max_bin_count_9_V[2]),
        .I1(max_bin_count_41_V[2]),
        .I2(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .I3(select_ln422_77_fu_3197_p3[2]),
        .I4(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ),
        .O(select_ln440_29_fu_3405_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair31" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_29_reg_5416[2]_i_2
       (.I0(max_bin_count_25_V[2]),
        .I1(max_bin_count_57_V[2]),
        .I2(\icmp_ln895_90_reg_5268[0]_i_2_n_0 ),
        .I3(max_bin_count_57_V[3]),
        .I4(max_bin_count_25_V[3]),
        .O(select_ln422_77_fu_3197_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair30" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_29_reg_5416[3]_i_1
       (.I0(max_bin_count_9_V[3]),
        .I1(max_bin_count_41_V[3]),
        .I2(\icmp_ln895_74_reg_5148[0]_i_1_n_0 ),
        .I3(select_ln422_77_fu_3197_p3[3]),
        .I4(\icmp_ln895_106_reg_5406[0]_i_1_n_0 ),
        .O(select_ln440_29_fu_3405_p3[3]));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_29_reg_5416[3]_i_2
       (.I0(max_bin_count_25_V[3]),
        .I1(max_bin_count_57_V[3]),
        .I2(\icmp_ln895_90_reg_5268[0]_i_1_n_0 ),
        .O(select_ln422_77_fu_3197_p3[3]));
  FDRE \select_ln440_29_reg_5416_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_29_fu_3405_p3[0]),
        .Q(select_ln440_29_reg_5416[0]),
        .R(1'b0));
  FDRE \select_ln440_29_reg_5416_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_29_fu_3405_p3[1]),
        .Q(select_ln440_29_reg_5416[1]),
        .R(1'b0));
  FDRE \select_ln440_29_reg_5416_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_29_fu_3405_p3[2]),
        .Q(select_ln440_29_reg_5416[2]),
        .R(1'b0));
  FDRE \select_ln440_29_reg_5416_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_29_fu_3405_p3[3]),
        .Q(select_ln440_29_reg_5416[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_2_reg_5309[0]_i_1
       (.I0(max_bin_count_48_V[3]),
        .I1(max_bin_count_16_V[3]),
        .I2(select_ln422_2_fu_2772_p3[0]),
        .I3(select_ln422_50_fu_3044_p3[0]),
        .I4(\select_ln440_2_reg_5309[1]_i_4_n_0 ),
        .I5(select_ln422_2_fu_2772_p3[3]),
        .O(select_ln440_2_fu_3308_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair35" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_2_reg_5309[0]_i_2
       (.I0(max_bin_count_0_V[0]),
        .I1(max_bin_count_32_V[0]),
        .I2(\icmp_ln895_65_reg_5063[0]_i_2_n_0 ),
        .I3(max_bin_count_32_V[3]),
        .I4(max_bin_count_0_V[3]),
        .O(select_ln422_2_fu_2772_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair36" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_2_reg_5309[0]_i_3
       (.I0(max_bin_count_16_V[0]),
        .I1(max_bin_count_48_V[0]),
        .I2(\select_ln422_49_reg_5188[6]_i_3_n_0 ),
        .I3(max_bin_count_48_V[3]),
        .I4(max_bin_count_16_V[3]),
        .O(select_ln422_50_fu_3044_p3[0]));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_2_reg_5309[1]_i_1
       (.I0(max_bin_count_48_V[3]),
        .I1(max_bin_count_16_V[3]),
        .I2(select_ln422_2_fu_2772_p3[1]),
        .I3(select_ln422_50_fu_3044_p3[1]),
        .I4(\select_ln440_2_reg_5309[1]_i_4_n_0 ),
        .I5(select_ln422_2_fu_2772_p3[3]),
        .O(select_ln440_2_fu_3308_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_2_reg_5309[1]_i_2
       (.I0(max_bin_count_0_V[1]),
        .I1(max_bin_count_32_V[1]),
        .I2(\icmp_ln895_65_reg_5063[0]_i_2_n_0 ),
        .I3(max_bin_count_32_V[3]),
        .I4(max_bin_count_0_V[3]),
        .O(select_ln422_2_fu_2772_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_2_reg_5309[1]_i_3
       (.I0(max_bin_count_16_V[1]),
        .I1(max_bin_count_48_V[1]),
        .I2(\select_ln422_49_reg_5188[6]_i_3_n_0 ),
        .I3(max_bin_count_48_V[3]),
        .I4(max_bin_count_16_V[3]),
        .O(select_ln422_50_fu_3044_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_2_reg_5309[1]_i_4
       (.I0(select_ln422_2_fu_2772_p3[0]),
        .I1(select_ln422_50_fu_3044_p3[0]),
        .I2(select_ln422_50_fu_3044_p3[1]),
        .I3(select_ln422_2_fu_2772_p3[1]),
        .I4(select_ln422_50_fu_3044_p3[2]),
        .I5(select_ln422_2_fu_2772_p3[2]),
        .O(\select_ln440_2_reg_5309[1]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_2_reg_5309[1]_i_5
       (.I0(max_bin_count_0_V[3]),
        .I1(max_bin_count_32_V[3]),
        .I2(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ),
        .O(select_ln422_2_fu_2772_p3[3]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_2_reg_5309[2]_i_1
       (.I0(max_bin_count_0_V[2]),
        .I1(max_bin_count_32_V[2]),
        .I2(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ),
        .I3(select_ln422_50_fu_3044_p3[2]),
        .I4(\icmp_ln895_97_reg_5303[0]_i_1_n_0 ),
        .O(select_ln440_2_fu_3308_p3[2]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_2_reg_5309[2]_i_2
       (.I0(max_bin_count_16_V[2]),
        .I1(max_bin_count_48_V[2]),
        .I2(\select_ln422_49_reg_5188[6]_i_3_n_0 ),
        .I3(max_bin_count_48_V[3]),
        .I4(max_bin_count_16_V[3]),
        .O(select_ln422_50_fu_3044_p3[2]));
  LUT6 #(
    .INIT(64'hF0F0FF00EEEEEEEE))
    \select_ln440_2_reg_5309[3]_i_1
       (.I0(max_bin_count_48_V[3]),
        .I1(max_bin_count_16_V[3]),
        .I2(max_bin_count_0_V[3]),
        .I3(max_bin_count_32_V[3]),
        .I4(\icmp_ln895_65_reg_5063[0]_i_1_n_0 ),
        .I5(\icmp_ln895_97_reg_5303[0]_i_1_n_0 ),
        .O(select_ln440_2_fu_3308_p3[3]));
  FDRE \select_ln440_2_reg_5309_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_2_fu_3308_p3[0]),
        .Q(select_ln440_2_reg_5309[0]),
        .R(1'b0));
  FDRE \select_ln440_2_reg_5309_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_2_fu_3308_p3[1]),
        .Q(select_ln440_2_reg_5309[1]),
        .R(1'b0));
  FDRE \select_ln440_2_reg_5309_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_2_fu_3308_p3[2]),
        .Q(select_ln440_2_reg_5309[2]),
        .R(1'b0));
  FDRE \select_ln440_2_reg_5309_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_2_fu_3308_p3[3]),
        .Q(select_ln440_2_reg_5309[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_31_reg_5426[0]_i_1
       (.I0(max_bin_r_10_V[0]),
        .I1(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .I2(max_bin_r_42_V[0]),
        .I3(\icmp_ln895_42_reg_4953[0]_i_1_n_0 ),
        .I4(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ),
        .I5(select_ln422_79_fu_3206_p3[0]),
        .O(select_ln440_31_fu_3414_p3[0]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_31_reg_5426[0]_i_2
       (.I0(max_bin_r_26_V[0]),
        .I1(\icmp_ln895_26_reg_4873[0]_i_1_n_0 ),
        .I2(\icmp_ln895_91_reg_5273[0]_i_1_n_0 ),
        .I3(max_bin_r_58_V[0]),
        .I4(\icmp_ln895_58_reg_5033[0]_i_1_n_0 ),
        .O(select_ln422_79_fu_3206_p3[0]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_31_reg_5426[1]_i_1
       (.I0(max_bin_r_10_V[1]),
        .I1(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .I2(max_bin_r_42_V[1]),
        .I3(\icmp_ln895_42_reg_4953[0]_i_1_n_0 ),
        .I4(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ),
        .I5(select_ln422_79_fu_3206_p3[1]),
        .O(select_ln440_31_fu_3414_p3[1]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_31_reg_5426[1]_i_2
       (.I0(max_bin_r_26_V[1]),
        .I1(\icmp_ln895_26_reg_4873[0]_i_1_n_0 ),
        .I2(\icmp_ln895_91_reg_5273[0]_i_1_n_0 ),
        .I3(max_bin_r_58_V[1]),
        .I4(\icmp_ln895_58_reg_5033[0]_i_1_n_0 ),
        .O(select_ln422_79_fu_3206_p3[1]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_31_reg_5426[2]_i_1
       (.I0(max_bin_r_10_V[2]),
        .I1(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .I2(max_bin_r_42_V[2]),
        .I3(\icmp_ln895_42_reg_4953[0]_i_1_n_0 ),
        .I4(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ),
        .I5(select_ln422_79_fu_3206_p3[2]),
        .O(select_ln440_31_fu_3414_p3[2]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_31_reg_5426[2]_i_2
       (.I0(max_bin_r_26_V[2]),
        .I1(\icmp_ln895_26_reg_4873[0]_i_1_n_0 ),
        .I2(\icmp_ln895_91_reg_5273[0]_i_1_n_0 ),
        .I3(max_bin_r_58_V[2]),
        .I4(\icmp_ln895_58_reg_5033[0]_i_1_n_0 ),
        .O(select_ln422_79_fu_3206_p3[2]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_31_reg_5426[3]_i_1
       (.I0(max_bin_r_10_V[3]),
        .I1(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .I2(max_bin_r_42_V[3]),
        .I3(\icmp_ln895_42_reg_4953[0]_i_1_n_0 ),
        .I4(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ),
        .I5(select_ln422_79_fu_3206_p3[3]),
        .O(select_ln440_31_fu_3414_p3[3]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_31_reg_5426[3]_i_2
       (.I0(max_bin_r_26_V[3]),
        .I1(\icmp_ln895_26_reg_4873[0]_i_1_n_0 ),
        .I2(\icmp_ln895_91_reg_5273[0]_i_1_n_0 ),
        .I3(max_bin_r_58_V[3]),
        .I4(\icmp_ln895_58_reg_5033[0]_i_1_n_0 ),
        .O(select_ln422_79_fu_3206_p3[3]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_31_reg_5426[4]_i_1
       (.I0(max_bin_r_10_V[4]),
        .I1(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .I2(max_bin_r_42_V[4]),
        .I3(\icmp_ln895_42_reg_4953[0]_i_1_n_0 ),
        .I4(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ),
        .I5(select_ln422_79_fu_3206_p3[4]),
        .O(select_ln440_31_fu_3414_p3[4]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_31_reg_5426[4]_i_2
       (.I0(max_bin_r_26_V[4]),
        .I1(\icmp_ln895_26_reg_4873[0]_i_1_n_0 ),
        .I2(\icmp_ln895_91_reg_5273[0]_i_1_n_0 ),
        .I3(max_bin_r_58_V[4]),
        .I4(\icmp_ln895_58_reg_5033[0]_i_1_n_0 ),
        .O(select_ln422_79_fu_3206_p3[4]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_31_reg_5426[5]_i_1
       (.I0(max_bin_r_10_V[5]),
        .I1(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .I2(max_bin_r_42_V[5]),
        .I3(\icmp_ln895_42_reg_4953[0]_i_1_n_0 ),
        .I4(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ),
        .I5(select_ln422_79_fu_3206_p3[5]),
        .O(select_ln440_31_fu_3414_p3[5]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_31_reg_5426[5]_i_2
       (.I0(max_bin_r_26_V[5]),
        .I1(\icmp_ln895_26_reg_4873[0]_i_1_n_0 ),
        .I2(\icmp_ln895_91_reg_5273[0]_i_1_n_0 ),
        .I3(max_bin_r_58_V[5]),
        .I4(\icmp_ln895_58_reg_5033[0]_i_1_n_0 ),
        .O(select_ln422_79_fu_3206_p3[5]));
  LUT6 #(
    .INIT(64'h0000000200000000))
    \select_ln440_31_reg_5426[6]_i_1
       (.I0(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ),
        .I1(max_bin_count_10_V[2]),
        .I2(max_bin_count_10_V[3]),
        .I3(max_bin_count_10_V[1]),
        .I4(max_bin_count_10_V[0]),
        .I5(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .O(\select_ln440_31_reg_5426[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_31_reg_5426[6]_i_2
       (.I0(max_bin_r_10_V[6]),
        .I1(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .I2(max_bin_r_42_V[6]),
        .I3(\icmp_ln895_42_reg_4953[0]_i_1_n_0 ),
        .I4(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ),
        .I5(select_ln422_79_fu_3206_p3[6]),
        .O(select_ln440_31_fu_3414_p3[6]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_31_reg_5426[6]_i_3
       (.I0(max_bin_r_26_V[6]),
        .I1(\icmp_ln895_26_reg_4873[0]_i_1_n_0 ),
        .I2(\icmp_ln895_91_reg_5273[0]_i_1_n_0 ),
        .I3(max_bin_r_58_V[6]),
        .I4(\icmp_ln895_58_reg_5033[0]_i_1_n_0 ),
        .O(select_ln422_79_fu_3206_p3[6]));
  FDRE \select_ln440_31_reg_5426_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_31_fu_3414_p3[0]),
        .Q(\select_ln440_31_reg_5426_reg_n_0_[0] ),
        .R(\select_ln440_31_reg_5426[6]_i_1_n_0 ));
  FDRE \select_ln440_31_reg_5426_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_31_fu_3414_p3[1]),
        .Q(\select_ln440_31_reg_5426_reg_n_0_[1] ),
        .R(\select_ln440_31_reg_5426[6]_i_1_n_0 ));
  FDRE \select_ln440_31_reg_5426_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_31_fu_3414_p3[2]),
        .Q(\select_ln440_31_reg_5426_reg_n_0_[2] ),
        .R(\select_ln440_31_reg_5426[6]_i_1_n_0 ));
  FDRE \select_ln440_31_reg_5426_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_31_fu_3414_p3[3]),
        .Q(\select_ln440_31_reg_5426_reg_n_0_[3] ),
        .R(\select_ln440_31_reg_5426[6]_i_1_n_0 ));
  FDRE \select_ln440_31_reg_5426_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_31_fu_3414_p3[4]),
        .Q(\select_ln440_31_reg_5426_reg_n_0_[4] ),
        .R(\select_ln440_31_reg_5426[6]_i_1_n_0 ));
  FDRE \select_ln440_31_reg_5426_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_31_fu_3414_p3[5]),
        .Q(\select_ln440_31_reg_5426_reg_n_0_[5] ),
        .R(\select_ln440_31_reg_5426[6]_i_1_n_0 ));
  FDRE \select_ln440_31_reg_5426_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_31_fu_3414_p3[6]),
        .Q(\select_ln440_31_reg_5426_reg_n_0_[6] ),
        .R(\select_ln440_31_reg_5426[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_32_reg_5431[0]_i_1
       (.I0(max_bin_count_10_V[0]),
        .I1(max_bin_count_42_V[0]),
        .I2(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .I3(select_ln422_80_fu_3214_p3[0]),
        .I4(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ),
        .O(select_ln440_32_fu_3422_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_32_reg_5431[0]_i_2
       (.I0(max_bin_count_26_V[0]),
        .I1(max_bin_count_58_V[0]),
        .I2(\icmp_ln895_91_reg_5273[0]_i_2_n_0 ),
        .I3(max_bin_count_58_V[3]),
        .I4(max_bin_count_26_V[3]),
        .O(select_ln422_80_fu_3214_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_32_reg_5431[1]_i_1
       (.I0(select_ln422_32_fu_2942_p3[1]),
        .I1(select_ln422_80_fu_3214_p3[1]),
        .I2(\select_ln440_32_reg_5431[1]_i_4_n_0 ),
        .I3(select_ln422_80_fu_3214_p3[3]),
        .I4(select_ln422_32_fu_2942_p3[3]),
        .O(select_ln440_32_fu_3422_p3[1]));
  (* SOFT_HLUTNM = "soft_lutpair50" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_32_reg_5431[1]_i_2
       (.I0(max_bin_count_10_V[1]),
        .I1(max_bin_count_42_V[1]),
        .I2(\icmp_ln895_75_reg_5153[0]_i_2_n_0 ),
        .I3(max_bin_count_42_V[3]),
        .I4(max_bin_count_10_V[3]),
        .O(select_ln422_32_fu_2942_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_32_reg_5431[1]_i_3
       (.I0(max_bin_count_26_V[1]),
        .I1(max_bin_count_58_V[1]),
        .I2(\icmp_ln895_91_reg_5273[0]_i_2_n_0 ),
        .I3(max_bin_count_58_V[3]),
        .I4(max_bin_count_26_V[3]),
        .O(select_ln422_80_fu_3214_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_32_reg_5431[1]_i_4
       (.I0(select_ln422_32_fu_2942_p3[0]),
        .I1(select_ln422_80_fu_3214_p3[0]),
        .I2(select_ln422_80_fu_3214_p3[1]),
        .I3(select_ln422_32_fu_2942_p3[1]),
        .I4(select_ln422_80_fu_3214_p3[2]),
        .I5(select_ln422_32_fu_2942_p3[2]),
        .O(\select_ln440_32_reg_5431[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_32_reg_5431[1]_i_5
       (.I0(max_bin_count_10_V[3]),
        .I1(max_bin_count_42_V[3]),
        .I2(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .O(select_ln422_32_fu_2942_p3[3]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_32_reg_5431[1]_i_6
       (.I0(max_bin_count_10_V[0]),
        .I1(max_bin_count_42_V[0]),
        .I2(\icmp_ln895_75_reg_5153[0]_i_2_n_0 ),
        .I3(max_bin_count_42_V[3]),
        .I4(max_bin_count_10_V[3]),
        .O(select_ln422_32_fu_2942_p3[0]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_32_reg_5431[2]_i_1
       (.I0(max_bin_count_10_V[2]),
        .I1(max_bin_count_42_V[2]),
        .I2(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .I3(select_ln422_80_fu_3214_p3[2]),
        .I4(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ),
        .O(select_ln440_32_fu_3422_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair46" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_32_reg_5431[2]_i_2
       (.I0(max_bin_count_26_V[2]),
        .I1(max_bin_count_58_V[2]),
        .I2(\icmp_ln895_91_reg_5273[0]_i_2_n_0 ),
        .I3(max_bin_count_58_V[3]),
        .I4(max_bin_count_26_V[3]),
        .O(select_ln422_80_fu_3214_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair42" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_32_reg_5431[3]_i_1
       (.I0(max_bin_count_10_V[3]),
        .I1(max_bin_count_42_V[3]),
        .I2(\icmp_ln895_75_reg_5153[0]_i_1_n_0 ),
        .I3(select_ln422_80_fu_3214_p3[3]),
        .I4(\icmp_ln895_107_reg_5421[0]_i_1_n_0 ),
        .O(select_ln440_32_fu_3422_p3[3]));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_32_reg_5431[3]_i_2
       (.I0(max_bin_count_26_V[3]),
        .I1(max_bin_count_58_V[3]),
        .I2(\icmp_ln895_91_reg_5273[0]_i_1_n_0 ),
        .O(select_ln422_80_fu_3214_p3[3]));
  FDRE \select_ln440_32_reg_5431_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_32_fu_3422_p3[0]),
        .Q(select_ln440_32_reg_5431[0]),
        .R(1'b0));
  FDRE \select_ln440_32_reg_5431_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_32_fu_3422_p3[1]),
        .Q(select_ln440_32_reg_5431[1]),
        .R(1'b0));
  FDRE \select_ln440_32_reg_5431_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_32_fu_3422_p3[2]),
        .Q(select_ln440_32_reg_5431[2]),
        .R(1'b0));
  FDRE \select_ln440_32_reg_5431_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_32_fu_3422_p3[3]),
        .Q(select_ln440_32_reg_5431[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_34_reg_5441[0]_i_1
       (.I0(max_bin_r_11_V[0]),
        .I1(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .I2(max_bin_r_43_V[0]),
        .I3(\icmp_ln895_43_reg_4958[0]_i_1_n_0 ),
        .I4(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ),
        .I5(select_ln422_82_fu_3223_p3[0]),
        .O(select_ln440_34_fu_3431_p3[0]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_34_reg_5441[0]_i_2
       (.I0(max_bin_r_27_V[0]),
        .I1(\icmp_ln895_27_reg_4878[0]_i_1_n_0 ),
        .I2(\icmp_ln895_92_reg_5278[0]_i_1_n_0 ),
        .I3(max_bin_r_59_V[0]),
        .I4(\icmp_ln895_59_reg_5038[0]_i_1_n_0 ),
        .O(select_ln422_82_fu_3223_p3[0]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_34_reg_5441[1]_i_1
       (.I0(max_bin_r_11_V[1]),
        .I1(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .I2(max_bin_r_43_V[1]),
        .I3(\icmp_ln895_43_reg_4958[0]_i_1_n_0 ),
        .I4(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ),
        .I5(select_ln422_82_fu_3223_p3[1]),
        .O(select_ln440_34_fu_3431_p3[1]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_34_reg_5441[1]_i_2
       (.I0(max_bin_r_27_V[1]),
        .I1(\icmp_ln895_27_reg_4878[0]_i_1_n_0 ),
        .I2(\icmp_ln895_92_reg_5278[0]_i_1_n_0 ),
        .I3(max_bin_r_59_V[1]),
        .I4(\icmp_ln895_59_reg_5038[0]_i_1_n_0 ),
        .O(select_ln422_82_fu_3223_p3[1]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_34_reg_5441[2]_i_1
       (.I0(max_bin_r_11_V[2]),
        .I1(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .I2(max_bin_r_43_V[2]),
        .I3(\icmp_ln895_43_reg_4958[0]_i_1_n_0 ),
        .I4(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ),
        .I5(select_ln422_82_fu_3223_p3[2]),
        .O(select_ln440_34_fu_3431_p3[2]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_34_reg_5441[2]_i_2
       (.I0(max_bin_r_27_V[2]),
        .I1(\icmp_ln895_27_reg_4878[0]_i_1_n_0 ),
        .I2(\icmp_ln895_92_reg_5278[0]_i_1_n_0 ),
        .I3(max_bin_r_59_V[2]),
        .I4(\icmp_ln895_59_reg_5038[0]_i_1_n_0 ),
        .O(select_ln422_82_fu_3223_p3[2]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_34_reg_5441[3]_i_1
       (.I0(max_bin_r_11_V[3]),
        .I1(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .I2(max_bin_r_43_V[3]),
        .I3(\icmp_ln895_43_reg_4958[0]_i_1_n_0 ),
        .I4(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ),
        .I5(select_ln422_82_fu_3223_p3[3]),
        .O(select_ln440_34_fu_3431_p3[3]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_34_reg_5441[3]_i_2
       (.I0(max_bin_r_27_V[3]),
        .I1(\icmp_ln895_27_reg_4878[0]_i_1_n_0 ),
        .I2(\icmp_ln895_92_reg_5278[0]_i_1_n_0 ),
        .I3(max_bin_r_59_V[3]),
        .I4(\icmp_ln895_59_reg_5038[0]_i_1_n_0 ),
        .O(select_ln422_82_fu_3223_p3[3]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_34_reg_5441[4]_i_1
       (.I0(max_bin_r_11_V[4]),
        .I1(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .I2(max_bin_r_43_V[4]),
        .I3(\icmp_ln895_43_reg_4958[0]_i_1_n_0 ),
        .I4(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ),
        .I5(select_ln422_82_fu_3223_p3[4]),
        .O(select_ln440_34_fu_3431_p3[4]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_34_reg_5441[4]_i_2
       (.I0(max_bin_r_27_V[4]),
        .I1(\icmp_ln895_27_reg_4878[0]_i_1_n_0 ),
        .I2(\icmp_ln895_92_reg_5278[0]_i_1_n_0 ),
        .I3(max_bin_r_59_V[4]),
        .I4(\icmp_ln895_59_reg_5038[0]_i_1_n_0 ),
        .O(select_ln422_82_fu_3223_p3[4]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_34_reg_5441[5]_i_1
       (.I0(max_bin_r_11_V[5]),
        .I1(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .I2(max_bin_r_43_V[5]),
        .I3(\icmp_ln895_43_reg_4958[0]_i_1_n_0 ),
        .I4(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ),
        .I5(select_ln422_82_fu_3223_p3[5]),
        .O(select_ln440_34_fu_3431_p3[5]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_34_reg_5441[5]_i_2
       (.I0(max_bin_r_27_V[5]),
        .I1(\icmp_ln895_27_reg_4878[0]_i_1_n_0 ),
        .I2(\icmp_ln895_92_reg_5278[0]_i_1_n_0 ),
        .I3(max_bin_r_59_V[5]),
        .I4(\icmp_ln895_59_reg_5038[0]_i_1_n_0 ),
        .O(select_ln422_82_fu_3223_p3[5]));
  LUT6 #(
    .INIT(64'h0000000200000000))
    \select_ln440_34_reg_5441[6]_i_1
       (.I0(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ),
        .I1(max_bin_count_11_V[2]),
        .I2(max_bin_count_11_V[3]),
        .I3(max_bin_count_11_V[1]),
        .I4(max_bin_count_11_V[0]),
        .I5(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .O(\select_ln440_34_reg_5441[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_34_reg_5441[6]_i_2
       (.I0(max_bin_r_11_V[6]),
        .I1(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .I2(max_bin_r_43_V[6]),
        .I3(\icmp_ln895_43_reg_4958[0]_i_1_n_0 ),
        .I4(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ),
        .I5(select_ln422_82_fu_3223_p3[6]),
        .O(select_ln440_34_fu_3431_p3[6]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_34_reg_5441[6]_i_3
       (.I0(max_bin_r_27_V[6]),
        .I1(\icmp_ln895_27_reg_4878[0]_i_1_n_0 ),
        .I2(\icmp_ln895_92_reg_5278[0]_i_1_n_0 ),
        .I3(max_bin_r_59_V[6]),
        .I4(\icmp_ln895_59_reg_5038[0]_i_1_n_0 ),
        .O(select_ln422_82_fu_3223_p3[6]));
  FDRE \select_ln440_34_reg_5441_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_34_fu_3431_p3[0]),
        .Q(\select_ln440_34_reg_5441_reg_n_0_[0] ),
        .R(\select_ln440_34_reg_5441[6]_i_1_n_0 ));
  FDRE \select_ln440_34_reg_5441_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_34_fu_3431_p3[1]),
        .Q(\select_ln440_34_reg_5441_reg_n_0_[1] ),
        .R(\select_ln440_34_reg_5441[6]_i_1_n_0 ));
  FDRE \select_ln440_34_reg_5441_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_34_fu_3431_p3[2]),
        .Q(\select_ln440_34_reg_5441_reg_n_0_[2] ),
        .R(\select_ln440_34_reg_5441[6]_i_1_n_0 ));
  FDRE \select_ln440_34_reg_5441_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_34_fu_3431_p3[3]),
        .Q(\select_ln440_34_reg_5441_reg_n_0_[3] ),
        .R(\select_ln440_34_reg_5441[6]_i_1_n_0 ));
  FDRE \select_ln440_34_reg_5441_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_34_fu_3431_p3[4]),
        .Q(\select_ln440_34_reg_5441_reg_n_0_[4] ),
        .R(\select_ln440_34_reg_5441[6]_i_1_n_0 ));
  FDRE \select_ln440_34_reg_5441_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_34_fu_3431_p3[5]),
        .Q(\select_ln440_34_reg_5441_reg_n_0_[5] ),
        .R(\select_ln440_34_reg_5441[6]_i_1_n_0 ));
  FDRE \select_ln440_34_reg_5441_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_34_fu_3431_p3[6]),
        .Q(\select_ln440_34_reg_5441_reg_n_0_[6] ),
        .R(\select_ln440_34_reg_5441[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_35_reg_5446[0]_i_1
       (.I0(max_bin_count_11_V[0]),
        .I1(max_bin_count_43_V[0]),
        .I2(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .I3(select_ln422_83_fu_3231_p3[0]),
        .I4(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ),
        .O(select_ln440_35_fu_3439_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_35_reg_5446[0]_i_2
       (.I0(max_bin_count_27_V[0]),
        .I1(max_bin_count_59_V[0]),
        .I2(\icmp_ln895_92_reg_5278[0]_i_2_n_0 ),
        .I3(max_bin_count_59_V[3]),
        .I4(max_bin_count_27_V[3]),
        .O(select_ln422_83_fu_3231_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_35_reg_5446[1]_i_1
       (.I0(select_ln422_35_fu_2959_p3[1]),
        .I1(select_ln422_83_fu_3231_p3[1]),
        .I2(\select_ln440_35_reg_5446[1]_i_4_n_0 ),
        .I3(select_ln422_83_fu_3231_p3[3]),
        .I4(select_ln422_35_fu_2959_p3[3]),
        .O(select_ln440_35_fu_3439_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_35_reg_5446[1]_i_2
       (.I0(max_bin_count_11_V[1]),
        .I1(max_bin_count_43_V[1]),
        .I2(\icmp_ln895_76_reg_5158[0]_i_2_n_0 ),
        .I3(max_bin_count_43_V[3]),
        .I4(max_bin_count_11_V[3]),
        .O(select_ln422_35_fu_2959_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_35_reg_5446[1]_i_3
       (.I0(max_bin_count_27_V[1]),
        .I1(max_bin_count_59_V[1]),
        .I2(\icmp_ln895_92_reg_5278[0]_i_2_n_0 ),
        .I3(max_bin_count_59_V[3]),
        .I4(max_bin_count_27_V[3]),
        .O(select_ln422_83_fu_3231_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_35_reg_5446[1]_i_4
       (.I0(select_ln422_35_fu_2959_p3[0]),
        .I1(select_ln422_83_fu_3231_p3[0]),
        .I2(select_ln422_83_fu_3231_p3[1]),
        .I3(select_ln422_35_fu_2959_p3[1]),
        .I4(select_ln422_83_fu_3231_p3[2]),
        .I5(select_ln422_35_fu_2959_p3[2]),
        .O(\select_ln440_35_reg_5446[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_35_reg_5446[1]_i_5
       (.I0(max_bin_count_11_V[3]),
        .I1(max_bin_count_43_V[3]),
        .I2(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .O(select_ln422_35_fu_2959_p3[3]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_35_reg_5446[1]_i_6
       (.I0(max_bin_count_11_V[0]),
        .I1(max_bin_count_43_V[0]),
        .I2(\icmp_ln895_76_reg_5158[0]_i_2_n_0 ),
        .I3(max_bin_count_43_V[3]),
        .I4(max_bin_count_11_V[3]),
        .O(select_ln422_35_fu_2959_p3[0]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_35_reg_5446[2]_i_1
       (.I0(max_bin_count_11_V[2]),
        .I1(max_bin_count_43_V[2]),
        .I2(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .I3(select_ln422_83_fu_3231_p3[2]),
        .I4(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ),
        .O(select_ln440_35_fu_3439_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_35_reg_5446[2]_i_2
       (.I0(max_bin_count_27_V[2]),
        .I1(max_bin_count_59_V[2]),
        .I2(\icmp_ln895_92_reg_5278[0]_i_2_n_0 ),
        .I3(max_bin_count_59_V[3]),
        .I4(max_bin_count_27_V[3]),
        .O(select_ln422_83_fu_3231_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair25" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_35_reg_5446[3]_i_1
       (.I0(max_bin_count_11_V[3]),
        .I1(max_bin_count_43_V[3]),
        .I2(\icmp_ln895_76_reg_5158[0]_i_1_n_0 ),
        .I3(select_ln422_83_fu_3231_p3[3]),
        .I4(\icmp_ln895_108_reg_5436[0]_i_1_n_0 ),
        .O(select_ln440_35_fu_3439_p3[3]));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_35_reg_5446[3]_i_2
       (.I0(max_bin_count_27_V[3]),
        .I1(max_bin_count_59_V[3]),
        .I2(\icmp_ln895_92_reg_5278[0]_i_1_n_0 ),
        .O(select_ln422_83_fu_3231_p3[3]));
  FDRE \select_ln440_35_reg_5446_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_35_fu_3439_p3[0]),
        .Q(select_ln440_35_reg_5446[0]),
        .R(1'b0));
  FDRE \select_ln440_35_reg_5446_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_35_fu_3439_p3[1]),
        .Q(select_ln440_35_reg_5446[1]),
        .R(1'b0));
  FDRE \select_ln440_35_reg_5446_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_35_fu_3439_p3[2]),
        .Q(select_ln440_35_reg_5446[2]),
        .R(1'b0));
  FDRE \select_ln440_35_reg_5446_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_35_fu_3439_p3[3]),
        .Q(select_ln440_35_reg_5446[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_37_reg_5456[0]_i_1
       (.I0(max_bin_r_12_V[0]),
        .I1(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .I2(max_bin_r_44_V[0]),
        .I3(\icmp_ln895_44_reg_4963[0]_i_1_n_0 ),
        .I4(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ),
        .I5(select_ln422_85_fu_3240_p3[0]),
        .O(select_ln440_37_fu_3448_p3[0]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_37_reg_5456[0]_i_2
       (.I0(max_bin_r_28_V[0]),
        .I1(\icmp_ln895_28_reg_4883[0]_i_1_n_0 ),
        .I2(\icmp_ln895_93_reg_5283[0]_i_1_n_0 ),
        .I3(max_bin_r_60_V[0]),
        .I4(\icmp_ln895_60_reg_5043[0]_i_1_n_0 ),
        .O(select_ln422_85_fu_3240_p3[0]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_37_reg_5456[1]_i_1
       (.I0(max_bin_r_12_V[1]),
        .I1(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .I2(max_bin_r_44_V[1]),
        .I3(\icmp_ln895_44_reg_4963[0]_i_1_n_0 ),
        .I4(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ),
        .I5(select_ln422_85_fu_3240_p3[1]),
        .O(select_ln440_37_fu_3448_p3[1]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_37_reg_5456[1]_i_2
       (.I0(max_bin_r_28_V[1]),
        .I1(\icmp_ln895_28_reg_4883[0]_i_1_n_0 ),
        .I2(\icmp_ln895_93_reg_5283[0]_i_1_n_0 ),
        .I3(max_bin_r_60_V[1]),
        .I4(\icmp_ln895_60_reg_5043[0]_i_1_n_0 ),
        .O(select_ln422_85_fu_3240_p3[1]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_37_reg_5456[2]_i_1
       (.I0(max_bin_r_12_V[2]),
        .I1(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .I2(max_bin_r_44_V[2]),
        .I3(\icmp_ln895_44_reg_4963[0]_i_1_n_0 ),
        .I4(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ),
        .I5(select_ln422_85_fu_3240_p3[2]),
        .O(select_ln440_37_fu_3448_p3[2]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_37_reg_5456[2]_i_2
       (.I0(max_bin_r_28_V[2]),
        .I1(\icmp_ln895_28_reg_4883[0]_i_1_n_0 ),
        .I2(\icmp_ln895_93_reg_5283[0]_i_1_n_0 ),
        .I3(max_bin_r_60_V[2]),
        .I4(\icmp_ln895_60_reg_5043[0]_i_1_n_0 ),
        .O(select_ln422_85_fu_3240_p3[2]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_37_reg_5456[3]_i_1
       (.I0(max_bin_r_12_V[3]),
        .I1(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .I2(max_bin_r_44_V[3]),
        .I3(\icmp_ln895_44_reg_4963[0]_i_1_n_0 ),
        .I4(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ),
        .I5(select_ln422_85_fu_3240_p3[3]),
        .O(select_ln440_37_fu_3448_p3[3]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_37_reg_5456[3]_i_2
       (.I0(max_bin_r_28_V[3]),
        .I1(\icmp_ln895_28_reg_4883[0]_i_1_n_0 ),
        .I2(\icmp_ln895_93_reg_5283[0]_i_1_n_0 ),
        .I3(max_bin_r_60_V[3]),
        .I4(\icmp_ln895_60_reg_5043[0]_i_1_n_0 ),
        .O(select_ln422_85_fu_3240_p3[3]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_37_reg_5456[4]_i_1
       (.I0(max_bin_r_12_V[4]),
        .I1(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .I2(max_bin_r_44_V[4]),
        .I3(\icmp_ln895_44_reg_4963[0]_i_1_n_0 ),
        .I4(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ),
        .I5(select_ln422_85_fu_3240_p3[4]),
        .O(select_ln440_37_fu_3448_p3[4]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_37_reg_5456[4]_i_2
       (.I0(max_bin_r_28_V[4]),
        .I1(\icmp_ln895_28_reg_4883[0]_i_1_n_0 ),
        .I2(\icmp_ln895_93_reg_5283[0]_i_1_n_0 ),
        .I3(max_bin_r_60_V[4]),
        .I4(\icmp_ln895_60_reg_5043[0]_i_1_n_0 ),
        .O(select_ln422_85_fu_3240_p3[4]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_37_reg_5456[5]_i_1
       (.I0(max_bin_r_12_V[5]),
        .I1(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .I2(max_bin_r_44_V[5]),
        .I3(\icmp_ln895_44_reg_4963[0]_i_1_n_0 ),
        .I4(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ),
        .I5(select_ln422_85_fu_3240_p3[5]),
        .O(select_ln440_37_fu_3448_p3[5]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_37_reg_5456[5]_i_2
       (.I0(max_bin_r_28_V[5]),
        .I1(\icmp_ln895_28_reg_4883[0]_i_1_n_0 ),
        .I2(\icmp_ln895_93_reg_5283[0]_i_1_n_0 ),
        .I3(max_bin_r_60_V[5]),
        .I4(\icmp_ln895_60_reg_5043[0]_i_1_n_0 ),
        .O(select_ln422_85_fu_3240_p3[5]));
  LUT6 #(
    .INIT(64'h0000000200000000))
    \select_ln440_37_reg_5456[6]_i_1
       (.I0(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ),
        .I1(max_bin_count_12_V[2]),
        .I2(max_bin_count_12_V[3]),
        .I3(max_bin_count_12_V[1]),
        .I4(max_bin_count_12_V[0]),
        .I5(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .O(\select_ln440_37_reg_5456[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_37_reg_5456[6]_i_2
       (.I0(max_bin_r_12_V[6]),
        .I1(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .I2(max_bin_r_44_V[6]),
        .I3(\icmp_ln895_44_reg_4963[0]_i_1_n_0 ),
        .I4(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ),
        .I5(select_ln422_85_fu_3240_p3[6]),
        .O(select_ln440_37_fu_3448_p3[6]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_37_reg_5456[6]_i_3
       (.I0(max_bin_r_28_V[6]),
        .I1(\icmp_ln895_28_reg_4883[0]_i_1_n_0 ),
        .I2(\icmp_ln895_93_reg_5283[0]_i_1_n_0 ),
        .I3(max_bin_r_60_V[6]),
        .I4(\icmp_ln895_60_reg_5043[0]_i_1_n_0 ),
        .O(select_ln422_85_fu_3240_p3[6]));
  FDRE \select_ln440_37_reg_5456_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_37_fu_3448_p3[0]),
        .Q(\select_ln440_37_reg_5456_reg_n_0_[0] ),
        .R(\select_ln440_37_reg_5456[6]_i_1_n_0 ));
  FDRE \select_ln440_37_reg_5456_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_37_fu_3448_p3[1]),
        .Q(\select_ln440_37_reg_5456_reg_n_0_[1] ),
        .R(\select_ln440_37_reg_5456[6]_i_1_n_0 ));
  FDRE \select_ln440_37_reg_5456_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_37_fu_3448_p3[2]),
        .Q(\select_ln440_37_reg_5456_reg_n_0_[2] ),
        .R(\select_ln440_37_reg_5456[6]_i_1_n_0 ));
  FDRE \select_ln440_37_reg_5456_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_37_fu_3448_p3[3]),
        .Q(\select_ln440_37_reg_5456_reg_n_0_[3] ),
        .R(\select_ln440_37_reg_5456[6]_i_1_n_0 ));
  FDRE \select_ln440_37_reg_5456_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_37_fu_3448_p3[4]),
        .Q(\select_ln440_37_reg_5456_reg_n_0_[4] ),
        .R(\select_ln440_37_reg_5456[6]_i_1_n_0 ));
  FDRE \select_ln440_37_reg_5456_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_37_fu_3448_p3[5]),
        .Q(\select_ln440_37_reg_5456_reg_n_0_[5] ),
        .R(\select_ln440_37_reg_5456[6]_i_1_n_0 ));
  FDRE \select_ln440_37_reg_5456_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_37_fu_3448_p3[6]),
        .Q(\select_ln440_37_reg_5456_reg_n_0_[6] ),
        .R(\select_ln440_37_reg_5456[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_38_reg_5461[0]_i_1
       (.I0(max_bin_count_12_V[0]),
        .I1(max_bin_count_44_V[0]),
        .I2(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .I3(select_ln422_86_fu_3248_p3[0]),
        .I4(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ),
        .O(select_ln440_38_fu_3456_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair33" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_38_reg_5461[0]_i_2
       (.I0(max_bin_count_28_V[0]),
        .I1(max_bin_count_60_V[0]),
        .I2(\icmp_ln895_93_reg_5283[0]_i_2_n_0 ),
        .I3(max_bin_count_60_V[3]),
        .I4(max_bin_count_28_V[3]),
        .O(select_ln422_86_fu_3248_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_38_reg_5461[1]_i_1
       (.I0(select_ln422_38_fu_2976_p3[1]),
        .I1(select_ln422_86_fu_3248_p3[1]),
        .I2(\select_ln440_38_reg_5461[1]_i_4_n_0 ),
        .I3(select_ln422_86_fu_3248_p3[3]),
        .I4(select_ln422_38_fu_2976_p3[3]),
        .O(select_ln440_38_fu_3456_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_38_reg_5461[1]_i_2
       (.I0(max_bin_count_12_V[1]),
        .I1(max_bin_count_44_V[1]),
        .I2(\icmp_ln895_77_reg_5163[0]_i_2_n_0 ),
        .I3(max_bin_count_44_V[3]),
        .I4(max_bin_count_12_V[3]),
        .O(select_ln422_38_fu_2976_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_38_reg_5461[1]_i_3
       (.I0(max_bin_count_28_V[1]),
        .I1(max_bin_count_60_V[1]),
        .I2(\icmp_ln895_93_reg_5283[0]_i_2_n_0 ),
        .I3(max_bin_count_60_V[3]),
        .I4(max_bin_count_28_V[3]),
        .O(select_ln422_86_fu_3248_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_38_reg_5461[1]_i_4
       (.I0(select_ln422_38_fu_2976_p3[0]),
        .I1(select_ln422_86_fu_3248_p3[0]),
        .I2(select_ln422_86_fu_3248_p3[1]),
        .I3(select_ln422_38_fu_2976_p3[1]),
        .I4(select_ln422_86_fu_3248_p3[2]),
        .I5(select_ln422_38_fu_2976_p3[2]),
        .O(\select_ln440_38_reg_5461[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_38_reg_5461[1]_i_5
       (.I0(max_bin_count_12_V[3]),
        .I1(max_bin_count_44_V[3]),
        .I2(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .O(select_ln422_38_fu_2976_p3[3]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_38_reg_5461[1]_i_6
       (.I0(max_bin_count_12_V[0]),
        .I1(max_bin_count_44_V[0]),
        .I2(\icmp_ln895_77_reg_5163[0]_i_2_n_0 ),
        .I3(max_bin_count_44_V[3]),
        .I4(max_bin_count_12_V[3]),
        .O(select_ln422_38_fu_2976_p3[0]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_38_reg_5461[2]_i_1
       (.I0(max_bin_count_12_V[2]),
        .I1(max_bin_count_44_V[2]),
        .I2(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .I3(select_ln422_86_fu_3248_p3[2]),
        .I4(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ),
        .O(select_ln440_38_fu_3456_p3[2]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_38_reg_5461[2]_i_2
       (.I0(max_bin_count_28_V[2]),
        .I1(max_bin_count_60_V[2]),
        .I2(\icmp_ln895_93_reg_5283[0]_i_2_n_0 ),
        .I3(max_bin_count_60_V[3]),
        .I4(max_bin_count_28_V[3]),
        .O(select_ln422_86_fu_3248_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair40" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_38_reg_5461[3]_i_1
       (.I0(max_bin_count_12_V[3]),
        .I1(max_bin_count_44_V[3]),
        .I2(\icmp_ln895_77_reg_5163[0]_i_1_n_0 ),
        .I3(select_ln422_86_fu_3248_p3[3]),
        .I4(\icmp_ln895_109_reg_5451[0]_i_1_n_0 ),
        .O(select_ln440_38_fu_3456_p3[3]));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_38_reg_5461[3]_i_2
       (.I0(max_bin_count_28_V[3]),
        .I1(max_bin_count_60_V[3]),
        .I2(\icmp_ln895_93_reg_5283[0]_i_1_n_0 ),
        .O(select_ln422_86_fu_3248_p3[3]));
  FDRE \select_ln440_38_reg_5461_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_38_fu_3456_p3[0]),
        .Q(select_ln440_38_reg_5461[0]),
        .R(1'b0));
  FDRE \select_ln440_38_reg_5461_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_38_fu_3456_p3[1]),
        .Q(select_ln440_38_reg_5461[1]),
        .R(1'b0));
  FDRE \select_ln440_38_reg_5461_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_38_fu_3456_p3[2]),
        .Q(select_ln440_38_reg_5461[2]),
        .R(1'b0));
  FDRE \select_ln440_38_reg_5461_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_38_fu_3456_p3[3]),
        .Q(select_ln440_38_reg_5461[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_40_reg_5471[0]_i_1
       (.I0(max_bin_r_13_V[0]),
        .I1(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .I2(max_bin_r_45_V[0]),
        .I3(\icmp_ln895_45_reg_4968[0]_i_1_n_0 ),
        .I4(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ),
        .I5(select_ln422_88_fu_3257_p3[0]),
        .O(select_ln440_40_fu_3465_p3[0]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_40_reg_5471[0]_i_2
       (.I0(max_bin_r_29_V[0]),
        .I1(\icmp_ln895_29_reg_4888[0]_i_1_n_0 ),
        .I2(\icmp_ln895_94_reg_5288[0]_i_1_n_0 ),
        .I3(max_bin_r_61_V[0]),
        .I4(\icmp_ln895_61_reg_5048[0]_i_1_n_0 ),
        .O(select_ln422_88_fu_3257_p3[0]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_40_reg_5471[1]_i_1
       (.I0(max_bin_r_13_V[1]),
        .I1(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .I2(max_bin_r_45_V[1]),
        .I3(\icmp_ln895_45_reg_4968[0]_i_1_n_0 ),
        .I4(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ),
        .I5(select_ln422_88_fu_3257_p3[1]),
        .O(select_ln440_40_fu_3465_p3[1]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_40_reg_5471[1]_i_2
       (.I0(max_bin_r_29_V[1]),
        .I1(\icmp_ln895_29_reg_4888[0]_i_1_n_0 ),
        .I2(\icmp_ln895_94_reg_5288[0]_i_1_n_0 ),
        .I3(max_bin_r_61_V[1]),
        .I4(\icmp_ln895_61_reg_5048[0]_i_1_n_0 ),
        .O(select_ln422_88_fu_3257_p3[1]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_40_reg_5471[2]_i_1
       (.I0(max_bin_r_13_V[2]),
        .I1(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .I2(max_bin_r_45_V[2]),
        .I3(\icmp_ln895_45_reg_4968[0]_i_1_n_0 ),
        .I4(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ),
        .I5(select_ln422_88_fu_3257_p3[2]),
        .O(select_ln440_40_fu_3465_p3[2]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_40_reg_5471[2]_i_2
       (.I0(max_bin_r_29_V[2]),
        .I1(\icmp_ln895_29_reg_4888[0]_i_1_n_0 ),
        .I2(\icmp_ln895_94_reg_5288[0]_i_1_n_0 ),
        .I3(max_bin_r_61_V[2]),
        .I4(\icmp_ln895_61_reg_5048[0]_i_1_n_0 ),
        .O(select_ln422_88_fu_3257_p3[2]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_40_reg_5471[3]_i_1
       (.I0(max_bin_r_13_V[3]),
        .I1(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .I2(max_bin_r_45_V[3]),
        .I3(\icmp_ln895_45_reg_4968[0]_i_1_n_0 ),
        .I4(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ),
        .I5(select_ln422_88_fu_3257_p3[3]),
        .O(select_ln440_40_fu_3465_p3[3]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_40_reg_5471[3]_i_2
       (.I0(max_bin_r_29_V[3]),
        .I1(\icmp_ln895_29_reg_4888[0]_i_1_n_0 ),
        .I2(\icmp_ln895_94_reg_5288[0]_i_1_n_0 ),
        .I3(max_bin_r_61_V[3]),
        .I4(\icmp_ln895_61_reg_5048[0]_i_1_n_0 ),
        .O(select_ln422_88_fu_3257_p3[3]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_40_reg_5471[4]_i_1
       (.I0(max_bin_r_13_V[4]),
        .I1(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .I2(max_bin_r_45_V[4]),
        .I3(\icmp_ln895_45_reg_4968[0]_i_1_n_0 ),
        .I4(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ),
        .I5(select_ln422_88_fu_3257_p3[4]),
        .O(select_ln440_40_fu_3465_p3[4]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_40_reg_5471[4]_i_2
       (.I0(max_bin_r_29_V[4]),
        .I1(\icmp_ln895_29_reg_4888[0]_i_1_n_0 ),
        .I2(\icmp_ln895_94_reg_5288[0]_i_1_n_0 ),
        .I3(max_bin_r_61_V[4]),
        .I4(\icmp_ln895_61_reg_5048[0]_i_1_n_0 ),
        .O(select_ln422_88_fu_3257_p3[4]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_40_reg_5471[5]_i_1
       (.I0(max_bin_r_13_V[5]),
        .I1(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .I2(max_bin_r_45_V[5]),
        .I3(\icmp_ln895_45_reg_4968[0]_i_1_n_0 ),
        .I4(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ),
        .I5(select_ln422_88_fu_3257_p3[5]),
        .O(select_ln440_40_fu_3465_p3[5]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_40_reg_5471[5]_i_2
       (.I0(max_bin_r_29_V[5]),
        .I1(\icmp_ln895_29_reg_4888[0]_i_1_n_0 ),
        .I2(\icmp_ln895_94_reg_5288[0]_i_1_n_0 ),
        .I3(max_bin_r_61_V[5]),
        .I4(\icmp_ln895_61_reg_5048[0]_i_1_n_0 ),
        .O(select_ln422_88_fu_3257_p3[5]));
  LUT6 #(
    .INIT(64'h0000000200000000))
    \select_ln440_40_reg_5471[6]_i_1
       (.I0(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ),
        .I1(max_bin_count_13_V[2]),
        .I2(max_bin_count_13_V[3]),
        .I3(max_bin_count_13_V[1]),
        .I4(max_bin_count_13_V[0]),
        .I5(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .O(\select_ln440_40_reg_5471[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_40_reg_5471[6]_i_2
       (.I0(max_bin_r_13_V[6]),
        .I1(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .I2(max_bin_r_45_V[6]),
        .I3(\icmp_ln895_45_reg_4968[0]_i_1_n_0 ),
        .I4(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ),
        .I5(select_ln422_88_fu_3257_p3[6]),
        .O(select_ln440_40_fu_3465_p3[6]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_40_reg_5471[6]_i_3
       (.I0(max_bin_r_29_V[6]),
        .I1(\icmp_ln895_29_reg_4888[0]_i_1_n_0 ),
        .I2(\icmp_ln895_94_reg_5288[0]_i_1_n_0 ),
        .I3(max_bin_r_61_V[6]),
        .I4(\icmp_ln895_61_reg_5048[0]_i_1_n_0 ),
        .O(select_ln422_88_fu_3257_p3[6]));
  FDRE \select_ln440_40_reg_5471_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_40_fu_3465_p3[0]),
        .Q(\select_ln440_40_reg_5471_reg_n_0_[0] ),
        .R(\select_ln440_40_reg_5471[6]_i_1_n_0 ));
  FDRE \select_ln440_40_reg_5471_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_40_fu_3465_p3[1]),
        .Q(\select_ln440_40_reg_5471_reg_n_0_[1] ),
        .R(\select_ln440_40_reg_5471[6]_i_1_n_0 ));
  FDRE \select_ln440_40_reg_5471_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_40_fu_3465_p3[2]),
        .Q(\select_ln440_40_reg_5471_reg_n_0_[2] ),
        .R(\select_ln440_40_reg_5471[6]_i_1_n_0 ));
  FDRE \select_ln440_40_reg_5471_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_40_fu_3465_p3[3]),
        .Q(\select_ln440_40_reg_5471_reg_n_0_[3] ),
        .R(\select_ln440_40_reg_5471[6]_i_1_n_0 ));
  FDRE \select_ln440_40_reg_5471_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_40_fu_3465_p3[4]),
        .Q(\select_ln440_40_reg_5471_reg_n_0_[4] ),
        .R(\select_ln440_40_reg_5471[6]_i_1_n_0 ));
  FDRE \select_ln440_40_reg_5471_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_40_fu_3465_p3[5]),
        .Q(\select_ln440_40_reg_5471_reg_n_0_[5] ),
        .R(\select_ln440_40_reg_5471[6]_i_1_n_0 ));
  FDRE \select_ln440_40_reg_5471_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_40_fu_3465_p3[6]),
        .Q(\select_ln440_40_reg_5471_reg_n_0_[6] ),
        .R(\select_ln440_40_reg_5471[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_41_reg_5476[0]_i_1
       (.I0(max_bin_count_13_V[0]),
        .I1(max_bin_count_45_V[0]),
        .I2(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .I3(select_ln422_89_fu_3265_p3[0]),
        .I4(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ),
        .O(select_ln440_41_fu_3473_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_41_reg_5476[0]_i_2
       (.I0(max_bin_count_29_V[0]),
        .I1(max_bin_count_61_V[0]),
        .I2(\icmp_ln895_94_reg_5288[0]_i_2_n_0 ),
        .I3(max_bin_count_61_V[3]),
        .I4(max_bin_count_29_V[3]),
        .O(select_ln422_89_fu_3265_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_41_reg_5476[1]_i_1
       (.I0(select_ln422_41_fu_2993_p3[1]),
        .I1(select_ln422_89_fu_3265_p3[1]),
        .I2(\select_ln440_41_reg_5476[1]_i_4_n_0 ),
        .I3(select_ln422_89_fu_3265_p3[3]),
        .I4(select_ln422_41_fu_2993_p3[3]),
        .O(select_ln440_41_fu_3473_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_41_reg_5476[1]_i_2
       (.I0(max_bin_count_13_V[1]),
        .I1(max_bin_count_45_V[1]),
        .I2(\icmp_ln895_78_reg_5168[0]_i_2_n_0 ),
        .I3(max_bin_count_45_V[3]),
        .I4(max_bin_count_13_V[3]),
        .O(select_ln422_41_fu_2993_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_41_reg_5476[1]_i_3
       (.I0(max_bin_count_29_V[1]),
        .I1(max_bin_count_61_V[1]),
        .I2(\icmp_ln895_94_reg_5288[0]_i_2_n_0 ),
        .I3(max_bin_count_61_V[3]),
        .I4(max_bin_count_29_V[3]),
        .O(select_ln422_89_fu_3265_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_41_reg_5476[1]_i_4
       (.I0(select_ln422_41_fu_2993_p3[0]),
        .I1(select_ln422_89_fu_3265_p3[0]),
        .I2(select_ln422_89_fu_3265_p3[1]),
        .I3(select_ln422_41_fu_2993_p3[1]),
        .I4(select_ln422_89_fu_3265_p3[2]),
        .I5(select_ln422_41_fu_2993_p3[2]),
        .O(\select_ln440_41_reg_5476[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_41_reg_5476[1]_i_5
       (.I0(max_bin_count_13_V[3]),
        .I1(max_bin_count_45_V[3]),
        .I2(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .O(select_ln422_41_fu_2993_p3[3]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_41_reg_5476[1]_i_6
       (.I0(max_bin_count_13_V[0]),
        .I1(max_bin_count_45_V[0]),
        .I2(\icmp_ln895_78_reg_5168[0]_i_2_n_0 ),
        .I3(max_bin_count_45_V[3]),
        .I4(max_bin_count_13_V[3]),
        .O(select_ln422_41_fu_2993_p3[0]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_41_reg_5476[2]_i_1
       (.I0(max_bin_count_13_V[2]),
        .I1(max_bin_count_45_V[2]),
        .I2(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .I3(select_ln422_89_fu_3265_p3[2]),
        .I4(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ),
        .O(select_ln440_41_fu_3473_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair21" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_41_reg_5476[2]_i_2
       (.I0(max_bin_count_29_V[2]),
        .I1(max_bin_count_61_V[2]),
        .I2(\icmp_ln895_94_reg_5288[0]_i_2_n_0 ),
        .I3(max_bin_count_61_V[3]),
        .I4(max_bin_count_29_V[3]),
        .O(select_ln422_89_fu_3265_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair20" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_41_reg_5476[3]_i_1
       (.I0(max_bin_count_13_V[3]),
        .I1(max_bin_count_45_V[3]),
        .I2(\icmp_ln895_78_reg_5168[0]_i_1_n_0 ),
        .I3(select_ln422_89_fu_3265_p3[3]),
        .I4(\icmp_ln895_110_reg_5466[0]_i_1_n_0 ),
        .O(select_ln440_41_fu_3473_p3[3]));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_41_reg_5476[3]_i_2
       (.I0(max_bin_count_29_V[3]),
        .I1(max_bin_count_61_V[3]),
        .I2(\icmp_ln895_94_reg_5288[0]_i_1_n_0 ),
        .O(select_ln422_89_fu_3265_p3[3]));
  FDRE \select_ln440_41_reg_5476_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_41_fu_3473_p3[0]),
        .Q(select_ln440_41_reg_5476[0]),
        .R(1'b0));
  FDRE \select_ln440_41_reg_5476_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_41_fu_3473_p3[1]),
        .Q(select_ln440_41_reg_5476[1]),
        .R(1'b0));
  FDRE \select_ln440_41_reg_5476_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_41_fu_3473_p3[2]),
        .Q(select_ln440_41_reg_5476[2]),
        .R(1'b0));
  FDRE \select_ln440_41_reg_5476_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_41_fu_3473_p3[3]),
        .Q(select_ln440_41_reg_5476[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_43_reg_5486[0]_i_1
       (.I0(max_bin_r_14_V[0]),
        .I1(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .I2(max_bin_r_46_V[0]),
        .I3(\icmp_ln895_46_reg_4973[0]_i_1_n_0 ),
        .I4(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ),
        .I5(select_ln422_91_fu_3274_p3[0]),
        .O(select_ln440_43_fu_3482_p3[0]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_43_reg_5486[0]_i_2
       (.I0(max_bin_r_30_V[0]),
        .I1(\icmp_ln895_30_reg_4893[0]_i_1_n_0 ),
        .I2(\icmp_ln895_95_reg_5293[0]_i_1_n_0 ),
        .I3(max_bin_r_62_V[0]),
        .I4(\icmp_ln895_62_reg_5053[0]_i_1_n_0 ),
        .O(select_ln422_91_fu_3274_p3[0]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_43_reg_5486[1]_i_1
       (.I0(max_bin_r_14_V[1]),
        .I1(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .I2(max_bin_r_46_V[1]),
        .I3(\icmp_ln895_46_reg_4973[0]_i_1_n_0 ),
        .I4(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ),
        .I5(select_ln422_91_fu_3274_p3[1]),
        .O(select_ln440_43_fu_3482_p3[1]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_43_reg_5486[1]_i_2
       (.I0(max_bin_r_30_V[1]),
        .I1(\icmp_ln895_30_reg_4893[0]_i_1_n_0 ),
        .I2(\icmp_ln895_95_reg_5293[0]_i_1_n_0 ),
        .I3(max_bin_r_62_V[1]),
        .I4(\icmp_ln895_62_reg_5053[0]_i_1_n_0 ),
        .O(select_ln422_91_fu_3274_p3[1]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_43_reg_5486[2]_i_1
       (.I0(max_bin_r_14_V[2]),
        .I1(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .I2(max_bin_r_46_V[2]),
        .I3(\icmp_ln895_46_reg_4973[0]_i_1_n_0 ),
        .I4(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ),
        .I5(select_ln422_91_fu_3274_p3[2]),
        .O(select_ln440_43_fu_3482_p3[2]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_43_reg_5486[2]_i_2
       (.I0(max_bin_r_30_V[2]),
        .I1(\icmp_ln895_30_reg_4893[0]_i_1_n_0 ),
        .I2(\icmp_ln895_95_reg_5293[0]_i_1_n_0 ),
        .I3(max_bin_r_62_V[2]),
        .I4(\icmp_ln895_62_reg_5053[0]_i_1_n_0 ),
        .O(select_ln422_91_fu_3274_p3[2]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_43_reg_5486[3]_i_1
       (.I0(max_bin_r_14_V[3]),
        .I1(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .I2(max_bin_r_46_V[3]),
        .I3(\icmp_ln895_46_reg_4973[0]_i_1_n_0 ),
        .I4(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ),
        .I5(select_ln422_91_fu_3274_p3[3]),
        .O(select_ln440_43_fu_3482_p3[3]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_43_reg_5486[3]_i_2
       (.I0(max_bin_r_30_V[3]),
        .I1(\icmp_ln895_30_reg_4893[0]_i_1_n_0 ),
        .I2(\icmp_ln895_95_reg_5293[0]_i_1_n_0 ),
        .I3(max_bin_r_62_V[3]),
        .I4(\icmp_ln895_62_reg_5053[0]_i_1_n_0 ),
        .O(select_ln422_91_fu_3274_p3[3]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_43_reg_5486[4]_i_1
       (.I0(max_bin_r_14_V[4]),
        .I1(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .I2(max_bin_r_46_V[4]),
        .I3(\icmp_ln895_46_reg_4973[0]_i_1_n_0 ),
        .I4(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ),
        .I5(select_ln422_91_fu_3274_p3[4]),
        .O(select_ln440_43_fu_3482_p3[4]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_43_reg_5486[4]_i_2
       (.I0(max_bin_r_30_V[4]),
        .I1(\icmp_ln895_30_reg_4893[0]_i_1_n_0 ),
        .I2(\icmp_ln895_95_reg_5293[0]_i_1_n_0 ),
        .I3(max_bin_r_62_V[4]),
        .I4(\icmp_ln895_62_reg_5053[0]_i_1_n_0 ),
        .O(select_ln422_91_fu_3274_p3[4]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_43_reg_5486[5]_i_1
       (.I0(max_bin_r_14_V[5]),
        .I1(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .I2(max_bin_r_46_V[5]),
        .I3(\icmp_ln895_46_reg_4973[0]_i_1_n_0 ),
        .I4(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ),
        .I5(select_ln422_91_fu_3274_p3[5]),
        .O(select_ln440_43_fu_3482_p3[5]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_43_reg_5486[5]_i_2
       (.I0(max_bin_r_30_V[5]),
        .I1(\icmp_ln895_30_reg_4893[0]_i_1_n_0 ),
        .I2(\icmp_ln895_95_reg_5293[0]_i_1_n_0 ),
        .I3(max_bin_r_62_V[5]),
        .I4(\icmp_ln895_62_reg_5053[0]_i_1_n_0 ),
        .O(select_ln422_91_fu_3274_p3[5]));
  LUT6 #(
    .INIT(64'h0000000200000000))
    \select_ln440_43_reg_5486[6]_i_1
       (.I0(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ),
        .I1(max_bin_count_14_V[2]),
        .I2(max_bin_count_14_V[3]),
        .I3(max_bin_count_14_V[1]),
        .I4(max_bin_count_14_V[0]),
        .I5(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .O(\select_ln440_43_reg_5486[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_43_reg_5486[6]_i_2
       (.I0(max_bin_r_14_V[6]),
        .I1(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .I2(max_bin_r_46_V[6]),
        .I3(\icmp_ln895_46_reg_4973[0]_i_1_n_0 ),
        .I4(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ),
        .I5(select_ln422_91_fu_3274_p3[6]),
        .O(select_ln440_43_fu_3482_p3[6]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_43_reg_5486[6]_i_3
       (.I0(max_bin_r_30_V[6]),
        .I1(\icmp_ln895_30_reg_4893[0]_i_1_n_0 ),
        .I2(\icmp_ln895_95_reg_5293[0]_i_1_n_0 ),
        .I3(max_bin_r_62_V[6]),
        .I4(\icmp_ln895_62_reg_5053[0]_i_1_n_0 ),
        .O(select_ln422_91_fu_3274_p3[6]));
  FDRE \select_ln440_43_reg_5486_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_43_fu_3482_p3[0]),
        .Q(\select_ln440_43_reg_5486_reg_n_0_[0] ),
        .R(\select_ln440_43_reg_5486[6]_i_1_n_0 ));
  FDRE \select_ln440_43_reg_5486_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_43_fu_3482_p3[1]),
        .Q(\select_ln440_43_reg_5486_reg_n_0_[1] ),
        .R(\select_ln440_43_reg_5486[6]_i_1_n_0 ));
  FDRE \select_ln440_43_reg_5486_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_43_fu_3482_p3[2]),
        .Q(\select_ln440_43_reg_5486_reg_n_0_[2] ),
        .R(\select_ln440_43_reg_5486[6]_i_1_n_0 ));
  FDRE \select_ln440_43_reg_5486_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_43_fu_3482_p3[3]),
        .Q(\select_ln440_43_reg_5486_reg_n_0_[3] ),
        .R(\select_ln440_43_reg_5486[6]_i_1_n_0 ));
  FDRE \select_ln440_43_reg_5486_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_43_fu_3482_p3[4]),
        .Q(\select_ln440_43_reg_5486_reg_n_0_[4] ),
        .R(\select_ln440_43_reg_5486[6]_i_1_n_0 ));
  FDRE \select_ln440_43_reg_5486_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_43_fu_3482_p3[5]),
        .Q(\select_ln440_43_reg_5486_reg_n_0_[5] ),
        .R(\select_ln440_43_reg_5486[6]_i_1_n_0 ));
  FDRE \select_ln440_43_reg_5486_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_43_fu_3482_p3[6]),
        .Q(\select_ln440_43_reg_5486_reg_n_0_[6] ),
        .R(\select_ln440_43_reg_5486[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_44_reg_5491[0]_i_1
       (.I0(max_bin_count_14_V[0]),
        .I1(max_bin_count_46_V[0]),
        .I2(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .I3(select_ln422_92_fu_3282_p3[0]),
        .I4(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ),
        .O(select_ln440_44_fu_3490_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_44_reg_5491[0]_i_2
       (.I0(max_bin_count_30_V[0]),
        .I1(max_bin_count_62_V[0]),
        .I2(\icmp_ln895_95_reg_5293[0]_i_2_n_0 ),
        .I3(max_bin_count_62_V[3]),
        .I4(max_bin_count_30_V[3]),
        .O(select_ln422_92_fu_3282_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_44_reg_5491[1]_i_1
       (.I0(select_ln422_44_fu_3010_p3[1]),
        .I1(select_ln422_92_fu_3282_p3[1]),
        .I2(\select_ln440_44_reg_5491[1]_i_4_n_0 ),
        .I3(select_ln422_92_fu_3282_p3[3]),
        .I4(select_ln422_44_fu_3010_p3[3]),
        .O(select_ln440_44_fu_3490_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_44_reg_5491[1]_i_2
       (.I0(max_bin_count_14_V[1]),
        .I1(max_bin_count_46_V[1]),
        .I2(\icmp_ln895_79_reg_5173[0]_i_2_n_0 ),
        .I3(max_bin_count_46_V[3]),
        .I4(max_bin_count_14_V[3]),
        .O(select_ln422_44_fu_3010_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_44_reg_5491[1]_i_3
       (.I0(max_bin_count_30_V[1]),
        .I1(max_bin_count_62_V[1]),
        .I2(\icmp_ln895_95_reg_5293[0]_i_2_n_0 ),
        .I3(max_bin_count_62_V[3]),
        .I4(max_bin_count_30_V[3]),
        .O(select_ln422_92_fu_3282_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_44_reg_5491[1]_i_4
       (.I0(select_ln422_44_fu_3010_p3[0]),
        .I1(select_ln422_92_fu_3282_p3[0]),
        .I2(select_ln422_92_fu_3282_p3[1]),
        .I3(select_ln422_44_fu_3010_p3[1]),
        .I4(select_ln422_92_fu_3282_p3[2]),
        .I5(select_ln422_44_fu_3010_p3[2]),
        .O(\select_ln440_44_reg_5491[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_44_reg_5491[1]_i_5
       (.I0(max_bin_count_14_V[3]),
        .I1(max_bin_count_46_V[3]),
        .I2(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .O(select_ln422_44_fu_3010_p3[3]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_44_reg_5491[1]_i_6
       (.I0(max_bin_count_14_V[0]),
        .I1(max_bin_count_46_V[0]),
        .I2(\icmp_ln895_79_reg_5173[0]_i_2_n_0 ),
        .I3(max_bin_count_46_V[3]),
        .I4(max_bin_count_14_V[3]),
        .O(select_ln422_44_fu_3010_p3[0]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_44_reg_5491[2]_i_1
       (.I0(max_bin_count_14_V[2]),
        .I1(max_bin_count_46_V[2]),
        .I2(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .I3(select_ln422_92_fu_3282_p3[2]),
        .I4(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ),
        .O(select_ln440_44_fu_3490_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair43" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_44_reg_5491[2]_i_2
       (.I0(max_bin_count_30_V[2]),
        .I1(max_bin_count_62_V[2]),
        .I2(\icmp_ln895_95_reg_5293[0]_i_2_n_0 ),
        .I3(max_bin_count_62_V[3]),
        .I4(max_bin_count_30_V[3]),
        .O(select_ln422_92_fu_3282_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair41" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_44_reg_5491[3]_i_1
       (.I0(max_bin_count_14_V[3]),
        .I1(max_bin_count_46_V[3]),
        .I2(\icmp_ln895_79_reg_5173[0]_i_1_n_0 ),
        .I3(select_ln422_92_fu_3282_p3[3]),
        .I4(\icmp_ln895_111_reg_5481[0]_i_1_n_0 ),
        .O(select_ln440_44_fu_3490_p3[3]));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_44_reg_5491[3]_i_2
       (.I0(max_bin_count_30_V[3]),
        .I1(max_bin_count_62_V[3]),
        .I2(\icmp_ln895_95_reg_5293[0]_i_1_n_0 ),
        .O(select_ln422_92_fu_3282_p3[3]));
  FDRE \select_ln440_44_reg_5491_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_44_fu_3490_p3[0]),
        .Q(select_ln440_44_reg_5491[0]),
        .R(1'b0));
  FDRE \select_ln440_44_reg_5491_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_44_fu_3490_p3[1]),
        .Q(select_ln440_44_reg_5491[1]),
        .R(1'b0));
  FDRE \select_ln440_44_reg_5491_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_44_fu_3490_p3[2]),
        .Q(select_ln440_44_reg_5491[2]),
        .R(1'b0));
  FDRE \select_ln440_44_reg_5491_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_44_fu_3490_p3[3]),
        .Q(select_ln440_44_reg_5491[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_46_reg_5501[0]_i_1
       (.I0(max_bin_r_15_V[0]),
        .I1(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .I2(max_bin_r_47_V[0]),
        .I3(\icmp_ln895_47_reg_4978[0]_i_1_n_0 ),
        .I4(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ),
        .I5(select_ln422_94_fu_3291_p3[0]),
        .O(select_ln440_46_fu_3499_p3[0]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_46_reg_5501[0]_i_2
       (.I0(max_bin_r_31_V[0]),
        .I1(\icmp_ln895_31_reg_4898[0]_i_1_n_0 ),
        .I2(\icmp_ln895_96_reg_5298[0]_i_1_n_0 ),
        .I3(max_bin_r_63_V[0]),
        .I4(\icmp_ln895_63_reg_5058[0]_i_1_n_0 ),
        .O(select_ln422_94_fu_3291_p3[0]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_46_reg_5501[1]_i_1
       (.I0(max_bin_r_15_V[1]),
        .I1(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .I2(max_bin_r_47_V[1]),
        .I3(\icmp_ln895_47_reg_4978[0]_i_1_n_0 ),
        .I4(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ),
        .I5(select_ln422_94_fu_3291_p3[1]),
        .O(select_ln440_46_fu_3499_p3[1]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_46_reg_5501[1]_i_2
       (.I0(max_bin_r_31_V[1]),
        .I1(\icmp_ln895_31_reg_4898[0]_i_1_n_0 ),
        .I2(\icmp_ln895_96_reg_5298[0]_i_1_n_0 ),
        .I3(max_bin_r_63_V[1]),
        .I4(\icmp_ln895_63_reg_5058[0]_i_1_n_0 ),
        .O(select_ln422_94_fu_3291_p3[1]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_46_reg_5501[2]_i_1
       (.I0(max_bin_r_15_V[2]),
        .I1(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .I2(max_bin_r_47_V[2]),
        .I3(\icmp_ln895_47_reg_4978[0]_i_1_n_0 ),
        .I4(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ),
        .I5(select_ln422_94_fu_3291_p3[2]),
        .O(select_ln440_46_fu_3499_p3[2]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_46_reg_5501[2]_i_2
       (.I0(max_bin_r_31_V[2]),
        .I1(\icmp_ln895_31_reg_4898[0]_i_1_n_0 ),
        .I2(\icmp_ln895_96_reg_5298[0]_i_1_n_0 ),
        .I3(max_bin_r_63_V[2]),
        .I4(\icmp_ln895_63_reg_5058[0]_i_1_n_0 ),
        .O(select_ln422_94_fu_3291_p3[2]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_46_reg_5501[3]_i_1
       (.I0(max_bin_r_15_V[3]),
        .I1(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .I2(max_bin_r_47_V[3]),
        .I3(\icmp_ln895_47_reg_4978[0]_i_1_n_0 ),
        .I4(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ),
        .I5(select_ln422_94_fu_3291_p3[3]),
        .O(select_ln440_46_fu_3499_p3[3]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_46_reg_5501[3]_i_2
       (.I0(max_bin_r_31_V[3]),
        .I1(\icmp_ln895_31_reg_4898[0]_i_1_n_0 ),
        .I2(\icmp_ln895_96_reg_5298[0]_i_1_n_0 ),
        .I3(max_bin_r_63_V[3]),
        .I4(\icmp_ln895_63_reg_5058[0]_i_1_n_0 ),
        .O(select_ln422_94_fu_3291_p3[3]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_46_reg_5501[4]_i_1
       (.I0(max_bin_r_15_V[4]),
        .I1(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .I2(max_bin_r_47_V[4]),
        .I3(\icmp_ln895_47_reg_4978[0]_i_1_n_0 ),
        .I4(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ),
        .I5(select_ln422_94_fu_3291_p3[4]),
        .O(select_ln440_46_fu_3499_p3[4]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_46_reg_5501[4]_i_2
       (.I0(max_bin_r_31_V[4]),
        .I1(\icmp_ln895_31_reg_4898[0]_i_1_n_0 ),
        .I2(\icmp_ln895_96_reg_5298[0]_i_1_n_0 ),
        .I3(max_bin_r_63_V[4]),
        .I4(\icmp_ln895_63_reg_5058[0]_i_1_n_0 ),
        .O(select_ln422_94_fu_3291_p3[4]));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_46_reg_5501[5]_i_1
       (.I0(max_bin_r_15_V[5]),
        .I1(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .I2(max_bin_r_47_V[5]),
        .I3(\icmp_ln895_47_reg_4978[0]_i_1_n_0 ),
        .I4(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ),
        .I5(select_ln422_94_fu_3291_p3[5]),
        .O(select_ln440_46_fu_3499_p3[5]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_46_reg_5501[5]_i_2
       (.I0(max_bin_r_31_V[5]),
        .I1(\icmp_ln895_31_reg_4898[0]_i_1_n_0 ),
        .I2(\icmp_ln895_96_reg_5298[0]_i_1_n_0 ),
        .I3(max_bin_r_63_V[5]),
        .I4(\icmp_ln895_63_reg_5058[0]_i_1_n_0 ),
        .O(select_ln422_94_fu_3291_p3[5]));
  LUT6 #(
    .INIT(64'h0000000200000000))
    \select_ln440_46_reg_5501[6]_i_1
       (.I0(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ),
        .I1(max_bin_count_15_V[2]),
        .I2(max_bin_count_15_V[3]),
        .I3(max_bin_count_15_V[1]),
        .I4(max_bin_count_15_V[0]),
        .I5(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .O(\select_ln440_46_reg_5501[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h88B8FFFF88B80000))
    \select_ln440_46_reg_5501[6]_i_2
       (.I0(max_bin_r_15_V[6]),
        .I1(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .I2(max_bin_r_47_V[6]),
        .I3(\icmp_ln895_47_reg_4978[0]_i_1_n_0 ),
        .I4(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ),
        .I5(select_ln422_94_fu_3291_p3[6]),
        .O(select_ln440_46_fu_3499_p3[6]));
  LUT5 #(
    .INIT(32'h20202F20))
    \select_ln440_46_reg_5501[6]_i_3
       (.I0(max_bin_r_31_V[6]),
        .I1(\icmp_ln895_31_reg_4898[0]_i_1_n_0 ),
        .I2(\icmp_ln895_96_reg_5298[0]_i_1_n_0 ),
        .I3(max_bin_r_63_V[6]),
        .I4(\icmp_ln895_63_reg_5058[0]_i_1_n_0 ),
        .O(select_ln422_94_fu_3291_p3[6]));
  FDRE \select_ln440_46_reg_5501_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_46_fu_3499_p3[0]),
        .Q(\select_ln440_46_reg_5501_reg_n_0_[0] ),
        .R(\select_ln440_46_reg_5501[6]_i_1_n_0 ));
  FDRE \select_ln440_46_reg_5501_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_46_fu_3499_p3[1]),
        .Q(\select_ln440_46_reg_5501_reg_n_0_[1] ),
        .R(\select_ln440_46_reg_5501[6]_i_1_n_0 ));
  FDRE \select_ln440_46_reg_5501_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_46_fu_3499_p3[2]),
        .Q(\select_ln440_46_reg_5501_reg_n_0_[2] ),
        .R(\select_ln440_46_reg_5501[6]_i_1_n_0 ));
  FDRE \select_ln440_46_reg_5501_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_46_fu_3499_p3[3]),
        .Q(\select_ln440_46_reg_5501_reg_n_0_[3] ),
        .R(\select_ln440_46_reg_5501[6]_i_1_n_0 ));
  FDRE \select_ln440_46_reg_5501_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_46_fu_3499_p3[4]),
        .Q(\select_ln440_46_reg_5501_reg_n_0_[4] ),
        .R(\select_ln440_46_reg_5501[6]_i_1_n_0 ));
  FDRE \select_ln440_46_reg_5501_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_46_fu_3499_p3[5]),
        .Q(\select_ln440_46_reg_5501_reg_n_0_[5] ),
        .R(\select_ln440_46_reg_5501[6]_i_1_n_0 ));
  FDRE \select_ln440_46_reg_5501_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_46_fu_3499_p3[6]),
        .Q(\select_ln440_46_reg_5501_reg_n_0_[6] ),
        .R(\select_ln440_46_reg_5501[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_47_reg_5506[0]_i_1
       (.I0(max_bin_count_15_V[0]),
        .I1(max_bin_count_47_V[0]),
        .I2(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .I3(select_ln422_95_fu_3299_p3[0]),
        .I4(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ),
        .O(select_ln440_47_fu_3507_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_47_reg_5506[0]_i_2
       (.I0(max_bin_count_31_V[0]),
        .I1(max_bin_count_63_V[0]),
        .I2(\icmp_ln895_96_reg_5298[0]_i_2_n_0 ),
        .I3(max_bin_count_63_V[3]),
        .I4(max_bin_count_31_V[3]),
        .O(select_ln422_95_fu_3299_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_47_reg_5506[1]_i_1
       (.I0(select_ln422_47_fu_3027_p3[1]),
        .I1(select_ln422_95_fu_3299_p3[1]),
        .I2(\select_ln440_47_reg_5506[1]_i_4_n_0 ),
        .I3(select_ln422_95_fu_3299_p3[3]),
        .I4(select_ln422_47_fu_3027_p3[3]),
        .O(select_ln440_47_fu_3507_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_47_reg_5506[1]_i_2
       (.I0(max_bin_count_15_V[1]),
        .I1(max_bin_count_47_V[1]),
        .I2(\icmp_ln895_80_reg_5178[0]_i_2_n_0 ),
        .I3(max_bin_count_47_V[3]),
        .I4(max_bin_count_15_V[3]),
        .O(select_ln422_47_fu_3027_p3[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_47_reg_5506[1]_i_3
       (.I0(max_bin_count_31_V[1]),
        .I1(max_bin_count_63_V[1]),
        .I2(\icmp_ln895_96_reg_5298[0]_i_2_n_0 ),
        .I3(max_bin_count_63_V[3]),
        .I4(max_bin_count_31_V[3]),
        .O(select_ln422_95_fu_3299_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_47_reg_5506[1]_i_4
       (.I0(select_ln422_47_fu_3027_p3[0]),
        .I1(select_ln422_95_fu_3299_p3[0]),
        .I2(select_ln422_95_fu_3299_p3[1]),
        .I3(select_ln422_47_fu_3027_p3[1]),
        .I4(select_ln422_95_fu_3299_p3[2]),
        .I5(select_ln422_47_fu_3027_p3[2]),
        .O(\select_ln440_47_reg_5506[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_47_reg_5506[1]_i_5
       (.I0(max_bin_count_15_V[3]),
        .I1(max_bin_count_47_V[3]),
        .I2(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .O(select_ln422_47_fu_3027_p3[3]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_47_reg_5506[1]_i_6
       (.I0(max_bin_count_15_V[0]),
        .I1(max_bin_count_47_V[0]),
        .I2(\icmp_ln895_80_reg_5178[0]_i_2_n_0 ),
        .I3(max_bin_count_47_V[3]),
        .I4(max_bin_count_15_V[3]),
        .O(select_ln422_47_fu_3027_p3[0]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_47_reg_5506[2]_i_1
       (.I0(max_bin_count_15_V[2]),
        .I1(max_bin_count_47_V[2]),
        .I2(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .I3(select_ln422_95_fu_3299_p3[2]),
        .I4(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ),
        .O(select_ln440_47_fu_3507_p3[2]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_47_reg_5506[2]_i_2
       (.I0(max_bin_count_31_V[2]),
        .I1(max_bin_count_63_V[2]),
        .I2(\icmp_ln895_96_reg_5298[0]_i_2_n_0 ),
        .I3(max_bin_count_63_V[3]),
        .I4(max_bin_count_31_V[3]),
        .O(select_ln422_95_fu_3299_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair19" *)
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_47_reg_5506[3]_i_1
       (.I0(max_bin_count_15_V[3]),
        .I1(max_bin_count_47_V[3]),
        .I2(\icmp_ln895_80_reg_5178[0]_i_1_n_0 ),
        .I3(select_ln422_95_fu_3299_p3[3]),
        .I4(\icmp_ln895_112_reg_5496[0]_i_1_n_0 ),
        .O(select_ln440_47_fu_3507_p3[3]));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_47_reg_5506[3]_i_2
       (.I0(max_bin_count_31_V[3]),
        .I1(max_bin_count_63_V[3]),
        .I2(\icmp_ln895_96_reg_5298[0]_i_1_n_0 ),
        .O(select_ln422_95_fu_3299_p3[3]));
  FDRE \select_ln440_47_reg_5506_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_47_fu_3507_p3[0]),
        .Q(select_ln440_47_reg_5506[0]),
        .R(1'b0));
  FDRE \select_ln440_47_reg_5506_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_47_fu_3507_p3[1]),
        .Q(select_ln440_47_reg_5506[1]),
        .R(1'b0));
  FDRE \select_ln440_47_reg_5506_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_47_fu_3507_p3[2]),
        .Q(select_ln440_47_reg_5506[2]),
        .R(1'b0));
  FDRE \select_ln440_47_reg_5506_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_47_fu_3507_p3[3]),
        .Q(select_ln440_47_reg_5506[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_5_reg_5320[0]_i_1
       (.I0(max_bin_count_49_V[3]),
        .I1(max_bin_count_17_V[3]),
        .I2(select_ln422_5_fu_2789_p3[0]),
        .I3(select_ln422_53_fu_3061_p3[0]),
        .I4(\select_ln440_5_reg_5320[1]_i_4_n_0 ),
        .I5(select_ln422_5_fu_2789_p3[3]),
        .O(select_ln440_5_fu_3317_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_5_reg_5320[0]_i_2
       (.I0(max_bin_count_1_V[0]),
        .I1(max_bin_count_33_V[0]),
        .I2(\icmp_ln895_66_reg_5073[0]_i_2_n_0 ),
        .I3(max_bin_count_33_V[3]),
        .I4(max_bin_count_1_V[3]),
        .O(select_ln422_5_fu_2789_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_5_reg_5320[0]_i_3
       (.I0(max_bin_count_17_V[0]),
        .I1(max_bin_count_49_V[0]),
        .I2(\select_ln422_52_reg_5198[6]_i_3_n_0 ),
        .I3(max_bin_count_49_V[3]),
        .I4(max_bin_count_17_V[3]),
        .O(select_ln422_53_fu_3061_p3[0]));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_5_reg_5320[1]_i_1
       (.I0(max_bin_count_49_V[3]),
        .I1(max_bin_count_17_V[3]),
        .I2(select_ln422_5_fu_2789_p3[1]),
        .I3(select_ln422_53_fu_3061_p3[1]),
        .I4(\select_ln440_5_reg_5320[1]_i_4_n_0 ),
        .I5(select_ln422_5_fu_2789_p3[3]),
        .O(select_ln440_5_fu_3317_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_5_reg_5320[1]_i_2
       (.I0(max_bin_count_1_V[1]),
        .I1(max_bin_count_33_V[1]),
        .I2(\icmp_ln895_66_reg_5073[0]_i_2_n_0 ),
        .I3(max_bin_count_33_V[3]),
        .I4(max_bin_count_1_V[3]),
        .O(select_ln422_5_fu_2789_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_5_reg_5320[1]_i_3
       (.I0(max_bin_count_17_V[1]),
        .I1(max_bin_count_49_V[1]),
        .I2(\select_ln422_52_reg_5198[6]_i_3_n_0 ),
        .I3(max_bin_count_49_V[3]),
        .I4(max_bin_count_17_V[3]),
        .O(select_ln422_53_fu_3061_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_5_reg_5320[1]_i_4
       (.I0(select_ln422_5_fu_2789_p3[0]),
        .I1(select_ln422_53_fu_3061_p3[0]),
        .I2(select_ln422_53_fu_3061_p3[1]),
        .I3(select_ln422_5_fu_2789_p3[1]),
        .I4(select_ln422_53_fu_3061_p3[2]),
        .I5(select_ln422_5_fu_2789_p3[2]),
        .O(\select_ln440_5_reg_5320[1]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_5_reg_5320[1]_i_5
       (.I0(max_bin_count_1_V[3]),
        .I1(max_bin_count_33_V[3]),
        .I2(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ),
        .O(select_ln422_5_fu_2789_p3[3]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_5_reg_5320[2]_i_1
       (.I0(max_bin_count_1_V[2]),
        .I1(max_bin_count_33_V[2]),
        .I2(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ),
        .I3(select_ln422_53_fu_3061_p3[2]),
        .I4(\icmp_ln895_98_reg_5314[0]_i_1_n_0 ),
        .O(select_ln440_5_fu_3317_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair34" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_5_reg_5320[2]_i_2
       (.I0(max_bin_count_17_V[2]),
        .I1(max_bin_count_49_V[2]),
        .I2(\select_ln422_52_reg_5198[6]_i_3_n_0 ),
        .I3(max_bin_count_49_V[3]),
        .I4(max_bin_count_17_V[3]),
        .O(select_ln422_53_fu_3061_p3[2]));
  LUT6 #(
    .INIT(64'hF0F0FF00EEEEEEEE))
    \select_ln440_5_reg_5320[3]_i_1
       (.I0(max_bin_count_49_V[3]),
        .I1(max_bin_count_17_V[3]),
        .I2(max_bin_count_1_V[3]),
        .I3(max_bin_count_33_V[3]),
        .I4(\icmp_ln895_66_reg_5073[0]_i_1_n_0 ),
        .I5(\icmp_ln895_98_reg_5314[0]_i_1_n_0 ),
        .O(select_ln440_5_fu_3317_p3[3]));
  FDRE \select_ln440_5_reg_5320_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_5_fu_3317_p3[0]),
        .Q(select_ln440_5_reg_5320[0]),
        .R(1'b0));
  FDRE \select_ln440_5_reg_5320_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_5_fu_3317_p3[1]),
        .Q(select_ln440_5_reg_5320[1]),
        .R(1'b0));
  FDRE \select_ln440_5_reg_5320_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_5_fu_3317_p3[2]),
        .Q(select_ln440_5_reg_5320[2]),
        .R(1'b0));
  FDRE \select_ln440_5_reg_5320_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_5_fu_3317_p3[3]),
        .Q(select_ln440_5_reg_5320[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_8_reg_5331[0]_i_1
       (.I0(max_bin_count_50_V[3]),
        .I1(max_bin_count_18_V[3]),
        .I2(select_ln422_8_fu_2806_p3[0]),
        .I3(select_ln422_56_fu_3078_p3[0]),
        .I4(\select_ln440_8_reg_5331[1]_i_4_n_0 ),
        .I5(select_ln422_8_fu_2806_p3[3]),
        .O(select_ln440_8_fu_3326_p3[0]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_8_reg_5331[0]_i_2
       (.I0(max_bin_count_2_V[0]),
        .I1(max_bin_count_34_V[0]),
        .I2(\icmp_ln895_67_reg_5083[0]_i_2_n_0 ),
        .I3(max_bin_count_34_V[3]),
        .I4(max_bin_count_2_V[3]),
        .O(select_ln422_8_fu_2806_p3[0]));
  (* SOFT_HLUTNM = "soft_lutpair54" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_8_reg_5331[0]_i_3
       (.I0(max_bin_count_18_V[0]),
        .I1(max_bin_count_50_V[0]),
        .I2(\select_ln422_55_reg_5208[6]_i_3_n_0 ),
        .I3(max_bin_count_50_V[3]),
        .I4(max_bin_count_18_V[3]),
        .O(select_ln422_56_fu_3078_p3[0]));
  LUT6 #(
    .INIT(64'hF0F0FE10FE10FF00))
    \select_ln440_8_reg_5331[1]_i_1
       (.I0(max_bin_count_50_V[3]),
        .I1(max_bin_count_18_V[3]),
        .I2(select_ln422_8_fu_2806_p3[1]),
        .I3(select_ln422_56_fu_3078_p3[1]),
        .I4(\select_ln440_8_reg_5331[1]_i_4_n_0 ),
        .I5(select_ln422_8_fu_2806_p3[3]),
        .O(select_ln440_8_fu_3326_p3[1]));
  (* SOFT_HLUTNM = "soft_lutpair52" *)
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_8_reg_5331[1]_i_2
       (.I0(max_bin_count_2_V[1]),
        .I1(max_bin_count_34_V[1]),
        .I2(\icmp_ln895_67_reg_5083[0]_i_2_n_0 ),
        .I3(max_bin_count_34_V[3]),
        .I4(max_bin_count_2_V[3]),
        .O(select_ln422_8_fu_2806_p3[1]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_8_reg_5331[1]_i_3
       (.I0(max_bin_count_18_V[1]),
        .I1(max_bin_count_50_V[1]),
        .I2(\select_ln422_55_reg_5208[6]_i_3_n_0 ),
        .I3(max_bin_count_50_V[3]),
        .I4(max_bin_count_18_V[3]),
        .O(select_ln422_56_fu_3078_p3[1]));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02))
    \select_ln440_8_reg_5331[1]_i_4
       (.I0(select_ln422_8_fu_2806_p3[0]),
        .I1(select_ln422_56_fu_3078_p3[0]),
        .I2(select_ln422_56_fu_3078_p3[1]),
        .I3(select_ln422_8_fu_2806_p3[1]),
        .I4(select_ln422_56_fu_3078_p3[2]),
        .I5(select_ln422_8_fu_2806_p3[2]),
        .O(\select_ln440_8_reg_5331[1]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hAC))
    \select_ln440_8_reg_5331[1]_i_5
       (.I0(max_bin_count_2_V[3]),
        .I1(max_bin_count_34_V[3]),
        .I2(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ),
        .O(select_ln422_8_fu_2806_p3[3]));
  LUT5 #(
    .INIT(32'hACACFF00))
    \select_ln440_8_reg_5331[2]_i_1
       (.I0(max_bin_count_2_V[2]),
        .I1(max_bin_count_34_V[2]),
        .I2(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ),
        .I3(select_ln422_56_fu_3078_p3[2]),
        .I4(\icmp_ln895_99_reg_5325[0]_i_1_n_0 ),
        .O(select_ln440_8_fu_3326_p3[2]));
  LUT5 #(
    .INIT(32'hACAACCAC))
    \select_ln440_8_reg_5331[2]_i_2
       (.I0(max_bin_count_18_V[2]),
        .I1(max_bin_count_50_V[2]),
        .I2(\select_ln422_55_reg_5208[6]_i_3_n_0 ),
        .I3(max_bin_count_50_V[3]),
        .I4(max_bin_count_18_V[3]),
        .O(select_ln422_56_fu_3078_p3[2]));
  LUT6 #(
    .INIT(64'hF0F0FF00EEEEEEEE))
    \select_ln440_8_reg_5331[3]_i_1
       (.I0(max_bin_count_50_V[3]),
        .I1(max_bin_count_18_V[3]),
        .I2(max_bin_count_2_V[3]),
        .I3(max_bin_count_34_V[3]),
        .I4(\icmp_ln895_67_reg_5083[0]_i_1_n_0 ),
        .I5(\icmp_ln895_99_reg_5325[0]_i_1_n_0 ),
        .O(select_ln440_8_fu_3326_p3[3]));
  FDRE \select_ln440_8_reg_5331_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_8_fu_3326_p3[0]),
        .Q(select_ln440_8_reg_5331[0]),
        .R(1'b0));
  FDRE \select_ln440_8_reg_5331_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_8_fu_3326_p3[1]),
        .Q(select_ln440_8_reg_5331[1]),
        .R(1'b0));
  FDRE \select_ln440_8_reg_5331_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_8_fu_3326_p3[2]),
        .Q(select_ln440_8_reg_5331[2]),
        .R(1'b0));
  FDRE \select_ln440_8_reg_5331_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln440_8_fu_3326_p3[3]),
        .Q(select_ln440_8_reg_5331[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *)
  LUT1 #(
    .INIT(2'h1))
    \select_ln476_6_reg_5572[2]_i_1
       (.I0(\select_ln476_6_reg_5572[6]_i_4_n_0 ),
        .O(select_ln476_6_fu_4542_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair71" *)
  LUT3 #(
    .INIT(8'h47))
    \select_ln476_6_reg_5572[3]_i_1
       (.I0(icmp_ln895_115_reg_5525),
        .I1(\select_ln476_6_reg_5572[6]_i_4_n_0 ),
        .I2(icmp_ln895_119_reg_5553),
        .O(select_ln476_6_fu_4542_p3[3]));
  LUT5 #(
    .INIT(32'h47FF4700))
    \select_ln476_6_reg_5572[4]_i_1
       (.I0(icmp_ln895_99_reg_5325),
        .I1(icmp_ln895_115_reg_5525),
        .I2(icmp_ln895_107_reg_5421),
        .I3(\select_ln476_6_reg_5572[6]_i_4_n_0 ),
        .I4(\select_ln476_6_reg_5572[4]_i_2_n_0 ),
        .O(select_ln476_6_fu_4542_p3[4]));
  (* SOFT_HLUTNM = "soft_lutpair61" *)
  LUT3 #(
    .INIT(8'h47))
    \select_ln476_6_reg_5572[4]_i_2
       (.I0(icmp_ln895_103_reg_5369),
        .I1(icmp_ln895_119_reg_5553),
        .I2(icmp_ln895_111_reg_5481),
        .O(\select_ln476_6_reg_5572[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h470047FF))
    \select_ln476_6_reg_5572[5]_i_2
       (.I0(icmp_ln895_71_reg_5123),
        .I1(icmp_ln895_103_reg_5369),
        .I2(icmp_ln895_87_reg_5243),
        .I3(icmp_ln895_119_reg_5553),
        .I4(\select_ln476_6_reg_5572[5]_i_4_n_0 ),
        .O(\select_ln476_6_reg_5572[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h1DFF1D00))
    \select_ln476_6_reg_5572[5]_i_3
       (.I0(icmp_ln895_83_reg_5203),
        .I1(icmp_ln895_99_reg_5325),
        .I2(icmp_ln895_67_reg_5083),
        .I3(icmp_ln895_115_reg_5525),
        .I4(\select_ln476_6_reg_5572[5]_i_5_n_0 ),
        .O(\select_ln476_6_reg_5572[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *)
  LUT3 #(
    .INIT(8'hB8))
    \select_ln476_6_reg_5572[5]_i_4
       (.I0(icmp_ln895_79_reg_5173),
        .I1(icmp_ln895_111_reg_5481),
        .I2(icmp_ln895_95_reg_5293),
        .O(\select_ln476_6_reg_5572[5]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *)
  LUT3 #(
    .INIT(8'h47))
    \select_ln476_6_reg_5572[5]_i_5
       (.I0(icmp_ln895_75_reg_5153),
        .I1(icmp_ln895_107_reg_5421),
        .I2(icmp_ln895_91_reg_5273),
        .O(\select_ln476_6_reg_5572[5]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *)
  LUT5 #(
    .INIT(32'hB8FFB800))
    \select_ln476_6_reg_5572[6]_i_1
       (.I0(\select_ln476_6_reg_5572[6]_i_2_n_0 ),
        .I1(icmp_ln895_115_reg_5525),
        .I2(\select_ln476_6_reg_5572[6]_i_3_n_0 ),
        .I3(\select_ln476_6_reg_5572[6]_i_4_n_0 ),
        .I4(\select_ln476_6_reg_5572_reg[6]_i_5_n_0 ),
        .O(select_ln476_6_fu_4542_p3[6]));
  (* SOFT_HLUTNM = "soft_lutpair15" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln476_6_reg_5572[6]_i_10
       (.I0(select_ln440_8_reg_5331[2]),
        .I1(select_ln440_32_reg_5431[2]),
        .I2(icmp_ln895_115_reg_5525),
        .O(select_ln458_8_fu_4391_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair73" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln476_6_reg_5572[6]_i_11
       (.I0(select_ln440_20_reg_5375[3]),
        .I1(select_ln440_44_reg_5491[3]),
        .I2(icmp_ln895_119_reg_5553),
        .O(select_ln458_20_fu_4467_p3[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln476_6_reg_5572[6]_i_12
       (.I0(select_ln440_8_reg_5331[3]),
        .I1(select_ln440_32_reg_5431[3]),
        .I2(icmp_ln895_115_reg_5525),
        .O(select_ln458_8_fu_4391_p3[3]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \select_ln476_6_reg_5572[6]_i_13
       (.I0(icmp_ln895_14_reg_4813),
        .I1(icmp_ln895_79_reg_5173),
        .I2(icmp_ln895_46_reg_4973),
        .I3(icmp_ln895_111_reg_5481),
        .I4(\select_ln476_6_reg_5572[6]_i_16_n_0 ),
        .O(p_0_out));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \select_ln476_6_reg_5572[6]_i_14
       (.I0(icmp_ln895_64_reg_4773),
        .I1(icmp_ln895_71_reg_5123),
        .I2(icmp_ln895_38_reg_4933),
        .I3(icmp_ln895_103_reg_5369),
        .I4(\select_ln476_6_reg_5572[6]_i_17_n_0 ),
        .O(\select_ln476_6_reg_5572[6]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln476_6_reg_5572[6]_i_15
       (.I0(select_ln440_8_reg_5331[1]),
        .I1(select_ln440_32_reg_5431[1]),
        .I2(icmp_ln895_115_reg_5525),
        .O(select_ln458_8_fu_4391_p3[1]));
  (* SOFT_HLUTNM = "soft_lutpair63" *)
  LUT3 #(
    .INIT(8'hB8))
    \select_ln476_6_reg_5572[6]_i_16
       (.I0(icmp_ln895_30_reg_4893),
        .I1(icmp_ln895_95_reg_5293),
        .I2(icmp_ln895_62_reg_5053),
        .O(\select_ln476_6_reg_5572[6]_i_16_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \select_ln476_6_reg_5572[6]_i_17
       (.I0(icmp_ln895_22_reg_4853),
        .I1(icmp_ln895_87_reg_5243),
        .I2(icmp_ln895_54_reg_5013),
        .O(\select_ln476_6_reg_5572[6]_i_17_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \select_ln476_6_reg_5572[6]_i_2
       (.I0(icmp_ln895_2_reg_4753),
        .I1(icmp_ln895_67_reg_5083),
        .I2(icmp_ln895_34_reg_4913),
        .I3(icmp_ln895_99_reg_5325),
        .I4(\select_ln476_6_reg_5572[6]_i_6_n_0 ),
        .O(\select_ln476_6_reg_5572[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \select_ln476_6_reg_5572[6]_i_3
       (.I0(icmp_ln895_10_reg_4793),
        .I1(icmp_ln895_75_reg_5153),
        .I2(icmp_ln895_42_reg_4953),
        .I3(icmp_ln895_107_reg_5421),
        .I4(\select_ln476_6_reg_5572[6]_i_7_n_0 ),
        .O(\select_ln476_6_reg_5572[6]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \select_ln476_6_reg_5572[6]_i_4
       (.I0(\select_ln476_6_reg_5572[6]_i_8_n_0 ),
        .I1(select_ln458_20_fu_4467_p3[2]),
        .I2(select_ln458_8_fu_4391_p3[2]),
        .I3(select_ln458_20_fu_4467_p3[3]),
        .I4(select_ln458_8_fu_4391_p3[3]),
        .O(\select_ln476_6_reg_5572[6]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \select_ln476_6_reg_5572[6]_i_6
       (.I0(icmp_ln895_18_reg_4833),
        .I1(icmp_ln895_83_reg_5203),
        .I2(icmp_ln895_50_reg_4993),
        .O(\select_ln476_6_reg_5572[6]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *)
  LUT3 #(
    .INIT(8'hB8))
    \select_ln476_6_reg_5572[6]_i_7
       (.I0(icmp_ln895_26_reg_4873),
        .I1(icmp_ln895_91_reg_5273),
        .I2(icmp_ln895_58_reg_5033),
        .O(\select_ln476_6_reg_5572[6]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \select_ln476_6_reg_5572[6]_i_8
       (.I0(icmp_ln895_115_reg_5525),
        .I1(select_ln440_32_reg_5431[0]),
        .I2(select_ln440_8_reg_5331[0]),
        .I3(select_ln458_20_fu_4467_p3[0]),
        .I4(select_ln458_20_fu_4467_p3[1]),
        .I5(select_ln458_8_fu_4391_p3[1]),
        .O(\select_ln476_6_reg_5572[6]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln476_6_reg_5572[6]_i_9
       (.I0(select_ln440_20_reg_5375[2]),
        .I1(select_ln440_44_reg_5491[2]),
        .I2(icmp_ln895_119_reg_5553),
        .O(select_ln458_20_fu_4467_p3[2]));
  FDRE \select_ln476_6_reg_5572_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln476_6_fu_4542_p3[2]),
        .Q(select_ln476_6_reg_5572[2]),
        .R(1'b0));
  FDRE \select_ln476_6_reg_5572_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln476_6_fu_4542_p3[3]),
        .Q(select_ln476_6_reg_5572[3]),
        .R(1'b0));
  FDRE \select_ln476_6_reg_5572_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln476_6_fu_4542_p3[4]),
        .Q(select_ln476_6_reg_5572[4]),
        .R(1'b0));
  FDRE \select_ln476_6_reg_5572_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln476_6_fu_4542_p3[5]),
        .Q(select_ln476_6_reg_5572[5]),
        .R(1'b0));
  MUXF7 \select_ln476_6_reg_5572_reg[5]_i_1
       (.I0(\select_ln476_6_reg_5572[5]_i_2_n_0 ),
        .I1(\select_ln476_6_reg_5572[5]_i_3_n_0 ),
        .O(select_ln476_6_fu_4542_p3[5]),
        .S(\select_ln476_6_reg_5572[6]_i_4_n_0 ));
  FDRE \select_ln476_6_reg_5572_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln476_6_fu_4542_p3[6]),
        .Q(select_ln476_6_reg_5572[6]),
        .R(1'b0));
  MUXF7 \select_ln476_6_reg_5572_reg[6]_i_5
       (.I0(p_0_out),
        .I1(\select_ln476_6_reg_5572[6]_i_14_n_0 ),
        .O(\select_ln476_6_reg_5572_reg[6]_i_5_n_0 ),
        .S(icmp_ln895_119_reg_5553));
  (* SOFT_HLUTNM = "soft_lutpair2" *)
  LUT1 #(
    .INIT(2'h1))
    \select_ln476_reg_5567[2]_i_1
       (.I0(\select_ln476_reg_5567[6]_i_4_n_0 ),
        .O(select_ln476_fu_4492_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair70" *)
  LUT3 #(
    .INIT(8'h47))
    \select_ln476_reg_5567[3]_i_1
       (.I0(icmp_ln895_113_reg_5511),
        .I1(\select_ln476_reg_5567[6]_i_4_n_0 ),
        .I2(icmp_ln895_117_reg_5539),
        .O(select_ln476_fu_4492_p3[3]));
  LUT5 #(
    .INIT(32'h47FF4700))
    \select_ln476_reg_5567[4]_i_1
       (.I0(icmp_ln895_97_reg_5303),
        .I1(icmp_ln895_113_reg_5511),
        .I2(icmp_ln895_105_reg_5391),
        .I3(\select_ln476_reg_5567[6]_i_4_n_0 ),
        .I4(\select_ln476_reg_5567[4]_i_2_n_0 ),
        .O(select_ln476_fu_4492_p3[4]));
  (* SOFT_HLUTNM = "soft_lutpair60" *)
  LUT3 #(
    .INIT(8'h47))
    \select_ln476_reg_5567[4]_i_2
       (.I0(icmp_ln895_101_reg_5347),
        .I1(icmp_ln895_117_reg_5539),
        .I2(icmp_ln895_109_reg_5451),
        .O(\select_ln476_reg_5567[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h1DFF1D00))
    \select_ln476_reg_5567[5]_i_2
       (.I0(icmp_ln895_85_reg_5223),
        .I1(icmp_ln895_101_reg_5347),
        .I2(icmp_ln895_69_reg_5103),
        .I3(icmp_ln895_117_reg_5539),
        .I4(\select_ln476_reg_5567[5]_i_4_n_0 ),
        .O(\select_ln476_reg_5567[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h47FF4700))
    \select_ln476_reg_5567[5]_i_3
       (.I0(icmp_ln895_65_reg_5063),
        .I1(icmp_ln895_97_reg_5303),
        .I2(icmp_ln895_81_reg_5183),
        .I3(icmp_ln895_113_reg_5511),
        .I4(\select_ln476_reg_5567[5]_i_5_n_0 ),
        .O(\select_ln476_reg_5567[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *)
  LUT3 #(
    .INIT(8'h47))
    \select_ln476_reg_5567[5]_i_4
       (.I0(icmp_ln895_77_reg_5163),
        .I1(icmp_ln895_109_reg_5451),
        .I2(icmp_ln895_93_reg_5283),
        .O(\select_ln476_reg_5567[5]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *)
  LUT3 #(
    .INIT(8'h47))
    \select_ln476_reg_5567[5]_i_5
       (.I0(icmp_ln895_73_reg_5143),
        .I1(icmp_ln895_105_reg_5391),
        .I2(icmp_ln895_89_reg_5263),
        .O(\select_ln476_reg_5567[5]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \select_ln476_reg_5567[6]_i_1
       (.I0(select_ln440_fu_4188_p3),
        .I1(icmp_ln895_113_reg_5511),
        .I2(\select_ln476_reg_5567[6]_i_3_n_0 ),
        .I3(\select_ln476_reg_5567[6]_i_4_n_0 ),
        .I4(\select_ln476_reg_5567_reg[6]_i_5_n_0 ),
        .O(select_ln476_fu_4492_p3[6]));
  (* SOFT_HLUTNM = "soft_lutpair14" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln476_reg_5567[6]_i_10
       (.I0(select_ln440_2_reg_5309[2]),
        .I1(select_ln440_26_reg_5401[2]),
        .I2(icmp_ln895_113_reg_5511),
        .O(select_ln458_2_fu_4353_p3[2]));
  (* SOFT_HLUTNM = "soft_lutpair75" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln476_reg_5567[6]_i_11
       (.I0(select_ln440_14_reg_5353[3]),
        .I1(select_ln440_38_reg_5461[3]),
        .I2(icmp_ln895_117_reg_5539),
        .O(select_ln458_14_fu_4429_p3[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln476_reg_5567[6]_i_12
       (.I0(select_ln440_2_reg_5309[3]),
        .I1(select_ln440_26_reg_5401[3]),
        .I2(icmp_ln895_113_reg_5511),
        .O(select_ln458_2_fu_4353_p3[3]));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \select_ln476_reg_5567[6]_i_13
       (.I0(icmp_ln895_12_reg_4803),
        .I1(icmp_ln895_77_reg_5163),
        .I2(icmp_ln895_44_reg_4963),
        .I3(icmp_ln895_109_reg_5451),
        .I4(\select_ln476_reg_5567[6]_i_16_n_0 ),
        .O(\select_ln476_reg_5567[6]_i_13_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \select_ln476_reg_5567[6]_i_14
       (.I0(icmp_ln895_4_reg_4763),
        .I1(icmp_ln895_69_reg_5103),
        .I2(icmp_ln895_36_reg_4923),
        .I3(icmp_ln895_101_reg_5347),
        .I4(\select_ln476_reg_5567[6]_i_17_n_0 ),
        .O(\select_ln476_reg_5567[6]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln476_reg_5567[6]_i_15
       (.I0(select_ln440_2_reg_5309[1]),
        .I1(select_ln440_26_reg_5401[1]),
        .I2(icmp_ln895_113_reg_5511),
        .O(select_ln458_2_fu_4353_p3[1]));
  (* SOFT_HLUTNM = "soft_lutpair62" *)
  LUT3 #(
    .INIT(8'hB8))
    \select_ln476_reg_5567[6]_i_16
       (.I0(icmp_ln895_28_reg_4883),
        .I1(icmp_ln895_93_reg_5283),
        .I2(icmp_ln895_60_reg_5043),
        .O(\select_ln476_reg_5567[6]_i_16_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \select_ln476_reg_5567[6]_i_17
       (.I0(icmp_ln895_20_reg_4843),
        .I1(icmp_ln895_85_reg_5223),
        .I2(icmp_ln895_52_reg_5003),
        .O(\select_ln476_reg_5567[6]_i_17_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \select_ln476_reg_5567[6]_i_2
       (.I0(icmp_ln895_reg_4743),
        .I1(icmp_ln895_65_reg_5063),
        .I2(icmp_ln895_32_reg_4903),
        .I3(icmp_ln895_97_reg_5303),
        .I4(\select_ln476_reg_5567[6]_i_6_n_0 ),
        .O(select_ln440_fu_4188_p3));
  LUT5 #(
    .INIT(32'hB8FFB800))
    \select_ln476_reg_5567[6]_i_3
       (.I0(icmp_ln895_8_reg_4783),
        .I1(icmp_ln895_73_reg_5143),
        .I2(icmp_ln895_40_reg_4943),
        .I3(icmp_ln895_105_reg_5391),
        .I4(\select_ln476_reg_5567[6]_i_7_n_0 ),
        .O(\select_ln476_reg_5567[6]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hB2FF00B2))
    \select_ln476_reg_5567[6]_i_4
       (.I0(\select_ln476_reg_5567[6]_i_8_n_0 ),
        .I1(select_ln458_14_fu_4429_p3[2]),
        .I2(select_ln458_2_fu_4353_p3[2]),
        .I3(select_ln458_14_fu_4429_p3[3]),
        .I4(select_ln458_2_fu_4353_p3[3]),
        .O(\select_ln476_reg_5567[6]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8))
    \select_ln476_reg_5567[6]_i_6
       (.I0(icmp_ln895_16_reg_4823),
        .I1(icmp_ln895_81_reg_5183),
        .I2(icmp_ln895_48_reg_4983),
        .O(\select_ln476_reg_5567[6]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *)
  LUT3 #(
    .INIT(8'hB8))
    \select_ln476_reg_5567[6]_i_7
       (.I0(icmp_ln895_24_reg_4863),
        .I1(icmp_ln895_89_reg_5263),
        .I2(icmp_ln895_56_reg_5023),
        .O(\select_ln476_reg_5567[6]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h00E4FFFF000000E4))
    \select_ln476_reg_5567[6]_i_8
       (.I0(icmp_ln895_113_reg_5511),
        .I1(select_ln440_26_reg_5401[0]),
        .I2(select_ln440_2_reg_5309[0]),
        .I3(select_ln458_14_fu_4429_p3[0]),
        .I4(select_ln458_14_fu_4429_p3[1]),
        .I5(select_ln458_2_fu_4353_p3[1]),
        .O(\select_ln476_reg_5567[6]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *)
  LUT3 #(
    .INIT(8'hAC))
    \select_ln476_reg_5567[6]_i_9
       (.I0(select_ln440_14_reg_5353[2]),
        .I1(select_ln440_38_reg_5461[2]),
        .I2(icmp_ln895_117_reg_5539),
        .O(select_ln458_14_fu_4429_p3[2]));
  FDRE \select_ln476_reg_5567_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln476_fu_4492_p3[2]),
        .Q(select_ln476_reg_5567[2]),
        .R(1'b0));
  FDRE \select_ln476_reg_5567_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln476_fu_4492_p3[3]),
        .Q(select_ln476_reg_5567[3]),
        .R(1'b0));
  FDRE \select_ln476_reg_5567_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln476_fu_4492_p3[4]),
        .Q(select_ln476_reg_5567[4]),
        .R(1'b0));
  FDRE \select_ln476_reg_5567_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln476_fu_4492_p3[5]),
        .Q(select_ln476_reg_5567[5]),
        .R(1'b0));
  MUXF7 \select_ln476_reg_5567_reg[5]_i_1
       (.I0(\select_ln476_reg_5567[5]_i_2_n_0 ),
        .I1(\select_ln476_reg_5567[5]_i_3_n_0 ),
        .O(select_ln476_fu_4492_p3[5]),
        .S(\select_ln476_reg_5567[6]_i_4_n_0 ));
  FDRE \select_ln476_reg_5567_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(select_ln476_fu_4492_p3[6]),
        .Q(select_ln476_reg_5567[6]),
        .R(1'b0));
  MUXF7 \select_ln476_reg_5567_reg[6]_i_5
       (.I0(\select_ln476_reg_5567[6]_i_13_n_0 ),
        .I1(\select_ln476_reg_5567[6]_i_14_n_0 ),
        .O(\select_ln476_reg_5567_reg[6]_i_5_n_0 ),
        .S(icmp_ln895_117_reg_5539));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[0]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[0]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[10]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[10]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[11]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[11]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[12]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[12]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[12]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[13]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[13]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[13]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[1]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[1]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[2]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[2]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[3]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[3]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[4]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[4]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[5]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[5]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[6]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[6]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[7]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[7]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[8]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[8]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_pp0_iter1_reg_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_o_reg_4738[9]),
        .Q(slcvec_angle_polar_o_reg_4738_pp0_iter1_reg[9]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[0]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[0]),
        .Q(slcvec_angle_polar_o_reg_4738[0]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[10]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[10]),
        .Q(slcvec_angle_polar_o_reg_4738[10]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[11]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[11]),
        .Q(slcvec_angle_polar_o_reg_4738[11]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[12]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[12]),
        .Q(slcvec_angle_polar_o_reg_4738[12]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[13]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[13]),
        .Q(slcvec_angle_polar_o_reg_4738[13]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[1]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[1]),
        .Q(slcvec_angle_polar_o_reg_4738[1]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[2]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[2]),
        .Q(slcvec_angle_polar_o_reg_4738[2]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[3]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[3]),
        .Q(slcvec_angle_polar_o_reg_4738[3]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[4]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[4]),
        .Q(slcvec_angle_polar_o_reg_4738[4]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[5]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[5]),
        .Q(slcvec_angle_polar_o_reg_4738[5]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[6]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[6]),
        .Q(slcvec_angle_polar_o_reg_4738[6]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[7]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[7]),
        .Q(slcvec_angle_polar_o_reg_4738[7]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[8]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[8]),
        .Q(slcvec_angle_polar_o_reg_4738[8]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_4738_reg[9]
       (.C(ap_clk),
        .CE(1'b1),
        .D(slcvec_angle_polar_offset_mrad_V[9]),
        .Q(slcvec_angle_polar_o_reg_4738[9]),
        .R(1'b0));
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
