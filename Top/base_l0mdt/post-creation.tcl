set SCRIPT_PATH "[file normalize [file dirname [info script]]]"
set PATH_REPO "${SCRIPT_PATH}/../../"

# get the FPGA part number from hog.conf
source ${SCRIPT_PATH}/get_fpga_name.tcl

set C2C_PATH $PATH_REPO/HAL/c2c
set BD_PATH $PATH_REPO/HAL/c2c/bd_helper
set BD_OUTPUT_PATH $PATH_REPO/HAL/c2c/bd

set bd_design_name "c2cSlave"

# Regenerate the BD if needed

set sources "${C2C_PATH}/createC2CSlaveInterconnect.tcl
             ${C2C_PATH}/create_kintex_c2c.tcl
             ${C2C_PATH}/slaves.yaml"
set product ${BD_OUTPUT_PATH}/${BD_SUFFIX}/c2cSlave/c2cSlave.bd

set bd_modification_time [file mtime $product]

set needs_update 0
foreach source_file $sources {
    set source_modification_time [file mtime ${source_file}]
    if {[expr ${source_modification_time} > ${bd_modification_time}]} {
        set needs_update 1
    }
}

# TODO: should also check if the vivado version in the bd is different from the
# version being used and make sure to update the bd if necessary

if {$needs_update == 1} {

    puts "=================================================================="
    puts "Block design out of date. Refreshing block design from TCL source."
    puts "=================================================================="

    source ${SCRIPT_PATH}/../create_c2c.tcl
    #create_c2c $SCRIPT_PATH $PATH_REPO $BD_OUTPUT_PATH $C2C_PATH $BD_PATH

} else {
    puts "Block design up to date from TCL sources. Skipping build."
}
