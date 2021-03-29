// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Mon Mar 29 15:39:12 2021
// Host        : atlas126a running 64-bit openSUSE Tumbleweed
// Command     : write_verilog -force -mode funcsim
//               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_compute_r_bins/hls_compute_r_bins_sim_netlist.v
// Design      : hls_compute_r_bins
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "hls_compute_r_bins,compute_r_bins,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "HLS" *) 
(* x_core_info = "compute_r_bins,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module hls_compute_r_bins
   (ap_clk,
    ap_rst_n,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    mdt_r_offset_V_TVALID,
    mdt_r_offset_V_TREADY,
    mdt_r_offset_V_TDATA,
    r_bin_V_TVALID,
    r_bin_V_TREADY,
    r_bin_V_TDATA,
    mdt_localx_V,
    mdt_localy_V,
    hw_sin_val_V,
    hw_cos_val_V);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF mdt_r_offset_V:r_bin_V, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input ap_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ap_rst_n;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) input ap_start;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 mdt_r_offset_V TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME mdt_r_offset_V, TDATA_NUM_BYTES 3, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input mdt_r_offset_V_TVALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 mdt_r_offset_V TREADY" *) output mdt_r_offset_V_TREADY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 mdt_r_offset_V TDATA" *) input [23:0]mdt_r_offset_V_TDATA;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 r_bin_V TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME r_bin_V, TDATA_NUM_BYTES 1, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) output r_bin_V_TVALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 r_bin_V TREADY" *) input r_bin_V_TREADY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 r_bin_V TDATA" *) output [7:0]r_bin_V_TDATA;
  (* x_interface_info = "xilinx.com:signal:data:1.0 mdt_localx_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME mdt_localx_V, LAYERED_METADATA undef" *) input [14:0]mdt_localx_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 mdt_localy_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME mdt_localy_V, LAYERED_METADATA undef" *) input [14:0]mdt_localy_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_sin_val_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_sin_val_V, LAYERED_METADATA undef" *) input [17:0]hw_sin_val_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hw_cos_val_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hw_cos_val_V, LAYERED_METADATA undef" *) input [17:0]hw_cos_val_V;

  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst_n;
  wire ap_start;
  wire [17:0]hw_cos_val_V;
  wire [17:0]hw_sin_val_V;
  wire [14:0]mdt_localx_V;
  wire [14:0]mdt_localy_V;
  wire [23:0]mdt_r_offset_V_TDATA;
  wire mdt_r_offset_V_TREADY;
  wire mdt_r_offset_V_TVALID;
  wire [7:0]r_bin_V_TDATA;
  wire r_bin_V_TREADY;
  wire r_bin_V_TVALID;

  hls_compute_r_bins_compute_r_bins U0
       (.ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .hw_cos_val_V(hw_cos_val_V),
        .hw_sin_val_V(hw_sin_val_V),
        .mdt_localx_V(mdt_localx_V),
        .mdt_localy_V(mdt_localy_V),
        .mdt_r_offset_V_TDATA(mdt_r_offset_V_TDATA),
        .mdt_r_offset_V_TREADY(mdt_r_offset_V_TREADY),
        .mdt_r_offset_V_TVALID(mdt_r_offset_V_TVALID),
        .r_bin_V_TDATA(r_bin_V_TDATA),
        .r_bin_V_TREADY(r_bin_V_TREADY),
        .r_bin_V_TVALID(r_bin_V_TVALID));
endmodule

