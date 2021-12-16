-- TODO: generate this file from a template
-- it is so tedious to update manually...
-- it can use the slaves.yml

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library xil_defaultlib;

library ctrl_lib;
use ctrl_lib.FW_INFO_CTRL.all;
use ctrl_lib.HAL_CORE_CTRL.all;
use ctrl_lib.HAL_CTRL.all;
use ctrl_lib.HPS_CTRL.all;
use ctrl_lib.TAR_CTRL.all;
use ctrl_lib.MTC_CTRL.all;
use ctrl_lib.UCM_CTRL.all;
use ctrl_lib.DAQ_CTRL.all;
use ctrl_lib.TF_CTRL.all;
use ctrl_lib.MPL_CTRL.all;
use ctrl_lib.FM_CTRL.all;

--use ctrl_lib.FW_TIMESTAMP.all;
--use ctrl_lib.FW_VERSION.all;
use ctrl_lib.axiRegPkg.all;

use ctrl_lib.c2cslave_pkg.all;

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
    c2c_refclkp : in  std_logic;
    c2c_refclkn : in  std_logic;

    -- control

    hps_inn_ctrl : out HPS_CTRL_t;
    hps_inn_mon  : in  HPS_MON_t;

    hps_mid_ctrl : out HPS_CTRL_t;
    hps_mid_mon  : in  HPS_MON_t;

    hps_out_ctrl : out HPS_CTRL_t;
    hps_out_mon  : in  HPS_MON_t;

    hps_ext_ctrl : out HPS_CTRL_t;
    hps_ext_mon  : in  HPS_MON_t;

    tar_inn_ctrl : out TAR_CTRL_t;
    tar_inn_mon  : in  TAR_MON_t;

    tar_mid_ctrl : out TAR_CTRL_t;
    tar_mid_mon  : in  TAR_MON_t;

    tar_out_ctrl : out TAR_CTRL_t;
    tar_out_mon  : in  TAR_MON_t;

    tar_ext_ctrl : out TAR_CTRL_t;
    tar_ext_mon  : in  TAR_MON_t;

    mtc_ctrl : out MTC_CTRL_t;
    mtc_mon  : in  MTC_MON_t;

    ucm_ctrl : out UCM_CTRL_t;
    ucm_mon  : in  UCM_MON_t;

    daq_ctrl : out DAQ_CTRL_t;
    daq_mon  : in  DAQ_MON_t;

    tf_ctrl : out TF_CTRL_t;
    tf_mon  : in  TF_MON_t;

    mpl_ctrl : out MPL_CTRL_t;
    mpl_mon  : in  MPL_MON_t;

    hal_mon  : in  HAL_MON_t;
    hal_ctrl : out HAL_CTRL_t;

    hal_core_mon  : in  HAL_CORE_MON_t;
    hal_core_ctrl : out HAL_CORE_CTRL_t;

    fw_info_mon : in FW_INFO_MON_t;

    fm_mon  : in  FM_MON_t;
    fm_ctrl : out FM_CTRL_t;

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

  signal axi_reset_n : std_logic := '0';

  signal fw_info_readmosi  : axireadmosi;
  signal fw_info_readmiso  : axireadmiso;
  signal fw_info_writemosi : axiwritemosi;
  signal fw_info_writemiso : axiwritemiso;

  signal hal_core_readmosi  : axireadmosi;
  signal hal_core_readmiso  : axireadmiso;
  signal hal_core_writemosi : axiwritemosi;
  signal hal_core_writemiso : axiwritemiso;

  signal hal_readmosi  : axireadmosi;
  signal hal_readmiso  : axireadmiso;
  signal hal_writemosi : axiwritemosi;
  signal hal_writemiso : axiwritemiso;

  signal hps_inn_readmosi  : axireadmosi;
  signal hps_inn_readmiso  : axireadmiso;
  signal hps_inn_writemosi : axiwritemosi;
  signal hps_inn_writemiso : axiwritemiso;

  signal hps_mid_readmosi  : axireadmosi;
  signal hps_mid_readmiso  : axireadmiso;
  signal hps_mid_writemosi : axiwritemosi;
  signal hps_mid_writemiso : axiwritemiso;

  signal hps_out_readmosi  : axireadmosi;
  signal hps_out_readmiso  : axireadmiso;
  signal hps_out_writemosi : axiwritemosi;
  signal hps_out_writemiso : axiwritemiso;

  signal hps_ext_readmosi  : axireadmosi;
  signal hps_ext_readmiso  : axireadmiso;
  signal hps_ext_writemosi : axiwritemosi;
  signal hps_ext_writemiso : axiwritemiso;

  signal mtc_readmosi  : axireadmosi;
  signal mtc_readmiso  : axireadmiso;
  signal mtc_writemosi : axiwritemosi;
  signal mtc_writemiso : axiwritemiso;

  signal tf_readmosi  : axireadmosi;
  signal tf_readmiso  : axireadmiso;
  signal tf_writemosi : axiwritemosi;
  signal tf_writemiso : axiwritemiso;

  signal ucm_readmosi  : axireadmosi;
  signal ucm_readmiso  : axireadmiso;
  signal ucm_writemosi : axiwritemosi;
  signal ucm_writemiso : axiwritemiso;

  signal daq_readmosi  : axireadmosi;
  signal daq_readmiso  : axireadmiso;
  signal daq_writemosi : axiwritemosi;
  signal daq_writemiso : axiwritemiso;

  signal tar_inn_readmosi  : axireadmosi;
  signal tar_inn_readmiso  : axireadmiso;
  signal tar_inn_writemosi : axiwritemosi;
  signal tar_inn_writemiso : axiwritemiso;

  signal tar_mid_readmosi  : axireadmosi;
  signal tar_mid_readmiso  : axireadmiso;
  signal tar_mid_writemosi : axiwritemosi;
  signal tar_mid_writemiso : axiwritemiso;

  signal tar_out_readmosi  : axireadmosi;
  signal tar_out_readmiso  : axireadmiso;
  signal tar_out_writemosi : axiwritemosi;
  signal tar_out_writemiso : axiwritemiso;

  signal tar_ext_readmosi  : axireadmosi;
  signal tar_ext_readmiso  : axireadmiso;
  signal tar_ext_writemosi : axiwritemosi;
  signal tar_ext_writemiso : axiwritemiso;

  signal mpl_readmosi  : axireadmosi;
  signal mpl_readmiso  : axireadmiso;
  signal mpl_writemosi : axiwritemosi;
  signal mpl_writemiso : axiwritemiso;

  signal fm_readmosi  : axireadmosi;
  signal fm_readmiso  : axireadmiso;
  signal fm_writemosi : axiwritemosi;
  signal fm_writemiso : axiwritemiso;

  signal hps_inn_ctrl_r, hps_inn_ctrl_rr : HPS_CTRL_t;
  signal hps_mid_ctrl_r, hps_mid_ctrl_rr : HPS_CTRL_t;
  signal hps_out_ctrl_r, hps_out_ctrl_rr : HPS_CTRL_t;
  signal hps_ext_ctrl_r, hps_ext_ctrl_rr : HPS_CTRL_t;

  signal tar_inn_ctrl_r, tar_inn_ctrl_rr : TAR_CTRL_t;
  signal tar_mid_ctrl_r, tar_mid_ctrl_rr : TAR_CTRL_t;
  signal tar_out_ctrl_r, tar_out_ctrl_rr : TAR_CTRL_t;
  signal tar_ext_ctrl_r, tar_ext_ctrl_rr : TAR_CTRL_t;

  signal mtc_ctrl_r, mtc_ctrl_rr           : MTC_CTRL_t;
  signal ucm_ctrl_r, ucm_ctrl_rr           : UCM_CTRL_t;
  signal daq_ctrl_r, daq_ctrl_rr           : DAQ_CTRL_t;
  signal tf_ctrl_r, tf_ctrl_rr             : TF_CTRL_t;
  signal mpl_ctrl_r, mpl_ctrl_rr           : MPL_CTRL_t;
  signal hal_ctrl_r, hal_ctrl_rr           : HAL_CTRL_t;
  signal hal_core_ctrl_r, hal_core_ctrl_rr : HAL_CORE_CTRL_t;

  signal hps_inn_mon_r, hps_inn_mon_rr : HPS_MON_t;
  signal hps_mid_mon_r, hps_mid_mon_rr : HPS_MON_t;
  signal hps_out_mon_r, hps_out_mon_rr : HPS_MON_t;
  signal hps_ext_mon_r, hps_ext_mon_rr : HPS_MON_t;

  signal tar_inn_mon_r, tar_inn_mon_rr : TAR_MON_t;
  signal tar_mid_mon_r, tar_mid_mon_rr : TAR_MON_t;
  signal tar_out_mon_r, tar_out_mon_rr : TAR_MON_t;
  signal tar_ext_mon_r, tar_ext_mon_rr : TAR_MON_t;

  signal mtc_mon_r, mtc_mon_rr           : MTC_MON_t;
  signal ucm_mon_r, ucm_mon_rr           : UCM_MON_t;
  signal daq_mon_r, daq_mon_rr           : DAQ_MON_t;
  signal tf_mon_r, tf_mon_rr             : TF_MON_t;
  signal mpl_mon_r, mpl_mon_rr           : MPL_MON_t;
  signal hal_mon_r, hal_mon_rr           : HAL_MON_t;
  signal hal_core_mon_r, hal_core_mon_rr : HAL_CORE_MON_t;
  signal fm_mon_r, fm_mon_rr             : FM_MON_t;

  attribute async_reg : string;

  attribute async_reg of
    hps_inn_mon_r, hps_mid_mon_r, hps_out_mon_r, hps_ext_mon_r,
    tar_inn_mon_r, tar_mid_mon_r, tar_out_mon_r, tar_ext_mon_r,
    mtc_mon_r, ucm_mon_r, daq_mon_r, tf_mon_r,
    mpl_mon_r, hal_mon_r, hal_core_mon_r, fm_mon_r
    : signal is "true";

  attribute async_reg of
    hps_inn_ctrl_rr, hps_mid_ctrl_rr, hps_out_ctrl_rr, hps_ext_ctrl_rr,
    tar_inn_ctrl_rr, tar_mid_ctrl_rr, tar_out_ctrl_rr, tar_ext_ctrl_rr,
    mtc_ctrl_rr, ucm_ctrl_rr, daq_ctrl_rr, tf_ctrl_rr,
    mpl_ctrl_rr, hal_ctrl_rr, hal_core_ctrl_rr
    : signal is "true";

