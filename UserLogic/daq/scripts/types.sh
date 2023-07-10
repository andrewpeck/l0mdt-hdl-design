#!/bin/bash

set -e

SCRIPT_DIR=$(dirname "$0")
OLD_DIR=$(pwd)
YML2HDL="$SCRIPT_DIR/../../../tools/yml2hdl/yml2hdl.py"
DAQ_PKG="$SCRIPT_DIR/../daq-lxa-core/pkg"
TTC_PKG="$SCRIPT_DIR/../../../HAL/ttc/ttc-core/pkg"
DEST="$SCRIPT_DIR/../autogen"

mkdir -p "$DEST"
rm -f "$DEST"/*

echo "daq_v3.yml ---------------------------------"
python3 "$YML2HDL" -v -d "$DEST"          \
	-a ieee.std_logic_1164            \
	-a ieee.numeric_std               \
	-a ieee.math_real                 \
	-a daq_core.yml2hdl               \
        "$DAQ_PKG/daq_v3.yml"

python3 "$YML2HDL" -v -b -d "$DEST"       \
	-a ieee.std_logic_1164            \
	-a ieee.numeric_std               \
	-a ieee.math_real                 \
	-s yml2hdl



