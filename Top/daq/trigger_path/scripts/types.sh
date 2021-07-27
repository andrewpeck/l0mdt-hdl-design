#!/bin/bash

set -e

SCRIPT_DIR=$(dirname "$0")
OLD_DIR=$(pwd)
YML2HDL="$SCRIPT_DIR/../../../../tools/yml2hdl/yml2hdl.py"
DAQ_PKG="$SCRIPT_DIR/../../../../daq/pkg"
TTC_PKG="$SCRIPT_DIR/../../../../ttc/pkg"
DEST="gen"

python3 "$YML2HDL" -v -d "$DEST"       \
	-e "$DAQ_PKG/common_defs.yml"  \
	-c "daq_custom_defs.yml"       \
	"$DAQ_PKG/daq_config_defs.yml"

python3 "$YML2HDL" -v -d "$DEST"   \
	-c "daq_custom_defs.yml"     \
        "$DAQ_PKG/common_defs.yml"

python3 "$YML2HDL" -v -d "$DEST"       \
        -e "$DAQ_PKG/common_defs.yml"  \
	-c "daq_custom_defs.yml"         \
        "$DAQ_PKG/daq_config_defs.yml"

python3 "$YML2HDL" -v -d "$DEST"          \
        -e "$DAQ_PKG/common_defs.yml"     \
        -e "$TTC_PKG/ttc_defs.yml"        \
        -e "$DAQ_PKG/daq_config_defs.yml" \
	-c "daq_custom_defs.yml"            \
        "$DAQ_PKG/daq_defs.yml"

python3 "$YML2HDL" -v -d "$DEST"          \
        -e "$DAQ_PKG/common_defs.yml"     \
        -e "$TTC_PKG/ttc_defs.yml"        \
        -e "$DAQ_PKG/daq_config_defs.yml" \
        -e "$DAQ_PKG/daq_defs.yml"        \
	-c "daq_custom_defs.yml"            \
        "$DAQ_PKG/daq_row_defs.yml"
