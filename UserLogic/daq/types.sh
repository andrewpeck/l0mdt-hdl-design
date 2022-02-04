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

echo "daq_config_defs.yml ---------------------------------"
python3 "$YML2HDL" -v -d "$DEST"          \
	-c "custom.yml"                   \
	-a ieee.std_logic_1164            \
	-a ieee.numeric_std               \
	-a ieee.math_real                 \
	-a shared_lib.common_ieee         \
        "$DAQ_PKG/daq_config_defs.yml"

echo "daq_defs.yml ----------------------------------------"
python3 "$YML2HDL" -v -d "$DEST"          \
        -e "$TTC_PKG/ttc_defs.yml"        \
        -e "$DAQ_PKG/daq_config_defs.yml" \
	-c "custom.yml"                   \
	-a ieee.std_logic_1164            \
	-a ieee.numeric_std               \
	-a ieee.math_real                 \
	-a shared_lib.common_ieee         \
	-a ttc_def.ttc_defs               \
	-a daq_def.daq_config_defs        \
        "$DAQ_PKG/daq_defs.yml"

echo "daq_row_defs.yml ------------------------------------"
python3 "$YML2HDL" -v -d "$DEST"          \
        -e "$TTC_PKG/ttc_defs.yml"        \
        -e "$DAQ_PKG/daq_config_defs.yml" \
        -e "$DAQ_PKG/daq_defs.yml"        \
	-c "custom.yml"                   \
	-a ieee.std_logic_1164            \
	-a ieee.numeric_std               \
	-a ieee.math_real                 \
	-a shared_lib.common_ieee         \
	-a ttc_def.ttc_defs               \
	-a daq_def.daq_config_defs        \
	-a daq_def.daq_defs               \
        "$DAQ_PKG/daq_row_defs.yml"

echo "data_defs.yml ---------------------------------------"
python3 "$YML2HDL" -v -d "$DEST"          \
        -e "$TTC_PKG/ttc_defs.yml"        \
        -e "$DAQ_PKG/daq_config_defs.yml" \
        -e "$DAQ_PKG/daq_defs.yml"        \
	-c "custom.yml"                   \
	-a ieee.std_logic_1164            \
	-a ieee.numeric_std               \
	-a ieee.math_real                 \
	-a shared_lib.common_ieee         \
	-a ttc_def.ttc_defs               \
	-a daq_def.daq_config_defs        \
	-a daq_def.daq_defs               \
        "daq_data_path_defs.yml"

echo "trigger_defs.yml ------------------------------------"
python3 "$YML2HDL" -v -d "$DEST"          \
        -e "$TTC_PKG/ttc_defs.yml"        \
        -e "$DAQ_PKG/daq_config_defs.yml" \
        -e "$DAQ_PKG/daq_defs.yml"        \
	-c "custom.yml"                   \
	-a ieee.std_logic_1164            \
	-a ieee.numeric_std               \
	-a ieee.math_real                 \
	-a shared_lib.common_ieee         \
	-a ttc_def.ttc_defs               \
	-a daq_def.daq_config_defs        \
	-a daq_def.daq_defs               \
        "daq_trigger_path_defs.yml"
