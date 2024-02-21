mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

types:
	cd $(mkfile_dir) &&                                            \
		python3 ../../../tools/yml2hdl/yml2hdl.py -v           \
		-e ../../../shared/types/types010/common_ieee_pkg.yml               \
		-e ../../../dataformats/l0mdt_constants_pkg.yml            \
		-e ../../../dataformats/l0mdt_dataformats_pkg.yml          \
		-e ../../../UserLogic/daq/daq-core/pkg/common_defs.yml \
		ttc_defs.yml

clean:
	cd $(mkfile_dir) && $(RM) *.svh *vhd

pkg: types
