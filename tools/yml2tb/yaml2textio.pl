#!/usr/bin/perl
#
# Database created by yamldump and create overloaded
# textio functions to read/write all custom types
# 
# reviving this project 4/21 after fixing yamldump.pl so it works
# With Thiago's https://gitlab.com/tcpaiva/yml2hdl v0.2.1
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

my ($basename) = $dbfile =~ /^(.*)\.db$/;
my $pkg_name = $basename . "_textio";

print "Using package name $pkg_name\n";

print FP qq{
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

package $pkg_name is
};

# pass 1, loop over types
# emit function declarations
print "-------------------- Pass 1:\n" if( $debug);
foreach my $top ( keys %{$types}) {
    print "Processing $top..." if($debug);
    next if( $top eq "__config__");
    my $ptr = $types->{$top};
    my $class = $ptr->{'class'};
    print "\nDUMP:", Dumper($ptr) if($debug);

    # array class
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

    # record class
    } elsif( $class eq 'record') {
	print "RECORD (prototypes)\n" if($debug);
	my $hdl_type = $top . "_rt";
	$ptr->{'hdl_type'} = $hdl_type;
	print FP "-- RECORD type $top\n";
	print FP "  procedure READ( L:inout LINE; VALUE: out $top);\n";
	print FP "  procedure WRITE( L:inout LINE; VALUE: in $top);\n";

    # ignore constants or other things
    } else {
	$ptr->{'skip'} = "yes";
	print "(skipped)\n" if($debug);
    }
}

print FP qq{
end $pkg_name;

package body $pkg_name is
};

# pass 2 -- emit function definitions
print "-------------------- Pass 2:\n" if( $debug);
foreach my $top ( keys %{$types}) {
    print "Processing $top...\n" if($debug);
    next if( $top eq "__config__");
    my $ptr = $types->{$top};
    print "DUMPING:\n", Dumper($ptr), "/DUMPING\n";
    
    my $class = $ptr->{'class'};
    my $type = $ptr->{'type'};
    my $size = $ptr->{'length'};
    my $name = $top;
    print "name: $top  class: $class  type: $type  size: $size\n";

    next if( exists $ptr->{'skip'});

    print FP "\n";
    print FP "  procedure READ( L:inout LINE; VALUE: out $top) is\n";
    print FP "    variable v_data : $top;\n";
    print FP "    variable i : integer;\n" if( $class eq 'array');
    print FP "  begin\n";

    if( $class eq 'record') {	# handle record elements
	foreach my $memb ( @{$ptr->{'members'}}) {
	    my $name = $memb->{'name'};
	    my $type = $memb->{'type'};
	    my $size = $memb->{'length'};
	    print "  >>> $name $type($size)\n" if($debug);
	    if( $type eq "std_logic_vector") {
		print FP "    DREAD(L, v_data.$name);\n";
	    } else {
		print FP "    READ(L, v_data.$name);\n";
	    }
	}
    } elsif( $class eq 'array') { # handle an array
	print FP "    for i in 0 to $size" . "-1 loop\n";
	if( $type eq "std_logic_vector") {
	    print FP "      DREAD( v_LINE, $name" . "(i);\n";
	} else {
	    print FP "      READ( v_LINE, $name" . "(i);\n";
	}
	print FP "    end loop;\n";
    }

    print FP "  end READ;\n";

    print FP "\n";
    print FP "  procedure WRITE( L:inout LINE; VALUE: out $top) is\n";
    print FP "    variable v_data : $top;\n";
    print FP "    variable i : integer;\n" if( $class eq 'array');
    print FP "  begin\n";

    if( $class eq 'record') {
	foreach my $memb ( @{$ptr->{'members'}}) {
	    my $name = $memb->{'name'};
	    my $type = $memb->{'type'};
	    my $size = $memb->{'length'};
	    if( $type eq "std_logic_vector") {
		print FP "    DWRITE(L, v_data.$name);\n";
	    } else {
		print FP "    WRITE(L, v_data.$name);\n";
	    }
	    print FP "    WRITE(L,' ');\n";
	}
    } elsif( $class eq 'array') {
	print FP "    for i in 0 to $size" . "-1 loop\n";
	if( $type eq "std_logic_vector") {
	    print FP "      DWRITE( v_LINE, $name" . "(i);\n";
	} else {
	    print FP "      WRITE( v_LINE, $name" . "(i);\n";
	}
	print FP "      WRITE(L,' ');\n";
	print FP "    end loop;\n";
    }
    print FP "  end WRITE;\n";

}


print "-- done --\n";
print FP qq{
end $pkg_name;
};

