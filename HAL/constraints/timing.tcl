#################################################################################
# MGT Refclk
#################################################################################

# Apply asynchronous group constraints to the mgt refclks
# https://support.xilinx.com/s/article/44651?language=en_US

foreach clock [concat \
                   [get_clocks refclk*]] {
    puts $clock
    set_clock_groups -group [get_clocks $clock] -asynchronous
}

# asynchronous relationship between TXOUTCLKPCS and TX/RXOUTCLK
foreach clock_b \
    [concat \
         [get_clocks *TXOUTCLKPCS*]] {
             foreach clock_a [concat \
                                  [get_clocks *RXOUTCLK\[*] \
                                  [get_clocks *TXOUTCLK\[*]] {
                 set_clock_groups \
                     -group [get_clocks $clock_a] \
                     -group [get_clocks $clock_b] \
                     -asynchronous}}


# asynchronous clock relationship for tx/rx clocks to/from axi
foreach clock_b \
    [concat \
         [get_clocks axi_clk] \
         [get_clocks clock_100]] {
             foreach clock_a [concat \
                                  [get_clocks *TXOUTCLKPCS*] \
                                  [get_clocks *RXOUTCLK\[*] \
                                  [get_clocks *TXOUTCLK\[*]] {
                 set_clock_groups \
                     -group [get_clocks $clock_a] \
                     -group [get_clocks $clock_b] \
                     -asynchronous}}

################################################################################
# SL
################################################################################

# there's no known phase relationship between the rx clocks and the 40MHz clock
# but the clocks are frequency locked (mesochronous)

set_max_delay -datapath_only 5.0 \
    -from [get_pins -hierarchical -filter \
               {NAME =~ top_hal/*sector_logic*rx_packet_former*packet_valid_reg/C}] \
    -to [get_pins -hierarchical -filter \
             {NAME =~ top_hal/*rx_data*s_resync_reg*/D}]

set_max_delay -datapath_only 5.0 \
    -from [get_pins -hierarchical -filter \
               {NAME =~ top_hal/*sector_logic*rx_packet_former_inst*packet_userdata_reg*/C}] \
    -to [get_pins -hierarchical -filter \
             {NAME =~ top_hal/*sector_logic*cdc_bus_inst*data_o_reg*/D}]

# the TXCLK is something that is controlled by us, since it is locked to the
# REFCLK that we supply.. there is some phase uncertainty of the 4.1166 ns clock
# but we can control the phase of it with the clock synth.. just keep the
# datapath well under 4.166 ns so then we can adjust the phase using the clock
# synthesizer

set_max_delay -quiet -datapath_only 3.1 \
    -to [get_clocks *TXOUTCLK*] \
    -from [get_clocks *clk*mmcm*]

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
# The input to this reset comes from AXI clock domain but onto the MGT clock
# just set a false path to prevent timing analysis
################################################################################

set_false_path \
    -to [get_pins -hierarchical -filter \
             {NAME =~ top_hal/mgt_wrapper_inst/*synchronizer*/i_in_meta_reg/D}]

################################################################################
# Uncomment to disable all logic trimming
################################################################################

# set_property DONT_TOUCH true [get_cells -hierarchical *]