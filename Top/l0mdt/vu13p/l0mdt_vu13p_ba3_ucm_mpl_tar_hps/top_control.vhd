--------------------------------------------------------------------------------
-- Company: Max-Planck-Institut fuer Physik - Munich
-- Project: L0MDT
-- File: top_control_template.vhd
-- Module: top_control
-- File PATH: /top_control_template.vhd
-- Dependencies: hal, ctrl_lib, ieee
-- -----
-- File Created: Friday, 17th February 2023 8:36:30 am
-- Author: Davide Cieri - davide.cieri@cern.ch
-- -----
-- Last Modified: Thursday, 8th June 2023 12:11:11 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
-- 2023-06-08	GLdL	updated regmap and generics in entities
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library xil_defaultlib;
library hal;
library ctrl_lib;

-- START: LIBRARIES -- DO NOT TOUCH
use ctrl_lib.fw_info_ctrl.all;
use ctrl_lib.fm_ctrl.all;
use ctrl_lib.core_ctrl.all;
use ctrl_lib.hal_ctrl.all;
use ctrl_lib.hog_ctrl.all;
-- END: LIBRARIES -- DO NOT TOUCH


--use ctrl_lib.FW_TIMESTAMP.all;
--use ctrl_lib.FW_VERSION.all;
use ctrl_lib.axiRegPkg.all;
use ctrl_lib.c2c_intf_ctrl.all;

--use ctrl_lib.c2cslave_pkg.all;
use ctrl_lib.AXISlaveAddrPkg.all;
use xil_defaultlib.all;

entity top_control is
  port (

    -- clocks
    axi_clk  : in std_logic;            -- AXI user clock
    clk40    : in std_logic;            -- 40MHz LHC clock
    clk_user : in std_logic;            -- Userlogic pipeline clock

    -- resets
    clk40_rstn : in std_logic; -- LHC MMCM is ready?
    reset_n    : in std_logic; -- AXI user clock MMCM is ready?

    -- c2c links
    c2c_rxn     : in  std_logic;
    c2c_rxp     : in  std_logic;
    c2c_txn     : out std_logic;
    c2c_txp     : out std_logic;

    -- aux c2c links
    c2cb_rxn    : in  std_logic;
    c2cb_rxp    : in  std_logic;
    c2cb_txn    : out std_logic;
    c2cb_txp    : out std_logic;

    -- reference clock
    c2c_refclkp : in  std_logic; -- connect to FPGA IO directly
    c2c_refclkn : in  std_logic; -- connect to FPGA IO directly

    -- axi reset from c2c to slaves
    axi_reset_n : out std_logic;

    -- control

    -- START: ULT_IO :: DO NOT EDIT
    fw_info_mon : in FW_INFO_MON_t;
    fm_mon : in FM_MON_t;
    fm_ctrl : out FM_CTRL_t;
    core_mon : in CORE_MON_t;
    core_ctrl : out CORE_CTRL_t;
    hal_mon : in HAL_MON_t;
    hal_ctrl : out HAL_CTRL_t;
    hog_mon : in HOG_MON_t;
    -- END: ULT_IO :: DO NOT EDIT
  

    -- system management
  --sys_mgmt_scl            : inout std_logic;
  --sys_mgmt_sda            : inout std_logic;
    sys_mgmt_alarm          : out std_logic;
    sys_mgmt_overtemp_alarm : out std_logic;
    sys_mgmt_vccaux_alarm   : out std_logic;
    sys_mgmt_vccint_alarm   : out std_logic

    );
end top_control;

architecture control_arch of top_control is

  -- START: ULT_AXI_SIGNALS :: DO NOT EDIT
  signal fw_info_readmosi  : axireadmosi;
  signal fw_info_readmiso  : axireadmiso;
  signal fw_info_writemosi : axiwritemosi;
  signal fw_info_writemiso : axiwritemiso;
  signal fw_info_mon_r     : FW_INFO_MON_t;
  signal fm_readmosi  : axireadmosi;
  signal fm_readmiso  : axireadmiso;
  signal fm_writemosi : axiwritemosi;
  signal fm_writemiso : axiwritemiso;
  signal fm_mon_r     : FM_MON_t;
  signal fm_ctrl_r    : FM_CTRL_t;
  signal core_readmosi  : axireadmosi;
  signal core_readmiso  : axireadmiso;
  signal core_writemosi : axiwritemosi;
  signal core_writemiso : axiwritemiso;
  signal core_mon_r     : CORE_MON_t;
  signal core_ctrl_r    : CORE_CTRL_t;
  signal hal_readmosi  : axireadmosi;
  signal hal_readmiso  : axireadmiso;
  signal hal_writemosi : axiwritemosi;
  signal hal_writemiso : axiwritemiso;
  signal hal_mon_r     : HAL_MON_t;
  signal hal_ctrl_r    : HAL_CTRL_t;
  signal hog_readmosi  : axireadmosi;
  signal hog_readmiso  : axireadmiso;
  signal hog_writemosi : axiwritemosi;
  signal hog_writemiso : axiwritemiso;
  signal hog_mon_r     : HOG_MON_t;
  -- END: ULT_AXI_SIGNALS :: DO NOT EDIT

  signal c2c_mon            : C2C_INTF_MON_t;
  signal c2c_ctrl           : C2C_INTF_CTRL_t;
  signal c2c_intf_readmosi  : axireadmosi;
  signal c2c_intf_readmiso  : axireadmiso;
  signal c2c_intf_writemosi : axiwritemosi;
  signal c2c_intf_writemiso : axiwritemiso;

  signal clk_C2C_PHY_user  : STD_logic_vector(2 downto 1);
  
  -- signal strobe : std_logic;
  -- attribute MAX_FANOUT : string;
  -- attribute MAX_FANOUT of strobe : signal is "16";

  signal pB_UART_tx : std_logic;
  signal pB_UART_rx : std_logic;

  signal axi_clk40_reset_n : std_logic;

