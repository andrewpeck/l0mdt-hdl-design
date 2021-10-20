#################################################################################
# MGT Refclk
#################################################################################

# Apply asynchronous group constraints to the mgt refclks
# https://support.xilinx.com/s/article/44651?language=en_US
foreach refclk [get_clocks refclk*] {
    set_clock_groups -group [get_clocks $refclk] -asynchronous
}

################################################################################
# Uncomment to disable all logic trimming
################################################################################

#set_property DONT_TOUCH true [get_cells -hierarchical *]
