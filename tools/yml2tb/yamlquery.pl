#!/usr/bin/perl
#------------------------------------------------------------------------
# read DB, look up a type and provide the test vector format
#
#------------------------------------------------------------------------
use strict;
use lib '.';
use Data::Dumper;
use Storable;

my $debug = 0;
my $dbfile = 0;			# database file name
my @names;			# list of name(s) to look up

die "usage: $0 <data_file> <name>" if( $#ARGV < 1);
foreach my $arg ( @ARGV ) {
    if( $arg =~ m{\.db}) {
	$dbfile = $arg
    } elsif( $arg =~ m/-d\d/) {
	($debug) = $arg =~ m/-d(\d)/;
    } else {
	push @names, $arg;
    }
}

my $db = retrieve( $ARGV[0]);
print Dumper($db) if($debug);

# see if a type is a synthesizable type
sub is_base_type {
    my ($type) = @_;
    return( $type eq "logic" || $type eq "unsigned" || $type eq "signed" ||
	$type eq "std_logic" || $type eq "std_logic_vector" );
}

# look up database name recursively and make a list of results
#
# lookup( name, list)
#    name = type name to lookup
#    list = reference to list to add flattened names to as
#           the tree of types is traversed
#
# return 1 if found, 0 if not

my $level = 0;
sub lookup {
    $level++;
    my $pfx = substr "                    ", 0, $level*3;
    my ($name,$list) = @_;
    if( exists $db->{$name}) {
	my $item = $db->{$name};
	my $class = $item->{"class"};
	print $pfx,"$name is $class " if($debug);

	if( $class eq "array") {

	    my $type = $item->{"type"};
	    my $len = $item->{"size"};
	    print "$len of $type\n" if($debug);
	    push @{$list}, "index integer";
	    lookup( $type,$list);

	} elsif( $class eq "record") {

	    print "\n" if($debug);
	    foreach my $member ( @{$item->{'members'}} ) {
		my $mname = $member->{'name'};
		my $mtype = $member->{'type'};
		my $msize = $member->{'size'};
		if( !is_base_type( $mtype)) {
		    lookup( $mtype,$list);
		} else {
		    print $pfx,"  $mname is $mtype " if($debug);
		    print is_base_type($mtype) ? "*\n" : "\n" if($debug);
		    if( $msize eq "scalar") {
			push @{$list}, "$mname $mtype";
		    } else {
			push @{$list}, "$mname $mtype($msize-1 downto 0)";
		    }
		}
	    }

	} elsif( $class eq "constant") {

	    my $type = $item->{"type"};
	    my $valu = $item->{"value"};
	    push @{$list}, "$name constant $type=$valu";
	    print $pfx,"  constant of $type\n" if($debug);

	} else {
	    print $pfx,"UNKNOWN!\n" if($debug);
	}
    } else {
	print $pfx,"$name not found\n" if($debug);;
	return 0;
    }
    $level--;
    return 1;
}

foreach my $name ( @names ) {
    my $list = [ ];
    if( lookup( $name,$list)) {
	foreach my $item ( @{$list}) {
	    print "  $item\n";
	}
    } else {
	print "not found\n";
    }
}

