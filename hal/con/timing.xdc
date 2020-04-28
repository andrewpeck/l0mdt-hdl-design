create_clock -period 24.9 -name clock [get_ports clock_in_p]

# sector logic clock domain crossing
set_max_delay -datapath_only -from [get_clocks *] -to [get_pins -hierarchical -filter {NAME =~ *s_resync_reg*/D}] 2.5

set_max_delay -datapath_only -from [get_clocks *] -to [get_pins -hierarchical -filter {NAME =~ *gen_cdc_bus_inst*/D}] 6

# TODO:
#XDCB #1 Warning The option '-to : [get_pins -hierarchical -filter {NAME =~ *gen_cdc_bus_inst*/D}]' of constraint
#'set_max_delay' uses inefficient query to find pin objects (see constraint position '969' in the Timing Constraint
#window in Vivado IDE). To reduce runtime, it is recommended to get the pins through the cell objects. Please refer to
#Using Constraints Guide (Constraints Efficiency). An example of optimal query is: get_pins -filter {REF_PIN_NAME=~yy*}
#-of_objects [get_cells -hierarchical xx*].
