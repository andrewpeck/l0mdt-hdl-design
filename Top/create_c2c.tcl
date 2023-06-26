#proc create_c2c {SCRIPT_PATH PATH_REPO BD_OUTPUT_PATH C2C_PATH BD_PATH} {

# source -notrace ${SCRIPT_PATH}/get_fpga_name.tcl

set apollo_root_path $PATH_REPO
set build_name $globalSettings::DESIGN

#for c2c
set C2C C2C
set C2C_PHY ${C2C}_PHY
set C2CB C2CB
set C2CB_PHY ${C2CB}_PHY

source -notrace ${PATH_REPO}/Top/createC2CSlaveInterconnect.tcl

# The wrapper that is generated randomly changes from std_logic_vector(0 downto 0) to std_logic
#
# to avoid this, we generate our own package where we force it to be what we want

# set bd_design_name "c2cSlave"
# make_wrapper -files [get_files ${bd_design_name}.bd] -top -force

set wrapper_file \
    [file normalize ${BD_OUTPUT_PATH}/${fpga_shortname}/c2cSlave/hdl/c2cSlave_wrapper.vhd]
puts "Taking VHDL package from ${wrapper_file}"

# copy of the slave component out of the wrapper file with sed
set re "/^\\s*component c2cSlave/,/end component/p"
set slave_component [exec sed -ne $re  ${wrapper_file}]

# create a VHDL package containing the wrapper component
set outfile [file normalize "${SCRIPT_PATH}/c2cslave_pkg.vhd"]

set fp [open $outfile w+]

puts $fp "library ieee;"
puts $fp "use ieee.std_logic_1164.all;"
puts $fp "package c2cslave_pkg is"
puts $fp ${slave_component}
puts $fp "end package c2cslave_pkg;"

close $fp

# turn any 0 downto 0, or 0 to 0 into a std_logic
# using sed right now... it could be done above with some tcl
set re "s|STD_LOGIC_VECTOR\\s*(\\s*0 .*to\\s*0\\s*)|std_logic|g"
exec sed -i $re ${outfile}

#}