begin

  process (clk40) is
  begin
    if (rising_edge(clk40)) then
      -- inputs

      hps_inn_mon_r <= hps_inn_mon;
      hps_mid_mon_r <= hps_mid_mon;
      hps_out_mon_r <= hps_out_mon;
      hps_ext_mon_r <= hps_ext_mon;

      tar_inn_mon_r <= tar_inn_mon;
      tar_mid_mon_r <= tar_mid_mon;
      tar_out_mon_r <= tar_out_mon;
      tar_ext_mon_r <= tar_ext_mon;

      mtc_mon_r <= mtc_mon;
      ucm_mon_r <= ucm_mon;
      daq_mon_r <= daq_mon;
      tf_mon_r  <= tf_mon;
      mpl_mon_r <= mpl_mon;
      hal_mon_r <= hal_mon;
      fm_mon_r  <= fm_mon;

      hps_inn_mon_rr <= hps_inn_mon_r;
      hps_mid_mon_rr <= hps_mid_mon_r;
      hps_out_mon_rr <= hps_out_mon_r;
      hps_ext_mon_rr <= hps_ext_mon_r;

      tar_inn_mon_rr <= tar_inn_mon_r;
      tar_mid_mon_rr <= tar_mid_mon_r;
      tar_out_mon_rr <= tar_out_mon_r;
      tar_ext_mon_rr <= tar_ext_mon_r;

      mtc_mon_rr <= mtc_mon_r;
      ucm_mon_rr <= ucm_mon_r;
      daq_mon_rr <= daq_mon_r;
      tf_mon_rr  <= tf_mon_r;
      mpl_mon_rr <= mpl_mon_r;
      hal_mon_rr <= hal_mon_r;
      fm_mon_rr  <= fm_mon_r;

      -- outputs
      hps_inn_ctrl <= hps_inn_ctrl_rr;
      hps_mid_ctrl <= hps_mid_ctrl_rr;
      hps_out_ctrl <= hps_out_ctrl_rr;
      hps_ext_ctrl <= hps_ext_ctrl_rr;

      tar_inn_ctrl <= tar_inn_ctrl_rr;
      tar_mid_ctrl <= tar_mid_ctrl_rr;
      tar_out_ctrl <= tar_out_ctrl_rr;
      tar_ext_ctrl <= tar_ext_ctrl_rr;

      mtc_ctrl <= mtc_ctrl_rr;
      ucm_ctrl <= ucm_ctrl_rr;
      daq_ctrl <= daq_ctrl_rr;
      tf_ctrl  <= tf_ctrl_rr;
      mpl_ctrl <= mpl_ctrl_rr;
      hal_ctrl <= hal_ctrl_rr;

      hps_inn_ctrl_rr <= hps_inn_ctrl_r;
      hps_mid_ctrl_rr <= hps_mid_ctrl_r;
      hps_out_ctrl_rr <= hps_out_ctrl_r;
      hps_ext_ctrl_rr <= hps_ext_ctrl_r;

      tar_inn_ctrl_rr <= tar_inn_ctrl_r;
      tar_mid_ctrl_rr <= tar_mid_ctrl_r;
      tar_out_ctrl_rr <= tar_out_ctrl_r;
      tar_ext_ctrl_rr <= tar_ext_ctrl_r;

      mtc_ctrl_rr <= mtc_ctrl_r;
      ucm_ctrl_rr <= ucm_ctrl_r;
      daq_ctrl_rr <= daq_ctrl_r;
      tf_ctrl_rr  <= tf_ctrl_r;
      mpl_ctrl_rr <= mpl_ctrl_r;
      hal_ctrl_rr <= hal_ctrl_r;

    end if;
  end process;

  process (axi_clk) is
  begin
    if (rising_edge(axi_clk)) then

      -- inputs
      hal_core_mon_r  <= hal_core_mon;
      hal_core_mon_rr <= hal_core_mon_r;

      -- outputs
      hal_core_ctrl    <= hal_core_ctrl_rr;
      hal_core_ctrl_rr <= hal_core_ctrl_r;

    end if;
  end process;

  c2cslave_wrapper_inst : c2cSlave
    port map (

      -- axi clock and reset
      axi_clk   => axi_clk,
      clk40     => clk40,
      --clkpipe      => clkpipe,
      axi_rst_n => axi_reset_n,

      -- system clock and reset
      clk50mhz => clk50mhz,
      reset_n  => reset_n,

      --------------------------------------------------------------------------------
      -- C2C
      --------------------------------------------------------------------------------

      -- physical link
      k_c2clink_phy_rx_rxn       => c2c_rxn,      -- k_c2clink_phy_rx_rxn,
      k_c2clink_phy_rx_rxp       => c2c_rxp,      -- k_c2clink_phy_rx_rxp,
      k_c2clink_phy_tx_txn       => c2c_txn,      -- k_c2clink_phy_tx_txn,
      k_c2clink_phy_tx_txp       => c2c_txp,      -- k_c2clink_phy_tx_txp,
      k_c2clink_phy_refclk_clk_n => c2c_refclkn,  -- k_c2clink_phy_refclk_clk_n,
      k_c2clink_phy_refclk_clk_p => c2c_refclkp,  -- k_c2clink_phy_refclk_clk_p,

      -- status outputs
      k_c2clink_phy_gt_pll_lock             => open,  -- k_c2clink_phy_gt_pll_lock,
      k_c2clink_phy_hard_err                => open,  -- k_c2clink_phy_hard_err,
      k_c2clink_phy_lane_up                 => open,  -- k_c2clink_phy_lane_up,
      k_c2clink_phy_link_reset_out          => open,  -- k_c2clink_phy_link_reset_out,
      k_c2clink_phy_mmcm_not_locked_out     => open,  -- k_c2clink_phy_mmcm_not_locked_out,
      k_c2clink_phy_soft_err                => open,  -- k_c2clink_phy_soft_err,
      k_c2clink_axi_c2c_config_error_out    => open,  -- k_c2clink_axi_c2c_config_error_out,
      k_c2clink_axi_c2c_link_status_out     => open,  -- k_c2clink_axi_c2c_link_status_out,
      k_c2clink_axi_c2c_multi_bit_error_out => open,  -- k_c2clink_axi_c2c_multi_bit_error_out,
      k_c2clink_aurora_do_cc                => open,  -- k_c2clink_aurora_do_cc,

      -- control inputs
      k_c2clink_phy_power_down => std_logic0,  -- k_c2clink_phy_power_down,

      -- AXI PL Slaves

      fw_info_araddr  => fw_info_readmosi.address,
      fw_info_arprot  => fw_info_readmosi.protection_type,
      fw_info_arready => fw_info_readmiso.ready_for_address,
      fw_info_arvalid => fw_info_readmosi.address_valid,
      fw_info_awaddr  => fw_info_writemosi.address,
      fw_info_awprot  => fw_info_writemosi.protection_type,
      fw_info_awready => fw_info_writemiso.ready_for_address,
      fw_info_awvalid => fw_info_writemosi.address_valid,
      fw_info_bready  => fw_info_writemosi.ready_for_response,
      fw_info_bresp   => fw_info_writemiso.response,
      fw_info_bvalid  => fw_info_writemiso.response_valid,
      fw_info_rdata   => fw_info_readmiso.data,
      fw_info_rready  => fw_info_readmosi.ready_for_data,
      fw_info_rresp   => fw_info_readmiso.response,
      fw_info_rvalid  => fw_info_readmiso.data_valid,
      fw_info_wdata   => fw_info_writemosi.data,
      fw_info_wready  => fw_info_writemiso.ready_for_data,
      fw_info_wstrb   => fw_info_writemosi.data_write_strobe,
      fw_info_wvalid  => fw_info_writemosi.data_valid,

      hal_araddr  => hal_readmosi.address,
      hal_arprot  => hal_readmosi.protection_type,
      hal_arready => hal_readmiso.ready_for_address,
      hal_arvalid => hal_readmosi.address_valid,
      hal_awaddr  => hal_writemosi.address,
      hal_awprot  => hal_writemosi.protection_type,
      hal_awready => hal_writemiso.ready_for_address,
      hal_awvalid => hal_writemosi.address_valid,
      hal_bready  => hal_writemosi.ready_for_response,
      hal_bresp   => hal_writemiso.response,
      hal_bvalid  => hal_writemiso.response_valid,
      hal_rdata   => hal_readmiso.data,
      hal_rready  => hal_readmosi.ready_for_data,
      hal_rresp   => hal_readmiso.response,
      hal_rvalid  => hal_readmiso.data_valid,
      hal_wdata   => hal_writemosi.data,
      hal_wready  => hal_writemiso.ready_for_data,
      hal_wstrb   => hal_writemosi.data_write_strobe,
      hal_wvalid  => hal_writemosi.data_valid,

      hal_core_araddr  => hal_core_readmosi.address,
      hal_core_arprot  => hal_core_readmosi.protection_type,
      hal_core_arready => hal_core_readmiso.ready_for_address,
      hal_core_arvalid => hal_core_readmosi.address_valid,
      hal_core_awaddr  => hal_core_writemosi.address,
      hal_core_awprot  => hal_core_writemosi.protection_type,
      hal_core_awready => hal_core_writemiso.ready_for_address,
      hal_core_awvalid => hal_core_writemosi.address_valid,
      hal_core_bready  => hal_core_writemosi.ready_for_response,
      hal_core_bresp   => hal_core_writemiso.response,
      hal_core_bvalid  => hal_core_writemiso.response_valid,
      hal_core_rdata   => hal_core_readmiso.data,
      hal_core_rready  => hal_core_readmosi.ready_for_data,
      hal_core_rresp   => hal_core_readmiso.response,
      hal_core_rvalid  => hal_core_readmiso.data_valid,
      hal_core_wdata   => hal_core_writemosi.data,
      hal_core_wready  => hal_core_writemiso.ready_for_data,
      hal_core_wstrb   => hal_core_writemosi.data_write_strobe,
      hal_core_wvalid  => hal_core_writemosi.data_valid,

      --------------------------------------------------------------------------------
      -- User Logic
      --------------------------------------------------------------------------------

      hps_inn_araddr  => hps_inn_readmosi.address,
      hps_inn_arprot  => hps_inn_readmosi.protection_type,
      hps_inn_arready => hps_inn_readmiso.ready_for_address,
      hps_inn_arvalid => hps_inn_readmosi.address_valid,
      hps_inn_awaddr  => hps_inn_writemosi.address,
      hps_inn_awprot  => hps_inn_writemosi.protection_type,
      hps_inn_awready => hps_inn_writemiso.ready_for_address,
      hps_inn_awvalid => hps_inn_writemosi.address_valid,
      hps_inn_bready  => hps_inn_writemosi.ready_for_response,
      hps_inn_bresp   => hps_inn_writemiso.response,
      hps_inn_bvalid  => hps_inn_writemiso.response_valid,
      hps_inn_rdata   => hps_inn_readmiso.data,
      hps_inn_rready  => hps_inn_readmosi.ready_for_data,
      hps_inn_rresp   => hps_inn_readmiso.response,
      hps_inn_rvalid  => hps_inn_readmiso.data_valid,
      hps_inn_wdata   => hps_inn_writemosi.data,
      hps_inn_wready  => hps_inn_writemiso.ready_for_data,
      hps_inn_wstrb   => hps_inn_writemosi.data_write_strobe,
      hps_inn_wvalid  => hps_inn_writemosi.data_valid,

      hps_mid_araddr  => hps_mid_readmosi.address,
      hps_mid_arprot  => hps_mid_readmosi.protection_type,
      hps_mid_arready => hps_mid_readmiso.ready_for_address,
      hps_mid_arvalid => hps_mid_readmosi.address_valid,
      hps_mid_awaddr  => hps_mid_writemosi.address,
      hps_mid_awprot  => hps_mid_writemosi.protection_type,
      hps_mid_awready => hps_mid_writemiso.ready_for_address,
      hps_mid_awvalid => hps_mid_writemosi.address_valid,
      hps_mid_bready  => hps_mid_writemosi.ready_for_response,
      hps_mid_bresp   => hps_mid_writemiso.response,
      hps_mid_bvalid  => hps_mid_writemiso.response_valid,
      hps_mid_rdata   => hps_mid_readmiso.data,
      hps_mid_rready  => hps_mid_readmosi.ready_for_data,
      hps_mid_rresp   => hps_mid_readmiso.response,
      hps_mid_rvalid  => hps_mid_readmiso.data_valid,
      hps_mid_wdata   => hps_mid_writemosi.data,
      hps_mid_wready  => hps_mid_writemiso.ready_for_data,
      hps_mid_wstrb   => hps_mid_writemosi.data_write_strobe,
      hps_mid_wvalid  => hps_mid_writemosi.data_valid,

      hps_out_araddr  => hps_out_readmosi.address,
      hps_out_arprot  => hps_out_readmosi.protection_type,
      hps_out_arready => hps_out_readmiso.ready_for_address,
      hps_out_arvalid => hps_out_readmosi.address_valid,
      hps_out_awaddr  => hps_out_writemosi.address,
      hps_out_awprot  => hps_out_writemosi.protection_type,
      hps_out_awready => hps_out_writemiso.ready_for_address,
      hps_out_awvalid => hps_out_writemosi.address_valid,
      hps_out_bready  => hps_out_writemosi.ready_for_response,
      hps_out_bresp   => hps_out_writemiso.response,
      hps_out_bvalid  => hps_out_writemiso.response_valid,
      hps_out_rdata   => hps_out_readmiso.data,
      hps_out_rready  => hps_out_readmosi.ready_for_data,
      hps_out_rresp   => hps_out_readmiso.response,
      hps_out_rvalid  => hps_out_readmiso.data_valid,
      hps_out_wdata   => hps_out_writemosi.data,
      hps_out_wready  => hps_out_writemiso.ready_for_data,
      hps_out_wstrb   => hps_out_writemosi.data_write_strobe,
      hps_out_wvalid  => hps_out_writemosi.data_valid,

      hps_ext_araddr  => hps_ext_readmosi.address,
      hps_ext_arprot  => hps_ext_readmosi.protection_type,
      hps_ext_arready => hps_ext_readmiso.ready_for_address,
      hps_ext_arvalid => hps_ext_readmosi.address_valid,
      hps_ext_awaddr  => hps_ext_writemosi.address,
      hps_ext_awprot  => hps_ext_writemosi.protection_type,
      hps_ext_awready => hps_ext_writemiso.ready_for_address,
      hps_ext_awvalid => hps_ext_writemosi.address_valid,
      hps_ext_bready  => hps_ext_writemosi.ready_for_response,
      hps_ext_bresp   => hps_ext_writemiso.response,
      hps_ext_bvalid  => hps_ext_writemiso.response_valid,
      hps_ext_rdata   => hps_ext_readmiso.data,
      hps_ext_rready  => hps_ext_readmosi.ready_for_data,
      hps_ext_rresp   => hps_ext_readmiso.response,
      hps_ext_rvalid  => hps_ext_readmiso.data_valid,
      hps_ext_wdata   => hps_ext_writemosi.data,
      hps_ext_wready  => hps_ext_writemiso.ready_for_data,
      hps_ext_wstrb   => hps_ext_writemosi.data_write_strobe,
      hps_ext_wvalid  => hps_ext_writemosi.data_valid,

      tar_inn_araddr  => tar_inn_readmosi.address,
      tar_inn_arprot  => tar_inn_readmosi.protection_type,
      tar_inn_arready => tar_inn_readmiso.ready_for_address,
      tar_inn_arvalid => tar_inn_readmosi.address_valid,
      tar_inn_awaddr  => tar_inn_writemosi.address,
      tar_inn_awprot  => tar_inn_writemosi.protection_type,
      tar_inn_awready => tar_inn_writemiso.ready_for_address,
      tar_inn_awvalid => tar_inn_writemosi.address_valid,
      tar_inn_bready  => tar_inn_writemosi.ready_for_response,
      tar_inn_bresp   => tar_inn_writemiso.response,
      tar_inn_bvalid  => tar_inn_writemiso.response_valid,
      tar_inn_rdata   => tar_inn_readmiso.data,
      tar_inn_rready  => tar_inn_readmosi.ready_for_data,
      tar_inn_rresp   => tar_inn_readmiso.response,
      tar_inn_rvalid  => tar_inn_readmiso.data_valid,
      tar_inn_wdata   => tar_inn_writemosi.data,
      tar_inn_wready  => tar_inn_writemiso.ready_for_data,
      tar_inn_wstrb   => tar_inn_writemosi.data_write_strobe,
      tar_inn_wvalid  => tar_inn_writemosi.data_valid,

      tar_mid_araddr  => tar_mid_readmosi.address,
      tar_mid_arprot  => tar_mid_readmosi.protection_type,
      tar_mid_arready => tar_mid_readmiso.ready_for_address,
      tar_mid_arvalid => tar_mid_readmosi.address_valid,
      tar_mid_awaddr  => tar_mid_writemosi.address,
      tar_mid_awprot  => tar_mid_writemosi.protection_type,
      tar_mid_awready => tar_mid_writemiso.ready_for_address,
      tar_mid_awvalid => tar_mid_writemosi.address_valid,
      tar_mid_bready  => tar_mid_writemosi.ready_for_response,
      tar_mid_bresp   => tar_mid_writemiso.response,
      tar_mid_bvalid  => tar_mid_writemiso.response_valid,
      tar_mid_rdata   => tar_mid_readmiso.data,
      tar_mid_rready  => tar_mid_readmosi.ready_for_data,
      tar_mid_rresp   => tar_mid_readmiso.response,
      tar_mid_rvalid  => tar_mid_readmiso.data_valid,
      tar_mid_wdata   => tar_mid_writemosi.data,
      tar_mid_wready  => tar_mid_writemiso.ready_for_data,
      tar_mid_wstrb   => tar_mid_writemosi.data_write_strobe,
      tar_mid_wvalid  => tar_mid_writemosi.data_valid,

      tar_out_araddr  => tar_out_readmosi.address,
      tar_out_arprot  => tar_out_readmosi.protection_type,
      tar_out_arready => tar_out_readmiso.ready_for_address,
      tar_out_arvalid => tar_out_readmosi.address_valid,
      tar_out_awaddr  => tar_out_writemosi.address,
      tar_out_awprot  => tar_out_writemosi.protection_type,
      tar_out_awready => tar_out_writemiso.ready_for_address,
      tar_out_awvalid => tar_out_writemosi.address_valid,
      tar_out_bready  => tar_out_writemosi.ready_for_response,
      tar_out_bresp   => tar_out_writemiso.response,
      tar_out_bvalid  => tar_out_writemiso.response_valid,
      tar_out_rdata   => tar_out_readmiso.data,
      tar_out_rready  => tar_out_readmosi.ready_for_data,
      tar_out_rresp   => tar_out_readmiso.response,
      tar_out_rvalid  => tar_out_readmiso.data_valid,
      tar_out_wdata   => tar_out_writemosi.data,
      tar_out_wready  => tar_out_writemiso.ready_for_data,
      tar_out_wstrb   => tar_out_writemosi.data_write_strobe,
      tar_out_wvalid  => tar_out_writemosi.data_valid,

      tar_ext_araddr  => tar_ext_readmosi.address,
      tar_ext_arprot  => tar_ext_readmosi.protection_type,
      tar_ext_arready => tar_ext_readmiso.ready_for_address,
      tar_ext_arvalid => tar_ext_readmosi.address_valid,
      tar_ext_awaddr  => tar_ext_writemosi.address,
      tar_ext_awprot  => tar_ext_writemosi.protection_type,
      tar_ext_awready => tar_ext_writemiso.ready_for_address,
      tar_ext_awvalid => tar_ext_writemosi.address_valid,
      tar_ext_bready  => tar_ext_writemosi.ready_for_response,
      tar_ext_bresp   => tar_ext_writemiso.response,
      tar_ext_bvalid  => tar_ext_writemiso.response_valid,
      tar_ext_rdata   => tar_ext_readmiso.data,
      tar_ext_rready  => tar_ext_readmosi.ready_for_data,
      tar_ext_rresp   => tar_ext_readmiso.response,
      tar_ext_rvalid  => tar_ext_readmiso.data_valid,
      tar_ext_wdata   => tar_ext_writemosi.data,
      tar_ext_wready  => tar_ext_writemiso.ready_for_data,
      tar_ext_wstrb   => tar_ext_writemosi.data_write_strobe,
      tar_ext_wvalid  => tar_ext_writemosi.data_valid,

      mtc_araddr  => mtc_readmosi.address,
      mtc_arprot  => mtc_readmosi.protection_type,
      mtc_arready => mtc_readmiso.ready_for_address,
      mtc_arvalid => mtc_readmosi.address_valid,
      mtc_awaddr  => mtc_writemosi.address,
      mtc_awprot  => mtc_writemosi.protection_type,
      mtc_awready => mtc_writemiso.ready_for_address,
      mtc_awvalid => mtc_writemosi.address_valid,

      mtc_bready => mtc_writemosi.ready_for_response,
      mtc_bresp  => mtc_writemiso.response,
      mtc_bvalid => mtc_writemiso.response_valid,
      mtc_rdata  => mtc_readmiso.data,
      mtc_rready => mtc_readmosi.ready_for_data,
      mtc_rresp  => mtc_readmiso.response,
      mtc_rvalid => mtc_readmiso.data_valid,
      mtc_wdata  => mtc_writemosi.data,
      mtc_wready => mtc_writemiso.ready_for_data,
      mtc_wstrb  => mtc_writemosi.data_write_strobe,
      mtc_wvalid => mtc_writemosi.data_valid,

      ucm_araddr  => ucm_readmosi.address,
      ucm_arprot  => ucm_readmosi.protection_type,
      ucm_arready => ucm_readmiso.ready_for_address,
      ucm_arvalid => ucm_readmosi.address_valid,
      ucm_awaddr  => ucm_writemosi.address,
      ucm_awprot  => ucm_writemosi.protection_type,
      ucm_awready => ucm_writemiso.ready_for_address,
      ucm_awvalid => ucm_writemosi.address_valid,
      ucm_bready  => ucm_writemosi.ready_for_response,
      ucm_bresp   => ucm_writemiso.response,
      ucm_bvalid  => ucm_writemiso.response_valid,
      ucm_rdata   => ucm_readmiso.data,
      ucm_rready  => ucm_readmosi.ready_for_data,
      ucm_rresp   => ucm_readmiso.response,
      ucm_rvalid  => ucm_readmiso.data_valid,
      ucm_wdata   => ucm_writemosi.data,
      ucm_wready  => ucm_writemiso.ready_for_data,
      ucm_wstrb   => ucm_writemosi.data_write_strobe,
      ucm_wvalid  => ucm_writemosi.data_valid,

      daq_araddr  => daq_readmosi.address,
      daq_arprot  => daq_readmosi.protection_type,
      daq_arready => daq_readmiso.ready_for_address,
      daq_arvalid => daq_readmosi.address_valid,
      daq_awaddr  => daq_writemosi.address,
      daq_awprot  => daq_writemosi.protection_type,
      daq_awready => daq_writemiso.ready_for_address,
      daq_awvalid => daq_writemosi.address_valid,
      daq_bready  => daq_writemosi.ready_for_response,
      daq_bresp   => daq_writemiso.response,
      daq_bvalid  => daq_writemiso.response_valid,
      daq_rdata   => daq_readmiso.data,
      daq_rready  => daq_readmosi.ready_for_data,
      daq_rresp   => daq_readmiso.response,
      daq_rvalid  => daq_readmiso.data_valid,
      daq_wdata   => daq_writemosi.data,
      daq_wready  => daq_writemiso.ready_for_data,
      daq_wstrb   => daq_writemosi.data_write_strobe,
      daq_wvalid  => daq_writemosi.data_valid,

      tf_araddr  => tf_readmosi.address,
      tf_arprot  => tf_readmosi.protection_type,
      tf_arready => tf_readmiso.ready_for_address,
      tf_arvalid => tf_readmosi.address_valid,
      tf_awaddr  => tf_writemosi.address,
      tf_awprot  => tf_writemosi.protection_type,
      tf_awready => tf_writemiso.ready_for_address,
      tf_awvalid => tf_writemosi.address_valid,
      tf_bready  => tf_writemosi.ready_for_response,
      tf_bresp   => tf_writemiso.response,
      tf_bvalid  => tf_writemiso.response_valid,
      tf_rdata   => tf_readmiso.data,
      tf_rready  => tf_readmosi.ready_for_data,
      tf_rresp   => tf_readmiso.response,
      tf_rvalid  => tf_readmiso.data_valid,
      tf_wdata   => tf_writemosi.data,
      tf_wready  => tf_writemiso.ready_for_data,
      tf_wstrb   => tf_writemosi.data_write_strobe,
      tf_wvalid  => tf_writemosi.data_valid,

      mpl_araddr  => mpl_readmosi.address,
      mpl_arprot  => mpl_readmosi.protection_type,
      mpl_arready => mpl_readmiso.ready_for_address,
      mpl_arvalid => mpl_readmosi.address_valid,
      mpl_awaddr  => mpl_writemosi.address,
      mpl_awprot  => mpl_writemosi.protection_type,
      mpl_awready => mpl_writemiso.ready_for_address,
      mpl_awvalid => mpl_writemosi.address_valid,
      mpl_bready  => mpl_writemosi.ready_for_response,
      mpl_bresp   => mpl_writemiso.response,
      mpl_bvalid  => mpl_writemiso.response_valid,
      mpl_rdata   => mpl_readmiso.data,
      mpl_rready  => mpl_readmosi.ready_for_data,
      mpl_rresp   => mpl_readmiso.response,
      mpl_rvalid  => mpl_readmiso.data_valid,
      mpl_wdata   => mpl_writemosi.data,
      mpl_wready  => mpl_writemiso.ready_for_data,
      mpl_wstrb   => mpl_writemosi.data_write_strobe,
      mpl_wvalid  => mpl_writemosi.data_valid,


      fm_araddr  => fm_readmosi.address,
      fm_arprot  => fm_readmosi.protection_type,
      fm_arready => fm_readmiso.ready_for_address,
      fm_arvalid => fm_readmosi.address_valid,
      fm_awaddr  => fm_writemosi.address,
      fm_awprot  => fm_writemosi.protection_type,
      fm_awready => fm_writemiso.ready_for_address,
      fm_awvalid => fm_writemosi.address_valid,
      fm_bready  => fm_writemosi.ready_for_response,
      fm_bresp   => fm_writemiso.response,
      fm_bvalid  => fm_writemiso.response_valid,
      fm_rdata   => fm_readmiso.data,
      fm_rready  => fm_readmosi.ready_for_data,
      fm_rresp   => fm_readmiso.response,
      fm_rvalid  => fm_readmiso.data_valid,
      fm_wdata   => fm_writemosi.data,
      fm_wready  => fm_writemiso.ready_for_data,
      fm_wstrb   => fm_writemosi.data_write_strobe,
      fm_wvalid  => fm_writemosi.data_valid,

      -- system monitor outputs

      kintex_sys_mgmt_alarm          => sys_mgmt_alarm,
      kintex_sys_mgmt_overtemp_alarm => sys_mgmt_overtemp_alarm,
      --kintex_sys_mgmt_scl            => sys_mgmt_scl,
      --kintex_sys_mgmt_sda            => sys_mgmt_sda,
      kintex_sys_mgmt_vccaux_alarm   => sys_mgmt_vccaux_alarm,
      kintex_sys_mgmt_vccint_alarm   => sys_mgmt_vccint_alarm

      );

  --------------------------------------------------------------------------------
  -- AXI Interfaces
  --------------------------------------------------------------------------------

  hal_core_map_inst : entity ctrl_lib.HAL_CORE_map
    port map (
      clk_axi         => axi_clk,
      reset_axi_n     => std_logic1,
      slave_readmosi  => hal_core_readmosi,
      slave_readmiso  => hal_core_readmiso,
      slave_writemosi => hal_core_writemosi,
      slave_writemiso => hal_core_writemiso,

      -- monitor signals in
      mon  => hal_core_mon_r,
      -- control signals out
      ctrl => hal_core_ctrl_r
      );

  hal_map_inst : entity ctrl_lib.HAL_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => hal_readmosi,
      slave_readmiso  => hal_readmiso,
      slave_writemosi => hal_writemosi,
      slave_writemiso => hal_writemiso,

      -- monitor signals in
      mon  => hal_mon_r,
      -- control signals out
      ctrl => hal_ctrl_r
      );

  hps_inn_map_inst : entity ctrl_lib.HPS_map
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

  hps_mid_map_inst : entity ctrl_lib.HPS_map
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

  hps_out_map_inst : entity ctrl_lib.HPS_map
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

  hps_ext_map_inst : entity ctrl_lib.HPS_map
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

  tar_inn_map_inst : entity ctrl_lib.TAR_map
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

  tar_mid_map_inst : entity ctrl_lib.TAR_map
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

  tar_out_map_inst : entity ctrl_lib.TAR_map
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

  tar_ext_map_inst : entity ctrl_lib.TAR_map
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

  mtc_map_inst : entity ctrl_lib.MTC_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => mtc_readmosi,
      slave_readmiso  => mtc_readmiso,
      slave_writemosi => mtc_writemosi,
      slave_writemiso => mtc_writemiso,

      -- monitor signals in
      mon  => mtc_mon_rr,
      -- control signals out
      ctrl => mtc_ctrl_r
      );

  ucm_map_inst : entity ctrl_lib.UCM_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => ucm_readmosi,
      slave_readmiso  => ucm_readmiso,
      slave_writemosi => ucm_writemosi,
      slave_writemiso => ucm_writemiso,

      -- monitor signals in
      mon  => ucm_mon_rr,
      -- control signals out
      ctrl => ucm_ctrl_r
      );

  daq_map_inst : entity ctrl_lib.DAQ_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => daq_readmosi,
      slave_readmiso  => daq_readmiso,
      slave_writemosi => daq_writemosi,
      slave_writemiso => daq_writemiso,

      -- monitor signals in
      mon  => daq_mon_rr,
      -- control signals out
      ctrl => daq_ctrl_r
      );

  tf_map_inst : entity ctrl_lib.TF_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => tf_readmosi,
      slave_readmiso  => tf_readmiso,
      slave_writemosi => tf_writemosi,
      slave_writemiso => tf_writemiso,

      -- monitor signals in
      mon  => tf_mon_rr,
      -- control signals out
      ctrl => tf_ctrl_r
      );

  mpl_map_inst : entity ctrl_lib.MPL_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => mpl_readmosi,
      slave_readmiso  => mpl_readmiso,
      slave_writemosi => mpl_writemosi,
      slave_writemiso => mpl_writemiso,

      -- monitor signals in
      mon  => mpl_mon_rr,
      -- control signals out
      ctrl => mpl_ctrl_r
      );

  -- n.b. fast monitoring bram control interfaces can't be registered directly,
  -- since they contain a clock if you ff the record then you create a weird
  -- gated clock that is the ff'd version of itself which would run at 1/2 speed
  -- for each ff stage

  fm_map_inst : entity ctrl_lib.FM_map
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => fm_readmosi,
      slave_readmiso  => fm_readmiso,
      slave_writemosi => fm_writemosi,
      slave_writemiso => fm_writemiso,

      -- monitor signals in
      mon  => fm_mon_rr,
      -- control signals out
      Ctrl => fm_ctrl
      );

  fw_info_map_inst : entity ctrl_lib.fw_info_map
    port map (
      clk_axi         => axi_clk,
      reset_axi_n     => std_logic1,
      slave_readmosi  => fw_info_readmosi,
      slave_readmiso  => fw_info_readmiso,
      slave_writemosi => fw_info_writemosi,
      slave_writemiso => fw_info_writemiso,

      mon => fw_info_mon

      );


end control_arch;
