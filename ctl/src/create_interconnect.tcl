create_ip -name axi_interconnect -vendor xilinx.com -library ip -version 1.7 -module_name axi_interconnect_0
set_property -dict
    [list CONFIG.NUM_SLAVE_PORTS {7}
    CONFIG.S00_AXI_DATA_WIDTH {32}
    CONFIG.S01_AXI_DATA_WIDTH {32}
    CONFIG.S02_AXI_DATA_WIDTH {32}
    CONFIG.S03_AXI_DATA_WIDTH {32}
    CONFIG.S04_AXI_DATA_WIDTH {32}
    CONFIG.S05_AXI_DATA_WIDTH {32}
    CONFIG.S06_AXI_DATA_WIDTH {32}]
    [get_ips axi_interconnect_0]
generate_target {instantiation_template} [get_files /home/andrew/project_1.srcs/sources_1/ip/axi_interconnect_0/axi_interconnect_0.xci]
generate_target all [get_files  /home/andrew/project_1.srcs/sources_1/ip/axi_interconnect_0/axi_interconnect_0.xci]
