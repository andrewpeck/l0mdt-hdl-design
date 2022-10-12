# Schematic:
# https://mdttp-files.web.cern.ch/mdttp-files/L0MDT/Demonstrator/CM/Version_1/doc/Board/Schematic/mpip001_apollo_command_module_s1v00_b1v01.pdf
#
# turn off on over-temperature
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]
#-------------------------------------------------
# Set internal reference voltages to 0.90 on banks with I/O signals.
# This is required for the HSTL and DIFF_HSTL I/O standards
set_property INTERNAL_VREF 0.9 [get_iobanks 66]
set_property INTERNAL_VREF 0.9 [get_iobanks 67]
set_property INTERNAL_VREF 0.9 [get_iobanks 72]
#-------------------------------------------------



create_clock -period 3.125 -name refclk0 [get_ports {refclk_i_p[0]}]
create_clock -period 3.125 -name refclk1 [get_ports {refclk_i_p[1]}]
create_clock -period 4.166 -name refclk2 [get_ports {refclk_i_p[2]}]
create_clock -period 4.166 -name refclk3 [get_ports {refclk_i_p[3]}]
create_clock -period 4.166 -name refclk4 [get_ports {refclk_i_p[4]}]
create_clock -period 3.125 -name refclk5 [get_ports {refclk_i_p[5]}]
create_clock -period 3.125 -name refclk6 [get_ports {refclk_i_p[6]}]
create_clock -period 3.125 -name refclk7 [get_ports {refclk_i_p[7]}]
create_clock -period 3.125 -name refclk8 [get_ports {refclk_i_p[8]}]
create_clock -period 3.125 -name refclk22 [get_ports {refclk_i_p[9]}]
create_clock -period 3.125 -name refclk10 [get_ports {refclk_i_p[10]}]
create_clock -period 3.125 -name refclk11 [get_ports {refclk_i_p[11]}]
create_clock -period 3.125 -name refclk12 [get_ports {refclk_i_p[12]}]
create_clock -period 3.125 -name refclk13 [get_ports {refclk_i_p[13]}]
create_clock -period 3.125 -name refclk14 [get_ports {refclk_i_p[14]}]
create_clock -period 3.125 -name refclk15 [get_ports {refclk_i_p[15]}]
create_clock -period 3.125 -name refclk16 [get_ports {refclk_i_p[16]}]
create_clock -period 3.125 -name refclk17 [get_ports {refclk_i_p[17]}]
create_clock -period 3.125 -name refclk18 [get_ports {refclk_i_p[18]}]
create_clock -period 3.125 -name refclk19 [get_ports {refclk_i_p[19]}]
create_clock -period 3.125 -name refclk20 [get_ports {refclk_i_p[20]}]
create_clock -period 3.125 -name refclk21 [get_ports {refclk_i_p[21]}]

# GTY
set_property PACKAGE_PIN AG30 [get_ports {refclk_i_p[0]}]
set_property PACKAGE_PIN AG31 [get_ports {refclk_i_n[0]}]
set_property PACKAGE_PIN AD32 [get_ports {refclk_i_p[1]}]
set_property PACKAGE_PIN AD33 [get_ports {refclk_i_n[1]}]
set_property PACKAGE_PIN AB33 [get_ports {refclk_i_n[2]}]
set_property PACKAGE_PIN AB32 [get_ports {refclk_i_p[2]}]
set_property PACKAGE_PIN Y32 [get_ports {refclk_i_p[3]}]
set_property PACKAGE_PIN Y33 [get_ports {refclk_i_n[3]}]
set_property PACKAGE_PIN V32 [get_ports {refclk_i_p[4]}]
set_property PACKAGE_PIN V33 [get_ports {refclk_i_n[4]}]
set_property PACKAGE_PIN T33 [get_ports {refclk_i_n[5]}]
set_property PACKAGE_PIN T32 [get_ports {refclk_i_p[5]}]
set_property PACKAGE_PIN P33 [get_ports {refclk_i_n[6]}]
set_property PACKAGE_PIN P32 [get_ports {refclk_i_p[6]}]
set_property PACKAGE_PIN M33 [get_ports {refclk_i_n[7]}]
set_property PACKAGE_PIN M32 [get_ports {refclk_i_p[7]}]

