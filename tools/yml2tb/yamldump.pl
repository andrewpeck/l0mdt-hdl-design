#!/usr/bin/perl
#------------------------------------------------------------------------
# Read a set of YAML files and build a simple database of types
#
# Top-level YAML contains two items:
#   1.  '__config__' or 'config'
#     this has some configuration stuff we can ignore for now
#   2.  'HDL_Types'
#     this has a list of all HDL types
#
#   Within item 2, expect to find only the following types:
#  
#   record with elements                       suffix "_rt"
#      signed/unsigned/std_logic scalar
#      signed/unsigned/std_logic vector
#      a custom type
#
#   top-level item
#      integer/real constant
#      array of custom type
#        either "array : open" or length : <something>"
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
	# quick sanity check
	if( scalar( keys %{$type}) != 2 or
	    !exists $type->{'__config__'} or
	    !exists $type->{'HDL_Types'}) {
	    print "WARNING: $ARGV[$i], missing __config__ or HDL_Types (skipped)\n";
	} else {
	    my $tlist = $type->{'HDL_Types'};
	    foreach my $ftyp ( @{$tlist}) {
		push @{$types}, $ftyp;
	    }
	    #	my %comb = ( %{$types}, %{$type});
	    #	$types = \%comb;
	}
    } elsif( $arg =~ m{\.db}) {
	$dbfile = $arg;
    } elsif( $arg =~ m{-d}) {
	$debug++;
    }
}

if( $debug ) {
    print "---- YAML Merged:\n";
    foreach my $th ( @{$types}) {
	my $nk = scalar( keys %{$th});
	if( $nk != 1) {
	    print "Format error, multiple keys in:\n";
	    print Dumper( $th);
	    exit;
	}
	my $typnam = (keys %{$th})[0];
	print "--- $typnam ---\n" if($debug);
	print Dumper( $th->{$typnam}) if($debug);
    }
}

print "---- parsing the structure\n" if($debug);

# iterate over top-level hash
foreach my $th ( @{$types}) {
    my $item = (keys %{$th})[0];

    my $hdl_type = $item;
    if( $item =~ /_$/) {
	print "<> Trailing underscore changed to 's' in $item\n" if($debug);
	chop $hdl_type;
	$hdl_type .= "s";
	print "   type now $hdl_type\n" if($debug);
    }

    my $thing = $th->{$item};
    my $reft = ref $thing;              # reference to either a hash (scalar) or array (record)
    print "$item: " if($debug>1);

    if( $reft eq "ARRAY") {	        # it's an array, must be a VHDL record
	print "Array\n" if($debug>1);
	$hdl_type .= "_rt";
	print "<> Type $item -> $hdl_type\n" if($debug);
	# start to build the DB entry
	$db->{$hdl_type}->{"class"} = "record";    # set the class to 'record'
	$db->{$hdl_type}->{"original_type"} = $item;  # remember type from YAML
	$db->{$hdl_type}->{"members"} = ( );       # create an empty list for members
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

	    my $mary = $member->{$mname};      # and reference to the underlying hash
	    # so now $mary is an array reference to a list of single-key hashes (ugh!)
	    # convert it to a single hash so we don't go crazy
	    my $mref = { };
	    foreach my $ae ( @{$mary}) {
#		print "--- ref: " . ref($ae) . "\n" if($debug);
		my $key = (keys %{$ae})[0];
		my $val = $ae->{$key};
#		print "--- key: $key val: $val\n" if($debug);;
		$mref->{$key} = $val;
	    }

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
		push @{$db->{$hdl_type}->{"members"}}, \%minfo;
		$db->{$hdl_type}->{"original_type"} = $item;  # remember type from YAML
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
		my $hdl_type = $item . "_constant";
		$db->{$hdl_type}->{"class"} = "constant";
		$db->{$hdl_type}->{"value"} = $value;
		$db->{$hdl_type}->{"type"} = $type;
		print "% $hdl_type is $type (constant, value=$value)\n" if($debug);
		$db->{$hdl_type}->{"original_type"} = $item;  # remember type from YAML
		
	    } elsif( exists $thing->{"array"} or exists $thing->{"length"}) {
		my $size;
		if( exists $thing->{"array"}) {
		    $size = $thing->{"array"};
		} else {
		    $size = $thing->{"length"};
		}
		print "% $hdl_type is array of $type size $size\n" if($debug);
		$db->{$hdl_type}->{"class"} = "array";
		$db->{$hdl_type}->{"type"} = $type;
		$db->{$hdl_type}->{"size"} = $size;
		$db->{$hdl_type}->{"original_type"} = $item;  # remember type from YAML
	    } else {
		print "ERROR: $hdl_type is $type but not array or constant\n";
		exit;
	    }
	} else {
	    $db->{$hdl_type}->{"class"} = "other";
	    $db->{$hdl_type}->{"original_type"} = $item;  # remember type from YAML
	    print "% $hdl_type is -no type-\n" if($debug);
	}

    } else {
	print "ERROR:  ref = $reft\n";
	exit;
    }
}

print "--- fixup ---\n" if($debug);

# now go through and fix up the suffixes if we can
foreach my $item ( keys %{$db}) {
    my $p = $db->{$item};
    printf "AAA  %-30s %-30s %-10s %s\n", $item, $p->{'original_type'}, 
	$p->{'class'}, $p->{'type'} if($debug);

    if( $p->{'class'} eq 'array') {
	my $type = $p->{'type'};
	print "   array of $type\n" if($debug);
	# look for this type
	if( !syntype( $type)) {
	    my $matches = 0;
	    print "   look it up\n" if($debug);
	    foreach my $ck ( keys %{$db}) {
		if( $db->{$ck}->{'original_type'} eq $type) {
		    my $pk = $db->{$ck};
		    my $pc = $pk->{'class'};
		    $matches++;
		    print "   found $type as: $pc with type=$item\n" if($debug);
		    print "   change our type to $ck\n" if($debug);
		    $p->{'type'} = $ck;
		    if( $pc eq 'record') {
			my $newtype = $item . "_at";
			$db->{$newtype} = $p;
			delete $db->{$item};
			print "   changed $item to $newtype\n" if($debug);
		    }
		}
	    }
	    if( $matches != 1) {
		print "OOPS!  duplicate matches for $type\n";
	    }
	}
    } elsif( $p->{'class'} eq 'record') {
	print "   record\n" if($debug);
	my $mbrs = $p->{'members'};
	foreach my $mem ( @{$mbrs}) {
	    my $mtype = $mem->{'type'};
	    my $mname = $mem->{'name'};
	    print "      member: $mname of $mtype\n" if($debug);
	    if( !syntype( $mtype)) {
		print "      lookup $mtype...\n" if($debug);
		my $matches = 0;
		print "   look it up\n" if($debug);
		foreach my $ck ( keys %{$db}) {
		    if( $db->{$ck}->{'original_type'} eq $mtype) {
			my $pk = $db->{$ck};
			my $pc = $pk->{'class'};
			$matches++;
			print "      found $mtype as: $pc with type=$ck\n" if($debug);
			print "      change member type to $ck\n" if($debug);
			$mem->{'type'} = $ck;
		    }
		}
		if( $matches != 1) {
		    print "OOPS!  duplicate matches for $mtype\n";
		}

	    }
	}
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
