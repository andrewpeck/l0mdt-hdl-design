#!/usr/bin/perl
#------------------------------------------------------------
# this package provides:
#
# ReadYaml( filename) - read a YAML file to a hash ref
#
# IsMdtType( $typename) - check if string ends in "_rvt" etc
#
# ($basetype,$suffix) = TypeSplit( $typename)
#    split a type such as "heg_bm2sf_rvt" and return the base
#    "heg_bm2sf" and suffice "rvt".  Die on error for now
# 
# Restructure( $ref) - restructure "new" YAML data, merging list of
#    single-key hashes into a single hash
#
# See functions below for details
#------------------------------------------------------------
package ReadYaml;

use Data::Dumper;
use YAML::XS 'LoadFile';

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(ReadYaml TypeSplit IsMdtType Restructure CombineHashes);

# variable to hold possible errors
$errors = '';

my $debug = 0;

#------------------------------------------------------------
# ReadYaml( $filename)
# returns reference to a hash with the entire Yaml structure
#------------------------------------------------------------
sub ReadYaml {
    my $nar = scalar(@_);
    die "Missing filename in ReadYaml()" if( $nar < 1);
    my $yaml = LoadFile( $_[0]);
    return $yaml;
}

sub IsMdtType {
    my $nar = scalar(@_);
    die "Missing type string in ReadYaml:IsMdtType()" if( $nar < 1);
    my $type = $_[0];

    return ( $type =~ /\w+_(rt|vt|art|avt|rvt)/);
}

sub TypeSplit {
    my $nar = scalar(@_);
    die "Missing type string in ReadYaml:TypeSplit()" if( $nar < 1);
    my $type = $_[0];

    die "unknown type suffix in ReadYaml:TypeSplit($type)\n" if( !IsMdtType( $type));

    my ($base,$ext) = $type =~ /(\w+)_(rt|vt|art|avt|rvt)/;
    return ($base, $ext);
}

#
# process passed reference
# Expect top-level hash with two keys, "__config__" and "types"
#   'types' => [ { 'name' => sth } , { 'name => sth } ];
# Process each "sth" and replace lists of single-key hashes with one multi-key hash
#
sub Restructure {
    print "--- Restructure() ---\n" if($debug);
    my $nar = scalar(@_);
    die "Missing reference in ReadYaml:Restructure()" if( $nar < 1);
    my $r = $_[0];
    
    # -- check for big problems
    die "Not a hash reference in ReadYaml:Restructure()" if( ref($r) ne "HASH");
    if( not $r->{"types"}) {
	print "No types found in ReadYaml:Restructure()";
	return $r;
    }

    #-- better be types at the top, with a list of single-key hashes
    my $d = $r->{"types"};
    my @fixed;
    
   if( ref($d) ne "ARRAY") {
	my $s = ref($r);
	die "Not a list reference but $s in ReadYaml:Restructure()" if( ref($r) ne "ARRAY");    
    }
    # iterate over list of types, ensure single-key hashes
    foreach my $th ( @{$d}) {
	my $nk = scalar( keys %{$th});
	if( $nk != 1) {
	    print "Restructure:  Format error, multiple keys in:\n";
	    print Dumper( $th);
	    exit;
	}
	my $typnam = (keys %{$th})[0];
	my $sth = $th->{$typnam};
	die "Not an array reference for type $typnam in ReadYaml:Restructure()" if( ref($sth) ne "ARRAY");

	# now we have the body of the type as a reference, process it
	my $comb = CombineHashes( $sth);
	push @fixed, { $typnam => $comb };
    }

    # now we have the list @fixed which should be put back
    my $new_hash = { 'types' => \@fixed };

    # copy everything else without changes
    foreach my $k ( keys %{$r}) {
	if( $k ne 'types') {
	    $new_hash->{$k} = $r->{$k};
	}
    }

    return $new_hash;
}

# look for a list of single-key hashes
# convert to a single multi-key hash
sub CombineHashes {
    print "--- CombineHashes() ---\n" if($debug);
    my $nar = scalar(@_);
    die "Missing reference in ReadYaml:CombineHashes()" if( $nar < 1);
    my $r = $_[0];

    my $new_hash = { };		# replacement multi-key hash
    my $skip = 0;		# set true if not qualifying list

   if( ref( $r) eq "ARRAY") {
	print "Processing array\n" if($debug);
	# loop over list items
	foreach my $item ( @{$r}) {
	    # see if this is a reference to a single-key hash
	    if( ref( $item) eq "HASH") {
		if( scalar( keys %{$item}) == 1) {
		    my $key = (keys %{$item})[0];
		    my $val = $item->{$key};
		    # see if we should recurse
		    if( ref($val) eq "ARRAY") {
			my $down = CombineHashes( $val);
			$new_hash->{$key} = $down;
		    } else {
			$new_hash->{$key} = $val;
		    }
		    print "Setting $key => $val\n" if($debug);
		} else {
		    print "item has multiple keys\n" if($debug);
		    $skip++;
		}
	    } else {
		print "item is not a hash\n";
		$skip++;
	    }
	}
	print "---- returning new hash: ---\n" if($debug);
	print Dumper( $new_hash) if($debug);
	return $new_hash;
	print "---- /returning new hash: ---\n" if($debug);
    } else {
	print "(not an array\n" if($debug);
	return $r;
    }
}

1;
