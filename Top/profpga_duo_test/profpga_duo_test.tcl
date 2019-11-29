############# modify these to match project ################
set bin_file 1
set use_questa_simulator 0

## FPGA and Vivado strategies and flows
set FPGA xcvu5p-flvb2104-2-i

set SYNTH_STRATEGY "Flow_AreaOptimized_High" 
set SYNTH_FLOW "Vivado Synthesis 2019"
set IMPL_STRATEGY "Performance_ExplorePostRoutePhysOpt"
set IMPL_FLOW "Vivado Implementation 2019"
set DEVICE XVUP
### Set Vivado Runs Properties ###
#
# ATTENTION: The \ character must be the last one of each line
#
# The default Vivado run names are: synth_1 for synthesis and impl_1 for implementation.
#
# To find out the exact name and value of the property, use Vivado GUI to click on the checkbox you like.
# This will make Vivado run the set_property command in the Tcl console.
# Then copy and paste the name and the values from the Vivado Tcl console into the lines below.

set PROPERTIES [dict create \
		    synth_1 [dict create \
				STEPS.SYNTH_DESIGN.ARGS.FANOUT_LIMIT 600 \
				STEPS.SYNTH_DESIGN.ARGS.RETIMING true \
				] \
		    impl_1 [dict create \
				STEPS.OPT_DESIGN.ARGS.DIRECTIVE Default \
				STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.DIRECTIVE AggressiveExplore \
			       ]\
		   ]
############################################################


############################################################
set DESIGN    "[file rootname [file tail [info script]]]"
set path_repo "[file normalize [file dirname [info script]]]/../../"
source $path_repo/Hog/Tcl/create-project.tcl
