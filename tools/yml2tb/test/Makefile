#
# run a GHDL simulation
#

all: april_tb.ghw

clean:
	rm -f *~ *.cf *.vcd *.ghw

april_tb.ghw: april.vhd april_tb.vhd
	rm -f work-obj93.cf
	ghdl -a --ieee=synopsys my_textio.vhd
	ghdl -a --ieee=synopsys april.vhd
	ghdl -a --ieee=synopsys april_tb.vhd
	ghdl -e --ieee=synopsys april_tb
	ghdl -r --ieee=synopsys april_tb --stop-time=250ns --wave=april_tb.ghw

view:
	gtkwave april_tb.ghw -T april_tb.tcl
