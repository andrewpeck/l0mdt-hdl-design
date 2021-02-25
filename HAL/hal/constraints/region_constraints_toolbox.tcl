package require Tcl 8.5

# -----------------------------------------------------------------------------
# from http://wiki.tcl.tk/12574
proc lcomp {expression args} {
    # Check the number of arguments.
    if {[llength $args] < 2} {
        error "wrong # args: should be \"lcomp expression var1 list1\
            ?... varN listN? ?condition?\""
    }

    # Extract condition from $args, or use default.
    if {[llength $args] % 2 == 1} {
        set condition [lindex $args end]
        set args [lrange $args 0 end-1]
    } else {
        set condition 1
    }

    # Collect all var/list pairs and store in reverse order.
    set varlst [list]
    foreach {var lst} $args {
        set varlst [concat [list $var] [list $lst] $varlst]
    }

    # Actual command to be executed, repeatedly.
    set script {lappend result [subst $expression]}

    # If necessary, make $script conditional.
    if {$condition ne "1"} {
        set script [list if $condition $script]
    }

    # Apply layers of foreach constructs around $script.
    foreach {var lst} $varlst {
        set script [list foreach $var $lst $script]
    }

    # Do it!
    set result [list]
    {*}$script ;# Change to "eval $script" if using Tcl 8.4 or older.
    return $result
}
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
proc get_rpm_bounds {aSitelist} {

    foreach lSite $aSitelist {
        lappend lRPMXList [get_property RPM_X $lSite]
        lappend lRPMYList [get_property RPM_Y $lSite]

    }

    set lRPMXList [lsort -integer $lRPMXList]
    set lRPMYList [lsort -integer $lRPMYList]

    set lBotLeft [list [lindex $lRPMXList 0] [lindex $lRPMYList 0]]
    set lTopRight [list [lindex $lRPMXList end] [lindex $lRPMYList end]]
    return [list $lBotLeft $lTopRight]
}
# -----------------------------------------------------------------------------
proc get_fpga_rpm_bounds {} {
    set lClkBounds [get_XY_bounds [get_clock_regions]]

    # Left-right convenience variables
    set lRightX [lindex $lClkBounds 1 0]
    set lLeftX [lindex $lClkBounds 0 0]

    # Top/bottom convenience variables
    set lTopY [lindex $lClkBounds 1 1]
    set lBotY [lindex $lClkBounds 0 1]

    # Use the corner regions to calculate the boundaries
    return [get_rpm_bounds [get_sites -of [get_clock_regions "X${lLeftX}Y${lBotY} X${lRightX}Y${lBotY} X${lLeftX}Y${lTopY} X${lRightX}Y${lTopY}"]]]
}
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# get_XY_bounds --
# 
# Auxiliary function to determine what are the XY bounds in a collection of sites
proc get_XY_bounds {aSiteList} {
    set lList [ lsort -dictionary $aSiteList ]
    set lBotLeft [ lrange [ regexp -all -inline {X([0-9]+)Y([0-9]+)} [ lindex $lList 0 ] ] 1 2 ]
    set lTopRight [ lrange [ regexp -all -inline {X([0-9]+)Y([0-9]+)} [ lindex $lList end ] ] 1 2 ]
    return [list $lBotLeft $lTopRight]
}
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
proc create_quad_pblock {aQuadCtr aClkRegX aClkRegY aExpr aPrefix aSitePatterns} {
    
    set lClkReg [get_clock_regions "X*Y${aClkRegY}"]
    puts "Creating pblock '$aPrefix${aQuadCtr}' in clock region $lClkReg ($aExpr)" 

     if {[catch {set lRects [find_rects [get_sites -of $lClkReg -filter "$aExpr"]]}]} {
        incr aQuadCtr
        return
    }

    puts "$lRects"

    set lSelectedSites [list]
    foreach lPatt $aSitePatterns {
        dict for {lId lRange} [dict filter $lRects key $lPatt] {
            lappend lSelectedSites $lRange
        }

    }

    if {[llength $lSelectedSites] > 0} {
        set lQuadBlock [create_pblock $aPrefix$aQuadCtr]
        resize_pblock $lQuadBlock -add $lSelectedSites
    } else {
        puts "No elements in pblock $aPrefix$aQuadCtr"
    }
}
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
proc create_quad_pblocks {aLeftColWidth aRightColWidth} {

    set lSitePatterns [list SLICE DSP* RAM*]

    # Read clock region bounds
    set lClkBounds [get_XY_bounds [get_clock_regions]]

    puts "Clock region bounds: ${lClkBounds}"

    set lRightX [lindex $lClkBounds 1 0]
    set lLeftX [lindex $lClkBounds 0 0]

    set lTopY [lindex $lClkBounds 1 1]
    set lBotY [lindex $lClkBounds 0 1]

    set lRPMBounds [get_fpga_rpm_bounds]
    # Extract the column boundaries
    set lLeftBoundary  [expr [lindex $lRPMBounds 0 0] + $aLeftColWidth]
    set lRightBoundary [expr [lindex $lRPMBounds 1 0] - $aRightColWidth]

    # Cleanup the old pblocks
    delete_pblocks -quiet [get_pblocks -quiet quad_*]

    set aLeftExpr "RPM_X < $lLeftBoundary"
    set lQuadCtr 0
    for {set i $lBotY} {$i <= $lTopY} {incr i} {
        create_quad_pblock $lQuadCtr $lLeftX $i $aLeftExpr "quad_L" $lSitePatterns
        incr lQuadCtr
    }

    # place all blocks gt than some X number into the right quads
    set aRightExpr "RPM_X > $lRightBoundary"
    set lQuadCtr 0
    for {set i $lBotY} {$i <= $lTopY} {incr i} {
        create_quad_pblock $lQuadCtr $lRightX $i $aRightExpr "quad_R" $lSitePatterns
        incr lQuadCtr
    }
    return [list $lQuadCtr $lLeftBoundary $lRightBoundary]

}

