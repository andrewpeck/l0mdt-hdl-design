#!/usr/bin/perl
#
# add top-level "HDL_types:" tag to YAML and indent and hyphenate
# the former top-level tags
#
# <><>FIXME<><> not done!
#
use strict;

my $in_group = 0;

my $prefix;
my $rest;

my $reuse = 0;

my $debug = 0;

my @group;

#
# print a top-level group with one blank line before
#
sub dump_group {
    my ($gp) = @_;
    # see if we have a pending group to take care of
    my $ng = scalar( @{$gp});
    if( $ng) {
	print "\n";
	if( $gp->[0] =~ /config/) { # config group
	    # print the group
	    foreach my $str ( @group ) {
		print "$str\n";
	    }
	    # now header
	    print "HDL_Types:\n";
	} else {		# type group, indent with hyphen
	    print "  - " . $gp->[0] . "\n";
	    if( $ng > 1) {
		for( my $i=1; $i<$ng; $i++) {
		    print "    " . $gp->[$i] . "\n";
		}
	    }
	}
    }
}


while( my $line = <>) {

    $line = $reuse if( $reuse);
    chomp $line;
    $line =~ s/\r[\n]*//gm;	# kill DOS line endings

    # print and skip comment and blank lines
    if( $line =~ /^\s*#/ or $line =~ /^\s*$/) {
	print "$line\n";
	next;
    }

    # group start is unambiguous, word character in column 1
    # group just continues until next group start or EOF,
    # or is contained on a single line
    # collect the group in an array

    if( $line =~ m{^\w+\s*:}) {

	if( $#group >= 0) {
	    dump_group( \@group);
	    @group = ( );
	}

	push @group, $line;
	print "START:  $line\n" if($debug);
	my ($group) = $line =~ /^(\w+)\s*:/;
	my $body = "";
	if( $line =~ /{/) {
	    ($body) = $line =~ /(\{[^}]+})/;
	}
    } else {
	print "CONT:   $line\n" if($debug);
	push @group, $line;
    }
}

if( $#group >= 0) {
    dump_group( \@group);
}
