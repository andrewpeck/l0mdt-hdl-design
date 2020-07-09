#!/bin/bash
#
# convert YML files to ordered lists
#
./hyphenize_yaml.pl ../../mpl/pkg/mpl.yml > yml/mpl.yml
./hyphenize_yaml.pl ../../ucm/pkg/ucm.yml > yml/ucm.yml
./hyphenize_yaml.pl ../../heg/pkg/heg.yml > yml/heg.yml
./hyphenize_yaml.pl ../../csf/pkg/csf.yml > yml/csf.yml
./hyphenize_yaml.pl ../../hp/pkg/hp.yml > yml/hp.yml
./hyphenize_yaml.pl ../../ucm_hps/pkg/ucm_hps.yml > yml/ucm_hps.yml
./hyphenize_yaml.pl ../../shared/types/l0mdt_dataformats.yml > yml/l0mdt_dataformats.yml
./hyphenize_yaml.pl ../../shared/types/common_types.yml > yml/common_types.yml
./hyphenize_yaml.pl ../../shared/types/common_constants.yml > yml/common_constants.yml
./hyphenize_yaml.pl ../../shared/types/common_ieee.yml > yml/common_ieee.yml
./hyphenize_yaml.pl ../../shared/types/l0mdt_constants.yml > yml/l0mdt_constants.yml
./hyphenize_yaml.pl ../../hps/pkg/hps.yml > yml/hps.yml

