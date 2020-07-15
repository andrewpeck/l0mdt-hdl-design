#!/usr/bin/perl
#
# Read YAML type specs from a list of YML files, and a VHDL entity declaration
# Generate textio function overrides
#
#
use strict;
use lib '.';
use Storable;
use TextIo;
use Data::Dumper;

my $na = $#ARGV+1;
if( $na < 2) {
    print "usage: $0 types.db output.vhd\n";
    exit;
}

my $dbfile = $ARGV[0];
my $output = $ARGV[1];

my $types = retrieve( $dbfile) or die "Reading database from $dbfile: $!";

open FP, "> $output";
print "For now, writing output to $output\n";

my $yes = 1;			# silently overwrite output
my $debug = 2;

print FP $TextIo::Header;

# pass 1, loop over types
# emit function declarations
print "-------------------- Pass 1:\n" if( $debug);
foreach my $top ( keys %{$types}) {
    print "Processing $top..." if($debug);
    next if( $top eq "__config__");
    my $ptr = $types->{$top};
    my $class = $ptr->{'class'};
    #--- array, which means an _avt type
    if( $class eq 'array') {
	my $size = $ptr->{'size'};
	my $range = "(integer range <>)";
	$range = "($size-1 downto 0)" if( $size ne 'open');
	my $vtype = $top;
	chop $vtype if( $vtype =~ /_$/); # strip trailing underscores
#	$vtype .= "_avt" . $range;
	print FP "-- ARRAY type $top\n";
	print FP "  procedure READ( L:inout LINE; VALUE: out $vtype);\n";
	print FP "  procedure WRITE( L:inout LINE; VALUE: in $vtype);\n";
    } elsif( $class eq 'record') {
	print "RECORD (prototypes)\n" if($debug);
	print FP "-- RECORD type $top\n";
	print FP "  procedure READ( L:inout LINE; VALUE: out $top);\n";
	print FP "  procedure WRITE( L:inout LINE; VALUE: in $top);\n";
    } else {
	$ptr->{'skip'} = "yes";
	print "(skipped)\n" if($debug);
    }
}

print FP $TextIo::Inter;

# pass 2 -- emit function definitions
print "-------------------- Pass 2:\n" if( $debug);
foreach my $top ( keys %{$types}) {
    print "Processing $top...\n" if($debug);
    next if( $top eq "__config__");
    my $ptr = $types->{$top};
    my $class = $ptr->{'class'};
    next if( exists $ptr->{'skip'});

    print FP "\n";
    print FP "  procedure READ( L:inout LINE; VALUE: out $top) is\n";
    print FP "    variable v_data : $top;\n";
    print FP "    variable v_index : integer;\n" if( $class eq 'array');
    print FP "  begin\n";

    if( $class eq 'record') {	# handle record elements
	print "Processing RECORD $top\n" if($debug);
	print Dumper($ptr);
	foreach my $memb ( @{$ptr->{'members'}}) {
	    my $name = $memb->{'name'};
	    my $type = $memb->{'type'};
	    my $size = $memb->{'size'};
	    print "  >>> $name $type($size)\n" if($debug);
	    print FP "    READ(L, v_data.$name);\n";
	}
    } else {			# just read a scalar
	print "Processing $class\n";
	print FP "    READ(L, v_data);\n";
    }

    print FP "  end READ;\n";
}

print "-- done --\n";
print FP $TextIo::Last;
