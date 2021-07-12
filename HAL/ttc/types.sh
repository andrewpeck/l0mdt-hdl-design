#!/bin/bash

set -e

SCRIPT_DIR=$(dirname "$0")
OLD_DIR=$(pwd)
YML2HDL="$SCRIPT_DIR/../../tools/yml2hdl/yml2hdl.py"
TTC_PKG="$SCRIPT_DIR/ttc-core/pkg"
DEST="autogen"

mkdir -p "$DEST"

rm -f "$DEST"/*

python3 "$YML2HDL" -v -d "$DEST"          \
        "$TTC_PKG/common_ieee.yml"

python3 "$YML2HDL" -v -d "$DEST"          \
        "$TTC_PKG/ttc_defs.yml"        

