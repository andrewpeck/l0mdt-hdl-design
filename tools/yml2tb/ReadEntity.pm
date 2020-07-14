#!/usr/bin/perl
#------------------------------------------------------------
# this package provides:
#   CleanHDL to read a file into an array, stripping out
#     blank lines and comments
#   ReadEntity to read VHDL entity and parse generics, ports
# See functions below for details
#------------------------------------------------------------
package ReadEntity;

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(ReadEntity CleanHDL);

# variable to hold possible errors
$errors = '';

# variable to count user types found
$ntypes = 0;

# variable to count constants found
$nconstants = 0;

# variable indicating this is valid VHDL
$valid = 0;

# debug control
$debug = 0;

#------------------------------------------------------------
# CleanHDL( FH)
#
# read VHDL from a filehandle and strip blank lines and comments
# return a list of lines
#------------------------------------------------------------
sub CleanHDL {
    print "CleanHDL()\n" if($debug);

    my $fh = shift;
    my $stuff = [ ];		# empty array

    while( my $line = <$fh>) {
	chomp $line;
	print "CLEAN LINE: $line\n" if( $debug);

	# strip comments
	my $temp = $line;
	if( $line =~ /--/) {
	    print "  has comment\n" if( $debug);
	    ($temp) = $line =~ /^(.*)--/;
	}
	$line = $temp;
	print "  Comment strip: $line\n" if( $debug);

	# ignore blank lines
	if( $line !~ /^\s*$/) {
	    print "  (non-blank)\n" if( $debug);
	    push @$stuff, $line;
	} else {
	    print "  (blank)\n" if( $debug);
	}
    }

    return $stuff;
}




#------------------------------------------------------------
# ReadEntity( @lines)
#
# Read cleaned VHDL source, look for a single (or first)
# entity declaration.  Parse the generics and ports, and
# return a list of three hash references
#
# $generics->{"_name_"}->{"type"}    type
#                      ->{"init"}    optional initialization
#
# $ports->{"_name_"}->{"type"}       type
#                   ->{"dir"}        in, out, inout, buffer
#
#
# $namelist                          array ref ports in order
#
# the parser is pretty simple-minded and in particular would
# be confused by punctuation inside quoted strings.
#
# also the "entity ... is" and "end entity ...;" must be
# on lines by themselves
#------------------------------------------------------------
sub ReadEntity {
    my $stuff = shift;
    my $generics;
    my $ports;

    my $ename = 0;
    my $entity = "";
    my $generic_str;
    my $port_str;

    my $namelist = [];     # create empty port name list

    foreach my $line( @$stuff) {
	chomp $line;

	# look for end of entity, end loop if names match
	if( $line =~ /^\s*end\s+entity/) {
	    my ($name) = $line =~ /^\s*end\s+entity\s+(\w+)\s*;/;
	    print "-- end entity $name\n" if($debug);
	    die "Mismatched names ($name vs $ename)" if( $name ne $ename);
	    last;
	}

	# inside entity
	if( $ename) {
	    # strip comments
	    my $stmt = $line;
	    if( $line =~ /--/) {
		($stmt) = $line =~ /^(.*)--/;
	    }
	    # ignore blank lines
	    if( $stmt =~ /^\s*$/) {
		#	    print "-- blank line\n";
	    } else {
		$entity .= $stmt;	# append to string
	    }
	}

	# look for start of entity
	if( $line =~ /^\s*entity/) {
	    ($ename) = $line =~ /^\s*entity\s+(\w+)\s+is/;
	    print "-- start entity $ename\n" if($debug);
	}
    }

    print "Done reading entity $ename\n" if($debug);

    # collapse multiple spaces
    $entity =~ tr/ //s;

    # grab generics if any as one string
    if( $entity =~ /generic\s*\(/) {
	($generic_str) = $entity =~ /generic\s*\(([^)]+)\)\s*;/;
    }

    # grab ports if any as one string
    if( $entity =~ /port\s*\(/) {
	($port_str) = $entity =~ /port\s*\((.+)\)\s*;/;
    }

    # parse generics into a list
    # save in a hash
    my $generics;

    # print "Generics:\n$generic_str\n";
    # split by ";" with surrounding whitespace
    my @g_list = split /\s*;\s*/, $generic_str;
    foreach my $generic ( @g_list) {
	my $name;
	my $type;
	my $init = 0;
	if( $generic =~ /:=/) {
	    ($name,$type,$init) = $generic =~ /^\s*([^: ]+)\s*:\s*([^: ]+)\s*:=(.*)$/;
	} else {
	    ($name,$type) = $generic =~ /^\s*([^: ]+)\s*:\s*(.*)$/;
	}
	print "GENERIC name: $name type: $type init: $init\n" if($debug);
	$generics->{$name}->{"type"} = $type;
	$generics->{$name}->{"init"} = $init if( $init);
    }

    # print "Ports:\n$port_str\n";

    my $ports;

    # split ports by ";"
    my @p_list = split /\s*;\s*/, $port_str;
    foreach my $port ( @p_list) {
	print "Parsing port \"$port\"\n" if($debug);
	my ($name,$dir,$type) = $port =~ /^\s*([^: ]+)\s*:\s+(\w+)\s+(.*)$/;
	$type =~ s/ $//;
	print "PORT name: \"$name\" dir: \"$dir\" type: \"$type\"\n" if($debug);
	$ports->{$name}->{"dir"} = $dir;
	$ports->{$name}->{"type"} = $type;
	push @{$namelist}, $name;
    }

    return ( $generics, $ports, $namelist);

} # end sub


1;
