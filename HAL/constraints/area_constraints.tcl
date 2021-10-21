proc string= {a b} {
    if {[string compare $a $b] == 0} {
        return 1
    } else {
        return 0
    }
}

# get the FPGA model
# fpga --> fpga_short
# xcvu13p-flga2577-1-e --> xcvu13p
set fpga [get_property part [current_project]]
regexp {([0-9,A-z]+)-.*} $fpga -> fpga_short

# Parameters

if {[string= "xcku15p" $fpga_short]} {
    # Add 950 to left side to account for oddities in RPM numbering
    set lLeftQuadWidth  [expr 500 + 850]
    set lRightQuadWidth [expr 500]
}
if {[string= "xcvu13p" $fpga_short]} {
    set lLeftQuadWidth  [expr 500]
    set lRightQuadWidth [expr 500]
}

set lClkBounds [get_XY_bounds [get_clock_regions]]
puts "Clock region boundaries ${lClkBounds}"
set lRPMBounds [get_fpga_rpm_bounds]
puts "FPGA boundaries (RPM coords) $lRPMBounds"

#create_quad_pblocks $lLeftQuadWidth $lRightQuadWidth
lassign [create_quad_pblocks $lLeftQuadWidth $lRightQuadWidth] lNumQuads lLeftBoundary lRightBoundary

# Create the quad p-blocks and store the number of blocks created
puts "Created $lNumQuads quads"


proc assign_pblocks {min  max  side fpga} {

    for {set lRegId $min} {$lRegId <= $max} {incr lRegId} {

        set q 0
        set lQuadBlock ""

        if {[string= "xcku15p" $fpga]} {
            if {[string= "L" $side]} {
                # LHS GTY quads  numbered 3-10
                set q [expr $lRegId/4 + 3]
            }
            if {[string= "R" $side]} {
                # RHS GTH quads numbered 0-10
                set q [expr ($lRegId-32) / 4]
            }
        }

        if {[string= "xcvu13p" $fpga]} {
            if {[string= "L" $side]} {
                # LHS GTY quads  numbered 0-15
                set q [expr $lRegId/4]
            }
            if {[string= "R" $side]} {
                # RHS GTY quads numbered 0-15
                set q [expr ($lRegId-64) / 4]
            }
        }

        set lQuadBlock [get_pblocks quad_$side$q]

        # gather up the cells for all the links in this quad
        set cells [concat \
                       [get_cells -quiet "top_hal/*mgt*/*mgt_gen\[$lRegId]*.MGT_INST"] \
                       [get_cells -quiet "top_hal/*csm*mgt_tag*[$lRegId]*"] \
                       [get_cells -quiet "top_hal/*sector_logic*/sl_gen*[$lRegId]*"]]

        if {[string is space $cells] == 0} {
            puts "Adding cells to pblock $lQuadBlock with mgt #$lRegId"
            puts "   > quad_$side$q"
            add_cells_to_pblock $lQuadBlock $cells
        }
    }
    puts " > No cells in other pblocks"
}

if {[string= "xcvu13p" $fpga_short]} {
    assign_pblocks 0  63  L $fpga_short
    assign_pblocks 64 127 R $fpga_short
}

if {[string= "xcku15p" $fpga_short]} {
    assign_pblocks 0  31  L $fpga_short
    assign_pblocks 32 75  R $fpga_short
}

# Payload Area assignment
#set lPayload [create_pblock payload]
#set lPayloadRect [find_rects [get_sites -of [get_clock_regions] -f "RPM_X >= $lLeftBoundary && RPM_X <= $lRightBoundary"]]
#add_rects_to_pblock $lPayload $lPayloadRect
#
#set lPayloadRect [find_rects [get_sites -of [get_clock_regions -f {ROW_INDEX>2}] -f "RPM_X >= $lLeftBoundary && RPM_X <= $lRightBoundary"]]
#add_cells_to_pblock [get_pblocks payload] [get_cells -quiet datapath/rgen[*].pgen.*]
