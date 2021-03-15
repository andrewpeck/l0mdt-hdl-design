#!/usr/bin/env bash
# -------------------------------
# 
# -------------------------------

yml2hdl="../../../tools/yml2hdl/yml2hdl.py"
common_ieee="../../../shared/types/common_ieee.yml"

#####
python3 $yml2hdl -e $common_ieee MPL/MPL_TYPES.yml