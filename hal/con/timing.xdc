create_clock -period 24.9 -name clock [get_ports clock_in_p]

# timing of the cdcs does not matter so much.. just make sure it is less than a couple of pipeline clock cycles
# it could be extended longer if additional stages are added to the valid_dly
set_max_delay -datapath_only -from [get_clocks *] -to [get_pins -hierarchical -filter {NAME =~ *s_resync_reg*/D}] 4
set_max_delay -datapath_only -from [get_clocks *] -to [get_pins -hierarchical -filter {NAME =~ *gen_cdc_bus_inst*/D}] 4
