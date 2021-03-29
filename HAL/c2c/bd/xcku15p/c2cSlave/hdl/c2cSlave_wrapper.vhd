--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
--Date        : Mon Mar 29 18:31:55 2021
--Host        : larry running 64-bit Ubuntu 18.04.5 LTS
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
    FW_INFO_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FW_INFO_arready : in STD_LOGIC;
    FW_INFO_arvalid : out STD_LOGIC;
    FW_INFO_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FW_INFO_awready : in STD_LOGIC;
    FW_INFO_awvalid : out STD_LOGIC;
    FW_INFO_bready : out STD_LOGIC;
    FW_INFO_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FW_INFO_bvalid : in STD_LOGIC;
    FW_INFO_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_rready : out STD_LOGIC;
    FW_INFO_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FW_INFO_rvalid : in STD_LOGIC;
    FW_INFO_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_wready : in STD_LOGIC;
    FW_INFO_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FW_INFO_wvalid : out STD_LOGIC;
    H2S_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    H2S_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    H2S_arready : in STD_LOGIC;
    H2S_arvalid : out STD_LOGIC;
    H2S_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    H2S_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    H2S_awready : in STD_LOGIC;
    H2S_awvalid : out STD_LOGIC;
    H2S_bready : out STD_LOGIC;
    H2S_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    H2S_bvalid : in STD_LOGIC;
    H2S_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    H2S_rready : out STD_LOGIC;
    H2S_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    H2S_rvalid : in STD_LOGIC;
    H2S_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    H2S_wready : in STD_LOGIC;
    H2S_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    H2S_wvalid : out STD_LOGIC;
    HAL_CORE_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_CORE_arready : in STD_LOGIC;
    HAL_CORE_arvalid : out STD_LOGIC;
    HAL_CORE_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_CORE_awready : in STD_LOGIC;
    HAL_CORE_awvalid : out STD_LOGIC;
    HAL_CORE_bready : out STD_LOGIC;
    HAL_CORE_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_CORE_bvalid : in STD_LOGIC;
    HAL_CORE_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_rready : out STD_LOGIC;
    HAL_CORE_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_CORE_rvalid : in STD_LOGIC;
    HAL_CORE_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_wready : in STD_LOGIC;
    HAL_CORE_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HAL_CORE_wvalid : out STD_LOGIC;
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
    KINTEX_SYS_MGMT_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_overtemp_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccaux_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccint_alarm : out STD_LOGIC;
    K_C2CLINK_PHY_Rx_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CLINK_PHY_Rx_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CLINK_PHY_Tx_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CLINK_PHY_Tx_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CLINK_PHY_gt_pll_lock : out STD_LOGIC;
    K_C2CLINK_PHY_hard_err : out STD_LOGIC;
    K_C2CLINK_PHY_lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CLINK_PHY_link_reset_out : out STD_LOGIC;
    K_C2CLINK_PHY_mmcm_not_locked_out : out STD_LOGIC;
    K_C2CLINK_PHY_power_down : in STD_LOGIC;
    K_C2CLINK_PHY_refclk_clk_n : in STD_LOGIC;
    K_C2CLINK_PHY_refclk_clk_p : in STD_LOGIC;
    K_C2CLINK_PHY_soft_err : out STD_LOGIC;
    K_C2CLINK_aurora_do_cc : out STD_LOGIC;
    K_C2CLINK_axi_c2c_config_error_out : out STD_LOGIC;
    K_C2CLINK_axi_c2c_link_status_out : out STD_LOGIC;
    K_C2CLINK_axi_c2c_multi_bit_error_out : out STD_LOGIC;
    MPL_SPY_port_addr : out STD_LOGIC_VECTOR ( 14 downto 0 );
    MPL_SPY_port_clk : out STD_LOGIC;
    MPL_SPY_port_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_SPY_port_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_SPY_port_en : out STD_LOGIC;
    MPL_SPY_port_rst : out STD_LOGIC;
    MPL_SPY_port_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
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
    TAR_SPY_port_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
    TAR_SPY_port_clk : out STD_LOGIC;
    TAR_SPY_port_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_SPY_port_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_SPY_port_en : out STD_LOGIC;
    TAR_SPY_port_rst : out STD_LOGIC;
    TAR_SPY_port_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TAR_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_arready : in STD_LOGIC;
    TAR_arvalid : out STD_LOGIC;
    TAR_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_awready : in STD_LOGIC;
    TAR_awvalid : out STD_LOGIC;
    TAR_bready : out STD_LOGIC;
    TAR_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_bvalid : in STD_LOGIC;
    TAR_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_rready : out STD_LOGIC;
    TAR_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_rvalid : in STD_LOGIC;
    TAR_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_wready : in STD_LOGIC;
    TAR_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TAR_wvalid : out STD_LOGIC;
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
    K_C2CLINK_aurora_do_cc : out STD_LOGIC;
    K_C2CLINK_axi_c2c_config_error_out : out STD_LOGIC;
    K_C2CLINK_axi_c2c_link_status_out : out STD_LOGIC;
    K_C2CLINK_axi_c2c_multi_bit_error_out : out STD_LOGIC;
    K_C2CLINK_PHY_power_down : in STD_LOGIC;
    K_C2CLINK_PHY_gt_pll_lock : out STD_LOGIC;
    K_C2CLINK_PHY_hard_err : out STD_LOGIC;
    K_C2CLINK_PHY_soft_err : out STD_LOGIC;
    K_C2CLINK_PHY_lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CLINK_PHY_mmcm_not_locked_out : out STD_LOGIC;
    K_C2CLINK_PHY_link_reset_out : out STD_LOGIC;
    KINTEX_SYS_MGMT_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccint_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccaux_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_overtemp_alarm : out STD_LOGIC;
    clk40 : in STD_LOGIC;
    K_C2CLINK_PHY_refclk_clk_n : in STD_LOGIC;
    K_C2CLINK_PHY_refclk_clk_p : in STD_LOGIC;
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
    FW_INFO_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FW_INFO_awvalid : out STD_LOGIC;
    FW_INFO_awready : in STD_LOGIC;
    FW_INFO_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FW_INFO_wvalid : out STD_LOGIC;
    FW_INFO_wready : in STD_LOGIC;
    FW_INFO_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FW_INFO_bvalid : in STD_LOGIC;
    FW_INFO_bready : out STD_LOGIC;
    FW_INFO_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FW_INFO_arvalid : out STD_LOGIC;
    FW_INFO_arready : in STD_LOGIC;
    FW_INFO_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FW_INFO_rvalid : in STD_LOGIC;
    FW_INFO_rready : out STD_LOGIC;
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
    TAR_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_awvalid : out STD_LOGIC;
    TAR_awready : in STD_LOGIC;
    TAR_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TAR_wvalid : out STD_LOGIC;
    TAR_wready : in STD_LOGIC;
    TAR_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_bvalid : in STD_LOGIC;
    TAR_bready : out STD_LOGIC;
    TAR_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    TAR_arvalid : out STD_LOGIC;
    TAR_arready : in STD_LOGIC;
    TAR_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    TAR_rvalid : in STD_LOGIC;
    TAR_rready : out STD_LOGIC;
    MPL_SPY_port_addr : out STD_LOGIC_VECTOR ( 14 downto 0 );
    MPL_SPY_port_clk : out STD_LOGIC;
    MPL_SPY_port_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_SPY_port_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    MPL_SPY_port_en : out STD_LOGIC;
    MPL_SPY_port_rst : out STD_LOGIC;
    MPL_SPY_port_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    TAR_SPY_port_addr : out STD_LOGIC_VECTOR ( 15 downto 0 );
    TAR_SPY_port_clk : out STD_LOGIC;
    TAR_SPY_port_din : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_SPY_port_dout : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TAR_SPY_port_en : out STD_LOGIC;
    TAR_SPY_port_rst : out STD_LOGIC;
    TAR_SPY_port_we : out STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2CLINK_PHY_Tx_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CLINK_PHY_Tx_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CLINK_PHY_Rx_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    K_C2CLINK_PHY_Rx_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    HAL_CORE_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_CORE_awvalid : out STD_LOGIC;
    HAL_CORE_awready : in STD_LOGIC;
    HAL_CORE_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HAL_CORE_wvalid : out STD_LOGIC;
    HAL_CORE_wready : in STD_LOGIC;
    HAL_CORE_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_CORE_bvalid : in STD_LOGIC;
    HAL_CORE_bready : out STD_LOGIC;
    HAL_CORE_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HAL_CORE_arvalid : out STD_LOGIC;
    HAL_CORE_arready : in STD_LOGIC;
    HAL_CORE_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HAL_CORE_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HAL_CORE_rvalid : in STD_LOGIC;
    HAL_CORE_rready : out STD_LOGIC;
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
    H2S_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    H2S_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    H2S_awvalid : out STD_LOGIC;
    H2S_awready : in STD_LOGIC;
    H2S_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    H2S_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    H2S_wvalid : out STD_LOGIC;
    H2S_wready : in STD_LOGIC;
    H2S_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    H2S_bvalid : in STD_LOGIC;
    H2S_bready : out STD_LOGIC;
    H2S_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    H2S_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    H2S_arvalid : out STD_LOGIC;
    H2S_arready : in STD_LOGIC;
    H2S_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    H2S_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    H2S_rvalid : in STD_LOGIC;
    H2S_rready : out STD_LOGIC
  );
  end component c2cSlave;
