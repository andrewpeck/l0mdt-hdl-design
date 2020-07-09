#!/usr/bin/perl
#
# Read YAML type specs from a list of YML files, and a VHDL entity declaration
# Generate textio function overrides
#
use strict;
use lib '.';
use ReadTypes;
use ReadYaml;
use Data::Dumper;
use TestBench;

my $na = $#ARGV+1;
if( $na < 1) {
    print "usage: $0 types.yml...\n";
    exit;
}

my $output = "test.vhd";

open FP, "> $output";
print "For now, writing output to $output\n";

my $yes = 1;			# silently overwrite output
my $debug = 2;

my $f_uut = $ARGV[0];
my $f_output = $ARGV[1];

my $types = { };			# merged YAML type hashes

my %ltypes;			# leaf types

my $spacey = "                                        ";




#--------------------------------------------------
# store a type
#--------------------------------------------------
my $t_store = sub {
    my ($lev,$name,$ptr) = @_;
    my $type = $ptr->{"type"};
    print "t_store( $lev, $name, ...) as $type\n" if( $debug);
    $ltypes{$type} = $ptr;
};


#--------------------------------------------------
# print type info
#--------------------------------------------------
my $t_print = sub {
    my ($lev,$name,$ptr) = @_;
    print "t_print( $lev, $name, ...)\n" if( $debug);
    print "level=$lev name=$name\n";
};


#--------------------------------------------------
# deal with a leaf type
# lev is recursion level, name is the name,
#   ptr is pointer to hash of attributes
#--------------------------------------------------
sub handle {
    my ($lev,$name,$ptr,$func) = @_;
    my $pre = substr $spacey, 0, $lev*3;
    print "$pre" . "handle($lev,$name)\n" if($debug);
    if( $ptr->{"type"}) {	# it's a leaf
	my $type = $ptr->{"type"};
	$func->($lev,$name,$ptr);
	foreach my $k ( sort keys %{$ptr}) {
	    print "$pre  attr $k = $ptr->{$k}\n" if( $debug);
	}
    } else {			# recurse
	foreach my $k ( sort keys %{$ptr}) {
	    handle( $lev+1, $k, $ptr->{$k},$func);
	}
    }
}


for( my $i=0; $i<$na; $i++) {
    print "Loading YAML from $ARGV[$i]\n";
    my $type = ReadYaml( $ARGV[$i]);
    print "---- $ARGV[$i]:\n";
    my $k;
    print "\n";
    my %comb = ( %{$types}, %{$type});
    $types = \%comb;
}

if( $debug > 1) {
    print "---- YAML Merged:\n";
    foreach my $k ( keys %{$types}) { print " $k\n"; }
    print Dumper( $types);
}

exit;


# primitive types
my %primitives = ( "integer" =>  1, "logic" =>  1, "unsigned" =>  1, "signed" =>  1);
my %proto;


# pass 1, loop over types, check for (some) errors
# build "ltypes" hash of pointers to each leaf type
print "-------------------- Pass 1:\n" if( $debug);
foreach my $top ( keys %{$types}) {
    print "Processing $top\n" if($debug);
    next if( $top eq "__config__");
    my $ptr = $types->{$top};
    handle( 0, $top, $ptr, $t_store);
}

# pass 2, loop over types
# emit function declarations
print "-------------------- Pass 2:\n" if( $debug);
my $t_emit = sub {
    my ($lev,$name,$ptr) = @_;
    my $type = $ptr->{"type"};
    print "EMIT $name..." if( $debug);
    if( $ptr->{"qualifier"} || $proto{$name} || $primitives{$name}) {
	print "(skip)\n" if( $debug);
	return;
    } else {
	print "yes\n" if($debug);
    }
    $proto{$name} = "yes";
    print FP "  procedure READ( L:inout LINE; VALUE: out $name);\n";
    print FP "  procedure WRITE( L:inout LINE; VALUE: in $name);\n";
};
foreach my $top ( keys %{$types}) {
    print "Processing $top\n" if($debug);
    next if( $top eq "__config__");
    my $ptr = $types->{$top};
    handle( 0, $top, $ptr, $t_emit);
}

# pass 3, loop over types
# emit function bodies
print "-------------------- Pass 3:\n" if( $debug);
my %proto;
my $t_body = sub {
    my ($lev,$name,$ptr) = @_;
    my $type = $ptr->{"type"};
    print "EMIT $type..." if( $debug);
    if( $ptr->{"qualifier"} || $proto{$type} || $primitives{$type}) {
	print "(skip)\n" if( $debug);
	return;
    } else {
	print "yes\n" if($debug);

	print FP "\n";
	print FP "  procedure READ( L:inout LINE, VALUE: out $type) is\n";
	print FP "    variable v_data : $type\n";
	print FP "    variable v_index : integer\n" if( $ptr->{"length"});

	print FP "  begin\n";

	print FP "  end READ;\n";
    }



};
foreach my $top ( keys %{$types}) {
    print "Processing $top\n" if($debug);
    next if( $top eq "__config__");
    my $ptr = $types->{$top};
    handle( 0, $top, $ptr, $t_body);
}


