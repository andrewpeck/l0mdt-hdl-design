yml2hdl := "../../tools/yml2hdl/yml2hdl.py"

all:
	python3 $(yml2hdl) -e ../config/config_type.yml \
                    common_constants.yml
	python3 $(yml2hdl) -e ../config/config_type.yml \
                     -e common_constants.yml \
                     common_types.yml 
	python3 $(yml2hdl) -e ../config/config_type.yml \
                     -e common_constants.yml \
                     -e common_types.yml \
                     ../../ucm/pkg/ucm.yml
	python3 $(yml2hdl) -e ../config/config_type.yml \
                     -e common_constants.yml \
                     -e common_types.yml \
                     ../../hp/pkg/hp.yml
	python3 $(yml2hdl) -e ../config/config_type.yml \
                     -e common_constants.yml \
                     -e common_types.yml \
                     -e ../../hp/pkg/hp.yml \
                     ../../heg/pkg/heg.yml
	python3 $(yml2hdl) -e ../config/config_type.yml \
                     -e common_constants.yml \
                     -e common_types.yml \
                     -e ../../hp/pkg/hp.yml \
                     -e ../../heg/pkg/heg.yml \
                     ../../hps/pkg/hps.yml
	python3 $(yml2hdl) -e ../config/config_type.yml \
                     -e common_constants.yml \
                     -e common_types.yml \
                     ../../ucm_hps/pkg/ucm_hps.yml
	python3 $(yml2hdl) -e ../config/config_type.yml \
                     -e common_constants.yml \
                     -e common_types.yml \
                     ../../mpl/pkg/mpl.yml
