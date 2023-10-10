#!/usr/bin/env python3

venv_dir_name="env"
required_python_version_major=3
required_python_version_minor=8

#
# If we need to pick specific submodule tags for a given branch of l0mdt-hdl-design, use
# git config -f .gitmodules submodule.SpyBuffer.branch 33707b3
#
# This updates the .gitmodules with the correct tags and get committed to the l0mdt-hdl-design branch


#TV_repo="https://gitlab.cern.ch/atlas_hllhc_uci_mdtTrigger/tv.git"
#TV_repo="ssh://git@gitlab.cern.ch:7999/atlas_hllhc_uci_mdtTrigger/tv.git"
TV_repo="ssh://git@gitlab.cern.ch:7999/atlas-tdaq-phase2-l0mdt-electronics/tv.git"
TV_tag="v008"


#dataformats_repo="https://gitlab.cern.ch/atlas-tdaq-phase2-l0mdt-electronics/dataformats.git"
#dataformats_repo="ssh://git@gitlab.cern.ch:7999/atlas-tdaq-phase2-l0mdt-electronics/dataformats.git"
#dataformats_tag="v4.1.2"  c30926e4

#spybuffer_path="../../shared/SpyBuffer"
#spybuffer_tag="33707b39"

#Path to dataformat and TV. Needed for the pip install
dataformat_path="../../dataformats"
tv_path="../tv"

function print_usage {
    echo "---------------------------------------------------------"
    echo " setup for cocotb-based testbench(es) are for L0MDT-FW"
    echo ""
    echo " This script initializes a python virtual environment"
    echo " in which to run the testbench infrastructure."
    echo " The virtual environment will be named \"${venv_dir_name}\","
    echo " and once set-up can be exited at anytime by calling"
    echo " 'deactivate' at the command-line."
    echo ""
    echo " If the ${venv_dir_name}/ directory is not found, this script"
    echo " installs all of the necessary packages needed to"
    echo " run the testbench (including cocotb). See the setup.py"
    echo " file for a complete list of packages that will be"
    echo " installed in the virtual environment"
    echo ""
    echo " Options:"
    echo "  -l|--xilinxlibs      path to directory containing the compiled libaries"
    echo "  -t|--testvectors      path to directory containing the testvectors"
    echo "  -x|--Xilinx Path      path to directory containing the Vivado toolset (required for compiling XPM macros"
    echo "  -h|--help             print this help message"
    echo "  --skip-deps           do not install any of the external (to TVMaker) packages"
    echo ""
    echo " Example usage:"
    #echo "  $ source setup_env.sh [OPTIONS]"
    echo ""
    echo " source setup_env.sh -l \$XILINX_SIM_LIB -x \$XILINX_VIVADO -t \$L0MDT_TESTVECTOR_DIR "
    echo "----------------------------------------------"
    echo "Settings: "
    echo "TV_DIR:         \$L0MDT_TESTVECTOR_DIR"
    echo "XILINX_SIM_LIB: \$XILINX_SIM_LIB"
    echo "XILINX_VIVADO:  \$XILINX_VIVADO "
    echo "----------------------------------------------"

    echo " Note:"
    echo "  - This script must be run every time you wish to run"
    echo "    the testbench infrastructure (any previous virtual"
    echo "    environment must first be deactivated)."
    echo ""
    echo " Requires:"
    echo "  - python3 version >= ${required_python_version_major}.${required_python_version_minor}"
    echo "---------------------------------------------------------"
}

function python3_available {
    if ! command -v python3 >/dev/null 2>&1; then
        echo "ERROR python3 not installed"
        return 1
    fi

    $(python3 -c "import sys; sys.exit({True:0,False:1}[sys.version_info[1]>=${required_python_version_minor}]);")
    if [ $? -eq 1 ]; then
        echo "ERROR You must have python version >= ${required_python_version_major}.${required_python_version_minor}, you have $(python3 -V) (checked with: \"python3 -V\")"
        return 1
    fi
    return 0
}

