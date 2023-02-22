--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Wed Feb 22 10:32:47 2023
--Host        : atlas126a running 64-bit openSUSE Tumbleweed
--Command     : generate_target c2cSlave_wrapper.bd
--Design      : c2cSlave_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity c2cSlave_wrapper is
  port (
    AXI_CLK : in STD_LOGIC;
    AXI_RST_N : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    C2C_INTFS_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    C2C_INTFS_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    C2C_INTFS_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    C2C_INTFS_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    C2C_INTFS_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    CM1_PB_UART_rxd : in STD_LOGIC;
    CM1_PB_UART_txd : out STD_LOGIC;
    DAQ_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DAQ_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DAQ_arready : in STD_LOGIC;
    DAQ_arvalid : out STD_LOGIC;
    DAQ_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DAQ_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DAQ_awready : in STD_LOGIC;
    DAQ_awvalid : out STD_LOGIC;
    DAQ_bready : out STD_LOGIC;
    DAQ_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DAQ_bvalid : in STD_LOGIC;
    DAQ_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DAQ_rready : out STD_LOGIC;
    DAQ_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DAQ_rvalid : in STD_LOGIC;
    DAQ_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DAQ_wready : in STD_LOGIC;
    DAQ_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DAQ_wvalid : out STD_LOGIC;
    FM_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FM_arready : in STD_LOGIC;
    FM_arvalid : out STD_LOGIC;
    FM_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FM_awready : in STD_LOGIC;
    FM_awvalid : out STD_LOGIC;
    FM_bready : out STD_LOGIC;
    FM_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FM_bvalid : in STD_LOGIC;
    FM_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_rready : out STD_LOGIC;
    FM_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FM_rvalid : in STD_LOGIC;
    FM_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_wready : in STD_LOGIC;
    FM_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FM_wvalid : out STD_LOGIC;
    FW_INFO_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FW_INFO_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FW_INFO_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FW_INFO_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FW_INFO_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FW_INFO_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_arready : in STD_LOGIC;
    HAL_arvalid : out STD_LOGIC;
    HAL_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_awready : in STD_LOGIC;
    HAL_awvalid : out STD_LOGIC;
    HAL_bready : out STD_LOGIC;
    HAL_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_bvalid : in STD_LOGIC;
    HAL_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_rready : out STD_LOGIC;
    HAL_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_rvalid : in STD_LOGIC;
    HAL_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_wready : in STD_LOGIC;
    HAL_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HAL_wvalid : out STD_LOGIC;
    HOG_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HOG_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HOG_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HOG_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HOG_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HOG_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HPS_INN_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_INN_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_INN_arready : in STD_LOGIC;
    HPS_INN_arvalid : out STD_LOGIC;
    HPS_INN_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_INN_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_INN_awready : in STD_LOGIC;
    HPS_INN_awvalid : out STD_LOGIC;
    HPS_INN_bready : out STD_LOGIC;
    HPS_INN_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_INN_bvalid : in STD_LOGIC;
    HPS_INN_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_INN_rready : out STD_LOGIC;
    HPS_INN_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_INN_rvalid : in STD_LOGIC;
    HPS_INN_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_INN_wready : in STD_LOGIC;
    HPS_INN_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HPS_INN_wvalid : out STD_LOGIC;
    HPS_MID_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_MID_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_MID_arready : in STD_LOGIC;
    HPS_MID_arvalid : out STD_LOGIC;
    HPS_MID_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_MID_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_MID_awready : in STD_LOGIC;
    HPS_MID_awvalid : out STD_LOGIC;
    HPS_MID_bready : out STD_LOGIC;
    HPS_MID_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_MID_bvalid : in STD_LOGIC;
    HPS_MID_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_MID_rready : out STD_LOGIC;
    HPS_MID_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_MID_rvalid : in STD_LOGIC;
    HPS_MID_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_MID_wready : in STD_LOGIC;
    HPS_MID_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HPS_MID_wvalid : out STD_LOGIC;
    HPS_OUT_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_OUT_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_OUT_arready : in STD_LOGIC;
    HPS_OUT_arvalid : out STD_LOGIC;
    HPS_OUT_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_OUT_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_OUT_awready : in STD_LOGIC;
    HPS_OUT_awvalid : out STD_LOGIC;
    HPS_OUT_bready : out STD_LOGIC;
    HPS_OUT_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_OUT_bvalid : in STD_LOGIC;
    HPS_OUT_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_OUT_rready : out STD_LOGIC;
    HPS_OUT_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_OUT_rvalid : in STD_LOGIC;
    HPS_OUT_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_OUT_wready : in STD_LOGIC;
    HPS_OUT_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HPS_OUT_wvalid : out STD_LOGIC;
    KINTEX_SYS_MGMT_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_overtemp_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccaux_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccint_alarm : out STD_LOGIC;
    K_C2CB_PHY_DEBUG_cplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_dmonitorout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DEBUG_eyescandataerror : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_eyescanreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_eyescantrigger : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_pcsrsvdin : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DEBUG_qplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxbufreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxbufstatus : out STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2CB_PHY_DEBUG_rxcdrhold : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxdfelpmreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxlpmen : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxpmaresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxprbscntreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxprbserr : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2CB_PHY_DEBUG_rxrate : in STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2CB_PHY_DEBUG_rxresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txbufstatus : out STD_LOGIC_VECTOR ( 1 downto 0 );
    K_C2CB_PHY_DEBUG_txdiffctrl : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2CB_PHY_DEBUG_txinhibit : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txpolarity : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txpostcursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2CB_PHY_DEBUG_txprbsforceerr : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2CB_PHY_DEBUG_txprecursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2CB_PHY_DEBUG_txresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DRP_daddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    K_C2CB_PHY_DRP_den : in STD_LOGIC;
    K_C2CB_PHY_DRP_di : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DRP_do : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DRP_drdy : out STD_LOGIC;
    K_C2CB_PHY_DRP_dwe : in STD_LOGIC;
    K_C2CB_PHY_Rx_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_Rx_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_Tx_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_Tx_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_channel_up : out STD_LOGIC;
    K_C2CB_PHY_gt_pll_lock : out STD_LOGIC;
    K_C2CB_PHY_hard_err : out STD_LOGIC;
    K_C2CB_PHY_lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_link_reset_out : out STD_LOGIC;
    K_C2CB_PHY_power_down : in STD_LOGIC;
    K_C2CB_PHY_soft_err : out STD_LOGIC;
    K_C2CB_aurora_do_cc : out STD_LOGIC;
    K_C2CB_aurora_pma_init_in : in STD_LOGIC;
    K_C2CB_axi_c2c_config_error_out : out STD_LOGIC;
    K_C2CB_axi_c2c_link_status_out : out STD_LOGIC;
    K_C2CB_axi_c2c_multi_bit_error_out : out STD_LOGIC;
    K_C2C_PHY_CLK : out STD_LOGIC;
    K_C2C_PHY_DEBUG_cplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_dmonitorout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DEBUG_eyescandataerror : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_eyescanreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_eyescantrigger : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_pcsrsvdin : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DEBUG_qplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxbufreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxbufstatus : out STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2C_PHY_DEBUG_rxcdrhold : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxdfelpmreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxlpmen : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxpmaresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxprbscntreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxprbserr : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2C_PHY_DEBUG_rxrate : in STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2C_PHY_DEBUG_rxresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txbufstatus : out STD_LOGIC_VECTOR ( 1 downto 0 );
    K_C2C_PHY_DEBUG_txdiffctrl : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2C_PHY_DEBUG_txinhibit : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txpolarity : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txpostcursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2C_PHY_DEBUG_txprbsforceerr : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2C_PHY_DEBUG_txprecursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2C_PHY_DEBUG_txresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DRP_daddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    K_C2C_PHY_DRP_den : in STD_LOGIC;
    K_C2C_PHY_DRP_di : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DRP_do : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DRP_drdy : out STD_LOGIC;
    K_C2C_PHY_DRP_dwe : in STD_LOGIC;
    K_C2C_PHY_Rx_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_Rx_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_Tx_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_Tx_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_channel_up : out STD_LOGIC;
    K_C2C_PHY_gt_pll_lock : out STD_LOGIC;
    K_C2C_PHY_gt_refclk1_out : out STD_LOGIC;
    K_C2C_PHY_hard_err : out STD_LOGIC;
    K_C2C_PHY_lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_link_reset_out : out STD_LOGIC;
    K_C2C_PHY_mmcm_not_locked_out : out STD_LOGIC;
    K_C2C_PHY_power_down : in STD_LOGIC;
    K_C2C_PHY_refclk_clk_n : in STD_LOGIC;
    K_C2C_PHY_refclk_clk_p : in STD_LOGIC;
    K_C2C_PHY_soft_err : out STD_LOGIC;
    K_C2C_aurora_do_cc : out STD_LOGIC;
    K_C2C_aurora_pma_init_in : in STD_LOGIC;
    K_C2C_axi_c2c_config_error_out : out STD_LOGIC;
    K_C2C_axi_c2c_link_status_out : out STD_LOGIC;
    K_C2C_axi_c2c_multi_bit_error_out : out STD_LOGIC;
    MPL_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MPL_arready : in STD_LOGIC;
    MPL_arvalid : out STD_LOGIC;
    MPL_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MPL_awready : in STD_LOGIC;
    MPL_awvalid : out STD_LOGIC;
    MPL_bready : out STD_LOGIC;
    MPL_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MPL_bvalid : in STD_LOGIC;
    MPL_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_rready : out STD_LOGIC;
    MPL_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MPL_rvalid : in STD_LOGIC;
    MPL_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_wready : in STD_LOGIC;
    MPL_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    MPL_wvalid : out STD_LOGIC;
    MTC_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MTC_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MTC_arready : in STD_LOGIC;
    MTC_arvalid : out STD_LOGIC;
    MTC_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MTC_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MTC_awready : in STD_LOGIC;
    MTC_awvalid : out STD_LOGIC;
    MTC_bready : out STD_LOGIC;
    MTC_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MTC_bvalid : in STD_LOGIC;
    MTC_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MTC_rready : out STD_LOGIC;
    MTC_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MTC_rvalid : in STD_LOGIC;
    MTC_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MTC_wready : in STD_LOGIC;
    MTC_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    MTC_wvalid : out STD_LOGIC;
    TAR_INN_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_INN_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_INN_arready : in STD_LOGIC;
    TAR_INN_arvalid : out STD_LOGIC;
    TAR_INN_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_INN_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_INN_awready : in STD_LOGIC;
    TAR_INN_awvalid : out STD_LOGIC;
    TAR_INN_bready : out STD_LOGIC;
    TAR_INN_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_INN_bvalid : in STD_LOGIC;
    TAR_INN_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_INN_rready : out STD_LOGIC;
    TAR_INN_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_INN_rvalid : in STD_LOGIC;
    TAR_INN_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_INN_wready : in STD_LOGIC;
    TAR_INN_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TAR_INN_wvalid : out STD_LOGIC;
    TAR_MID_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_MID_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_MID_arready : in STD_LOGIC;
    TAR_MID_arvalid : out STD_LOGIC;
    TAR_MID_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_MID_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_MID_awready : in STD_LOGIC;
    TAR_MID_awvalid : out STD_LOGIC;
    TAR_MID_bready : out STD_LOGIC;
    TAR_MID_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_MID_bvalid : in STD_LOGIC;
    TAR_MID_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_MID_rready : out STD_LOGIC;
    TAR_MID_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_MID_rvalid : in STD_LOGIC;
    TAR_MID_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_MID_wready : in STD_LOGIC;
    TAR_MID_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TAR_MID_wvalid : out STD_LOGIC;
    TAR_OUT_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_OUT_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_OUT_arready : in STD_LOGIC;
    TAR_OUT_arvalid : out STD_LOGIC;
    TAR_OUT_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_OUT_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_OUT_awready : in STD_LOGIC;
    TAR_OUT_awvalid : out STD_LOGIC;
    TAR_OUT_bready : out STD_LOGIC;
    TAR_OUT_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_OUT_bvalid : in STD_LOGIC;
    TAR_OUT_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_OUT_rready : out STD_LOGIC;
    TAR_OUT_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_OUT_rvalid : in STD_LOGIC;
    TAR_OUT_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_OUT_wready : in STD_LOGIC;
    TAR_OUT_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TAR_OUT_wvalid : out STD_LOGIC;
    TF_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TF_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TF_arready : in STD_LOGIC;
    TF_arvalid : out STD_LOGIC;
    TF_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TF_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TF_awready : in STD_LOGIC;
    TF_awvalid : out STD_LOGIC;
    TF_bready : out STD_LOGIC;
    TF_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TF_bvalid : in STD_LOGIC;
    TF_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TF_rready : out STD_LOGIC;
    TF_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TF_rvalid : in STD_LOGIC;
    TF_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TF_wready : in STD_LOGIC;
    TF_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TF_wvalid : out STD_LOGIC;
    UCM_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    UCM_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    UCM_arready : in STD_LOGIC;
    UCM_arvalid : out STD_LOGIC;
    UCM_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    UCM_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    UCM_awready : in STD_LOGIC;
    UCM_awvalid : out STD_LOGIC;
    UCM_bready : out STD_LOGIC;
    UCM_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    UCM_bvalid : in STD_LOGIC;
    UCM_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    UCM_rready : out STD_LOGIC;
    UCM_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    UCM_rvalid : in STD_LOGIC;
    UCM_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    UCM_wready : in STD_LOGIC;
    UCM_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    UCM_wvalid : out STD_LOGIC;
    clk40 : in STD_LOGIC;
    clk50Mhz : in STD_LOGIC;
    reset_n : in STD_LOGIC
  );
