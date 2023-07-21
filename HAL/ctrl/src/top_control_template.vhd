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
