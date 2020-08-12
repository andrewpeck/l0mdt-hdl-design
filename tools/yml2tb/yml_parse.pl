#!/usr/bin/perl

use strict;
use lib '.';
use ReadYaml;
use Data::Dumper;


my $na = $#ARGV+1;
if( $na < 1) {
    print "usage: $0 types.yml...\n";
    exit;
}

# loop over arguments
#   name.yml is a YAML (input) file
#   name.db  is a database (output) file
#   -d      increase debug level
#
for( my $i=0; $i<$na; $i++) {
    my $arg = $ARGV[$i];
    if( $arg =~ m{\.yml}) {
	print "Loading YAML from $ARGV[$i]\n";
	my $type = ReadYaml( $ARGV[$i]);
	print "--- Original ---\n";
	print Dumper( $type);
	print "--- Fixed ---\n";
	my $new_type = Restructure( $type);
	print Dumper( $new_type);
    }
}
