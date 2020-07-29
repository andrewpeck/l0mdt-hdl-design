GHDL=/home/hazen/src/ghdl-0.37/bin/ghdl
AOPT="--ieee=synopsys"
TYPES="../../../shared/types"
rm -f *.cf
echo "compiling common types..."
$GHDL -a $AOPT --work=shared_lib $TYPES/common_ieee_pkg.vhd
$GHDL -a $AOPT --work=shared_lib $TYPES/l0mdt_constants_pkg.vhd 
$GHDL -a $AOPT --work=shared_lib $TYPES/l0mdt_dataformats_pkg.vhd
$GHDL -a $AOPT --work=shared_lib $TYPES/common_constants_pkg.vhd
$GHDL -a $AOPT --work=shared_lib $TYPES/common_types_pkg.vhd
echo "compiling common types...done"
echo "compiling custom textio..."
$GHDL -a $AOPT --work=shared_lib textio.vhd
