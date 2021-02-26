source ../bd/dtsi_helpers.tcl

proc clear_global {variable} {
    upvar $variable testVar
    if { [info exists testVar] } {
	puts "unsetting"
	unset testVar
    }
}

[clear_global AXI_INTERCONNECT_SIZE]
array set AXI_INTERCONNECT_SIZE {}

proc BUILD_AXI_INTERCONNECT {name clk rstn axi_masters axi_master_clks axi_master_rstns} {
    global AXI_INTERCONNECT_SIZE
    
    #create an axi interconnect 
    set AXI_INTERCONNECT_NAME $name

    #assert master_connections and master_clocks are the same size
    if {[llength axi_masters] != [llength axi_master_clks] || [llength axi_masters] != [llength axi_master_rstns]} then {
	error "master size mismatch"
    }
    
    startgroup
    #================================================================================
    #  Create an AXI interconnect
    #================================================================================    
    create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 $AXI_INTERCONNECT_NAME
        
    #connect this interconnect clock and reset signals (do quiet incase the type of the signal is different)
    connect_bd_net -q [get_bd_pins  $clk]   [get_bd_pins $AXI_INTERCONNECT_NAME/ACLK]
    connect_bd_net -q [get_bd_ports $clk]   [get_bd_pins $AXI_INTERCONNECT_NAME/ACLK]
    connect_bd_net -q [get_bd_pins  $rstn]  [get_bd_pins $AXI_INTERCONNECT_NAME/ARESETN]
    connect_bd_net -q [get_bd_ports $rstn]  [get_bd_pins $AXI_INTERCONNECT_NAME/ARESETN]

    #create a slave interface for each AXI_BUS master
    set AXI_MASTER_COUNT [llength $axi_masters]
    set_property CONFIG.NUM_SI $AXI_MASTER_COUNT  [get_bd_cells $AXI_INTERCONNECT_NAME]

    #Loop over all master interfaces requested and connect them to slave interfaces.
    for {set iSlave 0} {$iSlave < ${AXI_MASTER_COUNT}} {incr iSlave} {
	startgroup
	#build this interface's slave interface label
	set slaveID [format "%02d" ${iSlave}]
	set slaveM [lindex $axi_masters ${iSlave}]
	set slaveC [lindex $axi_master_clks ${iSlave}]
	set slaveR [lindex $axi_master_rstns ${iSlave}]		
	puts "Setting up interconnect slave interface for $slaveM"
	
	# Connect the interconnect's slave and master clocks to the processor system's axi master clock (FCLK_CLK0)
	connect_bd_net [get_bd_pins $slaveC] [get_bd_pins $AXI_INTERCONNECT_NAME/S${slaveID}_ACLK]

	# Connect resets
	connect_bd_net [get_bd_pins $slaveR] [get_bd_pins $AXI_INTERCONNECT_NAME/S${slaveID}_ARESETN]

	#connect up this interconnect's slave interface to the master $iSlave driving it
	connect_bd_intf_net [get_bd_intf_pins $slaveM] -boundary_type upper [get_bd_intf_pins $AXI_INTERCONNECT_NAME/S${slaveID}_AXI]
	endgroup
    }

    #zero the number of slaves connected to this interconnect
    set AXI_INTERCONNECT_SIZE($AXI_INTERCONNECT_NAME) 0
    set_property CONFIG.NUM_MI {1}  [get_bd_cells $AXI_INTERCONNECT_NAME]
    endgroup
}




proc AXI_PL_MASTER_PORT {base_name axi_clk axi_rstn axi_freq {type AXI4LITE}} {
    
    create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0  ${base_name}
    set_property CONFIG.DATA_WIDTH 32 [get_bd_intf_ports ${base_name}]
    
    #create clk and reset (-q to skip error if it already exists)
    create_bd_port -q -dir I -type clk $axi_clk
    create_bd_port -q -dir I -type rst $axi_rstn

    #setup clk/reset parameters
    set_property CONFIG.FREQ_HZ          $axi_freq  [get_bd_ports $axi_clk]
    set_property CONFIG.ASSOCIATED_RESET $axi_rstn  [get_bd_ports $axi_clk]

    #set bus properties
    set_property CONFIG.PROTOCOL ${type} [get_bd_intf_ports ${base_name}]
}



