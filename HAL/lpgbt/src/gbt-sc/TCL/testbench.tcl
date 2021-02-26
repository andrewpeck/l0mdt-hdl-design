proc compile_project {} {

	set library_file_list {
		work {	Testbench/SCA-model/cadence.v
				Testbench/SCA-model/Auxiliary_i2c_Port.v
				Testbench/SCA-model/ClkGate_Reset_channels.v
				Testbench/SCA-model/DAC_channel.v
				Testbench/SCA-model/DAC_defines.v
				Testbench/SCA-model/elink_super.v
				Testbench/SCA-model/global_defines.v
				Testbench/SCA-model/GPIO_channel.v
				Testbench/SCA-model/gpio_defines.v
				Testbench/SCA-model/I2C_channel.v
				Testbench/SCA-model/I2C_generate.v
				Testbench/SCA-model/I2C_prog_divider.v
				Testbench/SCA-model/I2C_slavle_wb.v
				Testbench/SCA-model/JTAG_channel.v
				Testbench/SCA-model/JTAG_define.v
				Testbench/SCA-model/majority_voter.v
				Testbench/SCA-model/NodeController.v
				Testbench/SCA-model/reset_logic.v
				Testbench/SCA-model/SCA_TRI_PAD.v
				Testbench/SCA-model/SEU_counter.v
				Testbench/SCA-model/SPI_channel.v
				Testbench/SCA-model/spi_defines.v
				Testbench/SCA-model/timescale.v
				Testbench/SCA-model/TOP_core_sca_tri.v 
				GBT-SC/SCA/sca_pkg.vhd
				GBT-SC/SCA/sca_tx.vhd	
				GBT-SC/SCA/sca_rx_fifo.vhd
				GBT-SC/SCA/sca_deserializer.vhd		
				GBT-SC/SCA/sca_rx.vhd
				GBT-SC/SCA/sca_top.vhd
				GBT-SC/IC/ic_deserializer.vhd
				GBT-SC/IC/ic_rx_fifo.vhd
				GBT-SC/IC/ic_rx.vhd
				GBT-SC/IC/ic_tx.vhd
				GBT-SC/IC/ic_top.vhd
				GBT-SC/gbtsc_top.vhd
				Testbench/testbench_tools.vhd
				Testbench/testbench_top.vhd
				}

	}

	foreach {library file_list} $library_file_list {
	  vlib $library
	  vmap work $library
	  foreach file $file_list {
		if [regexp {.vhdl?$} $file] {
			vcom -93 $file
		  } else {
			vlog $file
		  }
		}
	}
}

proc simulate {{restart "restart"}} {
	
	if { $restart == "start" } {
		eval vsim work.testbench_top -t 10ps -novopt		
		reset_waves 0
	}
	
	restart -force
	
	run 2500ns
	
	wave zoom full
	
	send_reset
	send_connect
}

proc reset_waves { verbosity } {
	delete wave *	

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
	add wave -labe "Start Transaction" 	sim:/testbench_top/start_transaction
	add wave -labe "Start Reset"	 	sim:/testbench_top/start_reset
	add wave -labe "Start Connect" 		sim:/testbench_top/start_connect
	
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

proc send_reset {} {
	
	force -freeze sim:/testbench_top/start_reset 0 0
	force -freeze sim:/testbench_top/start_reset 1 500 ns
	force -freeze sim:/testbench_top/start_reset 0 1000 ns
	
	run -all
	wave zoom full

}

proc send_connect {} {
	
	force -freeze sim:/testbench_top/start_connect 0 0
	force -freeze sim:/testbench_top/start_connect 1 500 ns
	force -freeze sim:/testbench_top/start_connect 0 1000 ns
	
	run -all
	wave zoom full

}

proc send_command_with_crc_err {addr trid channel command data} {

	force -freeze sim:/testbench_top/tx_addr 8'h$addr 0
	force -freeze sim:/testbench_top/tx_trid 8'h$trid 0
	force -freeze sim:/testbench_top/tx_ch 8'h$channel 0
	force -freeze sim:/testbench_top/tx_cmd 8'h$command 0
	force -freeze sim:/testbench_top/tx_data 32'h$data 0
	
    force -freeze sim:/testbench_top/inject_crc_error 1 0    

	force -freeze sim:/testbench_top/start_transaction 0 0
	force -freeze sim:/testbench_top/start_transaction 1 500 ns
	force -freeze sim:/testbench_top/start_transaction 0 1000 ns
	
    run -all
	#wave zoom full
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
	
    run -all
	#wave zoom full
}