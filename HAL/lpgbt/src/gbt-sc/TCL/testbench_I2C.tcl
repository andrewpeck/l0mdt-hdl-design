source TCL/testbench.tcl

# Compile files
compile_project

# Launch simulation
simulate start

# send_command {addr trid channel len command data}

# Enable I2C ch. 0
send_command 0x00 0x01 0x00 0x02 0xFF000000

# Control register:
	#	FREQ[1:0]	: "00" -> 100kHz, "01" -> 200kHz, "10" -> 400kHz, "11" -> 1MHz
	#	NBYTE[6:2]	: Number of bytes to be transmitted (used only for multi-byte transmission)
	#	SCLMODE[7]	: '0' -> Open-drain (Z/GND), '1' -> CMOS (VCC/GND)
	#
	#	Configuration:
	#		Multi-byte mode	: ENABLED       -> ADDR + 2 bytes :	< Register >< Value >
	#		Frequency		: 100kHz
	#		SCL mode		: Open-drain
	#
	#		Value			: 8'b00001000   -> 8'h08
send_command 0x00 0x02 0x03 0x30 0x08000000

# Data:
    # Register  : 0x00
    # Value     : 0x00
send_command 0x00 0x03 0x03 0x40 0x00000000

# Go command:
    # ADDR      : 0x20    
send_command 0x00 0x04 0x03 0xDA 0x20000000