begin

  --clock_strobe_ult : entity hal.clock_strobe
  --  generic map (RATIO => 8)
  --  port map (
  --    fast_clk_i => clk_user,
  --    slow_clk_i => clk40,
  --    strobe_o   => strobe
  --    );

  ---- hal just runs on 40M, but add a ff for fanout

 

  --process (clk_user) is
  --begin
  --  if (rising_edge(clk_user)) then
  --    -- ctrl outputs, 40 --> 320
  --    if (strobe = '1') then
  --      hps_inn_ctrl <= hps_inn_ctrl_r;
  --      hps_mid_ctrl <= hps_mid_ctrl_r;
  --      hps_out_ctrl <= hps_out_ctrl_r;
  --      hps_ext_ctrl <= hps_ext_ctrl_r;

  --      tar_inn_ctrl <= tar_inn_ctrl_r;
  --      tar_mid_ctrl <= tar_mid_ctrl_r;
  --      tar_out_ctrl <= tar_out_ctrl_r;
  --      tar_ext_ctrl <= tar_ext_ctrl_r;

  --      mtc_ctrl <= mtc_ctrl_r;
  --      ucm_ctrl <= ucm_ctrl_r;
  --      daq_ctrl <= daq_ctrl_r;
  --      tf_ctrl  <= tf_ctrl_r;
  --      mpl_ctrl <= mpl_ctrl_r;

  --      fm_ctrl  <= fm_ctrl_r;

  --    end if;
  --  end if;
  --end process;

  -- every 8th clock cycle, copy the control signals from the 320MHz pipeline
  -- clock to a 8 clock stable version
  --process (clk_user) is
  --begin
  --  if (rising_edge(clk_user)) then
  --    -- mon inputs, 320 --> 40
  --    if (strobe = '1') then
  --      hps_inn_mon_r <= hps_inn_mon;
  --      hps_mid_mon_r <= hps_mid_mon;
  --      hps_out_mon_r <= hps_out_mon;
  --      hps_ext_mon_r <= hps_ext_mon;

  --      tar_inn_mon_r <= tar_inn_mon;
  --      tar_mid_mon_r <= tar_mid_mon;
  --      tar_out_mon_r <= tar_out_mon;
  --      tar_ext_mon_r <= tar_ext_mon;

  --      mtc_mon_r <= mtc_mon;
  --      ucm_mon_r <= ucm_mon;
  --      daq_mon_r <= daq_mon;
  --      tf_mon_r  <= tf_mon;
  --      mpl_mon_r <= mpl_mon;
  --      fm_mon_r  <= fm_mon;

  --    end if;
  --  end if;
  --end process;


   c2csslave_wrapper_1: entity xil_defaultlib.c2cslave_wrapper
    port map (
      AXI_CLK            => axi_clk,
      AXI_RST_N(0)       => axi_reset_n,
      clk50Mhz           => axi_clk,
      clk40              => clk40,
      clk40_rstn         => clk40_rstn,
      AXI_CLK40_RST_N(0) => axi_clk40_reset_n,
      reset_n            => reset_n,

      C2C_phy_Rx_rxn(0)  => c2c_rxn,    --n_mgt_z2k(1 downto 1),
      C2C_phy_Rx_rxp(0)  => c2c_rxp,    --p_mgt_z2k(1 downto 1),
      C2C_phy_Tx_txn(0)  => c2c_txn,    --n_mgt_k2z(1 downto 1),
      C2C_phy_Tx_txp(0)  => c2c_txp,    --p_mgt_k2z(1 downto 1),

      C2C_phy_refclk_clk_n => c2c_refclkn,  --n_util_clk_chan0,
      C2C_phy_refclk_clk_p => c2c_refclkp,  --p_util_clk_chan0,

      C2C_PHY_DEBUG_cplllock(0)         => C2C_Mon.C2C(1).DEBUG.CPLL_LOCK,
      C2C_PHY_DEBUG_dmonitorout         => C2C_Mon.C2C(1).DEBUG.DMONITOR,
      C2C_PHY_DEBUG_eyescandataerror(0) => C2C_Mon.C2C(1).DEBUG.EYESCAN_DATA_ERROR,

      C2C_PHY_DEBUG_eyescanreset(0)   => C2C_Ctrl.C2C(1).DEBUG.EYESCAN_RESET,
      C2C_PHY_DEBUG_eyescantrigger(0) => C2C_Ctrl.C2C(1).DEBUG.EYESCAN_TRIGGER,
      C2C_PHY_DEBUG_pcsrsvdin         => C2C_Ctrl.C2C(1).DEBUG.PCS_RSV_DIN,
      C2C_PHY_DEBUG_qplllock(0)       => C2C_Mon.C2C(1).DEBUG.QPLL_LOCK,
      C2C_PHY_DEBUG_rxbufreset(0)     => C2C_Ctrl.C2C(1).DEBUG.RX.BUF_RESET,
      C2C_PHY_DEBUG_rxbufstatus       => C2C_Mon.C2C(1).DEBUG.RX.BUF_STATUS,
      C2C_PHY_DEBUG_rxcdrhold(0)      => C2C_Ctrl.C2C(1).DEBUG.RX.CDR_HOLD,
      C2C_PHY_DEBUG_rxdfelpmreset(0)  => C2C_Ctrl.C2C(1).DEBUG.RX.DFE_LPM_RESET,
      C2C_PHY_DEBUG_rxlpmen(0)        => C2C_Ctrl.C2C(1).DEBUG.RX.LPM_EN,
      C2C_PHY_DEBUG_rxpcsreset(0)     => C2C_Ctrl.C2C(1).DEBUG.RX.PCS_RESET,
      C2C_PHY_DEBUG_rxpmareset(0)     => C2C_Ctrl.C2C(1).DEBUG.RX.PMA_RESET,
      C2C_PHY_DEBUG_rxpmaresetdone(0) => C2C_Mon.C2C(1).DEBUG.RX.PMA_RESET_DONE,
      C2C_PHY_DEBUG_rxprbscntreset(0) => C2C_Ctrl.C2C(1).DEBUG.RX.PRBS_CNT_RST,
      C2C_PHY_DEBUG_rxprbserr(0)      => C2C_Mon.C2C(1).DEBUG.RX.PRBS_ERR,
      C2C_PHY_DEBUG_rxprbssel         => C2C_Ctrl.C2C(1).DEBUG.RX.PRBS_SEL,
      C2C_PHY_DEBUG_rxrate            => C2C_Ctrl.C2C(1).DEBUG.RX.RATE,
      C2C_PHY_DEBUG_rxresetdone(0)    => C2C_Mon.C2C(1).DEBUG.RX.RESET_DONE,
      C2C_PHY_DEBUG_txbufstatus       => C2C_Mon.C2C(1).DEBUG.TX.BUF_STATUS,
      C2C_PHY_DEBUG_txdiffctrl        => C2C_Ctrl.C2C(1).DEBUG.TX.DIFF_CTRL,
      C2C_PHY_DEBUG_txinhibit(0)      => C2C_Ctrl.C2C(1).DEBUG.TX.INHIBIT,
      C2C_PHY_DEBUG_txpcsreset(0)     => C2C_Ctrl.C2C(1).DEBUG.TX.PCS_RESET,
      C2C_PHY_DEBUG_txpmareset(0)     => C2C_Ctrl.C2C(1).DEBUG.TX.PMA_RESET,
      C2C_PHY_DEBUG_txpolarity(0)     => C2C_Ctrl.C2C(1).DEBUG.TX.POLARITY,
      C2C_PHY_DEBUG_txpostcursor      => C2C_Ctrl.C2C(1).DEBUG.TX.POST_CURSOR,
      C2C_PHY_DEBUG_txprbsforceerr(0) => C2C_Ctrl.C2C(1).DEBUG.TX.PRBS_FORCE_ERR,
      C2C_PHY_DEBUG_txprbssel         => C2C_Ctrl.C2C(1).DEBUG.TX.PRBS_SEL,
      C2C_PHY_DEBUG_txprecursor       => C2C_Ctrl.C2C(1).DEBUG.TX.PRE_CURSOR,
      C2C_PHY_DEBUG_txresetdone(0)    => C2C_MON.C2C(1).DEBUG.TX.RESET_DONE,

      C2C_PHY_channel_up          => C2C_Mon.C2C(1).STATUS.CHANNEL_UP,
      C2C_PHY_gt_pll_lock         => C2C_MON.C2C(1).STATUS.PHY_GT_PLL_LOCK,
      C2C_PHY_hard_err            => C2C_Mon.C2C(1).STATUS.PHY_HARD_ERR,
      C2C_PHY_lane_up(0)          => C2C_Mon.C2C(1).STATUS.PHY_LANE_UP,  --(0 downto 0),
      C2C_PHY_mmcm_not_locked_out => C2C_Mon.C2C(1).STATUS.PHY_MMCM_LOL,
      C2C_PHY_soft_err            => C2C_Mon.C2C(1).STATUS.PHY_SOFT_ERR,

      C2C_aurora_do_cc                   => C2C_Mon.C2C(1).STATUS.DO_CC,
      C2C_aurora_pma_init_in             => C2C_Ctrl.C2C(1).STATUS.INITIALIZE,
      C2C_axi_c2c_config_error_out       => C2C_Mon.C2C(1).STATUS.CONFIG_ERROR,
      C2C_axi_c2c_link_status_out        => C2C_MON.C2C(1).STATUS.LINK_GOOD,
      C2C_axi_c2c_multi_bit_error_out    => C2C_MON.C2C(1).STATUS.MB_ERROR,
      C2C_phy_power_down                 => '0',
      C2C_PHY_clk                        => clk_C2C_PHY_user(1),
      C2C_PHY_DRP_daddr                  => C2C_Ctrl.C2C(1).DRP.address,
      C2C_PHY_DRP_den                    => C2C_Ctrl.C2C(1).DRP.enable,
      C2C_PHY_DRP_di                     => C2C_Ctrl.C2C(1).DRP.wr_data,
      C2C_PHY_DRP_do                     => C2C_MON.C2C(1).DRP.rd_data,
      C2C_PHY_DRP_drdy                   => C2C_MON.C2C(1).DRP.rd_data_valid,
      C2C_PHY_DRP_dwe                    => C2C_Ctrl.C2C(1).DRP.wr_enable,
      C2CB_PHY_DEBUG_cplllock(0)         => C2C_Mon.C2C(2).DEBUG.CPLL_LOCK,
      C2CB_PHY_DEBUG_dmonitorout         => C2C_Mon.C2C(2).DEBUG.DMONITOR,
      C2CB_PHY_DEBUG_eyescandataerror(0) => C2C_Mon.C2C(2).DEBUG.EYESCAN_DATA_ERROR,

      C2CB_PHY_DEBUG_eyescanreset(0)   => C2C_Ctrl.C2C(2).DEBUG.EYESCAN_RESET,
      C2CB_PHY_DEBUG_eyescantrigger(0) => C2C_Ctrl.C2C(2).DEBUG.EYESCAN_TRIGGER,
      C2CB_PHY_DEBUG_pcsrsvdin         => C2C_Ctrl.C2C(2).DEBUG.PCS_RSV_DIN,
      C2CB_PHY_DEBUG_qplllock(0)       => C2C_Mon.C2C(2).DEBUG.QPLL_LOCK,
      C2CB_PHY_DEBUG_rxbufreset(0)     => C2C_Ctrl.C2C(2).DEBUG.RX.BUF_RESET,
      C2CB_PHY_DEBUG_rxbufstatus       => C2C_Mon.C2C(2).DEBUG.RX.BUF_STATUS,
      C2CB_PHY_DEBUG_rxcdrhold(0)      => C2C_Ctrl.C2C(2).DEBUG.RX.CDR_HOLD,
      C2CB_PHY_DEBUG_rxdfelpmreset(0)  => C2C_Ctrl.C2C(2).DEBUG.RX.DFE_LPM_RESET,
      C2CB_PHY_DEBUG_rxlpmen(0)        => C2C_Ctrl.C2C(2).DEBUG.RX.LPM_EN,
      C2CB_PHY_DEBUG_rxpcsreset(0)     => C2C_Ctrl.C2C(2).DEBUG.RX.PCS_RESET,
      C2CB_PHY_DEBUG_rxpmareset(0)     => C2C_Ctrl.C2C(2).DEBUG.RX.PMA_RESET,
      C2CB_PHY_DEBUG_rxpmaresetdone(0) => C2C_Mon.C2C(2).DEBUG.RX.PMA_RESET_DONE,
      C2CB_PHY_DEBUG_rxprbscntreset(0) => C2C_Ctrl.C2C(2).DEBUG.RX.PRBS_CNT_RST,
      C2CB_PHY_DEBUG_rxprbserr(0)      => C2C_Mon.C2C(2).DEBUG.RX.PRBS_ERR,
      C2CB_PHY_DEBUG_rxprbssel         => C2C_Ctrl.C2C(2).DEBUG.RX.PRBS_SEL,
      C2CB_PHY_DEBUG_rxrate            => C2C_Ctrl.C2C(2).DEBUG.RX.RATE,
      C2CB_PHY_DEBUG_rxresetdone(0)    => C2C_Mon.C2C(2).DEBUG.RX.RESET_DONE,
      C2CB_PHY_DEBUG_txbufstatus       => C2C_Mon.C2C(2).DEBUG.TX.BUF_STATUS,
      C2CB_PHY_DEBUG_txdiffctrl        => C2C_Ctrl.C2C(2).DEBUG.TX.DIFF_CTRL,
      C2CB_PHY_DEBUG_txinhibit(0)      => C2C_Ctrl.C2C(2).DEBUG.TX.INHIBIT,
      C2CB_PHY_DEBUG_txpcsreset(0)     => C2C_Ctrl.C2C(2).DEBUG.TX.PCS_RESET,
      C2CB_PHY_DEBUG_txpmareset(0)     => C2C_Ctrl.C2C(2).DEBUG.TX.PMA_RESET,
      C2CB_PHY_DEBUG_txpolarity(0)     => C2C_Ctrl.C2C(2).DEBUG.TX.POLARITY,
      C2CB_PHY_DEBUG_txpostcursor      => C2C_Ctrl.C2C(2).DEBUG.TX.POST_CURSOR,
      C2CB_PHY_DEBUG_txprbsforceerr(0) => C2C_Ctrl.C2C(2).DEBUG.TX.PRBS_FORCE_ERR,
      C2CB_PHY_DEBUG_txprbssel         => C2C_Ctrl.C2C(2).DEBUG.TX.PRBS_SEL,
      C2CB_PHY_DEBUG_txprecursor       => C2C_Ctrl.C2C(2).DEBUG.TX.PRE_CURSOR,
      C2CB_PHY_DEBUG_txresetdone(0)    => C2C_MON.C2C(2).DEBUG.TX.RESET_DONE,

      C2CB_PHY_channel_up         => C2C_Mon.C2C(2).STATUS.CHANNEL_UP,
      C2CB_PHY_gt_pll_lock        => C2C_MON.C2C(2).STATUS.PHY_GT_PLL_LOCK,
      C2CB_PHY_hard_err           => C2C_Mon.C2C(2).STATUS.PHY_HARD_ERR,
      C2CB_PHY_lane_up(0)         => C2C_Mon.C2C(2).STATUS.PHY_LANE_UP,  --(0 downto 0),
    --C2CB_PHY_mmcm_not_locked    => C2C_Mon.C2C(2).STATUS.PHY_MMCM_LOL,
      C2CB_PHY_soft_err           => C2C_Mon.C2C(2).STATUS.PHY_SOFT_ERR,

      C2CB_aurora_do_cc                => C2C_Mon.C2C(2).STATUS.DO_CC,
      C2CB_aurora_pma_init_in          => C2C_Ctrl.C2C(2).STATUS.INITIALIZE,
      C2CB_axi_c2c_config_error_out    => C2C_Mon.C2C(2).STATUS.CONFIG_ERROR,
      C2CB_axi_c2c_link_status_out     => C2C_MON.C2C(2).STATUS.LINK_GOOD,
      C2CB_axi_c2c_multi_bit_error_out => C2C_MON.C2C(2).STATUS.MB_ERROR,
      C2CB_phy_power_down              => '0',
    --C2CB_PHY_user_clk_out            => clk_C2CB_PHY_user,

      -- START: AXI_PL_SLAVES :: DO NOT EDIT
      FW_INFO_araddr         => FW_INFO_readmosi.address,
      FW_INFO_arprot         => FW_INFO_readmosi.protection_type,
      FW_INFO_arready(0)     => FW_INFO_readmiso.ready_for_address,
      FW_INFO_arvalid(0)     => FW_INFO_readmosi.address_valid,
      FW_INFO_awaddr         => FW_INFO_writemosi.address,
      FW_INFO_awprot         => FW_INFO_writemosi.protection_type,
      FW_INFO_awready(0)     => FW_INFO_writemiso.ready_for_address,
      FW_INFO_awvalid(0)     => FW_INFO_writemosi.address_valid,
      FW_INFO_bready(0)      => FW_INFO_writemosi.ready_for_response,
      FW_INFO_bvalid(0)      => FW_INFO_writemiso.response_valid,
      FW_INFO_bresp          => FW_INFO_writemiso.response,
      FW_INFO_rdata          => FW_INFO_readmiso.data,
      FW_INFO_rready(0)      => FW_INFO_readmosi.ready_for_data,
      FW_INFO_rresp          => FW_INFO_readmiso.response,
      FW_INFO_rvalid(0)      => FW_INFO_readmiso.data_valid,
      FW_INFO_wdata          => FW_INFO_writemosi.data,
      FW_INFO_wready(0)      => FW_INFO_writemiso.ready_for_data,
      FW_INFO_wstrb          => FW_INFO_writemosi.data_write_strobe,
      FW_INFO_wvalid(0)      => FW_INFO_writemosi.data_valid,
      FM_araddr         => FM_readmosi.address,
      FM_arprot         => FM_readmosi.protection_type,
      FM_arready(0)     => FM_readmiso.ready_for_address,
      FM_arvalid(0)     => FM_readmosi.address_valid,
      FM_awaddr         => FM_writemosi.address,
      FM_awprot         => FM_writemosi.protection_type,
      FM_awready(0)     => FM_writemiso.ready_for_address,
      FM_awvalid(0)     => FM_writemosi.address_valid,
      FM_bready(0)      => FM_writemosi.ready_for_response,
      FM_bvalid(0)      => FM_writemiso.response_valid,
      FM_bresp          => FM_writemiso.response,
      FM_rdata          => FM_readmiso.data,
      FM_rready(0)      => FM_readmosi.ready_for_data,
      FM_rresp          => FM_readmiso.response,
      FM_rvalid(0)      => FM_readmiso.data_valid,
      FM_wdata          => FM_writemosi.data,
      FM_wready(0)      => FM_writemiso.ready_for_data,
      FM_wstrb          => FM_writemosi.data_write_strobe,
      FM_wvalid(0)      => FM_writemosi.data_valid,
      CORE_araddr         => CORE_readmosi.address,
      CORE_arprot         => CORE_readmosi.protection_type,
      CORE_arready(0)     => CORE_readmiso.ready_for_address,
      CORE_arvalid(0)     => CORE_readmosi.address_valid,
      CORE_awaddr         => CORE_writemosi.address,
      CORE_awprot         => CORE_writemosi.protection_type,
      CORE_awready(0)     => CORE_writemiso.ready_for_address,
      CORE_awvalid(0)     => CORE_writemosi.address_valid,
      CORE_bready(0)      => CORE_writemosi.ready_for_response,
      CORE_bvalid(0)      => CORE_writemiso.response_valid,
      CORE_bresp          => CORE_writemiso.response,
      CORE_rdata          => CORE_readmiso.data,
      CORE_rready(0)      => CORE_readmosi.ready_for_data,
      CORE_rresp          => CORE_readmiso.response,
      CORE_rvalid(0)      => CORE_readmiso.data_valid,
      CORE_wdata          => CORE_writemosi.data,
      CORE_wready(0)      => CORE_writemiso.ready_for_data,
      CORE_wstrb          => CORE_writemosi.data_write_strobe,
      CORE_wvalid(0)      => CORE_writemosi.data_valid,
      HAL_araddr         => HAL_readmosi.address,
      HAL_arprot         => HAL_readmosi.protection_type,
      HAL_arready(0)     => HAL_readmiso.ready_for_address,
      HAL_arvalid(0)     => HAL_readmosi.address_valid,
      HAL_awaddr         => HAL_writemosi.address,
      HAL_awprot         => HAL_writemosi.protection_type,
      HAL_awready(0)     => HAL_writemiso.ready_for_address,
      HAL_awvalid(0)     => HAL_writemosi.address_valid,
      HAL_bready(0)      => HAL_writemosi.ready_for_response,
      HAL_bvalid(0)      => HAL_writemiso.response_valid,
      HAL_bresp          => HAL_writemiso.response,
      HAL_rdata          => HAL_readmiso.data,
      HAL_rready(0)      => HAL_readmosi.ready_for_data,
      HAL_rresp          => HAL_readmiso.response,
      HAL_rvalid(0)      => HAL_readmiso.data_valid,
      HAL_wdata          => HAL_writemosi.data,
      HAL_wready(0)      => HAL_writemiso.ready_for_data,
      HAL_wstrb          => HAL_writemosi.data_write_strobe,
      HAL_wvalid(0)      => HAL_writemosi.data_valid,
      HOG_araddr         => HOG_readmosi.address,
      HOG_arprot         => HOG_readmosi.protection_type,
      HOG_arready(0)     => HOG_readmiso.ready_for_address,
      HOG_arvalid(0)     => HOG_readmosi.address_valid,
      HOG_awaddr         => HOG_writemosi.address,
      HOG_awprot         => HOG_writemosi.protection_type,
      HOG_awready(0)     => HOG_writemiso.ready_for_address,
      HOG_awvalid(0)     => HOG_writemosi.address_valid,
      HOG_bready(0)      => HOG_writemosi.ready_for_response,
      HOG_bvalid(0)      => HOG_writemiso.response_valid,
      HOG_bresp          => HOG_writemiso.response,
      HOG_rdata          => HOG_readmiso.data,
      HOG_rready(0)      => HOG_readmosi.ready_for_data,
      HOG_rresp          => HOG_readmiso.response,
      HOG_rvalid(0)      => HOG_readmiso.data_valid,
      HOG_wdata          => HOG_writemosi.data,
      HOG_wready(0)      => HOG_writemiso.ready_for_data,
      HOG_wstrb          => HOG_writemosi.data_write_strobe,
      HOG_wvalid(0)      => HOG_writemosi.data_valid,
      -- END: AXI_PL_SLAVES :: DO NOT EDIT

      C2CB_phy_Rx_rxn(0) => c2cb_rxn,   --n_mgt_z2k(2 downto 2),
      C2CB_phy_Rx_rxp(0) => c2cb_rxp,   --p_mgt_z2k(2 downto 2),
      C2CB_phy_Tx_txn(0) => c2cb_txn,   --n_mgt_k2z(2 downto 2),
      C2CB_phy_Tx_txp(0) => c2cb_txp,   --p_mgt_k2z(2 downto 2),

      CM1_PB_UART_rxd => pB_UART_tx,
      CM1_PB_UART_txd => pB_UART_rx,

      C2CB_PHY_DRP_daddr => C2C_Ctrl.C2C(2).DRP.address,
      C2CB_PHY_DRP_den   => C2C_Ctrl.C2C(2).DRP.enable,
      C2CB_PHY_DRP_di    => C2C_Ctrl.C2C(2).DRP.wr_data,
      C2CB_PHY_DRP_do    => C2C_MON.C2C(2).DRP.rd_data,
      C2CB_PHY_DRP_drdy  => C2C_MON.C2C(2).DRP.rd_data_valid,
      C2CB_PHY_DRP_dwe   => C2C_Ctrl.C2C(2).DRP.wr_enable,

      C2C_INTFS_araddr     => c2c_intf_ReadMOSI.address,
      C2C_INTFS_arprot     => c2c_intf_ReadMOSI.protection_type,
      C2C_INTFS_arready(0) => c2c_intf_ReadMISO.ready_for_address,
      C2C_INTFS_arvalid(0) => c2c_intf_ReadMOSI.address_valid,
      C2C_INTFS_awaddr     => c2c_intf_WriteMOSI.address,
      C2C_INTFS_awprot     => c2c_intf_WriteMOSI.protection_type,
      C2C_INTFS_awready(0) => c2c_intf_WriteMISO.ready_for_address,
      C2C_INTFS_awvalid(0) => c2c_intf_WriteMOSI.address_valid,
      C2C_INTFS_bready(0)  => c2c_intf_WriteMOSI.ready_for_response,
      C2C_INTFS_bresp      => c2c_intf_WriteMISO.response,
      C2C_INTFS_bvalid(0)  => c2c_intf_WriteMISO.response_valid,
      C2C_INTFS_rdata      => c2c_intf_ReadMISO.data,
      C2C_INTFS_rready(0)  => c2c_intf_ReadMOSI.ready_for_data,
      C2C_INTFS_rresp      => c2c_intf_ReadMISO.response,
      C2C_INTFS_rvalid(0)  => c2c_intf_ReadMISO.data_valid,
      C2C_INTFS_wdata      => c2c_intf_WriteMOSI.data,
      C2C_INTFS_wready(0)  => c2c_intf_WriteMISO.ready_for_data,
      C2C_INTFS_wstrb      => c2c_intf_WriteMOSI.data_write_strobe,
      C2C_INTFS_wvalid(0)  => c2c_intf_WriteMOSI.data_valid

);


  --------------------------------------------------------------------------------
  -- AXI Interfaces
  --------------------------------------------------------------------------------

  -- START: ULT_SLAVES :: DO NOT EDIT
