#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

set -e

source "${VIVADO_PATH}/settings64.sh"

vivado () {
    ${VIVADO_PATH}/bin/vivado -nojournal -nolog ${1}
}

bash "${SCRIPT_DIR}/../../../Hog/$1" "$2"

