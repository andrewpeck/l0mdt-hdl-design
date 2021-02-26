source ../bd/axi_helpers.tcl
proc AXI_IP_I2C {device_name axi_interconnect axi_clk axi_rstn axi_freq {addr_offset -1} {addr_range 64K} {slave_local 1}} {

    create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 $device_name

    #create external pins
    make_bd_pins_external  -name ${device_name}_scl_i [get_bd_pins $device_name/scl_i]
    make_bd_pins_external  -name ${device_name}_sda_i [get_bd_pins $device_name/sda_i]
    make_bd_pins_external  -name ${device_name}_sda_o [get_bd_pins $device_name/sda_o]
    make_bd_pins_external  -name ${device_name}_scl_o [get_bd_pins $device_name/scl_o]
    make_bd_pins_external  -name ${device_name}_scl_t [get_bd_pins $device_name/scl_t]
    make_bd_pins_external  -name ${device_name}_sda_t [get_bd_pins $device_name/sda_t]
    #connect to AXI, clk, and reset between slave and mastre
    [AXI_DEV_CONNECT $device_name $axi_interconnect $axi_clk $axi_rstn $axi_freq $addr_offset $addr_range $slave_local]

    puts "Added Xilinx I2C AXI Slave: $device_name"
}

proc AXI_IP_XVC {device_name axi_interconnect axi_clk axi_rstn axi_freq {addr_offset -1} {addr_range 64K} {slave_local 1}} {

    #Create a xilinx axi debug bridge
    create_bd_cell -type ip -vlnv xilinx.com:ip:debug_bridge:3.0 $device_name
    #configure the debug bridge to be 
    set_property CONFIG.C_DEBUG_MODE  {3} [get_bd_cells $device_name]
    set_property CONFIG.C_DESIGN_TYPE {0} [get_bd_cells $device_name]

    #connect to AXI, clk, and reset between slave and mastre
    [AXI_DEV_CONNECT $device_name $axi_interconnect $axi_clk $axi_rstn $axi_freq $addr_offset $addr_range $slave_local]

    
    #generate ports for the JTAG signals
    make_bd_pins_external       [get_bd_cells $device_name]
    make_bd_intf_pins_external  [get_bd_cells $device_name]

    puts "Added Xilinx XVC AXI Slave: $device_name"
}

proc AXI_IP_LOCAL_XVC {device_name axi_interconnect axi_clk axi_rstn axi_freq {addr_offset -1} {addr_range 64K} {slave_local 1}} {

    #Create a xilinx axi debug bridge
    create_bd_cell -type ip -vlnv xilinx.com:ip:debug_bridge:3.0 $device_name
    #configure the debug bridge to be 
    set_property CONFIG.C_DEBUG_MODE {2}     [get_bd_cells $device_name]
    set_property CONFIG.C_BSCAN_MUX {2}      [get_bd_cells $device_name]
    set_property CONFIG.C_XVC_HW_ID {0x0001} [get_bd_cells $device_name]

    
    #test
    set_property CONFIG.C_NUM_BS_MASTER {1} [get_bd_cells $device_name]

    
    #connect to AXI, clk, and reset between slave and mastre
    [AXI_DEV_CONNECT $device_name $axi_interconnect $axi_clk $axi_rstn $axi_freq $addr_offset $addr_range $slave_local]


    #test
    create_bd_cell -type ip -vlnv xilinx.com:ip:debug_bridge:3.0 debug_bridge_0
    connect_bd_intf_net [get_bd_intf_pins ${device_name}/m0_bscan] [get_bd_intf_pins debug_bridge_0/S_BSCAN]
    connect_bd_net [get_bd_pins debug_bridge_0/clk] [get_bd_pins $axi_clk]

    puts "Added Xilinx Local XVC AXI Slave: $device_name"
    
}

