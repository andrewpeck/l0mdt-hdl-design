package require yaml
package require cmdline

# Define the command-line arguments
set parameters {
  {template.arg "HAL/ctrl/src/top_control_template.vhd" "Path to top_control_template.vhd file"}
  {output_file.arg  "control.vhd"  "Path to output top_control.vhd"}
}

set usage "- USAGE: $::argv0 \[OPTIONS\] <input_file> \n. Options:"

if {[catch {array set options [cmdline::getoptions ::argv $parameters $usage]}] ||  [llength $argv] < 1 } {
    puts [cmdline::usage $parameters $usage]
    exit 1
} else {
    set input_file_path [lindex $argv 0]
    set template_path "HAL/ctrl/src/top_control_template.vhd"
    set output_file_path "control.vhd"
}

if { $options(template) != ""} {
  set template_path $options(template)
}

if { $options(output_file) != ""} {
  set output_file_path $options(output_file)
}


# Use the input and output file paths in your script
# For example, to read the contents of the input file and write it to the output file:
set input_file [open $input_file_path r]
set data [::yaml::yaml2dict -stream [read $input_file]]
close $input_file

set template_file [open $template_path r+]
set contents [split [read $template_file] "\n"]
close $template_file

set slaves [dict create]
if {[dict exists $data "AXI_SLAVES"]} {
    set axi_slaves_dict [dict get $data "AXI_SLAVES"]
    # Loop into slaves.yml to find the AXI slaves in the project
    foreach s [dict keys $axi_slaves_dict] {
        if {$s == "C2C_INTFS"} {
            # Ignore C2C_INTFS slave
            continue
        }
        set slave_dict [dict get $axi_slaves_dict $s]
        if {[dict exists $slave_dict "HDL"]} {
            set hdl_dict [dict get $slave_dict "HDL"]
            if {[dict exists $hdl_dict "out_name"]} {
                puts [dict get $hdl_dict "out_name"]
                dict set slaves $s [dict get $hdl_dict "out_name"]
            } else {
                puts "ERROR: Slave $s do not have an HDL out_name, please define it in your slaves.yaml"
            }
        }
    }
} else {
    puts "ERROR: Input yml file does not contain any AXI slave!"
    exit 1
}

set output_file [open $output_file_path w]