function update_pip {
    python3 -m pip install --upgrade --no-cache-dir pip setuptools wheel 2>&1 >/dev/null
    status=$?
    if [[ ! $status -eq 0 ]]; then
        echo "ERROR Problem in updating pip within the virutal environment"
        return 1
    fi
    return 0
}

function activate_venv {
    source ${venv_dir_name}/bin/activate
    if [ $? -eq 1 ]; then
        echo "ERROR Could not activate virtual environment \"${venv_dir_name}\""
        return 1
    fi

    if ! update_pip; then
        return 1
    fi
    return 0
}

function pre_commit_setup {
    if ! command -v pre-commit -V >/dev/null 2>&1; then
        echo "Pre-commit not installed. Installing"
        python3 -m pip install pre-commit
        return 0
    fi

    echo "Pre-commit already installed"
    return 0
}

function find_libpython {
    if ! command -v find_libpython >/dev/null 2>&1; then
        echo "find_libpython not installed. Installing"
        python3 -m pip install find_libpython
        return 0
    fi
    echo "find_libpython already installed"


    return 0
}

function install_tv {
    echo "Installing TV dependencies using ${dataformat_path} and ${tv_path}"
    source ${tv_path}/install_tv_env.sh --light --path_dataformats ${dataformat_path} --path_tv ${tv_path}
}


function update_makefile_questa() {
#Add support to compile Verilog libraries
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i ifneq ($(VERILOG_SOURCES),) '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVERILOG_LIB            += $(foreach SOURCES_VAR, $(filter VERILOG_SOURCES_%, $(.VARIABLES)), $(subst VERILOG_SOURCES_,,$(SOURCES_VAR))) '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i endif '  $(find ./env -name Makefile.questa)


    #Appending  SO COMMANDS ARE REVERSED IN SED
    #COMPILATION COMMANDS FOR VLIB, VMAP OF LIBRARIES and COMPILING VERILOG LIBRARRIES,
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a endif' $(find ./env -name Makefile.questa)
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a \\t\techo "vlog -work $(SOURCES_VAR) $(VLOG_ARGS) $(EXTRA_ARGS) $(call to_tcl_path,$(VERILOG_SOURCES_$(SOURCES_VAR)))" >> $@ ;)' $(find ./env -name Makefile.questa)
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a \\t$(foreach SOURCES_VAR, $(VERILOG_LIB), \\' $(find ./env -name Makefile.questa)
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a ifneq ($(VERILOG_SOURCES),)' $(find ./env -name Makefile.questa)

    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a \\t\tdone' $(find ./env -name Makefile.questa)
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a \\t\techo "vmap $$SOURCES_VAR $(SIM_BUILD)/$$SOURCES_VAR " >> $@ ; \\' $(find ./env -name Makefile.questa)
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a \\t\techo "vlib $(SIM_BUILD)/$$SOURCES_VAR " >> $@ ; \\' $(find ./env -name Makefile.questa)
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a \\tfor SOURCES_VAR in $(VHDL_LIB); do \\' $(find ./env -name Makefile.questa)  #Create all libraries in project, VHDL_LIB has all of them

    sed -i '/@echo "vmap -c" >> $@/a \\t@echo "vmap unisim  $(XILINX_SIM_LIB)/unisim " >> $@ ' $(find ./env -name Makefile.questa)  #Create all libraries in project, VHDL_LIB has all of them

    ###################

    return 0
}


