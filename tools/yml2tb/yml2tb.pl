#!/usr/bin/perl
#
# Read YAML type specs from a list of YML files, and a VHDL entity declaration
# Generate a generic testbench
#
use strict;
use lib '.';
use ReadTypes;
use ReadYaml;
use Data::Dumper;
use TestBench;

my $na = $#ARGV+1;
if( $na < 3) {
    print "usage: $0 entity.vhd output_tb.vhd types.yml...\n";
    exit;
}

my $yes = 1;			# silently overwrite output
my $debug = 0;

my $f_uut = $ARGV[0];
my $f_output = $ARGV[1];

my $types = { };			# merged YAML type hashes

for( my $i=2; $i<$na; $i++) {
    print "Loading YAML from $ARGV[$i]\n";
    my $type = ReadYaml( $ARGV[$i]);
    print "---- $ARGV[$i]:\n";
    my $k;
    if( $debug > 1) { foreach my $k ( keys %{$types}) { print " $k\n"; }}
    print "\n";
    my %comb = ( %{$types}, %{$type});
    $types = \%comb;
}

if( $debug > 1) {
    print "---- YAML Merged:\n";
#    foreach my $k ( keys %{$types}) { print " $k\n"; }
    print Dumper( $types);
}

# get entity names for the UUT and testbench
my $uut = 0;
my $tbe = 0;

if( $f_output !~ /\.vhd[l]?$/) {
    print "Output should be a .vhd or .vhdl file\n";
    exit;
} else {
    ($tbe) = $f_output =~ /(\w+)\.vhd[l]?$/;
    print "Test bench entity name: $tbe\n";
}


if( $f_uut !~ /\.vhd[l]?$/) {
    print "Input should be a .vhd or .vhdl file\n";
    exit;
} else {
    ($uut) = $f_uut =~ /(\w+)\.vhd[l]?$/;
    print "UUT entity name: $uut\n";
}

# check for over-write
if ( -e $f_output && !$yes) {
    print qq{File $f_output exists.  I'm about to over-write it
with the generated testbench.  Is this OK (y/n)?};
    my $yesno = <STDIN>;
    die "Aborted" if( $yesno !~ /^[yY]/);
}


open VHU, "< $f_uut" or die "Opening UUT $f_uut: $!";
print "Reading $f_uut\n";
open VHO, "> $f_output" or die "Opening output $f_output: $!";
print "Writing $f_output\n";

#------------------------------------------------------------------------
# Read the UUT to get ports and generics from the entity declaration
#------------------------------------------------------------------------

my $generics;
my $ports;
my $namelist;
($generics, $ports, $namelist) = ReadEntity( \*VHU);

#--- dump results
if( $debug > 1) {
    print "-----> Entity:\n";
    print Dumper($generics) if( $generics);
    print Dumper($ports) if( $ports);
}

print "----- port summary -----\n" if( $debug);
foreach my $portkey ( keys %{$ports}) {
    print "\nPORT: $portkey\n" if( $debug);
    my $port = $ports->{$portkey};
    print Dumper( $port) if( $debug);

}

##-#-----------------------------------------------------------------
##-# loop over the ports and build signal lists, clock options, etc
##-#-----------------------------------------------------------------
##-print "Missing ctrl port" if( !$ports->{"ctrl"});
##-print "Missing TTC port" if( !$ports->{"ttc"});
##-
foreach my $portkey ( keys %{$ports}) { # loop over ports
    print "\nPORT: $portkey\n" if( $debug > 1);
    my $port = $ports->{$portkey};
    # ignore ctrl and ttc ports on this pass

    my $type = $port->{"type"};
    print "Checking TYPE $type\n" if( $debug);

    my $base_type = $type;
    my $range;

    # check for VHDL types we can handle directly
    if( $type =~ /signed/ || $type =~ /integer/ || $type =~ /std_logic/) {
	print "  VHDL type\n" if( $debug);

        # check for MDT type	    
    } else {
	# is an array?

	# check for array on the port
	if( $ports->{$portkey}->{"range"}) {
	    $base_type = $ports->{$portkey}->{"base_type"};
	    $range = $ports->{$portkey}->{"range"};
	    print "  ARRAY ($range) of \"$base_type\"\n" if( $debug);
	    $type = $base_type;
	}

	my ($base, $ext);

	print "  Proceed with $type\n";

	if( IsMdtType( $type)) {
	    print "  Checking $type\n";
	    ($base,$ext) = TypeSplit( $type);
	    print "  MDT type base=\"$base\" ext=$ext\n";
	}

	if( $types->{$base}) {
	    #----- legit MDT type port -----
	    print "  Found MDT type $type\n" if( $debug);
	    # check direction, set testbench boolean
	    my $dir = $port->{"dir"};
	    if( $dir eq "in") {
		$port->{"TB"} = "READER";
	    } elsif( $dir eq "out") {
		$port->{"TB"} = "WRITER";
	    } else {
		die "Unknown direction $dir on port $portkey\n";
	    }
	    #----- fill in default info
	    $port->{"SIGNALS"} = "default";
	    $port->{"DV"} = "dv";
	    $port->{"TIME"} = "orn,bcn";

	} else {
	    print "  WARNING:  I don't know what to do with a $type port, so skipping it\n";
	}

    }
}


