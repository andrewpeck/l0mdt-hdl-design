#!/usr/bin/perl
#------------------------------------------------------------
# this package provides:
# ReadYaml( filename) - read a YAML file to a hash ref
# IsMdtType( $typename) - check if string ends in "_rvt" etc
# ($basetype,$suffix) = TypeSplit( $typename)
#    split a type such as "heg_bm2sf_rvt" and return the base
#    "heg_bm2sf" and suffice "rvt".  Die on error for now
# 
# See functions below for details
#------------------------------------------------------------
package ReadYaml;

use Data::Dumper;
use YAML::XS 'LoadFile';

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(ReadYaml TypeSplit IsMdtType);

# variable to hold possible errors
$errors = '';

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

1;
