



board_pkg:
	ghdl -a --std=08 --ieee=synopsys board_pkg_common.vhd boards/board_pkg_mpi_ku15p.vhd system_types_pkg.vhd user_pkg.vhd constants_pkg.vhd display_board_cfg.vhd
	ghdl -e --std=08 --ieee=synopsys display_board_cfg
	./display_board_cfg
