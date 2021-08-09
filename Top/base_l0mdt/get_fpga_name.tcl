package require inifile 0.2.3
source "[file dirname [info script]]/../../Hog/Tcl/hog.tcl"

set file_name "[file dirname [info script]]/hog.conf"

set FPGA [dict get [dict get [ReadConf $file_name] main] PART]

regexp {xc([0-9A-z]*)} $FPGA match fpga_shortname
