set DESIGN    "[file rootname [file tail [info script]]]"
set PATH_REPO "[file normalize [file dirname [info script]]]/../../"
set apollo_root_path $PATH_REPO

set FPGA xcku15p-ffva1760-2-e

set C2C_PATH $PATH_REPO/HAL/c2c
set BD_PATH $PATH_REPO/HAL/c2c/bd_helper
set BD_OUTPUT_PATH $PATH_REPO/HAL/c2c/bd
set BD_SUFFIX [lindex [split $FPGA "-"] 0]

source -notrace ${C2C_PATH}/createC2CSlaveInterconnect.tcl

#set bd_design_name "c2cSlave"
#make_wrapper -files [get_files ${bd_design_name}.bd] -top -import -force
