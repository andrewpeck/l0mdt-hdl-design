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
#   top-level item (type 1)
#      integer/real constant with "type", "qualifier", "value"
#      array of custom type
#        either "array : open" or length : <something>"
#      (array of hashes with one scalar item each)
#
#   record with elements (type 2)
#      signed/unsigned/std_logic scalar  with "type"
#      signed/unsigned/std_logic vector  with "type" and "length"
#      a custom type
#      (array of hashes with one arrayref item each)
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

my $types = [ ];	       # merged YAML type list

my $db = { };		       # database of types
my $dbfile = 0;		       # database file name if specified


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
#
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
	print "--- $typnam ---\n" if($debug>1);
	print Dumper( $th->{$typnam}) if($debug>1);
    }
}

print "---- parsing the structure\n" if($debug);

# iterate over top-level hash
foreach my $th ( @{$types}) {
    my $item = (keys %{$th})[0];
    my $thing = $th->{$item};
    my $reft = ref $thing;
    print "Item: $item\n" if($debug);
    die "$item is not an array" if( $reft ne "ARRAY");

    # figure out if this is a top-level item or a record type
    # each hash item is a scalar for simple types or array for record
    # (they should all be the same)
    my %htypes;
    foreach my $element ( @{$thing}) {
	die "Element of $item is not a hash" if( (ref $element) ne "HASH");
	my @keys = ( keys %{$element});
	die "Element of $item is a multi-element hash" if( $#keys);
	my $key = (%{$element})[0];
	my $val = $element->{$key};
	my $vref = ref $val;
	$vref = "SCALAR" if( $vref eq "");
	$htypes{$vref}++;	# histogram the types
	print " '$key' -> $vref\n" if($debug);
    }
    die "Mixed types as hash values in $item (badly-structured YAML)" if(scalar( keys %htypes) != 1);
    my $is_record = (keys %htypes)[0] eq "ARRAY";

    print "$item is ", $is_record ? "(record)\n" : "(simple type)\n";

#	$db->{$item}->{"class"} = "constant";    # set the class to 'constant'
    
    if( $debug>1) {
    print "---DUMP ($item)---\n";
    print Dumper( $thing);
    print "---/DUMP---\n";
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
