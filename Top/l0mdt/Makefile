# https://ghdl.readthedocs.io/en/latest/getting/PrecompileVendorPrimitives.html
COMMON_FILES= ../../hal/src/board_pkg_common.vhd\
						  ../../hal/src/boards/board_pkg_mpi_ku15p.vhd hal_user_pkg.vhd \
						  ../../hal/src/system_types_pkg.vhd\
						  ../../hal/src/constants_pkg.vhd\

SHARED_LIB_FILES = ../../shared/config/config_defaults_pkg.vhd\
									 ../../shared/types/common_ieee_pkg.vhd\
									 ../../dataformats/l0mdt_constants_pkg.vhd \
									 ../../dataformats/l0mdt_dataformats_pkg.vhd \
									 ../../shared/types/common_constants_pkg.vhd\
									 ../../shared/detector_parameters/detector_param_pkg.vhd\
									 ../../shared/functions/vhdl2008_functions_pkg.vhd\
									 ../../shared/types/common_types_pkg.vhd

PROJECT_LIB = prj_cfg.vhd

board_pkg: common_ghdl
	ghdl -a --std=08 --ieee=synopsys display_board_cfg.vhd
	ghdl -e --std=08 --ieee=synopsys display_board_cfg
	./display_board_cfg

common_ghdl:
	ghdl -a --work="hal" --std=08 --ieee=synopsys $(COMMON_FILES)
	ghdl -a --work="shared_lib" --std=08 --ieee=synopsys $(SHARED_LIB_FILES)
	ghdl -a --work="project_lib" --std=08 --ieee=synopsys $(PROJECT_LIB)
	ghdl -a --work="shared_lib" --std=08 --ieee=synopsys ../../shared/config/config_pkg.vhd

clean:
	rm -f *.o *.cf
