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

# this timing constraint applies to the OOC synthesized BD, so if you try to set
# this during synthesis vivado barfs that the pin can't be found, so we need the
# -quiet flag
set_false_path -quiet -from [get_pins {top_control_inst/*/sys_reseter/*/*/C}]

################################################################################
# Transitions to/from the AXI clocks are asynchronous
################################################################################

set_clock_groups -group [get_clocks clock_100] -asynchronous
set_clock_groups -group [get_clocks axi_clk] -asynchronous

################################################################################
# FIXME: this is a kludgey workaround... the SL data needs to be fixed latency,
# so we need to have a sensible way to clock domain crossings from the SL clock
# received domain to the logic clock
################################################################################

set_max_delay -quiet -datapath_only 5 \
    -from [get_pins \
               {top_hal/*sector_logic*/*rx_packet_former*/*/C}] \
    -to [get_pins \
             {top_hal/*sector_logic*/*sl_rx_data*/D}]

################################################################################
# Uncomment to disable all logic trimming
################################################################################

#set_property DONT_TOUCH true [get_cells -hierarchical *]
