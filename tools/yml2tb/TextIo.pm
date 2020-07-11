#!/usr/bin/perl
#
# this package provides VHDL templates for the automatically generated
# textio library for custom L0MDT types
#
package TextIo;

$Header = qq{
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_constants_pkg.all;
use l0mdt_lib.mdttp_types_pkg.all;

package mdttp_textio is
};