(* ORIG_REF_NAME = "compute_r_bins" *) 
module hls_compute_r_bins_compute_r_bins
   (ap_clk,
    ap_rst_n,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    mdt_r_offset_V_TVALID,
    r_bin_V_TREADY,
    mdt_localx_V,
    mdt_localy_V,
    mdt_r_offset_V_TDATA,
    mdt_r_offset_V_TREADY,
    hw_sin_val_V,
    hw_cos_val_V,
    r_bin_V_TDATA,
    r_bin_V_TVALID);
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input mdt_r_offset_V_TVALID;
  input r_bin_V_TREADY;
  input [14:0]mdt_localx_V;
  input [14:0]mdt_localy_V;
  input [23:0]mdt_r_offset_V_TDATA;
  output mdt_r_offset_V_TREADY;
  input [17:0]hw_sin_val_V;
  input [17:0]hw_cos_val_V;
  output [7:0]r_bin_V_TDATA;
  output r_bin_V_TVALID;

  wire \<const0> ;
  wire [11:5]add_ln1353_1_fu_138_p2;
  wire [11:5]add_ln1353_3_fu_163_p2;
  wire ap_CS_fsm_pp0_stage1;
  wire \ap_CS_fsm_reg_n_0_[0] ;
  wire [1:0]ap_NS_fsm;
  wire ap_clk;
  wire ap_done;
  wire ap_enable_reg_pp0_iter0;
  wire ap_enable_reg_pp0_iter0_reg;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter10;
  wire ap_enable_reg_pp0_iter2;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst;
  wire ap_rst_n;
  wire ap_start;
  wire [6:0]data_in;
  wire [17:0]hw_cos_val_V;
  wire [17:0]hw_sin_val_V;
  wire \ibuf_inst/p_0_in ;
  wire [14:0]mdt_localx_V;
  wire [14:0]mdt_localy_V;
  wire [23:0]mdt_r_offset_V_TDATA;
  wire mdt_r_offset_V_TREADY;
  wire mdt_r_offset_V_TVALID;
  wire [6:0]\^r_bin_V_TDATA ;
  wire r_bin_V_TREADY;
  wire r_bin_V_TVALID;
  wire regslice_both_mdt_r_offset_V_U_n_13;
  wire regslice_both_mdt_r_offset_V_U_n_14;
  wire regslice_both_mdt_r_offset_V_U_n_15;
  wire regslice_both_mdt_r_offset_V_U_n_16;
  wire regslice_both_mdt_r_offset_V_U_n_17;
  wire regslice_both_mdt_r_offset_V_U_n_18;
  wire regslice_both_mdt_r_offset_V_U_n_19;
  wire regslice_both_mdt_r_offset_V_U_n_20;
  wire regslice_both_mdt_r_offset_V_U_n_21;
  wire regslice_both_mdt_r_offset_V_U_n_22;
  wire regslice_both_mdt_r_offset_V_U_n_23;
  wire regslice_both_mdt_r_offset_V_U_n_24;
  wire regslice_both_mdt_r_offset_V_U_n_7;
  wire regslice_both_r_bin_V_U_n_15;
  wire regslice_both_r_bin_V_U_n_2;
  wire regslice_both_r_bin_V_U_n_24;
  wire regslice_both_r_bin_V_U_n_3;
  wire regslice_both_r_bin_V_U_n_4;
  wire ret_V_1_reg_2190;
  wire ret_V_1_reg_219_reg_i_1_n_0;
  wire ret_V_1_reg_219_reg_n_100;
  wire ret_V_1_reg_219_reg_n_101;
  wire ret_V_1_reg_219_reg_n_102;
  wire ret_V_1_reg_219_reg_n_103;
  wire ret_V_1_reg_219_reg_n_104;
  wire ret_V_1_reg_219_reg_n_105;
  wire ret_V_1_reg_219_reg_n_90;
  wire ret_V_1_reg_219_reg_n_91;
  wire ret_V_1_reg_219_reg_n_92;
  wire ret_V_1_reg_219_reg_n_93;
  wire ret_V_1_reg_219_reg_n_94;
  wire ret_V_1_reg_219_reg_n_95;
  wire ret_V_1_reg_219_reg_n_96;
  wire ret_V_1_reg_219_reg_n_97;
  wire ret_V_1_reg_219_reg_n_98;
  wire ret_V_1_reg_219_reg_n_99;
  wire ret_V_reg_209_reg_n_100;
  wire ret_V_reg_209_reg_n_101;
  wire ret_V_reg_209_reg_n_102;
  wire ret_V_reg_209_reg_n_103;
  wire ret_V_reg_209_reg_n_104;
  wire ret_V_reg_209_reg_n_105;
  wire ret_V_reg_209_reg_n_90;
  wire ret_V_reg_209_reg_n_91;
  wire ret_V_reg_209_reg_n_92;
  wire ret_V_reg_209_reg_n_93;
  wire ret_V_reg_209_reg_n_94;
  wire ret_V_reg_209_reg_n_95;
  wire ret_V_reg_209_reg_n_96;
  wire ret_V_reg_209_reg_n_97;
  wire ret_V_reg_209_reg_n_98;
  wire ret_V_reg_209_reg_n_99;
  wire [11:0]tmp_fu_124_p4;
  wire [11:0]trunc_ln1353_1_reg_214;
  wire [11:0]trunc_ln1353_reg_194;
  wire [11:0]trunc_ln1353_reg_194_pp0_iter1_reg;
  wire \trunc_ln1503_1_reg_235[2]_i_10_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_11_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_12_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_13_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_14_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_15_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_16_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_2_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_3_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_4_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_5_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_6_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_7_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_8_n_0 ;
  wire \trunc_ln1503_1_reg_235[2]_i_9_n_0 ;
  wire \trunc_ln1503_1_reg_235[6]_i_2_n_0 ;
  wire \trunc_ln1503_1_reg_235[6]_i_3_n_0 ;
  wire \trunc_ln1503_1_reg_235[6]_i_4_n_0 ;
  wire \trunc_ln1503_1_reg_235[6]_i_5_n_0 ;
  wire \trunc_ln1503_1_reg_235[6]_i_6_n_0 ;
  wire \trunc_ln1503_1_reg_235[6]_i_7_n_0 ;
  wire \trunc_ln1503_1_reg_235[6]_i_8_n_0 ;
  wire \trunc_ln1503_1_reg_235_reg[2]_i_1_n_0 ;
  wire \trunc_ln1503_1_reg_235_reg[2]_i_1_n_1 ;
  wire \trunc_ln1503_1_reg_235_reg[2]_i_1_n_2 ;
  wire \trunc_ln1503_1_reg_235_reg[2]_i_1_n_3 ;
  wire \trunc_ln1503_1_reg_235_reg[2]_i_1_n_4 ;
  wire \trunc_ln1503_1_reg_235_reg[2]_i_1_n_5 ;
  wire \trunc_ln1503_1_reg_235_reg[2]_i_1_n_6 ;
  wire \trunc_ln1503_1_reg_235_reg[2]_i_1_n_7 ;
  wire \trunc_ln1503_1_reg_235_reg[6]_i_1_n_5 ;
  wire \trunc_ln1503_1_reg_235_reg[6]_i_1_n_6 ;
  wire \trunc_ln1503_1_reg_235_reg[6]_i_1_n_7 ;
  wire \trunc_ln1503_1_reg_235_reg_n_0_[0] ;
  wire \trunc_ln1503_1_reg_235_reg_n_0_[1] ;
  wire \trunc_ln1503_1_reg_235_reg_n_0_[2] ;
  wire \trunc_ln1503_1_reg_235_reg_n_0_[3] ;
  wire \trunc_ln1503_1_reg_235_reg_n_0_[4] ;
  wire \trunc_ln1503_1_reg_235_reg_n_0_[5] ;
  wire \trunc_ln1503_1_reg_235_reg_n_0_[6] ;
  wire vld_out;
  wire [11:0]zext_ln215_1_cast_reg_224;
  wire NLW_ret_V_1_reg_219_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_ret_V_1_reg_219_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_ret_V_1_reg_219_reg_OVERFLOW_UNCONNECTED;
  wire NLW_ret_V_1_reg_219_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_ret_V_1_reg_219_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_ret_V_1_reg_219_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_ret_V_1_reg_219_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_ret_V_1_reg_219_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_ret_V_1_reg_219_reg_CARRYOUT_UNCONNECTED;
  wire [47:28]NLW_ret_V_1_reg_219_reg_P_UNCONNECTED;
  wire [47:0]NLW_ret_V_1_reg_219_reg_PCOUT_UNCONNECTED;
  wire [7:0]NLW_ret_V_1_reg_219_reg_XOROUT_UNCONNECTED;
  wire NLW_ret_V_reg_209_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_ret_V_reg_209_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_ret_V_reg_209_reg_OVERFLOW_UNCONNECTED;
  wire NLW_ret_V_reg_209_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_ret_V_reg_209_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_ret_V_reg_209_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_ret_V_reg_209_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_ret_V_reg_209_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_ret_V_reg_209_reg_CARRYOUT_UNCONNECTED;
  wire [47:28]NLW_ret_V_reg_209_reg_P_UNCONNECTED;
  wire [47:0]NLW_ret_V_reg_209_reg_PCOUT_UNCONNECTED;
  wire [7:0]NLW_ret_V_reg_209_reg_XOROUT_UNCONNECTED;
  wire [4:0]\NLW_trunc_ln1503_1_reg_235_reg[2]_i_1_O_UNCONNECTED ;
  wire [7:3]\NLW_trunc_ln1503_1_reg_235_reg[6]_i_1_CO_UNCONNECTED ;
  wire [7:4]\NLW_trunc_ln1503_1_reg_235_reg[6]_i_1_O_UNCONNECTED ;

  assign r_bin_V_TDATA[7] = \<const0> ;
  assign r_bin_V_TDATA[6:0] = \^r_bin_V_TDATA [6:0];
  GND GND
       (.G(\<const0> ));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[0]),
        .Q(\ap_CS_fsm_reg_n_0_[0] ),
        .S(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[1]),
        .Q(ap_CS_fsm_pp0_stage1),
        .R(ap_rst));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter0_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_enable_reg_pp0_iter0),
        .Q(ap_enable_reg_pp0_iter0_reg),
        .R(ap_rst));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter1_reg
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(ap_enable_reg_pp0_iter0),
        .Q(ap_enable_reg_pp0_iter1),
        .R(ap_rst));
  FDRE #(
    .INIT(1'b0)) 
    ap_enable_reg_pp0_iter2_reg
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(ap_enable_reg_pp0_iter1),
        .Q(ap_enable_reg_pp0_iter2),
        .R(ap_rst));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    ap_idle_INST_0
       (.I0(ap_start),
        .I1(\ap_CS_fsm_reg_n_0_[0] ),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(ap_enable_reg_pp0_iter2),
        .O(ap_idle));
  hls_compute_r_bins_regslice_both regslice_both_mdt_r_offset_V_U
       (.D(data_in),
        .E(ret_V_1_reg_2190),
        .Q({\trunc_ln1503_1_reg_235_reg_n_0_[6] ,\trunc_ln1503_1_reg_235_reg_n_0_[5] ,\trunc_ln1503_1_reg_235_reg_n_0_[4] ,\trunc_ln1503_1_reg_235_reg_n_0_[3] ,\trunc_ln1503_1_reg_235_reg_n_0_[2] ,\trunc_ln1503_1_reg_235_reg_n_0_[1] ,\trunc_ln1503_1_reg_235_reg_n_0_[0] }),
        .SR(ap_rst),
        .add_ln1353_1_fu_138_p2(add_ln1353_1_fu_138_p2),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter0(ap_enable_reg_pp0_iter0),
        .ap_enable_reg_pp0_iter0_reg(ap_enable_reg_pp0_iter0_reg),
        .ap_enable_reg_pp0_iter2(ap_enable_reg_pp0_iter2),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .\ireg_reg[0] (regslice_both_r_bin_V_U_n_2),
        .\ireg_reg[0]_0 (regslice_both_r_bin_V_U_n_3),
        .\ireg_reg[24] (\ibuf_inst/p_0_in ),
        .\ireg_reg[24]_0 ({mdt_r_offset_V_TVALID,mdt_r_offset_V_TDATA[11:0]}),
        .\ireg_reg[24]_1 (regslice_both_r_bin_V_U_n_24),
        .mdt_r_offset_V_TREADY(mdt_r_offset_V_TREADY),
        .\odata_int_reg[0] (regslice_both_r_bin_V_U_n_15),
        .\odata_int_reg[24] (regslice_both_mdt_r_offset_V_U_n_7),
        .\odata_int_reg[24]_0 ({vld_out,regslice_both_mdt_r_offset_V_U_n_13,regslice_both_mdt_r_offset_V_U_n_14,regslice_both_mdt_r_offset_V_U_n_15,regslice_both_mdt_r_offset_V_U_n_16,regslice_both_mdt_r_offset_V_U_n_17,regslice_both_mdt_r_offset_V_U_n_18,regslice_both_mdt_r_offset_V_U_n_19,regslice_both_mdt_r_offset_V_U_n_20,regslice_both_mdt_r_offset_V_U_n_21,regslice_both_mdt_r_offset_V_U_n_22,regslice_both_mdt_r_offset_V_U_n_23,regslice_both_mdt_r_offset_V_U_n_24}),
        .\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0] (\ap_CS_fsm_reg_n_0_[0] ),
        .\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0 (regslice_both_r_bin_V_U_n_4));
  hls_compute_r_bins_regslice_both__parameterized1 regslice_both_r_bin_V_U
       (.CEM(ap_enable_reg_pp0_iter10),
        .D(ap_NS_fsm),
        .P(tmp_fu_124_p4),
        .Q({ap_CS_fsm_pp0_stage1,\ap_CS_fsm_reg_n_0_[0] }),
        .SR(ap_rst),
        .add_ln1353_1_fu_138_p2(add_ln1353_1_fu_138_p2),
        .\ap_CS_fsm_reg[1] (regslice_both_r_bin_V_U_n_3),
        .ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_enable_reg_pp0_iter0(ap_enable_reg_pp0_iter0),
        .ap_enable_reg_pp0_iter0_reg(ap_enable_reg_pp0_iter0_reg),
        .ap_enable_reg_pp0_iter1(ap_enable_reg_pp0_iter1),
        .ap_enable_reg_pp0_iter2(ap_enable_reg_pp0_iter2),
        .ap_enable_reg_pp0_iter2_reg(regslice_both_r_bin_V_U_n_2),
        .ap_ready(ap_ready),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .\ireg_reg[24] (\ibuf_inst/p_0_in ),
        .\ireg_reg[6] (data_in),
        .\ireg_reg[8] (regslice_both_r_bin_V_U_n_4),
        .\ireg_reg[8]_0 (regslice_both_mdt_r_offset_V_U_n_7),
        .\odata_int_reg[0] (vld_out),
        .\odata_int_reg[24] (regslice_both_r_bin_V_U_n_15),
        .\odata_int_reg[24]_0 (regslice_both_r_bin_V_U_n_24),
        .\odata_int_reg[6] ({\trunc_ln1503_1_reg_235_reg_n_0_[6] ,\trunc_ln1503_1_reg_235_reg_n_0_[5] ,\trunc_ln1503_1_reg_235_reg_n_0_[4] ,\trunc_ln1503_1_reg_235_reg_n_0_[3] ,\trunc_ln1503_1_reg_235_reg_n_0_[2] ,\trunc_ln1503_1_reg_235_reg_n_0_[1] ,\trunc_ln1503_1_reg_235_reg_n_0_[0] }),
        .\odata_int_reg[6]_i_4 (zext_ln215_1_cast_reg_224),
        .\odata_int_reg[6]_i_4_0 (trunc_ln1353_reg_194_pp0_iter1_reg),
        .\odata_int_reg[8] ({r_bin_V_TVALID,\^r_bin_V_TDATA }),
        .r_bin_V_TREADY(r_bin_V_TREADY));
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
    ret_V_1_reg_219_reg
       (.A({hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V[17],hw_sin_val_V}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_ret_V_1_reg_219_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({mdt_localy_V[14],mdt_localy_V[14],mdt_localy_V[14],mdt_localy_V}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_ret_V_1_reg_219_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_ret_V_1_reg_219_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_ret_V_1_reg_219_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(ret_V_1_reg_219_reg_i_1_n_0),
        .CEA2(ap_enable_reg_pp0_iter10),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(ret_V_1_reg_219_reg_i_1_n_0),
        .CEB2(ap_enable_reg_pp0_iter10),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(ret_V_1_reg_2190),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_ret_V_1_reg_219_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_ret_V_1_reg_219_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_ret_V_1_reg_219_reg_P_UNCONNECTED[47:28],tmp_fu_124_p4,ret_V_1_reg_219_reg_n_90,ret_V_1_reg_219_reg_n_91,ret_V_1_reg_219_reg_n_92,ret_V_1_reg_219_reg_n_93,ret_V_1_reg_219_reg_n_94,ret_V_1_reg_219_reg_n_95,ret_V_1_reg_219_reg_n_96,ret_V_1_reg_219_reg_n_97,ret_V_1_reg_219_reg_n_98,ret_V_1_reg_219_reg_n_99,ret_V_1_reg_219_reg_n_100,ret_V_1_reg_219_reg_n_101,ret_V_1_reg_219_reg_n_102,ret_V_1_reg_219_reg_n_103,ret_V_1_reg_219_reg_n_104,ret_V_1_reg_219_reg_n_105}),
        .PATTERNBDETECT(NLW_ret_V_1_reg_219_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_ret_V_1_reg_219_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_ret_V_1_reg_219_reg_PCOUT_UNCONNECTED[47:0]),
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
        .UNDERFLOW(NLW_ret_V_1_reg_219_reg_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_ret_V_1_reg_219_reg_XOROUT_UNCONNECTED[7:0]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    ret_V_1_reg_219_reg_i_1
       (.I0(ap_enable_reg_pp0_iter2),
        .I1(ap_enable_reg_pp0_iter1),
        .I2(\ap_CS_fsm_reg_n_0_[0] ),
        .I3(ap_start),
        .O(ret_V_1_reg_219_reg_i_1_n_0));
  DSP48E2 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(1),
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
    ret_V_reg_209_reg
       (.A({hw_cos_val_V[17],hw_cos_val_V[17],hw_cos_val_V[17],hw_cos_val_V[17],hw_cos_val_V[17],hw_cos_val_V[17],hw_cos_val_V[17],hw_cos_val_V[17],hw_cos_val_V[17],hw_cos_val_V[17],hw_cos_val_V[17],hw_cos_val_V[17],hw_cos_val_V}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_ret_V_reg_209_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({mdt_localx_V[14],mdt_localx_V[14],mdt_localx_V[14],mdt_localx_V}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_ret_V_reg_209_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_ret_V_reg_209_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_ret_V_reg_209_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(ret_V_1_reg_219_reg_i_1_n_0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(ret_V_1_reg_219_reg_i_1_n_0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(ap_enable_reg_pp0_iter10),
        .CEP(ret_V_1_reg_2190),
        .CLK(ap_clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_ret_V_reg_209_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_ret_V_reg_209_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_ret_V_reg_209_reg_P_UNCONNECTED[47:28],zext_ln215_1_cast_reg_224,ret_V_reg_209_reg_n_90,ret_V_reg_209_reg_n_91,ret_V_reg_209_reg_n_92,ret_V_reg_209_reg_n_93,ret_V_reg_209_reg_n_94,ret_V_reg_209_reg_n_95,ret_V_reg_209_reg_n_96,ret_V_reg_209_reg_n_97,ret_V_reg_209_reg_n_98,ret_V_reg_209_reg_n_99,ret_V_reg_209_reg_n_100,ret_V_reg_209_reg_n_101,ret_V_reg_209_reg_n_102,ret_V_reg_209_reg_n_103,ret_V_reg_209_reg_n_104,ret_V_reg_209_reg_n_105}),
        .PATTERNBDETECT(NLW_ret_V_reg_209_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_ret_V_reg_209_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_ret_V_reg_209_reg_PCOUT_UNCONNECTED[47:0]),
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
        .UNDERFLOW(NLW_ret_V_reg_209_reg_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_ret_V_reg_209_reg_XOROUT_UNCONNECTED[7:0]));
  FDRE \trunc_ln1353_1_reg_214_reg[0] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(regslice_both_mdt_r_offset_V_U_n_24),
        .Q(trunc_ln1353_1_reg_214[0]),
        .R(1'b0));
  FDRE \trunc_ln1353_1_reg_214_reg[10] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(regslice_both_mdt_r_offset_V_U_n_14),
        .Q(trunc_ln1353_1_reg_214[10]),
        .R(1'b0));
  FDRE \trunc_ln1353_1_reg_214_reg[11] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(regslice_both_mdt_r_offset_V_U_n_13),
        .Q(trunc_ln1353_1_reg_214[11]),
        .R(1'b0));
  FDRE \trunc_ln1353_1_reg_214_reg[1] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(regslice_both_mdt_r_offset_V_U_n_23),
        .Q(trunc_ln1353_1_reg_214[1]),
        .R(1'b0));
  FDRE \trunc_ln1353_1_reg_214_reg[2] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(regslice_both_mdt_r_offset_V_U_n_22),
        .Q(trunc_ln1353_1_reg_214[2]),
        .R(1'b0));
  FDRE \trunc_ln1353_1_reg_214_reg[3] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(regslice_both_mdt_r_offset_V_U_n_21),
        .Q(trunc_ln1353_1_reg_214[3]),
        .R(1'b0));
  FDRE \trunc_ln1353_1_reg_214_reg[4] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(regslice_both_mdt_r_offset_V_U_n_20),
        .Q(trunc_ln1353_1_reg_214[4]),
        .R(1'b0));
  FDRE \trunc_ln1353_1_reg_214_reg[5] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(regslice_both_mdt_r_offset_V_U_n_19),
        .Q(trunc_ln1353_1_reg_214[5]),
        .R(1'b0));
  FDRE \trunc_ln1353_1_reg_214_reg[6] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(regslice_both_mdt_r_offset_V_U_n_18),
        .Q(trunc_ln1353_1_reg_214[6]),
        .R(1'b0));
  FDRE \trunc_ln1353_1_reg_214_reg[7] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(regslice_both_mdt_r_offset_V_U_n_17),
        .Q(trunc_ln1353_1_reg_214[7]),
        .R(1'b0));
  FDRE \trunc_ln1353_1_reg_214_reg[8] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(regslice_both_mdt_r_offset_V_U_n_16),
        .Q(trunc_ln1353_1_reg_214[8]),
        .R(1'b0));
  FDRE \trunc_ln1353_1_reg_214_reg[9] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(regslice_both_mdt_r_offset_V_U_n_15),
        .Q(trunc_ln1353_1_reg_214[9]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(trunc_ln1353_reg_194[0]),
        .Q(trunc_ln1353_reg_194_pp0_iter1_reg[0]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_pp0_iter1_reg_reg[10] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(trunc_ln1353_reg_194[10]),
        .Q(trunc_ln1353_reg_194_pp0_iter1_reg[10]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_pp0_iter1_reg_reg[11] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(trunc_ln1353_reg_194[11]),
        .Q(trunc_ln1353_reg_194_pp0_iter1_reg[11]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_pp0_iter1_reg_reg[1] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(trunc_ln1353_reg_194[1]),
        .Q(trunc_ln1353_reg_194_pp0_iter1_reg[1]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_pp0_iter1_reg_reg[2] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(trunc_ln1353_reg_194[2]),
        .Q(trunc_ln1353_reg_194_pp0_iter1_reg[2]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_pp0_iter1_reg_reg[3] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(trunc_ln1353_reg_194[3]),
        .Q(trunc_ln1353_reg_194_pp0_iter1_reg[3]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_pp0_iter1_reg_reg[4] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(trunc_ln1353_reg_194[4]),
        .Q(trunc_ln1353_reg_194_pp0_iter1_reg[4]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_pp0_iter1_reg_reg[5] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(trunc_ln1353_reg_194[5]),
        .Q(trunc_ln1353_reg_194_pp0_iter1_reg[5]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_pp0_iter1_reg_reg[6] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(trunc_ln1353_reg_194[6]),
        .Q(trunc_ln1353_reg_194_pp0_iter1_reg[6]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_pp0_iter1_reg_reg[7] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(trunc_ln1353_reg_194[7]),
        .Q(trunc_ln1353_reg_194_pp0_iter1_reg[7]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_pp0_iter1_reg_reg[8] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(trunc_ln1353_reg_194[8]),
        .Q(trunc_ln1353_reg_194_pp0_iter1_reg[8]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_pp0_iter1_reg_reg[9] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(trunc_ln1353_reg_194[9]),
        .Q(trunc_ln1353_reg_194_pp0_iter1_reg[9]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_reg[0] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(regslice_both_mdt_r_offset_V_U_n_24),
        .Q(trunc_ln1353_reg_194[0]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_reg[10] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(regslice_both_mdt_r_offset_V_U_n_14),
        .Q(trunc_ln1353_reg_194[10]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_reg[11] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(regslice_both_mdt_r_offset_V_U_n_13),
        .Q(trunc_ln1353_reg_194[11]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_reg[1] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(regslice_both_mdt_r_offset_V_U_n_23),
        .Q(trunc_ln1353_reg_194[1]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_reg[2] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(regslice_both_mdt_r_offset_V_U_n_22),
        .Q(trunc_ln1353_reg_194[2]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_reg[3] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(regslice_both_mdt_r_offset_V_U_n_21),
        .Q(trunc_ln1353_reg_194[3]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_reg[4] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(regslice_both_mdt_r_offset_V_U_n_20),
        .Q(trunc_ln1353_reg_194[4]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_reg[5] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(regslice_both_mdt_r_offset_V_U_n_19),
        .Q(trunc_ln1353_reg_194[5]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_reg[6] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(regslice_both_mdt_r_offset_V_U_n_18),
        .Q(trunc_ln1353_reg_194[6]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_reg[7] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(regslice_both_mdt_r_offset_V_U_n_17),
        .Q(trunc_ln1353_reg_194[7]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_reg[8] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(regslice_both_mdt_r_offset_V_U_n_16),
        .Q(trunc_ln1353_reg_194[8]),
        .R(1'b0));
  FDRE \trunc_ln1353_reg_194_reg[9] 
       (.C(ap_clk),
        .CE(ret_V_1_reg_2190),
        .D(regslice_both_mdt_r_offset_V_U_n_15),
        .Q(trunc_ln1353_reg_194[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \trunc_ln1503_1_reg_235[2]_i_10 
       (.I0(tmp_fu_124_p4[5]),
        .I1(zext_ln215_1_cast_reg_224[5]),
        .I2(trunc_ln1353_1_reg_214[5]),
        .I3(tmp_fu_124_p4[6]),
        .I4(zext_ln215_1_cast_reg_224[6]),
        .I5(trunc_ln1353_1_reg_214[6]),
        .O(\trunc_ln1503_1_reg_235[2]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \trunc_ln1503_1_reg_235[2]_i_11 
       (.I0(tmp_fu_124_p4[4]),
        .I1(zext_ln215_1_cast_reg_224[4]),
        .I2(trunc_ln1353_1_reg_214[4]),
        .I3(tmp_fu_124_p4[5]),
        .I4(zext_ln215_1_cast_reg_224[5]),
        .I5(trunc_ln1353_1_reg_214[5]),
        .O(\trunc_ln1503_1_reg_235[2]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \trunc_ln1503_1_reg_235[2]_i_12 
       (.I0(tmp_fu_124_p4[3]),
        .I1(zext_ln215_1_cast_reg_224[3]),
        .I2(trunc_ln1353_1_reg_214[3]),
        .I3(tmp_fu_124_p4[4]),
        .I4(zext_ln215_1_cast_reg_224[4]),
        .I5(trunc_ln1353_1_reg_214[4]),
        .O(\trunc_ln1503_1_reg_235[2]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \trunc_ln1503_1_reg_235[2]_i_13 
       (.I0(tmp_fu_124_p4[2]),
        .I1(zext_ln215_1_cast_reg_224[2]),
        .I2(trunc_ln1353_1_reg_214[2]),
        .I3(tmp_fu_124_p4[3]),
        .I4(zext_ln215_1_cast_reg_224[3]),
        .I5(trunc_ln1353_1_reg_214[3]),
        .O(\trunc_ln1503_1_reg_235[2]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \trunc_ln1503_1_reg_235[2]_i_14 
       (.I0(tmp_fu_124_p4[1]),
        .I1(zext_ln215_1_cast_reg_224[1]),
        .I2(trunc_ln1353_1_reg_214[1]),
        .I3(tmp_fu_124_p4[2]),
        .I4(zext_ln215_1_cast_reg_224[2]),
        .I5(trunc_ln1353_1_reg_214[2]),
        .O(\trunc_ln1503_1_reg_235[2]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \trunc_ln1503_1_reg_235[2]_i_15 
       (.I0(tmp_fu_124_p4[0]),
        .I1(zext_ln215_1_cast_reg_224[0]),
        .I2(trunc_ln1353_1_reg_214[0]),
        .I3(tmp_fu_124_p4[1]),
        .I4(zext_ln215_1_cast_reg_224[1]),
        .I5(trunc_ln1353_1_reg_214[1]),
        .O(\trunc_ln1503_1_reg_235[2]_i_15_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \trunc_ln1503_1_reg_235[2]_i_16 
       (.I0(trunc_ln1353_1_reg_214[0]),
        .I1(zext_ln215_1_cast_reg_224[0]),
        .I2(tmp_fu_124_p4[0]),
        .O(\trunc_ln1503_1_reg_235[2]_i_16_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \trunc_ln1503_1_reg_235[2]_i_2 
       (.I0(trunc_ln1353_1_reg_214[6]),
        .I1(zext_ln215_1_cast_reg_224[6]),
        .I2(tmp_fu_124_p4[6]),
        .O(\trunc_ln1503_1_reg_235[2]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \trunc_ln1503_1_reg_235[2]_i_3 
       (.I0(trunc_ln1353_1_reg_214[5]),
        .I1(zext_ln215_1_cast_reg_224[5]),
        .I2(tmp_fu_124_p4[5]),
        .O(\trunc_ln1503_1_reg_235[2]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \trunc_ln1503_1_reg_235[2]_i_4 
       (.I0(trunc_ln1353_1_reg_214[4]),
        .I1(zext_ln215_1_cast_reg_224[4]),
        .I2(tmp_fu_124_p4[4]),
        .O(\trunc_ln1503_1_reg_235[2]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \trunc_ln1503_1_reg_235[2]_i_5 
       (.I0(trunc_ln1353_1_reg_214[3]),
        .I1(zext_ln215_1_cast_reg_224[3]),
        .I2(tmp_fu_124_p4[3]),
        .O(\trunc_ln1503_1_reg_235[2]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \trunc_ln1503_1_reg_235[2]_i_6 
       (.I0(trunc_ln1353_1_reg_214[2]),
        .I1(zext_ln215_1_cast_reg_224[2]),
        .I2(tmp_fu_124_p4[2]),
        .O(\trunc_ln1503_1_reg_235[2]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \trunc_ln1503_1_reg_235[2]_i_7 
       (.I0(trunc_ln1353_1_reg_214[1]),
        .I1(zext_ln215_1_cast_reg_224[1]),
        .I2(tmp_fu_124_p4[1]),
        .O(\trunc_ln1503_1_reg_235[2]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \trunc_ln1503_1_reg_235[2]_i_8 
       (.I0(trunc_ln1353_1_reg_214[0]),
        .I1(zext_ln215_1_cast_reg_224[0]),
        .I2(tmp_fu_124_p4[0]),
        .O(\trunc_ln1503_1_reg_235[2]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \trunc_ln1503_1_reg_235[2]_i_9 
       (.I0(tmp_fu_124_p4[6]),
        .I1(zext_ln215_1_cast_reg_224[6]),
        .I2(trunc_ln1353_1_reg_214[6]),
        .I3(tmp_fu_124_p4[7]),
        .I4(zext_ln215_1_cast_reg_224[7]),
        .I5(trunc_ln1353_1_reg_214[7]),
        .O(\trunc_ln1503_1_reg_235[2]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \trunc_ln1503_1_reg_235[6]_i_2 
       (.I0(trunc_ln1353_1_reg_214[9]),
        .I1(zext_ln215_1_cast_reg_224[9]),
        .I2(tmp_fu_124_p4[9]),
        .O(\trunc_ln1503_1_reg_235[6]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \trunc_ln1503_1_reg_235[6]_i_3 
       (.I0(trunc_ln1353_1_reg_214[8]),
        .I1(zext_ln215_1_cast_reg_224[8]),
        .I2(tmp_fu_124_p4[8]),
        .O(\trunc_ln1503_1_reg_235[6]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \trunc_ln1503_1_reg_235[6]_i_4 
       (.I0(trunc_ln1353_1_reg_214[7]),
        .I1(zext_ln215_1_cast_reg_224[7]),
        .I2(tmp_fu_124_p4[7]),
        .O(\trunc_ln1503_1_reg_235[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \trunc_ln1503_1_reg_235[6]_i_5 
       (.I0(trunc_ln1353_1_reg_214[10]),
        .I1(zext_ln215_1_cast_reg_224[10]),
        .I2(tmp_fu_124_p4[10]),
        .I3(tmp_fu_124_p4[11]),
        .I4(zext_ln215_1_cast_reg_224[11]),
        .I5(trunc_ln1353_1_reg_214[11]),
        .O(\trunc_ln1503_1_reg_235[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \trunc_ln1503_1_reg_235[6]_i_6 
       (.I0(tmp_fu_124_p4[9]),
        .I1(zext_ln215_1_cast_reg_224[9]),
        .I2(trunc_ln1353_1_reg_214[9]),
        .I3(tmp_fu_124_p4[10]),
        .I4(zext_ln215_1_cast_reg_224[10]),
        .I5(trunc_ln1353_1_reg_214[10]),
        .O(\trunc_ln1503_1_reg_235[6]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \trunc_ln1503_1_reg_235[6]_i_7 
       (.I0(tmp_fu_124_p4[8]),
        .I1(zext_ln215_1_cast_reg_224[8]),
        .I2(trunc_ln1353_1_reg_214[8]),
        .I3(tmp_fu_124_p4[9]),
        .I4(zext_ln215_1_cast_reg_224[9]),
        .I5(trunc_ln1353_1_reg_214[9]),
        .O(\trunc_ln1503_1_reg_235[6]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \trunc_ln1503_1_reg_235[6]_i_8 
       (.I0(tmp_fu_124_p4[7]),
        .I1(zext_ln215_1_cast_reg_224[7]),
        .I2(trunc_ln1353_1_reg_214[7]),
        .I3(tmp_fu_124_p4[8]),
        .I4(zext_ln215_1_cast_reg_224[8]),
        .I5(trunc_ln1353_1_reg_214[8]),
        .O(\trunc_ln1503_1_reg_235[6]_i_8_n_0 ));
  FDRE \trunc_ln1503_1_reg_235_reg[0] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(add_ln1353_3_fu_163_p2[5]),
        .Q(\trunc_ln1503_1_reg_235_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \trunc_ln1503_1_reg_235_reg[1] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(add_ln1353_3_fu_163_p2[6]),
        .Q(\trunc_ln1503_1_reg_235_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \trunc_ln1503_1_reg_235_reg[2] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(add_ln1353_3_fu_163_p2[7]),
        .Q(\trunc_ln1503_1_reg_235_reg_n_0_[2] ),
        .R(1'b0));
  CARRY8 \trunc_ln1503_1_reg_235_reg[2]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\trunc_ln1503_1_reg_235_reg[2]_i_1_n_0 ,\trunc_ln1503_1_reg_235_reg[2]_i_1_n_1 ,\trunc_ln1503_1_reg_235_reg[2]_i_1_n_2 ,\trunc_ln1503_1_reg_235_reg[2]_i_1_n_3 ,\trunc_ln1503_1_reg_235_reg[2]_i_1_n_4 ,\trunc_ln1503_1_reg_235_reg[2]_i_1_n_5 ,\trunc_ln1503_1_reg_235_reg[2]_i_1_n_6 ,\trunc_ln1503_1_reg_235_reg[2]_i_1_n_7 }),
        .DI({\trunc_ln1503_1_reg_235[2]_i_2_n_0 ,\trunc_ln1503_1_reg_235[2]_i_3_n_0 ,\trunc_ln1503_1_reg_235[2]_i_4_n_0 ,\trunc_ln1503_1_reg_235[2]_i_5_n_0 ,\trunc_ln1503_1_reg_235[2]_i_6_n_0 ,\trunc_ln1503_1_reg_235[2]_i_7_n_0 ,\trunc_ln1503_1_reg_235[2]_i_8_n_0 ,1'b0}),
        .O({add_ln1353_3_fu_163_p2[7:5],\NLW_trunc_ln1503_1_reg_235_reg[2]_i_1_O_UNCONNECTED [4:0]}),
        .S({\trunc_ln1503_1_reg_235[2]_i_9_n_0 ,\trunc_ln1503_1_reg_235[2]_i_10_n_0 ,\trunc_ln1503_1_reg_235[2]_i_11_n_0 ,\trunc_ln1503_1_reg_235[2]_i_12_n_0 ,\trunc_ln1503_1_reg_235[2]_i_13_n_0 ,\trunc_ln1503_1_reg_235[2]_i_14_n_0 ,\trunc_ln1503_1_reg_235[2]_i_15_n_0 ,\trunc_ln1503_1_reg_235[2]_i_16_n_0 }));
  FDRE \trunc_ln1503_1_reg_235_reg[3] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(add_ln1353_3_fu_163_p2[8]),
        .Q(\trunc_ln1503_1_reg_235_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \trunc_ln1503_1_reg_235_reg[4] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(add_ln1353_3_fu_163_p2[9]),
        .Q(\trunc_ln1503_1_reg_235_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \trunc_ln1503_1_reg_235_reg[5] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(add_ln1353_3_fu_163_p2[10]),
        .Q(\trunc_ln1503_1_reg_235_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \trunc_ln1503_1_reg_235_reg[6] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter10),
        .D(add_ln1353_3_fu_163_p2[11]),
        .Q(\trunc_ln1503_1_reg_235_reg_n_0_[6] ),
        .R(1'b0));
  CARRY8 \trunc_ln1503_1_reg_235_reg[6]_i_1 
       (.CI(\trunc_ln1503_1_reg_235_reg[2]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_trunc_ln1503_1_reg_235_reg[6]_i_1_CO_UNCONNECTED [7:3],\trunc_ln1503_1_reg_235_reg[6]_i_1_n_5 ,\trunc_ln1503_1_reg_235_reg[6]_i_1_n_6 ,\trunc_ln1503_1_reg_235_reg[6]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,\trunc_ln1503_1_reg_235[6]_i_2_n_0 ,\trunc_ln1503_1_reg_235[6]_i_3_n_0 ,\trunc_ln1503_1_reg_235[6]_i_4_n_0 }),
        .O({\NLW_trunc_ln1503_1_reg_235_reg[6]_i_1_O_UNCONNECTED [7:4],add_ln1353_3_fu_163_p2[11:8]}),
        .S({1'b0,1'b0,1'b0,1'b0,\trunc_ln1503_1_reg_235[6]_i_5_n_0 ,\trunc_ln1503_1_reg_235[6]_i_6_n_0 ,\trunc_ln1503_1_reg_235[6]_i_7_n_0 ,\trunc_ln1503_1_reg_235[6]_i_8_n_0 }));
endmodule

(* ORIG_REF_NAME = "regslice_both" *) 
module hls_compute_r_bins_regslice_both
   (D,
    \odata_int_reg[24] ,
    ap_enable_reg_pp0_iter0,
    SR,
    mdt_r_offset_V_TREADY,
    \ireg_reg[24] ,
    \odata_int_reg[24]_0 ,
    E,
    add_ln1353_1_fu_138_p2,
    Q,
    ap_start,
    \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0] ,
    ap_enable_reg_pp0_iter0_reg,
    ap_rst_n,
    \ireg_reg[24]_0 ,
    \ireg_reg[0] ,
    \ireg_reg[0]_0 ,
    \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0 ,
    ap_enable_reg_pp0_iter2,
    \ireg_reg[24]_1 ,
    ap_clk,
    \odata_int_reg[0] );
  output [6:0]D;
  output \odata_int_reg[24] ;
  output ap_enable_reg_pp0_iter0;
  output [0:0]SR;
  output mdt_r_offset_V_TREADY;
  output [0:0]\ireg_reg[24] ;
  output [12:0]\odata_int_reg[24]_0 ;
  output [0:0]E;
  input [6:0]add_ln1353_1_fu_138_p2;
  input [6:0]Q;
  input ap_start;
  input [0:0]\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0] ;
  input ap_enable_reg_pp0_iter0_reg;
  input ap_rst_n;
  input [12:0]\ireg_reg[24]_0 ;
  input \ireg_reg[0] ;
  input \ireg_reg[0]_0 ;
  input \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0 ;
  input ap_enable_reg_pp0_iter2;
  input [0:0]\ireg_reg[24]_1 ;
  input ap_clk;
  input [0:0]\odata_int_reg[0] ;

  wire [6:0]D;
  wire [0:0]E;
  wire [6:0]Q;
  wire [0:0]SR;
  wire [6:0]add_ln1353_1_fu_138_p2;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter0;
  wire ap_enable_reg_pp0_iter0_reg;
  wire ap_enable_reg_pp0_iter2;
  wire ap_rst_n;
  wire ap_start;
  wire [24:0]cdata;
  wire \ireg_reg[0] ;
  wire \ireg_reg[0]_0 ;
  wire [0:0]\ireg_reg[24] ;
  wire [12:0]\ireg_reg[24]_0 ;
  wire [0:0]\ireg_reg[24]_1 ;
  wire mdt_r_offset_V_TREADY;
  wire [0:0]\odata_int_reg[0] ;
  wire \odata_int_reg[24] ;
  wire [12:0]\odata_int_reg[24]_0 ;
  wire [0:0]\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0] ;
  wire \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0 ;

  hls_compute_r_bins_xil_defaultlib_ibuf ibuf_inst
       (.D({cdata[24],cdata[11:0]}),
        .Q(\ireg_reg[24] ),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter0(ap_enable_reg_pp0_iter0),
        .ap_enable_reg_pp0_iter0_reg(ap_enable_reg_pp0_iter0_reg),
        .ap_enable_reg_pp0_iter0_reg_reg(\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0] ),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .\ireg_reg[0]_0 (\ireg_reg[0] ),
        .\ireg_reg[0]_1 (\odata_int_reg[24]_0 [12]),
        .\ireg_reg[0]_2 (\ireg_reg[0]_0 ),
        .\ireg_reg[24]_0 (\ireg_reg[24]_0 ),
        .\ireg_reg[24]_1 (\ireg_reg[24]_1 ),
        .mdt_r_offset_V_TREADY(mdt_r_offset_V_TREADY));
  hls_compute_r_bins_xil_defaultlib_obuf obuf_inst
       (.D(D),
        .E(E),
        .Q(Q),
        .SR(SR),
        .add_ln1353_1_fu_138_p2(add_ln1353_1_fu_138_p2),
        .ap_clk(ap_clk),
        .ap_enable_reg_pp0_iter2(ap_enable_reg_pp0_iter2),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .\odata_int_reg[0]_0 (\odata_int_reg[0] ),
        .\odata_int_reg[24]_0 (\odata_int_reg[24] ),
        .\odata_int_reg[24]_1 (\odata_int_reg[24]_0 ),
        .\odata_int_reg[24]_2 ({cdata[24],cdata[11:0]}),
        .\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0] (\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0] ),
        .\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0 (\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0 ));
endmodule

(* ORIG_REF_NAME = "regslice_both" *) 
module hls_compute_r_bins_regslice_both__parameterized1
   (D,
    ap_enable_reg_pp0_iter2_reg,
    \ap_CS_fsm_reg[1] ,
    \ireg_reg[8] ,
    CEM,
    ap_done,
    ap_ready,
    add_ln1353_1_fu_138_p2,
    \odata_int_reg[24] ,
    \odata_int_reg[8] ,
    \odata_int_reg[24]_0 ,
    SR,
    ap_clk,
    Q,
    ap_start,
    ap_enable_reg_pp0_iter2,
    ap_enable_reg_pp0_iter1,
    r_bin_V_TREADY,
    \ireg_reg[8]_0 ,
    ap_enable_reg_pp0_iter0_reg,
    \odata_int_reg[0] ,
    ap_enable_reg_pp0_iter0,
    ap_rst_n,
    P,
    \odata_int_reg[6]_i_4 ,
    \odata_int_reg[6]_i_4_0 ,
    \odata_int_reg[6] ,
    \ireg_reg[24] ,
    \ireg_reg[6] );
  output [1:0]D;
  output ap_enable_reg_pp0_iter2_reg;
  output \ap_CS_fsm_reg[1] ;
  output \ireg_reg[8] ;
  output CEM;
  output ap_done;
  output ap_ready;
  output [6:0]add_ln1353_1_fu_138_p2;
  output [0:0]\odata_int_reg[24] ;
  output [7:0]\odata_int_reg[8] ;
  output [0:0]\odata_int_reg[24]_0 ;
  input [0:0]SR;
  input ap_clk;
  input [1:0]Q;
  input ap_start;
  input ap_enable_reg_pp0_iter2;
  input ap_enable_reg_pp0_iter1;
  input r_bin_V_TREADY;
  input \ireg_reg[8]_0 ;
  input ap_enable_reg_pp0_iter0_reg;
  input [0:0]\odata_int_reg[0] ;
  input ap_enable_reg_pp0_iter0;
  input ap_rst_n;
  input [11:0]P;
  input [11:0]\odata_int_reg[6]_i_4 ;
  input [11:0]\odata_int_reg[6]_i_4_0 ;
  input [6:0]\odata_int_reg[6] ;
  input [0:0]\ireg_reg[24] ;
  input [6:0]\ireg_reg[6] ;

  wire CEM;
  wire [1:0]D;
  wire [11:0]P;
  wire [1:0]Q;
  wire [0:0]SR;
  wire [6:0]add_ln1353_1_fu_138_p2;
  wire \ap_CS_fsm[1]_i_3_n_0 ;
  wire \ap_CS_fsm_reg[1] ;
  wire ap_clk;
  wire ap_done;
  wire ap_enable_reg_pp0_iter0;
  wire ap_enable_reg_pp0_iter0_reg;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter2;
  wire ap_enable_reg_pp0_iter2_reg;
  wire ap_ready;
  wire ap_rst_n;
  wire ap_start;
  wire [1:1]count;
  wire \count[0]_i_2_n_0 ;
  wire \count_reg_n_0_[0] ;
  wire \count_reg_n_0_[1] ;
  wire ibuf_inst_n_11;
  wire ibuf_inst_n_12;
  wire ibuf_inst_n_13;
  wire ibuf_inst_n_14;
  wire ibuf_inst_n_15;
  wire ibuf_inst_n_16;
  wire ibuf_inst_n_17;
  wire ibuf_inst_n_18;
  wire ibuf_inst_n_5;
  wire [0:0]\ireg_reg[24] ;
  wire [6:0]\ireg_reg[6] ;
  wire \ireg_reg[8] ;
  wire \ireg_reg[8]_0 ;
  wire obuf_inst_n_8;
  wire [0:0]\odata_int_reg[0] ;
  wire [0:0]\odata_int_reg[24] ;
  wire [0:0]\odata_int_reg[24]_0 ;
  wire [6:0]\odata_int_reg[6] ;
  wire [11:0]\odata_int_reg[6]_i_4 ;
  wire [11:0]\odata_int_reg[6]_i_4_0 ;
  wire [7:0]\odata_int_reg[8] ;
  wire p_0_in;
  wire r_bin_V_TREADY;

  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hD5)) 
    \ap_CS_fsm[1]_i_3 
       (.I0(\count_reg_n_0_[0] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(r_bin_V_TREADY),
        .O(\ap_CS_fsm[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h2A00)) 
    \count[0]_i_2 
       (.I0(ap_rst_n),
        .I1(r_bin_V_TREADY),
        .I2(\count_reg_n_0_[1] ),
        .I3(\count_reg_n_0_[0] ),
        .O(\count[0]_i_2_n_0 ));
  FDRE \count_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ibuf_inst_n_5),
        .Q(\count_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \count_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(count),
        .Q(\count_reg_n_0_[1] ),
        .R(SR));
  hls_compute_r_bins_xil_defaultlib_ibuf__parameterized0 ibuf_inst
       (.CEM(CEM),
        .D(D),
        .P(P),
        .Q(Q),
        .SR(obuf_inst_n_8),
        .add_ln1353_1_fu_138_p2(add_ln1353_1_fu_138_p2),
        .\ap_CS_fsm_reg[0] (\ap_CS_fsm[1]_i_3_n_0 ),
        .\ap_CS_fsm_reg[1] (\ap_CS_fsm_reg[1] ),
        .ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_enable_reg_pp0_iter0(ap_enable_reg_pp0_iter0),
        .ap_enable_reg_pp0_iter0_reg(ap_enable_reg_pp0_iter0_reg),
        .ap_enable_reg_pp0_iter1(ap_enable_reg_pp0_iter1),
        .ap_enable_reg_pp0_iter1_reg(ibuf_inst_n_5),
        .ap_enable_reg_pp0_iter2(ap_enable_reg_pp0_iter2),
        .ap_enable_reg_pp0_iter2_reg(ap_enable_reg_pp0_iter2_reg),
        .ap_ready(ap_ready),
        .ap_rst_n(ap_rst_n),
        .ap_start(ap_start),
        .count(count),
        .\count_reg[0] (\count[0]_i_2_n_0 ),
        .\count_reg[1] (\count_reg_n_0_[0] ),
        .\count_reg[1]_0 (\count_reg_n_0_[1] ),
        .\ireg_reg[0]_0 (\odata_int_reg[8] [7]),
        .\ireg_reg[24] (\ireg_reg[24] ),
        .\ireg_reg[6]_0 (\ireg_reg[6] ),
        .\ireg_reg[8]_0 (\ireg_reg[8] ),
        .\ireg_reg[8]_1 (p_0_in),
        .\ireg_reg[8]_2 ({ibuf_inst_n_11,ibuf_inst_n_12,ibuf_inst_n_13,ibuf_inst_n_14,ibuf_inst_n_15,ibuf_inst_n_16,ibuf_inst_n_17,ibuf_inst_n_18}),
        .\ireg_reg[8]_3 (\ireg_reg[8]_0 ),
        .\odata_int_reg[0] (\odata_int_reg[0] ),
        .\odata_int_reg[24] (\odata_int_reg[24] ),
        .\odata_int_reg[24]_0 (\odata_int_reg[24]_0 ),
        .\odata_int_reg[6] (\odata_int_reg[6] ),
        .\odata_int_reg[6]_i_4_0 (\odata_int_reg[6]_i_4 ),
        .\odata_int_reg[6]_i_4_1 (\odata_int_reg[6]_i_4_0 ),
        .r_bin_V_TREADY(r_bin_V_TREADY));
  hls_compute_r_bins_xil_defaultlib_obuf__parameterized0 obuf_inst
       (.D({ibuf_inst_n_11,ibuf_inst_n_12,ibuf_inst_n_13,ibuf_inst_n_14,ibuf_inst_n_15,ibuf_inst_n_16,ibuf_inst_n_17,ibuf_inst_n_18}),
        .Q(\odata_int_reg[8] ),
        .SR(obuf_inst_n_8),
        .ap_clk(ap_clk),
        .ap_rst_n(ap_rst_n),
        .\ireg_reg[0] (p_0_in),
        .\odata_int_reg[0]_0 (SR),
        .r_bin_V_TREADY(r_bin_V_TREADY));
endmodule

(* ORIG_REF_NAME = "xil_defaultlib_ibuf" *) 
module hls_compute_r_bins_xil_defaultlib_ibuf
   (ap_enable_reg_pp0_iter0,
    mdt_r_offset_V_TREADY,
    Q,
    D,
    ap_start,
    ap_enable_reg_pp0_iter0_reg_reg,
    ap_enable_reg_pp0_iter0_reg,
    \ireg_reg[24]_0 ,
    ap_rst_n,
    \ireg_reg[0]_0 ,
    \ireg_reg[0]_1 ,
    \ireg_reg[0]_2 ,
    \ireg_reg[24]_1 ,
    ap_clk);
  output ap_enable_reg_pp0_iter0;
  output mdt_r_offset_V_TREADY;
  output [0:0]Q;
  output [12:0]D;
  input ap_start;
  input [0:0]ap_enable_reg_pp0_iter0_reg_reg;
  input ap_enable_reg_pp0_iter0_reg;
  input [12:0]\ireg_reg[24]_0 ;
  input ap_rst_n;
  input \ireg_reg[0]_0 ;
  input [0:0]\ireg_reg[0]_1 ;
  input \ireg_reg[0]_2 ;
  input [0:0]\ireg_reg[24]_1 ;
  input ap_clk;

  wire [12:0]D;
  wire [0:0]Q;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter0;
  wire ap_enable_reg_pp0_iter0_reg;
  wire [0:0]ap_enable_reg_pp0_iter0_reg_reg;
  wire ap_rst_n;
  wire ap_start;
  wire ireg01_out;
  wire \ireg_reg[0]_0 ;
  wire [0:0]\ireg_reg[0]_1 ;
  wire \ireg_reg[0]_2 ;
  wire [12:0]\ireg_reg[24]_0 ;
  wire [0:0]\ireg_reg[24]_1 ;
  wire \ireg_reg_n_0_[0] ;
  wire \ireg_reg_n_0_[10] ;
  wire \ireg_reg_n_0_[11] ;
  wire \ireg_reg_n_0_[1] ;
  wire \ireg_reg_n_0_[2] ;
  wire \ireg_reg_n_0_[3] ;
  wire \ireg_reg_n_0_[4] ;
  wire \ireg_reg_n_0_[5] ;
  wire \ireg_reg_n_0_[6] ;
  wire \ireg_reg_n_0_[7] ;
  wire \ireg_reg_n_0_[8] ;
  wire \ireg_reg_n_0_[9] ;
  wire mdt_r_offset_V_TREADY;

  LUT3 #(
    .INIT(8'hB8)) 
    ap_enable_reg_pp0_iter1_i_2
       (.I0(ap_start),
        .I1(ap_enable_reg_pp0_iter0_reg_reg),
        .I2(ap_enable_reg_pp0_iter0_reg),
        .O(ap_enable_reg_pp0_iter0));
  LUT5 #(
    .INIT(32'h40005050)) 
    \ireg[24]_i_2 
       (.I0(Q),
        .I1(\ireg_reg[0]_0 ),
        .I2(\ireg_reg[0]_1 ),
        .I3(\ireg_reg[0]_2 ),
        .I4(ap_enable_reg_pp0_iter0),
        .O(ireg01_out));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[0] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[24]_0 [0]),
        .Q(\ireg_reg_n_0_[0] ),
        .R(\ireg_reg[24]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[10] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[24]_0 [10]),
        .Q(\ireg_reg_n_0_[10] ),
        .R(\ireg_reg[24]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[11] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[24]_0 [11]),
        .Q(\ireg_reg_n_0_[11] ),
        .R(\ireg_reg[24]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[1] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[24]_0 [1]),
        .Q(\ireg_reg_n_0_[1] ),
        .R(\ireg_reg[24]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[24] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[24]_0 [12]),
        .Q(Q),
        .R(\ireg_reg[24]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[2] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[24]_0 [2]),
        .Q(\ireg_reg_n_0_[2] ),
        .R(\ireg_reg[24]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[3] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[24]_0 [3]),
        .Q(\ireg_reg_n_0_[3] ),
        .R(\ireg_reg[24]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[4] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[24]_0 [4]),
        .Q(\ireg_reg_n_0_[4] ),
        .R(\ireg_reg[24]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[5] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[24]_0 [5]),
        .Q(\ireg_reg_n_0_[5] ),
        .R(\ireg_reg[24]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[6] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[24]_0 [6]),
        .Q(\ireg_reg_n_0_[6] ),
        .R(\ireg_reg[24]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[7] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[24]_0 [7]),
        .Q(\ireg_reg_n_0_[7] ),
        .R(\ireg_reg[24]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[8] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[24]_0 [8]),
        .Q(\ireg_reg_n_0_[8] ),
        .R(\ireg_reg[24]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[9] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[24]_0 [9]),
        .Q(\ireg_reg_n_0_[9] ),
        .R(\ireg_reg[24]_1 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h20)) 
    mdt_r_offset_V_TREADY_INST_0
       (.I0(\ireg_reg[24]_0 [12]),
        .I1(Q),
        .I2(ap_rst_n),
        .O(mdt_r_offset_V_TREADY));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \odata_int[0]_i_1 
       (.I0(\ireg_reg[24]_0 [0]),
        .I1(Q),
        .I2(\ireg_reg_n_0_[0] ),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \odata_int[10]_i_1 
       (.I0(\ireg_reg[24]_0 [10]),
        .I1(Q),
        .I2(\ireg_reg_n_0_[10] ),
        .O(D[10]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \odata_int[11]_i_1 
       (.I0(\ireg_reg[24]_0 [11]),
        .I1(Q),
        .I2(\ireg_reg_n_0_[11] ),
        .O(D[11]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \odata_int[1]_i_1 
       (.I0(\ireg_reg[24]_0 [1]),
        .I1(Q),
        .I2(\ireg_reg_n_0_[1] ),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \odata_int[24]_i_2 
       (.I0(Q),
        .I1(\ireg_reg[24]_0 [12]),
        .O(D[12]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \odata_int[2]_i_1 
       (.I0(\ireg_reg[24]_0 [2]),
        .I1(Q),
        .I2(\ireg_reg_n_0_[2] ),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \odata_int[3]_i_1 
       (.I0(\ireg_reg[24]_0 [3]),
        .I1(Q),
        .I2(\ireg_reg_n_0_[3] ),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \odata_int[4]_i_1 
       (.I0(\ireg_reg[24]_0 [4]),
        .I1(Q),
        .I2(\ireg_reg_n_0_[4] ),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \odata_int[5]_i_1 
       (.I0(\ireg_reg[24]_0 [5]),
        .I1(Q),
        .I2(\ireg_reg_n_0_[5] ),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \odata_int[6]_i_1__0 
       (.I0(\ireg_reg[24]_0 [6]),
        .I1(Q),
        .I2(\ireg_reg_n_0_[6] ),
        .O(D[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \odata_int[7]_i_1 
       (.I0(\ireg_reg[24]_0 [7]),
        .I1(Q),
        .I2(\ireg_reg_n_0_[7] ),
        .O(D[7]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \odata_int[8]_i_1 
       (.I0(\ireg_reg[24]_0 [8]),
        .I1(Q),
        .I2(\ireg_reg_n_0_[8] ),
        .O(D[8]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hE2)) 
    \odata_int[9]_i_1 
       (.I0(\ireg_reg[24]_0 [9]),
        .I1(Q),
        .I2(\ireg_reg_n_0_[9] ),
        .O(D[9]));
endmodule

(* ORIG_REF_NAME = "xil_defaultlib_ibuf" *) 
module hls_compute_r_bins_xil_defaultlib_ibuf__parameterized0
   (D,
    ap_enable_reg_pp0_iter2_reg,
    count,
    \ap_CS_fsm_reg[1] ,
    ap_enable_reg_pp0_iter1_reg,
    \ireg_reg[8]_0 ,
    CEM,
    ap_done,
    ap_ready,
    \ireg_reg[8]_1 ,
    \ireg_reg[8]_2 ,
    add_ln1353_1_fu_138_p2,
    \odata_int_reg[24] ,
    \odata_int_reg[24]_0 ,
    Q,
    ap_start,
    ap_enable_reg_pp0_iter2,
    ap_enable_reg_pp0_iter1,
    r_bin_V_TREADY,
    \count_reg[1] ,
    \count_reg[1]_0 ,
    \ireg_reg[8]_3 ,
    \count_reg[0] ,
    ap_enable_reg_pp0_iter0_reg,
    \odata_int_reg[0] ,
    ap_enable_reg_pp0_iter0,
    \ap_CS_fsm_reg[0] ,
    ap_rst_n,
    P,
    \odata_int_reg[6]_i_4_0 ,
    \odata_int_reg[6]_i_4_1 ,
    \odata_int_reg[6] ,
    \ireg_reg[0]_0 ,
    \ireg_reg[24] ,
    SR,
    ap_clk,
    \ireg_reg[6]_0 );
  output [1:0]D;
  output ap_enable_reg_pp0_iter2_reg;
  output [0:0]count;
  output \ap_CS_fsm_reg[1] ;
  output ap_enable_reg_pp0_iter1_reg;
  output \ireg_reg[8]_0 ;
  output CEM;
  output ap_done;
  output ap_ready;
  output [0:0]\ireg_reg[8]_1 ;
  output [7:0]\ireg_reg[8]_2 ;
  output [6:0]add_ln1353_1_fu_138_p2;
  output [0:0]\odata_int_reg[24] ;
  output [0:0]\odata_int_reg[24]_0 ;
  input [1:0]Q;
  input ap_start;
  input ap_enable_reg_pp0_iter2;
  input ap_enable_reg_pp0_iter1;
  input r_bin_V_TREADY;
  input \count_reg[1] ;
  input \count_reg[1]_0 ;
  input \ireg_reg[8]_3 ;
  input \count_reg[0] ;
  input ap_enable_reg_pp0_iter0_reg;
  input [0:0]\odata_int_reg[0] ;
  input ap_enable_reg_pp0_iter0;
  input \ap_CS_fsm_reg[0] ;
  input ap_rst_n;
  input [11:0]P;
  input [11:0]\odata_int_reg[6]_i_4_0 ;
  input [11:0]\odata_int_reg[6]_i_4_1 ;
  input [6:0]\odata_int_reg[6] ;
  input [0:0]\ireg_reg[0]_0 ;
  input [0:0]\ireg_reg[24] ;
  input [0:0]SR;
  input ap_clk;
  input [6:0]\ireg_reg[6]_0 ;

  wire CEM;
  wire [1:0]D;
  wire [11:0]P;
  wire [1:0]Q;
  wire [0:0]SR;
  wire [6:0]add_ln1353_1_fu_138_p2;
  wire \ap_CS_fsm[1]_i_2_n_0 ;
  wire \ap_CS_fsm_reg[0] ;
  wire \ap_CS_fsm_reg[1] ;
  wire ap_clk;
  wire ap_done;
  wire ap_done_INST_0_i_2_n_0;
  wire ap_done_INST_0_i_4_n_0;
  wire ap_enable_reg_pp0_iter0;
  wire ap_enable_reg_pp0_iter0_reg;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter1_reg;
  wire ap_enable_reg_pp0_iter2;
  wire ap_enable_reg_pp0_iter2_reg;
  wire ap_ready;
  wire ap_rst_n;
  wire ap_start;
  wire [0:0]count;
  wire \count[1]_i_2_n_0 ;
  wire \count_reg[0] ;
  wire \count_reg[1] ;
  wire \count_reg[1]_0 ;
  wire ireg01_out;
  wire [0:0]\ireg_reg[0]_0 ;
  wire [0:0]\ireg_reg[24] ;
  wire [6:0]\ireg_reg[6]_0 ;
  wire \ireg_reg[8]_0 ;
  wire [0:0]\ireg_reg[8]_1 ;
  wire [7:0]\ireg_reg[8]_2 ;
  wire \ireg_reg[8]_3 ;
  wire \ireg_reg_n_0_[0] ;
  wire \ireg_reg_n_0_[1] ;
  wire \ireg_reg_n_0_[2] ;
  wire \ireg_reg_n_0_[3] ;
  wire \ireg_reg_n_0_[4] ;
  wire \ireg_reg_n_0_[5] ;
  wire \ireg_reg_n_0_[6] ;
  wire \odata_int[2]_i_10_n_0 ;
  wire \odata_int[2]_i_11_n_0 ;
  wire \odata_int[2]_i_12_n_0 ;
  wire \odata_int[2]_i_13_n_0 ;
  wire \odata_int[2]_i_14_n_0 ;
  wire \odata_int[2]_i_15_n_0 ;
  wire \odata_int[2]_i_16_n_0 ;
  wire \odata_int[2]_i_17_n_0 ;
  wire \odata_int[2]_i_3_n_0 ;
  wire \odata_int[2]_i_4_n_0 ;
  wire \odata_int[2]_i_5_n_0 ;
  wire \odata_int[2]_i_6_n_0 ;
  wire \odata_int[2]_i_7_n_0 ;
  wire \odata_int[2]_i_8_n_0 ;
  wire \odata_int[2]_i_9_n_0 ;
  wire \odata_int[6]_i_10_n_0 ;
  wire \odata_int[6]_i_11_n_0 ;
  wire \odata_int[6]_i_12_n_0 ;
  wire \odata_int[6]_i_6_n_0 ;
  wire \odata_int[6]_i_7_n_0 ;
  wire \odata_int[6]_i_8_n_0 ;
  wire \odata_int[6]_i_9_n_0 ;
  wire [0:0]\odata_int_reg[0] ;
  wire [0:0]\odata_int_reg[24] ;
  wire [0:0]\odata_int_reg[24]_0 ;
  wire \odata_int_reg[2]_i_2_n_0 ;
  wire \odata_int_reg[2]_i_2_n_1 ;
  wire \odata_int_reg[2]_i_2_n_2 ;
  wire \odata_int_reg[2]_i_2_n_3 ;
  wire \odata_int_reg[2]_i_2_n_4 ;
  wire \odata_int_reg[2]_i_2_n_5 ;
  wire \odata_int_reg[2]_i_2_n_6 ;
  wire \odata_int_reg[2]_i_2_n_7 ;
  wire [6:0]\odata_int_reg[6] ;
  wire [11:0]\odata_int_reg[6]_i_4_0 ;
  wire [11:0]\odata_int_reg[6]_i_4_1 ;
  wire \odata_int_reg[6]_i_4_n_5 ;
  wire \odata_int_reg[6]_i_4_n_6 ;
  wire \odata_int_reg[6]_i_4_n_7 ;
  wire r_bin_V_TREADY;
  wire vld_in;
  wire [4:0]\NLW_odata_int_reg[2]_i_2_O_UNCONNECTED ;
  wire [7:3]\NLW_odata_int_reg[6]_i_4_CO_UNCONNECTED ;
  wire [7:4]\NLW_odata_int_reg[6]_i_4_O_UNCONNECTED ;

  LUT6 #(
    .INIT(64'hFF01FF01FF010000)) 
    \ap_CS_fsm[0]_i_1 
       (.I0(ap_enable_reg_pp0_iter1),
        .I1(ap_enable_reg_pp0_iter2),
        .I2(ap_start),
        .I3(ap_enable_reg_pp0_iter2_reg),
        .I4(\ap_CS_fsm[1]_i_2_n_0 ),
        .I5(Q[0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h1F1F1F1F1F1F1F11)) 
    \ap_CS_fsm[1]_i_1 
       (.I0(Q[0]),
        .I1(\ap_CS_fsm[1]_i_2_n_0 ),
        .I2(ap_enable_reg_pp0_iter2_reg),
        .I3(ap_start),
        .I4(ap_enable_reg_pp0_iter2),
        .I5(ap_enable_reg_pp0_iter1),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h223F223F0000223F)) 
    \ap_CS_fsm[1]_i_2 
       (.I0(\ap_CS_fsm_reg[0] ),
        .I1(\ireg_reg[8]_0 ),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(ap_enable_reg_pp0_iter2),
        .I4(ap_enable_reg_pp0_iter0),
        .I5(\odata_int_reg[0] ),
        .O(\ap_CS_fsm[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    ap_done_INST_0
       (.I0(ap_enable_reg_pp0_iter2),
        .I1(\ap_CS_fsm_reg[1] ),
        .O(ap_done));
  LUT6 #(
    .INIT(64'h75FF7575FFFFFFFF)) 
    ap_done_INST_0_i_1
       (.I0(Q[1]),
        .I1(\odata_int_reg[0] ),
        .I2(ap_enable_reg_pp0_iter0),
        .I3(ap_done_INST_0_i_2_n_0),
        .I4(\ireg_reg[8]_0 ),
        .I5(ap_done_INST_0_i_4_n_0),
        .O(\ap_CS_fsm_reg[1] ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h1)) 
    ap_done_INST_0_i_2
       (.I0(ap_enable_reg_pp0_iter2),
        .I1(ap_enable_reg_pp0_iter1),
        .O(ap_done_INST_0_i_2_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    ap_done_INST_0_i_3
       (.I0(\ireg_reg[8]_1 ),
        .I1(ap_rst_n),
        .O(\ireg_reg[8]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h8FFF)) 
    ap_done_INST_0_i_4
       (.I0(r_bin_V_TREADY),
        .I1(\count_reg[1]_0 ),
        .I2(\count_reg[1] ),
        .I3(ap_enable_reg_pp0_iter2),
        .O(ap_done_INST_0_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT1 #(
    .INIT(2'h1)) 
    ap_enable_reg_pp0_iter1_i_1
       (.I0(\ap_CS_fsm_reg[1] ),
        .O(CEM));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h00E2)) 
    ap_ready_INST_0
       (.I0(ap_enable_reg_pp0_iter0_reg),
        .I1(Q[0]),
        .I2(ap_start),
        .I3(\ap_CS_fsm_reg[1] ),
        .O(ap_ready));
  LUT6 #(
    .INIT(64'hFFFFFFFF444F0000)) 
    \count[0]_i_1 
       (.I0(\ap_CS_fsm_reg[1] ),
        .I1(ap_enable_reg_pp0_iter1),
        .I2(\ireg_reg[8]_3 ),
        .I3(\ireg_reg[8]_0 ),
        .I4(\count_reg[1]_0 ),
        .I5(\count_reg[0] ),
        .O(ap_enable_reg_pp0_iter1_reg));
  LUT6 #(
    .INIT(64'hFFB0FFFFFF00FFFF)) 
    \count[1]_i_1 
       (.I0(\ap_CS_fsm_reg[1] ),
        .I1(ap_enable_reg_pp0_iter1),
        .I2(\count[1]_i_2_n_0 ),
        .I3(r_bin_V_TREADY),
        .I4(\count_reg[1] ),
        .I5(\count_reg[1]_0 ),
        .O(count));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hBFBFFFBF)) 
    \count[1]_i_2 
       (.I0(\ireg_reg[8]_0 ),
        .I1(ap_enable_reg_pp0_iter2),
        .I2(Q[0]),
        .I3(ap_start),
        .I4(\odata_int_reg[0] ),
        .O(\count[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7F330000FFFFFFFF)) 
    \ireg[24]_i_1 
       (.I0(ap_enable_reg_pp0_iter2_reg),
        .I1(\odata_int_reg[0] ),
        .I2(\ap_CS_fsm_reg[1] ),
        .I3(ap_enable_reg_pp0_iter0),
        .I4(\ireg_reg[24] ),
        .I5(ap_rst_n),
        .O(\odata_int_reg[24]_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h88F8FFFF)) 
    \ireg[24]_i_3 
       (.I0(ap_enable_reg_pp0_iter2),
        .I1(\ireg_reg[8]_0 ),
        .I2(ap_start),
        .I3(\odata_int_reg[0] ),
        .I4(Q[0]),
        .O(ap_enable_reg_pp0_iter2_reg));
  LUT3 #(
    .INIT(8'h04)) 
    \ireg[8]_i_2 
       (.I0(\ireg_reg[8]_1 ),
        .I1(\ireg_reg[0]_0 ),
        .I2(r_bin_V_TREADY),
        .O(ireg01_out));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h4F)) 
    \ireg[8]_i_3 
       (.I0(\ap_CS_fsm_reg[1] ),
        .I1(ap_enable_reg_pp0_iter1),
        .I2(\ireg_reg[8]_3 ),
        .O(vld_in));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[0] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[6]_0 [0]),
        .Q(\ireg_reg_n_0_[0] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[1] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[6]_0 [1]),
        .Q(\ireg_reg_n_0_[1] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[2] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[6]_0 [2]),
        .Q(\ireg_reg_n_0_[2] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[3] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[6]_0 [3]),
        .Q(\ireg_reg_n_0_[3] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[4] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[6]_0 [4]),
        .Q(\ireg_reg_n_0_[4] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[5] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[6]_0 [5]),
        .Q(\ireg_reg_n_0_[5] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[6] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(\ireg_reg[6]_0 [6]),
        .Q(\ireg_reg_n_0_[6] ),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \ireg_reg[8] 
       (.C(ap_clk),
        .CE(ireg01_out),
        .D(vld_in),
        .Q(\ireg_reg[8]_1 ),
        .R(SR));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \odata_int[0]_i_1__0 
       (.I0(\ireg_reg_n_0_[0] ),
        .I1(\ireg_reg[8]_1 ),
        .I2(add_ln1353_1_fu_138_p2[0]),
        .I3(\ireg_reg[8]_3 ),
        .I4(\odata_int_reg[6] [0]),
        .O(\ireg_reg[8]_2 [0]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \odata_int[1]_i_1__0 
       (.I0(\ireg_reg_n_0_[1] ),
        .I1(\ireg_reg[8]_1 ),
        .I2(add_ln1353_1_fu_138_p2[1]),
        .I3(\ireg_reg[8]_3 ),
        .I4(\odata_int_reg[6] [1]),
        .O(\ireg_reg[8]_2 [1]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h2FAF)) 
    \odata_int[24]_i_1 
       (.I0(ap_enable_reg_pp0_iter0),
        .I1(\ap_CS_fsm_reg[1] ),
        .I2(\odata_int_reg[0] ),
        .I3(ap_enable_reg_pp0_iter2_reg),
        .O(\odata_int_reg[24] ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \odata_int[2]_i_10 
       (.I0(\odata_int_reg[6]_i_4_1 [6]),
        .I1(\odata_int_reg[6]_i_4_0 [6]),
        .I2(P[6]),
        .I3(P[7]),
        .I4(\odata_int_reg[6]_i_4_0 [7]),
        .I5(\odata_int_reg[6]_i_4_1 [7]),
        .O(\odata_int[2]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \odata_int[2]_i_11 
       (.I0(\odata_int_reg[6]_i_4_1 [5]),
        .I1(\odata_int_reg[6]_i_4_0 [5]),
        .I2(P[5]),
        .I3(P[6]),
        .I4(\odata_int_reg[6]_i_4_0 [6]),
        .I5(\odata_int_reg[6]_i_4_1 [6]),
        .O(\odata_int[2]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \odata_int[2]_i_12 
       (.I0(\odata_int_reg[6]_i_4_1 [4]),
        .I1(\odata_int_reg[6]_i_4_0 [4]),
        .I2(P[4]),
        .I3(P[5]),
        .I4(\odata_int_reg[6]_i_4_0 [5]),
        .I5(\odata_int_reg[6]_i_4_1 [5]),
        .O(\odata_int[2]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \odata_int[2]_i_13 
       (.I0(\odata_int_reg[6]_i_4_1 [3]),
        .I1(\odata_int_reg[6]_i_4_0 [3]),
        .I2(P[3]),
        .I3(P[4]),
        .I4(\odata_int_reg[6]_i_4_0 [4]),
        .I5(\odata_int_reg[6]_i_4_1 [4]),
        .O(\odata_int[2]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \odata_int[2]_i_14 
       (.I0(\odata_int_reg[6]_i_4_1 [2]),
        .I1(\odata_int_reg[6]_i_4_0 [2]),
        .I2(P[2]),
        .I3(P[3]),
        .I4(\odata_int_reg[6]_i_4_0 [3]),
        .I5(\odata_int_reg[6]_i_4_1 [3]),
        .O(\odata_int[2]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \odata_int[2]_i_15 
       (.I0(\odata_int_reg[6]_i_4_1 [1]),
        .I1(\odata_int_reg[6]_i_4_0 [1]),
        .I2(P[1]),
        .I3(P[2]),
        .I4(\odata_int_reg[6]_i_4_0 [2]),
        .I5(\odata_int_reg[6]_i_4_1 [2]),
        .O(\odata_int[2]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \odata_int[2]_i_16 
       (.I0(\odata_int_reg[6]_i_4_1 [0]),
        .I1(\odata_int_reg[6]_i_4_0 [0]),
        .I2(P[0]),
        .I3(P[1]),
        .I4(\odata_int_reg[6]_i_4_0 [1]),
        .I5(\odata_int_reg[6]_i_4_1 [1]),
        .O(\odata_int[2]_i_16_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \odata_int[2]_i_17 
       (.I0(\odata_int_reg[6]_i_4_1 [0]),
        .I1(\odata_int_reg[6]_i_4_0 [0]),
        .I2(P[0]),
        .O(\odata_int[2]_i_17_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \odata_int[2]_i_1__0 
       (.I0(\ireg_reg_n_0_[2] ),
        .I1(\ireg_reg[8]_1 ),
        .I2(add_ln1353_1_fu_138_p2[2]),
        .I3(\ireg_reg[8]_3 ),
        .I4(\odata_int_reg[6] [2]),
        .O(\ireg_reg[8]_2 [2]));
  LUT3 #(
    .INIT(8'hE8)) 
    \odata_int[2]_i_3 
       (.I0(P[6]),
        .I1(\odata_int_reg[6]_i_4_0 [6]),
        .I2(\odata_int_reg[6]_i_4_1 [6]),
        .O(\odata_int[2]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \odata_int[2]_i_4 
       (.I0(P[5]),
        .I1(\odata_int_reg[6]_i_4_0 [5]),
        .I2(\odata_int_reg[6]_i_4_1 [5]),
        .O(\odata_int[2]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \odata_int[2]_i_5 
       (.I0(P[4]),
        .I1(\odata_int_reg[6]_i_4_0 [4]),
        .I2(\odata_int_reg[6]_i_4_1 [4]),
        .O(\odata_int[2]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \odata_int[2]_i_6 
       (.I0(P[3]),
        .I1(\odata_int_reg[6]_i_4_0 [3]),
        .I2(\odata_int_reg[6]_i_4_1 [3]),
        .O(\odata_int[2]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \odata_int[2]_i_7 
       (.I0(P[2]),
        .I1(\odata_int_reg[6]_i_4_0 [2]),
        .I2(\odata_int_reg[6]_i_4_1 [2]),
        .O(\odata_int[2]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \odata_int[2]_i_8 
       (.I0(P[1]),
        .I1(\odata_int_reg[6]_i_4_0 [1]),
        .I2(\odata_int_reg[6]_i_4_1 [1]),
        .O(\odata_int[2]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \odata_int[2]_i_9 
       (.I0(P[0]),
        .I1(\odata_int_reg[6]_i_4_0 [0]),
        .I2(\odata_int_reg[6]_i_4_1 [0]),
        .O(\odata_int[2]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \odata_int[3]_i_1__0 
       (.I0(\ireg_reg_n_0_[3] ),
        .I1(\ireg_reg[8]_1 ),
        .I2(add_ln1353_1_fu_138_p2[3]),
        .I3(\ireg_reg[8]_3 ),
        .I4(\odata_int_reg[6] [3]),
        .O(\ireg_reg[8]_2 [3]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \odata_int[4]_i_1__0 
       (.I0(\ireg_reg_n_0_[4] ),
        .I1(\ireg_reg[8]_1 ),
        .I2(add_ln1353_1_fu_138_p2[4]),
        .I3(\ireg_reg[8]_3 ),
        .I4(\odata_int_reg[6] [4]),
        .O(\ireg_reg[8]_2 [4]));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \odata_int[5]_i_1__0 
       (.I0(\ireg_reg_n_0_[5] ),
        .I1(\ireg_reg[8]_1 ),
        .I2(add_ln1353_1_fu_138_p2[5]),
        .I3(\ireg_reg[8]_3 ),
        .I4(\odata_int_reg[6] [5]),
        .O(\ireg_reg[8]_2 [5]));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \odata_int[6]_i_10 
       (.I0(\odata_int_reg[6]_i_4_1 [9]),
        .I1(\odata_int_reg[6]_i_4_0 [9]),
        .I2(P[9]),
        .I3(P[10]),
        .I4(\odata_int_reg[6]_i_4_0 [10]),
        .I5(\odata_int_reg[6]_i_4_1 [10]),
        .O(\odata_int[6]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \odata_int[6]_i_11 
       (.I0(\odata_int_reg[6]_i_4_1 [8]),
        .I1(\odata_int_reg[6]_i_4_0 [8]),
        .I2(P[8]),
        .I3(P[9]),
        .I4(\odata_int_reg[6]_i_4_0 [9]),
        .I5(\odata_int_reg[6]_i_4_1 [9]),
        .O(\odata_int[6]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \odata_int[6]_i_12 
       (.I0(\odata_int_reg[6]_i_4_1 [7]),
        .I1(\odata_int_reg[6]_i_4_0 [7]),
        .I2(P[7]),
        .I3(P[8]),
        .I4(\odata_int_reg[6]_i_4_0 [8]),
        .I5(\odata_int_reg[6]_i_4_1 [8]),
        .O(\odata_int[6]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \odata_int[6]_i_3 
       (.I0(\ireg_reg_n_0_[6] ),
        .I1(\ireg_reg[8]_1 ),
        .I2(add_ln1353_1_fu_138_p2[6]),
        .I3(\ireg_reg[8]_3 ),
        .I4(\odata_int_reg[6] [6]),
        .O(\ireg_reg[8]_2 [6]));
  LUT3 #(
    .INIT(8'hE8)) 
    \odata_int[6]_i_6 
       (.I0(P[9]),
        .I1(\odata_int_reg[6]_i_4_0 [9]),
        .I2(\odata_int_reg[6]_i_4_1 [9]),
        .O(\odata_int[6]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \odata_int[6]_i_7 
       (.I0(P[8]),
        .I1(\odata_int_reg[6]_i_4_0 [8]),
        .I2(\odata_int_reg[6]_i_4_1 [8]),
        .O(\odata_int[6]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \odata_int[6]_i_8 
       (.I0(P[7]),
        .I1(\odata_int_reg[6]_i_4_0 [7]),
        .I2(\odata_int_reg[6]_i_4_1 [7]),
        .O(\odata_int[6]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \odata_int[6]_i_9 
       (.I0(\odata_int_reg[6]_i_4_1 [10]),
        .I1(\odata_int_reg[6]_i_4_0 [10]),
        .I2(P[10]),
        .I3(P[11]),
        .I4(\odata_int_reg[6]_i_4_0 [11]),
        .I5(\odata_int_reg[6]_i_4_1 [11]),
        .O(\odata_int[6]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hBBFB)) 
    \odata_int[8]_i_1__0 
       (.I0(\ireg_reg[8]_1 ),
        .I1(\ireg_reg[8]_3 ),
        .I2(ap_enable_reg_pp0_iter1),
        .I3(\ap_CS_fsm_reg[1] ),
        .O(\ireg_reg[8]_2 [7]));
  CARRY8 \odata_int_reg[2]_i_2 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\odata_int_reg[2]_i_2_n_0 ,\odata_int_reg[2]_i_2_n_1 ,\odata_int_reg[2]_i_2_n_2 ,\odata_int_reg[2]_i_2_n_3 ,\odata_int_reg[2]_i_2_n_4 ,\odata_int_reg[2]_i_2_n_5 ,\odata_int_reg[2]_i_2_n_6 ,\odata_int_reg[2]_i_2_n_7 }),
        .DI({\odata_int[2]_i_3_n_0 ,\odata_int[2]_i_4_n_0 ,\odata_int[2]_i_5_n_0 ,\odata_int[2]_i_6_n_0 ,\odata_int[2]_i_7_n_0 ,\odata_int[2]_i_8_n_0 ,\odata_int[2]_i_9_n_0 ,1'b0}),
        .O({add_ln1353_1_fu_138_p2[2:0],\NLW_odata_int_reg[2]_i_2_O_UNCONNECTED [4:0]}),
        .S({\odata_int[2]_i_10_n_0 ,\odata_int[2]_i_11_n_0 ,\odata_int[2]_i_12_n_0 ,\odata_int[2]_i_13_n_0 ,\odata_int[2]_i_14_n_0 ,\odata_int[2]_i_15_n_0 ,\odata_int[2]_i_16_n_0 ,\odata_int[2]_i_17_n_0 }));
  CARRY8 \odata_int_reg[6]_i_4 
       (.CI(\odata_int_reg[2]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_odata_int_reg[6]_i_4_CO_UNCONNECTED [7:3],\odata_int_reg[6]_i_4_n_5 ,\odata_int_reg[6]_i_4_n_6 ,\odata_int_reg[6]_i_4_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,\odata_int[6]_i_6_n_0 ,\odata_int[6]_i_7_n_0 ,\odata_int[6]_i_8_n_0 }),
        .O({\NLW_odata_int_reg[6]_i_4_O_UNCONNECTED [7:4],add_ln1353_1_fu_138_p2[6:3]}),
        .S({1'b0,1'b0,1'b0,1'b0,\odata_int[6]_i_9_n_0 ,\odata_int[6]_i_10_n_0 ,\odata_int[6]_i_11_n_0 ,\odata_int[6]_i_12_n_0 }));
endmodule

(* ORIG_REF_NAME = "xil_defaultlib_obuf" *) 
module hls_compute_r_bins_xil_defaultlib_obuf
   (D,
    \odata_int_reg[24]_0 ,
    SR,
    E,
    \odata_int_reg[24]_1 ,
    add_ln1353_1_fu_138_p2,
    Q,
    ap_rst_n,
    \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0] ,
    ap_start,
    \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0 ,
    ap_enable_reg_pp0_iter2,
    \odata_int_reg[0]_0 ,
    \odata_int_reg[24]_2 ,
    ap_clk);
  output [6:0]D;
  output \odata_int_reg[24]_0 ;
  output [0:0]SR;
  output [0:0]E;
  output [12:0]\odata_int_reg[24]_1 ;
  input [6:0]add_ln1353_1_fu_138_p2;
  input [6:0]Q;
  input ap_rst_n;
  input [0:0]\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0] ;
  input ap_start;
  input \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0 ;
  input ap_enable_reg_pp0_iter2;
  input [0:0]\odata_int_reg[0]_0 ;
  input [12:0]\odata_int_reg[24]_2 ;
  input ap_clk;

  wire [6:0]D;
  wire [0:0]E;
  wire [6:0]Q;
  wire [0:0]SR;
  wire [6:0]add_ln1353_1_fu_138_p2;
  wire ap_clk;
  wire ap_enable_reg_pp0_iter2;
  wire ap_rst_n;
  wire ap_start;
  wire [0:0]\odata_int_reg[0]_0 ;
  wire \odata_int_reg[24]_0 ;
  wire [12:0]\odata_int_reg[24]_1 ;
  wire [12:0]\odata_int_reg[24]_2 ;
  wire [0:0]\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0] ;
  wire \trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \ireg[0]_i_1 
       (.I0(add_ln1353_1_fu_138_p2[0]),
        .I1(\odata_int_reg[24]_0 ),
        .I2(Q[0]),
        .O(D[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    \ireg[1]_i_1 
       (.I0(add_ln1353_1_fu_138_p2[1]),
        .I1(\odata_int_reg[24]_0 ),
        .I2(Q[1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \ireg[2]_i_1 
       (.I0(add_ln1353_1_fu_138_p2[2]),
        .I1(\odata_int_reg[24]_0 ),
        .I2(Q[2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \ireg[3]_i_1 
       (.I0(add_ln1353_1_fu_138_p2[3]),
        .I1(\odata_int_reg[24]_0 ),
        .I2(Q[3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \ireg[4]_i_1 
       (.I0(add_ln1353_1_fu_138_p2[4]),
        .I1(\odata_int_reg[24]_0 ),
        .I2(Q[4]),
        .O(D[4]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \ireg[5]_i_1 
       (.I0(add_ln1353_1_fu_138_p2[5]),
        .I1(\odata_int_reg[24]_0 ),
        .I2(Q[5]),
        .O(D[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \ireg[6]_i_1 
       (.I0(add_ln1353_1_fu_138_p2[6]),
        .I1(\odata_int_reg[24]_0 ),
        .I2(Q[6]),
        .O(D[6]));
  LUT1 #(
    .INIT(2'h1)) 
    \odata_int[6]_i_1 
       (.I0(ap_rst_n),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h4FFF)) 
    \odata_int[6]_i_5 
       (.I0(\odata_int_reg[24]_1 [12]),
        .I1(ap_start),
        .I2(\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0] ),
        .I3(ap_enable_reg_pp0_iter2),
        .O(\odata_int_reg[24]_0 ));
  FDRE \odata_int_reg[0] 
       (.C(ap_clk),
        .CE(\odata_int_reg[0]_0 ),
        .D(\odata_int_reg[24]_2 [0]),
        .Q(\odata_int_reg[24]_1 [0]),
        .R(SR));
  FDRE \odata_int_reg[10] 
       (.C(ap_clk),
        .CE(\odata_int_reg[0]_0 ),
        .D(\odata_int_reg[24]_2 [10]),
        .Q(\odata_int_reg[24]_1 [10]),
        .R(SR));
  FDRE \odata_int_reg[11] 
       (.C(ap_clk),
        .CE(\odata_int_reg[0]_0 ),
        .D(\odata_int_reg[24]_2 [11]),
        .Q(\odata_int_reg[24]_1 [11]),
        .R(SR));
  FDRE \odata_int_reg[1] 
       (.C(ap_clk),
        .CE(\odata_int_reg[0]_0 ),
        .D(\odata_int_reg[24]_2 [1]),
        .Q(\odata_int_reg[24]_1 [1]),
        .R(SR));
  FDRE \odata_int_reg[24] 
       (.C(ap_clk),
        .CE(\odata_int_reg[0]_0 ),
        .D(\odata_int_reg[24]_2 [12]),
        .Q(\odata_int_reg[24]_1 [12]),
        .R(SR));
  FDRE \odata_int_reg[2] 
       (.C(ap_clk),
        .CE(\odata_int_reg[0]_0 ),
        .D(\odata_int_reg[24]_2 [2]),
        .Q(\odata_int_reg[24]_1 [2]),
        .R(SR));
  FDRE \odata_int_reg[3] 
       (.C(ap_clk),
        .CE(\odata_int_reg[0]_0 ),
        .D(\odata_int_reg[24]_2 [3]),
        .Q(\odata_int_reg[24]_1 [3]),
        .R(SR));
  FDRE \odata_int_reg[4] 
       (.C(ap_clk),
        .CE(\odata_int_reg[0]_0 ),
        .D(\odata_int_reg[24]_2 [4]),
        .Q(\odata_int_reg[24]_1 [4]),
        .R(SR));
  FDRE \odata_int_reg[5] 
       (.C(ap_clk),
        .CE(\odata_int_reg[0]_0 ),
        .D(\odata_int_reg[24]_2 [5]),
        .Q(\odata_int_reg[24]_1 [5]),
        .R(SR));
  FDRE \odata_int_reg[6] 
       (.C(ap_clk),
        .CE(\odata_int_reg[0]_0 ),
        .D(\odata_int_reg[24]_2 [6]),
        .Q(\odata_int_reg[24]_1 [6]),
        .R(SR));
  FDRE \odata_int_reg[7] 
       (.C(ap_clk),
        .CE(\odata_int_reg[0]_0 ),
        .D(\odata_int_reg[24]_2 [7]),
        .Q(\odata_int_reg[24]_1 [7]),
        .R(SR));
  FDRE \odata_int_reg[8] 
       (.C(ap_clk),
        .CE(\odata_int_reg[0]_0 ),
        .D(\odata_int_reg[24]_2 [8]),
        .Q(\odata_int_reg[24]_1 [8]),
        .R(SR));
  FDRE \odata_int_reg[9] 
       (.C(ap_clk),
        .CE(\odata_int_reg[0]_0 ),
        .D(\odata_int_reg[24]_2 [9]),
        .Q(\odata_int_reg[24]_1 [9]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h008A8A8A)) 
    ret_V_1_reg_219_reg_i_2
       (.I0(\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0] ),
        .I1(\odata_int_reg[24]_1 [12]),
        .I2(ap_start),
        .I3(\trunc_ln1353_reg_194_pp0_iter1_reg_reg[0]_0 ),
        .I4(ap_enable_reg_pp0_iter2),
        .O(E));
endmodule

(* ORIG_REF_NAME = "xil_defaultlib_obuf" *) 
module hls_compute_r_bins_xil_defaultlib_obuf__parameterized0
   (Q,
    SR,
    r_bin_V_TREADY,
    \ireg_reg[0] ,
    ap_rst_n,
    \odata_int_reg[0]_0 ,
    D,
    ap_clk);
  output [7:0]Q;
  output [0:0]SR;
  input r_bin_V_TREADY;
  input [0:0]\ireg_reg[0] ;
  input ap_rst_n;
  input [0:0]\odata_int_reg[0]_0 ;
  input [7:0]D;
  input ap_clk;

  wire [7:0]D;
  wire [7:0]Q;
  wire [0:0]SR;
  wire ap_clk;
  wire ap_rst_n;
  wire [0:0]\ireg_reg[0] ;
  wire \odata_int[6]_i_2_n_0 ;
  wire [0:0]\odata_int_reg[0]_0 ;
  wire r_bin_V_TREADY;

  LUT4 #(
    .INIT(16'hD0FF)) 
    \ireg[8]_i_1 
       (.I0(Q[7]),
        .I1(r_bin_V_TREADY),
        .I2(\ireg_reg[0] ),
        .I3(ap_rst_n),
        .O(SR));
  LUT2 #(
    .INIT(4'hB)) 
    \odata_int[6]_i_2 
       (.I0(r_bin_V_TREADY),
        .I1(Q[7]),
        .O(\odata_int[6]_i_2_n_0 ));
  FDRE \odata_int_reg[0] 
       (.C(ap_clk),
        .CE(\odata_int[6]_i_2_n_0 ),
        .D(D[0]),
        .Q(Q[0]),
        .R(\odata_int_reg[0]_0 ));
  FDRE \odata_int_reg[1] 
       (.C(ap_clk),
        .CE(\odata_int[6]_i_2_n_0 ),
        .D(D[1]),
        .Q(Q[1]),
        .R(\odata_int_reg[0]_0 ));
  FDRE \odata_int_reg[2] 
       (.C(ap_clk),
        .CE(\odata_int[6]_i_2_n_0 ),
        .D(D[2]),
        .Q(Q[2]),
        .R(\odata_int_reg[0]_0 ));
  FDRE \odata_int_reg[3] 
       (.C(ap_clk),
        .CE(\odata_int[6]_i_2_n_0 ),
        .D(D[3]),
        .Q(Q[3]),
        .R(\odata_int_reg[0]_0 ));
  FDRE \odata_int_reg[4] 
       (.C(ap_clk),
        .CE(\odata_int[6]_i_2_n_0 ),
        .D(D[4]),
        .Q(Q[4]),
        .R(\odata_int_reg[0]_0 ));
  FDRE \odata_int_reg[5] 
       (.C(ap_clk),
        .CE(\odata_int[6]_i_2_n_0 ),
        .D(D[5]),
        .Q(Q[5]),
        .R(\odata_int_reg[0]_0 ));
  FDRE \odata_int_reg[6] 
       (.C(ap_clk),
        .CE(\odata_int[6]_i_2_n_0 ),
        .D(D[6]),
        .Q(Q[6]),
        .R(\odata_int_reg[0]_0 ));
  FDRE \odata_int_reg[8] 
       (.C(ap_clk),
        .CE(\odata_int[6]_i_2_n_0 ),
        .D(D[7]),
        .Q(Q[7]),
        .R(\odata_int_reg[0]_0 ));
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