process (axi_clk) is
begin
 if(rising_edge(axi_clk)) then
   FW_INFO_mon_r <=  FW_INFO_mon; 
 end if;
end process;
  FW_INFO_map_inst : entity ctrl_lib.fw_info_map
    generic map(
     ALLOCATED_MEMORY_RANGE => to_integer(AXI_RANGE_FW_INFO)
    )
    port map(
      clk_axi         => axi_clk,
      reset_axi_n     => axi_reset_n,
      slave_readmosi   => FW_INFO_readmosi,
      slave_readmiso   => FW_INFO_readmiso,
      slave_writemosi   => FW_INFO_writemosi,
      slave_writemiso   => FW_INFO_writemiso,
      mon   => FW_INFO_mon_r
    );
process (axi_clk) is
begin
 if(rising_edge(axi_clk)) then
   FM_mon_r <=  FM_mon; 
 end if;
end process;
  FM_map_inst : entity ctrl_lib.fm_map
    generic map(
     ALLOCATED_MEMORY_RANGE => to_integer(AXI_RANGE_FM)
    )
    port map(
      clk_axi         => axi_clk,
      reset_axi_n     => axi_reset_n,
      slave_readmosi   => FM_readmosi,
      slave_readmiso   => FM_readmiso,
      slave_writemosi   => FM_writemosi,
      slave_writemiso   => FM_writemiso,
      ctrl   => FM_ctrl,
      mon   => FM_mon_r
    );
