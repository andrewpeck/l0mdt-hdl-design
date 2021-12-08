package require inifile 0.2.3
source "[file dirname [info script]]/../../Hog/Tcl/hog.tcl"

set file_name "[file dirname [info script]]/hog.conf"


# get a full FPGA name, e.g. xcku15p-ffva1760-2-e
set FPGA [dict get [dict get [ReadConf $file_name] main] PART]

# extract a short name, e.g. ku15p
regexp {xc([0-9A-z]*)} $FPGA match fpga_shortname
set fpga_shortname [string map {xc ""} $fpga_shortname]

set BD_SUFFIX $fpga_shortname