# GTH
set_property PACKAGE_PIN AL12 [get_ports {refclk_i_p[8]}]
set_property PACKAGE_PIN AL11 [get_ports {refclk_i_n[8]}]

#set_property -quiet PACKAGE_PIN AL12    [get_ports refclk_i_p[9]    ] ; # B2B_REF0_P ;; used for SM-CM link ; PRIYA
#set_property -quiet PACKAGE_PIN AL11     [get_ports refclk_i_n[9]    ] ; # B2B_REF0_N ;; used for SM-CM link ; PRIYA
#set_property PACKAGE_PIN AK9 [get_ports {refclk_i_n[9]}]
#set_property PACKAGE_PIN AK10 [get_ports {refclk_i_p[9]}]

set_property PACKAGE_PIN AJ12 [get_ports {refclk_i_p[10]}]
set_property PACKAGE_PIN AJ11 [get_ports {refclk_i_n[10]}]
set_property PACKAGE_PIN AH10 [get_ports {refclk_i_p[11]}]
set_property PACKAGE_PIN AH9 [get_ports {refclk_i_n[11]}]
set_property PACKAGE_PIN AG12 [get_ports {refclk_i_p[12]}]
set_property PACKAGE_PIN AG11 [get_ports {refclk_i_n[12]}]
set_property PACKAGE_PIN AE12 [get_ports {refclk_i_p[13]}]
set_property PACKAGE_PIN AE11 [get_ports {refclk_i_n[13]}]
set_property PACKAGE_PIN AC11 [get_ports {refclk_i_n[14]}]
set_property PACKAGE_PIN AC12 [get_ports {refclk_i_p[14]}]
set_property PACKAGE_PIN AA12 [get_ports {refclk_i_p[15]}]
set_property PACKAGE_PIN AA11 [get_ports {refclk_i_n[15]}]
set_property PACKAGE_PIN W12 [get_ports {refclk_i_p[16]}]
set_property PACKAGE_PIN W11 [get_ports {refclk_i_n[16]}]
set_property PACKAGE_PIN V10 [get_ports {refclk_i_p[17]}]
set_property PACKAGE_PIN V9 [get_ports {refclk_i_n[17]}]
set_property PACKAGE_PIN U12 [get_ports {refclk_i_p[18]}]
set_property PACKAGE_PIN U11 [get_ports {refclk_i_n[18]}]
set_property PACKAGE_PIN R12 [get_ports {refclk_i_p[19]}]
set_property PACKAGE_PIN R11 [get_ports {refclk_i_n[19]}]
set_property PACKAGE_PIN N12 [get_ports {refclk_i_p[20]}]
set_property PACKAGE_PIN N11 [get_ports {refclk_i_n[20]}]
set_property PACKAGE_PIN L12 [get_ports {refclk_i_p[21]}]
set_property PACKAGE_PIN L11 [get_ports {refclk_i_n[21]}]

# LHC REF Inputs

# ASYNC Oscillator
set_property PACKAGE_PIN AY16 [get_ports p_clk_100]
set_property PACKAGE_PIN AY15 [get_ports n_clk_100]
create_clock -period 10.000 -name clock_100 [get_ports p_clk_100]
set_property IOSTANDARD LVDS [get_ports *_clk_100]
set_property DIFF_TERM_ADV TERM_100 [get_ports *_clk_100]

# LHC REF Output


set_property PACKAGE_PIN AU12 [get_ports sump]
set_property IOSTANDARD LVCMOS18 [get_ports sump]







set_property PACKAGE_PIN BA4 [get_ports c2cb_rxp]
set_property PACKAGE_PIN BA3 [get_ports c2cb_rxn]
set_property PACKAGE_PIN AV10 [get_ports c2cb_txp]
set_property PACKAGE_PIN AV9 [get_ports c2cb_txn]

