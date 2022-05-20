proj := $(shell basename $$(pwd))

all: create ip synth impl

create: 
	bash scripts/build.sh "CreateProject.sh" $(proj)

ip: 
	bash scripts/build.sh "LaunchIPSynth.sh" $(proj)

synth:
	bash scripts/build.sh "LaunchSynthesis.sh" $(proj)

impl:
	bash scripts/build.sh "LaunchImplementation.sh" $(proj)

gui:
	bash scripts/gui.sh "../../VivadoProject/$(proj)/$(proj).xpr"


# sim_tb_l1a_win:
# 	bash scripts/build.sh /opt/Xilinx/Vivado/2018.3 \
# 		scripts/build_sim.tcl sim/tb_l1a_win 