proc AXI_IP_UART {baud_rate irq_port device_name axi_interconnect axi_clk axi_rstn axi_freq {addr_offset -1} {addr_range 64K} {slave_local 1}} {

    #Create a xilinx UART
    create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 $device_name
    #configure the debug bridge to be
    set_property CONFIG.C_BAUDRATE $baud_rate [get_bd_cells $device_name]

    #connect to AXI, clk, and reset between slave and mastre
    [AXI_DEV_CONNECT $device_name $axi_interconnect $axi_clk $axi_rstn $axi_freq $addr_offset $addr_range -1]

    
    #generate ports for the JTAG signals
    make_bd_intf_pins_external  -name ${device_name} [get_bd_intf_pins $device_name/UART]

    #connect interrupt
    connect_bd_net [get_bd_pins ${device_name}/interrupt] [get_bd_pins ${irq_port}]

    
    puts "Added Xilinx UART AXI Slave: $device_name"
}

#primary_serdes == 1 means this is the primary serdes, if not 1, then it is the name of the primary_serdes
proc C2C_AURORA {device_name primary_serdes init_clk axi_interconnect axi_clk axi_rstn axi_freq refclk_freq} {

    if {$primary_serdes == 1} {
	puts "Creating ${device_name} as a primary serdes\n"
    } else {
	puts "Creating ${device_name} using ${primary_serdes} as the primary serdes\n"
    }
    
    set C2C ${device_name}
    set C2C_PHY ${C2C}_PHY    
    #create chip-2-chip aurora     
#    startgroup 
    create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_64b66b:11.2 ${C2C_PHY}        
    set_property CONFIG.C_INIT_CLK.VALUE_SRC PROPAGATED   [get_bd_cells ${C2C_PHY}]  
    set_property CONFIG.C_AURORA_LANES       {1}          [get_bd_cells ${C2C_PHY}]
    #set_property CONFIG.C_AURORA_LANES       {2}          [get_bd_cells ${C2C_PHY}]  
    set_property CONFIG.C_LINE_RATE          {5}          [get_bd_cells ${C2C_PHY}]
#    set_property CONFIG.C_LINE_RATE          {10}          [get_bd_cells ${C2C_PHY}]  
    set_property CONFIG.C_REFCLK_FREQUENCY   ${refclk_freq}    [get_bd_cells ${C2C_PHY}]  
    set_property CONFIG.interface_mode       {Streaming}  [get_bd_cells ${C2C_PHY}]
    if {$primary_serdes == 1} {
	set_property CONFIG.SupportLevel         {1}          [get_bd_cells ${C2C_PHY}]
    } else {
	set_property CONFIG.SupportLevel         {0}          [get_bd_cells ${C2C_PHY}]
    }
    set_property CONFIG.SINGLEEND_INITCLK    {true}       [get_bd_cells ${C2C_PHY}]  
    set_property CONFIG.C_USE_CHIPSCOPE      {true}       [get_bd_cells ${C2C_PHY}]
    set_property CONFIG.drp_mode             {AXI4_LITE}  [get_bd_cells ${C2C_PHY}]
    set_property CONFIG.TransceiverControl   {false}      [get_bd_cells ${C2C_PHY}]  
    set_property CONFIG.TransceiverControl   {true}       [get_bd_cells ${C2C_PHY}]
   
    
#    set_property -dict [list CONFIG.C_GT_CLOCK_1 {GTXQ3} CONFIG.C_GT_LOC_9 {X} CONFIG.C_GT_LOC_15 {1}]          [get_bd_cells ${C2C_PHY}]

    
    #connect to interconnect (init clock)
    set C2C_ARST ${C2C_PHY}_AXI_LITE_RESET_INVERTER
    create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 ${C2C_ARST}
    set_property -dict [list CONFIG.C_SIZE {1} CONFIG.C_OPERATION {not} CONFIG.LOGO_FILE {data/sym_notgate.png}] [get_bd_cells ${C2C_ARST}]
    connect_bd_net  [get_bd_pins ${C2C}/aurora_reset_pb] [get_bd_pins ${C2C_ARST}/Op1]
    #    connect_bd_net  [get_bd_pins ${C2C_ARST}/Res]        [get_bd_pins $AXI_BUS_RST(${C2C_PHY})]
#    [AXI_DEV_CONNECT ${C2C_PHY} $axi_interconnect $init_clk ${C2C_ARST}/Res $axi_freq]
    set sid [AXI_CONNECT ${C2C_PHY} $axi_interconnect $init_clk ${C2C_ARST}/Res $axi_freq]
    AXI_SET_ADDR ${C2C_PHY}    


    
    #expose the Aurora core signals to top    
    if {$primary_serdes == 1} {
	#these are only if the serdes is the primary one
	make_bd_intf_pins_external  -name ${C2C_PHY}_refclk         [get_bd_intf_pins ${C2C_PHY}/GT_DIFF_REFCLK1]    
	make_bd_pins_external       -name ${C2C_PHY}_gt_refclk1_out [get_bd_pins ${C2C_PHY}/gt_refclk1_out]
    }
    make_bd_intf_pins_external  -name ${C2C_PHY}_Rx             [get_bd_intf_pins ${C2C_PHY}/GT_SERIAL_RX]       
    make_bd_intf_pins_external  -name ${C2C_PHY}_Tx             [get_bd_intf_pins ${C2C_PHY}/GT_SERIAL_TX]
    make_bd_pins_external       -name ${C2C_PHY}_power_down     [get_bd_pins ${C2C_PHY}/power_down]       
    make_bd_pins_external       -name ${C2C_PHY}_gt_pll_lock    [get_bd_pins ${C2C_PHY}/gt_pll_lock]
    make_bd_pins_external       -name ${C2C_PHY}_hard_err       [get_bd_pins ${C2C_PHY}/hard_err]
    make_bd_pins_external       -name ${C2C_PHY}_soft_err       [get_bd_pins ${C2C_PHY}/soft_err]
    make_bd_pins_external       -name ${C2C_PHY}_lane_up        [get_bd_pins ${C2C_PHY}/lane_up]
    make_bd_pins_external       -name ${C2C_PHY}_mmcm_not_locked_out  [get_bd_pins ${C2C_PHY}/mmcm_not_locked_out]       
    make_bd_pins_external       -name ${C2C_PHY}_link_reset_out [get_bd_pins ${C2C_PHY}/link_reset_out]

    make_bd_intf_pins_external  -name ${C2C_PHY}_DEBUG          [get_bd_intf_pins ${C2C_PHY}/TRANSCEIVER_DEBUG0]

    
    
    #connect C2C core with the C2C-mode Auroroa core   
    connect_bd_intf_net [get_bd_intf_pins ${C2C}/AXIS_TX] [get_bd_intf_pins ${C2C_PHY}/USER_DATA_S_AXIS_TX]        
    connect_bd_intf_net [get_bd_intf_pins ${C2C_PHY}/USER_DATA_M_AXIS_RX] [get_bd_intf_pins ${C2C}/AXIS_RX]        
    connect_bd_net [get_bd_pins ${C2C_PHY}/channel_up]          [get_bd_pins ${C2C}/axi_c2c_aurora_channel_up]     
    connect_bd_net [get_bd_pins ${C2C}/aurora_pma_init_out]     [get_bd_pins ${C2C_PHY}/pma_init]        
    connect_bd_net [get_bd_pins ${C2C}/aurora_reset_pb]         [get_bd_pins ${C2C_PHY}/reset_pb]        
    if {$primary_serdes == 1} {
	connect_bd_net [get_bd_pins ${C2C_PHY}/user_clk_out]        [get_bd_pins ${C2C}/axi_c2c_phy_clk]
	connect_bd_net [get_bd_pins ${C2C_PHY}/mmcm_not_locked_out] [get_bd_pins ${C2C}/aurora_mmcm_not_locked]        
    } else {
	connect_bd_net [get_bd_pins ${primary_serdes}/user_clk_out]        [get_bd_pins ${C2C_PHY}/user_clk]
	connect_bd_net [get_bd_pins ${primary_serdes}/user_clk_out]        [get_bd_pins ${C2C}/axi_c2c_phy_clk]
	connect_bd_net [get_bd_pins ${primary_serdes}/mmcm_not_locked_out] [get_bd_pins ${C2C}/aurora_mmcm_not_locked]        
#	connect_bd_net [get_bd_pins ${primary_serdes}/mmcm_not_locked_out] [get_bd_pins ${C2C_PHY}/mmcm_not_locked]        
    }
    
    #connect external 200Mhz clock to init clocks      
    connect_bd_net [get_bd_ports ${init_clk}]   [get_bd_pins ${C2C_PHY}/init_clk]       
    connect_bd_net [get_bd_ports ${init_clk}]   [get_bd_pins ${C2C_PHY}/drp_clk_in]
    connect_bd_net [get_bd_ports ${init_clk}]   [get_bd_pins ${C2C}/aurora_init_clk]
    if {$primary_serdes == 1} {
	#provide a clk output of the C2C_PHY user clock 
	create_bd_port -dir O -type clk ${C2C_PHY}_CLK
        connect_bd_net [get_bd_ports ${C2C_PHY}_CLK] [get_bd_pins ${C2C_PHY}/user_clk_out]	
    } else {
	#connect up clocking resource to primary C2C_PHY
	connect_bd_net [get_bd_pins ${primary_serdes}/gt_refclk1_out]            [get_bd_pins ${C2C_PHY}/refclk1_in]
	connect_bd_net [get_bd_pins ${primary_serdes}/gt_qpllclk_quad3_out]      [get_bd_pins ${C2C_PHY}/gt_qpllclk_quad3_in]
	connect_bd_net [get_bd_pins ${primary_serdes}/gt_qpllrefclk_quad3_out]   [get_bd_pins ${C2C_PHY}/gt_qpllrefclk_quad3_in]
	connect_bd_net [get_bd_pins ${primary_serdes}/sync_clk_out]              [get_bd_pins ${C2C_PHY}/sync_clk]
    }

    #    validate_bd_design
    AXI_GEN_DTSI ${C2C_PHY} $axi_interconnect $sid
    
#    endgroup      
}