end c2cSlave_wrapper;

architecture STRUCTURE of c2cSlave_wrapper is
  component c2cSlave is
  port (
    clk50Mhz : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    AXI_CLK : in STD_LOGIC;
    AXI_RST_N : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_aurora_pma_init_in : in STD_LOGIC;
    K_C2C_aurora_do_cc : out STD_LOGIC;
    K_C2C_axi_c2c_config_error_out : out STD_LOGIC;
    K_C2C_axi_c2c_link_status_out : out STD_LOGIC;
    K_C2C_axi_c2c_multi_bit_error_out : out STD_LOGIC;
    K_C2C_PHY_DRP_daddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    K_C2C_PHY_DRP_den : in STD_LOGIC;
    K_C2C_PHY_DRP_di : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DRP_do : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DRP_drdy : out STD_LOGIC;
    K_C2C_PHY_DRP_dwe : in STD_LOGIC;
    K_C2C_PHY_refclk_clk_n : in STD_LOGIC;
    K_C2C_PHY_refclk_clk_p : in STD_LOGIC;
    K_C2C_PHY_gt_refclk1_out : out STD_LOGIC;
    K_C2C_PHY_Rx_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_Rx_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_Tx_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_Tx_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_power_down : in STD_LOGIC;
    K_C2C_PHY_gt_pll_lock : out STD_LOGIC;
    K_C2C_PHY_hard_err : out STD_LOGIC;
    K_C2C_PHY_soft_err : out STD_LOGIC;
    K_C2C_PHY_lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_mmcm_not_locked_out : out STD_LOGIC;
    K_C2C_PHY_link_reset_out : out STD_LOGIC;
    K_C2C_PHY_channel_up : out STD_LOGIC;
    K_C2C_PHY_DEBUG_cplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_dmonitorout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DEBUG_eyescandataerror : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_eyescanreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_eyescantrigger : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_pcsrsvdin : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DEBUG_qplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxbufreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxbufstatus : out STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2C_PHY_DEBUG_rxcdrhold : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxdfelpmreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxlpmen : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxpmaresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxprbscntreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxprbserr : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_rxprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2C_PHY_DEBUG_rxrate : in STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2C_PHY_DEBUG_rxresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txbufstatus : out STD_LOGIC_VECTOR ( 1 downto 0 );
    K_C2C_PHY_DEBUG_txdiffctrl : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2C_PHY_DEBUG_txinhibit : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txpolarity : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txpostcursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2C_PHY_DEBUG_txprbsforceerr : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_DEBUG_txprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2C_PHY_DEBUG_txprecursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2C_PHY_DEBUG_txresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_CLK : out STD_LOGIC;
    K_C2CB_aurora_pma_init_in : in STD_LOGIC;
    K_C2CB_aurora_do_cc : out STD_LOGIC;
    K_C2CB_axi_c2c_config_error_out : out STD_LOGIC;
    K_C2CB_axi_c2c_link_status_out : out STD_LOGIC;
    K_C2CB_axi_c2c_multi_bit_error_out : out STD_LOGIC;
    K_C2CB_PHY_DRP_daddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    K_C2CB_PHY_DRP_den : in STD_LOGIC;
    K_C2CB_PHY_DRP_di : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DRP_do : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DRP_drdy : out STD_LOGIC;
    K_C2CB_PHY_DRP_dwe : in STD_LOGIC;
    K_C2CB_PHY_Rx_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_Rx_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_Tx_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_Tx_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_power_down : in STD_LOGIC;
    K_C2CB_PHY_gt_pll_lock : out STD_LOGIC;
    K_C2CB_PHY_hard_err : out STD_LOGIC;
    K_C2CB_PHY_soft_err : out STD_LOGIC;
    K_C2CB_PHY_lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_link_reset_out : out STD_LOGIC;
    K_C2CB_PHY_channel_up : out STD_LOGIC;
    K_C2CB_PHY_DEBUG_cplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_dmonitorout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DEBUG_eyescandataerror : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_eyescanreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_eyescantrigger : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_pcsrsvdin : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DEBUG_qplllock : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxbufreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxbufstatus : out STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2CB_PHY_DEBUG_rxcdrhold : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxdfelpmreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxlpmen : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxpmaresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxprbscntreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxprbserr : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_rxprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2CB_PHY_DEBUG_rxrate : in STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2CB_PHY_DEBUG_rxresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txbufstatus : out STD_LOGIC_VECTOR ( 1 downto 0 );
    K_C2CB_PHY_DEBUG_txdiffctrl : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2CB_PHY_DEBUG_txinhibit : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txpcsreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txpmareset : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txpolarity : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txpostcursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2CB_PHY_DEBUG_txprbsforceerr : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_DEBUG_txprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2CB_PHY_DEBUG_txprecursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2CB_PHY_DEBUG_txresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    KINTEX_SYS_MGMT_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccint_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccaux_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_overtemp_alarm : out STD_LOGIC;
    FW_INFO_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FW_INFO_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FW_INFO_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FW_INFO_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FW_INFO_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FW_INFO_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    FW_INFO_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    C2C_INTFS_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    C2C_INTFS_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    C2C_INTFS_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    C2C_INTFS_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    C2C_INTFS_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    C2C_INTFS_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    CM1_PB_UART_rxd : in STD_LOGIC;
    CM1_PB_UART_txd : out STD_LOGIC;
    HOG_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HOG_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HOG_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HOG_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HOG_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HOG_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HOG_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_awvalid : out STD_LOGIC;
    HAL_awready : in STD_LOGIC;
    HAL_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HAL_wvalid : out STD_LOGIC;
    HAL_wready : in STD_LOGIC;
    HAL_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_bvalid : in STD_LOGIC;
    HAL_bready : out STD_LOGIC;
    HAL_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_arvalid : out STD_LOGIC;
    HAL_arready : in STD_LOGIC;
    HAL_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_rvalid : in STD_LOGIC;
    HAL_rready : out STD_LOGIC;
    clk40 : in STD_LOGIC;
    MTC_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MTC_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MTC_awvalid : out STD_LOGIC;
    MTC_awready : in STD_LOGIC;
    MTC_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MTC_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    MTC_wvalid : out STD_LOGIC;
    MTC_wready : in STD_LOGIC;
    MTC_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MTC_bvalid : in STD_LOGIC;
    MTC_bready : out STD_LOGIC;
    MTC_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MTC_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MTC_arvalid : out STD_LOGIC;
    MTC_arready : in STD_LOGIC;
    MTC_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MTC_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MTC_rvalid : in STD_LOGIC;
    MTC_rready : out STD_LOGIC;
    TF_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TF_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TF_awvalid : out STD_LOGIC;
    TF_awready : in STD_LOGIC;
    TF_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TF_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TF_wvalid : out STD_LOGIC;
    TF_wready : in STD_LOGIC;
    TF_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TF_bvalid : in STD_LOGIC;
    TF_bready : out STD_LOGIC;
    TF_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TF_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TF_arvalid : out STD_LOGIC;
    TF_arready : in STD_LOGIC;
    TF_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TF_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TF_rvalid : in STD_LOGIC;
    TF_rready : out STD_LOGIC;
    UCM_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    UCM_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    UCM_awvalid : out STD_LOGIC;
    UCM_awready : in STD_LOGIC;
    UCM_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    UCM_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    UCM_wvalid : out STD_LOGIC;
    UCM_wready : in STD_LOGIC;
    UCM_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    UCM_bvalid : in STD_LOGIC;
    UCM_bready : out STD_LOGIC;
    UCM_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    UCM_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    UCM_arvalid : out STD_LOGIC;
    UCM_arready : in STD_LOGIC;
    UCM_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    UCM_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    UCM_rvalid : in STD_LOGIC;
    UCM_rready : out STD_LOGIC;
    DAQ_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DAQ_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DAQ_awvalid : out STD_LOGIC;
    DAQ_awready : in STD_LOGIC;
    DAQ_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DAQ_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DAQ_wvalid : out STD_LOGIC;
    DAQ_wready : in STD_LOGIC;
    DAQ_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DAQ_bvalid : in STD_LOGIC;
    DAQ_bready : out STD_LOGIC;
    DAQ_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DAQ_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DAQ_arvalid : out STD_LOGIC;
    DAQ_arready : in STD_LOGIC;
    DAQ_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    DAQ_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    DAQ_rvalid : in STD_LOGIC;
    DAQ_rready : out STD_LOGIC;
    MPL_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MPL_awvalid : out STD_LOGIC;
    MPL_awready : in STD_LOGIC;
    MPL_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    MPL_wvalid : out STD_LOGIC;
    MPL_wready : in STD_LOGIC;
    MPL_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MPL_bvalid : in STD_LOGIC;
    MPL_bready : out STD_LOGIC;
    MPL_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MPL_arvalid : out STD_LOGIC;
    MPL_arready : in STD_LOGIC;
    MPL_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    MPL_rvalid : in STD_LOGIC;
    MPL_rready : out STD_LOGIC;
    FM_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FM_awvalid : out STD_LOGIC;
    FM_awready : in STD_LOGIC;
    FM_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FM_wvalid : out STD_LOGIC;
    FM_wready : in STD_LOGIC;
    FM_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FM_bvalid : in STD_LOGIC;
    FM_bready : out STD_LOGIC;
    FM_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FM_arvalid : out STD_LOGIC;
    FM_arready : in STD_LOGIC;
    FM_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FM_rvalid : in STD_LOGIC;
    FM_rready : out STD_LOGIC;
    HPS_INN_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_INN_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_INN_awvalid : out STD_LOGIC;
    HPS_INN_awready : in STD_LOGIC;
    HPS_INN_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_INN_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HPS_INN_wvalid : out STD_LOGIC;
    HPS_INN_wready : in STD_LOGIC;
    HPS_INN_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_INN_bvalid : in STD_LOGIC;
    HPS_INN_bready : out STD_LOGIC;
    HPS_INN_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_INN_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_INN_arvalid : out STD_LOGIC;
    HPS_INN_arready : in STD_LOGIC;
    HPS_INN_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_INN_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_INN_rvalid : in STD_LOGIC;
    HPS_INN_rready : out STD_LOGIC;
    TAR_INN_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_INN_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_INN_awvalid : out STD_LOGIC;
    TAR_INN_awready : in STD_LOGIC;
    TAR_INN_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_INN_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TAR_INN_wvalid : out STD_LOGIC;
    TAR_INN_wready : in STD_LOGIC;
    TAR_INN_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_INN_bvalid : in STD_LOGIC;
    TAR_INN_bready : out STD_LOGIC;
    TAR_INN_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_INN_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_INN_arvalid : out STD_LOGIC;
    TAR_INN_arready : in STD_LOGIC;
    TAR_INN_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_INN_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_INN_rvalid : in STD_LOGIC;
    TAR_INN_rready : out STD_LOGIC;
    HPS_MID_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_MID_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_MID_awvalid : out STD_LOGIC;
    HPS_MID_awready : in STD_LOGIC;
    HPS_MID_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_MID_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HPS_MID_wvalid : out STD_LOGIC;
    HPS_MID_wready : in STD_LOGIC;
    HPS_MID_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_MID_bvalid : in STD_LOGIC;
    HPS_MID_bready : out STD_LOGIC;
    HPS_MID_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_MID_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_MID_arvalid : out STD_LOGIC;
    HPS_MID_arready : in STD_LOGIC;
    HPS_MID_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_MID_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_MID_rvalid : in STD_LOGIC;
    HPS_MID_rready : out STD_LOGIC;
    TAR_MID_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_MID_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_MID_awvalid : out STD_LOGIC;
    TAR_MID_awready : in STD_LOGIC;
    TAR_MID_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_MID_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TAR_MID_wvalid : out STD_LOGIC;
    TAR_MID_wready : in STD_LOGIC;
    TAR_MID_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_MID_bvalid : in STD_LOGIC;
    TAR_MID_bready : out STD_LOGIC;
    TAR_MID_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_MID_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_MID_arvalid : out STD_LOGIC;
    TAR_MID_arready : in STD_LOGIC;
    TAR_MID_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_MID_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_MID_rvalid : in STD_LOGIC;
    TAR_MID_rready : out STD_LOGIC;
    HPS_OUT_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_OUT_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_OUT_awvalid : out STD_LOGIC;
    HPS_OUT_awready : in STD_LOGIC;
    HPS_OUT_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_OUT_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HPS_OUT_wvalid : out STD_LOGIC;
    HPS_OUT_wready : in STD_LOGIC;
    HPS_OUT_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_OUT_bvalid : in STD_LOGIC;
    HPS_OUT_bready : out STD_LOGIC;
    HPS_OUT_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_OUT_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HPS_OUT_arvalid : out STD_LOGIC;
    HPS_OUT_arready : in STD_LOGIC;
    HPS_OUT_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HPS_OUT_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HPS_OUT_rvalid : in STD_LOGIC;
    HPS_OUT_rready : out STD_LOGIC;
    TAR_OUT_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_OUT_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_OUT_awvalid : out STD_LOGIC;
    TAR_OUT_awready : in STD_LOGIC;
    TAR_OUT_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_OUT_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TAR_OUT_wvalid : out STD_LOGIC;
    TAR_OUT_wready : in STD_LOGIC;
    TAR_OUT_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_OUT_bvalid : in STD_LOGIC;
    TAR_OUT_bready : out STD_LOGIC;
    TAR_OUT_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_OUT_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_OUT_arvalid : out STD_LOGIC;
    TAR_OUT_arready : in STD_LOGIC;
    TAR_OUT_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_OUT_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_OUT_rvalid : in STD_LOGIC;
    TAR_OUT_rready : out STD_LOGIC
  );
  end component c2cSlave;
