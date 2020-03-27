# Parameters
# TODO: understand how the leftquad width even works.. why 1100??? it makes no sense
# something to do with the weird die shape but I need to understand the details and make this more human readable

set lLeftQuadWidth 1150
set lRightQuadWidth 400

set lClkBounds [get_XY_bounds [get_clock_regions]]
puts "Clock region boundaries ${lClkBounds}"
set lRPMBounds [get_fpga_rpm_bounds]
puts "FPGA boundaries (RPM coords) $lRPMBounds"

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

        # TODO: make this tcl call smart to avoid unnecessary filter calls
        # TODO: avoid hierarchical filters and use direct calling with wildcards, e.g. [get_cells -quiet datapath/rgen[*].pgen.*]
        #set mgt_cells   [get_cells [format "top_framework/mgt_wrapper_inst/mgt_gen\[%i]*MGT_GEN/" $lRegId]]
        set mgt_cells      [get_cells -quiet -hierarchical -filter "NAME =~ *top_framework/*mgt_gen\[$lRegId]*.MGT_GEN"]
        set lpgbt_cells    [get_cells -quiet -hierarchical -filter "NAME =~ *top_framework/*lpgbt_link_wrapper_inst*\*_gen[$lRegId]*.lpgbt_*link_inst"]
        set lpgbt_ic_cells [get_cells -quiet -hierarchical -filter "NAME =~ *top_framework/*gbt_controller_wrapper*\*_gen[$lRegId]*gbt_ic_controller_inst"]
        set sl_cells       [get_cells -quiet -hierarchical -filter "NAME =~ *top_framework/sector_logic_link_wrapper_inst/sl_gen[$lRegId].*"]
        #set tdc_cells      [get_cells -quiet -hierarchical -filter "NAME =~ *top_framework/*tdc_decoder*mgt_loop[$lRegId]*"]
        #FIXME: get tdc cells correctly

        set cells "$mgt_cells $lpgbt_cells $sl_cells $lpgbt_ic_cells $tdc_cells"

        puts "Adding cells $cells to pblock $lQuadBlock"

        if {[string is space $cells] == 0} {
            add_cells_to_pblock $lQuadBlock $cells
        }
    }
}

assign_pblocks 0  44  R
assign_pblocks 44  76  L

# Payload Area assignment
set lPayload [create_pblock payload]
set lPayloadRect [find_rects [get_sites -of [get_clock_regions] -f "RPM_X >= $lLeftBoundary && RPM_X <= $lRightBoundary"]]
add_rects_to_pblock $lPayload $lPayloadRect
#set lPayloadRect [find_rects [get_sites -of [get_clock_regions -f {ROW_INDEX>2}] -f "RPM_X >= $lLeftBoundary && RPM_X <= $lRightBoundary"]]
#add_cells_to_pblock [get_pblocks payload] [get_cells -quiet datapath/rgen[*].pgen.*]
