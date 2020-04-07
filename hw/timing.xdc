set_max_delay -datapath_only -from [get_clocks *mmcm*] -to [get_pins -hierarchical -filter {NAME =~ *gen_cdc_bus_inst*/D}] 3
create_clock -period 24 -name clock [get_ports clock_in_p]
