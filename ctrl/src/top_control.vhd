library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_types_pkg.all;
use l0mdt_lib.mdttp_functions_pkg.all;

library hal;
use hal.board_pkg.all;
use hal.constants_pkg.all;
use hal.system_types_pkg.all;

library ult;

library xil_defaultlib;

library work;
use work.HOG_INFO_CTRL.all;
use work.FW_INFO_CTRL.all;
--use work.FW_TIMESTAMP.all;
--use work.FW_VERSION.all;
use work.axiRegPkg.all;

entity top_control is
  port (
    -- axi
    axi_clk     : in std_logic;

    -- system clock
    clk50mhz : in std_logic;
    reset_n  : in std_logic;

    c2c_rxn     : in std_logic;
    c2c_rxp     : in std_logic;
    c2c_txn     : out std_logic;
    c2c_txp     : out std_logic;
    c2c_refclkp  : in std_logic;
    c2c_refclkn  : in std_logic;

    hal_readmosi  : out axireadmosi;
    hal_readmiso  : in axireadmiso;
    hal_writemosi : out axiwritemosi;
    hal_writemiso : in axiwritemiso;

    fw_info_readmosi  : out axireadmosi;
    fw_info_readmiso  : in axireadmiso;
    fw_info_writemosi : out axiwritemosi;
    fw_info_writemiso : in axiwritemiso;

    hog_info_readmosi  : out axireadmosi;
    hog_info_readmiso  : in axireadmiso;
    hog_info_writemosi : out axiwritemosi;
    hog_info_writemiso : in axiwritemiso;

    -- system management
    sys_mgmt_scl            : inout std_logic;
    sys_mgmt_sda            : inout std_logic;
    sys_mgmt_alarm          : out std_logic;
    sys_mgmt_overtemp_alarm : out std_logic;
    sys_mgmt_vccaux_alarm   : out std_logic;
    sys_mgmt_vccint_alarm   : out std_logic

    );
end top_control;

architecture control_arch of top_control is

  signal axi_reset_n : std_logic;

begin

  c2cslave_wrapper_inst : entity xil_defaultlib.c2cslave_wrapper
    port map (

      -- axi clock and reset
      axi_clk      => axi_clk,
      axi_rst_n(0) => axi_reset_n,

      -- system clock and reset
      clk50mhz => clk50mhz,
      reset_n  => reset_n,

      --------------------------------------------------------------------------------
      -- C2C
      --------------------------------------------------------------------------------

      -- physical link
      k_c2clink_phy_rx_rxn(0)       => c2c_rxn,  -- k_c2clink_phy_rx_rxn,
      k_c2clink_phy_rx_rxp(0)       => c2c_rxp,  -- k_c2clink_phy_rx_rxp,
      k_c2clink_phy_tx_txn(0)       => c2c_txn,  -- k_c2clink_phy_tx_txn,
      k_c2clink_phy_tx_txp(0)       => c2c_txp,  -- k_c2clink_phy_tx_txp,
      k_c2clink_phy_refclk_clk_n => c2c_refclkn,   -- k_c2clink_phy_refclk_clk_n,
      k_c2clink_phy_refclk_clk_p => c2c_refclkp,   -- k_c2clink_phy_refclk_clk_p,

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
      k_c2clink_phy_power_down => '0',  -- k_c2clink_phy_power_down,


      -- AXI PL Slaves

      hog_info_araddr     => hog_info_readmosi.address,
      hog_info_arprot     => hog_info_readmosi.protection_type,
      hog_info_arready(0) => hog_info_readmiso.ready_for_address,
      hog_info_arvalid(0) => hog_info_readmosi.address_valid,
      hog_info_awaddr     => hog_info_writemosi.address,
      hog_info_awprot     => hog_info_writemosi.protection_type,
      hog_info_awready(0) => hog_info_writemiso.ready_for_address,
      hog_info_awvalid(0) => hog_info_writemosi.address_valid,
      hog_info_bready(0)  => hog_info_writemosi.ready_for_response,
      hog_info_bresp      => hog_info_writemiso.response,
      hog_info_bvalid(0)  => hog_info_writemiso.response_valid,
      hog_info_rdata      => hog_info_readmiso.data,
      hog_info_rready(0)  => hog_info_readmosi.ready_for_data,
      hog_info_rresp      => hog_info_readmiso.response,
      hog_info_rvalid(0)  => hog_info_readmiso.data_valid,
      hog_info_wdata      => hog_info_writemosi.data,
      hog_info_wready(0)  => hog_info_writemiso.ready_for_data,
      hog_info_wstrb      => hog_info_writemosi.data_write_strobe,
      hog_info_wvalid(0)  => hog_info_writemosi.data_valid,

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

      hal_araddr     => hal_readmosi.address,
      hal_arprot     => hal_readmosi.protection_type,
      hal_arready(0) => hal_readmiso.ready_for_address,
      hal_arvalid(0) => hal_readmosi.address_valid,
      hal_awaddr     => hal_writemosi.address,
      hal_awprot     => hal_writemosi.protection_type,
      hal_awready(0) => hal_writemiso.ready_for_address,
      hal_awvalid(0) => hal_writemosi.address_valid,
      hal_bready(0)  => hal_writemosi.ready_for_response,
      hal_bresp      => hal_writemiso.response,
      hal_bvalid(0)  => hal_writemiso.response_valid,
      hal_rdata      => hal_readmiso.data,
      hal_rready(0)  => hal_readmosi.ready_for_data,
      hal_rresp      => hal_readmiso.response,
      hal_rvalid(0)  => hal_readmiso.data_valid,
      hal_wdata      => hal_writemosi.data,
      hal_wready(0)  => hal_writemiso.ready_for_data,
      hal_wstrb      => hal_writemosi.data_write_strobe,
      hal_wvalid(0)  => hal_writemosi.data_valid,

      -- system monitor outputs

      kintex_sys_mgmt_alarm          => sys_mgmt_alarm,
      kintex_sys_mgmt_overtemp_alarm => sys_mgmt_overtemp_alarm,
      kintex_sys_mgmt_scl            => sys_mgmt_scl,
      kintex_sys_mgmt_sda            => sys_mgmt_sda,
      kintex_sys_mgmt_vccaux_alarm   => sys_mgmt_vccaux_alarm,
      kintex_sys_mgmt_vccint_alarm   => sys_mgmt_vccint_alarm

      );

end control_arch;
