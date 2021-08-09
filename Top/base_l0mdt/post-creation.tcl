set PATH_REPO "[file normalize [file dirname [info script]]]/../../"

set FPGA xcku15p-ffva1760-2-e
set C2C_PATH $PATH_REPO/HAL/c2c
set BD_PATH $PATH_REPO/HAL/c2c/bd_helper
set BD_OUTPUT_PATH $PATH_REPO/HAL/c2c/bd
set BD_SUFFIX [lindex [split $FPGA "-"] 0]

set bd_design_name "c2cSlave"
make_wrapper -files [get_files ${bd_design_name}.bd] -top -import -force

# Regenerate the BD if needed

set sources "${C2C_PATH}/createC2CSlaveInterconnect.tcl ${C2C_PATH}/create_kintex_c2c.tcl ${C2C_PATH}/slaves.yaml"
set product ${BD_OUTPUT_PATH}/${BD_SUFFIX}/c2cSlave/c2cSlave.bd

set bd_modification_time [file mtime $product]

set needs_update 0
foreach source_file $sources {
    set source_modification_time [file mtime ${source_file}]
    if {[expr ${source_modification_time} > ${bd_modification_time}]} {
        set needs_update 1
    }
}

if {$needs_update == 1} {
    puts "Block design out of date. Refreshing block design from TCL source."
    set apollo_root_path $PATH_REPO
    source -notrace ${C2C_PATH}/createC2CSlaveInterconnect.tcl
} else {
    puts "Block design up to date from TCL sources. Skipping build."
}

# Enable this when the runner has ipbus
# eval exec bash -c {cd "${PATH_REPO}/regmap" && make xml_regmap}

# this fails when executed from vivado tcl... add it to a makefile and run manually
# exec tclsh "[file normalize ${C2C_PATH}/create_spybuffer_package.tcl]"
