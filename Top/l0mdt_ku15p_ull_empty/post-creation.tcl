set SCRIPT_PATH "[file normalize [file dirname [info script]]]"
set PATH_REPO   "[file normalize ${SCRIPT_PATH}/../../]"

# get the FPGA part number from hog.conf
source ${SCRIPT_PATH}/get_fpga_name.tcl

set C2C_PATH $PATH_REPO/HAL/c2c
set BD_PATH $PATH_REPO/HAL/c2c/bd_helper
set BD_OUTPUT_PATH $PATH_REPO/HAL/c2c/bd

set bd_design_name "c2cSlave"
set build_name "l0mdt_ku15p_ull_empty"
# Regenerate the BD if needed

set sources "${C2C_PATH}/createC2CSlaveInterconnect.tcl
             ${C2C_PATH}/create_kintex_c2c.tcl
             ${C2C_PATH}/slaves.yaml"

set svg_product ${BD_OUTPUT_PATH}/${BD_SUFFIX}/c2cSlave/c2cSlave.svg

if { [file exist $svg_product] } {
    set svg_modification_time [file mtime $svg_product]
} else {
    set svg_modification_time -1
}

set regenerate_svg 0
foreach source_file $sources {
    set source_modification_time [file mtime ${source_file}]
    if {[expr ${source_modification_time} > ${svg_modification_time}]} {
        set regenerate_svg 1
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
        set regenerate_svg 1
    }
}

puts "=================================================================="
puts "Creating C2C Block Diagram from Tcl source"
if {$regenerate_svg} {
    puts " > regenerating svg file"
}
puts "=================================================================="

# 0xB0000000 for US+; 0x80000000 for 7 Series
set AXI_BASE_ADDRESS  0x80000000 ; # 7 Series

source ${SCRIPT_PATH}/../create_c2c.tcl
puts "Block design up to date from TCL sources. Skipping build."

set_property PROCESSING_ORDER LATE [get_files timing.tcl]
set_property PROCESSING_ORDER LATE [get_files loc_mgts.tcl]