process (axi_clk) is
begin
 if(rising_edge(axi_clk)) then
   CORE_mon_r <=  CORE_mon; 
   CORE_ctrl  <=  CORE_ctrl_r;
 end if;
end process;
  CORE_map_inst : entity ctrl_lib.core_map
    generic map(
     ALLOCATED_MEMORY_RANGE => to_integer(AXI_RANGE_CORE)
    )
    port map(
      clk_axi         => axi_clk,
      reset_axi_n     => axi_reset_n,
      slave_readmosi   => CORE_readmosi,
      slave_readmiso   => CORE_readmiso,
      slave_writemosi   => CORE_writemosi,
      slave_writemiso   => CORE_writemiso,
      ctrl   => CORE_ctrl_r,
      mon   => CORE_mon_r
    );
process (axi_clk) is
begin
 if(rising_edge(axi_clk)) then
   HAL_mon_r <=  HAL_mon; 
   HAL_ctrl  <=  HAL_ctrl_r;
 end if;
end process;
  HAL_map_inst : entity ctrl_lib.hal_map
    generic map(
     ALLOCATED_MEMORY_RANGE => to_integer(AXI_RANGE_HAL)
    )
    port map(
      clk_axi         => axi_clk,
      reset_axi_n     => axi_reset_n,
      slave_readmosi   => HAL_readmosi,
      slave_readmiso   => HAL_readmiso,
      slave_writemosi   => HAL_writemosi,
      slave_writemiso   => HAL_writemiso,
      ctrl   => HAL_ctrl_r,
      mon   => HAL_mon_r
    );
