create_clock -period 24.9 -name clock [get_ports clock_in_p]

# timing of the cdcs does not matter so much.. just make sure it is less than a couple of pipeline clock cycles
# it could be extended longer if additional stages are added to the valid_dly
set_max_delay -from [get_pins {top_hal/sl_loop_loop*/C}] -to [get_pins -hierarchical -filter {NAME =~ *s_resync_reg*/D}] 4.0 -datapath_only
