set imax [get_property NUM_MGTS [get_cells "top_hal/mgt_wrapper_inst"]]

# make sure to UNloc the gt_cell before LOCing it after... Xilinx chokes otherwise
for {set i 0} {$i < $imax} {incr i} {

    set gt_cell [get_cells -quiet -hierarchical -filter [format "NAME =~ top_hal/mgt_wrapper_inst/mgt_gen\[%d]*/*/*/*/*/*/*CHANNEL_PRIM_INST" $i]]
    #set gt_cell [get_cells -quiet [format "top_hal/mgt_wrapper_inst/mgt_gen\[%d]*/*/*/*/*/*/*CHANNEL_PRIM_INST" $i]]
    #puts " > Found GT Cell at $gt_cell"

    if {[string is space $gt_cell]==0} {
        # make sure to UNloc the gt_cell before LOCing it after... Xilinx chokes otherwise
        puts [format " UNLOCing MGT #%d from core default placement" $i]
        set_property LOC {}  $gt_cell
    }
}

for {set i 0} {$i < $imax} {incr i} {

    #puts "Scanning for LOC attributes on MGT $i"
    #set cell [get_cells [format "top_hal/mgt_wrapper_inst/mgt_gen\[%i]*MGT_GEN/*MGT_GEN" $i]]
    set cell [get_cells -quiet [format "top_hal/mgt_wrapper_inst/mgt_gen\[%i]*MGT_GEN" $i]]

    set x_loc -1
    set y_loc -1
    if {[string is space $cell] != 1} {
        set x_loc [get_property X_LOC $cell]
        set y_loc [get_property Y_LOC $cell]
    }

    if {$x_loc >= 0 && $y_loc >= 0} {
        #set gt_cells [split [get_cells -hierarchical -filter [format "NAME =~ *top_hal*/mgt_wrapper_inst/mgt_gen\[%d]*GT*CHANNEL_PRIM_INST" $i]] { }]
        #set gt_cell [get_cells [format "top_hal/mgt_wrapper_inst/mgt_gen\[%d]*/*/*/*/*/*/*CHANNEL_PRIM_INST" $i]]
        set gt_cells [get_cells -quiet -hierarchical -filter [format "NAME =~ top_hal/mgt_wrapper_inst/mgt_gen\[%d]*/*/*/*/*/*/*CHANNEL_PRIM_INST" $i]]

        for {set j 0} {$j < [llength $gt_cells]} {incr j} {

            set gt_cell [lindex $gt_cells $j]

            puts " > Found GT Cell at $gt_cell"

            set gt_type "NULL"

            set gt_type [ lindex [split [lindex [split $gt_cell .] end ] _ ] 0]

            if {[string is space $gt_cell]==0 && $gt_type != "NULL"} {
                puts [format " > LOCing $gt_type Channel X%dY%d as MGT #%d" $x_loc [expr $y_loc + $j]  $i]
                set_property LOC [format "%s_CHANNEL_X%dY%d" $gt_type $x_loc [expr $y_loc + $j] ]  $gt_cell
            }
        }
    }
}

for {set j 0} {$j < 4} {incr j} {
    puts $j
}
for {set j 0} {$j < [llength $gt_cells]} {incr j} {
    puts $j
}
