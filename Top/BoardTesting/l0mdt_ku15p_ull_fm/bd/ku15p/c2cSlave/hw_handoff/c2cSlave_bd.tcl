
################################################################
# This is a generated script based on design: c2cSlave
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source c2cSlave_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcku15p-ffva1760-2-e
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name c2cSlave

# This script was generated for a remote BD. To create a non-remote design,
# change the variable <run_remote_bd_flow> to <0>.

set run_remote_bd_flow 1
if { $run_remote_bd_flow == 1 } {
  # Set the reference directory for source file relative paths (by default 
  # the value is script directory path)
  set origin_dir ./BoardTesting/l0mdt_ku15p_ull_fm/bd/ku15p

  # Use origin directory path location variable, if specified in the tcl shell
  if { [info exists ::origin_dir_loc] } {
     set origin_dir $::origin_dir_loc
  }

  set str_bd_folder [file normalize ${origin_dir}]
  set str_bd_filepath ${str_bd_folder}/${design_name}/${design_name}.bd

  # Check if remote design exists on disk
  if { [file exists $str_bd_filepath ] == 1 } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2030 -severity "ERROR" "The remote BD file path <$str_bd_filepath> already exists!"}
     common::send_gid_msg -ssname BD::TCL -id 2031 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0>."
     common::send_gid_msg -ssname BD::TCL -id 2032 -severity "INFO" "Also make sure there is no design <$design_name> existing in your current project."

     return 1
  }

  # Check if design exists in memory
  set list_existing_designs [get_bd_designs -quiet $design_name]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2033 -severity "ERROR" "The design <$design_name> already exists in this project! Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2034 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Check if design exists on disk within project
  set list_existing_designs [get_files -quiet */${design_name}.bd]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2035 -severity "ERROR" "The design <$design_name> already exists in this project at location:
    $list_existing_designs"}
     catch {common::send_gid_msg -ssname BD::TCL -id 2036 -severity "ERROR" "Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2037 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Now can create the remote BD
  # NOTE - usage of <-dir> will create <$str_bd_folder/$design_name/$design_name.bd>
  create_bd_design -dir $str_bd_folder $design_name
} else {

  # Create regular design
  if { [catch {create_bd_design $design_name} errmsg] } {
     common::send_gid_msg -ssname BD::TCL -id 2038 -severity "INFO" "Please set a different value to variable <design_name>."

     return 1
  }
}

