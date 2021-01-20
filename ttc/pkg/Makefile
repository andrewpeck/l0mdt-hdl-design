mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

types:
	cd $(mkfile_dir) &&                                \
		python3 ../../tools/yml2hdl/yml2hdl.py     \
		-e ../../shared/types/common_ieee.yml      \
		-e ../../shared/types/common_constants.yml \
		-e ../../dataformats/l0mdt_constants.yml   \
		-e ../../dataformats/l0mdt_dataformats.yml \
		-e ../../shared/types/common_types.yml     \
		-e ../../shared/types/common_defs.yml      \
		ttc_defs.yml

clean:
	cd $(mkfile_dir) && $(RM) *.svh *vhd

pkg: types
