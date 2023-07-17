SHELL:=/bin/bash

MOD_NAME =
LOG_FILE = make.log
################################################################################
# Use CCZE and/or time if available
################################################################################

CCZE := $(shell command -v ccze 2> /dev/null)
ifndef CCZE
COLORIZE =
else
COLORIZE = | ccze -A
endif

IFTIME := $(shell command -v time 2> /dev/null)
ifndef IFTIME
TIMECMD =
else
TIMECMD = time -p
endif

################################################################################
# Shortcut to list all projects
################################################################################

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

################################################################################
# Project creation / compilation
################################################################################

PROJECT_LIST = $(patsubst %/,%,$(patsubst Top/%,%,$(dir $(dir $(shell find Top/ -name hog.conf)))))
CREATE_LIST = $(addprefix create_,$(PROJECT_LIST))
OPEN_LIST = $(addprefix open_,$(PROJECT_LIST))

list_hog_projects:
	@echo $(PROJECT_LIST)

$(CREATE_LIST):
	@echo -------------------------------------------------------------------------------- $(COLORIZE)
	@echo Creating Project $(patsubst create_%,%,$@)                                       $(COLORIZE)
	@echo -------------------------------------------------------------------------------- $(COLORIZE)
	@time Hog/CreateProject.sh $(patsubst create_%,%,$@)   2>&1 | tee -a 	   $(LOG_FILE) $(COLORIZE)

$(PROJECT_LIST):
	@echo -------------------------------------------------------------------------------- $(COLORIZE)
	@echo Launching Hog Workflow $@                                                        $(COLORIZE)
	@echo -------------------------------------------------------------------------------- $(COLORIZE)
	@time Hog/LaunchWorkflow.sh $@          			         2>&1 | tee -a $(LOG_FILE) $(COLORIZE)

$(OPEN_LIST):
	vivado Projects/$(patsubst open_%,%,$@)/$(patsubst open_%,%,$@).xpr &

################################################################################
# Regmap + types
################################################################################

XML_FILES=$(shell find HAL/ctrl/src -name '*.xml' -type l)
MAP_OBJS = $(patsubst %.xml, %_map.vhd, $(XML_FILES))
PKG_OBJS = $(patsubst %.xml, %_PKG.vhd, $(XML_FILES))
YML_OBJS = $(patsubst %.xml, %_PKG.yml, $(XML_FILES))
DEF_OBJS = $(patsubst %.xml, %_PKG_DEF.vhd, $(XML_FILES))
SVH_OBJS = $(patsubst %.xml, %_PKG.svh, $(XML_FILES))
TXT_OBJS = $(patsubst %.xml, %_PKG.txt, $(XML_FILES))

clean_regmap:
	@rm -rf $(MAP_OBJS) $(PKG_OBJS) $(YML_OBJS) $(DEF_OBJS) $(SVH_OBJS) $(TXT_OBJS)

# Updates the yml2hdl type system
types:
	./tools/gldl-scripts/yml2hdl.sh -p UserLogic
# make -C shared/types

################################################################################
# Regmap + types
################################################################################

# Update the XML2VHDL register map
regmap : $(MAP_OBJS)

# Update the XML2VHDL register map
%_map.vhd %_PKG.vhd : %.xml
	@echo "================================== $(basename $(notdir $<)) =================================="
	@echo regmap/build_vhdl_packages.py -y 3 -f True -x address_tables/modules/$(basename $(notdir $<)).xml -o  $(dir $<) --mapTemplate templates/axi_generic/template_map_withbram.vhd $(basename $(notdir $<))

	@python3 regmap/build_vhdl_packages.py \
			-y 3 \
			-f True \
			-x address_tables/modules/$(basename $(notdir $<)).xml \
			-o  $(dir $<) \
			--mapTemplate templates/axi_generic/template_map_withbram.vhd \
			$(basename $(notdir $<)) 2>&1 | tee -a $(LOG_FILE)

	@if [ $(basename $(notdir $<)) == "FM" ]; then \
		echo VHDL + SV; \
		python3 tools/yml2hdl/yml2hdl.py -p $(basename $(notdir $<))_CTRL -f $(patsubst %.xml,%_PKG.yml,$<) 2>&1 | tee -a $(LOG_FILE); \
	else \
		echo VHDL only; \
		python3 tools/yml2hdl/yml2hdl.py -p $(basename $(notdir $<))_CTRL -f -V $(patsubst %.xml,%_PKG.yml,$<) 2>&1 | tee -a $(LOG_FILE); \
	fi;

################################################################################
# MDT Flavors
################################################################################

# Generates different flavors of the MDT firmware based on Top/mdt_flavors.yml
flavors:
	tclsh Top/generate_mdt_flavors.tcl

################################################################################
# Common
################################################################################

init:
	git submodule update --init --recursive

all:
	make clean_regmap
	make -j1 regmap
	make types
	make flavors

clean: clean_ip clean_projects

# target to clean out generated IP cruft
clean_ip:
	git clean -dfX HAL/IP
	git clean -dfX HAL/c2c
	git clean -dfX IP

clean_bin:
	rm -rf bin

# target to remove generated Hog projects
clean_projects:
	rm -rf Projects
