#!/usr/bin/env bash
# -------------------------------
# 
# -------------------------------

yml2hdl="../../../tools/yml2hdl/yml2hdl.py"
# common_ieee="../../../shared/types/common_ieee.yml"

#####
# python3 $yml2hdl -e $common_ieee MPL/MPL_TYPES_v2.yml
python3 $yml2hdl -v -n MPL_CTRL MPL/MPL_PKG.yml
python3 $yml2hdl -v MEM_INT_10A148D/MEM_INT_10A148D_PKG.yml