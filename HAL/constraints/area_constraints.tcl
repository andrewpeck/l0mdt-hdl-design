#proc string= {a b} {
#    if {[string compare $a $b] == 0} {
#        return 1
#    } else {
#        return 0
#    }
#}


################################################################################
## User Logic Area Constraints
################################################################################

#set num_slrs 0

#set part [get_property part [current_project]]
#if {[regexp {xcvu13p.*} $part]} {
#    set num_slrs 4
#}

#proc set_hier_slr_assignment {slr name} {
#     # polmuxes
#    add_cells_to_pblock -quiet -cells [get_cells -hier -filter "NAME =~ $name"] $slr
#    #set_property -quiet USER_SLR_ASSIGNMENT $slr [get_cells -hier -filter "NAME =~ $name"]
#}

#if {$num_slrs > 0} {

#    # set SLR_INN SLR1
#    # set SLR_MID SLR2
#    # set SLR_OUT SLR3
#    # set SLR_EXT SLR0

#    # create pblocks 1/2/3/4
#    for {set i 0} {$i < $num_slrs} {incr i} {
#        set pblock PBLOCK_SLR_$i
#        delete_pblock -quiet [get_pblocks $pblock]
#        create_pblock $pblock
#        resize_pblock -add [get_slrs SLR$i] $pblock
#    }

#    set SLR_INN PBLOCK_SLR_1
#    set SLR_MID PBLOCK_SLR_2
#    set SLR_OUT PBLOCK_SLR_3
#    set SLR_EXT PBLOCK_SLR_0

#    # https://www.xilinx.com/publications/events/developer-forum/2018-frankfurt/timing-closure-tips-and-tricks.pdf

#    #-------------------------------------------------------------------------------
#    # SLR Crossings
#    #-------------------------------------------------------------------------------

#    set_property -quiet USER_SLL_REG True [get_cells "ult_inst/*_PL/SHIFT_GEN.data_pl_reg*"]

#    #-------------------------------------------------------------------------------
#    # SLR Placements
#    #-------------------------------------------------------------------------------

#    # felix rx
#    puts "Applying area constraints to felix rx"
#    set_hier_slr_assignment $SLR_EXT "top_hal/*felix_decoder*rx*"

#    # felix tx
#    puts "Applying area constraints to felix tx"
#    set_hier_slr_assignment $SLR_INN "top_hal/felix_tx_inst/felix_tx_gen[*].station_tag[0].felix_tx_inst"
#    set_hier_slr_assignment $SLR_MID "top_hal/felix_tx_inst/felix_tx_gen[*].station_tag[1].felix_tx_inst"
#    set_hier_slr_assignment $SLR_OUT "top_hal/felix_tx_inst/felix_tx_gen[*].station_tag[2].felix_tx_inst"
#    set_hier_slr_assignment $SLR_EXT "top_hal/felix_tx_inst/felix_tx_gen[*].station_tag[3].felix_tx_inst"

#    # polmuxes
#    puts "Applying area constraints to polmux"
#    set_hier_slr_assignment $SLR_INN "top_hal/station_gen[0].polmux_gen[*].polmux_wrapper*"
#    set_hier_slr_assignment $SLR_MID "top_hal/station_gen[1].polmux_gen[*].polmux_wrapper*"
#    set_hier_slr_assignment $SLR_OUT "top_hal/station_gen[2].polmux_gen[*].polmux_wrapper*"
#    set_hier_slr_assignment $SLR_EXT "top_hal/station_gen[3].polmux_gen[*].polmux_wrapper*"

#    # hit extraction groups
#    puts "Applying area constraints to HPS"
#    set_hier_slr_assignment $SLR_INN "ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_INN.HPS*"
#    set_hier_slr_assignment $SLR_MID "ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_MID.HPS*"
#    set_hier_slr_assignment $SLR_OUT "ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_OUT.HPS*"
#    set_hier_slr_assignment $SLR_EXT "ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_EXT.HPS*"

