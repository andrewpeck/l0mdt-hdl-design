proc simulate {} {	
	eval vsim work.testbench_top -t 10ps -novopt
	reset_waves 0	
	restart -force	
	run 2500ns
}

proc send_reset {} {
	
	force -freeze sim:/testbench_top/start_reset 0 0
	force -freeze sim:/testbench_top/start_reset 1 500 ns
	force -freeze sim:/testbench_top/start_reset 0 1000 ns
	
	run 100us
	
	if { [exa sim:/testbench_top/rx_ctrl] != [format "8'h%02x" 0x63] } { 
		return -1
	}
	
	return 0
}

proc send_connect {} {
	
	force -freeze sim:/testbench_top/start_connect 0 0
	force -freeze sim:/testbench_top/start_connect 1 500 ns
	force -freeze sim:/testbench_top/start_connect 0 1000 ns
	
	run 100us
	
	if { [exa sim:/testbench_top/rx_ctrl] != [format "8'h%02x" 0x63] } { 
		return -1
	}
	
	return 0
}

proc send_command {addr trid channel command data} {

	force -freeze sim:/testbench_top/tx_addr 8'h$addr 0
	force -freeze sim:/testbench_top/tx_trid 8'h$trid 0
	force -freeze sim:/testbench_top/tx_ch 8'h$channel 0
	force -freeze sim:/testbench_top/tx_cmd 8'h$command 0
	force -freeze sim:/testbench_top/tx_data 32'h$data 0
	
    force -freeze sim:/testbench_top/inject_crc_error 0 0

	force -freeze sim:/testbench_top/start_transaction 0 0
	force -freeze sim:/testbench_top/start_transaction 1 500 ns
	force -freeze sim:/testbench_top/start_transaction 0 1000 ns
	
    run 100us
	
	
	if { [exa sim:/testbench_top/rx_trid] != [format "8'h%02x" $trid] } { 
		return -1
	}
	
	if { [exa sim:/testbench_top/rx_ch] != [format "8'h%02x" $channel] } { 
		return -2
	}
	
	if { [exa sim:/testbench_top/rx_err] != [format "8'h%02x" 0] } { 
		return -3
	}
	
	return 0
}

