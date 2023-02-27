--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Mon Feb 27 09:26:58 2023
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
    FM_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FM_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FM_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FM_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FM_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    FM_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FM_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    FM_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FM_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FM_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
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
    HAL_CORE_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_CORE_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_CORE_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_CORE_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_CORE_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HAL_CORE_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HAL_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
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
    K_C2C_PHY_gt_refclk1_out : out STD_LOGIC;
    K_C2C_PHY_power_down : in STD_LOGIC;
    K_C2C_PHY_gt_pll_lock : out STD_LOGIC;
    K_C2C_PHY_hard_err : out STD_LOGIC;
    K_C2C_PHY_soft_err : out STD_LOGIC;
    K_C2C_PHY_lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_mmcm_not_locked_out : out STD_LOGIC;
    K_C2C_PHY_link_reset_out : out STD_LOGIC;
    K_C2C_PHY_channel_up : out STD_LOGIC;
    K_C2C_PHY_CLK : out STD_LOGIC;
    K_C2CB_aurora_pma_init_in : in STD_LOGIC;
    K_C2CB_aurora_do_cc : out STD_LOGIC;
    K_C2CB_axi_c2c_config_error_out : out STD_LOGIC;
    K_C2CB_axi_c2c_link_status_out : out STD_LOGIC;
    K_C2CB_axi_c2c_multi_bit_error_out : out STD_LOGIC;
    K_C2CB_PHY_power_down : in STD_LOGIC;
    K_C2CB_PHY_gt_pll_lock : out STD_LOGIC;
    K_C2CB_PHY_hard_err : out STD_LOGIC;
    K_C2CB_PHY_soft_err : out STD_LOGIC;
    K_C2CB_PHY_lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_link_reset_out : out STD_LOGIC;
    K_C2CB_PHY_channel_up : out STD_LOGIC;
    KINTEX_SYS_MGMT_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccint_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccaux_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_overtemp_alarm : out STD_LOGIC;
    HAL_CORE_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_CORE_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HAL_CORE_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_CORE_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_CORE_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_CORE_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_Tx_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_Tx_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
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
    K_C2C_PHY_Rx_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_Rx_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_Tx_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2C_PHY_Tx_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    CM1_PB_UART_rxd : in STD_LOGIC;
    CM1_PB_UART_txd : out STD_LOGIC;
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
    K_C2CB_PHY_DRP_daddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    K_C2CB_PHY_DRP_den : in STD_LOGIC;
    K_C2CB_PHY_DRP_di : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DRP_do : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DRP_drdy : out STD_LOGIC;
    K_C2CB_PHY_DRP_dwe : in STD_LOGIC;
    K_C2CB_PHY_Rx_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CB_PHY_Rx_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FM_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FM_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FM_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FM_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FM_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    FM_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FM_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    FM_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FM_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FM_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    FM_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_awvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_awready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HAL_wvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_wready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_bvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_bready : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_arvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_arready : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_rvalid : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_rready : out STD_LOGIC_VECTOR ( 0 to 0 );
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
    K_C2C_PHY_DRP_daddr : in STD_LOGIC_VECTOR ( 9 downto 0 );
    K_C2C_PHY_DRP_den : in STD_LOGIC;
    K_C2C_PHY_DRP_di : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DRP_do : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DRP_drdy : out STD_LOGIC;
    K_C2C_PHY_DRP_dwe : in STD_LOGIC;
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
    K_C2C_PHY_refclk_clk_n : in STD_LOGIC;
    K_C2C_PHY_refclk_clk_p : in STD_LOGIC
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
      FM_araddr(31 downto 0) => FM_araddr(31 downto 0),
      FM_arprot(2 downto 0) => FM_arprot(2 downto 0),
      FM_arready(0) => FM_arready(0),
      FM_arvalid(0) => FM_arvalid(0),
      FM_awaddr(31 downto 0) => FM_awaddr(31 downto 0),
      FM_awprot(2 downto 0) => FM_awprot(2 downto 0),
      FM_awready(0) => FM_awready(0),
      FM_awvalid(0) => FM_awvalid(0),
      FM_bready(0) => FM_bready(0),
      FM_bresp(1 downto 0) => FM_bresp(1 downto 0),
      FM_bvalid(0) => FM_bvalid(0),
      FM_rdata(31 downto 0) => FM_rdata(31 downto 0),
      FM_rready(0) => FM_rready(0),
      FM_rresp(1 downto 0) => FM_rresp(1 downto 0),
      FM_rvalid(0) => FM_rvalid(0),
      FM_wdata(31 downto 0) => FM_wdata(31 downto 0),
      FM_wready(0) => FM_wready(0),
      FM_wstrb(3 downto 0) => FM_wstrb(3 downto 0),
      FM_wvalid(0) => FM_wvalid(0),
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
      HAL_CORE_araddr(31 downto 0) => HAL_CORE_araddr(31 downto 0),
      HAL_CORE_arprot(2 downto 0) => HAL_CORE_arprot(2 downto 0),
      HAL_CORE_arready(0) => HAL_CORE_arready(0),
      HAL_CORE_arvalid(0) => HAL_CORE_arvalid(0),
      HAL_CORE_awaddr(31 downto 0) => HAL_CORE_awaddr(31 downto 0),
      HAL_CORE_awprot(2 downto 0) => HAL_CORE_awprot(2 downto 0),
      HAL_CORE_awready(0) => HAL_CORE_awready(0),
      HAL_CORE_awvalid(0) => HAL_CORE_awvalid(0),
      HAL_CORE_bready(0) => HAL_CORE_bready(0),
      HAL_CORE_bresp(1 downto 0) => HAL_CORE_bresp(1 downto 0),
      HAL_CORE_bvalid(0) => HAL_CORE_bvalid(0),
      HAL_CORE_rdata(31 downto 0) => HAL_CORE_rdata(31 downto 0),
      HAL_CORE_rready(0) => HAL_CORE_rready(0),
      HAL_CORE_rresp(1 downto 0) => HAL_CORE_rresp(1 downto 0),
      HAL_CORE_rvalid(0) => HAL_CORE_rvalid(0),
      HAL_CORE_wdata(31 downto 0) => HAL_CORE_wdata(31 downto 0),
      HAL_CORE_wready(0) => HAL_CORE_wready(0),
      HAL_CORE_wstrb(3 downto 0) => HAL_CORE_wstrb(3 downto 0),
      HAL_CORE_wvalid(0) => HAL_CORE_wvalid(0),
      HAL_araddr(31 downto 0) => HAL_araddr(31 downto 0),
      HAL_arprot(2 downto 0) => HAL_arprot(2 downto 0),
      HAL_arready(0) => HAL_arready(0),
      HAL_arvalid(0) => HAL_arvalid(0),
      HAL_awaddr(31 downto 0) => HAL_awaddr(31 downto 0),
      HAL_awprot(2 downto 0) => HAL_awprot(2 downto 0),
      HAL_awready(0) => HAL_awready(0),
      HAL_awvalid(0) => HAL_awvalid(0),
      HAL_bready(0) => HAL_bready(0),
      HAL_bresp(1 downto 0) => HAL_bresp(1 downto 0),
      HAL_bvalid(0) => HAL_bvalid(0),
      HAL_rdata(31 downto 0) => HAL_rdata(31 downto 0),
      HAL_rready(0) => HAL_rready(0),
      HAL_rresp(1 downto 0) => HAL_rresp(1 downto 0),
      HAL_rvalid(0) => HAL_rvalid(0),
      HAL_wdata(31 downto 0) => HAL_wdata(31 downto 0),
      HAL_wready(0) => HAL_wready(0),
      HAL_wstrb(3 downto 0) => HAL_wstrb(3 downto 0),
      HAL_wvalid(0) => HAL_wvalid(0),
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
      clk50Mhz => clk50Mhz,
      reset_n => reset_n
    );
end STRUCTURE;
