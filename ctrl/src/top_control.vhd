library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library xil_defaultlib;

library ctrl_lib;
use ctrl_lib.FW_INFO_CTRL.all;
use ctrl_lib.HAL_CORE_CTRL.all;
use ctrl_lib.HAL_CTRL.all;
use ctrl_lib.H2S_CTRL.all;
use ctrl_lib.TAR_CTRL.all;
use ctrl_lib.MTC_CTRL.all;
use ctrl_lib.UCM_CTRL.all;
use ctrl_lib.DAQ_CTRL.all;
use ctrl_lib.TF_CTRL.all;
use ctrl_lib.MPL_CTRL.all;
--use ctrl_lib.FW_TIMESTAMP.all;
--use ctrl_lib.FW_VERSION.all;
use ctrl_lib.axiRegPkg.all;

entity top_control is
  port (
    -- axi
    axi_clk : in std_logic;
    clk320  : in std_logic;
    clk40  : in std_logic;
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

    fw_info_readmosi  : out axireadmosi;
    fw_info_readmiso  : in  axireadmiso;
    fw_info_writemosi : out axiwritemosi;
    fw_info_writemiso : in  axiwritemiso;

    -- control

    h2s_ctrl : out H2S_CTRL_t;
    h2s_mon : in  H2S_MON_t;

    tar_ctrl : out TAR_CTRL_t;
    tar_mon : in  TAR_MON_t;

    mtc_ctrl : out MTC_CTRL_t;
    mtc_mon : in  MTC_MON_t;

    ucm_ctrl : out UCM_CTRL_t;
    ucm_mon : in  UCM_MON_t;

    daq_ctrl : out DAQ_CTRL_t;
    daq_mon : in  DAQ_MON_t;

    tf_ctrl : out TF_CTRL_t;
    tf_mon : in  TF_MON_t;

    mpl_ctrl : out MPL_CTRL_t;
    mpl_mon : in  MPL_MON_t;

    hal_mon  : in HAL_MON_t;
    hal_ctrl : out HAL_CTRL_t;

    hal_core_mon  : in HAL_CORE_MON_t;
    hal_core_ctrl : out HAL_CORE_CTRL_t;

    -- system management
    sys_mgmt_scl            : inout std_logic;
    sys_mgmt_sda            : inout std_logic;
    sys_mgmt_alarm          : out   std_logic;
    sys_mgmt_overtemp_alarm : out   std_logic;
    sys_mgmt_vccaux_alarm   : out   std_logic;
    sys_mgmt_vccint_alarm   : out   std_logic

    );
end top_control;

architecture control_arch of top_control is

  constant std_logic1 : std_logic := '1';
  constant std_logic0 : std_logic := '0';

  signal axi_reset_n : std_logic := '0';

  signal hal_core_readmosi  : axireadmosi;
  signal hal_core_readmiso  : axireadmiso;
  signal hal_core_writemosi : axiwritemosi;
  signal hal_core_writemiso : axiwritemiso;

  signal hal_readmosi  : axireadmosi;
  signal hal_readmiso  : axireadmiso;
  signal hal_writemosi : axiwritemosi;
  signal hal_writemiso : axiwritemiso;

  signal h2s_readmosi  : axireadmosi;
  signal h2s_readmiso  : axireadmiso;
  signal h2s_writemosi : axiwritemosi;
  signal h2s_writemiso : axiwritemiso;

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

  signal tar_readmosi  : axireadmosi;
  signal tar_readmiso  : axireadmiso;
  signal tar_writemosi : axiwritemosi;
  signal tar_writemiso : axiwritemiso;

  signal mpl_readmosi  : axireadmosi;
  signal mpl_readmiso  : axireadmiso;
  signal mpl_writemosi : axiwritemosi;
  signal mpl_writemiso : axiwritemiso;

