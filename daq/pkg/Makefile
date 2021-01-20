mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

types:

	cd $(mkfile_dir) &&                               \
		python3 yml2hdl.py    	  \
		-c daq_user_defs.yml                      \
		common_defs.yml         

	cd $(mkfile_dir) &&                               \
		python3 yml2hdl.py          \
		-e common_defs.yml            \
		-c daq_user_defs.yml                      \
		daq_devel_defs.yml

	cd $(mkfile_dir) &&                               \
		python3 yml2hdl.py          \
		-e common_defs.yml            \
		-e ttc_defs.yml             \
		-e daq_devel_defs.yml                     \
		-c daq_user_defs.yml                      \
		daq_defs.yml

	cd $(mkfile_dir) &&                               \
		python3 yml2hdl.py          \
		-e common_defs.yml            \
		-e ttc_defs.yml             \
		-e daq_devel_defs.yml                     \
		-e daq_defs.yml                           \
		-c daq_user_defs.yml                      \
		daq_row_defs.yml

clean:
	cd $(mkfile_dir) && $(RM) *.svh *.vhd

pkg: types