### Old Makefile UPDATE
function old_update_makefile_questa() {
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i ifneq ($(VHDL_SOURCES),) '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += xpm '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += shared_cfg_def_lib '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += project_lib '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += shared_lib '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += ctrl_lib '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += apbus_lib '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += vamc_lib '  $(find ./env -name Makefile.questa)

    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += csf_lib '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += ptc_lib '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += lsf_lib '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += upt_lib '  $(find ./env -name Makefile.questa)
#    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += hp_lib '  $(find ./env -name Makefile.questa)
#    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += heg_roi_lib '  $(find ./env -name Makefile.questa)
#    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += heg_lib '  $(find ./env -name Makefile.questa)
#    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += hps_lib '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += ucm_lib '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += mpl_lib '  $(find ./env -name Makefile.questa)
    #sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += $(foreach SOURCES_VAR, $(filter VHDL_SOURCES_%, $(.VARIABLES)), $(subst VHDL_SOURCES_,,$(SOURCES_VAR))) '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i endif '  $(find ./env -name Makefile.questa)


    sed -i '/^$(SIM_BUILD)\/runsim.do/ i ifneq ($(VERILOG_SOURCES),) '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVERILOG_LIB            += $(foreach SOURCES_VAR, $(filter VERILOG_SOURCES_%, $(.VARIABLES)), $(subst VERILOG_SOURCES_,,$(SOURCES_VAR))) '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i endif '  $(find ./env -name Makefile.questa)





    #Appending  SO COMMANDS ARE REVERSED IN SED
    #COMPILATION COMMANDS FOR VLIB, VMAP OF LIBRARIES and COMPILING VERILOG LIBRARRIES,
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a endif' $(find ./env -name Makefile.questa)
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a \\t\techo "vlog -work $(SOURCES_VAR) $(VLOG_ARGS) $(EXTRA_ARGS) $(call to_tcl_path,$(VERILOG_SOURCES_$(SOURCES_VAR)))" >> $@ ;)' $(find ./env -name Makefile.questa)
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a \\t$(foreach SOURCES_VAR, $(VERILOG_LIB), \\' $(find ./env -name Makefile.questa)
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a ifneq ($(VERILOG_SOURCES),)' $(find ./env -name Makefile.questa)

    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a \\t\tdone' $(find ./env -name Makefile.questa)
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a \\t\techo "vmap $$SOURCES_VAR $(SIM_BUILD)/$$SOURCES_VAR " >> $@ ; \\' $(find ./env -name Makefile.questa)
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a \\t\techo "vlib $(SIM_BUILD)/$$SOURCES_VAR " >> $@ ; \\' $(find ./env -name Makefile.questa)
    sed -i '/\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" /a \\tfor SOURCES_VAR in $(VHDL_LIB); do \\' $(find ./env -name Makefile.questa)  #Create all libraries in project, VHDL_LIB has all of them

    ###################


    ###VHDL_LIB

#    sed -i '/vcom -work / i \\tfor SOURCES_VAR in $(VHDL_LIB); do \\'  $(find ./env -name Makefile.questa)
#    sed -i '/vcom -work / i \\t\techo \"vlib $(SIM_BUILD)\/$$SOURCES_VAR " >> $@ ; \\'  $(find ./env -name Makefile.questa)
#    sed -i '/vcom -work / i \\t\techo \"vmap $$SOURCES_VAR $(SIM_BUILD)\/$$SOURCES_VAR " >> $@ ; \\'  $(find ./env -name Makefile.questa)
#    sed -i '/vcom -work / i \\t\tdone'  $(find ./env -name Makefile.questa)
    sed -i '/vcom -work / i \\t$(foreach SOURCES_VAR, $(VHDL_LIB), \\'  $(find ./env -name Makefile.questa)
    sed -i '/vcom -work $(RTL_LIBRARY)/ i \\t\techo "vcom -work $(SOURCES_VAR) $(VCOM_ARGS) $(call to_tcl_path,$(VHDL_SOURCES_$(SOURCES_VAR)))" >> $@ ;)'  $(find ./env -name Makefile.questa)
    return 0
}

