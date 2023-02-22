----------------------------------------------------------------------------------
-- Company: Max-Planck-Institut fuer Physik - Munich
-- Engineer: Davide Cieri - davide.cieri@cern.ch
--
-- Create Date: 17/02/2023
-- Design Name: L0MDT
-- Module Name: top_control
-- Project Name:
-- Target Devices: KU15P 
-- Tool Versions: 2020.2
-- Description: Template file for top_control module
--
-- Dependencies: hal, ctrl_lib, ieee
--
-- Revision: 1.0
-- Revision 17.02.2023
--
----------------------------------------------------------------------------------


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

--use ctrl_lib.c2cslave_pkg.all;
use ctrl_lib.AXISlaveAddrPkg.all;
use xil_defaultlib.all;

entity top_control is
  port (
    -- axi
    axi_clk : in std_logic;
    clk320  : in std_logic;
    clk40   : in std_logic;
    clkpipe : in std_logic;

    -- system clock
    clk50mhz : in std_logic;
    reset_n  : in std_logic;

    c2c_rxn     : in  std_logic;
    c2c_rxp     : in  std_logic;
    c2c_txn     : out std_logic;
    c2c_txp     : out std_logic;

    c2cb_rxn    : in  std_logic;
    c2cb_rxp    : in  std_logic;
    c2cb_txn    : out std_logic;
    c2cb_txp    : out std_logic;
    
    c2c_refclkp : in  std_logic;
    c2c_refclkn : in  std_logic;

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

  constant std_logic1 : std_logic := '1';
  constant std_logic0 : std_logic := '0';

  signal axi_reset_n : std_logic; -- := '0';
  signal clk40_rst_n : std_logic := '0';

  -- START: ULT_AXI_SIGNALS :: DO NOT EDIT
  -- END: ULT_AXI_SIGNALS :: DO NOT EDIT

  signal c2c_mon  : C2C_INTF_MON_t;
  signal c2c_ctrl : C2C_INTF_CTRL_t;
  signal c2c_intf_readmosi  : axireadmosi;
  signal c2c_intf_readmiso  : axireadmiso;
  signal c2c_intf_writemosi : axiwritemosi;
  signal c2c_intf_writemiso : axiwritemiso;


  signal clk_K_C2C_PHY_user  : STD_logic_vector(2 downto 1);
  
  signal strobe : std_logic;
  attribute MAX_FANOUT : string;
  attribute MAX_FANOUT of strobe : signal is "16";

  signal pB_UART_tx : std_logic;
  signal pB_UART_rx : std_logic;
  
begin

  --clock_strobe_ult : entity hal.clock_strobe
  --  generic map (RATIO => 8)
  --  port map (
  --    fast_clk_i => clkpipe,
  --    slow_clk_i => clk40,
  --    strobe_o   => strobe
  --    );

  ---- hal just runs on 40M, but add a ff for fanout

  --process (clk40) is
  --begin
  --  if (rising_edge(clk40)) then
  --    hal_mon_r <= hal_mon;
  --    hal_ctrl  <= hal_ctrl_r;
  --  end if;
  --end process;

  process (axi_clk) is
  begin
    if (rising_edge(axi_clk)) then
      hal_core_mon_r <= hal_core_mon;     -- inputs
      hal_core_ctrl  <= hal_core_ctrl_r;  -- outputs
    end if;
  end process;

  --process (clkpipe) is
  --begin
  --  if (rising_edge(clkpipe)) then
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
  --process (clkpipe) is
  --begin
  --  if (rising_edge(clkpipe)) then
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
      AXI_CLK                             => AXI_CLK,
      AXI_RST_N(0)                        => AXI_RESET_N,
      clk50Mhz                            => clk50mhz,   


      K_C2C_phy_Rx_rxn(0)                 => c2c_rxn, --n_mgt_z2k(1 downto 1),
      K_C2C_phy_Rx_rxp(0)                 => c2c_rxp, --p_mgt_z2k(1 downto 1),
      K_C2C_phy_Tx_txn(0)                 => c2c_txn, --n_mgt_k2z(1 downto 1),
      K_C2C_phy_Tx_txp(0)                 => c2c_txp, --p_mgt_k2z(1 downto 1),

      K_C2C_phy_refclk_clk_n              => c2c_refclkn, --n_util_clk_chan0,
      K_C2C_phy_refclk_clk_p              => c2c_refclkp, --p_util_clk_chan0,

      reset_n                             => reset_n, --locked_clk200,--reset,
      K_C2C_PHY_DEBUG_cplllock(0)         => C2C_Mon.C2C(1).DEBUG.CPLL_LOCK,
      K_C2C_PHY_DEBUG_dmonitorout         => C2C_Mon.C2C(1).DEBUG.DMONITOR,
      K_C2C_PHY_DEBUG_eyescandataerror(0) => C2C_Mon.C2C(1).DEBUG.EYESCAN_DATA_ERROR,
      
      K_C2C_PHY_DEBUG_eyescanreset(0)     => C2C_Ctrl.C2C(1).DEBUG.EYESCAN_RESET,
      K_C2C_PHY_DEBUG_eyescantrigger(0)   => C2C_Ctrl.C2C(1).DEBUG.EYESCAN_TRIGGER,
      K_C2C_PHY_DEBUG_pcsrsvdin           => C2C_Ctrl.C2C(1).DEBUG.PCS_RSV_DIN,
      K_C2C_PHY_DEBUG_qplllock(0)         =>  C2C_Mon.C2C(1).DEBUG.QPLL_LOCK,
      K_C2C_PHY_DEBUG_rxbufreset(0)       => C2C_Ctrl.C2C(1).DEBUG.RX.BUF_RESET,
      K_C2C_PHY_DEBUG_rxbufstatus         =>  C2C_Mon.C2C(1).DEBUG.RX.BUF_STATUS,
      K_C2C_PHY_DEBUG_rxcdrhold(0)        => C2C_Ctrl.C2C(1).DEBUG.RX.CDR_HOLD,
      K_C2C_PHY_DEBUG_rxdfelpmreset(0)    => C2C_Ctrl.C2C(1).DEBUG.RX.DFE_LPM_RESET,
      K_C2C_PHY_DEBUG_rxlpmen(0)          => C2C_Ctrl.C2C(1).DEBUG.RX.LPM_EN,
      K_C2C_PHY_DEBUG_rxpcsreset(0)       => C2C_Ctrl.C2C(1).DEBUG.RX.PCS_RESET,
      K_C2C_PHY_DEBUG_rxpmareset(0)       => C2C_Ctrl.C2C(1).DEBUG.RX.PMA_RESET,
      K_C2C_PHY_DEBUG_rxpmaresetdone(0)   =>  C2C_Mon.C2C(1).DEBUG.RX.PMA_RESET_DONE,
      K_C2C_PHY_DEBUG_rxprbscntreset(0)   => C2C_Ctrl.C2C(1).DEBUG.RX.PRBS_CNT_RST,
      K_C2C_PHY_DEBUG_rxprbserr(0)        =>  C2C_Mon.C2C(1).DEBUG.RX.PRBS_ERR,
      K_C2C_PHY_DEBUG_rxprbssel           => C2C_Ctrl.C2C(1).DEBUG.RX.PRBS_SEL,
      K_C2C_PHY_DEBUG_rxrate              => C2C_Ctrl.C2C(1).DEBUG.RX.RATE,
      K_C2C_PHY_DEBUG_rxresetdone(0)      =>  C2C_Mon.C2C(1).DEBUG.RX.RESET_DONE,
      K_C2C_PHY_DEBUG_txbufstatus         =>  C2C_Mon.C2C(1).DEBUG.TX.BUF_STATUS,
      K_C2C_PHY_DEBUG_txdiffctrl          => C2C_Ctrl.C2C(1).DEBUG.TX.DIFF_CTRL,
      K_C2C_PHY_DEBUG_txinhibit(0)        => C2C_Ctrl.C2C(1).DEBUG.TX.INHIBIT,
      K_C2C_PHY_DEBUG_txpcsreset(0)       => C2C_Ctrl.C2C(1).DEBUG.TX.PCS_RESET,
      K_C2C_PHY_DEBUG_txpmareset(0)       => C2C_Ctrl.C2C(1).DEBUG.TX.PMA_RESET,
      K_C2C_PHY_DEBUG_txpolarity(0)       => C2C_Ctrl.C2C(1).DEBUG.TX.POLARITY,
      K_C2C_PHY_DEBUG_txpostcursor        => C2C_Ctrl.C2C(1).DEBUG.TX.POST_CURSOR,
      K_C2C_PHY_DEBUG_txprbsforceerr(0)   => C2C_Ctrl.C2C(1).DEBUG.TX.PRBS_FORCE_ERR,
      K_C2C_PHY_DEBUG_txprbssel           => C2C_Ctrl.C2C(1).DEBUG.TX.PRBS_SEL,
      K_C2C_PHY_DEBUG_txprecursor         => C2C_Ctrl.C2C(1).DEBUG.TX.PRE_CURSOR,
      K_C2C_PHY_DEBUG_txresetdone(0)      =>  C2C_MON.C2C(1).DEBUG.TX.RESET_DONE,

      K_C2C_PHY_channel_up         => C2C_Mon.C2C(1).STATUS.CHANNEL_UP,      
      K_C2C_PHY_gt_pll_lock        => C2C_MON.C2C(1).STATUS.PHY_GT_PLL_LOCK,
      K_C2C_PHY_hard_err           => C2C_Mon.C2C(1).STATUS.PHY_HARD_ERR,
      K_C2C_PHY_lane_up(0)         => C2C_Mon.C2C(1).STATUS.PHY_LANE_UP, --(0 downto 0),
      K_C2C_PHY_mmcm_not_locked_out    => C2C_Mon.C2C(1).STATUS.PHY_MMCM_LOL,
      K_C2C_PHY_soft_err           => C2C_Mon.C2C(1).STATUS.PHY_SOFT_ERR,

      K_C2C_aurora_do_cc                =>  C2C_Mon.C2C(1).STATUS.DO_CC,
      K_C2C_aurora_pma_init_in          => C2C_Ctrl.C2C(1).STATUS.INITIALIZE,
      K_C2C_axi_c2c_config_error_out    =>  C2C_Mon.C2C(1).STATUS.CONFIG_ERROR,
      K_C2C_axi_c2c_link_status_out     =>  C2C_MON.C2C(1).STATUS.LINK_GOOD,
      K_C2C_axi_c2c_multi_bit_error_out =>  C2C_MON.C2C(1).STATUS.MB_ERROR,
      K_C2C_phy_power_down              => '0',
      K_C2C_PHY_clk                     => clk_K_C2C_PHY_user(1),
      K_C2C_PHY_DRP_daddr               => C2C_Ctrl.C2C(1).DRP.address,
      K_C2C_PHY_DRP_den                 => C2C_Ctrl.C2C(1).DRP.enable,
      K_C2C_PHY_DRP_di                  => C2C_Ctrl.C2C(1).DRP.wr_data,
      K_C2C_PHY_DRP_do                  => C2C_MON.C2C(1).DRP.rd_data,
      K_C2C_PHY_DRP_drdy                => C2C_MON.C2C(1).DRP.rd_data_valid,
      K_C2C_PHY_DRP_dwe                 => C2C_Ctrl.C2C(1).DRP.wr_enable,
      K_C2CB_PHY_DEBUG_cplllock(0)         => C2C_Mon.C2C(2).DEBUG.CPLL_LOCK,
      K_C2CB_PHY_DEBUG_dmonitorout         => C2C_Mon.C2C(2).DEBUG.DMONITOR,
      K_C2CB_PHY_DEBUG_eyescandataerror(0) => C2C_Mon.C2C(2).DEBUG.EYESCAN_DATA_ERROR,
      
      K_C2CB_PHY_DEBUG_eyescanreset(0)     => C2C_Ctrl.C2C(2).DEBUG.EYESCAN_RESET,
      K_C2CB_PHY_DEBUG_eyescantrigger(0)   => C2C_Ctrl.C2C(2).DEBUG.EYESCAN_TRIGGER,
      K_C2CB_PHY_DEBUG_pcsrsvdin           => C2C_Ctrl.C2C(2).DEBUG.PCS_RSV_DIN,
      K_C2CB_PHY_DEBUG_qplllock(0)         =>  C2C_Mon.C2C(2).DEBUG.QPLL_LOCK,
      K_C2CB_PHY_DEBUG_rxbufreset(0)       => C2C_Ctrl.C2C(2).DEBUG.RX.BUF_RESET,
      K_C2CB_PHY_DEBUG_rxbufstatus         =>  C2C_Mon.C2C(2).DEBUG.RX.BUF_STATUS,
      K_C2CB_PHY_DEBUG_rxcdrhold(0)        => C2C_Ctrl.C2C(2).DEBUG.RX.CDR_HOLD,
      K_C2CB_PHY_DEBUG_rxdfelpmreset(0)    => C2C_Ctrl.C2C(2).DEBUG.RX.DFE_LPM_RESET,
      K_C2CB_PHY_DEBUG_rxlpmen(0)          => C2C_Ctrl.C2C(2).DEBUG.RX.LPM_EN,
      K_C2CB_PHY_DEBUG_rxpcsreset(0)       => C2C_Ctrl.C2C(2).DEBUG.RX.PCS_RESET,
      K_C2CB_PHY_DEBUG_rxpmareset(0)       => C2C_Ctrl.C2C(2).DEBUG.RX.PMA_RESET,
      K_C2CB_PHY_DEBUG_rxpmaresetdone(0)   =>  C2C_Mon.C2C(2).DEBUG.RX.PMA_RESET_DONE,
      K_C2CB_PHY_DEBUG_rxprbscntreset(0)   => C2C_Ctrl.C2C(2).DEBUG.RX.PRBS_CNT_RST,
      K_C2CB_PHY_DEBUG_rxprbserr(0)        =>  C2C_Mon.C2C(2).DEBUG.RX.PRBS_ERR,
      K_C2CB_PHY_DEBUG_rxprbssel           => C2C_Ctrl.C2C(2).DEBUG.RX.PRBS_SEL,
      K_C2CB_PHY_DEBUG_rxrate              => C2C_Ctrl.C2C(2).DEBUG.RX.RATE,
      K_C2CB_PHY_DEBUG_rxresetdone(0)      =>  C2C_Mon.C2C(2).DEBUG.RX.RESET_DONE,
      K_C2CB_PHY_DEBUG_txbufstatus         =>  C2C_Mon.C2C(2).DEBUG.TX.BUF_STATUS,
      K_C2CB_PHY_DEBUG_txdiffctrl          => C2C_Ctrl.C2C(2).DEBUG.TX.DIFF_CTRL,
      K_C2CB_PHY_DEBUG_txinhibit(0)        => C2C_Ctrl.C2C(2).DEBUG.TX.INHIBIT,
      K_C2CB_PHY_DEBUG_txpcsreset(0)       => C2C_Ctrl.C2C(2).DEBUG.TX.PCS_RESET,
      K_C2CB_PHY_DEBUG_txpmareset(0)       => C2C_Ctrl.C2C(2).DEBUG.TX.PMA_RESET,
      K_C2CB_PHY_DEBUG_txpolarity(0)       => C2C_Ctrl.C2C(2).DEBUG.TX.POLARITY,
      K_C2CB_PHY_DEBUG_txpostcursor        => C2C_Ctrl.C2C(2).DEBUG.TX.POST_CURSOR,
      K_C2CB_PHY_DEBUG_txprbsforceerr(0)   => C2C_Ctrl.C2C(2).DEBUG.TX.PRBS_FORCE_ERR,
      K_C2CB_PHY_DEBUG_txprbssel           => C2C_Ctrl.C2C(2).DEBUG.TX.PRBS_SEL,
      K_C2CB_PHY_DEBUG_txprecursor         => C2C_Ctrl.C2C(2).DEBUG.TX.PRE_CURSOR,
      K_C2CB_PHY_DEBUG_txresetdone(0)      =>  C2C_MON.C2C(2).DEBUG.TX.RESET_DONE,

      K_C2CB_PHY_channel_up         => C2C_Mon.C2C(2).STATUS.CHANNEL_UP,      
      K_C2CB_PHY_gt_pll_lock        => C2C_MON.C2C(2).STATUS.PHY_GT_PLL_LOCK,
      K_C2CB_PHY_hard_err           => C2C_Mon.C2C(2).STATUS.PHY_HARD_ERR,
      K_C2CB_PHY_lane_up(0)            => C2C_Mon.C2C(2).STATUS.PHY_LANE_UP, --(0 downto 0),
--      K_C2CB_PHY_mmcm_not_locked    => C2C_Mon.C2C(2).STATUS.PHY_MMCM_LOL,
      K_C2CB_PHY_soft_err           => C2C_Mon.C2C(2).STATUS.PHY_SOFT_ERR,

      K_C2CB_aurora_do_cc                =>  C2C_Mon.C2C(2).STATUS.DO_CC,
      K_C2CB_aurora_pma_init_in          => C2C_Ctrl.C2C(2).STATUS.INITIALIZE,
      K_C2CB_axi_c2c_config_error_out    =>  C2C_Mon.C2C(2).STATUS.CONFIG_ERROR,
      K_C2CB_axi_c2c_link_status_out     =>  C2C_MON.C2C(2).STATUS.LINK_GOOD,
      K_C2CB_axi_c2c_multi_bit_error_out =>  C2C_MON.C2C(2).STATUS.MB_ERROR,
      K_C2CB_phy_power_down              => '0',
--      K_C2CB_PHY_user_clk_out            => clk_K_C2CB_PHY_user,

      -- START: AXI_PL_SLAVES :: DO NOT EDIT
      -- END: AXI_PL_SLAVES :: DO NOT EDIT
       
      K_C2CB_phy_Rx_rxn(0)                => c2cb_rxn, --n_mgt_z2k(2 downto 2),
      K_C2CB_phy_Rx_rxp(0)                => c2cb_rxp, --p_mgt_z2k(2 downto 2),
      K_C2CB_phy_Tx_txn(0)                => c2cb_txn, --n_mgt_k2z(2 downto 2),
      K_C2CB_phy_Tx_txp(0)                => c2cb_txp, --p_mgt_k2z(2 downto 2),

      CM1_PB_UART_rxd                     => pB_UART_tx,
      CM1_PB_UART_txd                     => pB_UART_rx,

      K_C2CB_PHY_DRP_daddr               => C2C_Ctrl.C2C(2).DRP.address,
      K_C2CB_PHY_DRP_den                 => C2C_Ctrl.C2C(2).DRP.enable,
      K_C2CB_PHY_DRP_di                  => C2C_Ctrl.C2C(2).DRP.wr_data,
      K_C2CB_PHY_DRP_do                  => C2C_MON.C2C(2).DRP.rd_data,
      K_C2CB_PHY_DRP_drdy                => C2C_MON.C2C(2).DRP.rd_data_valid,
      K_C2CB_PHY_DRP_dwe                 => C2C_Ctrl.C2C(2).DRP.wr_enable
      

);


  --------------------------------------------------------------------------------
  -- AXI Interfaces
  --------------------------------------------------------------------------------

  hal_core_map_inst : entity ctrl_lib.HAL_CORE_map
    port map (
      clk_axi         => axi_clk,
      reset_axi_n     => axi_reset_n,
      slave_readmosi  => hal_core_readmosi,
      slave_readmiso  => hal_core_readmiso,
      slave_writemosi => hal_core_writemosi,
      slave_writemiso => hal_core_writemiso,

      -- monitor signals in
      mon  => hal_core_mon_r,
      -- control signals out
      ctrl => hal_core_ctrl_r
      );

  --hal_map_inst : entity ctrl_lib.HAL_map
  --  port map (
  --    clk_axi         => axi_clk,
  --    reset_axi_n     => axi_reset_n,
  --    slave_readmosi  => hal_readmosi,
  --    slave_readmiso  => hal_readmiso,
  --    slave_writemosi => hal_writemosi,
  --    slave_writemiso => hal_writemiso,

  --    -- monitor signals in
  --    mon  => hal_mon_r,
  --    -- control signals out
  --    ctrl => hal_ctrl_r
  --    );

  -- START: ULT_SLAVES :: DO NOT EDIT
    hps_inn_map_inst : entity ctrl_lib.hps_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => hps_inn_readmosi,
      slave_readmiso  => hps_inn_readmiso,
      slave_writemosi => hps_inn_writemosi,
      slave_writemiso => hps_inn_writemiso,
      -- monitor signals in
      mon  => hps_inn_mon_r,
      -- control signals out
      ctrl => hps_inn_ctrl_r
      );

    hps_mid_map_inst : entity ctrl_lib.hps_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => hps_mid_readmosi,
      slave_readmiso  => hps_mid_readmiso,
      slave_writemosi => hps_mid_writemosi,
      slave_writemiso => hps_mid_writemiso,
      -- monitor signals in
      mon  => hps_mid_mon_r,
      -- control signals out
      ctrl => hps_mid_ctrl_r
      );

    hps_out_map_inst : entity ctrl_lib.hps_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => hps_out_readmosi,
      slave_readmiso  => hps_out_readmiso,
      slave_writemosi => hps_out_writemosi,
      slave_writemiso => hps_out_writemiso,
      -- monitor signals in
      mon  => hps_out_mon_r,
      -- control signals out
      ctrl => hps_out_ctrl_r
      );

    hps_ext_map_inst : entity ctrl_lib.hps_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => hps_ext_readmosi,
      slave_readmiso  => hps_ext_readmiso,
      slave_writemosi => hps_ext_writemosi,
      slave_writemiso => hps_ext_writemiso,
      -- monitor signals in
      mon  => hps_ext_mon_r,
      -- control signals out
      ctrl => hps_ext_ctrl_r
      );

    tar_inn_map_inst : entity ctrl_lib.tar_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => tar_inn_readmosi,
      slave_readmiso  => tar_inn_readmiso,
      slave_writemosi => tar_inn_writemosi,
      slave_writemiso => tar_inn_writemiso,
      -- monitor signals in
      mon  => tar_inn_mon_r,
      -- control signals out
      ctrl => tar_inn_ctrl_r
      );

    tar_mid_map_inst : entity ctrl_lib.tar_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => tar_mid_readmosi,
      slave_readmiso  => tar_mid_readmiso,
      slave_writemosi => tar_mid_writemosi,
      slave_writemiso => tar_mid_writemiso,
      -- monitor signals in
      mon  => tar_mid_mon_r,
      -- control signals out
      ctrl => tar_mid_ctrl_r
      );

    tar_out_map_inst : entity ctrl_lib.tar_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => tar_out_readmosi,
      slave_readmiso  => tar_out_readmiso,
      slave_writemosi => tar_out_writemosi,
      slave_writemiso => tar_out_writemiso,
      -- monitor signals in
      mon  => tar_out_mon_r,
      -- control signals out
      ctrl => tar_out_ctrl_r
      );

    tar_ext_map_inst : entity ctrl_lib.tar_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => tar_ext_readmosi,
      slave_readmiso  => tar_ext_readmiso,
      slave_writemosi => tar_ext_writemosi,
      slave_writemiso => tar_ext_writemiso,
      -- monitor signals in
      mon  => tar_ext_mon_r,
      -- control signals out
      ctrl => tar_ext_ctrl_r
      );

    mtc_map_inst : entity ctrl_lib.mtc_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => mtc_readmosi,
      slave_readmiso  => mtc_readmiso,
      slave_writemosi => mtc_writemosi,
      slave_writemiso => mtc_writemiso,
      -- monitor signals in
      mon  => mtc_mon_r,
      -- control signals out
      ctrl => mtc_ctrl_r
      );

    ucm_map_inst : entity ctrl_lib.ucm_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => ucm_readmosi,
      slave_readmiso  => ucm_readmiso,
      slave_writemosi => ucm_writemosi,
      slave_writemiso => ucm_writemiso,
      -- monitor signals in
      mon  => ucm_mon_r,
      -- control signals out
      ctrl => ucm_ctrl_r
      );

    daq_map_inst : entity ctrl_lib.daq_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => daq_readmosi,
      slave_readmiso  => daq_readmiso,
      slave_writemosi => daq_writemosi,
      slave_writemiso => daq_writemiso,
      -- monitor signals in
      mon  => daq_mon_r,
      -- control signals out
      ctrl => daq_ctrl_r
      );

    tf_map_inst : entity ctrl_lib.tf_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => tf_readmosi,
      slave_readmiso  => tf_readmiso,
      slave_writemosi => tf_writemosi,
      slave_writemiso => tf_writemiso,
      -- monitor signals in
      mon  => tf_mon_r,
      -- control signals out
      ctrl => tf_ctrl_r
      );

    mpl_map_inst : entity ctrl_lib.mpl_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => mpl_readmosi,
      slave_readmiso  => mpl_readmiso,
      slave_writemosi => mpl_writemosi,
      slave_writemiso => mpl_writemiso,
      -- monitor signals in
      mon  => mpl_mon_r,
      -- control signals out
      ctrl => mpl_ctrl_r
      );

    hog_map_inst : entity ctrl_lib.hog_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => hog_readmosi,
      slave_readmiso  => hog_readmiso,
      slave_writemosi => hog_writemosi,
      slave_writemiso => hog_writemiso,
      -- monitor signals in
      mon  => hog_mon_r
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

  --fw_info_map_inst : entity ctrl_lib.fw_info_map
  --  generic map (
  --   ALLOCATED_MEMORY_RANGE => to_integer(AXI_RANGE_K_CM_FW_INFO)
  --   )
  --  port map (
  --    clk_axi         => axi_clk,
  --    reset_axi_n     => axi_reset_n,
  --    slave_readmosi  => fw_info_readmosi,
  --    slave_readmiso  => fw_info_readmiso,
  --    slave_writemosi => fw_info_writemosi,
  --    slave_writemiso => fw_info_writemiso,

  --    mon => fw_info_mon

  --    );

  SM_CM_INTF: entity ctrl_lib.C2C_INTF
    generic map (
      ERROR_WAIT_TIME => 90000000,
      ALLOCATED_MEMORY_RANGE => to_integer(AXI_RANGE_K_C2C_INTF)
      )
    port map (
      clk_axi          => AXI_CLK,
      reset_axi_n      => AXI_RESET_N,
      readMOSI         => c2c_intf_readMOSI,
      readMISO         => c2c_intf_readMISO,
      writeMOSI        => c2c_intf_writeMOSI,
      writeMISO        => c2c_intf_writeMISO,
      clk_C2C(1)       => clk_K_C2C_PHY_user(1),
      clk_C2C(2)       => clk_K_C2C_PHY_user(1),
      UART_Rx          => pb_UART_Rx,
      UART_Tx          => pb_UART_Tx,
      Mon              => C2C_Mon,
      Ctrl             => C2C_Ctrl);

end control_arch;

-- Local Variables:
-- eval: (make-variable-buffer-local 'after-save-hook)
-- eval: (add-hook 'after-save-hook (lambda () (progn (start-process "update-slaves" nil "python" "update_control.py") (revert-buffer))) nil 'local)
-- End:
