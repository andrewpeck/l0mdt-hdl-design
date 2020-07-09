#!/usr/bin/perl

use strict;
use Data::Dumper;
use Storable;

my $na = $#ARGV+1;
if( $na < 1) {
    print "usage: $0 types.yml...\n";
    exit;
}

my $db = retrieve( $ARGV[0]);

print Dumper( $db);
