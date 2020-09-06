yml2hdl := "../../tools/yml2hdl/yml2hdl.py"

pkg:
	python3 $(yml2hdl)                         \
	-e ../../shared/types/common_ieee.yml      \
	-e ../../dataformats/l0mdt_constants.yml   \
	-e ../../shared/types/common_constants.yml \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e ../../shared/types/common_types.yml     \
	daq_user_defs.yml

	python3 $(yml2hdl)                         \
	-e ../../shared/types/common_ieee.yml      \
	-e ../../dataformats/l0mdt_constants.yml   \
	-e ../../shared/types/common_constants.yml \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e ../../shared/types/common_types.yml     \
	-e daq_user_defs.yml                       \
	daq_devel_defs.yml

	python3 $(yml2hdl)                         \
	-e ../../shared/types/common_ieee.yml      \
	-e ../../dataformats/l0mdt_constants.yml   \
	-e ../../shared/types/common_constants.yml \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e ../../shared/types/common_types.yml     \
	-e ../../ttc/pkg/ttc_defs.yml              \
	-e daq_user_defs.yml                       \
	-e daq_devel_defs.yml                      \
	daq_defs.yml

	python3 $(yml2hdl)                         \
	-e ../../shared/types/common_ieee.yml      \
	-e ../../dataformats/l0mdt_constants.yml   \
	-e ../../shared/types/common_constants.yml \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e ../../shared/types/common_types.yml     \
	-e ../../ttc/pkg/ttc_defs.yml              \
	-e daq_user_defs.yml                       \
	-e daq_devel_defs.yml                      \
        -e daq_defs.yml                            \
	daq_row_defs.yml

