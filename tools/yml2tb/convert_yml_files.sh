#!/bin/bash
#
# convert YML files to ordered lists
#
./hdl_group_yaml.pl ../../mpl/pkg/mpl.yml > local_yml/mpl.yml
./hdl_group_yaml.pl ../../ucm/pkg/ucm.yml > local_yml/ucm.yml
./hdl_group_yaml.pl ../../heg/pkg/heg.yml > local_yml/heg.yml
./hdl_group_yaml.pl ../../csf/pkg/csf.yml > local_yml/csf.yml
./hdl_group_yaml.pl ../../hp/pkg/hp.yml > local_yml/hp.yml
./hdl_group_yaml.pl ../../ucm_hps/pkg/ucm_hps.yml > local_yml/ucm_hps.yml
./hdl_group_yaml.pl ../../shared/types/l0mdt_dataformats.yml > local_yml/l0mdt_dataformats.yml
./hdl_group_yaml.pl ../../shared/types/common_types.yml > local_yml/common_types.yml
./hdl_group_yaml.pl ../../shared/types/common_constants.yml > local_yml/common_constants.yml
./hdl_group_yaml.pl ../../shared/types/common_ieee.yml > local_yml/common_ieee.yml
./hdl_group_yaml.pl ../../shared/types/l0mdt_constants.yml > local_yml/l0mdt_constants.yml
./hdl_group_yaml.pl ../../hps/pkg/hps.yml > local_yml/hps.yml

