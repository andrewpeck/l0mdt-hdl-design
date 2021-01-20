yml2hdl := "../../tools/yml2hdl/yml2hdl.py"

# old version all main files in shared folder
# all:
# 	##### common ieee
# 	python3 $(yml2hdl)  common_ieee.yml
# 	##### l0mdt constants shared folder
# 	python3 $(yml2hdl)  \
# 	-e common_ieee.yml  \
# 	l0mdt_constants.yml
# 	##### l0mdt dataformats shared folder
# 	python3 $(yml2hdl)     \
# 	-e common_ieee.yml     \
# 	-e l0mdt_constants.yml \
# 	l0mdt_dataformats.yml
# 	##### common constants
# 	python3 $(yml2hdl)     \
# 	-e common_ieee.yml     \
# 	-e l0mdt_constants.yml \
# 	common_constants.yml
# 	##### common types
# 	python3 $(yml2hdl)       \
# 	-e common_ieee.yml       \
# 	-e l0mdt_constants.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats.yml \
# 	common_types.yml
# 	##### ucm
# 	python3 $(yml2hdl)       \
# 	-e common_ieee.yml       \
# 	-e l0mdt_constants.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats.yml \
# 	-e common_types.yml      \
# 	../../ucm/pkg/ucm.yml
# 	# hp
# 	python3 $(yml2hdl)       \
# 	-e common_ieee.yml       \
# 	-e l0mdt_constants.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats.yml \
# 	-e common_types.yml      \
# 	../../hp/pkg/hp.yml
# 	# heg
# 	python3 $(yml2hdl)       \
# 	-e common_ieee.yml       \
# 	-e l0mdt_constants.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats.yml \
# 	-e common_types.yml      \
# 	-e ../../hp/pkg/hp.yml   \
# 	../../heg/pkg/heg.yml
# 	# hps
# 	python3 $(yml2hdl)       \
# 	-e common_ieee.yml       \
# 	-e l0mdt_constants.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats.yml \
# 	-e common_types.yml      \
# 	-e ../../hp/pkg/hp.yml   \
# 	-e ../../heg/pkg/heg.yml \
# 	../../hps/pkg/hps.yml
# 	# ucm_hps
# 	python3 $(yml2hdl)       \
# 	-e common_ieee.yml       \
# 	-e l0mdt_constants.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats.yml \
# 	-e common_types.yml      \
# 	../../ucm_hps/pkg/ucm_hps.yml
# 	# main pipeline
# 	python3 $(yml2hdl)       \
# 	-e common_ieee.yml       \
# 	-e l0mdt_constants.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats.yml \
# 	-e common_types.yml      \
# 	../../mpl/pkg/mpl.yml
# 	# csf
# 	python3 $(yml2hdl)       \
# 	-e common_ieee.yml       \
# 	-e l0mdt_constants.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats.yml \
# 	-e common_types.yml      \
# 	../../csf/pkg/csf.yml
# 	# TAR
# 	python3 $(yml2hdl)       \
# 	-e common_ieee.yml       \
# 	-e l0mdt_constants.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats.yml \
# 	-e common_types.yml      \
# 	../../tar/pkg/tar.yml
# 		# ULT simulation package
# 	python3 $(yml2hdl)       \
# 	-e common_ieee.yml       \
# 	-e l0mdt_constants.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats.yml \
# 	-e common_types.yml      \
# 	../../shared/sim/pkg/gldl_ult_tp_sim.yml

# new version l0mdt files in dataformat folder
all:
	##### common ieee
	python3 $(yml2hdl)  common_ieee.yml
	##### l0mdt constants dataformat folder
	python3 $(yml2hdl)  \
	-e common_ieee.yml  \
	../../dataformats/l0mdt_constants.yml
	##### l0mdt dataformats dataformat folder
	python3 $(yml2hdl)     \
	-e common_ieee.yml     \
	-e ../../dataformats/l0mdt_constants.yml \
	../../dataformats/l0mdt_dataformats.yml
	##### common constants
	python3 $(yml2hdl)     \
	-e common_ieee.yml     \
	-e ../../dataformats/l0mdt_constants.yml \
	common_constants.yml
	##### common types
	python3 $(yml2hdl)       \
	-e common_ieee.yml       \
	-e ../../dataformats/l0mdt_constants.yml \
	-e common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats.yml \
	common_types.yml
	##### ucm
	python3 $(yml2hdl)       \
	-e common_ieee.yml       \
	-e ../../dataformats/l0mdt_constants.yml \
	-e common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e common_types.yml      \
	../../ucm/pkg/ucm.yml
	# hp
	python3 $(yml2hdl)       \
	-e common_ieee.yml       \
	-e ../../dataformats/l0mdt_constants.yml \
	-e common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e common_types.yml      \
	../../hp/pkg/hp.yml
	# heg
	python3 $(yml2hdl)       \
	-e common_ieee.yml       \
	-e ../../dataformats/l0mdt_constants.yml \
	-e common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e common_types.yml      \
	-e ../../hp/pkg/hp.yml   \
	../../heg/pkg/heg.yml
	# hps
	python3 $(yml2hdl)       \
	-e common_ieee.yml       \
	-e ../../dataformats/l0mdt_constants.yml \
	-e common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e common_types.yml      \
	-e ../../hp/pkg/hp.yml   \
	-e ../../heg/pkg/heg.yml \
	../../hps/pkg/hps.yml
	# ucm_hps
	# python3 $(yml2hdl)       \
	# -e common_ieee.yml       \
	# -e ../../dataformats/l0mdt_constants.yml \
	# -e common_constants.yml  \
	# -e ../../dataformats/l0mdt_dataformats.yml \
	# -e common_types.yml      \
	# ../../ucm_hps/pkg/ucm_hps.yml
	# main pipeline
	python3 $(yml2hdl)       \
	-e common_ieee.yml       \
	-e ../../dataformats/l0mdt_constants.yml \
	-e common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e common_types.yml      \
	../../mpl/pkg/mpl.yml
	# csf
	python3 $(yml2hdl)       \
	-e common_ieee.yml       \
	-e ../../dataformats/l0mdt_constants.yml \
	-e common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e common_types.yml      \
	../../csf/pkg/csf.yml
	# TAR
	python3 $(yml2hdl)       \
	-e common_ieee.yml       \
	-e ../../dataformats/l0mdt_constants.yml \
	-e common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e common_types.yml      \
	../../tar/pkg/tar.yml
		# ULT simulation package
	python3 $(yml2hdl)       \
	-e common_ieee.yml       \
	-e ../../dataformats/l0mdt_constants.yml \
	-e common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e common_types.yml      \
	-e ../../hp/pkg/hp.yml   \
	-e ../../heg/pkg/heg.yml \
	../../shared/sim/pkg/gldl_ult_tp_sim.yml