begin
c2cSlave_i: component c2cSlave
     port map (
      AXI_CLK => AXI_CLK,
      AXI_RST_N(0) => AXI_RST_N(0),
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
      FW_INFO_araddr(31 downto 0) => FW_INFO_araddr(31 downto 0),
      FW_INFO_arprot(2 downto 0) => FW_INFO_arprot(2 downto 0),
      FW_INFO_arready => FW_INFO_arready,
      FW_INFO_arvalid => FW_INFO_arvalid,
      FW_INFO_awaddr(31 downto 0) => FW_INFO_awaddr(31 downto 0),
      FW_INFO_awprot(2 downto 0) => FW_INFO_awprot(2 downto 0),
      FW_INFO_awready => FW_INFO_awready,
      FW_INFO_awvalid => FW_INFO_awvalid,
      FW_INFO_bready => FW_INFO_bready,
      FW_INFO_bresp(1 downto 0) => FW_INFO_bresp(1 downto 0),
      FW_INFO_bvalid => FW_INFO_bvalid,
      FW_INFO_rdata(31 downto 0) => FW_INFO_rdata(31 downto 0),
      FW_INFO_rready => FW_INFO_rready,
      FW_INFO_rresp(1 downto 0) => FW_INFO_rresp(1 downto 0),
      FW_INFO_rvalid => FW_INFO_rvalid,
      FW_INFO_wdata(31 downto 0) => FW_INFO_wdata(31 downto 0),
      FW_INFO_wready => FW_INFO_wready,
      FW_INFO_wstrb(3 downto 0) => FW_INFO_wstrb(3 downto 0),
      FW_INFO_wvalid => FW_INFO_wvalid,
      H2S_araddr(31 downto 0) => H2S_araddr(31 downto 0),
      H2S_arprot(2 downto 0) => H2S_arprot(2 downto 0),
      H2S_arready => H2S_arready,
      H2S_arvalid => H2S_arvalid,
      H2S_awaddr(31 downto 0) => H2S_awaddr(31 downto 0),
      H2S_awprot(2 downto 0) => H2S_awprot(2 downto 0),
      H2S_awready => H2S_awready,
      H2S_awvalid => H2S_awvalid,
      H2S_bready => H2S_bready,
      H2S_bresp(1 downto 0) => H2S_bresp(1 downto 0),
      H2S_bvalid => H2S_bvalid,
      H2S_rdata(31 downto 0) => H2S_rdata(31 downto 0),
      H2S_rready => H2S_rready,
      H2S_rresp(1 downto 0) => H2S_rresp(1 downto 0),
      H2S_rvalid => H2S_rvalid,
      H2S_wdata(31 downto 0) => H2S_wdata(31 downto 0),
      H2S_wready => H2S_wready,
      H2S_wstrb(3 downto 0) => H2S_wstrb(3 downto 0),
      H2S_wvalid => H2S_wvalid,
      HAL_CORE_araddr(31 downto 0) => HAL_CORE_araddr(31 downto 0),
      HAL_CORE_arprot(2 downto 0) => HAL_CORE_arprot(2 downto 0),
      HAL_CORE_arready => HAL_CORE_arready,
      HAL_CORE_arvalid => HAL_CORE_arvalid,
      HAL_CORE_awaddr(31 downto 0) => HAL_CORE_awaddr(31 downto 0),
      HAL_CORE_awprot(2 downto 0) => HAL_CORE_awprot(2 downto 0),
      HAL_CORE_awready => HAL_CORE_awready,
      HAL_CORE_awvalid => HAL_CORE_awvalid,
      HAL_CORE_bready => HAL_CORE_bready,
      HAL_CORE_bresp(1 downto 0) => HAL_CORE_bresp(1 downto 0),
      HAL_CORE_bvalid => HAL_CORE_bvalid,
      HAL_CORE_rdata(31 downto 0) => HAL_CORE_rdata(31 downto 0),
      HAL_CORE_rready => HAL_CORE_rready,
      HAL_CORE_rresp(1 downto 0) => HAL_CORE_rresp(1 downto 0),
      HAL_CORE_rvalid => HAL_CORE_rvalid,
      HAL_CORE_wdata(31 downto 0) => HAL_CORE_wdata(31 downto 0),
      HAL_CORE_wready => HAL_CORE_wready,
      HAL_CORE_wstrb(3 downto 0) => HAL_CORE_wstrb(3 downto 0),
      HAL_CORE_wvalid => HAL_CORE_wvalid,
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
      KINTEX_SYS_MGMT_alarm => KINTEX_SYS_MGMT_alarm,
      KINTEX_SYS_MGMT_overtemp_alarm => KINTEX_SYS_MGMT_overtemp_alarm,
      KINTEX_SYS_MGMT_vccaux_alarm => KINTEX_SYS_MGMT_vccaux_alarm,
      KINTEX_SYS_MGMT_vccint_alarm => KINTEX_SYS_MGMT_vccint_alarm,
      K_C2CLINK_PHY_Rx_rxn(0) => K_C2CLINK_PHY_Rx_rxn(0),
      K_C2CLINK_PHY_Rx_rxp(0) => K_C2CLINK_PHY_Rx_rxp(0),
      K_C2CLINK_PHY_Tx_txn(0) => K_C2CLINK_PHY_Tx_txn(0),
      K_C2CLINK_PHY_Tx_txp(0) => K_C2CLINK_PHY_Tx_txp(0),
      K_C2CLINK_PHY_gt_pll_lock => K_C2CLINK_PHY_gt_pll_lock,
      K_C2CLINK_PHY_hard_err => K_C2CLINK_PHY_hard_err,
      K_C2CLINK_PHY_lane_up(0) => K_C2CLINK_PHY_lane_up(0),
      K_C2CLINK_PHY_link_reset_out => K_C2CLINK_PHY_link_reset_out,
      K_C2CLINK_PHY_mmcm_not_locked_out => K_C2CLINK_PHY_mmcm_not_locked_out,
      K_C2CLINK_PHY_power_down => K_C2CLINK_PHY_power_down,
      K_C2CLINK_PHY_refclk_clk_n => K_C2CLINK_PHY_refclk_clk_n,
      K_C2CLINK_PHY_refclk_clk_p => K_C2CLINK_PHY_refclk_clk_p,
      K_C2CLINK_PHY_soft_err => K_C2CLINK_PHY_soft_err,
      K_C2CLINK_aurora_do_cc => K_C2CLINK_aurora_do_cc,
      K_C2CLINK_axi_c2c_config_error_out => K_C2CLINK_axi_c2c_config_error_out,
      K_C2CLINK_axi_c2c_link_status_out => K_C2CLINK_axi_c2c_link_status_out,
      K_C2CLINK_axi_c2c_multi_bit_error_out => K_C2CLINK_axi_c2c_multi_bit_error_out,
      MPL_SPY_port_addr(14 downto 0) => MPL_SPY_port_addr(14 downto 0),
      MPL_SPY_port_clk => MPL_SPY_port_clk,
      MPL_SPY_port_din(31 downto 0) => MPL_SPY_port_din(31 downto 0),
      MPL_SPY_port_dout(31 downto 0) => MPL_SPY_port_dout(31 downto 0),
      MPL_SPY_port_en => MPL_SPY_port_en,
      MPL_SPY_port_rst => MPL_SPY_port_rst,
      MPL_SPY_port_we(3 downto 0) => MPL_SPY_port_we(3 downto 0),
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
      TAR_SPY_port_addr(15 downto 0) => TAR_SPY_port_addr(15 downto 0),
      TAR_SPY_port_clk => TAR_SPY_port_clk,
      TAR_SPY_port_din(31 downto 0) => TAR_SPY_port_din(31 downto 0),
      TAR_SPY_port_dout(31 downto 0) => TAR_SPY_port_dout(31 downto 0),
      TAR_SPY_port_en => TAR_SPY_port_en,
      TAR_SPY_port_rst => TAR_SPY_port_rst,
      TAR_SPY_port_we(3 downto 0) => TAR_SPY_port_we(3 downto 0),
      TAR_araddr(31 downto 0) => TAR_araddr(31 downto 0),
      TAR_arprot(2 downto 0) => TAR_arprot(2 downto 0),
      TAR_arready => TAR_arready,
      TAR_arvalid => TAR_arvalid,
      TAR_awaddr(31 downto 0) => TAR_awaddr(31 downto 0),
      TAR_awprot(2 downto 0) => TAR_awprot(2 downto 0),
      TAR_awready => TAR_awready,
      TAR_awvalid => TAR_awvalid,
      TAR_bready => TAR_bready,
      TAR_bresp(1 downto 0) => TAR_bresp(1 downto 0),
      TAR_bvalid => TAR_bvalid,
      TAR_rdata(31 downto 0) => TAR_rdata(31 downto 0),
      TAR_rready => TAR_rready,
      TAR_rresp(1 downto 0) => TAR_rresp(1 downto 0),
      TAR_rvalid => TAR_rvalid,
      TAR_wdata(31 downto 0) => TAR_wdata(31 downto 0),
      TAR_wready => TAR_wready,
      TAR_wstrb(3 downto 0) => TAR_wstrb(3 downto 0),
      TAR_wvalid => TAR_wvalid,
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
