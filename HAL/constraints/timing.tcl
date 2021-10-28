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

# asynchronous clock relationship for tx/rx clocks to/from others
foreach clock_b \
    [concat \
         [get_clocks *mmcm*] \
         [get_clocks axi_clk] \
         [get_clocks clock_100]] {
             foreach clock_a [concat \
                                  [get_clocks *RXOUTCLK*] \
                                  [get_clocks *TXOUTCLK*]] {
                 set_clock_groups \
                     -group [get_clocks $clock_a] \
                     -group [get_clocks $clock_b] \
                     -asynchronous}}

# there's no known phase relationship between the rx clocks and the 40MHz clock
# this transition happens in the SL receiver, where we go
# from 240MHz RX --> 40 MHz LHC --> 320 MHz pipeline clock
#
# The 240 MHz signal is stable for 6 clock cycles (40 MHz effective) but transitions
# at an unknown phase.. we constrain it with a max datapath delay of 5 ns, so
# that /at least/ one of these two conditions will be true:
#   - the transition to the rising edge of the 40 MHz will be valid
#   - the transition to the negative edge of the 40 MHz will be valid
# some sort of phase scan would need to be devised to determine which to use
set_max_delay -quiet -datapath_only 5 \
    -from [get_clocks *RXOUTCLK*]
    -to [get_clocks *clk40*mmcm*]

# the TXCLK is something that is controlled by us, since it is locked to the
# REFCLK that we supply.. there is some phase uncertainty of the 4.1166 ns clock
# but we can control the phase of it with the clock synth.. just keep the
# datapath well under 4.166 ns so then we can adjust the phase using the clock
# synthesizer
set_max_delay -quiet -datapath_only 3.1 \
    -to [get_clocks *TXOUTCLK*]
    -from [get_clocks *clk40*mmcm*]

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
# The input to this reset comes from AXI clock domain but onto the MGT clock
# just set a false path to prevent timing analysis
################################################################################

set_false_path \
    -to [get_pins -hierarchical -filter \
             {NAME =~ top_hal/mgt_wrapper_inst/*synchronizer*/i_in_meta_reg/D}]

################################################################################
# Uncomment to disable all logic trimming
################################################################################

#set_property DONT_TOUCH true [get_cells -hierarchical *]