proc AXI_C2C_MASTER {device_name axi_interconnect axi_clk axi_rstn axi_freq primary_serdes init_clk refclk_freq {addr_offset -1} {addr_range 64K} {addrLITE_offset -1} {addrLITE_range 64K} } {

    #create AXI(4) firewall IPs to handle a bad C2C link
    set AXI_FW ${device_name}_AXI_FW
    create_bd_cell -type ip -vlnv xilinx.com:ip:axi_firewall:1.0 ${AXI_FW}
    #force mapping to the mem interface on this one. 
    [AXI_DEV_CONNECT $AXI_FW $axi_interconnect $axi_clk $axi_rstn $axi_freq $addr_offset $addr_range]
    [AXI_CTL_DEV_CONNECT $AXI_FW $axi_interconnect $axi_clk $axi_rstn $axi_freq]    

    #create AXI(4LITE) firewall IPs to handle a bad C2C link
    set AXILITE_FW ${device_name}_AXILITE_FW
    create_bd_cell -type ip -vlnv xilinx.com:ip:axi_firewall:1.0 ${AXILITE_FW}
    [AXI_DEV_CONNECT $AXILITE_FW $axi_interconnect $axi_clk $axi_rstn $axi_freq $addrLITE_offset $addrLITE_range]
    [AXI_CTL_DEV_CONNECT $AXILITE_FW $axi_interconnect $axi_clk $axi_rstn $axi_freq]

    #create the actual C2C master
    create_bd_cell -type ip -vlnv xilinx.com:ip:axi_chip2chip:5.0 $device_name
    set_property CONFIG.C_AXI_STB_WIDTH {4}         [get_bd_cells $device_name]
    set_property CONFIG.C_AXI_DATA_WIDTH {32}	    [get_bd_cells $device_name]
    set_property CONFIG.C_NUM_OF_IO {58.0}	    [get_bd_cells $device_name]
    set_property CONFIG.C_INTERFACE_MODE {1}	    [get_bd_cells $device_name]
    set_property CONFIG.C_INTERFACE_TYPE {2}	    [get_bd_cells $device_name]
    set_property CONFIG.C_AURORA_WIDTH {1.0}        [get_bd_cells $device_name]
    set_property CONFIG.C_EN_AXI_LINK_HNDLR {false} [get_bd_cells $device_name]
    set_property CONFIG.C_INCLUDE_AXILITE   {1}     [get_bd_cells $device_name]

    #connect AXI interface to the firewall
    connect_bd_intf_net [get_bd_intf_pins ${device_name}/s_axi] [get_bd_intf_pins ${AXI_FW}/M_AXI]
    connect_bd_net      [get_bd_pins ${device_name}/s_aclk]     [get_bd_pins $axi_clk]
    connect_bd_net      [get_bd_pins ${device_name}/s_aresetn]  [get_bd_pins $axi_rstn]
    AXI_SET_ADDR ${device_name} $addr_offset $addr_range 1
    
    #connect AXI LITE interface to the firewall
    connect_bd_intf_net [get_bd_intf_pins ${device_name}/s_axi_lite] [get_bd_intf_pins ${AXILITE_FW}/M_AXI]
    connect_bd_net      [get_bd_pins ${device_name}/s_axi_lite_aclk] [get_bd_pins $axi_clk]
    AXI_SET_ADDR ${device_name} $addrLITE_offset $addrLITE_range

    make_bd_pins_external       -name ${device_name}_aurora_pma_init_in [get_bd_pins ${device_name}/aurora_pma_init_in]
    #expose debugging signals
    make_bd_pins_external       -name ${device_name}_aurora_do_cc [get_bd_pins ${device_name}/aurora_do_cc]
    make_bd_pins_external       -name ${device_name}_axi_c2c_config_error_out    [get_bd_pins ${device_name}/axi_c2c_config_error_out   ]
    make_bd_pins_external       -name ${device_name}_axi_c2c_link_status_out     [get_bd_pins ${device_name}/axi_c2c_link_status_out    ]
    make_bd_pins_external       -name ${device_name}_axi_c2c_multi_bit_error_out [get_bd_pins ${device_name}/axi_c2c_multi_bit_error_out]
    make_bd_pins_external       -name ${device_name}_axi_c2c_link_error_out      [get_bd_pins ${device_name}/axi_c2c_link_error_out     ]

    
    [C2C_AURORA ${device_name} $primary_serdes $init_clk $axi_interconnect $axi_clk $axi_rstn $axi_freq $refclk_freq]
    
    #assign_bd_address [get_bd_addr_segs {$device_name/S_AXI/Mem }]
    puts "Added C2C master: $device_name"
}

