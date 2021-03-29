// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Mon Mar 29 15:39:10 2021
// Host        : atlas126a running 64-bit openSUSE Tumbleweed
// Command     : write_verilog -force -mode funcsim
//               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_get_rom_addr/hls_get_rom_addr_sim_netlist.v
// Design      : hls_get_rom_addr
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "hls_get_rom_addr,get_rom_addr,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "HLS" *) 
(* x_core_info = "get_rom_addr,Vivado 2019.2.1" *) 
(* NotValidForBitStream *)
module hls_get_rom_addr
   (ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    theta_for_lut_V,
    rom_index_V,
    lut_start_addr_V,
    lbins0_gbl1_V,
    slcvec_offset_angle_int_V,
    slcvec_angle_polar_offset_mrad_V);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input ap_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ap_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input ap_rst;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) input ap_start;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* x_interface_info = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* x_interface_info = "xilinx.com:signal:data:1.0 theta_for_lut_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME theta_for_lut_V, LAYERED_METADATA undef" *) input [13:0]theta_for_lut_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 rom_index_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME rom_index_V, LAYERED_METADATA undef" *) output [2:0]rom_index_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 lut_start_addr_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME lut_start_addr_V, LAYERED_METADATA undef" *) output [11:0]lut_start_addr_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 lbins0_gbl1_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME lbins0_gbl1_V, LAYERED_METADATA undef" *) input [0:0]lbins0_gbl1_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 slcvec_offset_angle_int_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME slcvec_offset_angle_int_V, LAYERED_METADATA undef" *) input [10:0]slcvec_offset_angle_int_V;
  (* x_interface_info = "xilinx.com:signal:data:1.0 slcvec_angle_polar_offset_mrad_V DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME slcvec_angle_polar_offset_mrad_V, LAYERED_METADATA undef" *) output [13:0]slcvec_angle_polar_offset_mrad_V;

  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst;
  wire ap_start;
  wire [0:0]lbins0_gbl1_V;
  wire [11:0]lut_start_addr_V;
  wire [2:0]rom_index_V;
  wire [13:0]slcvec_angle_polar_offset_mrad_V;
  wire [10:0]slcvec_offset_angle_int_V;
  wire [13:0]theta_for_lut_V;

  hls_get_rom_addr_get_rom_addr U0
       (.ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_ready(ap_ready),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .lbins0_gbl1_V(lbins0_gbl1_V),
        .lut_start_addr_V(lut_start_addr_V),
        .rom_index_V(rom_index_V),
        .slcvec_angle_polar_offset_mrad_V(slcvec_angle_polar_offset_mrad_V),
        .slcvec_offset_angle_int_V(slcvec_offset_angle_int_V),
        .theta_for_lut_V(theta_for_lut_V));
endmodule

