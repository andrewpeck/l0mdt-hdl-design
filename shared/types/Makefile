yml2hdl_v1 := ../../tools/yml2hdl_v1/yml2hdl.py
yml2hdl_v2 := ../../tools/yml2hdl/yml2hdl.py

common := -e yml2hdl_v1/common_ieee_pkg.yml            \
	-e ../../dataformats/l0mdt_constants_pkg.yml   \
	-e yml2hdl_v1/common_constants.yml         \
	-e ../../dataformats/l0mdt_dataformats_pkg.yml \
	-e yml2hdl_v1/common_types.yml
# new version l0mdt files in dataformat folder
all:
##### common ieee
	python3 $(yml2hdl_v1)  yml2hdl_v1/common_ieee_pkg.yml
##### l0mdt constants dataformat folder
	python3 $(yml2hdl_v1)  \
	-e yml2hdl_v1/common_ieee_pkg.yml  \
	-o ../../shared/types \
	../../dataformats/l0mdt_constants_pkg.yml
##### l0mdt dataformats dataformat folder
	python3 $(yml2hdl_v1)     \
	-e yml2hdl_v1/common_ieee_pkg.yml     \
	-e ../../dataformats/l0mdt_constants_pkg.yml \
	-o ../../shared/types \
	../../dataformats/l0mdt_dataformats_pkg.yml
##### common constants
	python3 $(yml2hdl_v1)     \
	-e yml2hdl_v1/common_ieee_pkg.yml     \
	-e ../../dataformats/l0mdt_constants_pkg.yml \
	yml2hdl_v1/common_constants.yml
##### common types
	python3 $(yml2hdl_v1)       \
	-e yml2hdl_v1/common_ieee_pkg.yml       \
	-e ../../dataformats/l0mdt_constants_pkg.yml \
	-e yml2hdl_v1/common_constants.yml  \
	-e ../../dataformats/l0mdt_dataformats_pkg.yml \
	yml2hdl_v1/common_types.yml

# #### SL-MDT Interface
# # common ieee
# 	python3 $(yml2hdl_v1)  yml2hdl_v1/common_ieee_pkg.yml
# ##### l0mdt constants dataformat folder
# 	python3 $(yml2hdl_v1)  \
# 	-e yml2hdl_v1/common_ieee_pkg.yml  \
# 	yml2hdl_v1/sl2mdt_constants.yml
# # l0mdt dataformats dataformat folder
# 	python3 $(yml2hdl_v1)     \
# 	-e yml2hdl_v1/common_ieee_pkg.yml     \
# 	-e yml2hdl_v1/sl2mdt_constants.yml \
# 	yml2hdl_v1/sl2mdt_dataformats.yml

#### Modules
# ucm
	python3 $(yml2hdl_v1) $(common) \
	../../UserLogic/ucm/pkg/ucm.yml
# hp
	python3 $(yml2hdl_v1) $(common) \
	../../UserLogic/hp/pkg/hp.yml
# heg
		python3 $(yml2hdl_v1) $(common) \
	-e ../../UserLogic/hp/pkg/hp.yml   \
	../../UserLogic/heg/pkg/heg.yml
# hps
	python3 $(yml2hdl_v1) $(common) \
	-e ../../UserLogic/hp/pkg/hp.yml   \
	-e ../../UserLogic/heg/pkg/heg.yml \
	../../UserLogic/hps/pkg/hps.yml
# ucm_hps
# python3 $(yml2hdl_v1) $(common) \
#  ../../ucm_hps/pkg/ucm_hps.yml
# main pipeline
	python3 $(yml2hdl_v1) $(common) \
	../../UserLogic/mpl/pkg/mpl.yml
# csf
	python3 $(yml2hdl_v1) $(common) \
	../../UserLogic/csf/pkg/csf.yml
# TAR
	python3 $(yml2hdl_v1) $(common) \
	../../UserLogic/tar/tar_v1.0/pkg/tar.yml
	# ULT simulation package

	python3 $(yml2hdl_v1) $(common) \
	-e ../../UserLogic/hp/pkg/hp.yml   \
	-e ../../UserLogic/heg/pkg/heg.yml \
	../../UserLogic/ult/pkg/ult_tb_sim.yml

# ../../shared/sim/pkg/gldl_ult_tp_sim.yml



# new version l0mdt files in dataformat folder
all2:
##### common ieee
	python3 $(yml2hdl_v2)  common_ieee_pkg.yml
