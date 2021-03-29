// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Mon Mar 29 15:39:10 2021
// Host        : atlas126a running 64-bit openSUSE Tumbleweed
// Command     : write_verilog -force -mode funcsim
//               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_load_LE_refPos/hls_load_LE_refPos_sim_netlist.v
// Design      : hls_load_LE_refPos
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "hls_load_LE_refPos,load_LE_refPos,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "HLS" *) 
(* x_core_info = "load_LE_refPos,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module hls_load_LE_refPos
   (ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    mdtid_V,
    slcvec_pos_ref_V,
    hewindow_pos_ref_V);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input ap_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ap_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input ap_rst;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) input ap_start;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* x_interface_info = "xilinx.com:signal:data:1.0 mdtid_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME mdtid_V, LAYERED_METADATA undef" *) input [8:0]mdtid_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 slcvec_pos_ref_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME slcvec_pos_ref_V, LAYERED_METADATA undef" *) output [17:0]slcvec_pos_ref_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 hewindow_pos_ref_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME hewindow_pos_ref_V, LAYERED_METADATA undef" *) output [17:0]hewindow_pos_ref_V;

  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst;
  wire ap_start;
  wire [17:0]hewindow_pos_ref_V;
  wire [8:0]mdtid_V;
  wire [17:0]slcvec_pos_ref_V;

  hls_load_LE_refPos_load_LE_refPos U0
       (.ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .hewindow_pos_ref_V(hewindow_pos_ref_V),
        .mdtid_V(mdtid_V),
        .slcvec_pos_ref_V(slcvec_pos_ref_V));
endmodule

