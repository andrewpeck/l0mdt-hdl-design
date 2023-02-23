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

set slaves {}

if {[dict exists $data "AXI_SLAVES"]} {
    # Loop into slaves.yml to find the AXI slaves in the project
    foreach slave [array names $data["AXI_SLAVES"]] {
        if {[dict get $data AXI_SLAVES $slave TCL_CALL command] == "AXI_PL_DEV_CONNECT"} {
            lappend slaves $slave
        }
    }
} else {
    puts "ERROR: Input yml file does not contain any AXI slave!"
    exit 1
}

set line_number 0
foreach line $contents {
    if {[string match "*-- START: LIBRARIES -- DO NOT TOUCH*" $line]} {
        puts $line_number
        set text_to_insert ""
        foreach slave $slaves {
            append text_to_insert "use ctrl_lib.[string tolower $slave]_ctrl.all;\n"
        }
        set index [expr {$line_number + 1}]
        linsert contents $index $text_to_insert
    }
    if {[string match "*-- START: ULT_AXI_SIGNALS :: DO NOT EDIT*" $line]} {
        set text_to_insert ""
        foreach slave $slaves {
            if {$slave != "C2C_INTFS"} {
                append text_to_insert "  signal [string tolower $slave]_readmosi : axireadmosi;\n"
                append text_to_insert "  signal [string tolower $slave]_readmiso : axireadmiso;\n"
                append text_to_insert "  signal [string tolower $slave]_writemosi : axiwritemosi;\n"
                append text_to_insert "  signal [string tolower $slave]_writemiso : axiwritemiso;\n"
                append text_to_insert "  signal [string tolower $slave]_mon_r : [string toupper $slave]_MON_t;\n"

                if {$slave != "HOG" && $slave != "FW_INFO"} {
                    append text_to_insert "  signal [string tolower $slave]_ctrl_r : [string toupper $slave]_CTRL_t;\n"
                }
            }
        }
        set index [expr {$line_number + 1}]
        linsert contents $index $text_to_insert
    }
}

set output_file [open $input_file_path w]
puts $output_file $contents

close $output_file