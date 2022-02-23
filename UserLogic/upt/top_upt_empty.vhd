-- ==============================================================
-- Joakim Olsson, UC Irvine
-- joakim.olsson@cern.ch
-- created: 2020-04-12
-- last update: 2021-03-24
-- ===========================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

entity top_upt is
    generic (
        flavour : integer := 0; -- barrel
        sector  : integer := 3
    );
    port (
        clk : in std_logic;
        i_rst : in std_logic;
        i_slc: in pl2ptcalc_vt;
        i_segment_i : in sf2ptcalc_vt;
        i_segment_m : in sf2ptcalc_vt;
        i_segment_o : in sf2ptcalc_vt;
        o_mtc : out ptcalc2mtc_vt -- TODO [check with Kostas/Davide/etc.] change name to pt2mtc_vt in data format?
    );
end top_upt;

architecture beh_empty of top_upt is

begin
 
end beh_empty;
