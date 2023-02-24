#!/usr/bin/tclsh

set script_path "[file normalize [file dirname [info script]]]"
set repo_path $script_path/..

source $script_path/create_top_modules.tcl

set usage "USAGE: $::argv0 <project_name>"

if { [llength $argv] < 1 } {
    puts $usage
    exit 1
} else {
    set project_name [lindex $argv 0]
}

puts "Updating top_l0mdt.vhd and top_control.vhd for project $project_name.."
create_top_modules "$script_path/$project_name" "$repo_path"