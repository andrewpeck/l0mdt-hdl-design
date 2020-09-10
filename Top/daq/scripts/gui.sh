#!/bin/bash
set -e

source "${VIVADO_PATH}/settings64.sh"

vivado () {
    ${VIVADO_PATH}/bin/vivado -nojournal -nolog ${1}
}

vivado "$1"
