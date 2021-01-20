#vivado
set BIN_FILE 1
#### FPGA and Vivado strategies and flows

set FPGA xcvu5p-flvb2104-2-i
set SYNTH_STRATEGY "Flow_AreaOptimized_high"
set SYNTH_FLOW "Vivado Synthesis 2018"
set IMPL_STRATEGY "Performance_ExplorePostRoutePhysOpt"
set IMPL_FLOW "Vivado Implementation 2018"
set DESIGN "[file rootname [file tail [info script]]]"
set PATH_REPO "[file normalize [file dirname [info script]]]/../../"
set SIMULATOR "ModelSim"
set PROPERTIES [dict create \
 synth_1 [dict create \
   REPORT_STRATEGY  "Vivado Synthesis Default Reports" \
   STEPS.SYNTH_DESIGN.ARGS.FANOUT_LIMIT  "600" \
   STEPS.SYNTH_DESIGN.ARGS.DIRECTIVE  "AreaOptimized_high" \
   STEPS.SYNTH_DESIGN.ARGS.RETIMING  "1" \
   STEPS.SYNTH_DESIGN.ARGS.CONTROL_SET_OPT_THRESHOLD  "1" \
 ] \
 impl_1 [dict create \
   REPORT_STRATEGY  "Vivado Implementation Default Reports" \
   STEPS.INIT_DESIGN.TCL.POST  "/remote/pcatlas4/dcieri/Firmware/l0mdt-hdl-design/Hog/Tcl/integrated/pre-implementation.tcl" \
   STEPS.PLACE_DESIGN.ARGS.DIRECTIVE  "Explore" \
   STEPS.PHYS_OPT_DESIGN.IS_ENABLED  "1" \
   STEPS.PHYS_OPT_DESIGN.ARGS.DIRECTIVE  "Explore" \
   STEPS.ROUTE_DESIGN.ARGS.DIRECTIVE  "Explore" \
   STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED  "1" \
   STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.DIRECTIVE  "AggressiveExplore" \
   STEPS.WRITE_BITSTREAM.ARGS.READBACK_FILE  "0" \
   STEPS.WRITE_BITSTREAM.ARGS.VERBOSE  "0" \
 ] \
]
source $PATH_REPO/Hog/Tcl/create_project.tcl