# -----------------------------------------------------------------------------
# add_rects_to_pblock --
#
# Adds a set of rectangular ranges of sites to a pblock.
# The ranges are passed in a dictionary. Only the ranges matching the user-defined patterns are added
#
# Arguments:
#   aPBlock The pblock
#   aRects Dictionary of rectangular areas
# Results:
#   The result is that of the command being redone. Also repla
proc add_rects_to_pblock {aPBlock aRects} {

    set lSitePatterns [list SLICE DSP* RAM*]

    set lToAdd [list]
    foreach lType $lSitePatterns {
        dict for {lId lRange} [dict filter $aRects key $lType] {
            lappend lToAdd $lRange
        }
    }

    puts "Adding to $aPBlock rectangles $lToAdd"
    resize_pblock $aPBlock -add $lToAdd
}
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# find_rects --
#
# Find the rectangular boundaries of each site type contained in the input list.
#
# Arguments:
#   aSites List of sites.
# Results:
#   A dictionary containing the site prefix as key and the XY range as value.
proc find_rects {aSites} {
    
    if {[llength $aSites]==0} {
        error "Empty site list"
    }

    foreach lSite $aSites {
        regexp -all {(\w+)_X([0-9]+)Y([0-9]+)} $lSite a lLabel lX lY
        dict lappend lElements $lLabel "X${lX}Y${lY}"
    }

    # puts [dict keys $lElements]
    dict for {id lLabel} $lElements {
        # puts "$id [get_XY_bounds $lLabel]"
        dict set lRanges $id "[get_XY_bounds $lLabel]"
    }

    dict for {id lRange} $lRanges {

        dict set lRect $id "${id}_X[lindex $lRange 0 0]Y[lindex $lRange 0 1]:${id}_X[lindex $lRange 1 0]Y[lindex $lRange 1 1]"
    }

    return $lRect
}
# -----------------------------------------------------------------------------
