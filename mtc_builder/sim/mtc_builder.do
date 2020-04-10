vlib work
vmap work work
vlog -work work +incdir+../../IP/fifo_54/  -sv ../../IP/fifo_54/fifo_54_sim_netlist.v
vlog -work work -sv ../src/mtc_builder.sv
vcom -work work ../src/mtc_builder_wrapper.vhd
vlog -work work -sv ../tb/mtc_tb.sv


vsim  -debugDB -t 10ps  -voptargs="+acc" -L unisims_ver -L unisim -L work mtc_tb glbl -suppress 6630 -wlf mtc_builder.wlf
set WildcardFilter "Variable Constant Generic Parameter SpecParam Assertion Cover Endpoint ScVariable CellInternal ImmediateAssert VHDLFile"
add wave -r /*
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
run -all
abort
