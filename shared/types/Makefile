yml2hdl := "../../tools/yml2hdl/yml2hdl.py"

all:
	# common ieee
	python3 $(yml2hdl)  common_ieee.yml
	# l0mdt constants
	python3 $(yml2hdl)  -e common_ieee.yml \
										  l0mdt_constants.yml
	# l0mdt dataformats
	python3 $(yml2hdl)  -e common_ieee.yml \
			 							  -e l0mdt_constants.yml \
                     	l0mdt_dataformats.yml
	# common constants
	python3 $(yml2hdl)  -e common_ieee.yml \
											-e l0mdt_constants.yml \
                     	common_constants.yml
	# common types
	python3 $(yml2hdl)  -e common_ieee.yml \
											-e l0mdt_constants.yml \
                      -e common_constants.yml \
											-e l0mdt_dataformats.yml \
                     	common_types.yml
	# ucm
	python3 $(yml2hdl) 	-e common_ieee.yml \
											-e l0mdt_constants.yml \
                      -e common_constants.yml \
											-e l0mdt_dataformats.yml \
                     	-e common_types.yml \
                     	../../ucm/pkg/ucm.yml
	# hp
	python3 $(yml2hdl) 	-e common_ieee.yml \
											-e l0mdt_constants.yml \
                      -e common_constants.yml \
											-e l0mdt_dataformats.yml \
                     	-e common_types.yml \
                     	../../hp/pkg/hp.yml
	# heg
	python3 $(yml2hdl) 	-e common_ieee.yml \
											-e l0mdt_constants.yml \
                      -e common_constants.yml \
											-e l0mdt_dataformats.yml \
                     	-e common_types.yml \
                     	-e ../../hp/pkg/hp.yml \
                     	../../heg/pkg/heg.yml
	# hps
	python3 $(yml2hdl) 	-e common_ieee.yml \
											-e l0mdt_constants.yml \
                      -e common_constants.yml \
											-e l0mdt_dataformats.yml \
                     	-e common_types.yml \
                     	-e ../../hp/pkg/hp.yml \
                     	-e ../../heg/pkg/heg.yml \
                     	../../hps/pkg/hps.yml
	# ucm_hps
	python3 $(yml2hdl) 	-e common_ieee.yml \
											-e l0mdt_constants.yml \
                      -e common_constants.yml \
											-e l0mdt_dataformats.yml \
                     	-e common_types.yml \
                     	../../ucm_hps/pkg/ucm_hps.yml
	# main pìpeline
	python3 $(yml2hdl) 	-e common_ieee.yml \
											-e l0mdt_constants.yml \
                      -e common_constants.yml \
											-e l0mdt_dataformats.yml \
                     	-e common_types.yml \
                     	../../mpl/pkg/mpl.yml
	# csf
	python3 $(yml2hdl) 	-e common_ieee.yml \
											-e l0mdt_constants.yml \
                      -e common_constants.yml \
											-e l0mdt_dataformats.yml \
                     	-e common_types.yml \
                     	../../csf/pkg/custom_types_csf.yml
