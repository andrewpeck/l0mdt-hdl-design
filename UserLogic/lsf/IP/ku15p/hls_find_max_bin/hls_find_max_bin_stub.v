// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Mon Mar 29 15:39:15 2021
// Host        : atlas126a running 64-bit openSUSE Tumbleweed
// Command     : write_verilog -force -mode synth_stub
//               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_find_max_bin/hls_find_max_bin_stub.v
// Design      : hls_find_max_bin
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "find_max_bin,Vivado 2019.2.1" *)
module hls_find_max_bin(hls_LT_theta_global_V_ap_vld, 
  hls_LT_r_global_V_ap_vld, hls_LT_theta_V_ap_vld, hls_LT_r_V_ap_vld, 
  res_max_bin_count_V_ap_vld, res_max_bin_theta_V_ap_vld, res_max_bin_r_V_ap_vld, ap_clk, 
  ap_rst, ap_start, ap_done, ap_idle, ap_ready, slcvec_angle_polar_offset_mrad_V, roi_seed_r_V, 
  max_bin_count_0_V, max_bin_count_1_V, max_bin_count_2_V, max_bin_count_3_V, 
  max_bin_count_4_V, max_bin_count_5_V, max_bin_count_6_V, max_bin_count_7_V, 
  max_bin_count_8_V, max_bin_count_9_V, max_bin_count_10_V, max_bin_count_11_V, 
  max_bin_count_12_V, max_bin_count_13_V, max_bin_count_14_V, max_bin_count_15_V, 
  max_bin_count_16_V, max_bin_count_17_V, max_bin_count_18_V, max_bin_count_19_V, 
  max_bin_count_20_V, max_bin_count_21_V, max_bin_count_22_V, max_bin_count_23_V, 
  max_bin_count_24_V, max_bin_count_25_V, max_bin_count_26_V, max_bin_count_27_V, 
  max_bin_count_28_V, max_bin_count_29_V, max_bin_count_30_V, max_bin_count_31_V, 
  max_bin_count_32_V, max_bin_count_33_V, max_bin_count_34_V, max_bin_count_35_V, 
  max_bin_count_36_V, max_bin_count_37_V, max_bin_count_38_V, max_bin_count_39_V, 
  max_bin_count_40_V, max_bin_count_41_V, max_bin_count_42_V, max_bin_count_43_V, 
  max_bin_count_44_V, max_bin_count_45_V, max_bin_count_46_V, max_bin_count_47_V, 
  max_bin_count_48_V, max_bin_count_49_V, max_bin_count_50_V, max_bin_count_51_V, 
  max_bin_count_52_V, max_bin_count_53_V, max_bin_count_54_V, max_bin_count_55_V, 
  max_bin_count_56_V, max_bin_count_57_V, max_bin_count_58_V, max_bin_count_59_V, 
  max_bin_count_60_V, max_bin_count_61_V, max_bin_count_62_V, max_bin_count_63_V, 
  max_bin_r_0_V, max_bin_r_1_V, max_bin_r_2_V, max_bin_r_3_V, max_bin_r_4_V, max_bin_r_5_V, 
  max_bin_r_6_V, max_bin_r_7_V, max_bin_r_8_V, max_bin_r_9_V, max_bin_r_10_V, max_bin_r_11_V, 
  max_bin_r_12_V, max_bin_r_13_V, max_bin_r_14_V, max_bin_r_15_V, max_bin_r_16_V, 
  max_bin_r_17_V, max_bin_r_18_V, max_bin_r_19_V, max_bin_r_20_V, max_bin_r_21_V, 
  max_bin_r_22_V, max_bin_r_23_V, max_bin_r_24_V, max_bin_r_25_V, max_bin_r_26_V, 
  max_bin_r_27_V, max_bin_r_28_V, max_bin_r_29_V, max_bin_r_30_V, max_bin_r_31_V, 
  max_bin_r_32_V, max_bin_r_33_V, max_bin_r_34_V, max_bin_r_35_V, max_bin_r_36_V, 
  max_bin_r_37_V, max_bin_r_38_V, max_bin_r_39_V, max_bin_r_40_V, max_bin_r_41_V, 
  max_bin_r_42_V, max_bin_r_43_V, max_bin_r_44_V, max_bin_r_45_V, max_bin_r_46_V, 
  max_bin_r_47_V, max_bin_r_48_V, max_bin_r_49_V, max_bin_r_50_V, max_bin_r_51_V, 
  max_bin_r_52_V, max_bin_r_53_V, max_bin_r_54_V, max_bin_r_55_V, max_bin_r_56_V, 
  max_bin_r_57_V, max_bin_r_58_V, max_bin_r_59_V, max_bin_r_60_V, max_bin_r_61_V, 
  max_bin_r_62_V, max_bin_r_63_V, hls_LT_theta_global_V, hls_LT_r_global_V, hls_LT_theta_V, 
  hls_LT_r_V, res_max_bin_count_V, res_max_bin_theta_V, res_max_bin_r_V)
