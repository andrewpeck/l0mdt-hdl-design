#!/usr/bin/perl
#
# Read YAML type specs from a list of YML files, and a VHDL entity declaration
# Generate textio function overrides
#
# -- this is obsolete, use yaml2textio instead
#
use strict;
use lib '.';
use Storable;
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

# pass 1, loop over types
# emit function declarations
print "-------------------- Pass 1:\n" if( $debug);
foreach my $top ( keys %{$types}) {
    print "Processing $top..." if($debug);
    next if( $top eq "__config__");
    my $ptr = $types->{$top};
    my $class = $ptr->{'class'};
    if( $class eq 'array') {
	print "ARRAY (prototypes)\n" if($debug);
	print FP "-- ARRAY type $top\n";
	print FP "  procedure READ( L:inout LINE; VALUE: out $top);\n";
	print FP "  procedure WRITE( L:inout LINE; VALUE: in $top);\n";
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

# pass 2 -- emit function definitions
print "-------------------- Pass 2:\n" if( $debug);
foreach my $top ( keys %{$types}) {
    print "Processing $top...\n" if($debug);
    next if( $top eq "__config__");
    my $ptr = $types->{$top};
    my $class = $ptr->{'class'};
    next if( exists $ptr->{'skip'});

    print FP "\n";
    print FP "  procedure READ( L:inout LINE, VALUE: out $top) is\n";
    print FP "    variable v_data : $top\n";
    print FP "    variable v_index : integer\n" if( $class eq 'array');
    print FP "  begin\n";

    print FP 

}


## my %proto;
## my $t_body = sub {
##     my ($lev,$name,$ptr) = @_;
##     my $type = $ptr->{"type"};
##     print "EMIT $type..." if( $debug);
##     if( $ptr->{"qualifier"} || $proto{$type} || $primitives{$type}) {
## 	print "(skip)\n" if( $debug);
## 	return;
##     } else {
## 	print "yes\n" if($debug);
## 
## 	print FP "\n";
## 	print FP "  procedure READ( L:inout LINE, VALUE: out $type) is\n";
## 	print FP "    variable v_data : $type\n";
## 	print FP "    variable v_index : integer\n" if( $ptr->{"length"});
## 
## 	print FP "  begin\n";
## 
## 	print FP "  end READ;\n";
##     }