set_property PACKAGE_PIN AK9 [get_ports c2c_refclkn]
set_property PACKAGE_PIN AK10 [get_ports c2c_refclkp]

set_property BITSTREAM.CONFIG.USERID 32'h00000000 [current_design]
set_property BITSTREAM.CONFIG.USR_ACCESS 0000000 [current_design]





























set_property PACKAGE_PIN BB6 [get_ports c2c_rxp]








connect_debug_port u_ila_0/probe0 [get_nets [list {top_control_inst/fw_info_map_inst/read_address[6]}]]
connect_debug_port u_ila_0/probe6 [get_nets [list {top_control_inst/fw_info_map_inst/AXIRegBridge/read_address[2]} {top_control_inst/fw_info_map_inst/AXIRegBridge/read_address[3]} {top_control_inst/fw_info_map_inst/AXIRegBridge/read_address[4]} {top_control_inst/fw_info_map_inst/AXIRegBridge/read_address[5]} {top_control_inst/fw_info_map_inst/AXIRegBridge/read_address[7]} {top_control_inst/fw_info_map_inst/AXIRegBridge/read_address[8]}]]
connect_debug_port u_ila_0/probe8 [get_nets [list {top_control_inst/fw_info_readmiso[data][0]} {top_control_inst/fw_info_readmiso[data][1]} {top_control_inst/fw_info_readmiso[data][2]} {top_control_inst/fw_info_readmiso[data][3]} {top_control_inst/fw_info_readmiso[data][4]} {top_control_inst/fw_info_readmiso[data][5]} {top_control_inst/fw_info_readmiso[data][6]} {top_control_inst/fw_info_readmiso[data][7]} {top_control_inst/fw_info_readmiso[data][8]} {top_control_inst/fw_info_readmiso[data][9]} {top_control_inst/fw_info_readmiso[data][10]} {top_control_inst/fw_info_readmiso[data][11]} {top_control_inst/fw_info_readmiso[data][13]} {top_control_inst/fw_info_readmiso[data][14]} {top_control_inst/fw_info_readmiso[data][15]} {top_control_inst/fw_info_readmiso[data][16]} {top_control_inst/fw_info_readmiso[data][17]} {top_control_inst/fw_info_readmiso[data][18]} {top_control_inst/fw_info_readmiso[data][19]} {top_control_inst/fw_info_readmiso[data][20]} {top_control_inst/fw_info_readmiso[data][21]} {top_control_inst/fw_info_readmiso[data][22]} {top_control_inst/fw_info_readmiso[data][23]} {top_control_inst/fw_info_readmiso[data][24]} {top_control_inst/fw_info_readmiso[data][25]} {top_control_inst/fw_info_readmiso[data][26]} {top_control_inst/fw_info_readmiso[data][27]} {top_control_inst/fw_info_readmiso[data][28]}]]

