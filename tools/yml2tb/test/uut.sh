GHDL=/usr/bin/ghdl
AOPT="--ieee=synopsys"
rm -f *.cf
$GHDL -a $AOPT --work=shared_lib common_ieee_pkg.vhd
$GHDL -a $AOPT --work=shared_lib eric_types_pkg.vhd
$GHDL -a $AOPT --work=shared_lib eric_textio_pkg.vhd
$GHDL -a $AOPT --work=shared_lib eric_top.vhd
$GHDL -e $AOPT eric_top
