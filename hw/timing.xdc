set_max_delay -datapath_only -from [get_clocks *mmcm*] -to [get_pins -hierarchical -filter {NAME =~ *gen_cdc_bus_inst*/D}] 3
