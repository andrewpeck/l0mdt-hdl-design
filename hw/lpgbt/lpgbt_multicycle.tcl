# Multicycle constraints: ease the timing constraints
# Uplink constraints: Values depend on the c_multicyleDelay. Shall be the same one for setup time and -1 for the hold time

puts "Setting LPGBT Uplink Pipeline Multicycle Path"
set pipeline_s_reg [get_pins -hierarchical -filter {NAME =~ *lpgbt_link_wrapper_inst/*uplink_inst*/frame_pipelined_s_reg[*]/C}]
set pipeline_s_reg_cells [get_cells -hierarchical -filter {NAME =~ *lpgbt_link_wrapper_inst/*uplink_inst*/frame_pipelined_s_reg[*]}]
set_property DONT_TOUCH true $pipeline_s_reg_cells
set_multicycle_path 3 -from $pipeline_s_reg -setup
set_multicycle_path 2 -from $pipeline_s_reg -hold

puts "Setting LPGBT Uplink Descrambler Multicycle Path"
set descrambled_d_reg [get_pins -hierarchical -filter {NAME =~ *lpgbt_link_wrapper_inst/*uplink_inst*/*descrambledData_reg[*]/C}]
set descrambled_d_reg_cells [get_cells -hierarchical -filter {NAME =~ *lpgbt_link_wrapper_inst/*uplink_inst*/*descrambledData_reg[*]}]
set_property DONT_TOUCH true $descrambled_d_reg_cells
set_multicycle_path 3 -from $descrambled_d_reg -setup
set_multicycle_path 2 -from $descrambled_d_reg -hold

# Downlink constraints: Values depend on the c_multicyleDelay. Shall be the same one for setup time and -1 for the hold time
puts "Setting LPGBT Downlink Scrambler Multicycle Path"
set scrambled_d_reg [get_pins -hierarchical -filter {NAME =~ *lpgbt_link_wrapper_inst/*downlink_inst*/scrambledData*/D}]
set scrambled_d_reg_cells [get_cells -hierarchical -filter {NAME =~ *lpgbt_link_wrapper_inst/*downlink_inst*/scrambledData*}]
set_property DONT_TOUCH true $scrambled_d_reg_cells
set_multicycle_path -setup -to $scrambled_d_reg 3
set_multicycle_path -hold -to $scrambled_d_reg 2