proc reset_waves { verbosity } {

	add wave -noupdate -divider -height 20 "Reset and Clock"
	add wave -label "Power-up reset"    sim:/testbench_top/powerup_reset
	add wave -label "Prompt reset"  	sim:/testbench_top/prompt_reset
	add wave -label "Clock" 			sim:/testbench_top/hdlc_clock

	add wave -noupdate -divider -height 20 "HDLC"
	add wave -label "To SCA" 			sim:/testbench_top/hdlc_to_sca
	add wave -label "From SCA" 			sim:/testbench_top/hdlc_from_sca
    
	if { $verbosity > 0 } {
		add wave -noupdate -divider -height 20 "SCA Debug"
		add wave -label "RX Ena"            sim:/testbench_top/SCAModel/elink_slave/rx_ena_1
		
		add wave -label "Clk"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/clk_1
		add wave -label "Reset"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/resetb_1
		add wave -label "DAV"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_dav_1
		add wave -label "CMD Busy"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/cmd_busy_1
		add wave -label "RX Ena"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_ena_1
		add wave -label "RX Ena pre"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_ena_pre_1
		add wave -label "RX EOP"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_eop_1
		add wave -label "RX SOP"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_sop_1
		add wave -label "RX Addr"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_adr_1
		add wave -label "Rx Err"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_err_1
		add wave -label "Rx vr"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_vr_1
		add wave -label "Rx ns"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_ns_1
		add wave -label "Rx nr"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_nr_1
		add wave -label "Phy data"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/phy_data_1
		add wave -label "Phy dvalid"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/phy_dvalid_1
		add wave -label "Phy dstrobe"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/phy_dstrobe_1
		add wave -label "CRC zero"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/crc_zero_1
		
		add wave -label "Active"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/active_1
		add wave -label "Disconnect"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/disconnect_1
		
		add wave -noupdate -divider -height 20 "FIFO"
		add wave -label "Fifo addr r"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/fifo_addr_r_1
		add wave -label "RX data"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_dat_1
		add wave -label "Fifo addr w"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/fifo_addr_w_1
		add wave -label "Fifo w"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/fifo_w_1
		add wave -label "Fifo data w"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/fifo_data_w_1
		
		add wave -label "Fifo data r"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/fifo_data_r_1
		
		add wave -noupdate -divider -height 20 "RX Command"
		add wave -label "RX CMD Reset"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_cmd_reset_1
		add wave -label "RX CMD Test"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_cmd_test_1
		add wave -label "RX CMD ua"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_cmd_ua_1
		add wave -label "RX CMD SABM"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_cmd_sabm_1
		add wave -label "RX SREJ"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/rx_cmd_srej_1
		
		add wave -noupdate -divider -height 20 "TX Command"
		add wave -label "TX SREJ"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/tx_cmd_srej_1
		add wave -label "TX CMD Reset"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/tx_cmd_reset_1
		add wave -label "Tx cmd ua"       sim:/testbench_top/SCAModel/elink_slave/HDLC/rx/MAC_rx_pri/tx_cmd_ua_1
    }
	
	add wave -noupdate -divider -height 20 "Command" 
	add wave -label "Start Transaction" 	sim:/testbench_top/start_transaction
	add wave -label "Start Reset"	 	sim:/testbench_top/start_reset
	add wave -label "Start Connect" 		sim:/testbench_top/start_connect
	
	add wave -label "Address" 			sim:/testbench_top/tx_addr
	add wave -label "Transaction Id" 	sim:/testbench_top/tx_trid
	add wave -label "Channel"			sim:/testbench_top/tx_ch
	add wave -label "Command" 			sim:/testbench_top/tx_cmd
	add wave -label "Data" 				sim:/testbench_top/tx_data
    
	add wave -noupdate -divider -height 20 "Reply"
	add wave -label "Received" 			sim:/testbench_top/rx_received
	add wave -label "Address"  			sim:/testbench_top/rx_addr
	add wave -label "Transaction Id"  	sim:/testbench_top/rx_trid
	add wave -label "Channel"  			sim:/testbench_top/rx_ch
	add wave -label "Length"  			sim:/testbench_top/rx_len
	add wave -label "Error"  			sim:/testbench_top/rx_err
	add wave -label "Data"  			sim:/testbench_top/rx_data
	add wave -label "Control"			sim:/testbench_top/rx_ctrl
	
	add wave -noupdate -divider -height 20 "SCA (GPIO)"
	add wave -label "GPIO"				sim:/testbench_top/GPIO
	
	add wave -noupdate -divider -height 20 "SCA (I2C)"
	add wave -label "I2C SCL"  			sim:/testbench_top/SCL_1(0)
	add wave -label "I2C SCLEN"  		sim:/testbench_top/SCLEN_1(0)
	add wave -label "I2C SDA_in"  		sim:/testbench_top/SDA_in_1(0)
	add wave -label "I2C SDA_out"  		sim:/testbench_top/SDA_out_1(0)
	
	add wave -noupdate -divider -height 20 "SCA (JTAG)"
	add wave -label "JTAG TCK"  		sim:/testbench_top/JTAG_TCK
	add wave -label "JTAG TMS"        	sim:/testbench_top/JTAG_TMS
	add wave -label "JTAG TDO"          sim:/testbench_top/JTAG_TDO
	
}

puts "Start simulation ..."

simulate

if { [send_reset] != 0 } {
	puts "Error: unexpected reply from SCA (Reset command)"
	quit -code -1
}

if { [send_connect] != 0 } {
	puts "Error: unexpected reply from SCA (Connect command)"
	quit -code -2
}

#Test GPIO (enable channel)
if { [send_command 0x00 0x01 0x00 0x02 0xFF000000] != 0 } {
	puts "Error: unexpected reply from SCA (Enable GPIO channel)"
	quit -code -3
}

# Configure GPIO direction (output)
if { [send_command 0x00 0x02 0x02 0x20 0xFFFFFFFF] != 0 } {
	puts "Error: unexpected reply from SCA (Set GPIO OUT)"
	quit -code -4
}

# Write GPIO out register value (12345678h)
if { [send_command 0x00 0x03 0x02 0x10 0x12345678] != 0 } {
	puts "Error: unexpected reply from SCA (Set GPIO to 0x12345678)"
	quit -code -5
}

#Check GPIO signal
if { [exa sim:/testbench_top/GPIO] != [format "32'h%08x" 0x12345678] } { 
	puts [format "Error: unexpected GPIO value (%s instead of 32h'12345678)" [exa sim:/testbench_top/GPIO]]
	quit -code -6
}

# Read GPIO out register value
if { [send_command 0x00 0x03 0x02 0x11 0x00000000] != 0 } {
	puts "Error: unexpected reply from SCA (Get GPIO OUT reg)"
	quit -code -7
}

if { [exa sim:/testbench_top/rx_data] != [format "32'h%08x" 0x12345678] } { 
	puts [format "Error: unexpected GPIO OUT register value (%s instead of 32h'12345678)" [exa sim:/testbench_top/rx_data]]
	quit -code -8
}

quit -code 0