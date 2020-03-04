delete_pblocks -quiet infra ttc clocks payload quad_*
#-------------------------------------

#-------------------------------------
#Infra, ttc, ctrl blocks creation skipped due to the peculiar shape of the DIE.
#To be revisited later in view of specific ku15p applications.
#-------------------------------------
#
# Constrain infra to the lowest row of clock regions, plus X5Y1 that contains the PCIe MGTs
# create_pblock infra
# resize_pblock [get_pblocks infra] -add {CLOCKREGION_X0Y0:CLOCKREGION_X3Y1}
# add_cells_to_pblock [get_pblocks infra] [get_cells -quiet [list infra info ctrl]] 

# # Constrain TTC to a sub-area of infra
# create_pblock ttc -parent [get_pblocks infra]
# resize_pblock [get_pblocks ttc] -add {CLOCKREGION_X0Y0:CLOCKREGION_X3Y0}
# add_cells_to_pblock [get_pblocks ttc] [get_cells -quiet ttc] 


# Except for the clocks, that require a 3 row vertical slice to accommodate 3 MMCMs and the corresponding BUFGs.
# create_pblock clocks
# resize_pblock [get_pblocks clocks] -add {CLOCKREGION_X4Y0:CLOCKREGION_X4Y3}
# add_cells_to_pblock [get_pblocks clocks] [get_cells infra/usp_clocks/*]
# add_cells_to_pblock [get_pblocks clocks] [get_cells infra/osc_clock/*]
# add_cells_to_pblock [get_pblocks clocks] [get_cells ttc/clocks/*]


# # TTC MMC assignment
# # TODO - check the code below
# create_pblock mmcm_ttc
# resize_pblock [get_pblocks mmcm_ttc] -add CLOCKREGION_X5Y9

# add_cells_to_pblock [get_pblocks mmcm_ttc] [get_cells ttc/clocks/mmcm]
# set bufgs { bufg_40 bufg_p bufr_40s cgen\[0\].bufg_aux cgen\[1\].bufg_aux cgen\[2\].bufg_aux }
# foreach lRegId $bufgs {
#     add_cells_to_pblock [get_pblocks mmcm_ttc] [get_cells -quiet ttc/clocks/${i} ]
# }
# # -------------------
#-------------------------------------

# Parameters
set lLeftQuadWidth 1300
set lRightQuadWidth 500

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
        set mgt_cells   [get_cells -quiet -hierarchical -filter "NAME =~ *top_framework/*mgt_gen\[$lRegId]*.MGT_GEN"]
        set lpgbt_cells [get_cells -quiet -hierarchical -filter "NAME =~ *top_framework/*lpgbt_link_wrapper_inst*\lpgbt_gen[$lRegId]*.lpgbt_*link_inst"]
        set sl_cells    [get_cells -quiet -hierarchical -filter "NAME =~ *top_framework/sector_logic_link_wrapper_inst/sl_gen[$lRegId].*x_packet_former_inst"]

        set cells "$mgt_cells $lpgbt_cells $sl_cells"

        puts "Adding cells $cells to pblock $lQuadBlock"

        if {[string is space $cells] == 0} {
            add_cells_to_pblock $lQuadBlock $cells
        }
    }
}

assign_pblocks 0  44  R
assign_pblocks 44  75  L

# Payload Area assignment
set lPayload [create_pblock payload]
set lPayloadRect [find_rects [get_sites -of [get_clock_regions] -f "RPM_X >= $lLeftBoundary && RPM_X <= $lRightBoundary"]]
add_rects_to_pblock $lPayload $lPayloadRect
#set lPayloadRect [find_rects [get_sites -of [get_clock_regions -f {ROW_INDEX>2}] -f "RPM_X >= $lLeftBoundary && RPM_X <= $lRightBoundary"]]
#add_cells_to_pblock [get_pblocks payload] [get_cells -quiet datapath/rgen[*].pgen.*]
