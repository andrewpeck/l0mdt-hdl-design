#vivado
############# modify these to match project ################
set BIN_FILE 1

## FPGA and Vivado strategies and flows
set FPGA xcku15p-ffva1760-2-e
set SYNTH_STRATEGY "Flow_PerfOptimized_high"
set SYNTH_FLOW "Vivado Synthesis 2019"
set IMPL_STRATEGY "Performance_ExplorePostRoutePhysOpt"
set IMPL_FLOW "Vivado Implementation 2019"
set SIMULATOR "Xsim"

set PROPERTIES [dict create \
            synth_1 [dict create \
                STEPS.SYNTH_DESIGN.ARGS.ASSERT true \
                STEPS.SYNTH_DESIGN.ARGS.FANOUT_LIMIT 600 \
                STEPS.SYNTH_DESIGN.ARGS.RETIMING false \
                ] \
            impl_1 [dict create \
                STEPS.PHYS_OPT_DESIGN.IS_ENABLED true \
                STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED true \
                STEPS.OPT_DESIGN.ARGS.DIRECTIVE Default \
                STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.DIRECTIVE Default \
                   ]\
           ]
############################################################
set DESIGN    "[file rootname [file tail [info script]]]"
set PATH_REPO "[file normalize [file dirname [info script]]]/../.."
source $PATH_REPO/Hog/Tcl/create_project.tcl
set_property default_lib work [current_project]