#This function automates the adding of a AXI slave that lives outside of the bd.
#It will create external connections for the AXI bus, AXI clock, and AXI reset_n
#for the external slave and connect them up to the axi interconnect in the bd.
#The arguments are
#  device_name: the name of the axi slave (will be used in the dtsi_chunk file)
#  axi_interconnect_name: name of the bd axi interconnect we will be connecting to
#  axi_master_name: name of the channel on the axi interconnect this slave uses
#  axi_clk: the clock used for this axi slave/master channel
#  axi_reset_n: the reset used for this axi slave/master channel
#  axi_clk_freq: the frequency of the AXI clock used for slave/master

proc AXI_PL_DEV_CONNECT {device_name axi_interconnect axi_clk axi_rstn axi_freq {addr_offset -1} {addr_range 64K} {type AXI4LITE}} {
    global AXI_INTERCONNECT_SIZE
    
    startgroup
    
    #create axi port names
    set AXIS_PORT_NAME $device_name
    append AXI_PORT_NAME "_AXIS"    

    set AXI_INTERCONNECT_SID $AXI_INTERCONNECT_SIZE($axi_interconnect)
    
    set AXIM_NAME $axi_interconnect
    append AXIM_NAME "/M" 
    append AXIM_NAME [format "%02d" $AXI_INTERCONNECT_SID]
    #update the number of slaves (master interfaces)
    set AXI_INTERCONNECT_SIZE($axi_interconnect) [expr {${AXI_INTERCONNECT_SID} + 1}]
    set_property CONFIG.NUM_MI $AXI_INTERCONNECT_SIZE($axi_interconnect)  [get_bd_cells $axi_interconnect]

    
    set AXIM_PORT_NAME $AXIM_NAME
    append AXIM_PORT_NAME "_AXI"
    set AXIM_CLK_NAME $AXIM_NAME
    append AXIM_CLK_NAME "_ACLK"
    set AXIM_RSTN_NAME $AXIM_NAME
    append AXIM_RSTN_NAME "_ARESETN"


    #Create an external signal interface and connect them to the axi-interconnect
    make_bd_intf_pins_external -name $AXIS_PORT_NAME  [get_bd_intf_pins  $AXIM_PORT_NAME]

    set_property CONFIG.DATA_WIDTH 32 [get_bd_intf_ports $AXIS_PORT_NAME]
    
    #create clk and reset (-q to skip error if it already exists)
    if ![llength [get_bd_ports -quiet $axi_clk]] {
	create_bd_port -quiet -dir I -type clk $axi_clk
    }
    if ![llength [get_bd_ports -quiet $axi_rstn]] {
	create_bd_port -quiet -dir I -type rst $axi_rstn
    }


    #connect AXI clk/reest ports to AXI interconnect master and setup parameters
    if [llength [get_bd_ports -quiet $axi_clk]] {
	connect_bd_net [get_bd_ports $axi_clk]      [get_bd_pins $AXIM_CLK_NAME]
    } else {
	connect_bd_net [get_bd_pins $axi_clk]      [get_bd_pins $AXIM_CLK_NAME]
    }

    if [llength [get_bd_ports -quiet $axi_rstn]] {
	connect_bd_net [get_bd_ports $axi_rstn]     [get_bd_pins $AXIM_RSTN_NAME]       
    } else {
	connect_bd_net [get_bd_pins $axi_rstn]     [get_bd_pins $AXIM_RSTN_NAME]
    }

    #set bus properties
    set_property CONFIG.FREQ_HZ          $axi_freq  [get_bd_intf_ports ${AXIS_PORT_NAME}]
    set_property CONFIG.PROTOCOL         ${type}    [get_bd_intf_ports $AXIS_PORT_NAME]
    set_property CONFIG.ASSOCIATED_RESET $axi_rstn  [get_bd_intf_ports ${AXIS_PORT_NAME}]
    if [llength [get_bd_ports -quiet $axi_clk]] {
	set_property CONFIG.ASSOCIATED_BUSIF  $device_name [get_bd_ports $axi_clk]
    } else {
	set_property CONFIG.ASSOCIATED_BUSIF  $device_name [get_bd_pins $axi_clk]
    }

    
    #add addressing
    if {$addr_offset == -1} {
	puts "Automatically setting $device_name address"
	assign_bd_address [get_bd_addr_segs {$device_name/Reg }]
    } else {
	puts "Manually setting $device_name address to $addr_offset $addr_range"

	assign_bd_address -verbose -range $addr_range -offset $addr_offset [get_bd_addr_segs $device_name/Reg]
	
    }

    validate_bd_design -quiet
    #now that the design is validated, generate the DTSI_CHUNK file
    [AXI_DEV_UIO_DTSI_CHUNK $axi_interconnect $AXI_INTERCONNECT_SID $device_name]
    
    endgroup
}

