# Links

- [Gitlab repo](https://gitlab.cern.ch/gbtsc-fpga-support/gbt-sc/)
- [Doxygen](https://gbt-sc.web.cern.ch)

# GBT-SC module for FPGA

The GBT-SC module has been designed to provide a way to perform the slow control
of a GBT based system (GBTx + SCA)

# GBT-SC

The GBT-SC folder contains the architecture of the VHDL module for FPGAs.
It has been designed in a way to be device agnostic.

Both IC and EC control are supported by the core. The IC is compatible for GBTx and LpGBT control meaning that a configuration must be set to specify the target.
During the ```gbtsc_top``` or the ```ic_top``` instantiation, the following generic parameter can be configure:

```
g_ToLpGBT           : integer range 0 to 1 := 0;                        --! 1 to use LpGBT. Otherwise, it should be 0
```

Default value: GBTx.

# Testbench

The testbench folder contains the model of the SCA as well as a top level
to simulate transaction with this chip.

# TCL

The TCL folder contains TCL scripts made to simplify the use of the modelsim
testbench.

# History

## [v.2.0.0] Release 2.0.0

```markdown
# Launch simulation (Modelsim)

-	Open modelsim
-	Change directory (in TCL window: "cd <root>/gbt-sc/")
-	Source TCL/testbench.tcl script (in TCL window: "source TCL/testbench.tcl")
-	Compile project (in TCL window: "compile_project")
-	Start simulation (in TCL window: "simulate start")

# Send command to SCA

-	Reset command (in TCL window: "send_reset")
-	Connect command (in TCL window: "send_connect")
-	Custom command (in TCL window: "send_command addr trid channel len command data", e.g.: "send_command 0x00 0x01 0x00 0x01 0x02 0x0000FF00")

# GPIO example (TCL/testbench_GPIO.tcl script)

-	Source GPIO example TCL script (in TCL window: "source TCL/testbench_GPIO.tcl")

# I2C example (TCL/testbench_GPIO.tcl script)

-	Source I2C example TCL script (in TCL window: "source TCL/testbench_I2C.tcl")

# JTAG example (TCL/testbench_JTAG.tcl script)

-	Source JTAG example TCL script (in TCL window: "source TCL/testbench_JTAG.tcl")
```

# Test performed

This version was successfully tested with:
-	Modelsim (SCA model)
-	Xilinx Virtex 7 development kit (VC707) + VLDB
-	Altera Stratix V (MiniDAQ 1 from LHCb)

# Foreseen

-	Additional tests (Xilinx and Altera FPGAs)
-	Documentation

