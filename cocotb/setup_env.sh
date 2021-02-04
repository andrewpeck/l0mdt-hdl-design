#!/bin/bash

venv_dir_name="env"
required_python_version_major=3
required_python_version_minor=6
TV_repo="https://gitlab.cern.ch/atlas_hllhc_muon_trigger/tv.git"
TV_tag="master"

dataformats_repo="https://gitlab.cern.ch/atlas-tdaq-phase2-l0mdt-electronics/dataformats.git"
dataformats_tag= "v4.0.1"

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
    echo "  -c|--componentslibs   path to directory containing the compiled libaries"
    echo "  -t|--testvectors      path to directory containing the testvectors"
    echo "  -h|--help             print this help message"
    echo "  --skip-deps     do not install any of the external (to TVMaker) packages"
    echo "  -h|--help       print this help message"
    echo ""
    echo " Example usage:"
    echo "  $ source setup_env.sh [OPTIONS]"
    echo ""
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
        echo "ERROR You must have python version >=3.6, you have $(python3 -V) (checked with: \"python3 -V\")"
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
        echo "ERROR pre-commit not installed"
        return 1
    fi

    ##
    ## put pre-commit hooks in .git
    ##
    pre-commit install 2>&1 >/dev/null
    return 0
}

function install_tv {
    echo "Installing TV environment"
    python3 -m pip install pandas
    python3 -m pip install tabulate
    python3 -m pip install termcolor
    python3 -m pip install -e ./../dataformats
    python3 -m pip install -e ../tv/TVReader
    python3 -m pip install -e ../tv/TVMaker
    python3 -m pip install -e ../tv/TVDataFormat
    python3 -m pip install -e ../tv
    return 0
}


function update_makefile_questa() {
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i ifneq ($(VHDL_SOURCES),) '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            := shared_cfg_def_lib '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += project_lib '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += shared_lib '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i \\tVHDL_LIB            += $(foreach SOURCES_VAR, $(filter VHDL_SOURCES_%, $(.VARIABLES)), $(subst VHDL_SOURCES_,,$(SOURCES_VAR))) '  $(find ./env -name Makefile.questa)
    sed -i '/^$(SIM_BUILD)\/runsim.do/ i endif '  $(find ./env -name Makefile.questa)


    sed -i '/\\t\@echo \"vmap $(RTL_LIBRARY) $(SIM_BUILD)\/$(RTL_LIBRARY)" >> $@/ a endif'  $(find ./env -name Makefile.questa)


    sed -i '/vcom -work / i \\tfor SOURCES_VAR in $(VHDL_LIB); do \\'  $(find ./env -name Makefile.questa)
    sed -i '/vcom -work / i \\t\techo \"vlib $(SIM_BUILD)\/$$SOURCES_VAR " >> $@ ; \\'  $(find ./env -name Makefile.questa)
    sed -i '/vcom -work / i \\t\techo \"vmap $$SOURCES_VAR $(SIM_BUILD)\/$$SOURCES_VAR " >> $@ ; \\'  $(find ./env -name Makefile.questa)
    sed -i '/vcom -work / i \\t\tdone'  $(find ./env -name Makefile.questa)
    sed -i '/vcom -work / i \\t$(foreach SOURCES_VAR, $(VHDL_LIB), \\'  $(find ./env -name Makefile.questa)
    sed -i '/vcom -work $(RTL_LIBRARY)/ i \\t\techo "vcom -work $(SOURCES_VAR) $(VCOM_ARGS) $(call to_tcl_path,$(VHDL_SOURCES_$(SOURCES_VAR)))" >> $@ ;)'  $(find ./env -name Makefile.questa)
    return 0
}

function checkout_deps {
    ## dataformats package
    if [ ! -d "../dataformats" ]; then
        echo "Checking out dependency: dataformats"
        git clone -b ${dataformats_tag} ${dataformats_repo} ../dataformats
        if [ ! -d "../dataformats" ]; then
            echo "ERROR Failed to clone dataformats repo from ${dataformats_repo}"
            return 1
        fi
    fi
    start_dir=${PWD}
    cd "../dataformats"
    echo "Checking out dataformats branch ${dataformats_tag}"
    git checkout ${dataformats_tag}
    cd ${start_dir}

    ## TV package
    if [ ! -d "../tv" ]; then
        echo "Checking out dependency: TV"
        git clone -b ${TV_tag} ${TV_repo} ../tv
        if [ ! -d "../tv" ]; then
            echo "ERROR Failed to clone tv repo from ${TV_repo}"
            return 1
        fi
    fi

    return 0
}

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
           -c)
                export COMPONENTS_LIB_DIR=$2
                shift
                ;;
            --componentslibs)
                export COMPONENTS_LIB_DIR=$2
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


#    if [ ! ${skip_deps} -eq 1 ]; then
#        if ! checkout_deps; then
#            return 1
#        fi
#    fi

    ##
    ## setup
    ##
    if [ -d ${venv_dir_name} ]; then
         if ! activate_venv ; then
            return 1
        fi

        if ! pre_commit_setup; then
            return 1
        fi

    else
	echo "Setting up Python environment"

        python3 -m venv ${venv_dir_name}
        if [ ! -d ${venv_dir_name} ]; then
            echo "ERROR Problem setting up virtual environment \"${venv_dir_name}\""
            return 1
        else
            if ! activate_venv ; then
                return 1
            fi


	   # if ! python -m pip install --quiet -e . ; then
	    if ! python3 -m pip install  -e . ; then
                echo "ERROR There was a problem in installing the packages"
                deactivate >/dev/null 2>&1
                return 1
            fi

	    echo "Installing required package for the TV environment"
            if ! install_tv; then
                return 1
            fi

	    echo "Updating cocotb Makefile.questa to support mixed language compilation"
	    if ! update_makefile_questa; then
		return 1
	    fi
            echo "Installation successful"


            ##
            ## setup pre-commit
            ##
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
