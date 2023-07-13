set SCRIPT_PATH "[file normalize [file dirname [info script]]]"
set PATH_REPO   "[file normalize ${SCRIPT_PATH}/../../]"

puts "Creating SVF"
source [file normalize ${SCRIPT_PATH}/../create_svf.tcl]

set new_dir_addr_table $dst_dir/tarball/address_table
set new_dir_bit $dst_dir/tarball/bit
set new_dir_dtbo $dst_dir/tarball/dtbo

file mkdir $new_dir_addr_table
file mkdir $new_dir_bit
file mkdir $new_dir_dtbo


if {[file exists $new_dir_addr_table/modules_${proj_name}\-$describe]} {
    puts "Removing $new_dir_addr_table/modules_${proj_name}\-$describe folder.."
    file delete -force $new_dir_addr_table/modules_${proj_name}\-$describe
}

file copy -force $PATH_REPO/address_tables/modules $new_dir_addr_table/modules_${proj_name}\-$describe

if {[file exists $dst_dir/${proj_name}\-$describe.svf]} {
    file copy -force $dst_dir/${proj_name}\-$describe.svf $new_dir_bit
}

if {[file exists $dst_dir/${proj_name}\-$describe.bit]} {
    file copy -force $dst_dir/${proj_name}\-$describe.bit $new_dir_bit
}

if {[file exists $dst_dir/${proj_name}\-$describe.ltx]} {
    file copy -force $dst_dir/${proj_name}\-$describe.ltx $new_dir_bit
}

# read the data
set f [open $SCRIPT_PATH/address_tables/address_apollo.xml]
set data [read -nonewline $f]
close $f

set w [open $new_dir_addr_table/address_apollo.xml w+]

foreach line $data {
    set old_string "module=\"file:/"
    set new_string " fwinfo=\"uio_endpoint\" module=\"file://modules_${proj_name}\-$describe"
    set new_line [regsub $old_string $line  $new_string]
    puts $w $new_line
}
close $w

set f [open $SCRIPT_PATH/address_tables/connections.xml]
set data [read -nonewline $f]
close $f

set w [open $new_dir_addr_table/connections.xml w+]

foreach line $data {
    string map { "/opt/" "/fw/CM/${proj_name}\-$describe/" } $line 
    puts $w $line
}
close $w



puts "Copying DTSI Files"
set DTSI_DIR [file dirname $dst_main]/dtsi
set DTSI_FILES [glob $PATH_REPO/kernel/hw/*.dtsi]
file mkdir $DTSI_DIR
foreach dtsi_file $DTSI_FILES {
    puts "Creating dtbo for $dtsi_file file"
    file copy -force ${dtsi_file} $DTSI_DIR/
    exec dtc -O dtb -o $new_dir_dtbo/[file rootname [file tail ${dtsi_file}]].dtbo -b 0 ${dtsi_file} -W "no-pci_device_reg" -W "no-pci_device_bus_num" -W "no-simple_bus_reg" -W "no-i2c_bus_reg" -W "no-spi_bus_reg" -W "no-avoid_default_addr_size" -W "no-reg_format"
}

puts "Creating the tarball"
cd $dst_dir/tarball
exec tar cvf ${proj_name}\-$describe.tar bit address_table dtbo 
exec gzip ${proj_name}\-$describe.tar