/* synthesis syn_black_box black_box_pad_pin="hls_LT_theta_global_V_ap_vld,hls_LT_r_global_V_ap_vld,hls_LT_theta_V_ap_vld,hls_LT_r_V_ap_vld,res_max_bin_count_V_ap_vld,res_max_bin_theta_V_ap_vld,res_max_bin_r_V_ap_vld,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,slcvec_angle_polar_offset_mrad_V[13:0],roi_seed_r_V[21:0],max_bin_count_0_V[3:0],max_bin_count_1_V[3:0],max_bin_count_2_V[3:0],max_bin_count_3_V[3:0],max_bin_count_4_V[3:0],max_bin_count_5_V[3:0],max_bin_count_6_V[3:0],max_bin_count_7_V[3:0],max_bin_count_8_V[3:0],max_bin_count_9_V[3:0],max_bin_count_10_V[3:0],max_bin_count_11_V[3:0],max_bin_count_12_V[3:0],max_bin_count_13_V[3:0],max_bin_count_14_V[3:0],max_bin_count_15_V[3:0],max_bin_count_16_V[3:0],max_bin_count_17_V[3:0],max_bin_count_18_V[3:0],max_bin_count_19_V[3:0],max_bin_count_20_V[3:0],max_bin_count_21_V[3:0],max_bin_count_22_V[3:0],max_bin_count_23_V[3:0],max_bin_count_24_V[3:0],max_bin_count_25_V[3:0],max_bin_count_26_V[3:0],max_bin_count_27_V[3:0],max_bin_count_28_V[3:0],max_bin_count_29_V[3:0],max_bin_count_30_V[3:0],max_bin_count_31_V[3:0],max_bin_count_32_V[3:0],max_bin_count_33_V[3:0],max_bin_count_34_V[3:0],max_bin_count_35_V[3:0],max_bin_count_36_V[3:0],max_bin_count_37_V[3:0],max_bin_count_38_V[3:0],max_bin_count_39_V[3:0],max_bin_count_40_V[3:0],max_bin_count_41_V[3:0],max_bin_count_42_V[3:0],max_bin_count_43_V[3:0],max_bin_count_44_V[3:0],max_bin_count_45_V[3:0],max_bin_count_46_V[3:0],max_bin_count_47_V[3:0],max_bin_count_48_V[3:0],max_bin_count_49_V[3:0],max_bin_count_50_V[3:0],max_bin_count_51_V[3:0],max_bin_count_52_V[3:0],max_bin_count_53_V[3:0],max_bin_count_54_V[3:0],max_bin_count_55_V[3:0],max_bin_count_56_V[3:0],max_bin_count_57_V[3:0],max_bin_count_58_V[3:0],max_bin_count_59_V[3:0],max_bin_count_60_V[3:0],max_bin_count_61_V[3:0],max_bin_count_62_V[3:0],max_bin_count_63_V[3:0],max_bin_r_0_V[6:0],max_bin_r_1_V[6:0],max_bin_r_2_V[6:0],max_bin_r_3_V[6:0],max_bin_r_4_V[6:0],max_bin_r_5_V[6:0],max_bin_r_6_V[6:0],max_bin_r_7_V[6:0],max_bin_r_8_V[6:0],max_bin_r_9_V[6:0],max_bin_r_10_V[6:0],max_bin_r_11_V[6:0],max_bin_r_12_V[6:0],max_bin_r_13_V[6:0],max_bin_r_14_V[6:0],max_bin_r_15_V[6:0],max_bin_r_16_V[6:0],max_bin_r_17_V[6:0],max_bin_r_18_V[6:0],max_bin_r_19_V[6:0],max_bin_r_20_V[6:0],max_bin_r_21_V[6:0],max_bin_r_22_V[6:0],max_bin_r_23_V[6:0],max_bin_r_24_V[6:0],max_bin_r_25_V[6:0],max_bin_r_26_V[6:0],max_bin_r_27_V[6:0],max_bin_r_28_V[6:0],max_bin_r_29_V[6:0],max_bin_r_30_V[6:0],max_bin_r_31_V[6:0],max_bin_r_32_V[6:0],max_bin_r_33_V[6:0],max_bin_r_34_V[6:0],max_bin_r_35_V[6:0],max_bin_r_36_V[6:0],max_bin_r_37_V[6:0],max_bin_r_38_V[6:0],max_bin_r_39_V[6:0],max_bin_r_40_V[6:0],max_bin_r_41_V[6:0],max_bin_r_42_V[6:0],max_bin_r_43_V[6:0],max_bin_r_44_V[6:0],max_bin_r_45_V[6:0],max_bin_r_46_V[6:0],max_bin_r_47_V[6:0],max_bin_r_48_V[6:0],max_bin_r_49_V[6:0],max_bin_r_50_V[6:0],max_bin_r_51_V[6:0],max_bin_r_52_V[6:0],max_bin_r_53_V[6:0],max_bin_r_54_V[6:0],max_bin_r_55_V[6:0],max_bin_r_56_V[6:0],max_bin_r_57_V[6:0],max_bin_r_58_V[6:0],max_bin_r_59_V[6:0],max_bin_r_60_V[6:0],max_bin_r_61_V[6:0],max_bin_r_62_V[6:0],max_bin_r_63_V[6:0],hls_LT_theta_global_V[13:0],hls_LT_r_global_V[21:0],hls_LT_theta_V[13:0],hls_LT_r_V[21:0],res_max_bin_count_V[3:0],res_max_bin_theta_V[6:0],res_max_bin_r_V[6:0]" */;
  output hls_LT_theta_global_V_ap_vld;
  output hls_LT_r_global_V_ap_vld;
  output hls_LT_theta_V_ap_vld;
  output hls_LT_r_V_ap_vld;
  output res_max_bin_count_V_ap_vld;
  output res_max_bin_theta_V_ap_vld;
  output res_max_bin_r_V_ap_vld;
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
  output [21:0]hls_LT_r_global_V;
  output [13:0]hls_LT_theta_V;
  output [21:0]hls_LT_r_V;
  output [3:0]res_max_bin_count_V;
  output [6:0]res_max_bin_theta_V;
  output [6:0]res_max_bin_r_V;
endmodule
