source -quiet "$BD_PATH/dtsi_helpers.tcl"
source -quiet "$BD_PATH/axi_helpers.tcl"
source -quiet "$BD_PATH/Xilinx_AXI_slaves.tcl"

remove_files -quiet [get_files "c2cSlave.bd"]
remove_files -quiet [get_files "c2cSlave_wrapper.vhd"]

#create a block design called "c2cSlave"
#directory and name must be the same
set bd_design_name "c2cSlave"
remove_files -quiet [file normalize "${BD_OUTPUT_PATH}/${BD_SUFFIX}/${bd_design_name}/${bd_design_name}.bd"]
create_bd_design -dir [file normalize ${BD_OUTPUT_PATH}/${BD_SUFFIX}] ${bd_design_name}

set EXT_CLK clk50Mhz
set EXT_RESET reset_n

set AXI_MASTER_CLK AXI_CLK
set AXI_MASTER_RSTN AXI_RST_N
set AXI_MASTER_CLK_FREQ 50000000

set AXI_INTERCONNECT_NAME slave_interconnect

#================================================================================
#  Setup external clock and reset
#================================================================================

create_bd_port -dir I -type clk -freq_hz $AXI_MASTER_CLK_FREQ $EXT_CLK
create_bd_port -dir I -type rst $EXT_RESET

#================================================================================
#  Create the system resetter
#================================================================================

puts "Building AXI C2C slave interconnect"

#create AXI clock & reset ports
create_bd_port -dir I -type clk -freq $AXI_MASTER_CLK_FREQ $AXI_MASTER_CLK
create_bd_port -dir O -type rst $AXI_MASTER_RSTN

#create the reset logic
set SYS_RESETER sys_reseter
create_bd_cell -type ip -vlnv [get_ipdefs -filter {NAME == proc_sys_reset}] $SYS_RESETER
#connect external reset
connect_bd_net [get_bd_ports $EXT_RESET] [get_bd_pins $SYS_RESETER/ext_reset_in]
#connect clock
connect_bd_net [get_bd_ports $AXI_MASTER_CLK] [get_bd_pins $SYS_RESETER/slowest_sync_clk]

set SYS_RESETER_AXI_RSTN $SYS_RESETER/interconnect_aresetn
#create the reset to sys reseter and slave interconnect
connect_bd_net [get_bd_ports $AXI_MASTER_RSTN] [get_bd_pins $SYS_RESETER_AXI_RSTN]

#================================================================================
#  Configure chip 2 chip links
#================================================================================

source -quiet ${C2C_PATH}/create_kintex_c2c.tcl

#================================================================================
#  Connect C2C master port to interconnect slave port
#================================================================================

set mAXI [list ${C2C}/m_axi      ${C2C}/m_axi_lite]
set mCLK [list ${AXI_MASTER_CLK} ${AXI_MASTER_CLK}]
set mRST [list $AXI_MASTER_RSTN  $AXI_MASTER_RSTN]
# set mAXI [list ${C2C}/m_axi ${C2C}/m_axi_lite ${JTAG_AXI_MASTER}/M_AXI]
# set mCLK [list ${AXI_MASTER_CLK}  ${AXI_MASTER_CLK}  ${AXI_MASTER_CLK} ]
# set mRST [list ${AXI_MASTER_RSTN} ${AXI_MASTER_RSTN} ${AXI_MASTER_RSTN}]

[BUILD_AXI_INTERCONNECT $AXI_INTERCONNECT_NAME ${AXI_MASTER_CLK} $AXI_MASTER_RSTN $mAXI $mCLK $mRST]
# BUILD_AXI_INTERCONNECT $AXI_INTERCONNECT_NAME ${AXI_MASTER_CLK} $AXI_MASTER_RSTN $mAXI $mCLK $mRST
# AXI_DEV_CONNECT ${C2C_PHY} ${AXI_INTERCONNECT_NAME} ${EXT_CLK} ${EXT_RESET} AXI_MASTER_CLK_FREQ 0x83c44000 4K 0

#================================================================================
#  Configure and add AXI slaves
#================================================================================

source -quiet "$BD_PATH/add_slaves_from_yaml.tcl"
yaml_to_bd "$C2C_PATH/slaves.yaml"

#========================================
#  Finish up
#========================================

# why start_gui / stop_gui?
# see: https://forums.xilinx.com/t5/Vivado-TCL-Community/running-write-bd-layout-in-batch-mode/td-p/948476
# the gui will open and close for a second to generate the svg outputs
if {$regenerate_svg} {
    start_gui
    write_bd_layout -force -format svg -orientation portrait ${BD_OUTPUT_PATH}/${fpga_shortname}/c2cSlave/c2cSlave.svg
    stop_gui
}

validate_bd_design

regenerate_bd_layout

make_wrapper -files [get_files ${bd_design_name}.bd] -top -import -force
save_bd_design

close_bd_design ${bd_design_name}
