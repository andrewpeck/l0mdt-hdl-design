all:
	ghdl --remove
	python ../yml2hdl.py custom_types.yml
	ghdl -a custom_types_pkg.vhd &> /dev/stdout
	@echo "-----------------------------------------------------------------"
	python ../yml2hdl.py -e custom_types.yml  gldl/custom_types_gldl.yml
	ghdl -a custom_types_pkg.vhd gldl/custom_types_gldl_pkg.vhd  &> /dev/stdout
