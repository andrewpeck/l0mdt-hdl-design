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

while( my $line = <>) {

    $line = $reuse if( $reuse);

    chomp $line;
    $line =~ s/\r[\n]*//gm;	# kill DOS line endings

    if( $reuse) {
	print "REUSE: '$line'\n" if($debug);
	$reuse = 0;
    } else {
	print " LINE: '$line'\n" if($debug);
    }

    # skip comment lines
    if( $line =~ /^\s*#/) {
	print "COMMENT: $line\n" if($debug);
	print "$line\n";
	next;
    }

    # group start is unambiguous
    if( $line =~ m{^\w+:$} && $line !~ m{__config__} ) {
	print "$line\n";	
	print "(start)\n" if($debug);
	$in_group = 1;
    } else {
	print "Not start\n" if($debug);
	if( $line =~ /^\s*\w+\s*:\s*{/) { # looks like a group member
	    print "Is Group\n" if($debug);
	    if( $in_group == 1) {	  # first member
		print "first: $line\n" if($debug);
		($prefix,$rest) = $line =~ /^(\s*)(\w.*)$/;
		print "  prefix: '$prefix'  rest: '$rest'\n" if($debug);
		print $prefix . "- $rest\n";
		$in_group++;
	    } elsif( $in_group) { # subsequent members
		print "member: $line\n" if($debug);
		my ($pfx,$rst) = $line =~ /^(\s*)(\w.*)$/;
		if( $pfx eq $prefix) {
		    print $prefix . "- $rst\n";
		} else {
		    print("Prefix changed from '$prefix' to '$pfx'...\n") if($debug);
		    # prefix changed, so bail out
		    my $reuse = $line;
		    next;
		}
	    } else {
		print "Other group\n" if($debug);
		print "$line\n";
	    }
	} elsif( $line =~ /^\s*$/) { # blank line
	    print "blank:\n" if($debug);
	    print "\n";	    
	    $in_group = 0;
	} else {
	    print "other: $line\n" if($debug);
	    print "$line\n";	    
	}
    }
}
