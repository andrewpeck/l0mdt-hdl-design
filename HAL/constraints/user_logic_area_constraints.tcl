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

    # hit extraction groups
    add_cells_to_pblock -cells [get_cells "ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_INN.HPS"] PBLOCK_SLR_1
    add_cells_to_pblock -cells [get_cells "ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_MID.HPS"] PBLOCK_SLR_2
    add_cells_to_pblock -cells [get_cells "ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_OUT.HPS"] PBLOCK_SLR_3
    add_cells_to_pblock -cells [get_cells "ult_inst/logic_gen.H2S_GEN.ULT_H2S/HPS_EXT.HPS"] PBLOCK_SLR_0

    # tar
    add_cells_to_pblock -cells [get_cells "ult_inst/logic_gen.TAR_GEN.ULT_TAR/TAR/INN_EN.TAR_INN"] PBLOCK_SLR_1
    add_cells_to_pblock -cells [get_cells "ult_inst/logic_gen.TAR_GEN.ULT_TAR/TAR/INN_EN.TAR_MID"] PBLOCK_SLR_2
    add_cells_to_pblock -cells [get_cells "ult_inst/logic_gen.TAR_GEN.ULT_TAR/TAR/INN_EN.TAR_OUT"] PBLOCK_SLR_3
    add_cells_to_pblock -cells [get_cells "ult_inst/logic_gen.TAR_GEN.ULT_TAR/TAR/INN_EN.TAR_EXT"] PBLOCK_SLR_0

    # ucm
    add_cells_to_pblock -cells [get_cells "logic_gen.UCM_GEN.ULT_UCM"] PBLOCK_SLR_0

    # daq
}
