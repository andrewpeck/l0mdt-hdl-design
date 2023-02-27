// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Mon Feb 27 09:32:42 2023
// Host        : atlas126a running 64-bit openSUSE Tumbleweed
// Command     : write_verilog -force -mode synth_stub -rename_top c2cSlave_K_C2C_0 -prefix
//               c2cSlave_K_C2C_0_ c2cSlave_K_C2CB_0_stub.v
// Design      : c2cSlave_K_C2CB_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axi_chip2chip_v5_0_9,Vivado 2020.2" *)
module c2cSlave_K_C2C_0(m_aclk, m_aresetn, m_axi_awaddr, m_axi_awlen, 
  m_axi_awsize, m_axi_awburst, m_axi_awvalid, m_axi_awready, m_axi_wdata, m_axi_wstrb, 
  m_axi_wlast, m_axi_wvalid, m_axi_wready, m_axi_bresp, m_axi_bvalid, m_axi_bready, 
  m_axi_araddr, m_axi_arlen, m_axi_arsize, m_axi_arburst, m_axi_arvalid, m_axi_arready, 
  m_axi_rdata, m_axi_rresp, m_axi_rlast, m_axi_rvalid, m_axi_rready, axi_c2c_s2m_intr_in, 
  axi_c2c_m2s_intr_out, axi_c2c_phy_clk, axi_c2c_aurora_channel_up, 
  axi_c2c_aurora_tx_tready, axi_c2c_aurora_tx_tdata, axi_c2c_aurora_tx_tvalid, 
  axi_c2c_aurora_rx_tdata, axi_c2c_aurora_rx_tvalid, aurora_do_cc, aurora_pma_init_in, 
  aurora_init_clk, aurora_pma_init_out, aurora_mmcm_not_locked, aurora_reset_pb, 
  axi_c2c_config_error_out, axi_c2c_link_status_out, axi_c2c_multi_bit_error_out, 
  m_axi_lite_aclk, m_axi_lite_awaddr, m_axi_lite_awprot, m_axi_lite_awvalid, 
  m_axi_lite_awready, m_axi_lite_wdata, m_axi_lite_wstrb, m_axi_lite_wvalid, 
  m_axi_lite_wready, m_axi_lite_bresp, m_axi_lite_bvalid, m_axi_lite_bready, 
  m_axi_lite_araddr, m_axi_lite_arprot, m_axi_lite_arvalid, m_axi_lite_arready, 
  m_axi_lite_rdata, m_axi_lite_rresp, m_axi_lite_rvalid, m_axi_lite_rready)
/* synthesis syn_black_box black_box_pad_pin="m_aclk,m_aresetn,m_axi_awaddr[31:0],m_axi_awlen[7:0],m_axi_awsize[2:0],m_axi_awburst[1:0],m_axi_awvalid,m_axi_awready,m_axi_wdata[31:0],m_axi_wstrb[3:0],m_axi_wlast,m_axi_wvalid,m_axi_wready,m_axi_bresp[1:0],m_axi_bvalid,m_axi_bready,m_axi_araddr[31:0],m_axi_arlen[7:0],m_axi_arsize[2:0],m_axi_arburst[1:0],m_axi_arvalid,m_axi_arready,m_axi_rdata[31:0],m_axi_rresp[1:0],m_axi_rlast,m_axi_rvalid,m_axi_rready,axi_c2c_s2m_intr_in[3:0],axi_c2c_m2s_intr_out[3:0],axi_c2c_phy_clk,axi_c2c_aurora_channel_up,axi_c2c_aurora_tx_tready,axi_c2c_aurora_tx_tdata[63:0],axi_c2c_aurora_tx_tvalid,axi_c2c_aurora_rx_tdata[63:0],axi_c2c_aurora_rx_tvalid,aurora_do_cc,aurora_pma_init_in,aurora_init_clk,aurora_pma_init_out,aurora_mmcm_not_locked,aurora_reset_pb,axi_c2c_config_error_out,axi_c2c_link_status_out,axi_c2c_multi_bit_error_out,m_axi_lite_aclk,m_axi_lite_awaddr[31:0],m_axi_lite_awprot[1:0],m_axi_lite_awvalid,m_axi_lite_awready,m_axi_lite_wdata[31:0],m_axi_lite_wstrb[3:0],m_axi_lite_wvalid,m_axi_lite_wready,m_axi_lite_bresp[1:0],m_axi_lite_bvalid,m_axi_lite_bready,m_axi_lite_araddr[31:0],m_axi_lite_arprot[1:0],m_axi_lite_arvalid,m_axi_lite_arready,m_axi_lite_rdata[31:0],m_axi_lite_rresp[1:0],m_axi_lite_rvalid,m_axi_lite_rready" */;
  input m_aclk;
  input m_aresetn;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output m_axi_awvalid;
  input m_axi_awready;
  output [31:0]m_axi_wdata;
  output [3:0]m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_wvalid;
  input m_axi_wready;
  input [1:0]m_axi_bresp;
  input m_axi_bvalid;
  output m_axi_bready;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output m_axi_arvalid;
  input m_axi_arready;
  input [31:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input m_axi_rvalid;
  output m_axi_rready;
  input [3:0]axi_c2c_s2m_intr_in;
  output [3:0]axi_c2c_m2s_intr_out;
  input axi_c2c_phy_clk;
  input axi_c2c_aurora_channel_up;
  input axi_c2c_aurora_tx_tready;
  output [63:0]axi_c2c_aurora_tx_tdata;
  output axi_c2c_aurora_tx_tvalid;
  input [63:0]axi_c2c_aurora_rx_tdata;
  input axi_c2c_aurora_rx_tvalid;
  output aurora_do_cc;
  input aurora_pma_init_in;
  input aurora_init_clk;
  output aurora_pma_init_out;
  input aurora_mmcm_not_locked;
  output aurora_reset_pb;
  output axi_c2c_config_error_out;
  output axi_c2c_link_status_out;
  output axi_c2c_multi_bit_error_out;
  input m_axi_lite_aclk;
  output [31:0]m_axi_lite_awaddr;
  output [1:0]m_axi_lite_awprot;
  output m_axi_lite_awvalid;
  input m_axi_lite_awready;
  output [31:0]m_axi_lite_wdata;
  output [3:0]m_axi_lite_wstrb;
  output m_axi_lite_wvalid;
  input m_axi_lite_wready;
  input [1:0]m_axi_lite_bresp;
  input m_axi_lite_bvalid;
  output m_axi_lite_bready;
  output [31:0]m_axi_lite_araddr;
  output [1:0]m_axi_lite_arprot;
  output m_axi_lite_arvalid;
  input m_axi_lite_arready;
  input [31:0]m_axi_lite_rdata;
  input [1:0]m_axi_lite_rresp;
  input m_axi_lite_rvalid;
  output m_axi_lite_rready;
endmodule