begin

  c2cslave_wrapper_inst : entity xil_defaultlib.c2cslave_wrapper
    port map (

      -- axi clock and reset
      axi_clk      => axi_clk,
      clk40        => clk40,
      --clkpipe      => clkpipe,
      axi_rst_n(0) => axi_reset_n,

      -- system clock and reset
      clk50mhz => clk50mhz,
      reset_n  => reset_n,

      --------------------------------------------------------------------------------
      -- C2C
      --------------------------------------------------------------------------------

      -- physical link
      k_c2clink_phy_rx_rxn(0)    => c2c_rxn,      -- k_c2clink_phy_rx_rxn,
      k_c2clink_phy_rx_rxp(0)    => c2c_rxp,      -- k_c2clink_phy_rx_rxp,
      k_c2clink_phy_tx_txn(0)    => c2c_txn,      -- k_c2clink_phy_tx_txn,
      k_c2clink_phy_tx_txp(0)    => c2c_txp,      -- k_c2clink_phy_tx_txp,
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

      fw_info_araddr     => fw_info_readmosi.address,
      fw_info_arprot     => fw_info_readmosi.protection_type,
      fw_info_arready(0) => fw_info_readmiso.ready_for_address,
      fw_info_arvalid(0) => fw_info_readmosi.address_valid,
      fw_info_awaddr     => fw_info_writemosi.address,
      fw_info_awprot     => fw_info_writemosi.protection_type,
      fw_info_awready(0) => fw_info_writemiso.ready_for_address,
      fw_info_awvalid(0) => fw_info_writemosi.address_valid,
      fw_info_bready(0)  => fw_info_writemosi.ready_for_response,
      fw_info_bresp      => fw_info_writemiso.response,
      fw_info_bvalid(0)  => fw_info_writemiso.response_valid,
      fw_info_rdata      => fw_info_readmiso.data,
      fw_info_rready(0)  => fw_info_readmosi.ready_for_data,
      fw_info_rresp      => fw_info_readmiso.response,
      fw_info_rvalid(0)  => fw_info_readmiso.data_valid,
      fw_info_wdata      => fw_info_writemosi.data,
      fw_info_wready(0)  => fw_info_writemiso.ready_for_data,
      fw_info_wstrb      => fw_info_writemosi.data_write_strobe,
      fw_info_wvalid(0)  => fw_info_writemosi.data_valid,

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

      hal_core_araddr     => hal_core_readmosi.address,
      hal_core_arprot     => hal_core_readmosi.protection_type,
      hal_core_arready(0) => hal_core_readmiso.ready_for_address,
      hal_core_arvalid(0) => hal_core_readmosi.address_valid,
      hal_core_awaddr     => hal_core_writemosi.address,
      hal_core_awprot     => hal_core_writemosi.protection_type,
      hal_core_awready(0) => hal_core_writemiso.ready_for_address,
      hal_core_awvalid(0) => hal_core_writemosi.address_valid,
      hal_core_bready(0)  => hal_core_writemosi.ready_for_response,
      hal_core_bresp      => hal_core_writemiso.response,
      hal_core_bvalid(0)  => hal_core_writemiso.response_valid,
      hal_core_rdata      => hal_core_readmiso.data,
      hal_core_rready(0)  => hal_core_readmosi.ready_for_data,
      hal_core_rresp      => hal_core_readmiso.response,
      hal_core_rvalid(0)  => hal_core_readmiso.data_valid,
      hal_core_wdata      => hal_core_writemosi.data,
      hal_core_wready(0)  => hal_core_writemiso.ready_for_data,
      hal_core_wstrb      => hal_core_writemosi.data_write_strobe,
      hal_core_wvalid(0)  => hal_core_writemosi.data_valid,

      --------------------------------------------------------------------------------
      -- User Logic
      --------------------------------------------------------------------------------

      h2s_araddr  => h2s_readmosi.address,
      h2s_arprot  => h2s_readmosi.protection_type,
      h2s_arready => h2s_readmiso.ready_for_address,
      h2s_arvalid => h2s_readmosi.address_valid,
      h2s_awaddr  => h2s_writemosi.address,
      h2s_awprot  => h2s_writemosi.protection_type,
      h2s_awready => h2s_writemiso.ready_for_address,
      h2s_awvalid => h2s_writemosi.address_valid,
      h2s_bready  => h2s_writemosi.ready_for_response,
      h2s_bresp   => h2s_writemiso.response,
      h2s_bvalid  => h2s_writemiso.response_valid,
      h2s_rdata   => h2s_readmiso.data,
      h2s_rready  => h2s_readmosi.ready_for_data,
      h2s_rresp   => h2s_readmiso.response,
      h2s_rvalid  => h2s_readmiso.data_valid,
      h2s_wdata   => h2s_writemosi.data,
      h2s_wready  => h2s_writemiso.ready_for_data,
      h2s_wstrb   => h2s_writemosi.data_write_strobe,
      h2s_wvalid  => h2s_writemosi.data_valid,

      tar_araddr  => tar_readmosi.address,
      tar_arprot  => tar_readmosi.protection_type,
      tar_arready => tar_readmiso.ready_for_address,
      tar_arvalid => tar_readmosi.address_valid,
      tar_awaddr  => tar_writemosi.address,
      tar_awprot  => tar_writemosi.protection_type,
      tar_awready => tar_writemiso.ready_for_address,
      tar_awvalid => tar_writemosi.address_valid,
      tar_bready  => tar_writemosi.ready_for_response,
      tar_bresp   => tar_writemiso.response,
      tar_bvalid  => tar_writemiso.response_valid,
      tar_rdata   => tar_readmiso.data,
      tar_rready  => tar_readmosi.ready_for_data,
      tar_rresp   => tar_readmiso.response,
      tar_rvalid  => tar_readmiso.data_valid,
      tar_wdata   => tar_writemosi.data,
      tar_wready  => tar_writemiso.ready_for_data,
      tar_wstrb   => tar_writemosi.data_write_strobe,
      tar_wvalid  => tar_writemosi.data_valid,

      mtc_araddr  => mtc_readmosi.address,
      mtc_arprot  => mtc_readmosi.protection_type,
      mtc_arready => mtc_readmiso.ready_for_address,
      mtc_arvalid => mtc_readmosi.address_valid,
      mtc_awaddr  => mtc_writemosi.address,
      mtc_awprot  => mtc_writemosi.protection_type,
      mtc_awready => mtc_writemiso.ready_for_address,
      mtc_awvalid => mtc_writemosi.address_valid,
      mtc_bready  => mtc_writemosi.ready_for_response,
      mtc_bresp   => mtc_writemiso.response,
      mtc_bvalid  => mtc_writemiso.response_valid,
      mtc_rdata   => mtc_readmiso.data,
      mtc_rready  => mtc_readmosi.ready_for_data,
      mtc_rresp   => mtc_readmiso.response,
      mtc_rvalid  => mtc_readmiso.data_valid,
      mtc_wdata   => mtc_writemosi.data,
      mtc_wready  => mtc_writemiso.ready_for_data,
      mtc_wstrb   => mtc_writemosi.data_write_strobe,
      mtc_wvalid  => mtc_writemosi.data_valid,

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

      -- system monitor outputs

      kintex_sys_mgmt_alarm          => sys_mgmt_alarm,
      kintex_sys_mgmt_overtemp_alarm => sys_mgmt_overtemp_alarm,
      kintex_sys_mgmt_scl            => sys_mgmt_scl,
      kintex_sys_mgmt_sda            => sys_mgmt_sda,
      kintex_sys_mgmt_vccaux_alarm   => sys_mgmt_vccaux_alarm,
      kintex_sys_mgmt_vccint_alarm   => sys_mgmt_vccint_alarm

      );

  --------------------------------------------------------------------------------
  -- AXI Interfaces
  --------------------------------------------------------------------------------

  hal_core_interface_inst : entity ctrl_lib.HAL_CORE_interface
    port map (
      clk_axi         => axi_clk,
      reset_axi_n     => std_logic1,
      slave_readmosi  => hal_core_readmosi,
      slave_readmiso  => hal_core_readmiso,
      slave_writemosi => hal_core_writemosi,
      slave_writemiso => hal_core_writemiso,

      -- monitor signals in
      mon  => hal_core_mon,
      -- control signals out
      ctrl => hal_core_ctrl
      );

  hal_interface_inst : entity ctrl_lib.HAL_interface
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => hal_readmosi,
      slave_readmiso  => hal_readmiso,
      slave_writemosi => hal_writemosi,
      slave_writemiso => hal_writemiso,

      -- monitor signals in
      mon  => hal_mon,
      -- control signals out
      ctrl => hal_ctrl
      );

  h2s_interface_inst : entity ctrl_lib.H2S_interface
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => h2s_readmosi,
      slave_readmiso  => h2s_readmiso,
      slave_writemosi => h2s_writemosi,
      slave_writemiso => h2s_writemiso,

      -- monitor signals in
      mon  => h2s_mon,
      -- control signals out
      ctrl => h2s_ctrl
      );

  tar_interface_inst : entity ctrl_lib.TAR_interface
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => tar_readmosi,
      slave_readmiso  => tar_readmiso,
      slave_writemosi => tar_writemosi,
      slave_writemiso => tar_writemiso,

      -- monitor signals in
      mon  => tar_mon,
      -- control signals out
      ctrl => tar_ctrl
      );

  mtc_interface_inst : entity ctrl_lib.MTC_interface
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => mtc_readmosi,
      slave_readmiso  => mtc_readmiso,
      slave_writemosi => mtc_writemosi,
      slave_writemiso => mtc_writemiso,

      -- monitor signals in
      mon  => mtc_mon,
      -- control signals out
      ctrl => mtc_ctrl
      );

  ucm_interface_inst : entity ctrl_lib.UCM_interface
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => ucm_readmosi,
      slave_readmiso  => ucm_readmiso,
      slave_writemosi => ucm_writemosi,
      slave_writemiso => ucm_writemiso,

      -- monitor signals in
      mon  => ucm_mon,
      -- control signals out
      ctrl => ucm_ctrl
      );

  daq_interface_inst : entity ctrl_lib.DAQ_interface
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => daq_readmosi,
      slave_readmiso  => daq_readmiso,
      slave_writemosi => daq_writemosi,
      slave_writemiso => daq_writemiso,

      -- monitor signals in
      mon  => daq_mon,
      -- control signals out
      ctrl => daq_ctrl
      );

  tf_interface_inst : entity ctrl_lib.TF_interface
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => tf_readmosi,
      slave_readmiso  => tf_readmiso,
      slave_writemosi => tf_writemosi,
      slave_writemiso => tf_writemiso,

      -- monitor signals in
      mon  => tf_mon,
      -- control signals out
      ctrl => tf_ctrl
      );

  mpl_interface_inst : entity ctrl_lib.MPL_interface
    port map (
      clk_axi         => clk40,
      reset_axi_n     => std_logic1,
      slave_readmosi  => mpl_readmosi,
      slave_readmiso  => mpl_readmiso,
      slave_writemosi => mpl_writemosi,
      slave_writemiso => mpl_writemiso,

      -- monitor signals in
      mon  => mpl_mon,
      -- control signals out
      ctrl => mpl_ctrl
      );

end control_arch;
