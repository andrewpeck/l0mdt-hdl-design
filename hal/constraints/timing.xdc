# sector logic clock domain crossing
set_max_delay -datapath_only \
    -from [get_clocks *] \
    -to [get_pins -hierarchical -filter {NAME =~ *s_resync_reg*/D}] 2.5

set_max_delay -datapath_only \
    -from [get_clocks *] \
    -to [get_pins -hierarchical -filter {NAME =~ *gen_cdc_bus_inst*/D}] 6

set_false_path \
    -from [get_pins top_hal/mgt_wrapper_inst/mgt_gen*/*/*/*/*/*/rst_in_out_reg/C] \
    -to [get_pins top_control_inst/hal_core_interface_inst/localRdData_latch_reg*/D]

set_false_path \
    -to [get_pins top_hal/mgt_wrapper_inst/*.mon_reg*x_reset_done*/D]

set_false_path \
    -to [get_pins top_hal/mgt_wrapper_inst/*.mon_reg*buffbypass_tx_done_out*/D]

set_false_path \
    -to [get_pins top_hal/mgt_wrapper_inst/*.mon_reg*buffbypass_tx_error_out*/D]

set_false_path \
    -to [get_pins top_hal/mgt_wrapper_inst/*.mon_reg*done_out*/D]

set_false_path \
    -to [get_pins top_hal/mgt_wrapper_inst/*.mon_reg*error_out*/D]

set_false_path \
    -from [get_cells top_control_inst/c2cslave_wrapper*/*/sys_reseter/U0/ACTIVE_LOW_BSR_OUT_DFF*]

# TODO: XDCB #1 Warning The option '-to : [get_pins -hierarchical -filter {NAME =~ *gen_cdc_bus_inst*/D}]' of constraint
#'set_max_delay' uses inefficient query to find pin objects (see constraint position '969' in the Timing Constraint
#window in Vivado IDE). To reduce runtime, it is recommended to get the pins through the cell objects. Please refer to
#Using Constraints Guide (Constraints Efficiency). An example of optimal query is: get_pins -filter {REF_PIN_NAME=~yy*}
#-of_objects [get_cells -hierarchical xx*].
