-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Mon Feb 27 09:33:54 2023
-- Host        : atlas126a running 64-bit openSUSE Tumbleweed
-- Command     : write_vhdl -force -mode synth_stub
--               /home/iwsatlas1/dcieri/Work/MDT-fw/l0mdt-hdl-design/Top/BoardTesting/l0mdt_ku15p_ull_fm/bd/ku15p/c2cSlave/ip/c2cSlave_K_C2C_PHY_0/c2cSlave_K_C2C_PHY_0_stub.vhdl
-- Design      : c2cSlave_K_C2C_PHY_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity c2cSlave_K_C2C_PHY_0 is
  Port ( 
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 63 );
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 63 );
    m_axi_rx_tvalid : out STD_LOGIC;
    rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_refclk1_p : in STD_LOGIC;
    gt_refclk1_n : in STD_LOGIC;
    gt_refclk1_out : out STD_LOGIC;
    hard_err : out STD_LOGIC;
    soft_err : out STD_LOGIC;
    channel_up : out STD_LOGIC;
    lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk_out : out STD_LOGIC;
    mmcm_not_locked_out : out STD_LOGIC;
    sync_clk_out : out STD_LOGIC;
    reset_pb : in STD_LOGIC;
    gt_rxcdrovrden_in : in STD_LOGIC;
    power_down : in STD_LOGIC;
    loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    pma_init : in STD_LOGIC;
    gt_pll_lock : out STD_LOGIC;
    gt0_drpaddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    gt0_drpdi : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drpdo : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt0_drprdy : out STD_LOGIC;
    gt0_drpen : in STD_LOGIC;
    gt0_drpwe : in STD_LOGIC;
    init_clk : in STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    gt_rxusrclk_out : out STD_LOGIC;
    gt_eyescandataerror : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_eyescanreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_eyescantrigger : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxcdrhold : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxdfelpmreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxlpmen : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxrate : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt_rxbufreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxpmaresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt_rxprbserr : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxprbscntreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_rxbufstatus : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt_txpostcursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt_txdiffctrl : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt_txprecursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt_txpolarity : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txinhibit : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt_txprbsforceerr : in STD_LOGIC_VECTOR ( 0 to 0 );
    gt_txbufstatus : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt_txresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_pcsrsvdin : in STD_LOGIC_VECTOR ( 15 downto 0 );
    gt_dmonitorout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gt_cplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_qplllock : out STD_LOGIC;
    gt_powergood : out STD_LOGIC_VECTOR ( 0 to 0 );
    sys_reset_out : out STD_LOGIC;
    gt_reset_out : out STD_LOGIC;
    tx_out_clk : out STD_LOGIC
  );

end c2cSlave_K_C2C_PHY_0;

architecture stub of c2cSlave_K_C2C_PHY_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_tx_tdata[0:63],s_axi_tx_tvalid,s_axi_tx_tready,m_axi_rx_tdata[0:63],m_axi_rx_tvalid,rxp[0:0],rxn[0:0],txp[0:0],txn[0:0],gt_refclk1_p,gt_refclk1_n,gt_refclk1_out,hard_err,soft_err,channel_up,lane_up[0:0],user_clk_out,mmcm_not_locked_out,sync_clk_out,reset_pb,gt_rxcdrovrden_in,power_down,loopback[2:0],pma_init,gt_pll_lock,gt0_drpaddr[9:0],gt0_drpdi[15:0],gt0_drpdo[15:0],gt0_drprdy,gt0_drpen,gt0_drpwe,init_clk,link_reset_out,gt_rxusrclk_out,gt_eyescandataerror[0:0],gt_eyescanreset[0:0],gt_eyescantrigger[0:0],gt_rxcdrhold[0:0],gt_rxdfelpmreset[0:0],gt_rxlpmen[0:0],gt_rxpmareset[0:0],gt_rxpcsreset[0:0],gt_rxrate[2:0],gt_rxbufreset[0:0],gt_rxpmaresetdone[0:0],gt_rxprbssel[3:0],gt_rxprbserr[0:0],gt_rxprbscntreset[0:0],gt_rxresetdone[0:0],gt_rxbufstatus[2:0],gt_txpostcursor[4:0],gt_txdiffctrl[4:0],gt_txprecursor[4:0],gt_txpolarity[0:0],gt_txinhibit[0:0],gt_txpmareset[0:0],gt_txpcsreset[0:0],gt_txprbssel[3:0],gt_txprbsforceerr[0:0],gt_txbufstatus[1:0],gt_txresetdone[0:0],gt_pcsrsvdin[15:0],gt_dmonitorout[15:0],gt_cplllock[0:0],gt_qplllock,gt_powergood[0:0],sys_reset_out,gt_reset_out,tx_out_clk";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "aurora_64b66b_v12_0_3, Coregen v14.3_ip3, Number of lanes = 1, Line rate is double5.0Gbps, Reference Clock is double200.0MHz, Interface is Streaming, Flow Control is None and is operating in DUPLEX configuration";
begin
end;