proc AXI_IP_XADC {device_name axi_interconnect axi_clk axi_rstn axi_freq {addr_offset -1} {addr_range 64K} {slave_local 1}} {
    #create XADC AXI slave 
    create_bd_cell -type ip -vlnv xilinx.com:ip:xadc_wiz:3.3 ${device_name}

    #disable default user temp monitoring
    set_property CONFIG.USER_TEMP_ALARM {false} [get_bd_cells ${device_name}]

    
    #connect to interconnect
    [AXI_DEV_CONNECT $device_name $axi_interconnect $axi_clk $axi_rstn $axi_freq $addr_offset $addr_range $slave_local]

    
    #expose alarms
    make_bd_pins_external   -name ${device_name}_alarm             [get_bd_pins ${device_name}/alarm_out]
    make_bd_pins_external   -name ${device_name}_vccint_alarm      [get_bd_pins ${device_name}/vccint_alarm_out]
    make_bd_pins_external   -name ${device_name}_vccaux_alarm      [get_bd_pins ${device_name}/vccaux_alarm_out]
    make_bd_pins_external   -name ${device_name}_vccpint_alarm     [get_bd_pins ${device_name}/vccpint_alarm_out]
    make_bd_pins_external   -name ${device_name}_vccpaux_alarm     [get_bd_pins ${device_name}/vccpaux_alarm_out]
    make_bd_pins_external   -name ${device_name}_vccddro_alarm     [get_bd_pins ${device_name}/vccddro_alarm_out]
    make_bd_pins_external   -name ${device_name}_overtemp_alarm    [get_bd_pins ${device_name}/ot_alarm_out]

    puts "Added Xilinx XADC AXI Slave: $device_name"

}