print "----- port summary -----\n" if( $debug);
foreach my $portkey ( keys %{$ports}) {
    print "\nPORT: $portkey\n" if( $debug);
    my $port = $ports->{$portkey};
    print Dumper( $port) if( $debug);
}


#------------------------------------------------------------
# start generating the testbench
#------------------------------------------------------------
my $date = `date`;
chomp $date;
my $f_files;
for( my $i=0; $i<$na; $i++) {
    $f_files .= " " . $ARGV[$i];
}
print VHO qq{----------------------------------------------------------------------
-- Automatically generated $date from:
-- $f_files
-- Testbench entity: $tbe   UUT: $uut
----------------------------------------------------------------------
};

print VHO $TestBench::Libs;	# libraries

# entity start
print VHO qq{
entity $tbe is
end entity $tbe;

architecture arch of $tbe is
};

print VHO $TestBench::Header;

# signals for arch header
my $sigs = "";

# we have to make multiple passes through the ports.  First one, we collect
# signal names which must go in the arch header.  Second one, we
# generate the processes

#------------------------------------------------------------
# Pass 1
#------------------------------------------------------------
foreach my $portkey ( keys %{$ports}) {
    my $port = $ports->{$portkey};
    my $type = $port->{"type"};
    if( $port->{"TB"}) {
	my $tb = $port->{"TB"};
	print "Custom signal list not yet implemented\n"
	    if( $port->{"SIGNALS"} && $port->{"SIGNALS"} ne "default");
	#--- variables, for this process alone ---
	$port->{"vars"} = "    variable v_$portkey : $type;\n";
	#--- signals, for arch header ---
	if( $tb eq "READER") {
	    print "Generating TB reader for $portkey\n";
	    $sigs .= "  signal p_$portkey : $type;\n";
	    $sigs .= "  signal s_$portkey : $type;\n";
	    $sigs .= "  signal $portkey" . "_dav : std_logic := '0';\n";
	} elsif( $tb eq "WRITER") {
	    print "Generating TB writer for $portkey\n";
	    $sigs .= qq"  signal p_$portkey : $type;\n";
	}

    }
}

print VHO $sigs;

print VHO qq{
begin   -- architecture arch
  clock_1 : entity work.clock
    generic map (
      freq => freq)
    port map (
      ctrl => p_ctrl,
      ttc  => p_ttc);
};

# now we map the UUT
print VHO qq{

  uut : entity work.$uut
  generic map( clk_per_bx => 8)
  port map (};
# loop over ports in entity and connect them

for my $name ( @{$namelist}) {
    print VHO "\n    $name => p_$name";
    print VHO "," if( $name ne @{$namelist}[$#$namelist]);
}
print VHO "\n);\n";

# generate the process for orbit/bunch count
print VHO $TestBench::ClockProcess;

#------------------------------------------------------------
# Pass 2
#------------------------------------------------------------
foreach my $portkey ( keys %{$ports}) {
    my $port = $ports->{$portkey};
    my $type = $port->{"type"};
    if( $port->{"TB"}) {
	my $tb = $port->{"TB"};
	my $dv = $port->{"DV"};
	if( $tb eq "READER") {
	    print VHO "--------------- BEGIN $portkey (READER) ---------------\n";

	    foreach my $sig ( @{$types->{$type}->{"NAMELIST"}}) {
		print "WIRE: $sig\n" if( $debug);
		if( $sig eq $dv) {
		    print VHO "  p_$portkey.$dv <= $portkey" . "_dav;\n";
		} else {
		    print VHO "  p_$portkey.$sig <= s_$portkey.$sig;\n";
		}
	    }

	    # open the file and start the process
	    printf VHO $TestBench::ReaderProcessFormat, 
	               $portkey, $portkey, $type, $portkey, 
	    $portkey, $portkey, $portkey, $portkey, $portkey;

	    print VHO "--------------- END $portkey (READER) ---------------\n";
	} else {
	    print VHO "--------------- BEGIN $portkey (WRITER) ---------------\n";

	    printf VHO $TestBench::WriterProcessFormat,
	    $portkey, $portkey, $type, $portkey, $portkey, $dv, $portkey, $portkey, $portkey;
	    
	    print VHO "--------------- END $portkey (WRITER) ---------------\n";
	}
    }
}




print VHO "end architecture arch;\n";
