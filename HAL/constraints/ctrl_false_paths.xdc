
set_false_path -through [get_nets -hierarchical -regexp -nocase .*axi_reset_n.*] -to [get_cells -hierarchical -regexp -nocase .*fm_inst/.*]
#set_false_path -through [get_nets -hierarchical -regexp -nocase .*axi_reset_n.*] -to [get_pins -hierarchical -regexp -nocase .*CORE_map_inst.*]
#set_false_path -through [get_nets -hierarchical -regexp -nocase .*axi_reset_n.*] -to  [get_pins -hierarchical -regexp -nocase .*hal_map_inst.*]

