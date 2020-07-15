#!/usr/bin/perl
# vector_format.pl
#
# read the types database and VHDL entity declaration
# print the required test vector format for each port
#

use strict;
use lib '.';
use Storable;
use ReadEntity;
use Data::Dumper;

my $debug = 0;

my $na = $#ARGV+1;
if( $na < 2) {
    print "usage: $0 types.db entity.vhd\n";
    exit;
}

my $dbfile = $ARGV[0];
my $vhdl = $ARGV[1];

open FP, "< $vhdl" or die "Opening VHDL file $vhdl: $!";

my $types = retrieve( $dbfile) or die "Reading database from $dbfile: $!";
my @lines = ReadEntity::CleanHDL( *FP);

my ($generics,$ports,$names) = ReadEntity::ReadEntity( @lines);

print "Read type database and VHDL\n" if($debug);

print Dumper($types) if($debug);

foreach my $name ( @{$names}) {
    my $type = $ports->{$name}->{"type"};
    my $dir = $ports->{$name}->{"dir"};
    printf "\n----- %-25s: $dir $type\n", $name;


    # separate into range and type if array
    my $btype = $type;
    my $range = "";
    if( $type =~ /\(/) {
	print "Range in \"$type\"\n" if($debug);
	($btype, $range) = $type =~ /^([^(]+)\(([^)]+)\)/;
	$btype =~ s/^\s+|\s+$//;
	print "base = \"$btype\"  range = \"$range\"\n" if($debug);
    }
    
    if( $btype =~ /([arv]+t)$/) {
	my ($base,$suffix) = $btype =~ /^(\w+)_([arv]+t)$/;
	print "base = \"$base\"  suffix = \"$suffix\"\n" if($debug);
	print "  array_index integer\n" if( $range ne "");
	if( !exists $types->{$base}) {
	    print "  UNKNOWN port $name with type $type\n";
	} else {
	    print "  orn integer\n";
	    print "  bcn integer\n";
	    print "  tick integer\n";
	    system( "./yamlquery.pl types.db $base");
	}
    } else {
	print "  UNKNOWN port $name with type $type\n";
    }
}

