mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

types:
	cd $(mkfile_dir) &&                                            \
		python3 ../../../tools/yml2hdl/yml2hdl.py -v           \
		-e ../../../shared/types/common_ieee.yml               \
		-e ../../../dataformats/l0mdt_constants.yml            \
		-e ../../../dataformats/l0mdt_dataformats.yml          \
		-e ../../../UserLogic/daq/daq-core/pkg/common_defs.yml \
		ttc_defs.yml

clean:
	cd $(mkfile_dir) && $(RM) *.svh *vhd

pkg: types
