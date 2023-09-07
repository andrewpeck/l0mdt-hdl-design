This testbench is built to test the FM endpoint in the AXI C2C interface and FM block in UserLogic. It validates the [HAL/ctrl/src/FM](https://gitlab.cern.ch/atlas-tdaq-phase2-l0mdt-electronics/l0mdt-hdl-design/-/tree/devel/HAL/ctrl/src/FM) VHDL block that is generated using the regmap utility

Commands Run Fast Monitoring Testbench

1. Edit fm_validation_vivado.tcl - Point to location of Xilinx tools , compiled libraries in your linux machine
```
set xilinx_tools_dir "/opt/tools/Xilinx/Vivado/2020.2"

set xilinx_compiled_lib_dir "/home/psundara/xilinx/compiled_libraries/v2020.2"
```
2. Create Vivado project with Xilinx AXI VIP and AXI interface to Fast Monitoring block
```
vivado -source fm_validation_vivado.tcl &
```
3.Run Simulation from Vivado GUI.  Testbench works with the Questa simulator



![BD_Testbench](./FM_tb.png)*Block Diagram of Testbench*