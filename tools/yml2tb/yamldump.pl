#!/usr/bin/perl
#------------------------------------------------------------------------
# Read a set of YAML files and build a simple database of types
#
#   expect to find only the following types:
#  
#   record with elements, where each is:
#      signed/unsigned/std_logic scalar
#      signed/unsigned/std_logic vector
#      a custom type
#   top-level item
#      integer/real constant
#      array of custom type
#  
#   other (special, no type, ignored)
#
# Output: single hash reference stored in "storable" db file
#
# Hash keys are top-level names.
#   Each value is a reference to another hash
#   Lower-level key 'class' has values:
#      'constant' - numeric constant of type real or integer
#           'class' => 'constant'
#           'type' => typically 'integer' or 'real'
#           'value' => the value of the constant
#      'array'    - array of custom type defined elsewhere
#           'class' => 'array'
#           'length' => length or 'open'
#           'type' => type, for now it must be a record type
#      'record'   - record with members which may be of various types
#           'class' => 'record'
#           'members' => [ {first member}, {second member} ... ];
#              'name' => the name
#              'type' => synthesizable type, either
#                        built-in:  logic, unsigned, signed -or-
#                        custom:  defined elsewhere in db
#------------------------------------------------------------------------

use strict;
use lib '.';
use ReadYaml;
use Data::Dumper;
use Storable;

my $na = $#ARGV+1;
if( $na < 1) {
    print "usage: $0 types.yml...\n";
    exit;
}

my $debug = 0;		       # debug level

my $types = { };	       # merged YAML type hashes
my $db = { };		       # database of types
my $dbfile = 0;		       # database file name if specified

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
	my $k;
	my %comb = ( %{$types}, %{$type});
	$types = \%comb;
    } elsif( $arg =~ m{\.db}) {
	$dbfile = $arg;
    } elsif( $arg =~ m{-d}) {
	$debug++;
    }
}

if( $debug ) {
    print "---- YAML Merged:\n";
    foreach my $k ( keys %{$types}) { print " $k\n"; }
    print Dumper( $types) if($debug);
}

print "---- parsing the structure\n" if($debug);

# iterate over top-level hash
foreach my $item ( keys %{$types}) {
    my $thing = $types->{$item};        # hash key 'item' = top-level item name
    my $reft = ref $thing;              # reference to either a hash (scalar) or array (record)
    print "$item: " if($debug>1);
    if( $reft eq "ARRAY") {	        # it's an array, must be of VHDL records
	print "Array\n" if($debug>1);
	# start to build the DB entry
	$db->{$item}->{"class"} = "record";    # set the class to 'record'
	$db->{$item}->{"members"} = ( );       # create an empty list for members
	foreach my $member ( @{$thing}) {      # loop over members
	    # better be a hash reference with a single key
	    if( ref($member) ne "HASH") {
		print "ERROR: member of $item isn't hash but a " . ref($member) . "\n";
		exit;
	    }
	    if( scalar( keys %{$member}) != 1) {
		print "ERROR: number of keys in $item member should be 1\n";
		exit;
	    }

	    my $mname = (keys %{$member})[0];             # finally, get the name of the member
	    print "  $mname: " if( $debug>1);
	    my $mref = $member->{$mname};      # and reference to the underlying hash
	    my %minfo;

	    if( $mref->{"type"}) {	       # better have a type
		my $mtype = $mref->{"type"};
		$minfo{"name"} = $mname;
		if( exists $mref->{"length"}) {
		    my $len = $mref->{"length"};
		    $minfo{"size"} = $len;
		    $mtype = "std_logic_vector" if( $mtype eq "logic");
		    print "% $item.$mname is $mtype($len-1 downto 0)\n" if($debug);
		} else {
		    $mtype = "std_logic" if( $mtype eq "logic");
		    print "% $item.$mname is $mtype (scalar)\n" if($debug);
		    $minfo{"size"} = "scalar";
		}
		$minfo{"type"} = $mtype;
		if( $debug) {
		    print "Storing info for $mname...\n";
		    print Dumper( \%minfo);
		}
		push @{$db->{$item}->{"members"}}, \%minfo;
	    } else {
		print "ERROR: no type for member $mname of item $item\n";
		exit;
	    }
	}

    } elsif( $reft eq "HASH") {		       # it's a leaf (scalar or array)
	print "HASH\n" if( $debug>1);
	if( $thing->{"type"}) {
	    my $type = $thing->{"type"};
	    # it can be only an array or a constant

	    if( $thing->{"qualifier"} && $thing->{"qualifier"} eq "constant") {
		if( !exists $thing->{"value"}) {
		    print "ERROR: $item is a constant with no value\n";
		    exit;
		}
		my $value = $thing->{"value"};
		$db->{$item}->{"class"} = "constant";
		$db->{$item}->{"value"} = $value;
		$db->{$item}->{"type"} = $type;
		print "% $item is $type (constant, value=$value)\n" if($debug);
		
	    } elsif( exists $thing->{"array"}) {
		my $size = $thing->{"array"};
		print "% $item is array of $type size $size\n" if($debug);
		$db->{$item}->{"class"} = "array";
		$db->{$item}->{"type"} = $type;
		$db->{$item}->{"size"} = $size;
	    } else {
		print "ERROR: $item is $type but not array or constant\n";
		exit;
	    }
	} else {
	    $db->{$item}->{"class"} = "other";
	    print "% $item is -no type-\n" if($debug);
	}

    } else {
	print "ERROR:  ref = $reft\n";
	exit;
    }
}

if( $debug) {
    print "----- DB dump ----\n";
    print Dumper($db);
}

if( $dbfile) {
    print "Writing database to $dbfile\n";
    store( $db, $dbfile);
}