#    # hit extraction groups reset fanout
#    puts "Applying area constraints to H2S reset"
#    set_hier_slr_assignment $SLR_INN "ult_inst/logic_gen.H2S_GEN.ULT_H2S/inn_reset*"
#    set_hier_slr_assignment $SLR_MID "ult_inst/logic_gen.H2S_GEN.ULT_H2S/mid_reset*"
#    set_hier_slr_assignment $SLR_OUT "ult_inst/logic_gen.H2S_GEN.ULT_H2S/out_reset*"
#    set_hier_slr_assignment $SLR_EXT "ult_inst/logic_gen.H2S_GEN.ULT_H2S/ext_reset*"

#    # tar
#    puts "Applying area constraints to TAR"
#    set_hier_slr_assignment $SLR_INN "ult_inst/logic_gen.TAR_GEN.ULT_TAR/HPS_INN.TAR*"
#    set_hier_slr_assignment $SLR_MID "ult_inst/logic_gen.TAR_GEN.ULT_TAR/HPS_MID.TAR*"
#    set_hier_slr_assignment $SLR_OUT "ult_inst/logic_gen.TAR_GEN.ULT_TAR/HPS_OUT.TAR*"
#    set_hier_slr_assignment $SLR_EXT "ult_inst/logic_gen.TAR_GEN.ULT_TAR/HPS_EXT.TAR*"

#    # ucm
#    puts "Applying area constraints to UCM"
#    set_hier_slr_assignment $SLR_EXT "ult_inst/logic_gen.UCM_GEN.ULT_UCM*"
#    set_hier_slr_assignment $SLR_EXT "top_control_inst/*ucm*"

#    # mpl
#    puts "Applying area constraints to MPL"
#    set_hier_slr_assignment $SLR_EXT "ult_inst/logic_gen.MPL_GEN.ULT_MPL*"
#    set_hier_slr_assignment $SLR_EXT "top_control_inst/mpl_map_inst*"

#    # pt
#    puts "Applying area constraints to PT Calc"
#    set_hier_slr_assignment $SLR_EXT "ult_inst/logic_gen.PT_GEN.ULT_PTCALC*"

#    # mtc
#    puts "Applying area constraints to MTC"
#    set_hier_slr_assignment $SLR_EXT "ult_inst/logic_gen.MTC_GEN.ULT_MTCB*"

#    # daq
#    puts "Applying area constraints to DAQ"
#    set_hier_slr_assignment $SLR_INN "ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/DAQ_GEN.gen_daq_inner*"
#    set_hier_slr_assignment $SLR_MID "ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/DAQ_GEN.gen_daq_middle*"
#    set_hier_slr_assignment $SLR_OUT "ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/DAQ_GEN.gen_daq_outer*"
#    set_hier_slr_assignment $SLR_EXT "ult_inst/logic_gen.DAQ_GEN.ULT_DAQ/DAQ_GEN.gen_daq_extra*"

#    # control

#    puts "Applying area constraints to AXI Interconnects"
#    set_hier_slr_assignment $SLR_INN "top_control_inst/c2cslave_wrapper_inst/INTERCONNECT_INN*"
#    set_hier_slr_assignment $SLR_MID "top_control_inst/c2cslave_wrapper_inst/INTERCONNECT_MID*"
#    set_hier_slr_assignment $SLR_OUT "top_control_inst/c2cslave_wrapper_inst/INTERCONNECT_OUT*"
#    set_hier_slr_assignment $SLR_EXT "top_control_inst/c2cslave_wrapper_inst/INTERCONNECT_EXT*"

#    puts "Applying area constraints to C2C"
#    set_hier_slr_assignment $SLR_EXT "top_control_inst/c2cslave_wrapper_inst*/C2C*"

#    puts "Applying area constraints to maps"

#    set_hier_slr_assignment $SLR_INN "top_control_inst/*_inn_mon*"
#    set_hier_slr_assignment $SLR_MID "top_control_inst/*_mid_mon*"
#    set_hier_slr_assignment $SLR_OUT "top_control_inst/*_out_mon*"
#    set_hier_slr_assignment $SLR_EXT "top_control_inst/*_ext_mon*"

#    set_hier_slr_assignment $SLR_INN "top_control_inst/*_inn_map*"
#    set_hier_slr_assignment $SLR_MID "top_control_inst/*_mid_map*"
#    set_hier_slr_assignment $SLR_OUT "top_control_inst/*_out_map*"
#    set_hier_slr_assignment $SLR_EXT "top_control_inst/*_ext_map*"

