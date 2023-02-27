set xm_aclk     [get_clocks -of_objects [get_ports m_aclk]]
set xm_axi_lite_aclk       [get_clocks -of_objects [get_ports m_axi_lite_aclk]]



#Independent DIST RAM FIFO constraints in SLAVE INDEPENDENT mode 
#read to write


set_disable_timing -from CLK -to O [filter [all_fanout -from [get_ports m_aclk] -flat -endpoints_only -only_cells] {PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==LUTRAM}] 
set_disable_timing -from CLK -to O [filter [all_fanout -from [get_ports axi_c2c_phy_clk] -flat -endpoints_only -only_cells] {PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==LUTRAM}]
set_disable_timing -from CLK -to O [filter [all_fanout -from [get_ports m_axi_lite_aclk] -flat -endpoints_only -only_cells] {PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==LUTRAM}] 




# Ignore paths from the write clock to the read data registers for Asynchronous Distributed RAM based FIFO

set_max_delay -from [get_pins -filter {REF_PIN_NAME =~C} -of [get_cells -hierarchical -filter {NAME =~*axi_lite_slave_gen.reset_sync_lite_slv/sync_reset_out_reg}]] -to [get_pins -filter {REF_PIN_NAME =~PRE} -of [get_cells -hierarchical -filter {NAME =~*axi_lite_slave_gen.axi_chip2chip_lite_slave_inst/fifo_reset_reg}]] -datapath_only [get_property -min PERIOD $xm_axi_lite_aclk]
#set_max_delay -from [get_pins -hierarchical -filter {NAME =~*axi_lite_slave_gen.reset_sync_lite_slv/sync_reset_out_reg/C}] -to [get_pins -hierarchical -filter {NAME =~*axi_lite_slave_gen.axi_chip2chip_lite_slave_inst/fifo_reset_reg/PRE}] -datapath_only [get_property -min PERIOD $xm_axi_lite_aclk]
