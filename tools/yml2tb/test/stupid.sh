# GHDL=/usr/bin/ghdl
GHDL=/home/hazen/src/ghdl-0.37/bin/ghdl
AOPT="--ieee=synopsys"
rm -f *.cf
$GHDL -a $AOPT --work=stupid stupid_types.vhd
$GHDL -a $AOPT --work=stupid stupid.vhd
