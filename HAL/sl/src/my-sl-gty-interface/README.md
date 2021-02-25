# To get started
- git clone ssh://git@gitlab.cern.ch:7999/okumura/my-sl-gty-interface.git
- add design source files in my-sl-gty-interface/src/*vhd gty_fixed_latency/*v my-sl-gty-interface/src/top/*v my-sl-gty-interface/src/top/*vhd 
- add constraints of my-sl-gty-interface/src/top/test_top.xdc
- add simulation source file of my-sl-gty-interface/sim/testbench.vhd
- (use KCU116 board in the part selection)
- change file type of wrapper_functions.v into 'Verilog Header'

# Execute
- Run Simulation 
- Run Synthesis, Implementation, and Generate Bitstream

