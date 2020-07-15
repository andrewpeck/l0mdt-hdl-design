#================================================================================
#  Configure and add AXI slaves
#================================================================================


#expose the interconnect's axi master port for an axi slave
puts "Adding user slaves"


[AXI_IP_SYS_MGMT KINTEX_SYS_MGMT  ${AXI_INTERCONNECT_NAME} ${AXI_MASTER_CLK} ${AXI_MASTER_RSTN} 50000000 0x83c42000 4K 0]
#proc AXI_PL_DEV_CONNECT {device_name axi_interconnect axi_clk axi_rstn axi_freq {addr_offset -1} {addr_range 64K}} {
[AXI_PL_DEV_CONNECT FW_INFO       ${AXI_INTERCONNECT_NAME} ${AXI_MASTER_CLK} ${AXI_MASTER_RSTN} 50000000 ]
[AXI_PL_DEV_CONNECT HOG_INFO      ${AXI_INTERCONNECT_NAME} ${AXI_MASTER_CLK} ${AXI_MASTER_RSTN} 50000000 ]
[AXI_PL_DEV_CONNECT HAL           ${AXI_INTERCONNECT_NAME} clk320 ${AXI_MASTER_RSTN} 3200000000 ]
[AXI_PL_DEV_CONNECT HAL_CORE      ${AXI_INTERCONNECT_NAME} ${AXI_MASTER_CLK} ${AXI_MASTER_RSTN} 50000000 ]
[AXI_PL_DEV_CONNECT H2S           ${AXI_INTERCONNECT_NAME} clkpipe ${AXI_MASTER_RSTN} 4000000000 ]
[AXI_PL_DEV_CONNECT MTC           ${AXI_INTERCONNECT_NAME} clkpipe ${AXI_MASTER_RSTN} 4000000000 ]
[AXI_PL_DEV_CONNECT TF            ${AXI_INTERCONNECT_NAME} clkpipe ${AXI_MASTER_RSTN} 4000000000 ]
[AXI_PL_DEV_CONNECT UCM           ${AXI_INTERCONNECT_NAME} clkpipe ${AXI_MASTER_RSTN} 4000000000 ]
[AXI_PL_DEV_CONNECT DAQ           ${AXI_INTERCONNECT_NAME} clkpipe ${AXI_MASTER_RSTN} 4000000000 ]
[AXI_PL_DEV_CONNECT TAR           ${AXI_INTERCONNECT_NAME} clkpipe ${AXI_MASTER_RSTN} 4000000000 ]
[AXI_PL_DEV_CONNECT MPL           ${AXI_INTERCONNECT_NAME} clkpipe ${AXI_MASTER_RSTN} 4000000000 ]