foreach line $contents {
    puts $output_file $line

    if {[string match "*-- START: LIBRARIES -- DO NOT TOUCH*" $line]} {
        puts "INSERTING MISSING LIBRARIES!"
        set text_to_insert ""
        foreach slave [dict keys $slaves] {
            puts $output_file "use ctrl_lib.[string tolower $slave]_ctrl.all;"
        }
    }

    if {[string match "*-- START: ULT_IO :: DO NOT EDIT*" $line]} {
        puts "INSERTING MISSING ULT_IO!"
        foreach slave [dict keys $slaves] {
            puts $output_file "    [string tolower $slave]_mon : in [string toupper [dict get $slaves $slave]]_MON_t;"

            if {$slave != "HOG" && $slave != "FW_INFO"} {
                puts $output_file "    [string tolower $slave]_ctrl : out [string toupper [dict get $slaves $slave]]_CTRL_t;"
            }
        }
    }

    if {[string match "*-- START: ULT_AXI_SIGNALS :: DO NOT EDIT*" $line]} {
        puts "INSERTING MISSING ULT_AXI_SIGNALS!"
        foreach slave [dict keys $slaves] {
            puts $output_file "  signal [string tolower $slave]_readmosi  : axireadmosi;"
            puts $output_file "  signal [string tolower $slave]_readmiso  : axireadmiso;"
            puts $output_file "  signal [string tolower $slave]_writemosi : axiwritemosi;"
            puts $output_file "  signal [string tolower $slave]_writemiso : axiwritemiso;"
            puts $output_file "  signal [string tolower $slave]_mon_r     : [string toupper [dict get $slaves $slave]]_MON_t;"

            if {$slave != "HOG" && $slave != "FW_INFO"} {
                puts $output_file "  signal [string tolower $slave]_ctrl_r    : [string toupper [dict get $slaves $slave]]_CTRL_t;"
            }
        }
    }

    if {[string match "*-- START: AXI_PL_SLAVES :: DO NOT EDIT*" $line]} {
        puts "Updating Wrapper instantiation!"
        foreach slave [dict keys $slaves] {
            puts $output_file "      [string toupper $slave]_araddr         => ${slave}_readmosi.address,"
            puts $output_file "      [string toupper $slave]_arprot         => ${slave}_readmosi.protection_type,"
            puts $output_file "      [string toupper $slave]_arready(0)     => ${slave}_readmiso.ready_for_address,"
            puts $output_file "      [string toupper $slave]_arvalid(0)     => ${slave}_readmosi.address_valid,"
            puts $output_file "      [string toupper $slave]_awaddr         => ${slave}_writemosi.address,"
            puts $output_file "      [string toupper $slave]_awprot         => ${slave}_writemosi.protection_type,"
            puts $output_file "      [string toupper $slave]_awready(0)     => ${slave}_writemiso.ready_for_address,"
            puts $output_file "      [string toupper $slave]_awvalid(0)     => ${slave}_writemosi.address_valid,"
            puts $output_file "      [string toupper $slave]_bready(0)      => ${slave}_writemosi.ready_for_response,"
            puts $output_file "      [string toupper $slave]_bvalid(0)      => ${slave}_writemiso.response_valid,"
            puts $output_file "      [string toupper $slave]_bresp          => ${slave}_writemiso.response,"
            puts $output_file "      [string toupper $slave]_rdata          => ${slave}_readmiso.data,"
            puts $output_file "      [string toupper $slave]_rready(0)      => ${slave}_readmosi.ready_for_data,"
            puts $output_file "      [string toupper $slave]_rresp          => ${slave}_readmiso.response,"
            puts $output_file "      [string toupper $slave]_rvalid(0)      => ${slave}_readmiso.data_valid,"
            puts $output_file "      [string toupper $slave]_wdata          => ${slave}_writemosi.data,"
            puts $output_file "      [string toupper $slave]_wready(0)      => ${slave}_writemiso.ready_for_data,"
            puts $output_file "      [string toupper $slave]_wstrb          => ${slave}_writemosi.data_write_strobe,"
            puts $output_file "      [string toupper $slave]_wvalid(0)      => ${slave}_writemosi.data_valid,"
        }
    }

    if {[string match "*  -- START: ULT_SLAVES :: DO NOT EDIT*" $line]} {
        puts "INSERTING ULT_SLAVES ENTITIES..."
        foreach slave [dict keys $slaves] {
            puts $output_file "  ${slave}_map_inst : entity ctrl_lib.[string tolower [dict get $slaves $slave]]_map"
            puts $output_file "    port map("
            if {$slave in "HAL HAL_CORE HOG FW_INFO"} {
                puts $output_file "      clk_axi         => axi_clk,"
                puts $output_file "      reset_axi_n     => axi_reset_n,"
            } else {
                puts $output_file "      clk_axi         => clk40,"
                puts $output_file "      reset_axi_n     => std_logic1, "
            }
            puts $output_file "      slave_readmosi   => ${slave}_readmosi," 
            puts $output_file "      slave_readmiso   => ${slave}_readmiso," 
            puts $output_file "      slave_writemosi   => ${slave}_writemosi," 
            puts $output_file "      slave_writemiso   => ${slave}_writemiso," 
            if {$slave != "HOG" && $slave != "FW_INFO"} {
                puts $output_file "      ctrl   => ${slave}_ctrl_r," 
            }
            puts $output_file "      mon   => ${slave}_mon_r"
            puts $output_file "    );" 

        }
    }
}

close $output_file