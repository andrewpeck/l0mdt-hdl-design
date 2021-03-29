// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Mon Mar 29 15:39:10 2021
// Host        : atlas126a running 64-bit openSUSE Tumbleweed
// Command     : write_verilog -force -mode funcsim
//               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_calc_LE_r_offset_barrel/hls_calc_LE_r_offset_barrel_sim_netlist.v
// Design      : hls_calc_LE_r_offset_barrel
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "hls_calc_LE_r_offset_barrel,calc_LE_r_offset_barrel,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "HLS" *) 
(* x_core_info = "calc_LE_r_offset_barrel,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module hls_calc_LE_r_offset_barrel
   (ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    hw_sin_val_V,
    hw_cos_val_V,
    roi_seed_r_V,
    hewindow_pos_ref_V,
    hewindow_pos_V,
    slcvec_pos_V,
    slcvec_pos_ref_V);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input ap_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ap_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input ap_rst;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) input ap_start;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_sin_val_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_sin_val_V, LAYERED_METADATA undef" *) input [17:0]hw_sin_val_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_cos_val_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_cos_val_V, LAYERED_METADATA undef" *) input [17:0]hw_cos_val_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 roi_seed_r_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME roi_seed_r_V, LAYERED_METADATA undef" *) output [21:0]roi_seed_r_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hewindow_pos_ref_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hewindow_pos_ref_V, LAYERED_METADATA undef" *) input [17:0]hewindow_pos_ref_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hewindow_pos_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hewindow_pos_V, LAYERED_METADATA undef" *) input [13:0]hewindow_pos_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 slcvec_pos_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME slcvec_pos_V, LAYERED_METADATA undef" *) input [13:0]slcvec_pos_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 slcvec_pos_ref_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME slcvec_pos_ref_V, LAYERED_METADATA undef" *) input [17:0]slcvec_pos_ref_V;

  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst;
  wire ap_start;
  wire [13:0]hewindow_pos_V;
  wire [17:0]hewindow_pos_ref_V;
  wire [17:0]hw_cos_val_V;
  wire [17:0]hw_sin_val_V;
  wire [21:0]roi_seed_r_V;
  wire [13:0]slcvec_pos_V;
  wire [17:0]slcvec_pos_ref_V;

  hls_calc_LE_r_offset_barrel_calc_LE_r_offset_barrel U0
       (.ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .hewindow_pos_V(hewindow_pos_V),
        .hewindow_pos_ref_V(hewindow_pos_ref_V),
        .hw_cos_val_V(hw_cos_val_V),
        .hw_sin_val_V(hw_sin_val_V),
        .roi_seed_r_V(roi_seed_r_V),
        .slcvec_pos_V(slcvec_pos_V),
        .slcvec_pos_ref_V(slcvec_pos_ref_V));
endmodule

