############# modify these to match project ################
set bin_file 1
set use_questa_simulator 0

## FPGA and Vivado strategies and flows
set FPGA xcku15p-ffva1760-2-e
set SYNTH_STRATEGY "Flow_PerfOptimized_high" 
set SYNTH_FLOW "Vivado Synthesis 2019"
set IMPL_STRATEGY "Performance_ExplorePostRoutePhysOpt"
set IMPL_FLOW "Vivado Implementation 2019"
set SIMULATOR "Xsim"

# set_property flow {Vivado Synthesis 2019} [get_runs synth_1]
# set_property write_incremental_synth_checkpoint true [get_runs synth_1]
# set_property strategy Flow_PerfOptimized_high [get_runs synth_1]

############################################################
set DESIGN    "[file rootname [file tail [info script]]]"
set path_repo "[file normalize [file dirname [info script]]]/../../"
source $path_repo/Hog/Tcl/create-project.tcl