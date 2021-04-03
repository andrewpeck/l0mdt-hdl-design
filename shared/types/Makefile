yml2hdl := ../../tools/yml2hdl_v1/yml2hdl.py

common := -e yml2hdl_v1/common_ieee.yml       \
	-e ../../dataformats/l0mdt_constants.yml \
	-e yml2hdl_v1/common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats.yml \
	-e yml2hdl_v1/common_types.yml
# new version l0mdt files in dataformat folder
all:
##### common ieee
	python3 $(yml2hdl)  yml2hdl_v1/common_ieee.yml
##### l0mdt constants dataformat folder
	python3 $(yml2hdl)  \
	-e yml2hdl_v1/common_ieee.yml  \
	../../dataformats/l0mdt_constants.yml
##### l0mdt dataformats dataformat folder
	python3 $(yml2hdl)     \
	-e yml2hdl_v1/common_ieee.yml     \
	-e ../../dataformats/l0mdt_constants.yml \
	../../dataformats/l0mdt_dataformats.yml
##### common constants
	python3 $(yml2hdl)     \
	-e yml2hdl_v1/common_ieee.yml     \
	-e ../../dataformats/l0mdt_constants.yml \
	yml2hdl_v1/common_constants.yml
##### common types
	python3 $(yml2hdl)       \
	-e yml2hdl_v1/common_ieee.yml       \
	-e ../../dataformats/l0mdt_constants.yml \
	-e yml2hdl_v1/common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats.yml \
	yml2hdl_v1/common_types.yml

#### Modules


# ucm
	python3 $(yml2hdl) $(common) \
	../../UserLogic/ucm/pkg/ucm.yml
# hp
	python3 $(yml2hdl) $(common) \
	../../UserLogic/hp/pkg/hp.yml
# heg
		python3 $(yml2hdl) $(common) \
	-e ../../UserLogic/hp/pkg/hp.yml   \
	../../UserLogic/heg/pkg/heg.yml
# hps
	python3 $(yml2hdl) $(common) \
	-e ../../UserLogic/hp/pkg/hp.yml   \
	-e ../../UserLogic/heg/pkg/heg.yml \
	../../UserLogic/hps/pkg/hps.yml
# ucm_hps
# python3 $(yml2hdl) $(common) \
#  ../../ucm_hps/pkg/ucm_hps.yml
# main pipeline
	python3 $(yml2hdl) $(common) \
	../../UserLogic/mpl/pkg/mpl.yml
# csf
	python3 $(yml2hdl) $(common) \
	../../UserLogic/csf/pkg/csf.yml
# TAR
	python3 $(yml2hdl) $(common) \
	../../UserLogic/tar/pkg/tar.yml
	# ULT simulation package
	python3 $(yml2hdl) $(common) \
	-e ../../UserLogic/hp/pkg/hp.yml   \
	-e ../../UserLogic/heg/pkg/heg.yml \
	../../shared/sim/pkg/gldl_ult_tp_sim.yml

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