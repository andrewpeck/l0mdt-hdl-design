set imax [llength [get_ports mgt_rx_p*]]

for {set i 0} {$i < $imax} {incr i} {

    # todo: should narrow the search hierarchy to speed up parsing
    set filter [format "name =~ *mgt_gen\[%d]*mgt_gen" $i]
    set cell [get_cells -hierarchical -filter $filter]
    set x_loc -1
    set y_loc -1
    if {0 != [string compare $cell ""]} {
        set x_loc [get_property x_loc $cell]
        set y_loc [get_property y_loc $cell]
    }

    if {$x_loc >= 0 && $y_loc >= 0} {
        set gt_filter [format "name =~ *mgt_gen\[%d]*gt*_channel_prim_inst" $i]
        set gt_cell [get_cells -hierarchical -filter $gt_filter]

        set gt_type "null"

        set gt_type [ lindex [split [lindex [split $gt_cell .] end ] _ ] 0]

        if {$gt_type != "null"} {
            set_property loc [format "%s_channel_x%dy%d" $gt_type $x_loc $y_loc]  $gt_cell
            puts [format "locing $gt_type channel x%dy%d as mgt #%d" $x_loc $y_loc $i]
        }
    }
}