(* ORIG_REF_NAME = "get_rom_addr" *) 
module hls_get_rom_addr_get_rom_addr
   (ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    theta_for_lut_V,
    rom_index_V,
    lut_start_addr_V,
    lbins0_gbl1_V,
    slcvec_offset_angle_int_V,
    slcvec_angle_polar_offset_mrad_V);
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input [13:0]theta_for_lut_V;
  output [2:0]rom_index_V;
  output [11:0]lut_start_addr_V;
  input [0:0]lbins0_gbl1_V;
  input [10:0]slcvec_offset_angle_int_V;
  output [13:0]slcvec_angle_polar_offset_mrad_V;

  wire \<const0> ;
  wire ap_clk;
  wire ap_done;
  wire ap_enable_reg_pp0_iter1;
  wire ap_enable_reg_pp0_iter2;
  wire ap_idle;
  wire [13:1]ap_phi_reg_pp0_iter2_p_Val2_2_reg_111;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_2_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[11]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[12]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[5]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[6]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_1_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0 ;
  wire \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]_i_1_n_0 ;
  wire ap_rst;
  wire ap_start;
  wire [0:0]lbins0_gbl1_V;
  wire lbins0_gbl1_V_0_data_reg;
  wire lbins0_gbl1_V_read_reg_194;
  wire [11:0]lut_start_addr_V;
  wire lut_start_addr_V_1_data_reg1;
  wire \lut_start_addr_V_1_data_reg[10]_i_1_n_0 ;
  wire \lut_start_addr_V_1_data_reg[11]_i_1_n_0 ;
  wire \lut_start_addr_V_1_data_reg[11]_i_2_n_0 ;
  wire \lut_start_addr_V_1_data_reg[11]_i_3_n_0 ;
  wire \lut_start_addr_V_1_data_reg[3]_i_1_n_0 ;
  wire \lut_start_addr_V_1_data_reg[4]_i_1_n_0 ;
  wire \lut_start_addr_V_1_data_reg[5]_i_1_n_0 ;
  wire \lut_start_addr_V_1_data_reg[6]_i_1_n_0 ;
  wire \lut_start_addr_V_1_data_reg[7]_i_1_n_0 ;
  wire \lut_start_addr_V_1_data_reg[8]_i_1_n_0 ;
  wire \lut_start_addr_V_1_data_reg[8]_i_2_n_0 ;
  wire \lut_start_addr_V_1_data_reg[8]_i_3_n_0 ;
  wire \lut_start_addr_V_1_data_reg[9]_i_1_n_0 ;
  wire \lut_start_addr_V_1_data_reg[9]_i_2_n_0 ;
  wire [13:2]p_0_in;
  wire [13:3]p_Val2_s_fu_120_p3;
  wire [4:4]ret_V_1_fu_166_p2;
  wire \rom_index_V_1_data_reg[1]_i_1_n_0 ;
  wire \rom_index_V_1_data_reg[2]_i_1_n_0 ;
  wire slcvec_angle_polar_o_reg_2030;
  wire [13:1]\^slcvec_angle_polar_offset_mrad_V ;
  wire [13:2]slcvec_angle_polar_offset_mrad_V_1_data_reg;
  wire slcvec_angle_polar_offset_mrad_V_1_data_reg1;
  wire [10:0]slcvec_offset_angle_int_V;
  wire [13:0]theta_for_lut_V;
  wire [13:1]theta_for_lut_V_0_data_reg;

  assign ap_ready = ap_start;
  assign rom_index_V[2:0] = lut_start_addr_V[2:0];
  assign slcvec_angle_polar_offset_mrad_V[13:1] = \^slcvec_angle_polar_offset_mrad_V [13:1];
  assign slcvec_angle_polar_offset_mrad_V[0] = \<const0> ;
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
       (.I0(ap_done),
        .I1(ap_enable_reg_pp0_iter2),
        .I2(ap_start),
        .I3(ap_enable_reg_pp0_iter1),
        .O(ap_idle));
  LUT6 #(
    .INIT(64'hB8B8B88BB88BB88B)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_1 
       (.I0(theta_for_lut_V_0_data_reg[10]),
        .I1(lbins0_gbl1_V_0_data_reg),
        .I2(p_Val2_s_fu_120_p3[11]),
        .I3(p_Val2_s_fu_120_p3[10]),
        .I4(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_2_n_0 ),
        .I5(p_Val2_s_fu_120_p3[9]),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_2 
       (.I0(p_Val2_s_fu_120_p3[7]),
        .I1(p_Val2_s_fu_120_p3[4]),
        .I2(p_Val2_s_fu_120_p3[3]),
        .I3(p_Val2_s_fu_120_p3[5]),
        .I4(p_Val2_s_fu_120_p3[6]),
        .I5(p_Val2_s_fu_120_p3[8]),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[11]_i_1 
       (.I0(theta_for_lut_V_0_data_reg[11]),
        .I1(lbins0_gbl1_V_0_data_reg),
        .I2(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0 ),
        .I3(p_Val2_s_fu_120_p3[12]),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[12]_i_1 
       (.I0(theta_for_lut_V_0_data_reg[12]),
        .I1(lbins0_gbl1_V_0_data_reg),
        .I2(p_Val2_s_fu_120_p3[13]),
        .I3(p_Val2_s_fu_120_p3[12]),
        .I4(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0 ),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h8BBBBBBB)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_1 
       (.I0(theta_for_lut_V_0_data_reg[13]),
        .I1(lbins0_gbl1_V_0_data_reg),
        .I2(p_Val2_s_fu_120_p3[13]),
        .I3(p_Val2_s_fu_120_p3[12]),
        .I4(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0 ),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFAAA8)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2 
       (.I0(p_Val2_s_fu_120_p3[9]),
        .I1(p_Val2_s_fu_120_p3[8]),
        .I2(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0 ),
        .I3(p_Val2_s_fu_120_p3[7]),
        .I4(p_Val2_s_fu_120_p3[10]),
        .I5(p_Val2_s_fu_120_p3[11]),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hCFAA)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]_i_1 
       (.I0(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]),
        .I1(theta_for_lut_V_0_data_reg[1]),
        .I2(lbins0_gbl1_V_0_data_reg),
        .I3(ap_enable_reg_pp0_iter1),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h8B)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]_i_1 
       (.I0(theta_for_lut_V_0_data_reg[2]),
        .I1(lbins0_gbl1_V_0_data_reg),
        .I2(p_Val2_s_fu_120_p3[3]),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h8BB8)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]_i_1 
       (.I0(theta_for_lut_V_0_data_reg[3]),
        .I1(lbins0_gbl1_V_0_data_reg),
        .I2(p_Val2_s_fu_120_p3[4]),
        .I3(p_Val2_s_fu_120_p3[3]),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hB8888BBB)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]_i_1 
       (.I0(theta_for_lut_V_0_data_reg[4]),
        .I1(lbins0_gbl1_V_0_data_reg),
        .I2(p_Val2_s_fu_120_p3[3]),
        .I3(p_Val2_s_fu_120_p3[4]),
        .I4(p_Val2_s_fu_120_p3[5]),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B88BB88BB88B)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[5]_i_1 
       (.I0(theta_for_lut_V_0_data_reg[5]),
        .I1(lbins0_gbl1_V_0_data_reg),
        .I2(p_Val2_s_fu_120_p3[6]),
        .I3(p_Val2_s_fu_120_p3[5]),
        .I4(p_Val2_s_fu_120_p3[3]),
        .I5(p_Val2_s_fu_120_p3[4]),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hB88B)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[6]_i_1 
       (.I0(theta_for_lut_V_0_data_reg[6]),
        .I1(lbins0_gbl1_V_0_data_reg),
        .I2(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0 ),
        .I3(p_Val2_s_fu_120_p3[7]),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hBBB8888B)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]_i_1 
       (.I0(theta_for_lut_V_0_data_reg[7]),
        .I1(lbins0_gbl1_V_0_data_reg),
        .I2(p_Val2_s_fu_120_p3[7]),
        .I3(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0 ),
        .I4(p_Val2_s_fu_120_p3[8]),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8B8B8B8B8B8B8BB8)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_1 
       (.I0(theta_for_lut_V_0_data_reg[8]),
        .I1(lbins0_gbl1_V_0_data_reg),
        .I2(p_Val2_s_fu_120_p3[9]),
        .I3(p_Val2_s_fu_120_p3[8]),
        .I4(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0 ),
        .I5(p_Val2_s_fu_120_p3[7]),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFFF8)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2 
       (.I0(p_Val2_s_fu_120_p3[4]),
        .I1(p_Val2_s_fu_120_p3[3]),
        .I2(p_Val2_s_fu_120_p3[5]),
        .I3(p_Val2_s_fu_120_p3[6]),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8888BBB)) 
    \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]_i_1 
       (.I0(theta_for_lut_V_0_data_reg[9]),
        .I1(lbins0_gbl1_V_0_data_reg),
        .I2(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_2_n_0 ),
        .I3(p_Val2_s_fu_120_p3[9]),
        .I4(p_Val2_s_fu_120_p3[10]),
        .O(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]_i_1_n_0 ));
  FDRE \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[10] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter1),
        .D(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]_i_1_n_0 ),
        .Q(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[11] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter1),
        .D(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[11]_i_1_n_0 ),
        .Q(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[11]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[12] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter1),
        .D(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[12]_i_1_n_0 ),
        .Q(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[12]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[13] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter1),
        .D(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_1_n_0 ),
        .Q(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]_i_1_n_0 ),
        .Q(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[2] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter1),
        .D(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]_i_1_n_0 ),
        .Q(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[3] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter1),
        .D(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]_i_1_n_0 ),
        .Q(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[4] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter1),
        .D(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]_i_1_n_0 ),
        .Q(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[5] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter1),
        .D(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[5]_i_1_n_0 ),
        .Q(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[5]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[6] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter1),
        .D(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[6]_i_1_n_0 ),
        .Q(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[6]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[7] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter1),
        .D(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]_i_1_n_0 ),
        .Q(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[8] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter1),
        .D(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_1_n_0 ),
        .Q(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]),
        .R(1'b0));
  FDRE \ap_phi_reg_pp0_iter2_p_Val2_2_reg_111_reg[9] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter1),
        .D(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]_i_1_n_0 ),
        .Q(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \lbins0_gbl1_V_0_data_reg[0]_i_1 
       (.I0(ap_enable_reg_pp0_iter1),
        .I1(ap_start),
        .I2(ap_enable_reg_pp0_iter2),
        .I3(ap_done),
        .O(lut_start_addr_V_1_data_reg1));
  FDRE #(
    .INIT(1'b0)) 
    \lbins0_gbl1_V_0_data_reg_reg[0] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(lbins0_gbl1_V),
        .Q(lbins0_gbl1_V_0_data_reg),
        .R(1'b0));
  FDRE \lbins0_gbl1_V_read_reg_194_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(lbins0_gbl1_V_0_data_reg),
        .Q(lbins0_gbl1_V_read_reg_194),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hC993)) 
    \lut_start_addr_V_1_data_reg[10]_i_1 
       (.I0(\lut_start_addr_V_1_data_reg[11]_i_2_n_0 ),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[12]),
        .I2(\lut_start_addr_V_1_data_reg[11]_i_3_n_0 ),
        .I3(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[11]),
        .O(\lut_start_addr_V_1_data_reg[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h3333366C)) 
    \lut_start_addr_V_1_data_reg[11]_i_1 
       (.I0(\lut_start_addr_V_1_data_reg[11]_i_2_n_0 ),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]),
        .I2(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[11]),
        .I3(\lut_start_addr_V_1_data_reg[11]_i_3_n_0 ),
        .I4(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[12]),
        .O(\lut_start_addr_V_1_data_reg[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC8C0C08000000003)) 
    \lut_start_addr_V_1_data_reg[11]_i_2 
       (.I0(\lut_start_addr_V_1_data_reg[8]_i_2_n_0 ),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]),
        .I2(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]),
        .I3(\lut_start_addr_V_1_data_reg[8]_i_3_n_0 ),
        .I4(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]),
        .I5(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]),
        .O(\lut_start_addr_V_1_data_reg[11]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \lut_start_addr_V_1_data_reg[11]_i_3 
       (.I0(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]),
        .I2(\lut_start_addr_V_1_data_reg[8]_i_3_n_0 ),
        .I3(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]),
        .I4(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]),
        .O(\lut_start_addr_V_1_data_reg[11]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h5666AAAA)) 
    \lut_start_addr_V_1_data_reg[3]_i_1 
       (.I0(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[5]),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]),
        .I2(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]),
        .I3(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]),
        .I4(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]),
        .O(\lut_start_addr_V_1_data_reg[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h66666AAAAAAAAAAA)) 
    \lut_start_addr_V_1_data_reg[4]_i_1 
       (.I0(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[6]),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]),
        .I2(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]),
        .I3(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]),
        .I4(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]),
        .I5(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[5]),
        .O(\lut_start_addr_V_1_data_reg[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h69)) 
    \lut_start_addr_V_1_data_reg[5]_i_1 
       (.I0(\lut_start_addr_V_1_data_reg[8]_i_2_n_0 ),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]),
        .I2(\lut_start_addr_V_1_data_reg[8]_i_3_n_0 ),
        .O(\lut_start_addr_V_1_data_reg[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h9336)) 
    \lut_start_addr_V_1_data_reg[6]_i_1 
       (.I0(\lut_start_addr_V_1_data_reg[8]_i_2_n_0 ),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]),
        .I2(\lut_start_addr_V_1_data_reg[8]_i_3_n_0 ),
        .I3(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]),
        .O(\lut_start_addr_V_1_data_reg[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h33366CCC)) 
    \lut_start_addr_V_1_data_reg[7]_i_1 
       (.I0(\lut_start_addr_V_1_data_reg[8]_i_2_n_0 ),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]),
        .I2(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]),
        .I3(\lut_start_addr_V_1_data_reg[8]_i_3_n_0 ),
        .I4(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]),
        .O(\lut_start_addr_V_1_data_reg[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h363C3C6CCCCCCCCC)) 
    \lut_start_addr_V_1_data_reg[8]_i_1 
       (.I0(\lut_start_addr_V_1_data_reg[8]_i_2_n_0 ),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]),
        .I2(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]),
        .I3(\lut_start_addr_V_1_data_reg[8]_i_3_n_0 ),
        .I4(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]),
        .I5(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]),
        .O(\lut_start_addr_V_1_data_reg[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8888800000000001)) 
    \lut_start_addr_V_1_data_reg[8]_i_2 
       (.I0(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[6]),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]),
        .I2(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]),
        .I3(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]),
        .I4(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]),
        .I5(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[5]),
        .O(\lut_start_addr_V_1_data_reg[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \lut_start_addr_V_1_data_reg[8]_i_3 
       (.I0(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[5]),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]),
        .I2(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]),
        .I3(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]),
        .I4(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]),
        .I5(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[6]),
        .O(\lut_start_addr_V_1_data_reg[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \lut_start_addr_V_1_data_reg[9]_i_1 
       (.I0(\lut_start_addr_V_1_data_reg[11]_i_2_n_0 ),
        .I1(\lut_start_addr_V_1_data_reg[9]_i_2_n_0 ),
        .O(\lut_start_addr_V_1_data_reg[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000001FFFFFFFE)) 
    \lut_start_addr_V_1_data_reg[9]_i_2 
       (.I0(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[10]),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]),
        .I2(\lut_start_addr_V_1_data_reg[8]_i_3_n_0 ),
        .I3(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[7]),
        .I4(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[9]),
        .I5(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[11]),
        .O(\lut_start_addr_V_1_data_reg[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \lut_start_addr_V_1_data_reg_reg[10] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(\lut_start_addr_V_1_data_reg[10]_i_1_n_0 ),
        .Q(lut_start_addr_V[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lut_start_addr_V_1_data_reg_reg[11] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(\lut_start_addr_V_1_data_reg[11]_i_1_n_0 ),
        .Q(lut_start_addr_V[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lut_start_addr_V_1_data_reg_reg[3] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(\lut_start_addr_V_1_data_reg[3]_i_1_n_0 ),
        .Q(lut_start_addr_V[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lut_start_addr_V_1_data_reg_reg[4] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(\lut_start_addr_V_1_data_reg[4]_i_1_n_0 ),
        .Q(lut_start_addr_V[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lut_start_addr_V_1_data_reg_reg[5] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(\lut_start_addr_V_1_data_reg[5]_i_1_n_0 ),
        .Q(lut_start_addr_V[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lut_start_addr_V_1_data_reg_reg[6] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(\lut_start_addr_V_1_data_reg[6]_i_1_n_0 ),
        .Q(lut_start_addr_V[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lut_start_addr_V_1_data_reg_reg[7] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(\lut_start_addr_V_1_data_reg[7]_i_1_n_0 ),
        .Q(lut_start_addr_V[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lut_start_addr_V_1_data_reg_reg[8] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(\lut_start_addr_V_1_data_reg[8]_i_1_n_0 ),
        .Q(lut_start_addr_V[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \lut_start_addr_V_1_data_reg_reg[9] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(\lut_start_addr_V_1_data_reg[9]_i_1_n_0 ),
        .Q(lut_start_addr_V[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \rom_index_V_1_data_reg[0]_i_1 
       (.I0(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]),
        .O(ret_V_1_fu_166_p2));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h95)) 
    \rom_index_V_1_data_reg[1]_i_1 
       (.I0(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]),
        .I2(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]),
        .O(\rom_index_V_1_data_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h556A)) 
    \rom_index_V_1_data_reg[2]_i_1 
       (.I0(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[4]),
        .I1(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[2]),
        .I2(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[1]),
        .I3(ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[3]),
        .O(\rom_index_V_1_data_reg[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_index_V_1_data_reg_reg[0] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(ret_V_1_fu_166_p2),
        .Q(lut_start_addr_V[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rom_index_V_1_data_reg_reg[1] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(\rom_index_V_1_data_reg[1]_i_1_n_0 ),
        .Q(lut_start_addr_V[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rom_index_V_1_data_reg_reg[2] 
       (.C(ap_clk),
        .CE(ap_enable_reg_pp0_iter2),
        .D(\rom_index_V_1_data_reg[2]_i_1_n_0 ),
        .Q(lut_start_addr_V[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAAAAAAA999999999)) 
    \slcvec_angle_polar_o_reg_203[10]_i_1 
       (.I0(p_Val2_s_fu_120_p3[11]),
        .I1(p_Val2_s_fu_120_p3[10]),
        .I2(p_Val2_s_fu_120_p3[7]),
        .I3(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0 ),
        .I4(p_Val2_s_fu_120_p3[8]),
        .I5(p_Val2_s_fu_120_p3[9]),
        .O(p_0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slcvec_angle_polar_o_reg_203[11]_i_1 
       (.I0(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0 ),
        .I1(p_Val2_s_fu_120_p3[12]),
        .O(p_0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \slcvec_angle_polar_o_reg_203[12]_i_1 
       (.I0(p_Val2_s_fu_120_p3[13]),
        .I1(p_Val2_s_fu_120_p3[12]),
        .I2(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0 ),
        .O(p_0_in[12]));
  LUT1 #(
    .INIT(2'h1)) 
    \slcvec_angle_polar_o_reg_203[13]_i_1 
       (.I0(lbins0_gbl1_V_0_data_reg),
        .O(slcvec_angle_polar_o_reg_2030));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \slcvec_angle_polar_o_reg_203[13]_i_2 
       (.I0(p_Val2_s_fu_120_p3[13]),
        .I1(p_Val2_s_fu_120_p3[12]),
        .I2(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[13]_i_2_n_0 ),
        .O(p_0_in[13]));
  LUT1 #(
    .INIT(2'h1)) 
    \slcvec_angle_polar_o_reg_203[2]_i_1 
       (.I0(p_Val2_s_fu_120_p3[3]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \slcvec_angle_polar_o_reg_203[3]_i_1 
       (.I0(p_Val2_s_fu_120_p3[4]),
        .I1(p_Val2_s_fu_120_p3[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h87)) 
    \slcvec_angle_polar_o_reg_203[4]_i_1 
       (.I0(p_Val2_s_fu_120_p3[3]),
        .I1(p_Val2_s_fu_120_p3[4]),
        .I2(p_Val2_s_fu_120_p3[5]),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hA999)) 
    \slcvec_angle_polar_o_reg_203[5]_i_1 
       (.I0(p_Val2_s_fu_120_p3[6]),
        .I1(p_Val2_s_fu_120_p3[5]),
        .I2(p_Val2_s_fu_120_p3[3]),
        .I3(p_Val2_s_fu_120_p3[4]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hFEEE0111)) 
    \slcvec_angle_polar_o_reg_203[6]_i_1 
       (.I0(p_Val2_s_fu_120_p3[6]),
        .I1(p_Val2_s_fu_120_p3[5]),
        .I2(p_Val2_s_fu_120_p3[3]),
        .I3(p_Val2_s_fu_120_p3[4]),
        .I4(p_Val2_s_fu_120_p3[7]),
        .O(p_0_in[6]));
  LUT6 #(
    .INIT(64'hFFFFFFEA00000015)) 
    \slcvec_angle_polar_o_reg_203[7]_i_1 
       (.I0(p_Val2_s_fu_120_p3[7]),
        .I1(p_Val2_s_fu_120_p3[4]),
        .I2(p_Val2_s_fu_120_p3[3]),
        .I3(p_Val2_s_fu_120_p3[5]),
        .I4(p_Val2_s_fu_120_p3[6]),
        .I5(p_Val2_s_fu_120_p3[8]),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h5556)) 
    \slcvec_angle_polar_o_reg_203[8]_i_1 
       (.I0(p_Val2_s_fu_120_p3[9]),
        .I1(p_Val2_s_fu_120_p3[8]),
        .I2(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0 ),
        .I3(p_Val2_s_fu_120_p3[7]),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFE0001FF)) 
    \slcvec_angle_polar_o_reg_203[9]_i_1 
       (.I0(p_Val2_s_fu_120_p3[7]),
        .I1(\ap_phi_reg_pp0_iter2_p_Val2_2_reg_111[8]_i_2_n_0 ),
        .I2(p_Val2_s_fu_120_p3[8]),
        .I3(p_Val2_s_fu_120_p3[9]),
        .I4(p_Val2_s_fu_120_p3[10]),
        .O(p_0_in[9]));
  FDRE \slcvec_angle_polar_o_reg_203_reg[10] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_o_reg_2030),
        .D(p_0_in[10]),
        .Q(slcvec_angle_polar_offset_mrad_V_1_data_reg[10]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_203_reg[11] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_o_reg_2030),
        .D(p_0_in[11]),
        .Q(slcvec_angle_polar_offset_mrad_V_1_data_reg[11]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_203_reg[12] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_o_reg_2030),
        .D(p_0_in[12]),
        .Q(slcvec_angle_polar_offset_mrad_V_1_data_reg[12]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_203_reg[13] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_o_reg_2030),
        .D(p_0_in[13]),
        .Q(slcvec_angle_polar_offset_mrad_V_1_data_reg[13]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_203_reg[2] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_o_reg_2030),
        .D(p_0_in[2]),
        .Q(slcvec_angle_polar_offset_mrad_V_1_data_reg[2]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_203_reg[3] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_o_reg_2030),
        .D(p_0_in[3]),
        .Q(slcvec_angle_polar_offset_mrad_V_1_data_reg[3]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_203_reg[4] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_o_reg_2030),
        .D(p_0_in[4]),
        .Q(slcvec_angle_polar_offset_mrad_V_1_data_reg[4]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_203_reg[5] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_o_reg_2030),
        .D(p_0_in[5]),
        .Q(slcvec_angle_polar_offset_mrad_V_1_data_reg[5]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_203_reg[6] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_o_reg_2030),
        .D(p_0_in[6]),
        .Q(slcvec_angle_polar_offset_mrad_V_1_data_reg[6]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_203_reg[7] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_o_reg_2030),
        .D(p_0_in[7]),
        .Q(slcvec_angle_polar_offset_mrad_V_1_data_reg[7]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_203_reg[8] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_o_reg_2030),
        .D(p_0_in[8]),
        .Q(slcvec_angle_polar_offset_mrad_V_1_data_reg[8]),
        .R(1'b0));
  FDRE \slcvec_angle_polar_o_reg_203_reg[9] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_o_reg_2030),
        .D(p_0_in[9]),
        .Q(slcvec_angle_polar_offset_mrad_V_1_data_reg[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg[13]_i_1 
       (.I0(ap_enable_reg_pp0_iter2),
        .I1(lbins0_gbl1_V_read_reg_194),
        .O(slcvec_angle_polar_offset_mrad_V_1_data_reg1));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[10] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_offset_mrad_V_1_data_reg1),
        .D(slcvec_angle_polar_offset_mrad_V_1_data_reg[10]),
        .Q(\^slcvec_angle_polar_offset_mrad_V [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[11] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_offset_mrad_V_1_data_reg1),
        .D(slcvec_angle_polar_offset_mrad_V_1_data_reg[11]),
        .Q(\^slcvec_angle_polar_offset_mrad_V [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[12] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_offset_mrad_V_1_data_reg1),
        .D(slcvec_angle_polar_offset_mrad_V_1_data_reg[12]),
        .Q(\^slcvec_angle_polar_offset_mrad_V [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[13] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_offset_mrad_V_1_data_reg1),
        .D(slcvec_angle_polar_offset_mrad_V_1_data_reg[13]),
        .Q(\^slcvec_angle_polar_offset_mrad_V [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[1] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_offset_mrad_V_1_data_reg1),
        .D(1'b1),
        .Q(\^slcvec_angle_polar_offset_mrad_V [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[2] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_offset_mrad_V_1_data_reg1),
        .D(slcvec_angle_polar_offset_mrad_V_1_data_reg[2]),
        .Q(\^slcvec_angle_polar_offset_mrad_V [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[3] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_offset_mrad_V_1_data_reg1),
        .D(slcvec_angle_polar_offset_mrad_V_1_data_reg[3]),
        .Q(\^slcvec_angle_polar_offset_mrad_V [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[4] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_offset_mrad_V_1_data_reg1),
        .D(slcvec_angle_polar_offset_mrad_V_1_data_reg[4]),
        .Q(\^slcvec_angle_polar_offset_mrad_V [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[5] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_offset_mrad_V_1_data_reg1),
        .D(slcvec_angle_polar_offset_mrad_V_1_data_reg[5]),
        .Q(\^slcvec_angle_polar_offset_mrad_V [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[6] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_offset_mrad_V_1_data_reg1),
        .D(slcvec_angle_polar_offset_mrad_V_1_data_reg[6]),
        .Q(\^slcvec_angle_polar_offset_mrad_V [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[7] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_offset_mrad_V_1_data_reg1),
        .D(slcvec_angle_polar_offset_mrad_V_1_data_reg[7]),
        .Q(\^slcvec_angle_polar_offset_mrad_V [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[8] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_offset_mrad_V_1_data_reg1),
        .D(slcvec_angle_polar_offset_mrad_V_1_data_reg[8]),
        .Q(\^slcvec_angle_polar_offset_mrad_V [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_angle_polar_offset_mrad_V_1_data_reg_reg[9] 
       (.C(ap_clk),
        .CE(slcvec_angle_polar_offset_mrad_V_1_data_reg1),
        .D(slcvec_angle_polar_offset_mrad_V_1_data_reg[9]),
        .Q(\^slcvec_angle_polar_offset_mrad_V [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_offset_angle_int_V_0_data_reg_reg[0] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(slcvec_offset_angle_int_V[0]),
        .Q(p_Val2_s_fu_120_p3[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_offset_angle_int_V_0_data_reg_reg[10] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(slcvec_offset_angle_int_V[10]),
        .Q(p_Val2_s_fu_120_p3[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_offset_angle_int_V_0_data_reg_reg[1] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(slcvec_offset_angle_int_V[1]),
        .Q(p_Val2_s_fu_120_p3[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_offset_angle_int_V_0_data_reg_reg[2] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(slcvec_offset_angle_int_V[2]),
        .Q(p_Val2_s_fu_120_p3[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_offset_angle_int_V_0_data_reg_reg[3] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(slcvec_offset_angle_int_V[3]),
        .Q(p_Val2_s_fu_120_p3[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_offset_angle_int_V_0_data_reg_reg[4] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(slcvec_offset_angle_int_V[4]),
        .Q(p_Val2_s_fu_120_p3[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_offset_angle_int_V_0_data_reg_reg[5] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(slcvec_offset_angle_int_V[5]),
        .Q(p_Val2_s_fu_120_p3[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_offset_angle_int_V_0_data_reg_reg[6] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(slcvec_offset_angle_int_V[6]),
        .Q(p_Val2_s_fu_120_p3[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_offset_angle_int_V_0_data_reg_reg[7] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(slcvec_offset_angle_int_V[7]),
        .Q(p_Val2_s_fu_120_p3[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_offset_angle_int_V_0_data_reg_reg[8] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(slcvec_offset_angle_int_V[8]),
        .Q(p_Val2_s_fu_120_p3[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \slcvec_offset_angle_int_V_0_data_reg_reg[9] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(slcvec_offset_angle_int_V[9]),
        .Q(p_Val2_s_fu_120_p3[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \theta_for_lut_V_0_data_reg_reg[10] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(theta_for_lut_V[10]),
        .Q(theta_for_lut_V_0_data_reg[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \theta_for_lut_V_0_data_reg_reg[11] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(theta_for_lut_V[11]),
        .Q(theta_for_lut_V_0_data_reg[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \theta_for_lut_V_0_data_reg_reg[12] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(theta_for_lut_V[12]),
        .Q(theta_for_lut_V_0_data_reg[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \theta_for_lut_V_0_data_reg_reg[13] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(theta_for_lut_V[13]),
        .Q(theta_for_lut_V_0_data_reg[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \theta_for_lut_V_0_data_reg_reg[1] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(theta_for_lut_V[1]),
        .Q(theta_for_lut_V_0_data_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \theta_for_lut_V_0_data_reg_reg[2] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(theta_for_lut_V[2]),
        .Q(theta_for_lut_V_0_data_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \theta_for_lut_V_0_data_reg_reg[3] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(theta_for_lut_V[3]),
        .Q(theta_for_lut_V_0_data_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \theta_for_lut_V_0_data_reg_reg[4] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(theta_for_lut_V[4]),
        .Q(theta_for_lut_V_0_data_reg[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \theta_for_lut_V_0_data_reg_reg[5] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(theta_for_lut_V[5]),
        .Q(theta_for_lut_V_0_data_reg[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \theta_for_lut_V_0_data_reg_reg[6] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(theta_for_lut_V[6]),
        .Q(theta_for_lut_V_0_data_reg[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \theta_for_lut_V_0_data_reg_reg[7] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(theta_for_lut_V[7]),
        .Q(theta_for_lut_V_0_data_reg[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \theta_for_lut_V_0_data_reg_reg[8] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(theta_for_lut_V[8]),
        .Q(theta_for_lut_V_0_data_reg[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \theta_for_lut_V_0_data_reg_reg[9] 
       (.C(ap_clk),
        .CE(lut_start_addr_V_1_data_reg1),
        .D(theta_for_lut_V[9]),
        .Q(theta_for_lut_V_0_data_reg[9]),
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