#a ##### l0mdt constants dataformat folder
#a 	python3 $(yml2hdl_v2) -d "./"            \
#a 	-e common_ieee_pkg.yml            \
#a 	../../dataformats/l0mdt_constants_pkg.yml
#a ##### l0mdt dataformats dataformat folder
#a 	python3 $(yml2hdl_v2) -d "./"            \
#a 	-e common_ieee_pkg.yml            \
#a 	-e ../../dataformats/l0mdt_constants_pkg.yml \
#a 	../../dataformats/l0mdt_dataformats_pkg.yml
#a ##### common constants
#a 	python3 $(yml2hdl_v2) -d "./"            \
#a 	-e common_ieee_pkg.yml            \
#a 	-e ../../dataformats/l0mdt_constants_pkg.yml \
#a 	common_constants.yml
#a ##### common types
#a 	python3 $(yml2hdl_v2)       \
#a 	-e common_ieee_pkg.yml       \
#a 	-e ../../dataformats/l0mdt_constants_pkg.yml \
#a 	-e common_constants.yml  \
#a 	-e ../../dataformats/l0mdt_dataformats_pkg.yml \
#a 	common_types.yml


# old version all main files in shared folder
# all:
# 	##### common ieee
# 	python3 $(yml2hdl_v1)  common_ieee_pkg.yml
# 	##### l0mdt constants shared folder
# 	python3 $(yml2hdl_v1)  \
# 	-e common_ieee_pkg.yml  \
# 	l0mdt_constants_pkg.yml
# 	##### l0mdt dataformats shared folder
# 	python3 $(yml2hdl_v1)     \
# 	-e common_ieee_pkg.yml     \
# 	-e l0mdt_constants_pkg.yml \
# 	l0mdt_dataformats_pkg.yml
# 	##### common constants
# 	python3 $(yml2hdl_v1)     \
# 	-e common_ieee_pkg.yml     \
# 	-e l0mdt_constants_pkg.yml \
# 	common_constants.yml
# 	##### common types
# 	python3 $(yml2hdl_v1)       \
# 	-e common_ieee_pkg.yml       \
# 	-e l0mdt_constants_pkg.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats_pkg.yml \
# 	common_types.yml
# 	##### ucm
# 	python3 $(yml2hdl_v1)       \
# 	-e common_ieee_pkg.yml       \
# 	-e l0mdt_constants_pkg.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats_pkg.yml \
# 	-e common_types.yml      \
# 	../../ucm/pkg/ucm.yml
# 	# hp
# 	python3 $(yml2hdl_v1)       \
# 	-e common_ieee_pkg.yml       \
# 	-e l0mdt_constants_pkg.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats_pkg.yml \
# 	-e common_types.yml      \
# 	../../hp/pkg/hp.yml
# 	# heg
# 	python3 $(yml2hdl_v1)       \
# 	-e common_ieee_pkg.yml       \
# 	-e l0mdt_constants_pkg.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats_pkg.yml \
# 	-e common_types.yml      \
# 	-e ../../hp/pkg/hp.yml   \
# 	../../heg/pkg/heg.yml
# 	# hps
# 	python3 $(yml2hdl_v1)       \
# 	-e common_ieee_pkg.yml       \
# 	-e l0mdt_constants_pkg.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats_pkg.yml \
# 	-e common_types.yml      \
# 	-e ../../hp/pkg/hp.yml   \
# 	-e ../../heg/pkg/heg.yml \
# 	../../hps/pkg/hps.yml
# 	# ucm_hps
# 	python3 $(yml2hdl_v1)       \
# 	-e common_ieee_pkg.yml       \
# 	-e l0mdt_constants_pkg.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats_pkg.yml \
# 	-e common_types.yml      \
# 	../../ucm_hps/pkg/ucm_hps.yml
# 	# main pipeline
# 	python3 $(yml2hdl_v1)       \
# 	-e common_ieee_pkg.yml       \
# 	-e l0mdt_constants_pkg.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats_pkg.yml \
# 	-e common_types.yml      \
# 	../../mpl/pkg/mpl.yml
# 	# csf
# 	python3 $(yml2hdl_v1)       \
# 	-e common_ieee_pkg.yml       \
# 	-e l0mdt_constants_pkg.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats_pkg.yml \
# 	-e common_types.yml      \
# 	../../csf/pkg/csf.yml
# 	# TAR
# 	python3 $(yml2hdl_v1)       \
# 	-e common_ieee_pkg.yml       \
# 	-e l0mdt_constants_pkg.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats_pkg.yml \
# 	-e common_types.yml      \
# 	../..tar/tar/tar_v1.0/pkg/tar.yml
# 		# ULT simulation package
# 	python3 $(yml2hdl_v1)       \
# 	-e common_ieee_pkg.yml       \
# 	-e l0mdt_constants_pkg.yml   \
# 	-e common_constants.yml  \
# 	-e l0mdt_dataformats_pkg.yml \
# 	-e common_types.yml      \
# 	../../shared/sim/pkg/gldl_ult_tp_sim.yml