proc AXI_IP_SYS_MGMT {device_name axi_interconnect axi_clk axi_rstn axi_freq {addr_offset -1} {addr_range 64K} {slave_local 1}} {
    
    #create system management AXIL lite slave
    create_bd_cell -type ip -vlnv xilinx.com:ip:system_management_wiz:1.3 ${device_name}

    #disable default user temp monitoring
    set_property CONFIG.USER_TEMP_ALARM {false}        [get_bd_cells ${device_name}]
    #add i2c interface
    set_property CONFIG.SERIAL_INTERFACE {Enable_I2C}  [get_bd_cells ${device_name}]
    set_property CONFIG.I2C_ADDRESS_OVERRIDE {false}   [get_bd_cells ${device_name}]
    
    #connect to interconnect
    [AXI_DEV_CONNECT $device_name $axi_interconnect $axi_clk $axi_rstn $axi_freq $addr_offset $addr_range $slave_local]

    
    #expose alarms
    make_bd_pins_external   -name ${device_name}_alarm             [get_bd_pins ${device_name}/alarm_out]
    make_bd_pins_external   -name ${device_name}_vccint_alarm      [get_bd_pins ${device_name}/vccint_alarm_out]
    make_bd_pins_external   -name ${device_name}_vccaux_alarm      [get_bd_pins ${device_name}/vccaux_alarm_out]
    make_bd_pins_external   -name ${device_name}_overtemp_alarm    [get_bd_pins ${device_name}/ot_out]

    #expose i2c interface
    make_bd_pins_external  -name ${device_name}_sda [get_bd_pins ${device_name}/i2c_sda]
    make_bd_pins_external  -name ${device_name}_scl [get_bd_pins ${device_name}/i2c_sclk]
    
    puts "Added Xilinx XADC AXI Slave: $device_name"

}


