set PATH_REPO "[file normalize [file dirname [info script]]]/../../"

set FPGA xcku15p-ffva1760-2-e
set C2C_PATH $PATH_REPO/HAL/c2c
set BD_PATH $PATH_REPO/HAL/c2c/bd_helper
set BD_OUTPUT_PATH $PATH_REPO/HAL/c2c/bd
set BD_SUFFIX [lindex [split $FPGA "-"] 0]

set bd_design_name "c2cSlave"
make_wrapper -files [get_files ${bd_design_name}.bd] -top -import -force

# maybe enable this later... it is turned off for now to speed up compile time
# set apollo_root_path $PATH_REPO
# source -notrace ${C2C_PATH}/createC2CSlaveInterconnect.tcl

# Enable this when the runner has ipbus
# eval exec bash -c {cd "${PATH_REPO}/regmap" && make xml_regmap}

# this fails when executed from vivado tcl... add it to a makefile and run manually
# exec tclsh "[file normalize ${C2C_PATH}/create_spybuffer_package.tcl]"
