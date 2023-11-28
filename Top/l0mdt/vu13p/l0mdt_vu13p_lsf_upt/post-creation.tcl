set SCRIPT_PATH "[file normalize [file dirname [info script]]]"
set PATH_REPO   "[file normalize ${SCRIPT_PATH}/../../../../]"

# get the FPGA part number from hog.conf
source ${PATH_REPO}/Top/get_fpga_name.tcl

set C2C_PATH $PATH_REPO/HAL/c2c
set BD_PATH $PATH_REPO/HAL/c2c/bd_helper
set BD_OUTPUT_PATH ${SCRIPT_PATH}/bd

set bd_design_name "c2cSlave"

# Regenerate the BD if needed

set sources "${PATH_REPO}/Top/createC2CSlaveInterconnect.tcl
             ${C2C_PATH}/create_c2c.tcl
             ${SCRIPT_PATH}/slaves.yaml"

set svg_product ${SCRIPT_PATH}/c2cSlave.svg

if { [file exist $svg_product] } {
    set svg_modification_time [file mtime $svg_product]
} else {
    set svg_modification_time -1
}

# Remove BD folder if it already exists
if {[file exists $BD_OUTPUT_PATH]} {
    file delete -force $BD_OUTPUT_PATH
}


set regenerate_svg 0
foreach source_file $sources {
    set source_modification_time [file mtime ${source_file}]
    if {[expr ${source_modification_time} > ${svg_modification_time}]} {
        set regenerate_svg 0
    }
}

# also check if the vivado version in the bd is different from the
# version being used and make sure to update the bd if necessary
# I do this with jq, so it only works if you have jq installed,
# (you should have it installed anyway because its great,
# but if you don't have it installed that's ok.
# Vivado will check if it exists and only try to run
# it if it is in your path)

set have_jq [expr ! [catch {exec which jqq}]]
if {$have_jq} {
    set bd_vivado_version [exec jq .design.design_info.tool_version $product]
    regexp -- {Vivado v([0-9]{4})\.([0-9])*(\.[0-9])*} [version] -> \
        VIVADO_YEAR VIVADO_MINOR VIVADO_PATCH
    if {0 != [string compare "{$VIVADO_YEAR}.{VIVADO_MINOR}${VIVADO_PATCH}" "$bd_vivado_version"]} {
        set regenerate_svg 0
    }
}

puts "=================================================================="
puts "Creating C2C Block Diagram from Tcl source"
if {$regenerate_svg} {
    puts " > regenerating svg file"
}
puts "=================================================================="

# 0xB0000000 for US+; 0x80000000 for 7 Series
set ::AXI_BASE_ADDRESS 0xB0000000 ; # USP
set ::REMOTE_C2C 1
set ::REMOTE_C2C_64 1

source ${PATH_REPO}/Top/create_c2c.tcl

#Adding files to the project
set fs "${PATH_REPO}/configs/${build_name}/autogen/AXI_slave_pkg.vhd ${SCRIPT_PATH}/c2cslave_pkg.vhd"
add_files -norecurse -fileset "sources_1" $fs
foreach f $fs {
    set file_obj [get_files -of_objects [get_filesets "sources_1"] [list "*$f"]]
    set_property -name "library" -value "ctrl_lib" -objects $file_obj
}

puts "Block design up to date from TCL sources. Skipping build."

set_property PROCESSING_ORDER LATE [get_files timing.tcl]
set_property PROCESSING_ORDER LATE [get_files loc_mgts.tcl]

# Suppress [Common 17-576] 'use_project_ipc' is deprecated message from Vivado 2020.2
set_msg_config -suppress -id {Common 17-576}
# Suppress Missing generic message to avoid pollution from Hog try to set generics for each IP in the .bd
set_msg_config -suppress -id {Synth 8-3819} 