proc AXI_IP_BRAM {device_name axi_interconnect axi_clk axi_rstn axi_freq {addr_offset -1} {addr_range 64K} {slave_local 1}} {

    #create XADC AXI slave 
    create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 ${device_name}

    set_property CONFIG.SINGLE_PORT_BRAM {1} [get_bd_cells ${device_name}]

    
    #connect to interconnect
    [AXI_DEV_CONNECT $device_name $axi_interconnect $axi_clk $axi_rstn $axi_freq $addr_offset $addr_range $slave_local]


    #connect this to a blockram
    set BRAM_NAME ${device_name}_RAM
    create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 ${BRAM_NAME}
    set_property CONFIG.Memory_Type            {True_Dual_Port_RAM}   [get_bd_cells ${BRAM_NAME}]
    set_property CONFIG.Assume_Synchronous_Clk {false}                [get_bd_cells ${BRAM_NAME}]

    
    #connect BRAM controller to BRAM
    connect_bd_intf_net [get_bd_intf_pins ${device_name}/BRAM_PORTA] [get_bd_intf_pins ${BRAM_NAME}/BRAM_PORTA]

    #make the other port external to the PL
    make_bd_intf_pins_external  [get_bd_intf_pins ${BRAM_NAME}/BRAM_PORTB]

    puts "Added Xilinx blockram: $device_name"
}
