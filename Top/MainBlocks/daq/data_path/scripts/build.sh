#!/bin/bash

SCRIPT_DIR=$(dirname "$0")

set -e

cd "${SCRIPT_DIR}/../../.."
bash "Hog/LaunchWorkflow.sh" "$1" "$2"

