#################################################################################
# MGT Refclk
#################################################################################

# Apply asynchronous group constraints to the mgt refclks
# https://support.xilinx.com/s/article/44651?language=en_US
foreach refclk [get_clocks refclk*] {
    set_clock_groups -group [get_clocks $refclk] -asynchronous
}

################################################################################
# sys_resetter has an asynchronous output (on the axi clock domain) that
# connects to synchronous reset inputs (on other clock domains) and creates a
# timing error; just create a false path to prevent timing errors caused by this
# clock domain crossing
################################################################################

set_false_path -from [get_pins {top_control_inst/*/sys_reseter/*/*/C}]

################################################################################
# Uncomment to disable all logic trimming
################################################################################

#set_property DONT_TOUCH true [get_cells -hierarchical *]
