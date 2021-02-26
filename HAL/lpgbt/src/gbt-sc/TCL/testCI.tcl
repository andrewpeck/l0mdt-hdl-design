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
			if {[catch {vcom -93 $file} ccode]} {
				return -2
			}
		} else {
			if {[catch {vlog $file} ccode]} {
				return -2
			}		
		}
	  }
	  
	}
	
	return 0
}

puts "Start compilation ..."
if { [compile_project] == 0 } {
	quit -code 0
} else {
	quit -code -1
}