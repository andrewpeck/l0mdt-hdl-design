#!/bin/bash

set -e

SCRIPT_DIR=$(dirname "$0")
OLD_DIR=$(pwd)
YML2HDL="$SCRIPT_DIR/../../tools/yml2hdl/yml2hdl.py"
DAQ_PKG="$SCRIPT_DIR/daq-core/pkg"
TTC_PKG="$SCRIPT_DIR/../../HAL/ttc/ttc-core/pkg"
DEST="autogen"

mkdir -p "$DEST"

rm -f "$DEST"/*

echo "common_defs.yml -------------------------------------"
python3 "$YML2HDL" -v -d "$DEST"          \
        "$DAQ_PKG/commom_ieee.yml"        
				          
echo "daq_config_defs.yml ---------------------------------"
python3 "$YML2HDL" -v -d "$DEST"          \
	-c "custom.yml"                   \
        "$DAQ_PKG/daq_config_defs.yml"

echo "daq_defs.yml ----------------------------------------"
python3 "$YML2HDL" -v -d "$DEST"          \
        -e "$TTC_PKG/ttc_defs.yml"        \
        -e "$DAQ_PKG/daq_config_defs.yml" \
	-c "custom.yml"                   \
        "$DAQ_PKG/daq_defs.yml"

echo "daq_row_defs.yml ------------------------------------"
python3 "$YML2HDL" -v -d "$DEST"          \
        -e "$TTC_PKG/ttc_defs.yml"        \
        -e "$DAQ_PKG/daq_config_defs.yml" \
        -e "$DAQ_PKG/daq_defs.yml"        \
	-c "custom.yml"                   \
        "$DAQ_PKG/daq_row_defs.yml"

echo "data_defs.yml ---------------------------------------"
python3 "$YML2HDL" -v -d "$DEST"          \
        -e "$TTC_PKG/ttc_defs.yml"        \
        -e "$DAQ_PKG/daq_config_defs.yml" \
        -e "$DAQ_PKG/daq_defs.yml"        \
	-c "custom.yml"                   \
        "daq_data_path_defs.yml"

echo "trigger_defs.yml ------------------------------------"
python3 "$YML2HDL" -v -d "$DEST"          \
        -e "$TTC_PKG/ttc_defs.yml"        \
        -e "$DAQ_PKG/daq_config_defs.yml" \
        -e "$DAQ_PKG/daq_defs.yml"        \
	-c "custom.yml"                   \
        "daq_trigger_path_defs.yml"
