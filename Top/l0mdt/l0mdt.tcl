#vivado
############# modify these to match project ################
set bin_file 1
set use_questa_simulator 0

## FPGA and Vivado strategies and flows
set FPGA xcku15p-ffva1760-2-e
set SYNTH_STRATEGY "Vivado Synthesis Defaults"
set SYNTH_FLOW "Vivado Synthesis 2019"
set IMPL_STRATEGY "Vivado Implementation Defaults"
set IMPL_FLOW "Vivado Implementation 2019"

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
                STEPS.SYNTH_DESIGN.ARGS.ASSERT true \
				STEPS.SYNTH_DESIGN.ARGS.RETIMING false \
				STEPS.SYNTH_DESIGN.ARGS.FANOUT_LIMIT 500 \
				] \
		    impl_1 [dict create \
     			STEPS.PHYS_OPT_DESIGN.IS_ENABLED true \
				STEPS.POST_ROUTE_PHYS_OPT_DESIGN.IS_ENABLED true \
				STEPS.OPT_DESIGN.ARGS.DIRECTIVE Default \
				STEPS.POST_ROUTE_PHYS_OPT_DESIGN.ARGS.DIRECTIVE Default \
			    ]\
		   ]
############################################################


############################################################
set DESIGN    "[file rootname [file tail [info script]]]"
set path_repo "[file normalize [file dirname [info script]]]/../../"

eval exec bash -c {cd "${path_repo}/regmap" && make xml_regmap}

source $path_repo/Hog/Tcl/create_project.tcl

set C2C_PATH $path_repo/c2c/src/c2c
set BD_PATH $path_repo/c2c/src/bd
cd     $path_repo/c2c/src/c2c
source createC2CSlaveInterconnect.tcl