process (axi_clk) is
begin
 if(rising_edge(axi_clk)) then
   HOG_mon_r <=  HOG_mon; 
 end if;
end process;
  HOG_map_inst : entity ctrl_lib.hog_map
    generic map(
     ALLOCATED_MEMORY_RANGE => to_integer(AXI_RANGE_HOG)
    )
    port map(
      clk_axi         => axi_clk,
      reset_axi_n     => axi_reset_n,
      slave_readmosi   => HOG_readmosi,
      slave_readmiso   => HOG_readmiso,
      slave_writemosi   => HOG_writemosi,
      slave_writemiso   => HOG_writemiso,
      mon   => HOG_mon_r
    );
  -- END: ULT_SLAVES :: DO NOT EDIT

  -- n.b. fast monitoring bram control interfaces can't be registered directly,
  -- since they contain a clock if you ff the record then you create a weird
  -- gated clock that is the ff'd version of itself which would run at 1/2 speed
  -- for each ff stage

  --fm_map_inst : entity ctrl_lib.FM_map
  --  port map (
  --    clk_axi         => clk40,
  --    reset_axi_n     => clk40_rst_n,
  --    slave_readmosi  => fm_readmosi,
  --    slave_readmiso  => fm_readmiso,
  --    slave_writemosi => fm_writemosi,
  --    slave_writemiso => fm_writemiso,

  --    -- monitor signals in
  --    mon  => fm_mon_r,
  --    -- control signals out
  --    Ctrl => fm_ctrl_r
  --    );


  SM_CM_INTF: entity ctrl_lib.C2C_INTF
    generic map (
      ERROR_WAIT_TIME => 90000000,
      ALLOCATED_MEMORY_RANGE => to_integer(AXI_RANGE_C2C_INTFS)
      )
    port map (
      clk_axi          => axi_clk,
      reset_axi_n      => axi_reset_n,
      readMOSI         => c2c_intf_readMOSI,
      readMISO         => c2c_intf_readMISO,
      writeMOSI        => c2c_intf_writeMOSI,
      writeMISO        => c2c_intf_writeMISO,
      clk_C2C(1)       => clk_C2C_PHY_user(1),
      clk_C2C(2)       => clk_C2C_PHY_user(1),
      UART_Rx          => pb_UART_Rx,
      UART_Tx          => pb_UART_Tx,
      Mon              => C2C_Mon,
      Ctrl             => C2C_Ctrl);

end control_arch;

