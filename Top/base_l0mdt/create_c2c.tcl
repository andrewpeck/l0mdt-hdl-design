set PROJ_PATH "[file normalize [file dirname [info script]]]"
set DESIGN    "[file rootname [file tail [info script]]]"
# FIXME: this doesn't work with subfolders in top... instead of the hardcoded
# relative path we can find the Top folder and just go up by one level
set PATH_REPO "${PROJ_PATH}/../../"

set apollo_root_path $PATH_REPO

# get the FPGA part number from hog.conf
source get_fpga_name.tcl

set C2C_PATH $PATH_REPO/HAL/c2c
set BD_PATH $PATH_REPO/HAL/c2c/bd_helper
set BD_OUTPUT_PATH $PATH_REPO/HAL/c2c/bd
set BD_SUFFIX $fpga_shortname

source -notrace ${C2C_PATH}/createC2CSlaveInterconnect.tcl

set bd_design_name "c2cSlave"
make_wrapper -files [get_files ${bd_design_name}.bd] -top -force

set wrapper_file [file normalize ${BD_OUTPUT_PATH}/${fpga_shortname}/c2cSlave/hdl/c2cSlave_wrapper.vhd]

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
exec sed -i $re ${wrapper_file}

#remove_files [get_files c2cSlave_wrapper.vhd]
