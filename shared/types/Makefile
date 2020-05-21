yml2hdl := "../../tools/yml2hdl/yml2hdl.py"

all:
	python3 $(yml2hdl) -e ../config/config_type.yml \
                           common.yml
	python3 $(yml2hdl) -e ../config/config_type.yml \
                           -e common.yml \
                           ../../ucm/pkg/ucm.yml
	python3 $(yml2hdl) -e ../config/config_type.yml \
                           -e common.yml \
                           ../../hp/pkg/hp.yml
	python3 $(yml2hdl) -e ../config/config_type.yml \
                           -e common.yml -e ../../hp/pkg/hp.yml \
                           ../../heg/pkg/heg.yml
	python3 $(yml2hdl) -e ../config/config_type.yml \
                           -e common.yml -e ../../hp/pkg/hp.yml \
                           -e ../../heg/pkg/heg.yml \
                           ../../hps/pkg/hps.yml
	python3 $(yml2hdl) -e ../config/config_type.yml \
                           -e common.yml \
                           ../../ucm_hps/pkg/ucm_hps.yml
	python3 $(yml2hdl) -e ../config/config_type.yml \
                           -e common.yml \
                           ../../mpl/pkg/mpl.yml
