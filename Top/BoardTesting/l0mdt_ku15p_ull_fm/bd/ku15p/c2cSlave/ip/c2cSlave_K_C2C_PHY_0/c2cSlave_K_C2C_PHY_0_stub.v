// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
// Date        : Mon Feb 27 09:33:54 2023
// Host        : atlas126a running 64-bit openSUSE Tumbleweed
// Command     : write_verilog -force -mode synth_stub
//               /home/iwsatlas1/dcieri/Work/MDT-fw/l0mdt-hdl-design/Top/BoardTesting/l0mdt_ku15p_ull_fm/bd/ku15p/c2cSlave/ip/c2cSlave_K_C2C_PHY_0/c2cSlave_K_C2C_PHY_0_stub.v
// Design      : c2cSlave_K_C2C_PHY_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku15p-ffva1760-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "aurora_64b66b_v12_0_3, Coregen v14.3_ip3, Number of lanes = 1, Line rate is double5.0Gbps, Reference Clock is double200.0MHz, Interface is Streaming, Flow Control is None and is operating in DUPLEX configuration" *)
module c2cSlave_K_C2C_PHY_0(s_axi_tx_tdata, s_axi_tx_tvalid, 
  s_axi_tx_tready, m_axi_rx_tdata, m_axi_rx_tvalid, rxp, rxn, txp, txn, gt_refclk1_p, gt_refclk1_n, 
  gt_refclk1_out, hard_err, soft_err, channel_up, lane_up, user_clk_out, mmcm_not_locked_out, 
  sync_clk_out, reset_pb, gt_rxcdrovrden_in, power_down, loopback, pma_init, gt_pll_lock, 
  gt0_drpaddr, gt0_drpdi, gt0_drpdo, gt0_drprdy, gt0_drpen, gt0_drpwe, init_clk, link_reset_out, 
  gt_rxusrclk_out, gt_eyescandataerror, gt_eyescanreset, gt_eyescantrigger, gt_rxcdrhold, 
  gt_rxdfelpmreset, gt_rxlpmen, gt_rxpmareset, gt_rxpcsreset, gt_rxrate, gt_rxbufreset, 
  gt_rxpmaresetdone, gt_rxprbssel, gt_rxprbserr, gt_rxprbscntreset, gt_rxresetdone, 
  gt_rxbufstatus, gt_txpostcursor, gt_txdiffctrl, gt_txprecursor, gt_txpolarity, 
  gt_txinhibit, gt_txpmareset, gt_txpcsreset, gt_txprbssel, gt_txprbsforceerr, 
  gt_txbufstatus, gt_txresetdone, gt_pcsrsvdin, gt_dmonitorout, gt_cplllock, gt_qplllock, 
  gt_powergood, sys_reset_out, gt_reset_out, tx_out_clk)
/* synthesis syn_black_box black_box_pad_pin="s_axi_tx_tdata[0:63],s_axi_tx_tvalid,s_axi_tx_tready,m_axi_rx_tdata[0:63],m_axi_rx_tvalid,rxp[0:0],rxn[0:0],txp[0:0],txn[0:0],gt_refclk1_p,gt_refclk1_n,gt_refclk1_out,hard_err,soft_err,channel_up,lane_up[0:0],user_clk_out,mmcm_not_locked_out,sync_clk_out,reset_pb,gt_rxcdrovrden_in,power_down,loopback[2:0],pma_init,gt_pll_lock,gt0_drpaddr[9:0],gt0_drpdi[15:0],gt0_drpdo[15:0],gt0_drprdy,gt0_drpen,gt0_drpwe,init_clk,link_reset_out,gt_rxusrclk_out,gt_eyescandataerror[0:0],gt_eyescanreset[0:0],gt_eyescantrigger[0:0],gt_rxcdrhold[0:0],gt_rxdfelpmreset[0:0],gt_rxlpmen[0:0],gt_rxpmareset[0:0],gt_rxpcsreset[0:0],gt_rxrate[2:0],gt_rxbufreset[0:0],gt_rxpmaresetdone[0:0],gt_rxprbssel[3:0],gt_rxprbserr[0:0],gt_rxprbscntreset[0:0],gt_rxresetdone[0:0],gt_rxbufstatus[2:0],gt_txpostcursor[4:0],gt_txdiffctrl[4:0],gt_txprecursor[4:0],gt_txpolarity[0:0],gt_txinhibit[0:0],gt_txpmareset[0:0],gt_txpcsreset[0:0],gt_txprbssel[3:0],gt_txprbsforceerr[0:0],gt_txbufstatus[1:0],gt_txresetdone[0:0],gt_pcsrsvdin[15:0],gt_dmonitorout[15:0],gt_cplllock[0:0],gt_qplllock,gt_powergood[0:0],sys_reset_out,gt_reset_out,tx_out_clk" */;
  input [0:63]s_axi_tx_tdata;
  input s_axi_tx_tvalid;
  output s_axi_tx_tready;
  output [0:63]m_axi_rx_tdata;
  output m_axi_rx_tvalid;
  input [0:0]rxp;
  input [0:0]rxn;
  output [0:0]txp;
  output [0:0]txn;
  input gt_refclk1_p;
  input gt_refclk1_n;
  output gt_refclk1_out;
  output hard_err;
  output soft_err;
  output channel_up;
  output [0:0]lane_up;
  output user_clk_out;
  output mmcm_not_locked_out;
  output sync_clk_out;
  input reset_pb;
  input gt_rxcdrovrden_in;
  input power_down;
  input [2:0]loopback;
  input pma_init;
  output gt_pll_lock;
  input [9:0]gt0_drpaddr;
  input [15:0]gt0_drpdi;
  output [15:0]gt0_drpdo;
  output gt0_drprdy;
  input gt0_drpen;
  input gt0_drpwe;
  input init_clk;
  output link_reset_out;
  output gt_rxusrclk_out;
  output [0:0]gt_eyescandataerror;
  input [0:0]gt_eyescanreset;
  input [0:0]gt_eyescantrigger;
  input [0:0]gt_rxcdrhold;
  input [0:0]gt_rxdfelpmreset;
  input [0:0]gt_rxlpmen;
  input [0:0]gt_rxpmareset;
  input [0:0]gt_rxpcsreset;
  input [2:0]gt_rxrate;
  input [0:0]gt_rxbufreset;
  output [0:0]gt_rxpmaresetdone;
  input [3:0]gt_rxprbssel;
  output [0:0]gt_rxprbserr;
  input [0:0]gt_rxprbscntreset;
  output [0:0]gt_rxresetdone;
  output [2:0]gt_rxbufstatus;
  input [4:0]gt_txpostcursor;
  input [4:0]gt_txdiffctrl;
  input [4:0]gt_txprecursor;
  input [0:0]gt_txpolarity;
  input [0:0]gt_txinhibit;
  input [0:0]gt_txpmareset;
  input [0:0]gt_txpcsreset;
  input [3:0]gt_txprbssel;
  input [0:0]gt_txprbsforceerr;
  output [1:0]gt_txbufstatus;
  output [0:0]gt_txresetdone;
  input [15:0]gt_pcsrsvdin;
  output [15:0]gt_dmonitorout;
  output [0:0]gt_cplllock;
  output gt_qplllock;
  output [0:0]gt_powergood;
  output sys_reset_out;
  output gt_reset_out;
  output tx_out_clk;
endmodule
