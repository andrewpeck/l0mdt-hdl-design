# VIVADO_PATH should point to the Vivado install folder
SHELL := /bin/bash
proj := $(shell scripts/path.sh $$(pwd))
curr := $(shell basename $$(pwd))

create:
	"../../Hog/CreateProject.sh" $(proj)

proj: create

synth:
	"../../Hog/LaunchWorkflow.sh" "-synth_only" $(proj)

impl:
	"../../Hog/LaunchWorkflow.sh" "-impl_only" $(proj)

gui:
	vivado "../../Projects/$(proj)/$(curr).xpr"

all: create synth impl

