set SCRIPT_PATH "[file normalize [file dirname [info script]]]"
set PATH_REPO   "[file normalize ${SCRIPT_PATH}/../../]"

puts "Creating SVF"
source [file normalize ${SCRIPT_PATH}/../create_svf.tcl]

puts "Copying DTSI Files"
set DTSI_DIR [file dirname $dst_bit]/dtsi
set DTSI_FILES [glob $PATH_REPO/kernel/hw/*.dtsi]
file mkdir $DTSI_DIR
foreach dtsi_file $DTSI_FILES {
    file copy -force ${dtsi_file} $DTSI_DIR/
    exec dtc -@ -O dtb -o $DTSI_DIR/[file rootname [file tail ${dtsi_file}]].dtbo ${dtsi_file}
}