begin
c2cSlave_i: component c2cSlave
     port map (
      AXI_CLK => AXI_CLK,
      AXI_RST_N(0) => AXI_RST_N(0),
      C2C_INTFS_araddr(31 downto 0) => C2C_INTFS_araddr(31 downto 0),
      C2C_INTFS_arprot(2 downto 0) => C2C_INTFS_arprot(2 downto 0),
      C2C_INTFS_arready(0) => C2C_INTFS_arready(0),
      C2C_INTFS_arvalid(0) => C2C_INTFS_arvalid(0),
      C2C_INTFS_awaddr(31 downto 0) => C2C_INTFS_awaddr(31 downto 0),
      C2C_INTFS_awprot(2 downto 0) => C2C_INTFS_awprot(2 downto 0),
      C2C_INTFS_awready(0) => C2C_INTFS_awready(0),
      C2C_INTFS_awvalid(0) => C2C_INTFS_awvalid(0),
      C2C_INTFS_bready(0) => C2C_INTFS_bready(0),
      C2C_INTFS_bresp(1 downto 0) => C2C_INTFS_bresp(1 downto 0),
      C2C_INTFS_bvalid(0) => C2C_INTFS_bvalid(0),
      C2C_INTFS_rdata(31 downto 0) => C2C_INTFS_rdata(31 downto 0),
      C2C_INTFS_rready(0) => C2C_INTFS_rready(0),
      C2C_INTFS_rresp(1 downto 0) => C2C_INTFS_rresp(1 downto 0),
      C2C_INTFS_rvalid(0) => C2C_INTFS_rvalid(0),
      C2C_INTFS_wdata(31 downto 0) => C2C_INTFS_wdata(31 downto 0),
      C2C_INTFS_wready(0) => C2C_INTFS_wready(0),
      C2C_INTFS_wstrb(3 downto 0) => C2C_INTFS_wstrb(3 downto 0),
      C2C_INTFS_wvalid(0) => C2C_INTFS_wvalid(0),
      CM1_PB_UART_rxd => CM1_PB_UART_rxd,
      CM1_PB_UART_txd => CM1_PB_UART_txd,
      DAQ_araddr(31 downto 0) => DAQ_araddr(31 downto 0),
      DAQ_arprot(2 downto 0) => DAQ_arprot(2 downto 0),
      DAQ_arready => DAQ_arready,
      DAQ_arvalid => DAQ_arvalid,
      DAQ_awaddr(31 downto 0) => DAQ_awaddr(31 downto 0),
      DAQ_awprot(2 downto 0) => DAQ_awprot(2 downto 0),
      DAQ_awready => DAQ_awready,
      DAQ_awvalid => DAQ_awvalid,
      DAQ_bready => DAQ_bready,
      DAQ_bresp(1 downto 0) => DAQ_bresp(1 downto 0),
      DAQ_bvalid => DAQ_bvalid,
      DAQ_rdata(31 downto 0) => DAQ_rdata(31 downto 0),
      DAQ_rready => DAQ_rready,
      DAQ_rresp(1 downto 0) => DAQ_rresp(1 downto 0),
      DAQ_rvalid => DAQ_rvalid,
      DAQ_wdata(31 downto 0) => DAQ_wdata(31 downto 0),
      DAQ_wready => DAQ_wready,
      DAQ_wstrb(3 downto 0) => DAQ_wstrb(3 downto 0),
      DAQ_wvalid => DAQ_wvalid,
      FM_araddr(31 downto 0) => FM_araddr(31 downto 0),
      FM_arprot(2 downto 0) => FM_arprot(2 downto 0),
      FM_arready => FM_arready,
      FM_arvalid => FM_arvalid,
      FM_awaddr(31 downto 0) => FM_awaddr(31 downto 0),
      FM_awprot(2 downto 0) => FM_awprot(2 downto 0),
      FM_awready => FM_awready,
      FM_awvalid => FM_awvalid,
      FM_bready => FM_bready,
      FM_bresp(1 downto 0) => FM_bresp(1 downto 0),
      FM_bvalid => FM_bvalid,
      FM_rdata(31 downto 0) => FM_rdata(31 downto 0),
      FM_rready => FM_rready,
      FM_rresp(1 downto 0) => FM_rresp(1 downto 0),
      FM_rvalid => FM_rvalid,
      FM_wdata(31 downto 0) => FM_wdata(31 downto 0),
      FM_wready => FM_wready,
      FM_wstrb(3 downto 0) => FM_wstrb(3 downto 0),
      FM_wvalid => FM_wvalid,
      FW_INFO_araddr(31 downto 0) => FW_INFO_araddr(31 downto 0),
      FW_INFO_arprot(2 downto 0) => FW_INFO_arprot(2 downto 0),
      FW_INFO_arready(0) => FW_INFO_arready(0),
      FW_INFO_arvalid(0) => FW_INFO_arvalid(0),
      FW_INFO_awaddr(31 downto 0) => FW_INFO_awaddr(31 downto 0),
      FW_INFO_awprot(2 downto 0) => FW_INFO_awprot(2 downto 0),
      FW_INFO_awready(0) => FW_INFO_awready(0),
      FW_INFO_awvalid(0) => FW_INFO_awvalid(0),
      FW_INFO_bready(0) => FW_INFO_bready(0),
      FW_INFO_bresp(1 downto 0) => FW_INFO_bresp(1 downto 0),
      FW_INFO_bvalid(0) => FW_INFO_bvalid(0),
      FW_INFO_rdata(31 downto 0) => FW_INFO_rdata(31 downto 0),
      FW_INFO_rready(0) => FW_INFO_rready(0),
      FW_INFO_rresp(1 downto 0) => FW_INFO_rresp(1 downto 0),
      FW_INFO_rvalid(0) => FW_INFO_rvalid(0),
      FW_INFO_wdata(31 downto 0) => FW_INFO_wdata(31 downto 0),
      FW_INFO_wready(0) => FW_INFO_wready(0),
      FW_INFO_wstrb(3 downto 0) => FW_INFO_wstrb(3 downto 0),
      FW_INFO_wvalid(0) => FW_INFO_wvalid(0),
      HAL_araddr(31 downto 0) => HAL_araddr(31 downto 0),
      HAL_arprot(2 downto 0) => HAL_arprot(2 downto 0),
      HAL_arready => HAL_arready,
      HAL_arvalid => HAL_arvalid,
      HAL_awaddr(31 downto 0) => HAL_awaddr(31 downto 0),
      HAL_awprot(2 downto 0) => HAL_awprot(2 downto 0),
      HAL_awready => HAL_awready,
      HAL_awvalid => HAL_awvalid,
      HAL_bready => HAL_bready,
      HAL_bresp(1 downto 0) => HAL_bresp(1 downto 0),
      HAL_bvalid => HAL_bvalid,
      HAL_rdata(31 downto 0) => HAL_rdata(31 downto 0),
      HAL_rready => HAL_rready,
      HAL_rresp(1 downto 0) => HAL_rresp(1 downto 0),
      HAL_rvalid => HAL_rvalid,
      HAL_wdata(31 downto 0) => HAL_wdata(31 downto 0),
      HAL_wready => HAL_wready,
      HAL_wstrb(3 downto 0) => HAL_wstrb(3 downto 0),
      HAL_wvalid => HAL_wvalid,
      HOG_araddr(31 downto 0) => HOG_araddr(31 downto 0),
      HOG_arprot(2 downto 0) => HOG_arprot(2 downto 0),
      HOG_arready(0) => HOG_arready(0),
      HOG_arvalid(0) => HOG_arvalid(0),
      HOG_awaddr(31 downto 0) => HOG_awaddr(31 downto 0),
      HOG_awprot(2 downto 0) => HOG_awprot(2 downto 0),
      HOG_awready(0) => HOG_awready(0),
      HOG_awvalid(0) => HOG_awvalid(0),
      HOG_bready(0) => HOG_bready(0),
      HOG_bresp(1 downto 0) => HOG_bresp(1 downto 0),
      HOG_bvalid(0) => HOG_bvalid(0),
      HOG_rdata(31 downto 0) => HOG_rdata(31 downto 0),
      HOG_rready(0) => HOG_rready(0),
      HOG_rresp(1 downto 0) => HOG_rresp(1 downto 0),
      HOG_rvalid(0) => HOG_rvalid(0),
      HOG_wdata(31 downto 0) => HOG_wdata(31 downto 0),
      HOG_wready(0) => HOG_wready(0),
      HOG_wstrb(3 downto 0) => HOG_wstrb(3 downto 0),
      HOG_wvalid(0) => HOG_wvalid(0),
      HPS_INN_araddr(31 downto 0) => HPS_INN_araddr(31 downto 0),
      HPS_INN_arprot(2 downto 0) => HPS_INN_arprot(2 downto 0),
      HPS_INN_arready => HPS_INN_arready,
      HPS_INN_arvalid => HPS_INN_arvalid,
      HPS_INN_awaddr(31 downto 0) => HPS_INN_awaddr(31 downto 0),
      HPS_INN_awprot(2 downto 0) => HPS_INN_awprot(2 downto 0),
      HPS_INN_awready => HPS_INN_awready,
      HPS_INN_awvalid => HPS_INN_awvalid,
      HPS_INN_bready => HPS_INN_bready,
      HPS_INN_bresp(1 downto 0) => HPS_INN_bresp(1 downto 0),
      HPS_INN_bvalid => HPS_INN_bvalid,
      HPS_INN_rdata(31 downto 0) => HPS_INN_rdata(31 downto 0),
      HPS_INN_rready => HPS_INN_rready,
      HPS_INN_rresp(1 downto 0) => HPS_INN_rresp(1 downto 0),
      HPS_INN_rvalid => HPS_INN_rvalid,
      HPS_INN_wdata(31 downto 0) => HPS_INN_wdata(31 downto 0),
      HPS_INN_wready => HPS_INN_wready,
      HPS_INN_wstrb(3 downto 0) => HPS_INN_wstrb(3 downto 0),
      HPS_INN_wvalid => HPS_INN_wvalid,
      HPS_MID_araddr(31 downto 0) => HPS_MID_araddr(31 downto 0),
      HPS_MID_arprot(2 downto 0) => HPS_MID_arprot(2 downto 0),
      HPS_MID_arready => HPS_MID_arready,
      HPS_MID_arvalid => HPS_MID_arvalid,
      HPS_MID_awaddr(31 downto 0) => HPS_MID_awaddr(31 downto 0),
      HPS_MID_awprot(2 downto 0) => HPS_MID_awprot(2 downto 0),
      HPS_MID_awready => HPS_MID_awready,
      HPS_MID_awvalid => HPS_MID_awvalid,
      HPS_MID_bready => HPS_MID_bready,
      HPS_MID_bresp(1 downto 0) => HPS_MID_bresp(1 downto 0),
      HPS_MID_bvalid => HPS_MID_bvalid,
      HPS_MID_rdata(31 downto 0) => HPS_MID_rdata(31 downto 0),
      HPS_MID_rready => HPS_MID_rready,
      HPS_MID_rresp(1 downto 0) => HPS_MID_rresp(1 downto 0),
      HPS_MID_rvalid => HPS_MID_rvalid,
      HPS_MID_wdata(31 downto 0) => HPS_MID_wdata(31 downto 0),
      HPS_MID_wready => HPS_MID_wready,
      HPS_MID_wstrb(3 downto 0) => HPS_MID_wstrb(3 downto 0),
      HPS_MID_wvalid => HPS_MID_wvalid,
      HPS_OUT_araddr(31 downto 0) => HPS_OUT_araddr(31 downto 0),
      HPS_OUT_arprot(2 downto 0) => HPS_OUT_arprot(2 downto 0),
      HPS_OUT_arready => HPS_OUT_arready,
      HPS_OUT_arvalid => HPS_OUT_arvalid,
      HPS_OUT_awaddr(31 downto 0) => HPS_OUT_awaddr(31 downto 0),
      HPS_OUT_awprot(2 downto 0) => HPS_OUT_awprot(2 downto 0),
      HPS_OUT_awready => HPS_OUT_awready,
      HPS_OUT_awvalid => HPS_OUT_awvalid,
      HPS_OUT_bready => HPS_OUT_bready,
      HPS_OUT_bresp(1 downto 0) => HPS_OUT_bresp(1 downto 0),
      HPS_OUT_bvalid => HPS_OUT_bvalid,
      HPS_OUT_rdata(31 downto 0) => HPS_OUT_rdata(31 downto 0),
      HPS_OUT_rready => HPS_OUT_rready,
      HPS_OUT_rresp(1 downto 0) => HPS_OUT_rresp(1 downto 0),
      HPS_OUT_rvalid => HPS_OUT_rvalid,
      HPS_OUT_wdata(31 downto 0) => HPS_OUT_wdata(31 downto 0),
      HPS_OUT_wready => HPS_OUT_wready,
      HPS_OUT_wstrb(3 downto 0) => HPS_OUT_wstrb(3 downto 0),
      HPS_OUT_wvalid => HPS_OUT_wvalid,
      KINTEX_SYS_MGMT_alarm => KINTEX_SYS_MGMT_alarm,
      KINTEX_SYS_MGMT_overtemp_alarm => KINTEX_SYS_MGMT_overtemp_alarm,
      KINTEX_SYS_MGMT_vccaux_alarm => KINTEX_SYS_MGMT_vccaux_alarm,
      KINTEX_SYS_MGMT_vccint_alarm => KINTEX_SYS_MGMT_vccint_alarm,
      K_C2CB_PHY_DEBUG_cplllock(0) => K_C2CB_PHY_DEBUG_cplllock(0),
      K_C2CB_PHY_DEBUG_dmonitorout(15 downto 0) => K_C2CB_PHY_DEBUG_dmonitorout(15 downto 0),
      K_C2CB_PHY_DEBUG_eyescandataerror(0) => K_C2CB_PHY_DEBUG_eyescandataerror(0),
      K_C2CB_PHY_DEBUG_eyescanreset(0) => K_C2CB_PHY_DEBUG_eyescanreset(0),
      K_C2CB_PHY_DEBUG_eyescantrigger(0) => K_C2CB_PHY_DEBUG_eyescantrigger(0),
      K_C2CB_PHY_DEBUG_pcsrsvdin(15 downto 0) => K_C2CB_PHY_DEBUG_pcsrsvdin(15 downto 0),
      K_C2CB_PHY_DEBUG_qplllock(0) => K_C2CB_PHY_DEBUG_qplllock(0),
      K_C2CB_PHY_DEBUG_rxbufreset(0) => K_C2CB_PHY_DEBUG_rxbufreset(0),
      K_C2CB_PHY_DEBUG_rxbufstatus(2 downto 0) => K_C2CB_PHY_DEBUG_rxbufstatus(2 downto 0),
      K_C2CB_PHY_DEBUG_rxcdrhold(0) => K_C2CB_PHY_DEBUG_rxcdrhold(0),
      K_C2CB_PHY_DEBUG_rxdfelpmreset(0) => K_C2CB_PHY_DEBUG_rxdfelpmreset(0),
      K_C2CB_PHY_DEBUG_rxlpmen(0) => K_C2CB_PHY_DEBUG_rxlpmen(0),
      K_C2CB_PHY_DEBUG_rxpcsreset(0) => K_C2CB_PHY_DEBUG_rxpcsreset(0),
      K_C2CB_PHY_DEBUG_rxpmareset(0) => K_C2CB_PHY_DEBUG_rxpmareset(0),
      K_C2CB_PHY_DEBUG_rxpmaresetdone(0) => K_C2CB_PHY_DEBUG_rxpmaresetdone(0),
      K_C2CB_PHY_DEBUG_rxprbscntreset(0) => K_C2CB_PHY_DEBUG_rxprbscntreset(0),
      K_C2CB_PHY_DEBUG_rxprbserr(0) => K_C2CB_PHY_DEBUG_rxprbserr(0),
      K_C2CB_PHY_DEBUG_rxprbssel(3 downto 0) => K_C2CB_PHY_DEBUG_rxprbssel(3 downto 0),
      K_C2CB_PHY_DEBUG_rxrate(2 downto 0) => K_C2CB_PHY_DEBUG_rxrate(2 downto 0),
      K_C2CB_PHY_DEBUG_rxresetdone(0) => K_C2CB_PHY_DEBUG_rxresetdone(0),
      K_C2CB_PHY_DEBUG_txbufstatus(1 downto 0) => K_C2CB_PHY_DEBUG_txbufstatus(1 downto 0),
      K_C2CB_PHY_DEBUG_txdiffctrl(4 downto 0) => K_C2CB_PHY_DEBUG_txdiffctrl(4 downto 0),
      K_C2CB_PHY_DEBUG_txinhibit(0) => K_C2CB_PHY_DEBUG_txinhibit(0),
      K_C2CB_PHY_DEBUG_txpcsreset(0) => K_C2CB_PHY_DEBUG_txpcsreset(0),
      K_C2CB_PHY_DEBUG_txpmareset(0) => K_C2CB_PHY_DEBUG_txpmareset(0),
      K_C2CB_PHY_DEBUG_txpolarity(0) => K_C2CB_PHY_DEBUG_txpolarity(0),
      K_C2CB_PHY_DEBUG_txpostcursor(4 downto 0) => K_C2CB_PHY_DEBUG_txpostcursor(4 downto 0),
      K_C2CB_PHY_DEBUG_txprbsforceerr(0) => K_C2CB_PHY_DEBUG_txprbsforceerr(0),
      K_C2CB_PHY_DEBUG_txprbssel(3 downto 0) => K_C2CB_PHY_DEBUG_txprbssel(3 downto 0),
      K_C2CB_PHY_DEBUG_txprecursor(4 downto 0) => K_C2CB_PHY_DEBUG_txprecursor(4 downto 0),
      K_C2CB_PHY_DEBUG_txresetdone(0) => K_C2CB_PHY_DEBUG_txresetdone(0),
      K_C2CB_PHY_DRP_daddr(9 downto 0) => K_C2CB_PHY_DRP_daddr(9 downto 0),
      K_C2CB_PHY_DRP_den => K_C2CB_PHY_DRP_den,
      K_C2CB_PHY_DRP_di(15 downto 0) => K_C2CB_PHY_DRP_di(15 downto 0),
      K_C2CB_PHY_DRP_do(15 downto 0) => K_C2CB_PHY_DRP_do(15 downto 0),
      K_C2CB_PHY_DRP_drdy => K_C2CB_PHY_DRP_drdy,
      K_C2CB_PHY_DRP_dwe => K_C2CB_PHY_DRP_dwe,
      K_C2CB_PHY_Rx_rxn(0) => K_C2CB_PHY_Rx_rxn(0),
      K_C2CB_PHY_Rx_rxp(0) => K_C2CB_PHY_Rx_rxp(0),
      K_C2CB_PHY_Tx_txn(0) => K_C2CB_PHY_Tx_txn(0),
      K_C2CB_PHY_Tx_txp(0) => K_C2CB_PHY_Tx_txp(0),
      K_C2CB_PHY_channel_up => K_C2CB_PHY_channel_up,
      K_C2CB_PHY_gt_pll_lock => K_C2CB_PHY_gt_pll_lock,
      K_C2CB_PHY_hard_err => K_C2CB_PHY_hard_err,
      K_C2CB_PHY_lane_up(0) => K_C2CB_PHY_lane_up(0),
      K_C2CB_PHY_link_reset_out => K_C2CB_PHY_link_reset_out,
      K_C2CB_PHY_power_down => K_C2CB_PHY_power_down,
      K_C2CB_PHY_soft_err => K_C2CB_PHY_soft_err,
      K_C2CB_aurora_do_cc => K_C2CB_aurora_do_cc,
      K_C2CB_aurora_pma_init_in => K_C2CB_aurora_pma_init_in,
      K_C2CB_axi_c2c_config_error_out => K_C2CB_axi_c2c_config_error_out,
      K_C2CB_axi_c2c_link_status_out => K_C2CB_axi_c2c_link_status_out,
      K_C2CB_axi_c2c_multi_bit_error_out => K_C2CB_axi_c2c_multi_bit_error_out,
      K_C2C_PHY_CLK => K_C2C_PHY_CLK,
      K_C2C_PHY_DEBUG_cplllock(0) => K_C2C_PHY_DEBUG_cplllock(0),
      K_C2C_PHY_DEBUG_dmonitorout(15 downto 0) => K_C2C_PHY_DEBUG_dmonitorout(15 downto 0),
      K_C2C_PHY_DEBUG_eyescandataerror(0) => K_C2C_PHY_DEBUG_eyescandataerror(0),
      K_C2C_PHY_DEBUG_eyescanreset(0) => K_C2C_PHY_DEBUG_eyescanreset(0),
      K_C2C_PHY_DEBUG_eyescantrigger(0) => K_C2C_PHY_DEBUG_eyescantrigger(0),
      K_C2C_PHY_DEBUG_pcsrsvdin(15 downto 0) => K_C2C_PHY_DEBUG_pcsrsvdin(15 downto 0),
      K_C2C_PHY_DEBUG_qplllock(0) => K_C2C_PHY_DEBUG_qplllock(0),
      K_C2C_PHY_DEBUG_rxbufreset(0) => K_C2C_PHY_DEBUG_rxbufreset(0),
      K_C2C_PHY_DEBUG_rxbufstatus(2 downto 0) => K_C2C_PHY_DEBUG_rxbufstatus(2 downto 0),
      K_C2C_PHY_DEBUG_rxcdrhold(0) => K_C2C_PHY_DEBUG_rxcdrhold(0),
      K_C2C_PHY_DEBUG_rxdfelpmreset(0) => K_C2C_PHY_DEBUG_rxdfelpmreset(0),
      K_C2C_PHY_DEBUG_rxlpmen(0) => K_C2C_PHY_DEBUG_rxlpmen(0),
      K_C2C_PHY_DEBUG_rxpcsreset(0) => K_C2C_PHY_DEBUG_rxpcsreset(0),
      K_C2C_PHY_DEBUG_rxpmareset(0) => K_C2C_PHY_DEBUG_rxpmareset(0),
      K_C2C_PHY_DEBUG_rxpmaresetdone(0) => K_C2C_PHY_DEBUG_rxpmaresetdone(0),
      K_C2C_PHY_DEBUG_rxprbscntreset(0) => K_C2C_PHY_DEBUG_rxprbscntreset(0),
      K_C2C_PHY_DEBUG_rxprbserr(0) => K_C2C_PHY_DEBUG_rxprbserr(0),
      K_C2C_PHY_DEBUG_rxprbssel(3 downto 0) => K_C2C_PHY_DEBUG_rxprbssel(3 downto 0),
      K_C2C_PHY_DEBUG_rxrate(2 downto 0) => K_C2C_PHY_DEBUG_rxrate(2 downto 0),
      K_C2C_PHY_DEBUG_rxresetdone(0) => K_C2C_PHY_DEBUG_rxresetdone(0),
      K_C2C_PHY_DEBUG_txbufstatus(1 downto 0) => K_C2C_PHY_DEBUG_txbufstatus(1 downto 0),
      K_C2C_PHY_DEBUG_txdiffctrl(4 downto 0) => K_C2C_PHY_DEBUG_txdiffctrl(4 downto 0),
      K_C2C_PHY_DEBUG_txinhibit(0) => K_C2C_PHY_DEBUG_txinhibit(0),
      K_C2C_PHY_DEBUG_txpcsreset(0) => K_C2C_PHY_DEBUG_txpcsreset(0),
      K_C2C_PHY_DEBUG_txpmareset(0) => K_C2C_PHY_DEBUG_txpmareset(0),
      K_C2C_PHY_DEBUG_txpolarity(0) => K_C2C_PHY_DEBUG_txpolarity(0),
      K_C2C_PHY_DEBUG_txpostcursor(4 downto 0) => K_C2C_PHY_DEBUG_txpostcursor(4 downto 0),
      K_C2C_PHY_DEBUG_txprbsforceerr(0) => K_C2C_PHY_DEBUG_txprbsforceerr(0),
      K_C2C_PHY_DEBUG_txprbssel(3 downto 0) => K_C2C_PHY_DEBUG_txprbssel(3 downto 0),
      K_C2C_PHY_DEBUG_txprecursor(4 downto 0) => K_C2C_PHY_DEBUG_txprecursor(4 downto 0),
      K_C2C_PHY_DEBUG_txresetdone(0) => K_C2C_PHY_DEBUG_txresetdone(0),
      K_C2C_PHY_DRP_daddr(9 downto 0) => K_C2C_PHY_DRP_daddr(9 downto 0),
      K_C2C_PHY_DRP_den => K_C2C_PHY_DRP_den,
      K_C2C_PHY_DRP_di(15 downto 0) => K_C2C_PHY_DRP_di(15 downto 0),
      K_C2C_PHY_DRP_do(15 downto 0) => K_C2C_PHY_DRP_do(15 downto 0),
      K_C2C_PHY_DRP_drdy => K_C2C_PHY_DRP_drdy,
      K_C2C_PHY_DRP_dwe => K_C2C_PHY_DRP_dwe,
      K_C2C_PHY_Rx_rxn(0) => K_C2C_PHY_Rx_rxn(0),
      K_C2C_PHY_Rx_rxp(0) => K_C2C_PHY_Rx_rxp(0),
      K_C2C_PHY_Tx_txn(0) => K_C2C_PHY_Tx_txn(0),
      K_C2C_PHY_Tx_txp(0) => K_C2C_PHY_Tx_txp(0),
      K_C2C_PHY_channel_up => K_C2C_PHY_channel_up,
      K_C2C_PHY_gt_pll_lock => K_C2C_PHY_gt_pll_lock,
      K_C2C_PHY_gt_refclk1_out => K_C2C_PHY_gt_refclk1_out,
      K_C2C_PHY_hard_err => K_C2C_PHY_hard_err,
      K_C2C_PHY_lane_up(0) => K_C2C_PHY_lane_up(0),
      K_C2C_PHY_link_reset_out => K_C2C_PHY_link_reset_out,
      K_C2C_PHY_mmcm_not_locked_out => K_C2C_PHY_mmcm_not_locked_out,
      K_C2C_PHY_power_down => K_C2C_PHY_power_down,
      K_C2C_PHY_refclk_clk_n => K_C2C_PHY_refclk_clk_n,
      K_C2C_PHY_refclk_clk_p => K_C2C_PHY_refclk_clk_p,
      K_C2C_PHY_soft_err => K_C2C_PHY_soft_err,
      K_C2C_aurora_do_cc => K_C2C_aurora_do_cc,
      K_C2C_aurora_pma_init_in => K_C2C_aurora_pma_init_in,
      K_C2C_axi_c2c_config_error_out => K_C2C_axi_c2c_config_error_out,
      K_C2C_axi_c2c_link_status_out => K_C2C_axi_c2c_link_status_out,
      K_C2C_axi_c2c_multi_bit_error_out => K_C2C_axi_c2c_multi_bit_error_out,
      MPL_araddr(31 downto 0) => MPL_araddr(31 downto 0),
      MPL_arprot(2 downto 0) => MPL_arprot(2 downto 0),
      MPL_arready => MPL_arready,
      MPL_arvalid => MPL_arvalid,
      MPL_awaddr(31 downto 0) => MPL_awaddr(31 downto 0),
      MPL_awprot(2 downto 0) => MPL_awprot(2 downto 0),
      MPL_awready => MPL_awready,
      MPL_awvalid => MPL_awvalid,
      MPL_bready => MPL_bready,
      MPL_bresp(1 downto 0) => MPL_bresp(1 downto 0),
      MPL_bvalid => MPL_bvalid,
      MPL_rdata(31 downto 0) => MPL_rdata(31 downto 0),
      MPL_rready => MPL_rready,
      MPL_rresp(1 downto 0) => MPL_rresp(1 downto 0),
      MPL_rvalid => MPL_rvalid,
      MPL_wdata(31 downto 0) => MPL_wdata(31 downto 0),
      MPL_wready => MPL_wready,
      MPL_wstrb(3 downto 0) => MPL_wstrb(3 downto 0),
      MPL_wvalid => MPL_wvalid,
      MTC_araddr(31 downto 0) => MTC_araddr(31 downto 0),
      MTC_arprot(2 downto 0) => MTC_arprot(2 downto 0),
      MTC_arready => MTC_arready,
      MTC_arvalid => MTC_arvalid,
      MTC_awaddr(31 downto 0) => MTC_awaddr(31 downto 0),
      MTC_awprot(2 downto 0) => MTC_awprot(2 downto 0),
      MTC_awready => MTC_awready,
      MTC_awvalid => MTC_awvalid,
      MTC_bready => MTC_bready,
      MTC_bresp(1 downto 0) => MTC_bresp(1 downto 0),
      MTC_bvalid => MTC_bvalid,
      MTC_rdata(31 downto 0) => MTC_rdata(31 downto 0),
      MTC_rready => MTC_rready,
      MTC_rresp(1 downto 0) => MTC_rresp(1 downto 0),
      MTC_rvalid => MTC_rvalid,
      MTC_wdata(31 downto 0) => MTC_wdata(31 downto 0),
      MTC_wready => MTC_wready,
      MTC_wstrb(3 downto 0) => MTC_wstrb(3 downto 0),
      MTC_wvalid => MTC_wvalid,
      TAR_INN_araddr(31 downto 0) => TAR_INN_araddr(31 downto 0),
      TAR_INN_arprot(2 downto 0) => TAR_INN_arprot(2 downto 0),
      TAR_INN_arready => TAR_INN_arready,
      TAR_INN_arvalid => TAR_INN_arvalid,
      TAR_INN_awaddr(31 downto 0) => TAR_INN_awaddr(31 downto 0),
      TAR_INN_awprot(2 downto 0) => TAR_INN_awprot(2 downto 0),
      TAR_INN_awready => TAR_INN_awready,
      TAR_INN_awvalid => TAR_INN_awvalid,
      TAR_INN_bready => TAR_INN_bready,
      TAR_INN_bresp(1 downto 0) => TAR_INN_bresp(1 downto 0),
      TAR_INN_bvalid => TAR_INN_bvalid,
      TAR_INN_rdata(31 downto 0) => TAR_INN_rdata(31 downto 0),
      TAR_INN_rready => TAR_INN_rready,
      TAR_INN_rresp(1 downto 0) => TAR_INN_rresp(1 downto 0),
      TAR_INN_rvalid => TAR_INN_rvalid,
      TAR_INN_wdata(31 downto 0) => TAR_INN_wdata(31 downto 0),
      TAR_INN_wready => TAR_INN_wready,
      TAR_INN_wstrb(3 downto 0) => TAR_INN_wstrb(3 downto 0),
      TAR_INN_wvalid => TAR_INN_wvalid,
      TAR_MID_araddr(31 downto 0) => TAR_MID_araddr(31 downto 0),
      TAR_MID_arprot(2 downto 0) => TAR_MID_arprot(2 downto 0),
      TAR_MID_arready => TAR_MID_arready,
      TAR_MID_arvalid => TAR_MID_arvalid,
      TAR_MID_awaddr(31 downto 0) => TAR_MID_awaddr(31 downto 0),
      TAR_MID_awprot(2 downto 0) => TAR_MID_awprot(2 downto 0),
      TAR_MID_awready => TAR_MID_awready,
      TAR_MID_awvalid => TAR_MID_awvalid,
      TAR_MID_bready => TAR_MID_bready,
      TAR_MID_bresp(1 downto 0) => TAR_MID_bresp(1 downto 0),
      TAR_MID_bvalid => TAR_MID_bvalid,
      TAR_MID_rdata(31 downto 0) => TAR_MID_rdata(31 downto 0),
      TAR_MID_rready => TAR_MID_rready,
      TAR_MID_rresp(1 downto 0) => TAR_MID_rresp(1 downto 0),
      TAR_MID_rvalid => TAR_MID_rvalid,
      TAR_MID_wdata(31 downto 0) => TAR_MID_wdata(31 downto 0),
      TAR_MID_wready => TAR_MID_wready,
      TAR_MID_wstrb(3 downto 0) => TAR_MID_wstrb(3 downto 0),
      TAR_MID_wvalid => TAR_MID_wvalid,
      TAR_OUT_araddr(31 downto 0) => TAR_OUT_araddr(31 downto 0),
      TAR_OUT_arprot(2 downto 0) => TAR_OUT_arprot(2 downto 0),
      TAR_OUT_arready => TAR_OUT_arready,
      TAR_OUT_arvalid => TAR_OUT_arvalid,
      TAR_OUT_awaddr(31 downto 0) => TAR_OUT_awaddr(31 downto 0),
      TAR_OUT_awprot(2 downto 0) => TAR_OUT_awprot(2 downto 0),
      TAR_OUT_awready => TAR_OUT_awready,
      TAR_OUT_awvalid => TAR_OUT_awvalid,
      TAR_OUT_bready => TAR_OUT_bready,
      TAR_OUT_bresp(1 downto 0) => TAR_OUT_bresp(1 downto 0),
      TAR_OUT_bvalid => TAR_OUT_bvalid,
      TAR_OUT_rdata(31 downto 0) => TAR_OUT_rdata(31 downto 0),
      TAR_OUT_rready => TAR_OUT_rready,
      TAR_OUT_rresp(1 downto 0) => TAR_OUT_rresp(1 downto 0),
      TAR_OUT_rvalid => TAR_OUT_rvalid,
      TAR_OUT_wdata(31 downto 0) => TAR_OUT_wdata(31 downto 0),
      TAR_OUT_wready => TAR_OUT_wready,
      TAR_OUT_wstrb(3 downto 0) => TAR_OUT_wstrb(3 downto 0),
      TAR_OUT_wvalid => TAR_OUT_wvalid,
      TF_araddr(31 downto 0) => TF_araddr(31 downto 0),
      TF_arprot(2 downto 0) => TF_arprot(2 downto 0),
      TF_arready => TF_arready,
      TF_arvalid => TF_arvalid,
      TF_awaddr(31 downto 0) => TF_awaddr(31 downto 0),
      TF_awprot(2 downto 0) => TF_awprot(2 downto 0),
      TF_awready => TF_awready,
      TF_awvalid => TF_awvalid,
      TF_bready => TF_bready,
      TF_bresp(1 downto 0) => TF_bresp(1 downto 0),
      TF_bvalid => TF_bvalid,
      TF_rdata(31 downto 0) => TF_rdata(31 downto 0),
      TF_rready => TF_rready,
      TF_rresp(1 downto 0) => TF_rresp(1 downto 0),
      TF_rvalid => TF_rvalid,
      TF_wdata(31 downto 0) => TF_wdata(31 downto 0),
      TF_wready => TF_wready,
      TF_wstrb(3 downto 0) => TF_wstrb(3 downto 0),
      TF_wvalid => TF_wvalid,
      UCM_araddr(31 downto 0) => UCM_araddr(31 downto 0),
      UCM_arprot(2 downto 0) => UCM_arprot(2 downto 0),
      UCM_arready => UCM_arready,
      UCM_arvalid => UCM_arvalid,
      UCM_awaddr(31 downto 0) => UCM_awaddr(31 downto 0),
      UCM_awprot(2 downto 0) => UCM_awprot(2 downto 0),
      UCM_awready => UCM_awready,
      UCM_awvalid => UCM_awvalid,
      UCM_bready => UCM_bready,
      UCM_bresp(1 downto 0) => UCM_bresp(1 downto 0),
      UCM_bvalid => UCM_bvalid,
      UCM_rdata(31 downto 0) => UCM_rdata(31 downto 0),
      UCM_rready => UCM_rready,
      UCM_rresp(1 downto 0) => UCM_rresp(1 downto 0),
      UCM_rvalid => UCM_rvalid,
      UCM_wdata(31 downto 0) => UCM_wdata(31 downto 0),
      UCM_wready => UCM_wready,
      UCM_wstrb(3 downto 0) => UCM_wstrb(3 downto 0),
      UCM_wvalid => UCM_wvalid,
      clk40 => clk40,
      clk50Mhz => clk50Mhz,
      reset_n => reset_n
    );
end STRUCTURE;
