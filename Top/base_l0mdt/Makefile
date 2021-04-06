# https://ghdl.readthedocs.io/en/latest/getting/PrecompileVendorPrimitives.html
COMMON_FILES= ../../HAL/hal/src/board_pkg_common.vhd\
						  ../../HAL/hal/src/boards/board_pkg_mpi_ku15p.vhd hal_user_pkg.vhd \
						  ../../HAL/hal/src/system_types_pkg.vhd\
						  ../../HAL/hal/src/constants_pkg.vhd\

DEFAULTS_FILES  = ../../shared/config/config_defaults_pkg.vhd\

SHARED_LIB_FILES = ../../shared/types/common_ieee_pkg.vhd \
									 ../../dataformats/l0mdt_constants_pkg.vhd \
									 ../../dataformats/l0mdt_dataformats_pkg.vhd \
									 ../../shared/types/common_constants_pkg.vhd\
									 ../../shared/detector_parameters/detector_param_pkg.vhd\
									 ../../shared/functions/vhdl2008/vhdl2008_functions_pkg.vhd\
									 ../../shared/types/common_types_pkg.vhd \
									 ../../shared/config/config_pkg.vhd

PROJECT_LIB = prj_cfg.vhd

all: bd address_table spybuffers

bd:
	vivado -mode batch -notrace -source create_c2c.tcl ../../Projects/base_l0mdt/base_l0mdt.xpr

address_table:
	cd "../../regmap" && make xml_regmap

spybuffers:
	tclsh "../../HAL/c2c/create_spybuffer_package.tcl"

board_pkg: common_ghdl
	ghdl -a --std=08 --ieee=synopsys display_board_cfg.vhd
	ghdl -r --std=08 --ieee=synopsys display_board_cfg

common_ghdl:
	ghdl -a --work="shared_cfg_def_lib" --std=08 --ieee=synopsys $(DEFAULTS_FILES)
	ghdl -a --work="hal"                --std=08 --ieee=synopsys $(COMMON_FILES)
	ghdl -a --work="project_lib"        --std=08 --ieee=synopsys $(PROJECT_LIB)
	ghdl -a --work="shared_lib"         --std=08 --ieee=synopsys $(SHARED_LIB_FILES)

clean:
	rm -f *.o *.cf
