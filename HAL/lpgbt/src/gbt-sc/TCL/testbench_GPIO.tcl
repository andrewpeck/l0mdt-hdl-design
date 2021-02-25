source TCL/testbench.tcl

# Compile files
compile_project

# Launch simulation
simulate 

# Write register B (Enable GPIO interface)
send_command 0x00 0x01 0x00 0x02 0xFF000000
 
# Configure GPIO direction (output)
send_command 0x00 0x02 0x02 0x20 0xFFFFFFFF

# Write GPIO out register value (12345678h)
send_command 0x00 0x03 0x02 0x10 0x12345678

# Read GPIO out register value
send_command 0x00 0x03 0x02 0x11 0x00000000