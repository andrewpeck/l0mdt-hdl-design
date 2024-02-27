# VIVADO_PATH should point to the Vivado install folder
SHELL := /bin/bash
base := $(shell scripts/base.sh $$(pwd))
proj := $(shell scripts/path.sh $$(pwd))
curr := $(shell basename $$(pwd))

create:
	"$(base)/Hog/CreateProject.sh" $(proj)

proj: create

synth:
	"$(base)/Hog/LaunchWorkflow.sh" "-synth_only" $(proj)

impl:
	"$(base)/Hog/LaunchWorkflow.sh" "-impl_only" $(proj)

gui:
	vivado "$(base)/Projects/$(proj)/$(curr).xpr"

all: create synth impl

types:
	make -C "$(base)/shared/types/types010" all2
	make -C "$(base)/HAL/ttc" types
	make -C "$(base)/UserLogic/daq/" types
