# Parameters
# Add 950 to left side to account for oddities in RPM numbering
set lLeftQuadWidth  [expr 500 + 850]
set lRightQuadWidth [expr 500]

set lClkBounds [get_XY_bounds [get_clock_regions]]
puts "Clock region boundaries ${lClkBounds}"
set lRPMBounds [get_fpga_rpm_bounds]
puts "FPGA boundaries (RPM coords) $lRPMBounds"

#create_quad_pblocks $lLeftQuadWidth $lRightQuadWidth
lassign [create_quad_pblocks $lLeftQuadWidth $lRightQuadWidth] lNumQuads lLeftBoundary lRightBoundary

# Create the quad p-blocks and store the number of blocks created
puts "Created $lNumQuads quads"

proc assign_pblocks {min  max  side} {

    for {set lRegId $min} {$lRegId < $max} {incr lRegId} {

        set q 0
        set lQuadBlock ""

        if {[string compare $side "L"] == 0} {
            # LHS GTY quads  numbered 3-10
            set q [expr $lRegId/4 + 3]
        }
        if {[string compare $side "R"] == 0} {
            # RHS GTH quads numbered 0-10
            set q [expr ($lRegId-32) / 4]
        }

        set lQuadBlock [get_pblocks quad_$side$q]

        set cells [concat \
                       [get_cells -quiet "top_hal/*lpgbt_link*/*link_gen[$lRegId]*.lpgbt_*link_inst"] \
                       [get_cells -quiet "top_hal/*mgt*/*mgt_gen\[$lRegId]*.MGT_INST"] \
                       [get_cells -quiet "top_hal/*csm*/*mgt_tag\[$lRegId]*decoder*_inst"] \
                       [get_cells -quiet "top_hal/*sector_logic*/sl_gen\[$lRegId]*_inst"]]

        if {[string is space $cells] == 0} {
            puts "Adding cells to pblock $lQuadBlock with mgt #$lRegId"
            add_cells_to_pblock $lQuadBlock $cells
        }
    }
    puts " > No cells in other pblocks"
}

set fpga [get_property part [current_project]]

if {[string compare [string range $fpga 0 6] "xcvu13p"] == 0} {
    assign_pblocks 0  64  L
    assign_pblocks 63 128 R
}
elseif {[string compare [string range $fpga 0 6] "xcvu15p"] == 0} {
    assign_pblocks 0  32  L
    assign_pblocks 33 76  R
}


# Payload Area assignment
#set lPayload [create_pblock payload]
#set lPayloadRect [find_rects [get_sites -of [get_clock_regions] -f "RPM_X >= $lLeftBoundary && RPM_X <= $lRightBoundary"]]
#add_rects_to_pblock $lPayload $lPayloadRect
#
#set lPayloadRect [find_rects [get_sites -of [get_clock_regions -f {ROW_INDEX>2}] -f "RPM_X >= $lLeftBoundary && RPM_X <= $lRightBoundary"]]
#add_cells_to_pblock [get_pblocks payload] [get_cells -quiet datapath/rgen[*].pgen.*]
