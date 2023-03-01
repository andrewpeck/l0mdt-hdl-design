package require yaml

proc create_top_modules {project_path repo_path} {
    
    set input_file_path "$project_path/slaves.yaml"
    # Check if slaves.yaml exists
    if {[file exists $input_file_path]} {
        set input_file [open $input_file_path r]
    } else {
        puts "ERROR: $input_file_path not found! Exiting..."
        exit 1
    }

    set slaves_data [::yaml::yaml2dict -stream [read $input_file]]
    close $input_file

    set control_template_path "$repo_path/HAL/ctrl/src/top_control_template.vhd"
    # Check if top_control_template.vhd exists
    if {[file exists $control_template_path]} {
        set control_template_file [open $control_template_path r+]
    } else {
        puts "ERROR: $control_template_path not found! Exiting..."
        exit 1
    }

    set top_template_path "$repo_path/HAL/top_l0mdt_template.vhd"
    # Check if top_control_template.vhd exists
    if {[file exists $top_template_path]} {
        set top_template_file [open $top_template_path r]
    } else {
        puts "ERROR: $top_template_path not found! Exiting..."
        exit 1
    }

    set control_data [split [read $control_template_file] "\n"]
    close $control_template_file

    set top_data [split [read $top_template_file] "\n"]
    close $top_template_file

    set slaves [dict create]
    if {[dict exists $slaves_data "AXI_SLAVES"]} {
        set axi_slaves_dict [dict get $slaves_data "AXI_SLAVES"]
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


    set output_control_file_path "$project_path/top_control.vhd"
    set output_control_file [open $output_control_file_path w]

    set output_top_file_path "$project_path/top_l0mdt.vhd"
    set output_top_file [open $output_top_file_path w]

    # Write top_control.vhd
    foreach line $control_data {
        puts $output_control_file $line

        if {[string match "*-- START: LIBRARIES -- DO NOT TOUCH*" $line]} {
            set text_to_insert ""
            foreach slave [dict keys $slaves] {
                puts $output_control_file "use ctrl_lib.[string tolower $slave]_ctrl.all;"
            }
        }

        if {[string match "*-- START: ULT_IO :: DO NOT EDIT*" $line]} {
            foreach slave [dict keys $slaves] {
                puts $output_control_file "    [string tolower $slave]_mon : in [string toupper [dict get $slaves $slave]]_MON_t;"

                if {$slave != "HOG" && $slave != "FW_INFO"} {
                    puts $output_control_file "    [string tolower $slave]_ctrl : out [string toupper [dict get $slaves $slave]]_CTRL_t;"
                }
            }
        }

        if {[string match "*-- START: ULT_AXI_SIGNALS :: DO NOT EDIT*" $line]} {
            foreach slave [dict keys $slaves] {
                puts $output_control_file "  signal [string tolower $slave]_readmosi  : axireadmosi;"
                puts $output_control_file "  signal [string tolower $slave]_readmiso  : axireadmiso;"
                puts $output_control_file "  signal [string tolower $slave]_writemosi : axiwritemosi;"
                puts $output_control_file "  signal [string tolower $slave]_writemiso : axiwritemiso;"
                puts $output_control_file "  signal [string tolower $slave]_mon_r     : [string toupper [dict get $slaves $slave]]_MON_t;"

                if {$slave != "HOG" && $slave != "FW_INFO"} {
                    puts $output_control_file "  signal [string tolower $slave]_ctrl_r    : [string toupper [dict get $slaves $slave]]_CTRL_t;"
                }
            }
        }

        if {[string match "*-- START: AXI_PL_SLAVES :: DO NOT EDIT*" $line]} {
            foreach slave [dict keys $slaves] {
                puts $output_control_file "      [string toupper $slave]_araddr         => ${slave}_readmosi.address,"
                puts $output_control_file "      [string toupper $slave]_arprot         => ${slave}_readmosi.protection_type,"
                puts $output_control_file "      [string toupper $slave]_arready(0)     => ${slave}_readmiso.ready_for_address,"
                puts $output_control_file "      [string toupper $slave]_arvalid(0)     => ${slave}_readmosi.address_valid,"
                puts $output_control_file "      [string toupper $slave]_awaddr         => ${slave}_writemosi.address,"
                puts $output_control_file "      [string toupper $slave]_awprot         => ${slave}_writemosi.protection_type,"
                puts $output_control_file "      [string toupper $slave]_awready(0)     => ${slave}_writemiso.ready_for_address,"
                puts $output_control_file "      [string toupper $slave]_awvalid(0)     => ${slave}_writemosi.address_valid,"
                puts $output_control_file "      [string toupper $slave]_bready(0)      => ${slave}_writemosi.ready_for_response,"
                puts $output_control_file "      [string toupper $slave]_bvalid(0)      => ${slave}_writemiso.response_valid,"
                puts $output_control_file "      [string toupper $slave]_bresp          => ${slave}_writemiso.response,"
                puts $output_control_file "      [string toupper $slave]_rdata          => ${slave}_readmiso.data,"
                puts $output_control_file "      [string toupper $slave]_rready(0)      => ${slave}_readmosi.ready_for_data,"
                puts $output_control_file "      [string toupper $slave]_rresp          => ${slave}_readmiso.response,"
                puts $output_control_file "      [string toupper $slave]_rvalid(0)      => ${slave}_readmiso.data_valid,"
                puts $output_control_file "      [string toupper $slave]_wdata          => ${slave}_writemosi.data,"
                puts $output_control_file "      [string toupper $slave]_wready(0)      => ${slave}_writemiso.ready_for_data,"
                puts $output_control_file "      [string toupper $slave]_wstrb          => ${slave}_writemosi.data_write_strobe,"
                puts $output_control_file "      [string toupper $slave]_wvalid(0)      => ${slave}_writemosi.data_valid,"
            }
        }

        if {[string match "*  -- START: ULT_SLAVES :: DO NOT EDIT*" $line]} {
            foreach slave [dict keys $slaves] {
                puts $output_control_file "  ${slave}_map_inst : entity ctrl_lib.[string tolower [dict get $slaves $slave]]_map"
                puts $output_control_file "    port map("
                if {$slave in "HAL HAL_CORE HOG FW_INFO"} {
                    puts $output_control_file "      clk_axi         => axi_clk,"
                    puts $output_control_file "      reset_axi_n     => axi_reset_n,"
                } else {
                    puts $output_control_file "      clk_axi         => clk40,"
                    puts $output_control_file "      reset_axi_n     => std_logic1, "
                }
                puts $output_control_file "      slave_readmosi   => ${slave}_readmosi," 
                puts $output_control_file "      slave_readmiso   => ${slave}_readmiso," 
                puts $output_control_file "      slave_writemosi   => ${slave}_writemosi," 
                puts $output_control_file "      slave_writemiso   => ${slave}_writemiso," 
                if {$slave != "HOG" && $slave != "FW_INFO"} {
                    puts $output_control_file "      ctrl   => ${slave}_ctrl_r," 
                }
                puts $output_control_file "      mon   => ${slave}_mon_r"
                puts $output_control_file "    );" 

            }
        }
    }
    puts "$output_control_file_path updated..."

    close $output_control_file

    # Write top_l0mdt.vhd
    foreach line $top_data {
        puts $output_top_file $line
         if {[string match "*-- START: ULT_IO :: DO NOT EDIT*" $line]} {
            set text_to_insert ""
            foreach slave [dict keys $slaves] {
                puts $output_top_file "      [string tolower $slave]_mon            => [string tolower $slave]_mon_r,"

                if {$slave != "HOG" && $slave != "FW_INFO"} {
                    puts $output_top_file "      [string tolower $slave]_ctrl           => [string tolower $slave]_ctrl_r,"
                }
            }
        }
    }

    puts "$output_top_file_path updated..."
    close $output_top_file

}


