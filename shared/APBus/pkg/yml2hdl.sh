#!/usr/bin/env bash
# -------------------------------
# 
# -------------------------------

yml2hdl="../../../tools/yml2hdl/yml2hdl.py"
# common_ieee_pkg="../../../shared/types/types010/common_ieee_pkg.yml"

#####
# python3 $yml2hdl -e $common_ieee_pkg MPL/MPL_TYPES_v2.yml
python3 $yml2hdl apb_pkg.yml