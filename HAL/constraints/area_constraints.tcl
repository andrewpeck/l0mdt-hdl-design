proc string= {a b} {
    if {[string compare $a $b] == 0} {
        return 1
    } else {
        return 0
    }
}


###############################################################################
# User Logic Area Constraints
###############################################################################

set num_slrs 0

set part [get_property part [current_project]]
if {[regexp {xcvu13p.*} $part]} {
    set num_slrs 4
}

if {$num_slrs > 0} {

    # create pblocks 1/2/3/4
    for {set i 0} {$i < $num_slrs} {incr i} {
        set pblock PBLOCK_SLR_$i
        delete_pblock -quiet [get_pblocks $pblock]
        create_pblock $pblock
        resize_pblock -add [get_slrs SLR$i] $pblock
    }

    set PBLOCK_INN PBLOCK_SLR_1
    set PBLOCK_MID PBLOCK_SLR_2
    set PBLOCK_OUT PBLOCK_SLR_3
    set PBLOCK_EXT PBLOCK_SLR_0
    set PBLOCK_FELIX $PBLOCK_EXT

    # felix
    add_cells_to_pblock -quiet -cells [get_cells -hier -filter "NAME =~ top_hal/*felix*"] $PBLOCK_FELIX

    # polmuxes
    add_cells_to_pblock -quiet -cells [get_cells -hier -filter "NAME =~ top_hal/station_gen[0].polmux_gen[*].polmux_wrapper*"] $PBLOCK_INN
    add_cells_to_pblock -quiet -cells [get_cells -hier -filter "NAME =~ top_hal/station_gen[1].polmux_gen[*].polmux_wrapper*"] $PBLOCK_MID
    add_cells_to_pblock -quiet -cells [get_cells -hier -filter "NAME =~ top_hal/station_gen[2].polmux_gen[*].polmux_wrapper*"] $PBLOCK_OUT
    add_cells_to_pblock -quiet -cells [get_cells -hier -filter "NAME =~ top_hal/station_gen[3].polmux_gen[*].polmux_wrapper*"] $PBLOCK_EXT

    # hit extraction groups
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_INN.HPS*"] $PBLOCK_INN
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_MID.HPS*"] $PBLOCK_MID
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_OUT.HPS*"] $PBLOCK_OUT
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_EXT.HPS*"] $PBLOCK_EXT

    # tar
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.TAR_GEN.ULT_TAR/TAR/INN_EN.TAR_INN*"] $PBLOCK_INN
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.TAR_GEN.ULT_TAR/TAR/INN_EN.TAR_MID*"] $PBLOCK_MID
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.TAR_GEN.ULT_TAR/TAR/INN_EN.TAR_OUT*"] $PBLOCK_OUT
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.TAR_GEN.ULT_TAR/TAR/INN_EN.TAR_EXT*"] $PBLOCK_EXT

    # ucm
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.UCM_GEN.ULT_UCM*"] $PBLOCK_EXT
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ top_control_inst/ucm_map_inst*"]      $PBLOCK_EXT

    # mpl
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.MPL_GEN.ULT_MPL*"] $PBLOCK_EXT
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ top_control_inst/mpl_map_inst*"]      $PBLOCK_EXT

    # pt
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.PT_GEN.ULT_PTCALC*"] $PBLOCK_EXT

    # mtc
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.MTC_GEN.ULT_MTCB*"] $PBLOCK_EXT

    # daq
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/*inn*"] $PBLOCK_INN
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/*mid*"] $PBLOCK_MID
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/*out*"] $PBLOCK_OUT
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/*ext*"] $PBLOCK_EXT

    # control
    add_cells_to_pblock -quiet -cells [get_cells -hierarchical -filter "NAME =~ top_control_inst/c2cslave_wrapper_inst*"] $PBLOCK_EXT

    # fm

}


###############################################################################
# MGT Area Constraints
###############################################################################

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
    set lLeftQuadWidth  [expr 1500]
    set lRightQuadWidth [expr 1500]
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
                set q [expr $lRegId/4]
            }
        }

        set lQuadBlock [get_pblocks quad_$side$q]

        # gather up the cells for all the links in this quad
        set cells [concat \
                       [get_cells -quiet -hierarchical -filter "NAME =~ top_hal/*mgt*/*mgt_gen[$lRegId]*.MGT_INST"] \
                       [get_cells -quiet -hierarchical -filter "NAME =~ top_hal/*csm*mgt_tag[$lRegId]*"] \
                       [get_cells -quiet -hierarchical -filter "NAME =~ top_hal/*sector_logic*/*mgt_tag[$lRegId]*" ]]

        if {[string is space $cells] == 0} {
            puts "Adding [llength $cells] cells to pblock $lQuadBlock with mgt $side$q lRegId=#$lRegId"
            puts "   > quad_$side$q"
            puts "   > $cells"
            add_cells_to_pblock $lQuadBlock $cells
        } else {
            puts "No cells in pblock $lQuadBlock with mgt #$lRegId"
        }
    }
    puts " > No cells in other pblocks"
}

if {[string= "xcvu13p" $fpga_short]} {
    # slr0
    assign_pblocks 0  15  L $fpga_short
    assign_pblocks 16 31  R $fpga_short
    # slr1
    assign_pblocks 32 47  L $fpga_short
    assign_pblocks 48 63  R $fpga_short
    # slr2
    assign_pblocks 64 79  L $fpga_short
    assign_pblocks 80 95  R $fpga_short
    # slr3
    assign_pblocks 96  111 L $fpga_short
    assign_pblocks 112 127 R $fpga_short
}

if {[string= "xcku15p" $fpga_short]} {
    assign_pblocks 0  31  L $fpga_short
    assign_pblocks 32 75  R $fpga_short
}
