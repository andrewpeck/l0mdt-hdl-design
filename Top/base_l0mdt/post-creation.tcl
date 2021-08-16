set SCRIPT_PATH "[file normalize [file dirname [info script]]]"
set PATH_REPO "${SCRIPT_PATH}/../../"

# get the FPGA part number from hog.conf
source ${SCRIPT_PATH}/get_fpga_name.tcl

set C2C_PATH $PATH_REPO/HAL/c2c
set BD_PATH $PATH_REPO/HAL/c2c/bd_helper
set BD_OUTPUT_PATH $PATH_REPO/HAL/c2c/bd

set bd_design_name "c2cSlave"

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

    puts "=================================================================="
    puts "Block design out of date. Refreshing block design from TCL source."
    puts "=================================================================="
    set apollo_root_path $PATH_REPO

    source -notrace ${C2C_PATH}/createC2CSlaveInterconnect.tcl

    # The wrapper that is generated randomly changes from std_logic_vector(0 downto 0) to std_logic
    #
    # to avoid this, we generate our own package where we force it to be what we want

    # set bd_design_name "c2cSlave"
    # make_wrapper -files [get_files ${bd_design_name}.bd] -top -force

    set wrapper_file [file normalize ${BD_OUTPUT_PATH}/${fpga_shortname}/c2cSlave/hdl/c2cSlave_wrapper.vhd]
    puts "Taking VHDL package from ${wrapper_file}"

    set re "/^\\s*component c2cSlave/,/end component/p"
    set slave_component [exec sed -ne $re  ${wrapper_file}]

    set outfile [file normalize "${BD_OUTPUT_PATH}/${fpga_shortname}/c2cslave_pkg.vhd"]

    set fp [open $outfile w+]

    puts $fp "library ieee;"
    puts $fp "use ieee.std_logic_1164.all;"
    puts $fp "package c2cslave_pkg is"
    puts $fp ${slave_component}
    puts $fp "end package c2cslave_pkg;"

    close $fp

    # turn any 0 downto 0, or 0 to 0 into a std_logic
    set re "s|STD_LOGIC_VECTOR\\s*(\\s*0 .*to\\s*0\\s*)|std_logic|g"
    exec sed -i $re ${outfile}

} else {
    puts "Block design up to date from TCL sources. Skipping build."
}
