set SVF_TARGET [format "svf%06u" [expr {round(1000000 *rand())}]]
set FPGA [get_property part [current_project]]

#derived from walkthrough https://blog.xjtag.com/2016/07/creating-svf-files-using-xilinx-vivado/

open_hw
if { [string length [get_hw_targets -quiet -regexp .*/${SVF_TARGET}] ]  } {
    delete_hw_target -quiet [get_hw_targets -regexp .*/${SVF_TARGET}]
}

create_hw_target ${SVF_TARGET}
close_hw_target
open_hw_target [get_hw_targets -regexp .*/${SVF_TARGET}]

#add the virtex to the chain
set DEVICE [create_hw_device -part ${FPGA}]
set_property PROGRAM.FILE $fw_file $DEVICE
set_param xicom.config_chunk_size 0
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

program_hw_devices -force -svf_file [file rootname ${fw_file}].svf ${DEVICE}

write_cfgmem -force -loadbit "up 0 ${fw_file}" \
    -format mcs -size 128 -file "$[file rootname ${fw_file}].mcs"

delete_hw_target -quiet [get_hw_targets -regexp .*/${SVF_TARGET}]
