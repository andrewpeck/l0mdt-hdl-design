set _xlnx_shared_i0 [get_cells -hierarchical -regexp -nocase .*fm_inst/.*]
set_false_path -through [get_nets -hierarchical -regexp -nocase .*axi_reset_n.*] -to $_xlnx_shared_i0