proc AXI_CONNECT {device_name axi_interconnect axi_clk axi_rstn axi_freq {addr_offset -1} {addr_range 64K} {slave_local 1}} {
    global AXI_INTERCONNECT_SIZE

    startgroup

    #create axi port names
    set AXI_INTERCONNECT_SID $AXI_INTERCONNECT_SIZE($axi_interconnect)
    
    set AXIM_NAME $axi_interconnect
    append AXIM_NAME "/M" 
    append AXIM_NAME  [format "%02d" $AXI_INTERCONNECT_SID]
    #update the number of slaves
    set AXI_INTERCONNECT_SIZE($axi_interconnect) [expr {${AXI_INTERCONNECT_SID} + 1}]
    set_property CONFIG.NUM_MI $AXI_INTERCONNECT_SIZE($axi_interconnect)  [get_bd_cells $axi_interconnect]

    set AXIM_PORT_NAME $AXIM_NAME
    append AXIM_PORT_NAME "_AXI"
    set AXIM_CLK_NAME $AXIM_NAME
    append AXIM_CLK_NAME "_ACLK"
    set AXIM_RSTN_NAME $AXIM_NAME
    append AXIM_RSTN_NAME "_ARESETN"
    
    #connect the requested clock to the AXI interconnect clock port
    connect_bd_net [get_bd_pins $axi_clk]   [get_bd_pins ${AXIM_CLK_NAME}]
    connect_bd_net [get_bd_pins $axi_rstn]  [get_bd_pins ${AXIM_RSTN_NAME}]

    
    #Xilinx AXI slaves use different names for the AXI connection, this if/else tree will try to find the correct one. 
    if [llength [get_bd_intf_pins -quiet $device_name/S_AXI]] {
        connect_bd_intf_net [get_bd_intf_pins $device_name/S_AXI] -boundary_type upper [get_bd_intf_pins $AXIM_PORT_NAME]
	if [llength [get_bd_pins -quiet $device_name/s_axi_aclk]] {
	    connect_bd_net -quiet     [get_bd_pins $device_name/s_axi_aclk]             [get_bd_pins $axi_clk]
	    connect_bd_net -quiet     [get_bd_pins $device_name/s_axi_aresetn]          [get_bd_pins $axi_rstn]
	} elseif [llength [get_bd_pins -quiet $device_name/s_aclk]] {
	    connect_bd_net -quiet     [get_bd_pins $device_name/s_aclk]             [get_bd_pins $axi_clk]
	    connect_bd_net -quiet     [get_bd_pins $device_name/s_aresetn]          [get_bd_pins $axi_rstn]
	} else {
	    connect_bd_net -quiet     [get_bd_pins $device_name/aclk]             [get_bd_pins $axi_clk]
	    connect_bd_net -quiet     [get_bd_pins $device_name/aresetn]          [get_bd_pins $axi_rstn]
	}
    } elseif [llength [get_bd_intf_pins -quiet $device_name/s_axi_lite]] {
        connect_bd_intf_net [get_bd_intf_pins $device_name/s_axi_lite] -boundary_type upper [get_bd_intf_pins $AXIM_PORT_NAME]
        connect_bd_net -quiet     [get_bd_pins $device_name/s_axi_aclk]             [get_bd_pins $axi_clk]
        connect_bd_net -quiet     [get_bd_pins $device_name/s_axi_aresetn]          [get_bd_pins $axi_rstn]
    } else {
        connect_bd_intf_net [get_bd_intf_pins $device_name/*AXI*LITE*] -boundary_type upper [get_bd_intf_pins $AXIM_PORT_NAME]
        connect_bd_net -quiet     [get_bd_pins $device_name/s_axi_aclk]             [get_bd_pins $axi_clk]
        connect_bd_net -quiet     [get_bd_pins $device_name/s_axi_aresetn]          [get_bd_pins $axi_rstn]
    }
    endgroup
    return $AXI_INTERCONNECT_SID
}
proc AXI_SET_ADDR {device_name {addr_offset -1} {addr_range 64K} {force_mem 0}} {

    startgroup
    
    #add addressing
    if {$addr_offset == -1} {
	puts "Automatically setting $device_name address"
	assign_bd_address [get_bd_addr_segs {$device_name/*/Reg }]
    } else {
	if {($force_mem == 0) && [llength [get_bd_addr_segs ${device_name}/*Reg*]]} {
	    puts "Manually setting $device_name Reg address to $addr_offset $addr_range"
	    assign_bd_address -verbose -range $addr_range -offset $addr_offset [get_bd_addr_segs $device_name/*/Reg*]
	} else {
	    puts "Manually setting $device_name Mem address to $addr_offset $addr_range"
	    assign_bd_address -verbose -range $addr_range -offset $addr_offset [get_bd_addr_segs $device_name/*/Mem*]
	}
	
    }

    endgroup
}
proc AXI_GEN_DTSI {device_name axi_interconnect sid {slave_local 1}} {

    startgroup
    validate_bd_design -quiet

    #Add this to the list of slave we need to make dtsi files for
    if {$slave_local == 1} {
	#if this is a local Xilinx IP core, most info is done by Vivado
	[AXI_DEV_UIO_DTSI_POST_CHUNK $device_name]
    } elseif {$slave_local == 0} {
	#if this is accessed via axi C2C, then we need to write a full dtsi entry
	[AXI_DEV_UIO_DTSI_CHUNK $axi_interconnect $sid ${device_name}]
    }
    #else {
	#do not generate a file
    #}
    

    endgroup

}
#This function is a simpler version of AXI_PL_DEV_CONNECT used for axi slaves in the bd.
proc AXI_DEV_CONNECT {device_name axi_interconnect axi_clk axi_rstn axi_freq {addr_offset -1} {addr_range 64K} {slave_local 1} {force_mem 0}} {

    set sid [AXI_CONNECT $device_name $axi_interconnect $axi_clk $axi_rstn $axi_freq $addr_offset $addr_range $slave_local]
    AXI_SET_ADDR $device_name $addr_offset $addr_range $force_mem
    AXI_GEN_DTSI $device_name $axi_interconnect $sid $slave_local    
}

#This function is a simpler version of AXI_PL_DEV_CONNECT used for axi slaves in the bd.
#The arguments are the device name, axi master name+channel and the clk/reset for the
#channel
proc AXI_LITE_DEV_CONNECT {device_name axi_interconnect axi_clk axi_rstn axi_freq {addr_offset -1} {addr_range 64K} {slave_local 1}} {
    startgroup
    global AXI_INTERCONNECT_SIZE

    startgroup

    #create axi port names
    set AXI_INTERCONNECT_SID [format "%02d" $AXI_INTERCONNECT_SIZE($axi_interconnect)]
    
    set AXIM_NAME $axi_interconnect
    append AXIM_NAME "/M" 
    append AXIM_NAME  [format "%02d" $AXI_INTERCONNECT_SID]
    #update the number of slaves
    set AXI_INTERCONNECT_SIZE($axi_interconnect) [expr {${AXI_INTERCONNECT_SID} + 1}]
    set_property CONFIG.NUM_MI $AXI_INTERCONNECT_SIZE($axi_interconnect)  [get_bd_cells $axi_interconnect]

    set AXIM_PORT_NAME $AXIM_NAME
    append AXIM_PORT_NAME "_AXI"
    set AXIM_CLK_NAME $AXIM_NAME
    append AXIM_CLK_NAME "_ACLK"
    set AXIM_RSTN_NAME $AXIM_NAME
    append AXIM_RSTN_NAME "_ARESETN"
    
    #connect the requested clock to the AXI interconnect clock port 
    connect_bd_net [get_bd_pins $axi_clk]   [get_bd_pins ${AXIM_CLK_NAME}]
    connect_bd_net [get_bd_pins $axi_rstn]  [get_bd_pins ${AXIM_RSTN_NAME}]


    #Xilinx AXI slaves use different names for the AXI connection, this if/else tree will try to find the correct one. 
    if [llength [get_bd_intf_pins -quiet $device_name/S_AXI_lite]] {
	connect_bd_intf_net [get_bd_intf_pins $device_name/S_AXI_lite] -boundary_type upper [get_bd_intf_pins $AXIM_PORT_NAME]

	if       [llength [get_bd_pins -quiet $device_name/s_axi_aclk]] {
	    connect_bd_net      [get_bd_pins $device_name/s_axi_aclk]             [get_bd_pins $axi_clk]
	    connect_bd_net      [get_bd_pins $device_name/s_axi_aresetn]          [get_bd_pins $axi_rstn]
	} elseif [llength [get_bd_pins -quiet $device_name/s_axi_lite_aclk]] {
	    connect_bd_net      [get_bd_pins $device_name/s_axi_lite_aclk]        [get_bd_pins $axi_clk]
	    connect_bd_net      [get_bd_pins $device_name/s_aresetn]     [get_bd_pins $axi_rstn]	    
        } else {	           
	    connect_bd_net      [get_bd_pins $device_name/s_aclk]                 [get_bd_pins $axi_clk]
	    connect_bd_net      [get_bd_pins $device_name/s_aresetn]              [get_bd_pins $axi_rstn]	
}
    } else {
        connect_bd_intf_net     [get_bd_intf_pins $device_name/AXI_LITE] -boundary_type upper [get_bd_intf_pins $AXIM_PORT_NAME]
        connect_bd_net          [get_bd_pins $device_name/s_axi_aclk]             [get_bd_pins $axi_clk]
        connect_bd_net          [get_bd_pins $device_name/s_axi_aresetn]          [get_bd_pins $axi_rstn]
    }

    validate_bd_design -quiet

    #Add this to the list of slave we need to make dtsi files for
    if {$slave_local == 1} {
	#if this is a local Xilinx IP core, most info is done by Vivado
	[AXI_DEV_UIO_DTSI_POST_CHUNK $device_name]
    } elseif {$slave_local == 0} {
	#if this is accessed via axi C2C, then we need to write a full dtsi entry
	[AXI_DEV_UIO_DTSI_CHUNK $axi_interconnect $AXI_INTERCONNECT_SID ${device_name}]
    }
    #else {
	#do not generate a file
    #}
    

    endgroup
}

proc AXI_CTL_DEV_CONNECT {device_name axi_interconnect axi_clk axi_rstn axi_freq {addr_offset -1} {addr_range 64K} {slave_local 1}} {
    startgroup
    global AXI_INTERCONNECT_SIZE

    startgroup

    #create axi port names
    set AXI_INTERCONNECT_SID $AXI_INTERCONNECT_SIZE($axi_interconnect)
    
    set AXIM_NAME $axi_interconnect
    append AXIM_NAME "/M" 
    append AXIM_NAME  [format "%02d" $AXI_INTERCONNECT_SID]
    #update the number of slaves
    set AXI_INTERCONNECT_SIZE($axi_interconnect) [expr {${AXI_INTERCONNECT_SID} + 1}]
    set_property CONFIG.NUM_MI $AXI_INTERCONNECT_SIZE($axi_interconnect)  [get_bd_cells $axi_interconnect]


    set AXIM_PORT_NAME $AXIM_NAME
    append AXIM_PORT_NAME "_AXI"
    set AXIM_CLK_NAME $AXIM_NAME
    append AXIM_CLK_NAME "_ACLK"
    set AXIM_RSTN_NAME $AXIM_NAME
    append AXIM_RSTN_NAME "_ARESETN"
    
    #connect the requested clock to the AXI interconnect clock port 
    connect_bd_net [get_bd_pins $axi_clk]   [get_bd_pins ${AXIM_CLK_NAME}]
    connect_bd_net [get_bd_pins $axi_rstn]  [get_bd_pins ${AXIM_RSTN_NAME}]


    #Xilinx AXI slaves use different names for the AXI connection, this if/else tree will try to find the correct one. 
    connect_bd_intf_net     [get_bd_intf_pins $device_name/S_AXI_CTL] -boundary_type upper [get_bd_intf_pins $AXIM_PORT_NAME]
    connect_bd_net  -quiet  [get_bd_pins $device_name/aclk]             [get_bd_pins $axi_clk]
    connect_bd_net  -quiet  [get_bd_pins $device_name/aresetn]          [get_bd_pins $axi_rstn]

    validate_bd_design -quiet

    #Add this to the list of slave we need to make dtsi files for
    if {$slave_local == 1} {
	#if this is a local Xilinx IP core, most info is done by Vivado
	[AXI_DEV_UIO_DTSI_POST_CHUNK $device_name]
    } elseif {$slave_local == 0} {
	#if this is accessed via axi C2C, then we need to write a full dtsi entry
	[AXI_DEV_UIO_DTSI_CHUNK $axi_interconnect $AXI_INTERCONNECT_SID ${device_name}]
    }
    #else {
	#do not generate a file
    #}
    

    endgroup
}


proc BUILD_JTAG_AXI_MASTER {device_name axi_clk axi_rstn} {
    create_bd_cell -type ip -vlnv xilinx.com:ip:jtag_axi:1.2 ${device_name}
    connect_bd_net [get_bd_ports ${axi_clk}] [get_bd_pins ${device_name}/aclk]
    connect_bd_net [get_bd_pins  ${device_name}/aresetn] [get_bd_pins ${axi_rstn}]
}