function checkout_deps {
    start_dir=${PWD}

    #Update the submodules in l0mdt-hdl-design
    cd "../../"
    echo "Updating all submodules"
    #git submodule init
    #Update submodule to their version in .gitmodules or master if no version specified
    #git submodule update --remote --merge
    cd ${start_dir}

    # dataformats package. Should have already been checkout as submodule with l0mdt-hdl-design

    #echo "Checking out dataformats tag ${dataformats_tag}"
    #if [ ! -d ${dataformat_path} ]; then
    #    echo "ERROR dataformats submodule does not exist."
    #    return 1
    #fi
    #cd ${dataformat_path}
    #git checkout ${dataformats_tag}
    #cd ${start_dir}

    ## SpyBuffer
    #echo "Checking out SpyBuffer tag ${spybuffer_tag}"
    #if [ ! -d ${spybuffer_path} ]; then
    #    echo "ERROR SpyBuffer submodule does not exist."
    #    return 1
    #fi
    #cd ${spybuffer_path}
    #git checkout ${spybuffer_tag}
    #cd ${start_dir}



    echo "Checking out dataformats tag ${dataformats_tag}"
    if [ ! -d ${dataformat_path} ]; then
        echo "ERROR dataformats submodule does not exist."
        return 1
    fi
    cd ${dataformat_path}
    git checkout ${dataformats_tag}
    cd ${start_dir}

    ## TV package
    #To be remove once that's a submodule.
    if [ ! -d ${tv_path} ]; then
        echo "Checking out dependency: TV"
        git clone -b ${TV_tag} ${TV_repo} ${tv_path}
        cd ${tv_path}
        git submodule init
        git submodule update --remote --merge

        if [ ! -d ${tv_path} ]; then
            echo "ERROR Failed to clone tv repo from ${TV_repo}"
            return 1
        fi
        cd ${start_dir}
    fi

    return 0
}

#------------------------------------------------------------------------
#------------------------------------------------------------------------
function main {
    skip_deps=0
    while test $# -gt 0
    do
        case $1 in
            -h)
                print_usage
                return 0
            ;;
            --help)
                print_usage
                return 0
            ;;
            --skip-deps)
                skip_deps=1
            ;;
            -l)
                export XILINX_LIB_DIR=$2
                export XILINX_SIM_LIB=$2
                shift
            ;;
            --xilinxlibs)
                export XILINX_LIB_DIR=$2
                export XILINX_SIM_LIB=$2
                shift
            ;;
            -x)
                export XILINX_HOME=$2
                shift
            ;;
            -t)
                export L0MDT_TESTVECTOR_DIR=$2
                shift
            ;;
            --testvectors)
                export L0MDT_TESTVECTOR_DIR=$2
                shift
            ;;
            *)
                echo "ERROR Invalid argument: $1"
                return 1
            ;;
        esac
        shift
    done

    ##
    ## enforce python 3
    ##
    if ! python3_available; then
        return 1
    fi

    if [ ! ${skip_deps} -eq 1 ]; then
        if ! checkout_deps; then
            return 1
        fi
    fi

    ##
    ## setup
    ##
    python3 --version
    if [ -d ${venv_dir_name} ]; then
        if ! activate_venv ; then
            return 1
        fi

        if ! pre_commit_setup; then
            return 1
        fi

    else
        echo "Setting up Python environment"
        start_dir=${PWD}

        python3 -m venv ${venv_dir_name}
        if [ ! -d ${venv_dir_name} ]; then
            echo "ERROR Problem setting up python3 virtual environment \"${venv_dir_name}\""
            return 1
        else
            if ! activate_venv ; then
                return 1
            fi

            # if ! python -m pip install --quiet -e . ; then
            if ! python3 -m pip install  -e . ; then
                echo "ERROR There was a problem in installing python3 packages"
                deactivate >/dev/null 2>&1
                return 1
            fi

            echo "Installing required package for the TV environment"
            if ! install_tv; then
                return 1
            fi
            cd ${start_dir}

           # echo "Updating cocotb Makefile.questa to support mixed language compilation"
            if ! update_makefile_questa; then
		return 1
            fi
            echo "Installation successful"


            ##
            ## setup pre-commit
            ##

            if ! pre_commit_setup; then
                return 1
            fi



            #if ! pre_commit_setup; then
            #   return 1
            #fi




            echo "Installation successful"
        fi
    fi

    echo "Virtual environment \"${venv_dir_name}\" has been activated. Type 'deactivate' to exit."
}

#__________________________________
main $*
