# this script is responsible for assigning location constraints to the MGTs
# based on VHDL attributes
#
# it looks for an X_LOC and Y_LOC attribute **added in the hdl itself** and uses
# that to specify the location constraint here

# 1) start by getting the number of MGTs so that we can loop over them later. 
# imax value got from board_pkg_mpi_ku15p.vhd
set imax [get_property NUM_MGTS [get_cells "top_hal/mgt_wrapper_inst"]]
puts "Number of MGT is $imax"
#set imax 128

# 2) remove existing location constraints (which come from the IP),
# otherwise vivado complains. we will re-apply new constraints later.
for {set i 0} {$i < $imax} {incr i} {

    set gt_cells \
        [get_cells -quiet -hierarchical -filter \
             [format "NAME =~ top_hal/mgt_wrapper_inst/mgt_gen\[%d]*/*/*/*/*/*/*CHANNEL_PRIM_INST" $i]]
    #set gt_cell [get_cells -quiet [format "top_hal/mgt_wrapper_inst/mgt_gen\[%d]*/*/*/*/*/*/*CHANNEL_PRIM_INST" $i]]
#    puts " > Found GT Cell at $gt_cell"
    
    set x_loc -1
    set y_loc -1
    if {[string is space $gt_cells] != 1} {
        set x_loc [get_property X_LOC $gt_cells]
        set y_loc [get_property Y_LOC $gt_cells]
    }

    #puts [format " DEBUG1 $gt_cell $x_loc $y_loc"]
    set j 0
    
    if {$x_loc>=0 && $y_loc > 1} {    
	if {[string is space $gt_cells]==0} {
	    foreach gt_cell $gt_cells {
		puts [format " UNLOCing MGT #%d from core default placement" [expr $i + $j]]
		set_property LOC {}  $gt_cell
		incr j
	    }
	}

    }
}

# 3) loop over all of the mgts and apply location constraints accordingly
for {set i 0} {$i < $imax} {incr i} {

    # a) find the mgts in the hdl and extract the X_LOC and Y_LOC attributes

    #puts "Scanning for LOC attributes on MGT $i"
    #set cell [get_cells [format "top_hal/mgt_wrapper_inst/mgt_gen\[%i]*MGT_INST/*MGT_INST" $i]]
    set cell [get_cells -quiet [format "top_hal/mgt_wrapper_inst/mgt_gen\[%i]*MGT_INST" $i]]
    set x_loc -1
    set y_loc -1
    if {[string is space $cell] != 1} {
        set x_loc [get_property X_LOC $cell]
        set y_loc [get_property Y_LOC $cell]
    }
    
    # b) apply the LOC to the CHANNEL_PRIM_INST
    #puts [format " DEBUG2 $cell $x_loc $y_loc"]
    if {$x_loc >= 0 && $y_loc >= 0} {
        #set gt_cells [split [get_cells -hierarchical -filter [format "NAME =~ *top_hal*/mgt_wrapper_inst/mgt_gen\[%d]*GT*CHANNEL_PRIM_INST" $i]] { }]
        #set gt_cell [get_cells [format "top_hal/mgt_wrapper_inst/mgt_gen\[%d]*/*/*/*/*/*/*CHANNEL_PRIM_INST" $i]]
        set gt_cells \
            [get_cells -quiet -hierarchical -filter \
                 [format "NAME =~ top_hal/mgt_wrapper_inst/mgt_gen\[%d]*/*/*/*/*/*/*CHANNEL_PRIM_INST" $i]]

        for {set j 0} {$j < [llength $gt_cells]} {incr j} {

            set gt_cell [lindex $gt_cells $j]

            puts " > Found GT Cell at $gt_cell"

            set gt_type "NULL"

            set gt_type [ lindex [split [lindex [split $gt_cell .] end ] _ ] 0]

            if {[string is space $gt_cell]==0 && $gt_type != "NULL"} {
                puts [format " > LOCing $gt_type Channel X%dY%d as MGT #%d" $x_loc [expr $y_loc + $j]  [expr $i + $j]]
                if {[catch {set_property LOC [format "%s_CHANNEL_X%dY%d" $gt_type $x_loc [expr $y_loc + $j] ]  $gt_cell}]} {
                    error "ERROR: Tried to LOC to a occupied site ${gt_type} X${x_loc}Y[expr $y_loc + $j]"
                } else {
                    puts "    > LOCing successful"
                }
            }
        }
    }
}
