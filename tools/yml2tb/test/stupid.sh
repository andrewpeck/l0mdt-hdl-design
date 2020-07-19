# GHDL=/usr/bin/ghdl
GHDL=/home/hazen/src/ghdl-0.37/ghdl_mcode 
AOPT="--ieee=synopsys"
rm -f *.cf
$GHDL -a $AOPT --work=stupid stupid_types.vhd
$GHDL -a $AOPT --work=stupid stupid.vhd
