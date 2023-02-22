
################################################################
# This is a generated script based on design: ex_sim
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source ex_sim_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# fm_map_wrapper

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcku15p-ffva1760-2-e
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name ex_sim

# This script was generated for a remote BD. To create a non-remote design,
# change the variable <run_remote_bd_flow> to <0>.

set run_remote_bd_flow 1
if { $run_remote_bd_flow == 1 } {
  # Set the reference directory for source file relative paths (by default 
  # the value is script directory path)
  set origin_dir ./bd

  # Use origin directory path location variable, if specified in the tcl shell
  if { [info exists ::origin_dir_loc] } {
     set origin_dir $::origin_dir_loc
  }

  set str_bd_folder [file normalize ${origin_dir}]
  set str_bd_filepath ${str_bd_folder}/${design_name}/${design_name}.bd

  # Check if remote design exists on disk
  if { [file exists $str_bd_filepath ] == 1 } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2030 -severity "ERROR" "The remote BD file path <$str_bd_filepath> already exists!"}
     common::send_gid_msg -ssname BD::TCL -id 2031 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0>."
     common::send_gid_msg -ssname BD::TCL -id 2032 -severity "INFO" "Also make sure there is no design <$design_name> existing in your current project."

     return 1
  }

  # Check if design exists in memory
  set list_existing_designs [get_bd_designs -quiet $design_name]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2033 -severity "ERROR" "The design <$design_name> already exists in this project! Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2034 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Check if design exists on disk within project
  set list_existing_designs [get_files -quiet */${design_name}.bd]
  if { $list_existing_designs ne "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2035 -severity "ERROR" "The design <$design_name> already exists in this project at location:
    $list_existing_designs"}
     catch {common::send_gid_msg -ssname BD::TCL -id 2036 -severity "ERROR" "Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_gid_msg -ssname BD::TCL -id 2037 -severity "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Now can create the remote BD
  # NOTE - usage of <-dir> will create <$str_bd_folder/$design_name/$design_name.bd>
  create_bd_design -dir $str_bd_folder $design_name
} else {

  # Create regular design
  if { [catch {create_bd_design $design_name} errmsg] } {
     common::send_gid_msg -ssname BD::TCL -id 2038 -severity "INFO" "Please set a different value to variable <design_name>."

     return 1
  }
}

current_bd_design $design_name

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:axi_vip:1.1\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
fm_map_wrapper\
"

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set aclk [ create_bd_port -dir I -type clk -freq_hz 300000000 aclk ]
  set_property -dict [ list \
   CONFIG.CLK_DOMAIN {design_sim_clk_wiz_0_0_clk_out1} \
   CONFIG.PHASE {0.0} \
 ] $aclk
  set aresetn [ create_bd_port -dir I -type rst aresetn ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $aresetn

  # Create instance: axi_vip_mst, and set properties
  set axi_vip_mst [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vip:1.1 axi_vip_mst ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.ARUSER_WIDTH {0} \
   CONFIG.AWUSER_WIDTH {0} \
   CONFIG.BUSER_WIDTH {0} \
   CONFIG.DATA_WIDTH {32} \
   CONFIG.HAS_ACLKEN {0} \
   CONFIG.HAS_ARESETN {1} \
   CONFIG.HAS_BRESP {1} \
   CONFIG.HAS_BURST {0} \
   CONFIG.HAS_CACHE {0} \
   CONFIG.HAS_LOCK {0} \
   CONFIG.HAS_PROT {1} \
   CONFIG.HAS_QOS {0} \
   CONFIG.HAS_REGION {0} \
   CONFIG.HAS_RRESP {1} \
   CONFIG.HAS_SIZE {0} \
   CONFIG.HAS_USER_BITS_PER_BYTE {0} \
   CONFIG.HAS_WSTRB {1} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.INTERFACE_MODE {MASTER} \
   CONFIG.PROTOCOL {AXI4LITE} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.RUSER_BITS_PER_BYTE {0} \
   CONFIG.RUSER_WIDTH {0} \
   CONFIG.SUPPORTS_NARROW {0} \
   CONFIG.WUSER_BITS_PER_BYTE {0} \
   CONFIG.WUSER_WIDTH {0} \
 ] $axi_vip_mst

  # Create instance: fm_map_wrapper_0, and set properties
  set block_name fm_map_wrapper
  set block_cell_name fm_map_wrapper_0
  if { [catch {set fm_map_wrapper_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $fm_map_wrapper_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net aclk_1 [get_bd_ports aclk] [get_bd_pins axi_vip_mst/aclk] [get_bd_pins fm_map_wrapper_0/clk_axi]
  connect_bd_net -net aresetn_1 [get_bd_ports aresetn] [get_bd_pins axi_vip_mst/aresetn] [get_bd_pins fm_map_wrapper_0/reset_axi_n]
  connect_bd_net -net axi_vip_mst_m_axi_araddr [get_bd_pins axi_vip_mst/m_axi_araddr] [get_bd_pins fm_map_wrapper_0/slave_readMOSI_address]
  connect_bd_net -net axi_vip_mst_m_axi_arprot [get_bd_pins axi_vip_mst/m_axi_arprot] [get_bd_pins fm_map_wrapper_0/slave_readMOSI_protection_type]
  connect_bd_net -net axi_vip_mst_m_axi_arvalid [get_bd_pins axi_vip_mst/m_axi_arvalid] [get_bd_pins fm_map_wrapper_0/slave_readMOSI_address_valid]
  connect_bd_net -net axi_vip_mst_m_axi_awaddr [get_bd_pins axi_vip_mst/m_axi_awaddr] [get_bd_pins fm_map_wrapper_0/slave_writeMOSI_address]
  connect_bd_net -net axi_vip_mst_m_axi_awprot [get_bd_pins axi_vip_mst/m_axi_awprot] [get_bd_pins fm_map_wrapper_0/slave_writeMOSI_protection_type]
  connect_bd_net -net axi_vip_mst_m_axi_awvalid [get_bd_pins axi_vip_mst/m_axi_awvalid] [get_bd_pins fm_map_wrapper_0/slave_writeMOSI_address_valid]
  connect_bd_net -net axi_vip_mst_m_axi_bready [get_bd_pins axi_vip_mst/m_axi_bready] [get_bd_pins fm_map_wrapper_0/slave_writeMOSI_ready_for_response]
  connect_bd_net -net axi_vip_mst_m_axi_rready [get_bd_pins axi_vip_mst/m_axi_rready] [get_bd_pins fm_map_wrapper_0/slave_readMOSI_ready_for_data]
  connect_bd_net -net axi_vip_mst_m_axi_wdata [get_bd_pins axi_vip_mst/m_axi_wdata] [get_bd_pins fm_map_wrapper_0/slave_writeMOSI_data]
  connect_bd_net -net axi_vip_mst_m_axi_wstrb [get_bd_pins axi_vip_mst/m_axi_wstrb] [get_bd_pins fm_map_wrapper_0/slave_writeMOSI_data_write_strobe]
  connect_bd_net -net axi_vip_mst_m_axi_wvalid [get_bd_pins axi_vip_mst/m_axi_wvalid] [get_bd_pins fm_map_wrapper_0/slave_writeMOSI_data_valid]
  connect_bd_net -net fm_map_wrapper_0_slave_readMISO_data [get_bd_pins axi_vip_mst/m_axi_rdata] [get_bd_pins fm_map_wrapper_0/slave_readMISO_data]
  connect_bd_net -net fm_map_wrapper_0_slave_readMISO_data_valid [get_bd_pins axi_vip_mst/m_axi_rvalid] [get_bd_pins fm_map_wrapper_0/slave_readMISO_data_valid]
  connect_bd_net -net fm_map_wrapper_0_slave_readMISO_ready_for_address [get_bd_pins axi_vip_mst/m_axi_arready] [get_bd_pins fm_map_wrapper_0/slave_readMISO_ready_for_address]
  connect_bd_net -net fm_map_wrapper_0_slave_readMISO_response [get_bd_pins axi_vip_mst/m_axi_rresp] [get_bd_pins fm_map_wrapper_0/slave_readMISO_response]
  connect_bd_net -net fm_map_wrapper_0_slave_writeMISO_ready_for_address [get_bd_pins axi_vip_mst/m_axi_awready] [get_bd_pins fm_map_wrapper_0/slave_writeMISO_ready_for_address]
  connect_bd_net -net fm_map_wrapper_0_slave_writeMISO_ready_for_data [get_bd_pins axi_vip_mst/m_axi_wready] [get_bd_pins fm_map_wrapper_0/slave_writeMISO_ready_for_data]
  connect_bd_net -net fm_map_wrapper_0_slave_writeMISO_response [get_bd_pins axi_vip_mst/m_axi_bresp] [get_bd_pins fm_map_wrapper_0/slave_writeMISO_response]
  connect_bd_net -net fm_map_wrapper_0_slave_writeMISO_response_valid [get_bd_pins axi_vip_mst/m_axi_bvalid] [get_bd_pins fm_map_wrapper_0/slave_writeMISO_response_valid]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


