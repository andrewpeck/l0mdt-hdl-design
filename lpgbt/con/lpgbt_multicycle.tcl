# Multicycle constraints: ease the timing constraints
# Uplink constraints: Values depend on the c_multicyleDelay. Shall be the same one for setup time and -1 for the hold time

puts "Setting LPGBT Uplink Pipeline Multicycle Path"

set pipeline_s_reg_cells [get_cells -quiet "top_hal/lpgbt_link_wrapper_inst/*uplink*/*frame_pipelined_s_reg[*]"]
if {[string is space $pipeline_s_reg_cells] == 0} {
    set_property -quiet KEEP true $pipeline_s_reg_cells
}

set pipeline_s_reg [get_pins -quiet "top_hal/lpgbt_link_wrapper_inst/*uplink*/frame_pipelined_s_reg[*]/C"]
if {[string is space $pipeline_s_reg] == 0} {
    set_multicycle_path 3 -from $pipeline_s_reg -setup
    set_multicycle_path 2 -from $pipeline_s_reg -hold
}

puts "Setting LPGBT Uplink Descrambler Multicycle Path"
set descrambled_d_reg_cells [get_cells -quiet "top_hal/lpgbt_link_wrapper_inst/*uplink*/*descrambler*/*descrambler*/descrambledData_reg*"]
if {[string is space $descrambled_d_reg_cells] == 0} {
    set_property -quiet KEEP true $descrambled_d_reg_cells
}

set descrambled_d_reg [get_pins -quiet "top_hal/lpgbt_link_wrapper_inst/*uplink*/*descrambler*/*descrambler*/descrambledData_reg*/C"]
if {[string is space $descrambled_d_reg] == 0} {
    set_multicycle_path 3 -from $descrambled_d_reg -setup
    set_multicycle_path 2 -from $descrambled_d_reg -hold
}

# Downlink constraints: Values depend on the c_multicyleDelay. Shall be the same one for setup time and -1 for the hold time
puts "Setting LPGBT Downlink Scrambler Multicycle Path"
set scrambled_d_reg_cells [get_cells -quiet "top_hal/*lpgbt_link_wrapper_inst/*downlink_inst*/*_scramble*/scrambledData*"]
if {[string is space $scrambled_d_reg_cells] == 0} {
    set_property -quiet KEEP true $scrambled_d_reg_cells
}

set scrambled_d_reg [get_pins -quiet "top_hal/lpgbt_link_wrapper_inst/*downlink*/*_scramble*/*scrambledData*/D"]
if {[string is space $scrambled_d_reg] == 0} {
    set_multicycle_path -setup -to $scrambled_d_reg 3
    set_multicycle_path -hold -to $scrambled_d_reg 2
}

# Prevent these reset registers from getting merged across different LPGBT instances...
# they are high fanout and it caused timing to fail early on
# TODO: replace hierarchical filters with direct calls
set_property -quiet KEEP true [get_cells -quiet -hierarchical -filter {NAME =~ top_hal/lpgbt_link_wrapper_inst/*/gearboxSyncReset*}]