(* ORIG_REF_NAME = "load_LE_refPos" *) 
module hls_load_LE_refPos_load_LE_refPos
   (ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    mdtid_V,
    slcvec_pos_ref_V,
    hewindow_pos_ref_V);
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [8:0]mdtid_V;
  output [17:0]slcvec_pos_ref_V;
  output [17:0]hewindow_pos_ref_V;

  wire \<const0> ;
  wire ap_clk;
  wire ap_done;
  wire ap_enable_reg_pp0_iter1;
  wire ap_idle;
  wire ap_rst;
  wire ap_start;
  wire [16:1]\^hewindow_pos_ref_V ;
  wire [8:0]mdtid_V;
  wire q0_reg_i_12_n_0;
  wire q0_reg_i_2_n_0;
  wire q0_reg_i_3_n_0;
  wire q0_reg_i_4_n_0;
  wire q0_reg_i_5_n_0;
  wire q0_reg_i_6_n_0;
  wire q0_reg_i_7_n_0;
  wire q0_reg_i_8_n_0;
  wire q0_reg_i_9_n_0;
  wire [9:9]ret_V_3_fu_118_p2;
  wire [9:0]ret_V_fu_95_p2;
  wire [16:1]\^slcvec_pos_ref_V ;
  wire [15:0]NLW_q0_reg_CASDOUTA_UNCONNECTED;
  wire [15:0]NLW_q0_reg_CASDOUTB_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPA_UNCONNECTED;
  wire [1:0]NLW_q0_reg_CASDOUTPB_UNCONNECTED;
  wire [15:13]NLW_q0_reg_DOUTADOUT_UNCONNECTED;
  wire [15:13]NLW_q0_reg_DOUTBDOUT_UNCONNECTED;
  wire [1:0]NLW_q0_reg_DOUTPADOUTP_UNCONNECTED;
  wire [1:0]NLW_q0_reg_DOUTPBDOUTP_UNCONNECTED;

  assign ap_ready = ap_start;
  assign hewindow_pos_ref_V[17] = \<const0> ;
  assign hewindow_pos_ref_V[16:14] = \^hewindow_pos_ref_V [16:14];
  assign hewindow_pos_ref_V[13:12] = \^hewindow_pos_ref_V [16:15];
  assign hewindow_pos_ref_V[11:7] = \^hewindow_pos_ref_V [11:7];
  assign hewindow_pos_ref_V[6] = \^hewindow_pos_ref_V [16];
  assign hewindow_pos_ref_V[5:1] = \^hewindow_pos_ref_V [5:1];
  assign hewindow_pos_ref_V[0] = \^hewindow_pos_ref_V [1];
  assign slcvec_pos_ref_V[17] = \<const0> ;
  assign slcvec_pos_ref_V[16:14] = \^slcvec_pos_ref_V [16:14];
  assign slcvec_pos_ref_V[13:12] = \^slcvec_pos_ref_V [16:15];
  assign slcvec_pos_ref_V[11:7] = \^slcvec_pos_ref_V [11:7];
  assign slcvec_pos_ref_V[6] = \^slcvec_pos_ref_V [16];
  assign slcvec_pos_ref_V[5:1] = \^slcvec_pos_ref_V [5:1];
  assign slcvec_pos_ref_V[0] = \^slcvec_pos_ref_V [1];
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
        .Q(ap_done),
        .R(ap_rst));
  LUT3 #(
    .INIT(8'h01)) 
    ap_idle_INST_0
       (.I0(ap_enable_reg_pp0_iter1),
        .I1(ap_done),
        .I2(ap_start),
        .O(ap_idle));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d13" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* RDADDR_COLLISION_HWCONFIG = "PERFORMANCE" *) 
  (* RTL_RAM_BITS = "13312" *) 
  (* RTL_RAM_NAME = "q0" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "12" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "12" *) 
  RAMB18E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(1),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h000000000000000000000000000000000000000012B312B312B312B312B312B3),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h00000000000000000000000000000000000000001BCB1BCB1BCB1BCB1BCB1BCB),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000062F062F062F062F062F062F),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
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
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000112F112F112F112F112F112F),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h000000000000000000000000000000000000000019E919E919E919E919E919E9),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000044D044D044D044D044D044D),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
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
    .WRITE_WIDTH_B(0)) 
    q0_reg
       (.ADDRARDADDR({ret_V_fu_95_p2[9],q0_reg_i_2_n_0,q0_reg_i_3_n_0,q0_reg_i_4_n_0,q0_reg_i_5_n_0,q0_reg_i_6_n_0,q0_reg_i_7_n_0,q0_reg_i_8_n_0,q0_reg_i_9_n_0,ret_V_fu_95_p2[0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({ret_V_3_fu_118_p2,q0_reg_i_2_n_0,q0_reg_i_3_n_0,q0_reg_i_4_n_0,q0_reg_i_5_n_0,q0_reg_i_6_n_0,q0_reg_i_7_n_0,q0_reg_i_8_n_0,q0_reg_i_9_n_0,ret_V_fu_95_p2[0],1'b0,1'b0,1'b0,1'b0}),
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
        .DINADIN({1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0}),
        .DINPBDINP({1'b1,1'b1}),
        .DOUTADOUT({NLW_q0_reg_DOUTADOUT_UNCONNECTED[15:13],\^slcvec_pos_ref_V [15:14],\^slcvec_pos_ref_V [16],\^slcvec_pos_ref_V [11:7],\^slcvec_pos_ref_V [5:1]}),
        .DOUTBDOUT({NLW_q0_reg_DOUTBDOUT_UNCONNECTED[15:13],\^hewindow_pos_ref_V [15:14],\^hewindow_pos_ref_V [16],\^hewindow_pos_ref_V [11:7],\^hewindow_pos_ref_V [5:1]}),
        .DOUTPADOUTP(NLW_q0_reg_DOUTPADOUTP_UNCONNECTED[1:0]),
        .DOUTPBDOUTP(NLW_q0_reg_DOUTPBDOUTP_UNCONNECTED[1:0]),
        .ENARDEN(ap_start),
        .ENBWREN(ap_start),
        .REGCEAREGCE(ap_enable_reg_pp0_iter1),
        .REGCEB(ap_enable_reg_pp0_iter1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SLEEP(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    q0_reg_i_1
       (.I0(mdtid_V[8]),
        .I1(mdtid_V[6]),
        .I2(q0_reg_i_12_n_0),
        .I3(mdtid_V[7]),
        .O(ret_V_fu_95_p2[9]));
  LUT1 #(
    .INIT(2'h1)) 
    q0_reg_i_10
       (.I0(mdtid_V[0]),
        .O(ret_V_fu_95_p2[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    q0_reg_i_11
       (.I0(mdtid_V[7]),
        .I1(q0_reg_i_12_n_0),
        .I2(mdtid_V[6]),
        .I3(mdtid_V[8]),
        .O(ret_V_3_fu_118_p2));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    q0_reg_i_12
       (.I0(mdtid_V[4]),
        .I1(mdtid_V[2]),
        .I2(mdtid_V[0]),
        .I3(mdtid_V[1]),
        .I4(mdtid_V[3]),
        .I5(mdtid_V[5]),
        .O(q0_reg_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFE01)) 
    q0_reg_i_2
       (.I0(mdtid_V[7]),
        .I1(q0_reg_i_12_n_0),
        .I2(mdtid_V[6]),
        .I3(mdtid_V[8]),
        .O(q0_reg_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hE1)) 
    q0_reg_i_3
       (.I0(mdtid_V[6]),
        .I1(q0_reg_i_12_n_0),
        .I2(mdtid_V[7]),
        .O(q0_reg_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    q0_reg_i_4
       (.I0(q0_reg_i_12_n_0),
        .I1(mdtid_V[6]),
        .O(q0_reg_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000001)) 
    q0_reg_i_5
       (.I0(mdtid_V[4]),
        .I1(mdtid_V[2]),
        .I2(mdtid_V[0]),
        .I3(mdtid_V[1]),
        .I4(mdtid_V[3]),
        .I5(mdtid_V[5]),
        .O(q0_reg_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFE0001)) 
    q0_reg_i_6
       (.I0(mdtid_V[3]),
        .I1(mdtid_V[1]),
        .I2(mdtid_V[0]),
        .I3(mdtid_V[2]),
        .I4(mdtid_V[4]),
        .O(q0_reg_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFE01)) 
    q0_reg_i_7
       (.I0(mdtid_V[2]),
        .I1(mdtid_V[0]),
        .I2(mdtid_V[1]),
        .I3(mdtid_V[3]),
        .O(q0_reg_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hE1)) 
    q0_reg_i_8
       (.I0(mdtid_V[1]),
        .I1(mdtid_V[0]),
        .I2(mdtid_V[2]),
        .O(q0_reg_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h9)) 
    q0_reg_i_9
       (.I0(mdtid_V[0]),
        .I1(mdtid_V[1]),
        .O(q0_reg_i_9_n_0));
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
