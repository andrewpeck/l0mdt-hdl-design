#!/bin/bash

set -e

SCRIPT_DIR=$(dirname "$0")
OLD_DIR=$(pwd)
YML2HDL="$SCRIPT_DIR/../../tools/yml2hdl/yml2hdl.py"
TTC_PKG="$SCRIPT_DIR/ttc-core/pkg"
DEST="autogen"

mkdir -p "$DEST"
rm -f "$DEST"/*

echo "ttc_defs.yml -----------------------------------------"
python3 "$YML2HDL" -v -d "$DEST"          \
	-a ieee.std_logic_1164            \
	-a ieee.numeric_std               \
	-a ieee.math_real                 \
	-a shared_lib.common_ieee_pkg         \
        "$TTC_PKG/ttc_defs.yml"        
