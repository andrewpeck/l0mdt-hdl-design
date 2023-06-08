Commands Run Fast Monitoring Testbench

1. Edit fm_validation_vivado.tcl - Point to location of Xilinx tools , compiled libraries in your linux machine
set xilinx_tools_dir "/opt/tools/Xilinx/Vivado/2020.2"
set xilinx_compiled_lib_dir "/home/psundara/xilinx/compiled_libraries/v2020.2"

2. Create Vivado project with Xilinx AXI VIP and AXI interface to Fast Monitoring block
vivado -source fm_validation_vivado.tcl &

3.Run Simulation from Vivado GUI
      - Questa simulator has been used



![Semantic description of image](./ex_sim.pdf)*Block Diagram of Testbench*


