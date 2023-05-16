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
set EXT_CLK_FREQ 50000000



set AXI_MASTER_CLK AXI_CLK
set AXI_MASTER_RSTN AXI_RST_N
set AXI_MASTER_CLK_FREQ 50000000


set EXT_CLK40 clk40
set EXT_CLK40_RSTN CLK40_RSTN
set EXT_CLK40_FREQ 40000000

set AXI_INTERCONNECT_NAME slave_interconnect

#================================================================================
#  Setup external clock and reset
#================================================================================
create_bd_port -dir I -type clk $EXT_CLK -freq_hz ${EXT_CLK_FREQ}
create_bd_port -dir I -type rst $EXT_RESET

#================================================================================
#  Create the system resetter
#================================================================================

puts "Building AXI C2C slave interconnect"

#create AXI clock & reset ports
create_bd_port -dir I -type clk $AXI_MASTER_CLK -freq_hz ${AXI_MASTER_CLK_FREQ} 
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
#  Create the system resetter for clk40
#================================================================================
create_bd_port -dir O -type rst $EXT_CLK40_RSTN
create_bd_port -dir I -type clk $EXT_CLK40  -freq_hz $EXT_CLK40_FREQ
set SYS_RESETER_CLK40 sys_reseter_clk40
create_bd_cell -type ip -vlnv [get_ipdefs -filter {NAME == proc_sys_reset}] $SYS_RESETER_CLK40
#connect external reset
connect_bd_net [get_bd_ports $EXT_RESET] [get_bd_pins $SYS_RESETER_CLK40/ext_reset_in]
#connect clock
connect_bd_net [get_bd_ports $EXT_CLK40] [get_bd_pins $SYS_RESETER_CLK40/slowest_sync_clk]

set SYS_RESETER_CLK40_RSTN $SYS_RESETER_CLK40/interconnect_aresetn
#create the reset to sys reseter and slave interconnect
connect_bd_net [get_bd_ports $EXT_CLK40_RSTN] [get_bd_pins $SYS_RESETER_CLK40_RSTN]

#================================================================================
#  Configure chip 2 chip links
#================================================================================



source -quiet ${C2C_PATH}/create_kintex_c2c.tcl
#LOCing C2CB to GTHE4_COMMON_X0Y1
#set_property -dict [list CONFIG.CHANNEL_ENABLE {X0Y1} CONFIG.C_START_LANE {X0Y1}] [get_bd_cells K_C2CB_PHY]

#================================================================================
#  Create JTAG AXI Master
#================================================================================
set JTAG_AXI_MASTER JTAG_AXI_Master
BUILD_JTAG_AXI_MASTER [dict create device_name ${JTAG_AXI_MASTER} axi_clk ${AXI_MASTER_CLK} axi_rstn ${AXI_MASTER_RSTN}]




#================================================================================
#  Connect C2C master port to interconnect slave port
#================================================================================
set mAXI [list ${C2C}/m_axi ${C2CB}/m_axi_lite ${JTAG_AXI_MASTER}/M_AXI]
set mCLK [list ${AXI_MASTER_CLK}  ${AXI_MASTER_CLK}  ${AXI_MASTER_CLK} ]
set mRST [list ${AXI_MASTER_RSTN} ${AXI_MASTER_RSTN} ${AXI_MASTER_RSTN}] 
[BUILD_AXI_INTERCONNECT $AXI_INTERCONNECT_NAME ${AXI_MASTER_CLK} $AXI_MASTER_RSTN $mAXI $mCLK $mRST]


#================================================================================
#  Configure and add AXI slaves
#================================================================================
 
if {![info exists AXI_BASE_ADDRESS]} { #If not set in Hog Project (post-creation.tcl)
    # default to US+
    #set AXI_BASE_ADDRESS 0xB0000000 ; # US+
    set AXI_BASE_ADDRESS 0x80000000 ; # 7 Series
}


source -quiet "$BD_PATH/add_slaves_from_yaml.tcl"
yaml_to_bd "$SCRIPT_PATH/slaves.yaml"

set autogen_dir "${PATH_REPO}/configs/${build_name}/autogen/"
exec mkdir -p -- $autogen_dir
GENERATE_AXI_ADDR_MAP_C "${PATH_REPO}/configs/${build_name}/autogen/AXI_slave_addrs.h"                                                                                                 
GENERATE_AXI_ADDR_MAP_VHDL "${PATH_REPO}/configs/${build_name}/autogen/AXI_slave_pkg.vhd"                                                                                              
read_vhdl "${BD_PATH}/../../../configs/${build_name}/autogen/AXI_slave_pkg.vhd"      

#========================================
#  Finish up
#========================================

# why start_gui / stop_gui?
# see: https://forums.xilinx.com/t5/Vivado-TCL-Community/running-write-bd-layout-in-batch-mode/td-p/948476
# the gui will open and close for a second to generate the svg outputs
if {$regenerate_svg && [info exists ::env(DISPLAY) ]} {
   start_gui
   write_bd_layout -force -format svg -orientation portrait ${BD_OUTPUT_PATH}/${fpga_shortname}/c2cSlave/c2cSlave.svg
   stop_gui
}

puts "VALIDATING BD DESIGN..."
validate_bd_design
puts "REGENERATING BD LAYOUT..."
regenerate_bd_layout
puts "GENERATING BD WRAPPER..."
make_wrapper -files [get_files ${bd_design_name}.bd] -top -import -force
save_bd_design

close_bd_design ${bd_design_name}