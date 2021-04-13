############################################################
set PROJ_PATH "[file normalize [file dirname [info script]]]"
source ${PROJ_PATH}/get_fpga_name.tcl

set ip_repo_paths "IP_repository/${fpga_shortname}"

#set bd_design_name "c2cSlave"
#set_property target_language Verilog [current_project]
#make_wrapper -files [get_files ${bd_design_name}.bd] -top -import -force
#set_property target_language VHDL [current_project]
