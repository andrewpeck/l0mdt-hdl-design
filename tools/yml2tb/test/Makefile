#
# run a GHDL simulation
#

all: april_tb.ghw

clean:
	rm -f *~ *.cf *.vcd *.ghw

april_types.vhd: april_types.yml
	python ~/work/ARICH/FPGA/yml2hdl/yml2hdl.py april_types.yml 

april_tb.ghw: april.vhd april_tb.vhd april_types.vhd april_types_textio.vhd my_textio.vhd \
	april_tb.vhd april_vectors.txt 
	rm -f work-obj93.cf
	ghdl -a --ieee=synopsys my_textio.vhd
	ghdl -a --ieee=synopsys april_types.vhd
	ghdl -a --ieee=synopsys april_types_textio.vhd
	ghdl -a --ieee=synopsys april.vhd
	ghdl -a --ieee=synopsys april_tb.vhd
	ghdl -e --ieee=synopsys april_tb
	ghdl -r --ieee=synopsys april_tb --stop-time=250ns --wave=april_tb.ghw

view:
	gtkwave april_tb.ghw -T april_tb.tcl
