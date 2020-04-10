# Parameters
# Add 950 to left side to account for oddities in RPM numbering
set lLeftQuadWidth  [expr 600 + 850]
set lRightQuadWidth [expr 600]

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
            set q [expr $lRegId/4 - 11 + 3]
        }
        if {[string compare $side "R"] == 0} {
            set q [expr $lRegId / 4]
        }

        set lQuadBlock [get_pblocks quad_$side$q]
        puts "Populating $lQuadBlock with mgt #$lRegId"

        #hierarcical
        set lpgbt_cells    [get_cells -quiet "top_framework/*lpgbt_link*/*link_gen[$lRegId]*.lpgbt_*link_inst"]
        set mgt_cells      [get_cells -quiet "top_framework/*mgt*/*mgt_gen\[$lRegId]*.MGT_GEN"]
        set tdc_cells      [get_cells -quiet "top_framework/*tdc*/*mgt_tag\[$lRegId]*decoder*_inst"]

        # TODO: make this tcl call smart to avoid unnecessary filter calls
        set sl_cells       [get_cells -quiet -hierarchical -filter "NAME =~ *top_framework/sector_logic_link_wrapper_inst/sl_gen[$lRegId].*"]
        # avoid hierarchical filters and use direct calling with wildcards,
        # e.g. [get_cells -quiet datapath/rgen[*].pgen.*]


        set cells "$mgt_cells $lpgbt_cells $sl_cells $tdc_cells"

        puts "Adding cells $cells to pblock $lQuadBlock"

        if {[string is space $cells] == 0} {
            add_cells_to_pblock -quiet $lQuadBlock $cells
        }
    }
}

assign_pblocks 0   44  R
assign_pblocks 44  76  L

# Payload Area assignment
#set lPayload [create_pblock payload]
#set lPayloadRect [find_rects [get_sites -of [get_clock_regions] -f "RPM_X >= $lLeftBoundary && RPM_X <= $lRightBoundary"]]
#add_rects_to_pblock $lPayload $lPayloadRect
#
#set lPayloadRect [find_rects [get_sites -of [get_clock_regions -f {ROW_INDEX>2}] -f "RPM_X >= $lLeftBoundary && RPM_X <= $lRightBoundary"]]
#add_cells_to_pblock [get_pblocks payload] [get_cells -quiet datapath/rgen[*].pgen.*]