(* ORIG_REF_NAME = "calc_LE_r_offset_barrel" *) 
module hls_calc_LE_r_offset_barrel_calc_LE_r_offset_barrel
   (ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    hw_sin_val_V,
    hw_cos_val_V,
    roi_seed_r_V,
    hewindow_pos_ref_V,
    hewindow_pos_V,
    slcvec_pos_V,
    slcvec_pos_ref_V);
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [17:0]hw_sin_val_V;
  input [17:0]hw_cos_val_V;
  output [21:0]roi_seed_r_V;
  input [17:0]hewindow_pos_ref_V;
  input [13:0]hewindow_pos_V;
  input [13:0]slcvec_pos_V;
  input [17:0]slcvec_pos_ref_V;

  wire RESIZE0;
  wire ap_clk;
  wire ap_done;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter2;
  wire ap_enable_reg_pp0_iter3;
  wire ap_enable_reg_pp0_iter4;
  wire ap_idle;
  wire ap_rst;
  wire ap_start;
  wire [13:0]hewindow_pos_V;
  wire [9:0]hewindow_pos_V_0_data_reg;
  wire [17:0]hewindow_pos_ref_V;
  wire [12:0]hewindow_pos_ref_V_0_data_reg;
  wire [17:0]hw_cos_val_V;
  wire [17:0]hw_cos_val_V_0_data_reg;
  wire [17:0]hw_sin_val_V;
  wire r_V_4_reg_228_reg_i_10_n_0;
  wire r_V_4_reg_228_reg_i_11_n_0;
  wire r_V_4_reg_228_reg_i_12_n_0;
  wire r_V_4_reg_228_reg_i_13_n_0;
  wire r_V_4_reg_228_reg_i_14_n_0;
  wire r_V_4_reg_228_reg_i_15_n_0;
  wire r_V_4_reg_228_reg_i_1_n_4;
  wire r_V_4_reg_228_reg_i_1_n_5;
  wire r_V_4_reg_228_reg_i_1_n_6;
  wire r_V_4_reg_228_reg_i_1_n_7;
  wire r_V_4_reg_228_reg_i_2_n_0;
  wire r_V_4_reg_228_reg_i_2_n_1;
  wire r_V_4_reg_228_reg_i_2_n_2;
  wire r_V_4_reg_228_reg_i_2_n_3;
  wire r_V_4_reg_228_reg_i_2_n_4;
  wire r_V_4_reg_228_reg_i_2_n_5;
  wire r_V_4_reg_228_reg_i_2_n_6;
  wire r_V_4_reg_228_reg_i_2_n_7;
  wire r_V_4_reg_228_reg_i_3_n_0;
  wire r_V_4_reg_228_reg_i_4_n_0;
  wire r_V_4_reg_228_reg_i_5_n_0;
  wire r_V_4_reg_228_reg_i_6_n_0;
  wire r_V_4_reg_228_reg_i_7_n_0;
  wire r_V_4_reg_228_reg_i_8_n_0;
  wire r_V_4_reg_228_reg_i_9_n_0;
  wire r_V_4_reg_228_reg_n_106;
  wire r_V_4_reg_228_reg_n_107;
  wire r_V_4_reg_228_reg_n_108;
  wire r_V_4_reg_228_reg_n_109;
  wire r_V_4_reg_228_reg_n_110;
  wire r_V_4_reg_228_reg_n_111;
  wire r_V_4_reg_228_reg_n_112;
  wire r_V_4_reg_228_reg_n_113;
  wire r_V_4_reg_228_reg_n_114;
  wire r_V_4_reg_228_reg_n_115;
  wire r_V_4_reg_228_reg_n_116;
  wire r_V_4_reg_228_reg_n_117;
  wire r_V_4_reg_228_reg_n_118;
  wire r_V_4_reg_228_reg_n_119;
  wire r_V_4_reg_228_reg_n_120;
  wire r_V_4_reg_228_reg_n_121;
  wire r_V_4_reg_228_reg_n_122;
  wire r_V_4_reg_228_reg_n_123;
  wire r_V_4_reg_228_reg_n_124;
  wire r_V_4_reg_228_reg_n_125;
  wire r_V_4_reg_228_reg_n_126;
  wire r_V_4_reg_228_reg_n_127;
  wire r_V_4_reg_228_reg_n_128;
  wire r_V_4_reg_228_reg_n_129;
  wire r_V_4_reg_228_reg_n_130;
  wire r_V_4_reg_228_reg_n_131;
  wire r_V_4_reg_228_reg_n_132;
  wire r_V_4_reg_228_reg_n_133;
  wire r_V_4_reg_228_reg_n_134;
  wire r_V_4_reg_228_reg_n_135;
  wire r_V_4_reg_228_reg_n_136;
  wire r_V_4_reg_228_reg_n_137;
  wire r_V_4_reg_228_reg_n_138;
  wire r_V_4_reg_228_reg_n_139;
  wire r_V_4_reg_228_reg_n_140;
  wire r_V_4_reg_228_reg_n_141;
  wire r_V_4_reg_228_reg_n_142;
  wire r_V_4_reg_228_reg_n_143;
  wire r_V_4_reg_228_reg_n_144;
  wire r_V_4_reg_228_reg_n_145;
  wire r_V_4_reg_228_reg_n_146;
  wire r_V_4_reg_228_reg_n_147;
  wire r_V_4_reg_228_reg_n_148;
  wire r_V_4_reg_228_reg_n_149;
  wire r_V_4_reg_228_reg_n_150;
  wire r_V_4_reg_228_reg_n_151;
  wire r_V_4_reg_228_reg_n_152;
  wire r_V_4_reg_228_reg_n_153;
  wire ret_V_reg_233_reg_i_10_n_0;
  wire ret_V_reg_233_reg_i_11_n_0;
  wire ret_V_reg_233_reg_i_12_n_0;
  wire ret_V_reg_233_reg_i_13_n_0;
  wire ret_V_reg_233_reg_i_14_n_0;
  wire ret_V_reg_233_reg_i_15_n_0;
  wire ret_V_reg_233_reg_i_16_n_0;
  wire ret_V_reg_233_reg_i_17_n_0;
  wire ret_V_reg_233_reg_i_18_n_0;
  wire ret_V_reg_233_reg_i_19_n_0;
  wire ret_V_reg_233_reg_i_1_n_7;
  wire ret_V_reg_233_reg_i_20_n_0;
  wire ret_V_reg_233_reg_i_2_n_0;
  wire ret_V_reg_233_reg_i_2_n_1;
  wire ret_V_reg_233_reg_i_2_n_2;
  wire ret_V_reg_233_reg_i_2_n_3;
  wire ret_V_reg_233_reg_i_2_n_4;
  wire ret_V_reg_233_reg_i_2_n_5;
  wire ret_V_reg_233_reg_i_2_n_6;
  wire ret_V_reg_233_reg_i_2_n_7;
  wire ret_V_reg_233_reg_i_3_n_0;
  wire ret_V_reg_233_reg_i_4_n_0;
  wire ret_V_reg_233_reg_i_5_n_0;
  wire ret_V_reg_233_reg_i_6_n_0;
  wire ret_V_reg_233_reg_i_7_n_0;
  wire ret_V_reg_233_reg_i_8_n_0;
  wire ret_V_reg_233_reg_i_9_n_0;
  wire ret_V_reg_233_reg_n_100;
  wire ret_V_reg_233_reg_n_101;
  wire ret_V_reg_233_reg_n_102;
  wire ret_V_reg_233_reg_n_103;
  wire ret_V_reg_233_reg_n_104;
  wire ret_V_reg_233_reg_n_105;
  wire ret_V_reg_233_reg_n_72;
  wire ret_V_reg_233_reg_n_73;
  wire ret_V_reg_233_reg_n_74;
  wire ret_V_reg_233_reg_n_75;
  wire ret_V_reg_233_reg_n_76;
  wire ret_V_reg_233_reg_n_77;
  wire ret_V_reg_233_reg_n_78;
  wire ret_V_reg_233_reg_n_79;
  wire ret_V_reg_233_reg_n_80;
  wire ret_V_reg_233_reg_n_81;
  wire ret_V_reg_233_reg_n_82;
  wire ret_V_reg_233_reg_n_83;
  wire ret_V_reg_233_reg_n_84;
  wire ret_V_reg_233_reg_n_85;
  wire ret_V_reg_233_reg_n_86;
  wire ret_V_reg_233_reg_n_87;
  wire ret_V_reg_233_reg_n_88;
  wire ret_V_reg_233_reg_n_89;
  wire ret_V_reg_233_reg_n_90;
  wire ret_V_reg_233_reg_n_91;
  wire ret_V_reg_233_reg_n_92;
  wire ret_V_reg_233_reg_n_93;
  wire ret_V_reg_233_reg_n_94;
  wire ret_V_reg_233_reg_n_95;
  wire ret_V_reg_233_reg_n_96;
  wire ret_V_reg_233_reg_n_97;
  wire ret_V_reg_233_reg_n_98;
  wire ret_V_reg_233_reg_n_99;
  wire [20:0]\^roi_seed_r_V ;
  wire roi_seed_r_V_1_data_reg1;
  wire \roi_seed_r_V_1_data_reg[10]_i_2_n_0 ;
  wire \roi_seed_r_V_1_data_reg[21]_i_2_n_0 ;
  wire \roi_seed_r_V_1_data_reg[21]_i_3_n_0 ;
  wire \roi_seed_r_V_1_data_reg[21]_i_4_n_0 ;
  wire \roi_seed_r_V_1_data_reg[21]_i_5_n_0 ;
  wire \roi_seed_r_V_1_data_reg[21]_i_6_n_0 ;
  wire \roi_seed_r_V_1_data_reg[21]_i_7_n_0 ;
  wire \roi_seed_r_V_1_data_reg[21]_i_8_n_0 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_0 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_1 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_10 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_11 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_12 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_13 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_14 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_15 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_2 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_3 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_4 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_5 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_6 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_7 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_8 ;
  wire \roi_seed_r_V_1_data_reg_reg[10]_i_1_n_9 ;
  wire \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_10 ;
  wire \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_11 ;
  wire \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_12 ;
  wire \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_13 ;
  wire \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_14 ;
  wire \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_15 ;
  wire \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_2 ;
  wire \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_3 ;
  wire \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_4 ;
  wire \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_5 ;
  wire \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_6 ;
  wire \roi_seed_r_V_1_data_reg_reg[21]_i_1_n_7 ;
  wire [12:3]shl_ln_fu_103_p3;
  wire [13:0]slcvec_pos_V;
  wire [17:0]slcvec_pos_ref_V;
  wire [12:0]slcvec_pos_ref_V_0_data_reg;
  wire [12:0]sub_ln731_1_fu_137_p21_out;
  wire [12:3]sub_ln731_fu_123_p20_out;
  wire NLW_r_V_4_reg_228_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_r_V_4_reg_228_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_r_V_4_reg_228_reg_OVERFLOW_UNCONNECTED;
  wire NLW_r_V_4_reg_228_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_r_V_4_reg_228_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_r_V_4_reg_228_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_r_V_4_reg_228_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_r_V_4_reg_228_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_r_V_4_reg_228_reg_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_r_V_4_reg_228_reg_P_UNCONNECTED;
  wire [7:0]NLW_r_V_4_reg_228_reg_XOROUT_UNCONNECTED;
  wire [7:4]NLW_r_V_4_reg_228_reg_i_1_CO_UNCONNECTED;
  wire [7:5]NLW_r_V_4_reg_228_reg_i_1_O_UNCONNECTED;
  wire NLW_ret_V_reg_233_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_ret_V_reg_233_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_ret_V_reg_233_reg_OVERFLOW_UNCONNECTED;
  wire NLW_ret_V_reg_233_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_ret_V_reg_233_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_ret_V_reg_233_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_ret_V_reg_233_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_ret_V_reg_233_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_ret_V_reg_233_reg_CARRYOUT_UNCONNECTED;
  wire [47:34]NLW_ret_V_reg_233_reg_P_UNCONNECTED;
  wire [47:0]NLW_ret_V_reg_233_reg_PCOUT_UNCONNECTED;
  wire [7:0]NLW_ret_V_reg_233_reg_XOROUT_UNCONNECTED;
  wire [7:1]NLW_ret_V_reg_233_reg_i_1_CO_UNCONNECTED;
  wire [7:2]NLW_ret_V_reg_233_reg_i_1_O_UNCONNECTED;
  wire [7:6]\NLW_roi_seed_r_V_1_data_reg_reg[21]_i_1_CO_UNCONNECTED ;
  wire [7:7]\NLW_roi_seed_r_V_1_data_reg_reg[21]_i_1_O_UNCONNECTED ;

  assign ap_ready = ap_start;
  assign roi_seed_r_V[21] = \^roi_seed_r_V [20];
  assign roi_seed_r_V[20] = \^roi_seed_r_V [20];
  assign roi_seed_r_V[19] = \^roi_seed_r_V [20];
  assign roi_seed_r_V[18] = \^roi_seed_r_V [20];
  assign roi_seed_r_V[17] = \^roi_seed_r_V [20];
  assign roi_seed_r_V[16:0] = \^roi_seed_r_V [16:0];
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
        .Q(ap_enable_reg_pp0_iter4),
        .R(ap_rst));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter5_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter4),
        .Q(ap_done),
        .R(ap_rst));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    ap_idle_INST_0
       (.I0(ap_enable_reg_pp0_iter2),
        .I1(ap_enable_reg_pp0_iter3),
        .I2(ap_done),
        .I3(ap_enable_reg_pp0_iter1),
        .I4(ap_start),
        .I5(ap_enable_reg_pp0_iter4),
        .O(ap_idle));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_V_0_data_reg_reg[0] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_V[0]),
        .Q(hewindow_pos_V_0_data_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_V_0_data_reg_reg[1] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_V[1]),
        .Q(hewindow_pos_V_0_data_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_V_0_data_reg_reg[2] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_V[2]),
        .Q(hewindow_pos_V_0_data_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_V_0_data_reg_reg[3] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_V[3]),
        .Q(hewindow_pos_V_0_data_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_V_0_data_reg_reg[4] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_V[4]),
        .Q(hewindow_pos_V_0_data_reg[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_V_0_data_reg_reg[5] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_V[5]),
        .Q(hewindow_pos_V_0_data_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_V_0_data_reg_reg[6] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_V[6]),
        .Q(hewindow_pos_V_0_data_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_V_0_data_reg_reg[7] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_V[7]),
        .Q(hewindow_pos_V_0_data_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_V_0_data_reg_reg[8] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_V[8]),
        .Q(hewindow_pos_V_0_data_reg[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_V_0_data_reg_reg[9] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_V[9]),
        .Q(hewindow_pos_V_0_data_reg[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \hewindow_pos_ref_V_0_data_reg[12]_i_1 
       (.I0(ap_enable_reg_pp0_iter4),
        .I1(ap_start),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(ap_done),
        .I4(ap_enable_reg_pp0_iter3),
        .I5(ap_enable_reg_pp0_iter2),
        .O(roi_seed_r_V_1_data_reg1));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_ref_V_0_data_reg_reg[0] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_ref_V[0]),
        .Q(hewindow_pos_ref_V_0_data_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_ref_V_0_data_reg_reg[10] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_ref_V[10]),
        .Q(hewindow_pos_ref_V_0_data_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_ref_V_0_data_reg_reg[11] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_ref_V[11]),
        .Q(hewindow_pos_ref_V_0_data_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_ref_V_0_data_reg_reg[12] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_ref_V[12]),
        .Q(hewindow_pos_ref_V_0_data_reg[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_ref_V_0_data_reg_reg[1] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_ref_V[1]),
        .Q(hewindow_pos_ref_V_0_data_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_ref_V_0_data_reg_reg[2] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_ref_V[2]),
        .Q(hewindow_pos_ref_V_0_data_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_ref_V_0_data_reg_reg[3] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_ref_V[3]),
        .Q(hewindow_pos_ref_V_0_data_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_ref_V_0_data_reg_reg[4] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_ref_V[4]),
        .Q(hewindow_pos_ref_V_0_data_reg[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_ref_V_0_data_reg_reg[5] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_ref_V[5]),
        .Q(hewindow_pos_ref_V_0_data_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_ref_V_0_data_reg_reg[6] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_ref_V[6]),
        .Q(hewindow_pos_ref_V_0_data_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_ref_V_0_data_reg_reg[7] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_ref_V[7]),
        .Q(hewindow_pos_ref_V_0_data_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_ref_V_0_data_reg_reg[8] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_ref_V[8]),
        .Q(hewindow_pos_ref_V_0_data_reg[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hewindow_pos_ref_V_0_data_reg_reg[9] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hewindow_pos_ref_V[9]),
        .Q(hewindow_pos_ref_V_0_data_reg[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[0] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[0]),
        .Q(hw_cos_val_V_0_data_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[10] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[10]),
        .Q(hw_cos_val_V_0_data_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[11] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[11]),
        .Q(hw_cos_val_V_0_data_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[12] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[12]),
        .Q(hw_cos_val_V_0_data_reg[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[13] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[13]),
        .Q(hw_cos_val_V_0_data_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[14] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[14]),
        .Q(hw_cos_val_V_0_data_reg[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[15] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[15]),
        .Q(hw_cos_val_V_0_data_reg[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[16] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[16]),
        .Q(hw_cos_val_V_0_data_reg[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[17] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[17]),
        .Q(hw_cos_val_V_0_data_reg[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[1] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[1]),
        .Q(hw_cos_val_V_0_data_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[2] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[2]),
        .Q(hw_cos_val_V_0_data_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[3] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[3]),
        .Q(hw_cos_val_V_0_data_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[4] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[4]),
        .Q(hw_cos_val_V_0_data_reg[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[5] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[5]),
        .Q(hw_cos_val_V_0_data_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[6] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[6]),
        .Q(hw_cos_val_V_0_data_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[7] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[7]),
        .Q(hw_cos_val_V_0_data_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[8] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[8]),
        .Q(hw_cos_val_V_0_data_reg[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hw_cos_val_V_0_data_reg_reg[9] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(hw_cos_val_V[9]),
        .Q(hw_cos_val_V_0_data_reg[9]),
        .R(1'b0));
  DSP48E2 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(0),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    r_V_4_reg_228_reg
       (.A({hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_r_V_4_reg_228_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({sub_ln731_1_fu_137_p21_out[12],sub_ln731_1_fu_137_p21_out[12],sub_ln731_1_fu_137_p21_out[12],sub_ln731_1_fu_137_p21_out,1'b0,1'b0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_r_V_4_reg_228_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_r_V_4_reg_228_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_r_V_4_reg_228_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(roi_seed_r_V_1_data_reg1),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b1),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_r_V_4_reg_228_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_r_V_4_reg_228_reg_OVERFLOW_UNCONNECTED),
        .P(NLW_r_V_4_reg_228_reg_P_UNCONNECTED[47:0]),
        .PATTERNBDETECT(NLW_r_V_4_reg_228_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_r_V_4_reg_228_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({r_V_4_reg_228_reg_n_106,r_V_4_reg_228_reg_n_107,r_V_4_reg_228_reg_n_108,r_V_4_reg_228_reg_n_109,r_V_4_reg_228_reg_n_110,r_V_4_reg_228_reg_n_111,r_V_4_reg_228_reg_n_112,r_V_4_reg_228_reg_n_113,r_V_4_reg_228_reg_n_114,r_V_4_reg_228_reg_n_115,r_V_4_reg_228_reg_n_116,r_V_4_reg_228_reg_n_117,r_V_4_reg_228_reg_n_118,r_V_4_reg_228_reg_n_119,r_V_4_reg_228_reg_n_120,r_V_4_reg_228_reg_n_121,r_V_4_reg_228_reg_n_122,r_V_4_reg_228_reg_n_123,r_V_4_reg_228_reg_n_124,r_V_4_reg_228_reg_n_125,r_V_4_reg_228_reg_n_126,r_V_4_reg_228_reg_n_127,r_V_4_reg_228_reg_n_128,r_V_4_reg_228_reg_n_129,r_V_4_reg_228_reg_n_130,r_V_4_reg_228_reg_n_131,r_V_4_reg_228_reg_n_132,r_V_4_reg_228_reg_n_133,r_V_4_reg_228_reg_n_134,r_V_4_reg_228_reg_n_135,r_V_4_reg_228_reg_n_136,r_V_4_reg_228_reg_n_137,r_V_4_reg_228_reg_n_138,r_V_4_reg_228_reg_n_139,r_V_4_reg_228_reg_n_140,r_V_4_reg_228_reg_n_141,r_V_4_reg_228_reg_n_142,r_V_4_reg_228_reg_n_143,r_V_4_reg_228_reg_n_144,r_V_4_reg_228_reg_n_145,r_V_4_reg_228_reg_n_146,r_V_4_reg_228_reg_n_147,r_V_4_reg_228_reg_n_148,r_V_4_reg_228_reg_n_149,r_V_4_reg_228_reg_n_150,r_V_4_reg_228_reg_n_151,r_V_4_reg_228_reg_n_152,r_V_4_reg_228_reg_n_153}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_r_V_4_reg_228_reg_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_r_V_4_reg_228_reg_XOROUT_UNCONNECTED[7:0]));
  CARRY8 r_V_4_reg_228_reg_i_1
       (.CI(r_V_4_reg_228_reg_i_2_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_r_V_4_reg_228_reg_i_1_CO_UNCONNECTED[7:4],r_V_4_reg_228_reg_i_1_n_4,r_V_4_reg_228_reg_i_1_n_5,r_V_4_reg_228_reg_i_1_n_6,r_V_4_reg_228_reg_i_1_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,slcvec_pos_ref_V_0_data_reg[11:8]}),
        .O({NLW_r_V_4_reg_228_reg_i_1_O_UNCONNECTED[7:5],sub_ln731_1_fu_137_p21_out[12:8]}),
        .S({1'b0,1'b0,1'b0,r_V_4_reg_228_reg_i_3_n_0,r_V_4_reg_228_reg_i_4_n_0,r_V_4_reg_228_reg_i_5_n_0,r_V_4_reg_228_reg_i_6_n_0,r_V_4_reg_228_reg_i_7_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    r_V_4_reg_228_reg_i_10
       (.I0(slcvec_pos_ref_V_0_data_reg[5]),
        .I1(hewindow_pos_ref_V_0_data_reg[5]),
        .O(r_V_4_reg_228_reg_i_10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    r_V_4_reg_228_reg_i_11
       (.I0(slcvec_pos_ref_V_0_data_reg[4]),
        .I1(hewindow_pos_ref_V_0_data_reg[4]),
        .O(r_V_4_reg_228_reg_i_11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    r_V_4_reg_228_reg_i_12
       (.I0(slcvec_pos_ref_V_0_data_reg[3]),
        .I1(hewindow_pos_ref_V_0_data_reg[3]),
        .O(r_V_4_reg_228_reg_i_12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    r_V_4_reg_228_reg_i_13
       (.I0(slcvec_pos_ref_V_0_data_reg[2]),
        .I1(hewindow_pos_ref_V_0_data_reg[2]),
        .O(r_V_4_reg_228_reg_i_13_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    r_V_4_reg_228_reg_i_14
       (.I0(slcvec_pos_ref_V_0_data_reg[1]),
        .I1(hewindow_pos_ref_V_0_data_reg[1]),
        .O(r_V_4_reg_228_reg_i_14_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    r_V_4_reg_228_reg_i_15
       (.I0(slcvec_pos_ref_V_0_data_reg[0]),
        .I1(hewindow_pos_ref_V_0_data_reg[0]),
        .O(r_V_4_reg_228_reg_i_15_n_0));
  CARRY8 r_V_4_reg_228_reg_i_2
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({r_V_4_reg_228_reg_i_2_n_0,r_V_4_reg_228_reg_i_2_n_1,r_V_4_reg_228_reg_i_2_n_2,r_V_4_reg_228_reg_i_2_n_3,r_V_4_reg_228_reg_i_2_n_4,r_V_4_reg_228_reg_i_2_n_5,r_V_4_reg_228_reg_i_2_n_6,r_V_4_reg_228_reg_i_2_n_7}),
        .DI(slcvec_pos_ref_V_0_data_reg[7:0]),
        .O(sub_ln731_1_fu_137_p21_out[7:0]),
        .S({r_V_4_reg_228_reg_i_8_n_0,r_V_4_reg_228_reg_i_9_n_0,r_V_4_reg_228_reg_i_10_n_0,r_V_4_reg_228_reg_i_11_n_0,r_V_4_reg_228_reg_i_12_n_0,r_V_4_reg_228_reg_i_13_n_0,r_V_4_reg_228_reg_i_14_n_0,r_V_4_reg_228_reg_i_15_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    r_V_4_reg_228_reg_i_3
       (.I0(slcvec_pos_ref_V_0_data_reg[12]),
        .I1(hewindow_pos_ref_V_0_data_reg[12]),
        .O(r_V_4_reg_228_reg_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    r_V_4_reg_228_reg_i_4
       (.I0(slcvec_pos_ref_V_0_data_reg[11]),
        .I1(hewindow_pos_ref_V_0_data_reg[11]),
        .O(r_V_4_reg_228_reg_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    r_V_4_reg_228_reg_i_5
       (.I0(slcvec_pos_ref_V_0_data_reg[10]),
        .I1(hewindow_pos_ref_V_0_data_reg[10]),
        .O(r_V_4_reg_228_reg_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    r_V_4_reg_228_reg_i_6
       (.I0(slcvec_pos_ref_V_0_data_reg[9]),
        .I1(hewindow_pos_ref_V_0_data_reg[9]),
        .O(r_V_4_reg_228_reg_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    r_V_4_reg_228_reg_i_7
       (.I0(slcvec_pos_ref_V_0_data_reg[8]),
        .I1(hewindow_pos_ref_V_0_data_reg[8]),
        .O(r_V_4_reg_228_reg_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    r_V_4_reg_228_reg_i_8
       (.I0(slcvec_pos_ref_V_0_data_reg[7]),
        .I1(hewindow_pos_ref_V_0_data_reg[7]),
        .O(r_V_4_reg_228_reg_i_8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    r_V_4_reg_228_reg_i_9
       (.I0(slcvec_pos_ref_V_0_data_reg[6]),
        .I1(hewindow_pos_ref_V_0_data_reg[6]),
        .O(r_V_4_reg_228_reg_i_9_n_0));
  DSP48E2 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(2),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BMULTSEL("B"),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    ret_V_reg_233_reg
       (.A({hw_cos_val_V_0_data_reg[17],hw_cos_val_V_0_data_reg[17],hw_cos_val_V_0_data_reg[17],hw_cos_val_V_0_data_reg[17],hw_cos_val_V_0_data_reg[17],hw_cos_val_V_0_data_reg[17],hw_cos_val_V_0_data_reg[17],hw_cos_val_V_0_data_reg[17],hw_cos_val_V_0_data_reg[17],hw_cos_val_V_0_data_reg[17],hw_cos_val_V_0_data_reg[17],hw_cos_val_V_0_data_reg[17],hw_cos_val_V_0_data_reg}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_ret_V_reg_233_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({sub_ln731_fu_123_p20_out[12],sub_ln731_fu_123_p20_out[12],sub_ln731_fu_123_p20_out[12],sub_ln731_fu_123_p20_out,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_ret_V_reg_233_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_ret_V_reg_233_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_ret_V_reg_233_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(ap_enable_reg_pp0_iter3),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_ret_V_reg_233_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_ret_V_reg_233_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_ret_V_reg_233_reg_P_UNCONNECTED[47:34],ret_V_reg_233_reg_n_72,ret_V_reg_233_reg_n_73,ret_V_reg_233_reg_n_74,ret_V_reg_233_reg_n_75,ret_V_reg_233_reg_n_76,ret_V_reg_233_reg_n_77,ret_V_reg_233_reg_n_78,ret_V_reg_233_reg_n_79,ret_V_reg_233_reg_n_80,ret_V_reg_233_reg_n_81,ret_V_reg_233_reg_n_82,ret_V_reg_233_reg_n_83,ret_V_reg_233_reg_n_84,ret_V_reg_233_reg_n_85,ret_V_reg_233_reg_n_86,ret_V_reg_233_reg_n_87,ret_V_reg_233_reg_n_88,ret_V_reg_233_reg_n_89,ret_V_reg_233_reg_n_90,ret_V_reg_233_reg_n_91,ret_V_reg_233_reg_n_92,ret_V_reg_233_reg_n_93,ret_V_reg_233_reg_n_94,ret_V_reg_233_reg_n_95,ret_V_reg_233_reg_n_96,ret_V_reg_233_reg_n_97,ret_V_reg_233_reg_n_98,ret_V_reg_233_reg_n_99,ret_V_reg_233_reg_n_100,ret_V_reg_233_reg_n_101,ret_V_reg_233_reg_n_102,ret_V_reg_233_reg_n_103,ret_V_reg_233_reg_n_104,ret_V_reg_233_reg_n_105}),
        .PATTERNBDETECT(NLW_ret_V_reg_233_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_ret_V_reg_233_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({r_V_4_reg_228_reg_n_106,r_V_4_reg_228_reg_n_107,r_V_4_reg_228_reg_n_108,r_V_4_reg_228_reg_n_109,r_V_4_reg_228_reg_n_110,r_V_4_reg_228_reg_n_111,r_V_4_reg_228_reg_n_112,r_V_4_reg_228_reg_n_113,r_V_4_reg_228_reg_n_114,r_V_4_reg_228_reg_n_115,r_V_4_reg_228_reg_n_116,r_V_4_reg_228_reg_n_117,r_V_4_reg_228_reg_n_118,r_V_4_reg_228_reg_n_119,r_V_4_reg_228_reg_n_120,r_V_4_reg_228_reg_n_121,r_V_4_reg_228_reg_n_122,r_V_4_reg_228_reg_n_123,r_V_4_reg_228_reg_n_124,r_V_4_reg_228_reg_n_125,r_V_4_reg_228_reg_n_126,r_V_4_reg_228_reg_n_127,r_V_4_reg_228_reg_n_128,r_V_4_reg_228_reg_n_129,r_V_4_reg_228_reg_n_130,r_V_4_reg_228_reg_n_131,r_V_4_reg_228_reg_n_132,r_V_4_reg_228_reg_n_133,r_V_4_reg_228_reg_n_134,r_V_4_reg_228_reg_n_135,r_V_4_reg_228_reg_n_136,r_V_4_reg_228_reg_n_137,r_V_4_reg_228_reg_n_138,r_V_4_reg_228_reg_n_139,r_V_4_reg_228_reg_n_140,r_V_4_reg_228_reg_n_141,r_V_4_reg_228_reg_n_142,r_V_4_reg_228_reg_n_143,r_V_4_reg_228_reg_n_144,r_V_4_reg_228_reg_n_145,r_V_4_reg_228_reg_n_146,r_V_4_reg_228_reg_n_147,r_V_4_reg_228_reg_n_148,r_V_4_reg_228_reg_n_149,r_V_4_reg_228_reg_n_150,r_V_4_reg_228_reg_n_151,r_V_4_reg_228_reg_n_152,r_V_4_reg_228_reg_n_153}),
        .PCOUT(NLW_ret_V_reg_233_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_ret_V_reg_233_reg_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_ret_V_reg_233_reg_XOROUT_UNCONNECTED[7:0]));
  CARRY8 ret_V_reg_233_reg_i_1
       (.CI(ret_V_reg_233_reg_i_2_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_ret_V_reg_233_reg_i_1_CO_UNCONNECTED[7:1],ret_V_reg_233_reg_i_1_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ret_V_reg_233_reg_i_3_n_0}),
        .O({NLW_ret_V_reg_233_reg_i_1_O_UNCONNECTED[7:2],sub_ln731_fu_123_p20_out[12:11]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ret_V_reg_233_reg_i_4_n_0,ret_V_reg_233_reg_i_5_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    ret_V_reg_233_reg_i_10
       (.I0(shl_ln_fu_103_p3[5]),
        .I1(hewindow_pos_V_0_data_reg[2]),
        .O(ret_V_reg_233_reg_i_10_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    ret_V_reg_233_reg_i_11
       (.I0(shl_ln_fu_103_p3[4]),
        .I1(hewindow_pos_V_0_data_reg[1]),
        .O(ret_V_reg_233_reg_i_11_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    ret_V_reg_233_reg_i_12
       (.I0(shl_ln_fu_103_p3[3]),
        .I1(hewindow_pos_V_0_data_reg[0]),
        .O(ret_V_reg_233_reg_i_12_n_0));
  LUT4 #(
    .INIT(16'hB44B)) 
    ret_V_reg_233_reg_i_13
       (.I0(hewindow_pos_V_0_data_reg[6]),
        .I1(shl_ln_fu_103_p3[9]),
        .I2(hewindow_pos_V_0_data_reg[7]),
        .I3(shl_ln_fu_103_p3[10]),
        .O(ret_V_reg_233_reg_i_13_n_0));
  LUT4 #(
    .INIT(16'hB44B)) 
    ret_V_reg_233_reg_i_14
       (.I0(hewindow_pos_V_0_data_reg[5]),
        .I1(shl_ln_fu_103_p3[8]),
        .I2(hewindow_pos_V_0_data_reg[6]),
        .I3(shl_ln_fu_103_p3[9]),
        .O(ret_V_reg_233_reg_i_14_n_0));
  LUT4 #(
    .INIT(16'hB44B)) 
    ret_V_reg_233_reg_i_15
       (.I0(hewindow_pos_V_0_data_reg[4]),
        .I1(shl_ln_fu_103_p3[7]),
        .I2(hewindow_pos_V_0_data_reg[5]),
        .I3(shl_ln_fu_103_p3[8]),
        .O(ret_V_reg_233_reg_i_15_n_0));
  LUT4 #(
    .INIT(16'hB44B)) 
    ret_V_reg_233_reg_i_16
       (.I0(hewindow_pos_V_0_data_reg[3]),
        .I1(shl_ln_fu_103_p3[6]),
        .I2(hewindow_pos_V_0_data_reg[4]),
        .I3(shl_ln_fu_103_p3[7]),
        .O(ret_V_reg_233_reg_i_16_n_0));
  LUT4 #(
    .INIT(16'hB44B)) 
    ret_V_reg_233_reg_i_17
       (.I0(hewindow_pos_V_0_data_reg[2]),
        .I1(shl_ln_fu_103_p3[5]),
        .I2(hewindow_pos_V_0_data_reg[3]),
        .I3(shl_ln_fu_103_p3[6]),
        .O(ret_V_reg_233_reg_i_17_n_0));
  LUT4 #(
    .INIT(16'hB44B)) 
    ret_V_reg_233_reg_i_18
       (.I0(hewindow_pos_V_0_data_reg[1]),
        .I1(shl_ln_fu_103_p3[4]),
        .I2(hewindow_pos_V_0_data_reg[2]),
        .I3(shl_ln_fu_103_p3[5]),
        .O(ret_V_reg_233_reg_i_18_n_0));
  LUT4 #(
    .INIT(16'h2DD2)) 
    ret_V_reg_233_reg_i_19
       (.I0(hewindow_pos_V_0_data_reg[0]),
        .I1(shl_ln_fu_103_p3[3]),
        .I2(hewindow_pos_V_0_data_reg[1]),
        .I3(shl_ln_fu_103_p3[4]),
        .O(ret_V_reg_233_reg_i_19_n_0));
  CARRY8 ret_V_reg_233_reg_i_2
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({ret_V_reg_233_reg_i_2_n_0,ret_V_reg_233_reg_i_2_n_1,ret_V_reg_233_reg_i_2_n_2,ret_V_reg_233_reg_i_2_n_3,ret_V_reg_233_reg_i_2_n_4,ret_V_reg_233_reg_i_2_n_5,ret_V_reg_233_reg_i_2_n_6,ret_V_reg_233_reg_i_2_n_7}),
        .DI({ret_V_reg_233_reg_i_6_n_0,ret_V_reg_233_reg_i_7_n_0,ret_V_reg_233_reg_i_8_n_0,ret_V_reg_233_reg_i_9_n_0,ret_V_reg_233_reg_i_10_n_0,ret_V_reg_233_reg_i_11_n_0,ret_V_reg_233_reg_i_12_n_0,1'b0}),
        .O(sub_ln731_fu_123_p20_out[10:3]),
        .S({ret_V_reg_233_reg_i_13_n_0,ret_V_reg_233_reg_i_14_n_0,ret_V_reg_233_reg_i_15_n_0,ret_V_reg_233_reg_i_16_n_0,ret_V_reg_233_reg_i_17_n_0,ret_V_reg_233_reg_i_18_n_0,ret_V_reg_233_reg_i_19_n_0,ret_V_reg_233_reg_i_20_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    ret_V_reg_233_reg_i_20
       (.I0(shl_ln_fu_103_p3[3]),
        .I1(hewindow_pos_V_0_data_reg[0]),
        .O(ret_V_reg_233_reg_i_20_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    ret_V_reg_233_reg_i_3
       (.I0(shl_ln_fu_103_p3[10]),
        .I1(hewindow_pos_V_0_data_reg[7]),
        .O(ret_V_reg_233_reg_i_3_n_0));
  LUT4 #(
    .INIT(16'hB44B)) 
    ret_V_reg_233_reg_i_4
       (.I0(hewindow_pos_V_0_data_reg[8]),
        .I1(shl_ln_fu_103_p3[11]),
        .I2(hewindow_pos_V_0_data_reg[9]),
        .I3(shl_ln_fu_103_p3[12]),
        .O(ret_V_reg_233_reg_i_4_n_0));
  LUT4 #(
    .INIT(16'hB44B)) 
    ret_V_reg_233_reg_i_5
       (.I0(hewindow_pos_V_0_data_reg[7]),
        .I1(shl_ln_fu_103_p3[10]),
        .I2(hewindow_pos_V_0_data_reg[8]),
        .I3(shl_ln_fu_103_p3[11]),
        .O(ret_V_reg_233_reg_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    ret_V_reg_233_reg_i_6
       (.I0(shl_ln_fu_103_p3[9]),
        .I1(hewindow_pos_V_0_data_reg[6]),
        .O(ret_V_reg_233_reg_i_6_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    ret_V_reg_233_reg_i_7
       (.I0(shl_ln_fu_103_p3[8]),
        .I1(hewindow_pos_V_0_data_reg[5]),
        .O(ret_V_reg_233_reg_i_7_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    ret_V_reg_233_reg_i_8
       (.I0(shl_ln_fu_103_p3[7]),
        .I1(hewindow_pos_V_0_data_reg[4]),
        .O(ret_V_reg_233_reg_i_8_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    ret_V_reg_233_reg_i_9
       (.I0(shl_ln_fu_103_p3[6]),
        .I1(hewindow_pos_V_0_data_reg[3]),
        .O(ret_V_reg_233_reg_i_9_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \roi_seed_r_V_1_data_reg[10]_i_2 
       (.I0(ret_V_reg_233_reg_n_85),
        .O(\roi_seed_r_V_1_data_reg[10]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \roi_seed_r_V_1_data_reg[21]_i_2 
       (.I0(ret_V_reg_233_reg_n_72),
        .O(\roi_seed_r_V_1_data_reg[21]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \roi_seed_r_V_1_data_reg[21]_i_3 
       (.I0(ret_V_reg_233_reg_n_73),
        .O(\roi_seed_r_V_1_data_reg[21]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \roi_seed_r_V_1_data_reg[21]_i_4 
       (.I0(ret_V_reg_233_reg_n_74),
        .O(\roi_seed_r_V_1_data_reg[21]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \roi_seed_r_V_1_data_reg[21]_i_5 
       (.I0(ret_V_reg_233_reg_n_75),
        .O(\roi_seed_r_V_1_data_reg[21]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \roi_seed_r_V_1_data_reg[21]_i_6 
       (.I0(ret_V_reg_233_reg_n_76),
        .O(\roi_seed_r_V_1_data_reg[21]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \roi_seed_r_V_1_data_reg[21]_i_7 
       (.I0(ret_V_reg_233_reg_n_77),
        .O(\roi_seed_r_V_1_data_reg[21]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \roi_seed_r_V_1_data_reg[21]_i_8 
       (.I0(ret_V_reg_233_reg_n_78),
        .O(\roi_seed_r_V_1_data_reg[21]_i_8_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[0] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(ret_V_reg_233_reg_n_89),
        .Q(\^roi_seed_r_V [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[10] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_8 ),
        .Q(\^roi_seed_r_V [10]),
        .R(1'b0));
  CARRY8 \roi_seed_r_V_1_data_reg_reg[10]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_0 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_1 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_2 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_3 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_4 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_5 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_6 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,ret_V_reg_233_reg_n_85,1'b0}),
        .O({\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_8 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_9 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_10 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_11 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_12 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_13 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_14 ,\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_15 }),
        .S({ret_V_reg_233_reg_n_79,ret_V_reg_233_reg_n_80,ret_V_reg_233_reg_n_81,ret_V_reg_233_reg_n_82,ret_V_reg_233_reg_n_83,ret_V_reg_233_reg_n_84,\roi_seed_r_V_1_data_reg[10]_i_2_n_0 ,ret_V_reg_233_reg_n_86}));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[11] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_15 ),
        .Q(\^roi_seed_r_V [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[12] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_14 ),
        .Q(\^roi_seed_r_V [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[13] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_13 ),
        .Q(\^roi_seed_r_V [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[14] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_12 ),
        .Q(\^roi_seed_r_V [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[15] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_11 ),
        .Q(\^roi_seed_r_V [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[16] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_10 ),
        .Q(\^roi_seed_r_V [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[1] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(ret_V_reg_233_reg_n_88),
        .Q(\^roi_seed_r_V [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[21] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(RESIZE0),
        .Q(\^roi_seed_r_V [20]),
        .R(1'b0));
  CARRY8 \roi_seed_r_V_1_data_reg_reg[21]_i_1 
       (.CI(\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_roi_seed_r_V_1_data_reg_reg[21]_i_1_CO_UNCONNECTED [7:6],\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_2 ,\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_3 ,\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_4 ,\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_5 ,\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_6 ,\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_7 }),
        .DI({1'b0,1'b0,ret_V_reg_233_reg_n_73,ret_V_reg_233_reg_n_74,ret_V_reg_233_reg_n_75,ret_V_reg_233_reg_n_76,ret_V_reg_233_reg_n_77,ret_V_reg_233_reg_n_78}),
        .O({\NLW_roi_seed_r_V_1_data_reg_reg[21]_i_1_O_UNCONNECTED [7],RESIZE0,\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_10 ,\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_11 ,\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_12 ,\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_13 ,\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_14 ,\roi_seed_r_V_1_data_reg_reg[21]_i_1_n_15 }),
        .S({1'b0,\roi_seed_r_V_1_data_reg[21]_i_2_n_0 ,\roi_seed_r_V_1_data_reg[21]_i_3_n_0 ,\roi_seed_r_V_1_data_reg[21]_i_4_n_0 ,\roi_seed_r_V_1_data_reg[21]_i_5_n_0 ,\roi_seed_r_V_1_data_reg[21]_i_6_n_0 ,\roi_seed_r_V_1_data_reg[21]_i_7_n_0 ,\roi_seed_r_V_1_data_reg[21]_i_8_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[2] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(ret_V_reg_233_reg_n_87),
        .Q(\^roi_seed_r_V [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[3] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_15 ),
        .Q(\^roi_seed_r_V [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[4] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_14 ),
        .Q(\^roi_seed_r_V [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[5] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_13 ),
        .Q(\^roi_seed_r_V [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[6] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_12 ),
        .Q(\^roi_seed_r_V [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[7] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_11 ),
        .Q(\^roi_seed_r_V [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[8] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_10 ),
        .Q(\^roi_seed_r_V [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \roi_seed_r_V_1_data_reg_reg[9] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter4),
        .D(\roi_seed_r_V_1_data_reg_reg[10]_i_1_n_9 ),
        .Q(\^roi_seed_r_V [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_V_0_data_reg_reg[0] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_V[0]),
        .Q(shl_ln_fu_103_p3[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_V_0_data_reg_reg[1] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_V[1]),
        .Q(shl_ln_fu_103_p3[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_V_0_data_reg_reg[2] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_V[2]),
        .Q(shl_ln_fu_103_p3[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_V_0_data_reg_reg[3] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_V[3]),
        .Q(shl_ln_fu_103_p3[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_V_0_data_reg_reg[4] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_V[4]),
        .Q(shl_ln_fu_103_p3[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_V_0_data_reg_reg[5] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_V[5]),
        .Q(shl_ln_fu_103_p3[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_V_0_data_reg_reg[6] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_V[6]),
        .Q(shl_ln_fu_103_p3[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_V_0_data_reg_reg[7] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_V[7]),
        .Q(shl_ln_fu_103_p3[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_V_0_data_reg_reg[8] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_V[8]),
        .Q(shl_ln_fu_103_p3[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_V_0_data_reg_reg[9] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_V[9]),
        .Q(shl_ln_fu_103_p3[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_ref_V_0_data_reg_reg[0] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_ref_V[0]),
        .Q(slcvec_pos_ref_V_0_data_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_ref_V_0_data_reg_reg[10] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_ref_V[10]),
        .Q(slcvec_pos_ref_V_0_data_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_ref_V_0_data_reg_reg[11] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_ref_V[11]),
        .Q(slcvec_pos_ref_V_0_data_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_ref_V_0_data_reg_reg[12] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_ref_V[12]),
        .Q(slcvec_pos_ref_V_0_data_reg[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_ref_V_0_data_reg_reg[1] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_ref_V[1]),
        .Q(slcvec_pos_ref_V_0_data_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_ref_V_0_data_reg_reg[2] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_ref_V[2]),
        .Q(slcvec_pos_ref_V_0_data_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_ref_V_0_data_reg_reg[3] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_ref_V[3]),
        .Q(slcvec_pos_ref_V_0_data_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_ref_V_0_data_reg_reg[4] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_ref_V[4]),
        .Q(slcvec_pos_ref_V_0_data_reg[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_ref_V_0_data_reg_reg[5] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_ref_V[5]),
        .Q(slcvec_pos_ref_V_0_data_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_ref_V_0_data_reg_reg[6] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_ref_V[6]),
        .Q(slcvec_pos_ref_V_0_data_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_ref_V_0_data_reg_reg[7] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_ref_V[7]),
        .Q(slcvec_pos_ref_V_0_data_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_ref_V_0_data_reg_reg[8] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_ref_V[8]),
        .Q(slcvec_pos_ref_V_0_data_reg[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_pos_ref_V_0_data_reg_reg[9] 
       (.C(ap_clk),
        .CE(roi_seed_r_V_1_data_reg1),
        .D(slcvec_pos_ref_V[9]),
        .Q(slcvec_pos_ref_V_0_data_reg[9]),
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