current_bd_design $design_name

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set C2C_INTFS [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 C2C_INTFS ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {50000000} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   ] $C2C_INTFS

  set CM1_PB_UART [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 CM1_PB_UART ]

  set FM [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 FM ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {50000000} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   ] $FM

  set FW_INFO [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 FW_INFO ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {50000000} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   ] $FW_INFO

  set HAL [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 HAL ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {50000000} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   ] $HAL

  set HAL_CORE [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 HAL_CORE ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {50000000} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   ] $HAL_CORE

  set HOG [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 HOG ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.FREQ_HZ {50000000} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.PROTOCOL {AXI4LITE} \
   ] $HOG

  set K_C2CB_PHY_DEBUG [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_aurora:transceiver_debug_rtl:1.0 K_C2CB_PHY_DEBUG ]

  set K_C2CB_PHY_DRP [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:drp_rtl:1.0 K_C2CB_PHY_DRP ]

  set K_C2CB_PHY_Rx [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX_rtl:1.0 K_C2CB_PHY_Rx ]

  set K_C2CB_PHY_Tx [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX_rtl:1.0 K_C2CB_PHY_Tx ]

  set K_C2C_PHY_DEBUG [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_aurora:transceiver_debug_rtl:1.0 K_C2C_PHY_DEBUG ]

  set K_C2C_PHY_DRP [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:drp_rtl:1.0 K_C2C_PHY_DRP ]

  set K_C2C_PHY_Rx [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX_rtl:1.0 K_C2C_PHY_Rx ]

  set K_C2C_PHY_Tx [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX_rtl:1.0 K_C2C_PHY_Tx ]

  set K_C2C_PHY_refclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 K_C2C_PHY_refclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $K_C2C_PHY_refclk


  # Create ports
  set AXI_CLK [ create_bd_port -dir I -type clk -freq_hz 50000000 AXI_CLK ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {HAL:FW_INFO:FM:C2C_INTFS:HOG:HAL_CORE} \
 ] $AXI_CLK
  set AXI_RST_N [ create_bd_port -dir O -from 0 -to 0 -type rst AXI_RST_N ]
  set KINTEX_SYS_MGMT_alarm [ create_bd_port -dir O KINTEX_SYS_MGMT_alarm ]
  set KINTEX_SYS_MGMT_overtemp_alarm [ create_bd_port -dir O KINTEX_SYS_MGMT_overtemp_alarm ]
  set KINTEX_SYS_MGMT_vccaux_alarm [ create_bd_port -dir O KINTEX_SYS_MGMT_vccaux_alarm ]
  set KINTEX_SYS_MGMT_vccint_alarm [ create_bd_port -dir O KINTEX_SYS_MGMT_vccint_alarm ]
  set K_C2CB_PHY_channel_up [ create_bd_port -dir O K_C2CB_PHY_channel_up ]
  set K_C2CB_PHY_gt_pll_lock [ create_bd_port -dir O K_C2CB_PHY_gt_pll_lock ]
  set K_C2CB_PHY_hard_err [ create_bd_port -dir O K_C2CB_PHY_hard_err ]
  set K_C2CB_PHY_lane_up [ create_bd_port -dir O -from 0 -to 0 K_C2CB_PHY_lane_up ]
  set K_C2CB_PHY_link_reset_out [ create_bd_port -dir O -type rst K_C2CB_PHY_link_reset_out ]
  set K_C2CB_PHY_power_down [ create_bd_port -dir I -type rst K_C2CB_PHY_power_down ]
  set K_C2CB_PHY_soft_err [ create_bd_port -dir O K_C2CB_PHY_soft_err ]
  set K_C2CB_aurora_do_cc [ create_bd_port -dir O K_C2CB_aurora_do_cc ]
  set K_C2CB_aurora_pma_init_in [ create_bd_port -dir I -type rst K_C2CB_aurora_pma_init_in ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $K_C2CB_aurora_pma_init_in
  set K_C2CB_axi_c2c_config_error_out [ create_bd_port -dir O K_C2CB_axi_c2c_config_error_out ]
  set K_C2CB_axi_c2c_link_status_out [ create_bd_port -dir O K_C2CB_axi_c2c_link_status_out ]
  set K_C2CB_axi_c2c_multi_bit_error_out [ create_bd_port -dir O K_C2CB_axi_c2c_multi_bit_error_out ]
  set K_C2C_PHY_CLK [ create_bd_port -dir O -type clk K_C2C_PHY_CLK ]
  set K_C2C_PHY_channel_up [ create_bd_port -dir O K_C2C_PHY_channel_up ]
  set K_C2C_PHY_gt_pll_lock [ create_bd_port -dir O K_C2C_PHY_gt_pll_lock ]
  set K_C2C_PHY_gt_refclk1_out [ create_bd_port -dir O -type clk K_C2C_PHY_gt_refclk1_out ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
 ] $K_C2C_PHY_gt_refclk1_out
  set K_C2C_PHY_hard_err [ create_bd_port -dir O K_C2C_PHY_hard_err ]
  set K_C2C_PHY_lane_up [ create_bd_port -dir O -from 0 -to 0 K_C2C_PHY_lane_up ]
  set K_C2C_PHY_link_reset_out [ create_bd_port -dir O -type rst K_C2C_PHY_link_reset_out ]
  set K_C2C_PHY_mmcm_not_locked_out [ create_bd_port -dir O K_C2C_PHY_mmcm_not_locked_out ]
  set K_C2C_PHY_power_down [ create_bd_port -dir I -type rst K_C2C_PHY_power_down ]
  set K_C2C_PHY_soft_err [ create_bd_port -dir O K_C2C_PHY_soft_err ]
  set K_C2C_aurora_do_cc [ create_bd_port -dir O K_C2C_aurora_do_cc ]
  set K_C2C_aurora_pma_init_in [ create_bd_port -dir I -type rst K_C2C_aurora_pma_init_in ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $K_C2C_aurora_pma_init_in
  set K_C2C_axi_c2c_config_error_out [ create_bd_port -dir O K_C2C_axi_c2c_config_error_out ]
  set K_C2C_axi_c2c_link_status_out [ create_bd_port -dir O K_C2C_axi_c2c_link_status_out ]
  set K_C2C_axi_c2c_multi_bit_error_out [ create_bd_port -dir O K_C2C_axi_c2c_multi_bit_error_out ]
  set clk50Mhz [ create_bd_port -dir I -type clk -freq_hz 50000000 clk50Mhz ]
  set reset_n [ create_bd_port -dir I -type rst reset_n ]

  # Create instance: CM1_PB_UART, and set properties
  set CM1_PB_UART [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 CM1_PB_UART ]
  set_property -dict [ list \
   CONFIG.C_BAUDRATE {115200} \
 ] $CM1_PB_UART

  # Create instance: JTAG_AXI_Master, and set properties
  set JTAG_AXI_Master [ create_bd_cell -type ip -vlnv xilinx.com:ip:jtag_axi:1.2 JTAG_AXI_Master ]

  # Create instance: KINTEX_SYS_MGMT, and set properties
  set KINTEX_SYS_MGMT [ create_bd_cell -type ip -vlnv xilinx.com:ip:system_management_wiz:1.3 KINTEX_SYS_MGMT ]
  set_property -dict [ list \
   CONFIG.USER_TEMP_ALARM {false} \
 ] $KINTEX_SYS_MGMT

  # Create instance: K_C2C, and set properties
  set K_C2C [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_chip2chip:5.0 K_C2C ]
  set_property -dict [ list \
   CONFIG.C_AXI_DATA_WIDTH {32} \
   CONFIG.C_AXI_STB_WIDTH {4} \
   CONFIG.C_EN_AXI_LINK_HNDLR {false} \
   CONFIG.C_INCLUDE_AXILITE {2} \
   CONFIG.C_INTERFACE_MODE {0} \
   CONFIG.C_INTERFACE_TYPE {2} \
   CONFIG.C_MASTER_FPGA {0} \
   CONFIG.C_M_AXI_ID_WIDTH {0} \
   CONFIG.C_M_AXI_WUSER_WIDTH {0} \
 ] $K_C2C

  # Create instance: K_C2CB, and set properties
  set K_C2CB [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_chip2chip:5.0 K_C2CB ]
  set_property -dict [ list \
   CONFIG.C_AXI_DATA_WIDTH {32} \
   CONFIG.C_AXI_STB_WIDTH {4} \
   CONFIG.C_EN_AXI_LINK_HNDLR {false} \
   CONFIG.C_INCLUDE_AXILITE {2} \
   CONFIG.C_INTERFACE_MODE {0} \
   CONFIG.C_INTERFACE_TYPE {2} \
   CONFIG.C_MASTER_FPGA {0} \
   CONFIG.C_M_AXI_ID_WIDTH {0} \
   CONFIG.C_M_AXI_WUSER_WIDTH {0} \
 ] $K_C2CB

  # Create instance: K_C2CB_PHY, and set properties
  set K_C2CB_PHY [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_64b66b:12.0 K_C2CB_PHY ]
  set_property -dict [ list \
   CONFIG.C_AURORA_LANES {1} \
   CONFIG.C_LINE_RATE {5} \
   CONFIG.C_REFCLK_FREQUENCY {200} \
   CONFIG.C_USE_CHIPSCOPE {true} \
   CONFIG.SupportLevel {0} \
   CONFIG.TransceiverControl {true} \
   CONFIG.drp_mode {Native} \
   CONFIG.interface_mode {Streaming} \
 ] $K_C2CB_PHY

  # Create instance: K_C2C_PHY, and set properties
  set K_C2C_PHY [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_64b66b:12.0 K_C2C_PHY ]
  set_property -dict [ list \
   CONFIG.C_AURORA_LANES {1} \
   CONFIG.C_LINE_RATE {5} \
   CONFIG.C_REFCLK_FREQUENCY {200} \
   CONFIG.C_USE_CHIPSCOPE {true} \
   CONFIG.SINGLEEND_GTREFCLK {False} \
   CONFIG.SupportLevel {1} \
   CONFIG.TransceiverControl {true} \
   CONFIG.drp_mode {Native} \
   CONFIG.interface_mode {Streaming} \
 ] $K_C2C_PHY

  # Create instance: slave_interconnect, and set properties
  set slave_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 slave_interconnect ]
  set_property -dict [ list \
   CONFIG.NUM_MI {8} \
   CONFIG.NUM_SI {3} \
 ] $slave_interconnect

  # Create instance: sys_reseter, and set properties
  set sys_reseter [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 sys_reseter ]

  # Create interface connections
  connect_bd_intf_net -intf_net CM1_PB_UART_UART [get_bd_intf_ports CM1_PB_UART] [get_bd_intf_pins CM1_PB_UART/UART]
  connect_bd_intf_net -intf_net JTAG_AXI_Master_M_AXI [get_bd_intf_pins JTAG_AXI_Master/M_AXI] [get_bd_intf_pins slave_interconnect/S02_AXI]
  connect_bd_intf_net -intf_net K_C2CB_AXIS_TX [get_bd_intf_pins K_C2CB/AXIS_TX] [get_bd_intf_pins K_C2CB_PHY/USER_DATA_S_AXIS_TX]
  connect_bd_intf_net -intf_net K_C2CB_PHY_DRP_1 [get_bd_intf_ports K_C2CB_PHY_DRP] [get_bd_intf_pins K_C2CB_PHY/GT0_DRP]
  connect_bd_intf_net -intf_net K_C2CB_PHY_GT_SERIAL_TX [get_bd_intf_ports K_C2CB_PHY_Tx] [get_bd_intf_pins K_C2CB_PHY/GT_SERIAL_TX]
  connect_bd_intf_net -intf_net K_C2CB_PHY_Rx_1 [get_bd_intf_ports K_C2CB_PHY_Rx] [get_bd_intf_pins K_C2CB_PHY/GT_SERIAL_RX]
  connect_bd_intf_net -intf_net K_C2CB_PHY_TRANSCEIVER_DEBUG [get_bd_intf_ports K_C2CB_PHY_DEBUG] [get_bd_intf_pins K_C2CB_PHY/TRANSCEIVER_DEBUG]
  connect_bd_intf_net -intf_net K_C2CB_PHY_USER_DATA_M_AXIS_RX [get_bd_intf_pins K_C2CB/AXIS_RX] [get_bd_intf_pins K_C2CB_PHY/USER_DATA_M_AXIS_RX]
  connect_bd_intf_net -intf_net K_C2CB_m_axi_lite [get_bd_intf_pins K_C2CB/m_axi_lite] [get_bd_intf_pins slave_interconnect/S01_AXI]
  connect_bd_intf_net -intf_net K_C2C_AXIS_TX [get_bd_intf_pins K_C2C/AXIS_TX] [get_bd_intf_pins K_C2C_PHY/USER_DATA_S_AXIS_TX]
  connect_bd_intf_net -intf_net K_C2C_PHY_DRP_1 [get_bd_intf_ports K_C2C_PHY_DRP] [get_bd_intf_pins K_C2C_PHY/GT0_DRP]
  connect_bd_intf_net -intf_net K_C2C_PHY_GT_SERIAL_TX [get_bd_intf_ports K_C2C_PHY_Tx] [get_bd_intf_pins K_C2C_PHY/GT_SERIAL_TX]
  connect_bd_intf_net -intf_net K_C2C_PHY_Rx_1 [get_bd_intf_ports K_C2C_PHY_Rx] [get_bd_intf_pins K_C2C_PHY/GT_SERIAL_RX]
  connect_bd_intf_net -intf_net K_C2C_PHY_TRANSCEIVER_DEBUG [get_bd_intf_ports K_C2C_PHY_DEBUG] [get_bd_intf_pins K_C2C_PHY/TRANSCEIVER_DEBUG]
  connect_bd_intf_net -intf_net K_C2C_PHY_USER_DATA_M_AXIS_RX [get_bd_intf_pins K_C2C/AXIS_RX] [get_bd_intf_pins K_C2C_PHY/USER_DATA_M_AXIS_RX]
  connect_bd_intf_net -intf_net K_C2C_PHY_refclk_1 [get_bd_intf_ports K_C2C_PHY_refclk] [get_bd_intf_pins K_C2C_PHY/GT_DIFF_REFCLK1]
  connect_bd_intf_net -intf_net K_C2C_m_axi [get_bd_intf_pins K_C2C/m_axi] [get_bd_intf_pins slave_interconnect/S00_AXI]
  connect_bd_intf_net -intf_net slave_interconnect_M00_AXI [get_bd_intf_pins KINTEX_SYS_MGMT/S_AXI_LITE] [get_bd_intf_pins slave_interconnect/M00_AXI]
  connect_bd_intf_net -intf_net slave_interconnect_M01_AXI [get_bd_intf_ports FW_INFO] [get_bd_intf_pins slave_interconnect/M01_AXI]
  connect_bd_intf_net -intf_net slave_interconnect_M02_AXI [get_bd_intf_ports FM] [get_bd_intf_pins slave_interconnect/M02_AXI]
  connect_bd_intf_net -intf_net slave_interconnect_M03_AXI [get_bd_intf_ports C2C_INTFS] [get_bd_intf_pins slave_interconnect/M03_AXI]
  connect_bd_intf_net -intf_net slave_interconnect_M04_AXI [get_bd_intf_pins CM1_PB_UART/S_AXI] [get_bd_intf_pins slave_interconnect/M04_AXI]
  connect_bd_intf_net -intf_net slave_interconnect_M05_AXI [get_bd_intf_ports HOG] [get_bd_intf_pins slave_interconnect/M05_AXI]
  connect_bd_intf_net -intf_net slave_interconnect_M06_AXI [get_bd_intf_ports HAL_CORE] [get_bd_intf_pins slave_interconnect/M06_AXI]
  connect_bd_intf_net -intf_net slave_interconnect_M07_AXI [get_bd_intf_ports HAL] [get_bd_intf_pins slave_interconnect/M07_AXI]

  # Create port connections
  connect_bd_net -net AXI_CLK_1 [get_bd_ports AXI_CLK] [get_bd_pins CM1_PB_UART/s_axi_aclk] [get_bd_pins JTAG_AXI_Master/aclk] [get_bd_pins KINTEX_SYS_MGMT/s_axi_aclk] [get_bd_pins K_C2C/m_aclk] [get_bd_pins K_C2C/m_axi_lite_aclk] [get_bd_pins K_C2CB/m_aclk] [get_bd_pins K_C2CB/m_axi_lite_aclk] [get_bd_pins slave_interconnect/ACLK] [get_bd_pins slave_interconnect/M00_ACLK] [get_bd_pins slave_interconnect/M01_ACLK] [get_bd_pins slave_interconnect/M02_ACLK] [get_bd_pins slave_interconnect/M03_ACLK] [get_bd_pins slave_interconnect/M04_ACLK] [get_bd_pins slave_interconnect/M05_ACLK] [get_bd_pins slave_interconnect/M06_ACLK] [get_bd_pins slave_interconnect/M07_ACLK] [get_bd_pins slave_interconnect/S00_ACLK] [get_bd_pins slave_interconnect/S01_ACLK] [get_bd_pins slave_interconnect/S02_ACLK] [get_bd_pins sys_reseter/slowest_sync_clk]
  connect_bd_net -net CM1_PB_UART_interrupt [get_bd_pins CM1_PB_UART/interrupt] [get_bd_pins K_C2CB/axi_c2c_s2m_intr_in]
  connect_bd_net -net KINTEX_SYS_MGMT_alarm_out [get_bd_ports KINTEX_SYS_MGMT_alarm] [get_bd_pins KINTEX_SYS_MGMT/alarm_out]
  connect_bd_net -net KINTEX_SYS_MGMT_ot_out [get_bd_ports KINTEX_SYS_MGMT_overtemp_alarm] [get_bd_pins KINTEX_SYS_MGMT/ot_out]
  connect_bd_net -net KINTEX_SYS_MGMT_vccaux_alarm_out [get_bd_ports KINTEX_SYS_MGMT_vccaux_alarm] [get_bd_pins KINTEX_SYS_MGMT/vccaux_alarm_out]
  connect_bd_net -net KINTEX_SYS_MGMT_vccint_alarm_out [get_bd_ports KINTEX_SYS_MGMT_vccint_alarm] [get_bd_pins KINTEX_SYS_MGMT/vccint_alarm_out]
  connect_bd_net -net K_C2CB_PHY_channel_up1 [get_bd_ports K_C2CB_PHY_channel_up] [get_bd_pins K_C2CB/axi_c2c_aurora_channel_up] [get_bd_pins K_C2CB_PHY/channel_up]
  connect_bd_net -net K_C2CB_PHY_gt_pll_lock1 [get_bd_ports K_C2CB_PHY_gt_pll_lock] [get_bd_pins K_C2CB_PHY/gt_pll_lock]
  connect_bd_net -net K_C2CB_PHY_hard_err1 [get_bd_ports K_C2CB_PHY_hard_err] [get_bd_pins K_C2CB_PHY/hard_err]
  connect_bd_net -net K_C2CB_PHY_lane_up1 [get_bd_ports K_C2CB_PHY_lane_up] [get_bd_pins K_C2CB_PHY/lane_up]
  connect_bd_net -net K_C2CB_PHY_link_reset_out1 [get_bd_ports K_C2CB_PHY_link_reset_out] [get_bd_pins K_C2CB_PHY/link_reset_out]
  connect_bd_net -net K_C2CB_PHY_power_down_1 [get_bd_ports K_C2CB_PHY_power_down] [get_bd_pins K_C2CB_PHY/power_down]
  connect_bd_net -net K_C2CB_PHY_soft_err1 [get_bd_ports K_C2CB_PHY_soft_err] [get_bd_pins K_C2CB_PHY/soft_err]
  connect_bd_net -net K_C2CB_aurora_do_cc1 [get_bd_ports K_C2CB_aurora_do_cc] [get_bd_pins K_C2CB/aurora_do_cc]
  connect_bd_net -net K_C2CB_aurora_pma_init_in_1 [get_bd_ports K_C2CB_aurora_pma_init_in] [get_bd_pins K_C2CB/aurora_pma_init_in]
  connect_bd_net -net K_C2CB_aurora_pma_init_out [get_bd_pins K_C2CB/aurora_pma_init_out] [get_bd_pins K_C2CB_PHY/pma_init]
  connect_bd_net -net K_C2CB_aurora_reset_pb [get_bd_pins K_C2CB/aurora_reset_pb] [get_bd_pins K_C2CB_PHY/reset_pb]
  connect_bd_net -net K_C2CB_axi_c2c_config_error_out1 [get_bd_ports K_C2CB_axi_c2c_config_error_out] [get_bd_pins K_C2CB/axi_c2c_config_error_out]
  connect_bd_net -net K_C2CB_axi_c2c_link_status_out1 [get_bd_ports K_C2CB_axi_c2c_link_status_out] [get_bd_pins K_C2CB/axi_c2c_link_status_out]
  connect_bd_net -net K_C2CB_axi_c2c_multi_bit_error_out1 [get_bd_ports K_C2CB_axi_c2c_multi_bit_error_out] [get_bd_pins K_C2CB/axi_c2c_multi_bit_error_out]
  connect_bd_net -net K_C2C_PHY_channel_up1 [get_bd_ports K_C2C_PHY_channel_up] [get_bd_pins K_C2C/axi_c2c_aurora_channel_up] [get_bd_pins K_C2C_PHY/channel_up]
  connect_bd_net -net K_C2C_PHY_gt_pll_lock1 [get_bd_ports K_C2C_PHY_gt_pll_lock] [get_bd_pins K_C2C_PHY/gt_pll_lock]
  connect_bd_net -net K_C2C_PHY_gt_refclk1_out1 [get_bd_ports K_C2C_PHY_gt_refclk1_out] [get_bd_pins K_C2CB_PHY/refclk1_in] [get_bd_pins K_C2C_PHY/gt_refclk1_out]
  connect_bd_net -net K_C2C_PHY_hard_err1 [get_bd_ports K_C2C_PHY_hard_err] [get_bd_pins K_C2C_PHY/hard_err]
  connect_bd_net -net K_C2C_PHY_lane_up1 [get_bd_ports K_C2C_PHY_lane_up] [get_bd_pins K_C2C_PHY/lane_up]
  connect_bd_net -net K_C2C_PHY_link_reset_out1 [get_bd_ports K_C2C_PHY_link_reset_out] [get_bd_pins K_C2C_PHY/link_reset_out]
  connect_bd_net -net K_C2C_PHY_mmcm_not_locked_out1 [get_bd_ports K_C2C_PHY_mmcm_not_locked_out] [get_bd_pins K_C2C/aurora_mmcm_not_locked] [get_bd_pins K_C2CB/aurora_mmcm_not_locked] [get_bd_pins K_C2C_PHY/mmcm_not_locked_out]
  connect_bd_net -net K_C2C_PHY_power_down_1 [get_bd_ports K_C2C_PHY_power_down] [get_bd_pins K_C2C_PHY/power_down]
  connect_bd_net -net K_C2C_PHY_soft_err1 [get_bd_ports K_C2C_PHY_soft_err] [get_bd_pins K_C2C_PHY/soft_err]
  connect_bd_net -net K_C2C_PHY_sync_clk_out [get_bd_pins K_C2CB_PHY/sync_clk] [get_bd_pins K_C2C_PHY/sync_clk_out]
  connect_bd_net -net K_C2C_PHY_user_clk_out [get_bd_ports K_C2C_PHY_CLK] [get_bd_pins K_C2C/axi_c2c_phy_clk] [get_bd_pins K_C2CB/axi_c2c_phy_clk] [get_bd_pins K_C2CB_PHY/user_clk] [get_bd_pins K_C2C_PHY/user_clk_out]
  connect_bd_net -net K_C2C_aurora_do_cc1 [get_bd_ports K_C2C_aurora_do_cc] [get_bd_pins K_C2C/aurora_do_cc]
  connect_bd_net -net K_C2C_aurora_pma_init_in_1 [get_bd_ports K_C2C_aurora_pma_init_in] [get_bd_pins K_C2C/aurora_pma_init_in]
  connect_bd_net -net K_C2C_aurora_pma_init_out [get_bd_pins K_C2C/aurora_pma_init_out] [get_bd_pins K_C2C_PHY/pma_init]
  connect_bd_net -net K_C2C_aurora_reset_pb [get_bd_pins K_C2C/aurora_reset_pb] [get_bd_pins K_C2C_PHY/reset_pb]
  connect_bd_net -net K_C2C_axi_c2c_config_error_out1 [get_bd_ports K_C2C_axi_c2c_config_error_out] [get_bd_pins K_C2C/axi_c2c_config_error_out]
  connect_bd_net -net K_C2C_axi_c2c_link_status_out1 [get_bd_ports K_C2C_axi_c2c_link_status_out] [get_bd_pins K_C2C/axi_c2c_link_status_out]
  connect_bd_net -net K_C2C_axi_c2c_multi_bit_error_out1 [get_bd_ports K_C2C_axi_c2c_multi_bit_error_out] [get_bd_pins K_C2C/axi_c2c_multi_bit_error_out]
  connect_bd_net -net clk50Mhz_1 [get_bd_ports clk50Mhz] [get_bd_pins K_C2C/aurora_init_clk] [get_bd_pins K_C2CB/aurora_init_clk] [get_bd_pins K_C2CB_PHY/init_clk] [get_bd_pins K_C2C_PHY/init_clk]
  connect_bd_net -net reset_n_1 [get_bd_ports reset_n] [get_bd_pins sys_reseter/ext_reset_in]
  connect_bd_net -net sys_reseter_interconnect_aresetn [get_bd_ports AXI_RST_N] [get_bd_pins CM1_PB_UART/s_axi_aresetn] [get_bd_pins JTAG_AXI_Master/aresetn] [get_bd_pins KINTEX_SYS_MGMT/s_axi_aresetn] [get_bd_pins K_C2C/m_aresetn] [get_bd_pins K_C2CB/m_aresetn] [get_bd_pins slave_interconnect/ARESETN] [get_bd_pins slave_interconnect/M00_ARESETN] [get_bd_pins slave_interconnect/M01_ARESETN] [get_bd_pins slave_interconnect/M02_ARESETN] [get_bd_pins slave_interconnect/M03_ARESETN] [get_bd_pins slave_interconnect/M04_ARESETN] [get_bd_pins slave_interconnect/M05_ARESETN] [get_bd_pins slave_interconnect/M06_ARESETN] [get_bd_pins slave_interconnect/M07_ARESETN] [get_bd_pins slave_interconnect/S00_ARESETN] [get_bd_pins slave_interconnect/S01_ARESETN] [get_bd_pins slave_interconnect/S02_ARESETN] [get_bd_pins sys_reseter/interconnect_aresetn]

  # Create address segments
  assign_bd_address -offset 0x81010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces JTAG_AXI_Master/Data] [get_bd_addr_segs C2C_INTFS/Reg] -force
  assign_bd_address -offset 0x81008000 -range 0x00001000 -target_address_space [get_bd_addr_spaces JTAG_AXI_Master/Data] [get_bd_addr_segs CM1_PB_UART/S_AXI/Reg] -force
  assign_bd_address -offset 0x80000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces JTAG_AXI_Master/Data] [get_bd_addr_segs FM/Reg] -force
  assign_bd_address -offset 0x81003000 -range 0x00001000 -target_address_space [get_bd_addr_spaces JTAG_AXI_Master/Data] [get_bd_addr_segs FW_INFO/Reg] -force
  assign_bd_address -offset 0x81004000 -range 0x00001000 -target_address_space [get_bd_addr_spaces JTAG_AXI_Master/Data] [get_bd_addr_segs HAL_CORE/Reg] -force
  assign_bd_address -offset 0x81005000 -range 0x00001000 -target_address_space [get_bd_addr_spaces JTAG_AXI_Master/Data] [get_bd_addr_segs HAL/Reg] -force
  assign_bd_address -offset 0x81030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces JTAG_AXI_Master/Data] [get_bd_addr_segs HOG/Reg] -force
  assign_bd_address -offset 0x81001000 -range 0x00001000 -target_address_space [get_bd_addr_spaces JTAG_AXI_Master/Data] [get_bd_addr_segs KINTEX_SYS_MGMT/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0x81010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces K_C2C/MAXI] [get_bd_addr_segs C2C_INTFS/Reg] -force
  assign_bd_address -offset 0x81008000 -range 0x00001000 -target_address_space [get_bd_addr_spaces K_C2C/MAXI] [get_bd_addr_segs CM1_PB_UART/S_AXI/Reg] -force
  assign_bd_address -offset 0x80000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces K_C2C/MAXI] [get_bd_addr_segs FM/Reg] -force
  assign_bd_address -offset 0x81003000 -range 0x00001000 -target_address_space [get_bd_addr_spaces K_C2C/MAXI] [get_bd_addr_segs FW_INFO/Reg] -force
  assign_bd_address -offset 0x81004000 -range 0x00001000 -target_address_space [get_bd_addr_spaces K_C2C/MAXI] [get_bd_addr_segs HAL_CORE/Reg] -force
  assign_bd_address -offset 0x81005000 -range 0x00001000 -target_address_space [get_bd_addr_spaces K_C2C/MAXI] [get_bd_addr_segs HAL/Reg] -force
  assign_bd_address -offset 0x81030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces K_C2C/MAXI] [get_bd_addr_segs HOG/Reg] -force
  assign_bd_address -offset 0x81001000 -range 0x00001000 -target_address_space [get_bd_addr_spaces K_C2C/MAXI] [get_bd_addr_segs KINTEX_SYS_MGMT/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0x81010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces K_C2CB/MAXI-Lite] [get_bd_addr_segs C2C_INTFS/Reg] -force
  assign_bd_address -offset 0x81008000 -range 0x00001000 -target_address_space [get_bd_addr_spaces K_C2CB/MAXI-Lite] [get_bd_addr_segs CM1_PB_UART/S_AXI/Reg] -force
  assign_bd_address -offset 0x80000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces K_C2CB/MAXI-Lite] [get_bd_addr_segs FM/Reg] -force
  assign_bd_address -offset 0x81003000 -range 0x00001000 -target_address_space [get_bd_addr_spaces K_C2CB/MAXI-Lite] [get_bd_addr_segs FW_INFO/Reg] -force
  assign_bd_address -offset 0x81004000 -range 0x00001000 -target_address_space [get_bd_addr_spaces K_C2CB/MAXI-Lite] [get_bd_addr_segs HAL_CORE/Reg] -force
  assign_bd_address -offset 0x81005000 -range 0x00001000 -target_address_space [get_bd_addr_spaces K_C2CB/MAXI-Lite] [get_bd_addr_segs HAL/Reg] -force
  assign_bd_address -offset 0x81030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces K_C2CB/MAXI-Lite] [get_bd_addr_segs HOG/Reg] -force
  assign_bd_address -offset 0x81001000 -range 0x00001000 -target_address_space [get_bd_addr_spaces K_C2CB/MAXI-Lite] [get_bd_addr_segs KINTEX_SYS_MGMT/S_AXI_LITE/Reg] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


