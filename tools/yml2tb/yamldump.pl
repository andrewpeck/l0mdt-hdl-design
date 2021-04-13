#!/usr/bin/perl
#------------------------------------------------------------------------
# Read a set of YAML files and build a simple database of types
#
# Top-level YAML contains two items:
#   1.  'config'
#     this has some configuration stuff we can ignore for now
#   2.  'types'
#     this has a list of all HDL types
#
#   Within item 2, expect to find only the following types:
#  
#   simple type (1)
#      integer/real constant with "type", "qualifier", "value"
#      (array of hashes with one scalar item each)
#
#   record with elements (type 2)
#      signed/unsigned/std_logic scalar  with "type"
#      signed/unsigned/std_logic vector  with "type" and "length"
#      a custom type
#      (array of hashes with one arrayref item each)
#
#   array (type 3)
#      array of custom type
#        either "array : open" or length : <something>"
#      any previously defined type with "array" defining the size or "open"
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
#
# Mods:
# hazen, 2021-04-13:
#   Updated so it works with Thiago's https://gitlab.com/tcpaiva/yml2hdl v0.2.1
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

my $types = [ ];	       # merged YAML type list

my $db = { };		       # database of types
my $dbfile = 0;		       # database file name if specified


use constant {
    T_OTHER => "other/unknown",
    T_CONSTANT => "constant",
    T_RECORD => "record",
    T_ARRAY => "array",
};


#
# check for synthesizable type
#
sub syntype {
    my ($type) = @_;
    return( $type eq 'logic' || $type eq 'signed' || $type eq 'unsigned' ||
	    $type =~ 'std_logic');
}


# loop over arguments
#   name.yml is a YAML (input) file
#   name.db  is a database (output) file
#   -d      increase debug level
# merge types from multiple YAM files into a single list

for( my $i=0; $i<$na; $i++) {
    my $arg = $ARGV[$i];
    if( $arg =~ m{\.yml}) {
	print "Loading YAML from $ARGV[$i]\n";
	my $type = ReadYaml( $ARGV[$i]);

	# we are expecting two top-level entries, one containing 'config'
	# and the other containing 'type'
	my $nkeys = scalar( keys %{$type});
	die "Expecting 1 or 2 top-level entries in YAMl, saw $nkeys\n"
	    if( $nkeys < 1 || $nkeys > 2);
	foreach my $key ( keys %{$type}) {
	    if( $key =~ /config/) {
		print "Found config (skipping)\n";
	    } elsif( $key =~ /type/) {
		print "Found type (merging)\n";
		my $tlist = $type->{$key};
		foreach my $ftyp ( @{$tlist}) {
		    push @{$types}, $ftyp;
		}
	    } else {
		die "Unknown top-level item: $key\n";
	    }

	}

    } elsif( $arg =~ m{\.db}) {
	$dbfile = $arg;
    } elsif( $arg =~ m{-d}) {
	$debug++;
    }
}

#
# dump the merged list of types
#
if( $debug>1 ) {
    print "---- YAML Merged:\n";
    foreach my $th ( @{$types}) {
	my $nk = scalar( keys %{$th});
	if( $nk != 1) {
	    print "Format error, multiple keys in:\n";
	    print Dumper( $th);
	    exit;
	}
	my $typnam = (keys %{$th})[0];
	print "--- $typnam ---\n";
	print Dumper( $th->{$typnam});
    }
}

print "---- parsing the structure\n" if($debug);

# iterate over top-level hash
# determine the class of each (constant, array, record)
# each item is a reference to an array of hashes
foreach my $th ( @{$types}) {
    my $item = (keys %{$th})[0];
    my $thing = $th->{$item};
    my $reft = ref $thing;
    print "Item: $item\n" if($debug);
    die "$item is not an array reference" if( $reft ne "ARRAY");
    # figure out if this is a top-level item or a record type
    # each hash item is a scalar for constants or arrays,
    # or array for record type
    # (they should all be the same)
    my %htypes;			# "histogram" of types
    my %hash;			# simple (flattened) has for array of hashes
    my @hkeys;			# list of hash keys in order
    foreach my $element ( @{$thing}) {
	die "Element of $item is not a hash" if( (ref $element) ne "HASH");
	my @keys = ( keys %{$element}); # should only be one element in hash
	die "Element of $item is a multi-element hash" if( $#keys);
	my $key = (%{$element})[0]; # get the (singular) key
	my $val = $element->{$key}; # get the value
	$hash{$key} = $val;	# store in regular hash for convenience
	push @hkeys, $key;	# save key in list in order
	my $vref = ref $val;
	$vref = "SCALAR" if( $vref eq ""); # blank ref means scalar
	$htypes{$vref}++;	# histogram the types
	print " '$key' -> $vref\n" if($debug);
	print "--> DUMP: {$key}\n", Dumper( $val) if( $debug > 1);
    }
    # fail if the hash items don't all have the same type
    die "Mixed types as hash values in $item (badly-structured YAML)" if(scalar( keys %htypes) != 1);

    $db->{$item}->{"class"} = T_OTHER;

    # fill the database for each type
    if( $hash{"array"}) {	# if there is an "array" key, it's an array, duh
	print "Adding $item to db as \"array\"\n" if( $debug);
	$db->{$item}->{"class"} = T_ARRAY;
	die "Array type missing type" if( !$hash{"type"});
	$db->{$item}->{"type"} = $hash{"type"};
	if( $hash{"length"}) {
	    $db->{$item}->{"length"} = $hash{"length"};
	} else {
	    $db->{$item}->{"length"} = $hash{"array"};
	}
	
    # it's a record
    } elsif( (keys %htypes)[0] eq "ARRAY") {
	print "Adding $item to db as \"record\"\n" if( $debug);
	$db->{$item}->{"class"} = T_RECORD;
	$db->{$item}->{"members"} = [ ];
	foreach my $mkey ( @hkeys ) {
	    my %memb;
	    $memb{"name"} = $mkey;
	    # combine the list of single-key hashes for convenience
	    my $newhash = CombineHashes( $hash{$mkey});
	    die "In type $item, member $mkey doesn't have a \"type\""
		if( !$newhash->{"type"});
	    if( $newhash->{"length"}) {
		$memb{"type"} = $newhash->{"type"};
		$memb{"length"} = $newhash->{"length"};
	    } else {
		$memb{"type"} = $newhash->{"type"};
	    }
	    push @{$db->{$item}->{"members"}}, \%memb;
	}
	
    # it's a constant
    } else {	
	print "Adding $item to db as \"constant\"\n" if( $debug);
	$db->{$item}->{"class"} = T_CONSTANT;
	die "Constant $item missing type or value" if( !$hash{"type"} || !$hash{"value"});
	$db->{$item}->{"type"} = $hash{"type"};
	$db->{$item}->{"value"} = $hash{"value"}
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