#    set_hier_slr_assignment $SLR_INN "top_control_inst/*_inn_ctrl*"
#    set_hier_slr_assignment $SLR_MID "top_control_inst/*_mid_ctrl*"
#    set_hier_slr_assignment $SLR_OUT "top_control_inst/*_out_ctrl*"
#    set_hier_slr_assignment $SLR_EXT "top_control_inst/*_ext_ctrl*"

#    # fm

#}


################################################################################
## MGT Area Constraints
################################################################################

## get the FPGA model
## fpga --> fpga_short
## xcvu13p-flga2577-1-e --> xcvu13p
#set fpga [get_property part [current_project]]
#regexp {([0-9,A-z]+)-.*} $fpga -> fpga_short

## Parameters

#if {[string= "xcku15p" $fpga_short]} {
#    # Add 950 to left side to account for oddities in RPM numbering
#    set lLeftQuadWidth  [expr 500 + 850]
#    set lRightQuadWidth [expr 500]
#}
#if {[string= "xcvu13p" $fpga_short]} {
#    set lLeftQuadWidth  [expr 1000]
#    set lRightQuadWidth [expr 1000]
#}

#set lClkBounds [get_XY_bounds [get_clock_regions]]
#puts "Clock region boundaries ${lClkBounds}"
#set lRPMBounds [get_fpga_rpm_bounds]
#puts "FPGA boundaries (RPM coords) $lRPMBounds"

##create_quad_pblocks $lLeftQuadWidth $lRightQuadWidth
#lassign [create_quad_pblocks $lLeftQuadWidth $lRightQuadWidth] lNumQuads lLeftBoundary lRightBoundary

## Create the quad p-blocks and store the number of blocks created
#puts "Created $lNumQuads quads"


#proc assign_pblocks {min  max  side fpga} {

#    for {set lRegId $min} {$lRegId <= $max} {incr lRegId} {

#        set q 0
#        set lQuadBlock ""

#        if {[string= "xcku15p" $fpga]} {
#            if {[string= "L" $side]} {
#                # LHS GTY quads  numbered 3-10
#                set q [expr $lRegId/4 + 3]
#            }
#            if {[string= "R" $side]} {
#                # RHS GTH quads numbered 0-10
#                set q [expr ($lRegId-32) / 4]
#            }
#        }

#        if {[string= "xcvu13p" $fpga]} {
#            set q [expr ($lRegId % 16)/4 + 4*($lRegId/32)]
#        }

#        set lQuadBlock [get_pblocks quad_$side$q]

#        # gather up the cells for all the links in this quad
#        set cells [concat \
#                       [get_cells -quiet -hierarchical -filter "NAME =~ top_hal/*mgt*/*mgt_gen[$lRegId]*.MGT_INST"] \
#                       [get_cells -quiet -hierarchical -filter "NAME =~ top_hal/*csm*mgt_tag[$lRegId]*"] \
#                       [get_cells -quiet -hierarchical -filter "NAME =~ top_hal/*sector_logic*/*mgt_tag[$lRegId]*" ]]

#        if {[string is space $cells] == 0} {
#            puts "Adding [llength $cells] cells to pblock $lQuadBlock with mgt $side$q lRegId=#$lRegId"
#            puts "   > quad_$side$q"
#            # puts "   > $cells"
#            add_cells_to_pblock $lQuadBlock $cells
#        } else {
#            puts "No cells in pblock $lQuadBlock with mgt #$lRegId"
#        }
#    }
#    puts " > No cells in other pblocks"
#}

#if {[string= "xcvu13p" $fpga_short]} {
#    # slr0
#    assign_pblocks 0  15  L $fpga_short
#    assign_pblocks 16 31  R $fpga_short
#    # slr1
#    assign_pblocks 32 47  L $fpga_short
#    assign_pblocks 48 63  R $fpga_short
#    # slr2
#    assign_pblocks 64 79  L $fpga_short
#    assign_pblocks 80 95  R $fpga_short
#    # slr3
#    assign_pblocks 96  111 L $fpga_short
#    assign_pblocks 112 127 R $fpga_short
#}

#if {[string= "xcku15p" $fpga_short]} {
#    assign_pblocks 0  31  L $fpga_short
#    assign_pblocks 32 75  R $fpga_short
#}
