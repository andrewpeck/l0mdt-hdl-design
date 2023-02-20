library ieee;
use ieee.std_logic_1164.all;
package c2cslave_pkg is
  component c2cSlave is
  port (
    clk50Mhz : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    AXI_CLK : in STD_LOGIC;
    AXI_RST_N : out std_logic;
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
    K_C2C_PHY_Rx_rxn : in std_logic;
    K_C2C_PHY_Rx_rxp : in std_logic;
    K_C2C_PHY_Tx_txn : out std_logic;
    K_C2C_PHY_Tx_txp : out std_logic;
    K_C2C_PHY_power_down : in STD_LOGIC;
    K_C2C_PHY_gt_pll_lock : out STD_LOGIC;
    K_C2C_PHY_hard_err : out STD_LOGIC;
    K_C2C_PHY_soft_err : out STD_LOGIC;
    K_C2C_PHY_lane_up : out std_logic;
    K_C2C_PHY_mmcm_not_locked_out : out STD_LOGIC;
    K_C2C_PHY_link_reset_out : out STD_LOGIC;
    K_C2C_PHY_channel_up : out STD_LOGIC;
    K_C2C_PHY_DEBUG_cplllock : out std_logic;
    K_C2C_PHY_DEBUG_dmonitorout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DEBUG_eyescandataerror : out std_logic;
    K_C2C_PHY_DEBUG_eyescanreset : in std_logic;
    K_C2C_PHY_DEBUG_eyescantrigger : in std_logic;
    K_C2C_PHY_DEBUG_pcsrsvdin : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2C_PHY_DEBUG_qplllock : out std_logic;
    K_C2C_PHY_DEBUG_rxbufreset : in std_logic;
    K_C2C_PHY_DEBUG_rxbufstatus : out STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2C_PHY_DEBUG_rxcdrhold : in std_logic;
    K_C2C_PHY_DEBUG_rxdfelpmreset : in std_logic;
    K_C2C_PHY_DEBUG_rxlpmen : in std_logic;
    K_C2C_PHY_DEBUG_rxpcsreset : in std_logic;
    K_C2C_PHY_DEBUG_rxpmareset : in std_logic;
    K_C2C_PHY_DEBUG_rxpmaresetdone : out std_logic;
    K_C2C_PHY_DEBUG_rxprbscntreset : in std_logic;
    K_C2C_PHY_DEBUG_rxprbserr : out std_logic;
    K_C2C_PHY_DEBUG_rxprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2C_PHY_DEBUG_rxrate : in STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2C_PHY_DEBUG_rxresetdone : out std_logic;
    K_C2C_PHY_DEBUG_txbufstatus : out STD_LOGIC_VECTOR ( 1 downto 0 );
    K_C2C_PHY_DEBUG_txdiffctrl : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2C_PHY_DEBUG_txinhibit : in std_logic;
    K_C2C_PHY_DEBUG_txpcsreset : in std_logic;
    K_C2C_PHY_DEBUG_txpmareset : in std_logic;
    K_C2C_PHY_DEBUG_txpolarity : in std_logic;
    K_C2C_PHY_DEBUG_txpostcursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2C_PHY_DEBUG_txprbsforceerr : in std_logic;
    K_C2C_PHY_DEBUG_txprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2C_PHY_DEBUG_txprecursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2C_PHY_DEBUG_txresetdone : out std_logic;
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
    K_C2CB_PHY_Rx_rxn : in std_logic;
    K_C2CB_PHY_Rx_rxp : in std_logic;
    K_C2CB_PHY_Tx_txn : out std_logic;
    K_C2CB_PHY_Tx_txp : out std_logic;
    K_C2CB_PHY_power_down : in STD_LOGIC;
    K_C2CB_PHY_gt_pll_lock : out STD_LOGIC;
    K_C2CB_PHY_hard_err : out STD_LOGIC;
    K_C2CB_PHY_soft_err : out STD_LOGIC;
    K_C2CB_PHY_lane_up : out std_logic;
    K_C2CB_PHY_link_reset_out : out STD_LOGIC;
    K_C2CB_PHY_channel_up : out STD_LOGIC;
    K_C2CB_PHY_DEBUG_cplllock : out std_logic;
    K_C2CB_PHY_DEBUG_dmonitorout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DEBUG_eyescandataerror : out std_logic;
    K_C2CB_PHY_DEBUG_eyescanreset : in std_logic;
    K_C2CB_PHY_DEBUG_eyescantrigger : in std_logic;
    K_C2CB_PHY_DEBUG_pcsrsvdin : in STD_LOGIC_VECTOR ( 15 downto 0 );
    K_C2CB_PHY_DEBUG_qplllock : out std_logic;
    K_C2CB_PHY_DEBUG_rxbufreset : in std_logic;
    K_C2CB_PHY_DEBUG_rxbufstatus : out STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2CB_PHY_DEBUG_rxcdrhold : in std_logic;
    K_C2CB_PHY_DEBUG_rxdfelpmreset : in std_logic;
    K_C2CB_PHY_DEBUG_rxlpmen : in std_logic;
    K_C2CB_PHY_DEBUG_rxpcsreset : in std_logic;
    K_C2CB_PHY_DEBUG_rxpmareset : in std_logic;
    K_C2CB_PHY_DEBUG_rxpmaresetdone : out std_logic;
    K_C2CB_PHY_DEBUG_rxprbscntreset : in std_logic;
    K_C2CB_PHY_DEBUG_rxprbserr : out std_logic;
    K_C2CB_PHY_DEBUG_rxprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2CB_PHY_DEBUG_rxrate : in STD_LOGIC_VECTOR ( 2 downto 0 );
    K_C2CB_PHY_DEBUG_rxresetdone : out std_logic;
    K_C2CB_PHY_DEBUG_txbufstatus : out STD_LOGIC_VECTOR ( 1 downto 0 );
    K_C2CB_PHY_DEBUG_txdiffctrl : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2CB_PHY_DEBUG_txinhibit : in std_logic;
    K_C2CB_PHY_DEBUG_txpcsreset : in std_logic;
    K_C2CB_PHY_DEBUG_txpmareset : in std_logic;
    K_C2CB_PHY_DEBUG_txpolarity : in std_logic;
    K_C2CB_PHY_DEBUG_txpostcursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2CB_PHY_DEBUG_txprbsforceerr : in std_logic;
    K_C2CB_PHY_DEBUG_txprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    K_C2CB_PHY_DEBUG_txprecursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    K_C2CB_PHY_DEBUG_txresetdone : out std_logic;
    KINTEX_SYS_MGMT_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccint_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_vccaux_alarm : out STD_LOGIC;
    KINTEX_SYS_MGMT_overtemp_alarm : out STD_LOGIC;
    FW_INFO_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FW_INFO_awvalid : out std_logic;
    FW_INFO_awready : in std_logic;
    FW_INFO_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    FW_INFO_wvalid : out std_logic;
    FW_INFO_wready : in std_logic;
    FW_INFO_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FW_INFO_bvalid : in std_logic;
    FW_INFO_bready : out std_logic;
    FW_INFO_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    FW_INFO_arvalid : out std_logic;
    FW_INFO_arready : in std_logic;
    FW_INFO_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_INFO_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    FW_INFO_rvalid : in std_logic;
    FW_INFO_rready : out std_logic;
    C2C_INTFS_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    C2C_INTFS_awvalid : out std_logic;
    C2C_INTFS_awready : in std_logic;
    C2C_INTFS_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    C2C_INTFS_wvalid : out std_logic;
    C2C_INTFS_wready : in std_logic;
    C2C_INTFS_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    C2C_INTFS_bvalid : in std_logic;
    C2C_INTFS_bready : out std_logic;
    C2C_INTFS_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    C2C_INTFS_arvalid : out std_logic;
    C2C_INTFS_arready : in std_logic;
    C2C_INTFS_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    C2C_INTFS_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    C2C_INTFS_rvalid : in std_logic;
    C2C_INTFS_rready : out std_logic;
    CM1_PB_UART_rxd : in STD_LOGIC;
    CM1_PB_UART_txd : out STD_LOGIC;
    HOG_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HOG_awvalid : out std_logic;
    HOG_awready : in std_logic;
    HOG_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    HOG_wvalid : out std_logic;
    HOG_wready : in std_logic;
    HOG_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HOG_bvalid : in std_logic;
    HOG_bready : out std_logic;
    HOG_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HOG_arvalid : out std_logic;
    HOG_arready : in std_logic;
    HOG_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    HOG_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    HOG_rvalid : in std_logic;
    HOG_rready : out std_logic
  );
  end component c2cSlave;
end package c2cslave_pkg;
