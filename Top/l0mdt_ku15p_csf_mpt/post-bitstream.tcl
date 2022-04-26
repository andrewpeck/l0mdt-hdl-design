set SCRIPT_PATH "[file normalize [file dirname [info script]]]"
set PATH_REPO   "[file normalize ${SCRIPT_PATH}/../../]"

source [file normalize ${SCRIPT_PATH}/../create_svf.tcl]

set DTSI_DIR [file dirname $dst_bit]/dtsi
set DTSI_FILES [glob $PATH_REPO/kernel/hw/*.dtsi_chunk]
file mkdir $DTSI_DIR
foreach dtsi_file $DTSI_FILES {
    file copy ${dtsi_file}  $DTSI_DIR/
}
