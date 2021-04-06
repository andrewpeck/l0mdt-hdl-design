############################################################
#set DESIGN    "[file rootname [file tail [info script]]]"
#set PATH_REPO "[file normalize [file dirname [info script]]]/../../"


#set apollo_root_path $PATH_REPO
#set FPGA xcku15p-ffva1760-2-e
#regexp {xc([0-9A-z]*)} $FPGA match fpga_shortname
#
#set C2C_PATH $PATH_REPO/HAL/c2c
#set BD_PATH $PATH_REPO/HAL/c2c/bd_helper
#set BD_OUTPUT_PATH $PATH_REPO/HAL/c2c/bd
#set BD_SUFFIX ${fpga_shortname}

set ip_repo_paths "IP_repository/ku15p"

set bd_design_name "c2cSlave"
make_wrapper -files [get_files ${bd_design_name}.bd] -top -import -force
