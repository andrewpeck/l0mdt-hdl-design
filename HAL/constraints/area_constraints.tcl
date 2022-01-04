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

    set SLR_INN SLR1
    set SLR_MID SLR2
    set SLR_OUT SLR3
    set SLR_EXT SLR0

    set SLR_FELIX $SLR_EXT

    # https://www.xilinx.com/publications/events/developer-forum/2018-frankfurt/timing-closure-tips-and-tricks.pdf

    # sll crossings
    set_property USER_SLL_REG True [get_cells "ult_inst/*segments_to_pt_av_r*"]
    set_property USER_SLL_REG True [get_cells "ult_inst/*slc_to_h2s_av_r*"]

    # felix
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_FELIX [get_cells -hier -filter "NAME =~ top_hal/*felix_decoder*rx*"]

    # polmuxes
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_INN [get_cells -hier -filter "NAME =~ top_hal/station_gen[0].polmux_gen[*].polmux_wrapper*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_MID [get_cells -hier -filter "NAME =~ top_hal/station_gen[1].polmux_gen[*].polmux_wrapper*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_OUT [get_cells -hier -filter "NAME =~ top_hal/station_gen[2].polmux_gen[*].polmux_wrapper*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hier -filter "NAME =~ top_hal/station_gen[3].polmux_gen[*].polmux_wrapper*"]

    # hit extraction groups
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_INN [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_INN.HPS*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_MID [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_MID.HPS*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_OUT [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_OUT.HPS*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_EXT.HPS*"]

    # hit extraction groups reset fanout
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_INN [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.H2S_GEN.ULT_H2S/inn_reset*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_MID [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.H2S_GEN.ULT_H2S/mid_reset*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_OUT [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.H2S_GEN.ULT_H2S/out_reset*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.H2S_GEN.ULT_H2S/ext_reset*"]

    # tar
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_INN [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.TAR_GEN.ULT_TAR/TAR/INN_EN.TAR_INN*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_MID [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.TAR_GEN.ULT_TAR/TAR/MID_EN.TAR_MID*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_OUT [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.TAR_GEN.ULT_TAR/TAR/OUT_EN.TAR_OUT*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.TAR_GEN.ULT_TAR/TAR/EXT_EN.TAR_EXT*"]

    # ucm
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.UCM_GEN.ULT_UCM*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ top_control_inst/ucm_map_inst*"]

    # mpl
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.MPL_GEN.ULT_MPL*"] 
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ top_control_inst/mpl_map_inst*"]      

    # pt
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.PT_GEN.ULT_PTCALC*"] 

    # mtc
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.MTC_GEN.ULT_MTCB*"] 

    # daq
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_INN [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/*inn*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_MID [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/*mid*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_OUT [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/*out*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/*ext*"]

    # control

    set_property -quiet USER_SLR_ASSIGNMENT $SLR_INN [get_cells -hierarchical -filter "NAME =~ top_control_inst/c2cslave_wrapper_inst/INTERCONNECT_INN*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_MID [get_cells -hierarchical -filter "NAME =~ top_control_inst/c2cslave_wrapper_inst/INTERCONNECT_MID*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_OUT [get_cells -hierarchical -filter "NAME =~ top_control_inst/c2cslave_wrapper_inst/INTERCONNECT_OUT*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ top_control_inst/c2cslave_wrapper_inst/INTERCONNECT_EXT*"]

    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ top_control_inst/c2cslave_wrapper_inst*/K_C2C*"]

    set_property -quiet USER_SLR_ASSIGNMENT $SLR_INN [get_cells -hierarchical -filter "NAME =~ top_control_inst/*_inn_map*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_MID [get_cells -hierarchical -filter "NAME =~ top_control_inst/*_mid_map*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_OUT [get_cells -hierarchical -filter "NAME =~ top_control_inst/*_out_map*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ top_control_inst/*_ext_map*"]

    set_property -quiet USER_SLR_ASSIGNMENT $SLR_INN [get_cells -hierarchical -filter "NAME =~ top_control_inst/*_inn_ctrl*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_MID [get_cells -hierarchical -filter "NAME =~ top_control_inst/*_mid_ctrl*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_OUT [get_cells -hierarchical -filter "NAME =~ top_control_inst/*_out_ctrl*"]
    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ top_control_inst/*_ext_ctrl*"]

    set_property -quiet USER_SLR_ASSIGNMENT $SLR_EXT [get_cells -hierarchical -filter "NAME =~ top_control_inst/*_ucm_ctrl*"]

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
    set lLeftQuadWidth  [expr 900]
    set lRightQuadWidth [expr 900]
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
            set q [expr ($lRegId % 16)/4 + 4*($lRegId/32)]
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