connect_debug_port u_ila_0/probe0 [get_nets [list {top_control_inst/c2c_intf_readmiso[response][1]}]]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 32768 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list Local_Clocking/inst/clk_50MHz]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 14 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {top_control_inst/c2c_intf_readmosi[address][2]} {top_control_inst/c2c_intf_readmosi[address][3]} {top_control_inst/c2c_intf_readmosi[address][4]} {top_control_inst/c2c_intf_readmosi[address][5]} {top_control_inst/c2c_intf_readmosi[address][6]} {top_control_inst/c2c_intf_readmosi[address][7]} {top_control_inst/c2c_intf_readmosi[address][8]} {top_control_inst/c2c_intf_readmosi[address][9]} {top_control_inst/c2c_intf_readmosi[address][10]} {top_control_inst/c2c_intf_readmosi[address][11]} {top_control_inst/c2c_intf_readmosi[address][12]} {top_control_inst/c2c_intf_readmosi[address][13]} {top_control_inst/c2c_intf_readmosi[address][14]} {top_control_inst/c2c_intf_readmosi[address][15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {top_control_inst/c2c_intf_readmiso[data][0]} {top_control_inst/c2c_intf_readmiso[data][1]} {top_control_inst/c2c_intf_readmiso[data][2]} {top_control_inst/c2c_intf_readmiso[data][3]} {top_control_inst/c2c_intf_readmiso[data][4]} {top_control_inst/c2c_intf_readmiso[data][5]} {top_control_inst/c2c_intf_readmiso[data][6]} {top_control_inst/c2c_intf_readmiso[data][7]} {top_control_inst/c2c_intf_readmiso[data][8]} {top_control_inst/c2c_intf_readmiso[data][9]} {top_control_inst/c2c_intf_readmiso[data][10]} {top_control_inst/c2c_intf_readmiso[data][11]} {top_control_inst/c2c_intf_readmiso[data][12]} {top_control_inst/c2c_intf_readmiso[data][13]} {top_control_inst/c2c_intf_readmiso[data][14]} {top_control_inst/c2c_intf_readmiso[data][15]} {top_control_inst/c2c_intf_readmiso[data][16]} {top_control_inst/c2c_intf_readmiso[data][17]} {top_control_inst/c2c_intf_readmiso[data][18]} {top_control_inst/c2c_intf_readmiso[data][19]} {top_control_inst/c2c_intf_readmiso[data][20]} {top_control_inst/c2c_intf_readmiso[data][21]} {top_control_inst/c2c_intf_readmiso[data][22]} {top_control_inst/c2c_intf_readmiso[data][23]} {top_control_inst/c2c_intf_readmiso[data][24]} {top_control_inst/c2c_intf_readmiso[data][25]} {top_control_inst/c2c_intf_readmiso[data][26]} {top_control_inst/c2c_intf_readmiso[data][27]} {top_control_inst/c2c_intf_readmiso[data][28]} {top_control_inst/c2c_intf_readmiso[data][29]} {top_control_inst/c2c_intf_readmiso[data][30]} {top_control_inst/c2c_intf_readmiso[data][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 24 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[0]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[1]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[2]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[3]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[4]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[5]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[6]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[7]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[8]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[9]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[10]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[11]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[12]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[13]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[14]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[15]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[16]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[17]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[18]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[19]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[20]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[21]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[22]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 24 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[0]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[1]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[2]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[3]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[4]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[5]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[6]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[7]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[8]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[9]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[10]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[11]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[12]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[13]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[14]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[15]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[16]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[17]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[18]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[19]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[20]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[21]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[22]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_pulse_width_cnt[23]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 3 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {top_control_inst/fw_info_map_inst/AXIRegBridge/read_state[0]} {top_control_inst/fw_info_map_inst/AXIRegBridge/read_state[1]} {top_control_inst/fw_info_map_inst/AXIRegBridge/read_state[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {top_control_inst/c2c_intf_writemosi[data][0]} {top_control_inst/c2c_intf_writemosi[data][1]} {top_control_inst/c2c_intf_writemosi[data][2]} {top_control_inst/c2c_intf_writemosi[data][3]} {top_control_inst/c2c_intf_writemosi[data][4]} {top_control_inst/c2c_intf_writemosi[data][5]} {top_control_inst/c2c_intf_writemosi[data][6]} {top_control_inst/c2c_intf_writemosi[data][7]} {top_control_inst/c2c_intf_writemosi[data][8]} {top_control_inst/c2c_intf_writemosi[data][9]} {top_control_inst/c2c_intf_writemosi[data][10]} {top_control_inst/c2c_intf_writemosi[data][11]} {top_control_inst/c2c_intf_writemosi[data][12]} {top_control_inst/c2c_intf_writemosi[data][13]} {top_control_inst/c2c_intf_writemosi[data][14]} {top_control_inst/c2c_intf_writemosi[data][15]} {top_control_inst/c2c_intf_writemosi[data][16]} {top_control_inst/c2c_intf_writemosi[data][17]} {top_control_inst/c2c_intf_writemosi[data][18]} {top_control_inst/c2c_intf_writemosi[data][19]} {top_control_inst/c2c_intf_writemosi[data][20]} {top_control_inst/c2c_intf_writemosi[data][21]} {top_control_inst/c2c_intf_writemosi[data][22]} {top_control_inst/c2c_intf_writemosi[data][23]} {top_control_inst/c2c_intf_writemosi[data][24]} {top_control_inst/c2c_intf_writemosi[data][25]} {top_control_inst/c2c_intf_writemosi[data][26]} {top_control_inst/c2c_intf_writemosi[data][27]} {top_control_inst/c2c_intf_writemosi[data][28]} {top_control_inst/c2c_intf_writemosi[data][29]} {top_control_inst/c2c_intf_writemosi[data][30]} {top_control_inst/c2c_intf_writemosi[data][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 32 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[0]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[1]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[2]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[3]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[4]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[5]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[6]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[7]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[8]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[9]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[10]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[11]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[12]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[13]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[14]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[15]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[16]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[17]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[18]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[19]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[20]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[21]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[22]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[23]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[24]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[25]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[26]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[27]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[28]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[29]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[30]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RDATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 2 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWPROT[0]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWPROT[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 32 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[0]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[1]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[2]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[3]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[4]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[5]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[6]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[7]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[8]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[9]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[10]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[11]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[12]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[13]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[14]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[15]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[16]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[17]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[18]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[19]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[20]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[21]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[22]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[23]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[24]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[25]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[26]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[27]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[28]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[29]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[30]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARADDR[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 32 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[0]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[1]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[2]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[3]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[4]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[5]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[6]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[7]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[8]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[9]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[10]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[11]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[12]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[13]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[14]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[15]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[16]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[17]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[18]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[19]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[20]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[21]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[22]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[23]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[24]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[25]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[26]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[27]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[28]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[29]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[30]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WDATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 2 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RRESP[0]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RRESP[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 2 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_BRESP[0]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_BRESP[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 2 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARPROT[0]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARPROT[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 4 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WSTRB[0]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WSTRB[1]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WSTRB[2]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WSTRB[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 32 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[0]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[1]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[2]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[3]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[4]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[5]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[6]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[7]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[8]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[9]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[10]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[11]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[12]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[13]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[14]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[15]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[16]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[17]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[18]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[19]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[20]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[21]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[22]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[23]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[24]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[25]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[26]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[27]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[28]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[29]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[30]} {top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWADDR[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {top_control_inst/c2c_intf_readmiso[data_valid]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {top_control_inst/c2c_intf_readmiso[ready_for_address]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {top_control_inst/c2c_intf_readmosi[address_valid]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {top_control_inst/c2c_intf_readmosi[ready_for_data]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {top_control_inst/c2c_intf_writemiso[ready_for_address]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {top_control_inst/c2c_intf_writemiso[ready_for_data]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {top_control_inst/c2c_intf_writemiso[response_valid]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {top_control_inst/c2c_intf_writemosi[address_valid]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {top_control_inst/c2c_intf_writemosi[data_valid]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {top_control_inst/c2c_intf_writemosi[ready_for_response]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {top_control_inst/fw_info_readmiso[data_valid]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {top_control_inst/fw_info_readmosi[address_valid]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {top_control_inst/fw_info_writemiso[ready_for_address]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {top_control_inst/fw_info_writemiso[ready_for_data]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/gt_reset_i_delayed_r2]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/gt_reset_i_delayed_r2]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_ARVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_AWVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_BREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_BVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 1 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_RVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 1 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 1 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB_m_axi_lite_WVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 1 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2CB/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_assertion_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 1 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list top_control_inst/c2csslave_wrapper_1/c2cSlave_i/K_C2C/inst/slave_fpga_gen.axi_chip2chip_slave_phy_inst/aurora_phy.standard_cc_module_inst/pma_init_assertion_r]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_50]
