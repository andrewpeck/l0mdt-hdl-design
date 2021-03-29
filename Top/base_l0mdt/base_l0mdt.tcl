#vivado
############# modify these to match project ################
set BIN_FILE 1
set USE_QUESTA_SIMULATOR 0

## FPGA and Vivado strategies and flows
set FPGA xcku15p-ffva1760-2-e

regexp -- {Vivado v([0-9]{4})\.[0-9]} [version] -> VIVADO_YEAR
set SYNTH_STRATEGY "Vivado Synthesis Defaults"
set SYNTH_FLOW "Vivado Synthesis $VIVADO_YEAR"
set IMPL_STRATEGY "Vivado Implementation Defaults"
set IMPL_FLOW "Vivado Implementation $VIVADO_YEAR"

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
        STEPS.SYNTH_DESIGN.ARGS.RETIMING true \
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
set SYNTH_TOP_MODULE  top_l0mdt
set SIMULATOR  xsim
set DESIGN    "[file rootname [file tail [info script]]]"
set PATH_REPO "[file normalize [file dirname [info script]]]/../../"

# TODO: uncomment when CI machine has uHAL
#eval exec bash -c {cd "${PATH_REPO}/regmap" && make xml_regmap}

source -notrace $PATH_REPO/Hog/Tcl/create_project.tcl

set apollo_root_path $PATH_REPO
set C2C_PATH $PATH_REPO/HAL/c2c/src/c2c
set BD_PATH $PATH_REPO/HAL/c2c/src/bd

cd $C2C_PATH
source -notrace ${C2C_PATH}/createC2CSlaveInterconnect.tcl

#exec tclsh "[file normalize ${C2C_PATH}/create_spybuffer_package.tcl]"
