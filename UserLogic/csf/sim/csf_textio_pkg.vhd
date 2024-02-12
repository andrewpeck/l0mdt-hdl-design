--------------------------------------------------------------------------------
-- Prototype of functions to convert values to/from text for testbenches
--------------------------------------------------------------------------------
-- original   : Eric Hazen
--      v0.1  : Guillermo   :   added support for TAR
--      v0.2  : Davide      :   CSF version

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
-- use shared_lib.detector_param_pkg.all;

package csf_textio_pkg is

  procedure READ(L:inout LINE; HIT : out heg2sfhit_rt; SEED : out heg2sfslc_rt; EOF : out std_logic);

end csf_textio_pkg;


package body csf_textio_pkg is

  -----------------------------------------------
  -- read CSF 
  -----------------------------------------------  
  procedure READ(L:inout LINE; HIT : out heg2sfhit_rt; SEED : out heg2sfslc_rt; EOF : out std_logic) is

    variable hit_dv : integer;
    variable hit_ml : integer;
    variable hit_x  : integer;
    variable hit_y  : integer;
    variable hit_r  : integer;
    variable slc_dv : integer;
    variable slc_chamber_id : integer;
    variable slc_chamber_ieta : integer;
    variable slc_vec_pos : integer;
    variable slc_vec_ang : integer;
    variable slc_hewindow_pos : integer;
    variable file_eof : integer;

    variable dummy_text  : string(1 to 100);
    variable ok : boolean;

    -- variable
  begin
    -- Event
    -- READ(L, event);
    -- Hit Data Valid
    READ(L, hit_dv);
    -- Hit Multilayer
    READ(L, hit_ml);
    -- Hit Local X
    READ(L, hit_x);
    -- Hit Local Y
    READ(L, hit_y);
    -- Hit Radius
    READ(L, hit_r);
    -- SLC dv
    READ(L, slc_dv);
    -- ChamberId < Chamber ID using L0MDT numbering scheme
    READ(L, slc_chamber_id);
    -- Chamber_iEta < iEta index of the chamber [0,7]. Based on 1st layer of tube.
    READ(L, slc_chamber_ieta);
    -- SLC vec_pos
    READ(L, slc_vec_pos);
    -- SLC vec_ang (mbar for csf)
    READ(L, slc_vec_ang);
    -- SLC HE window pos
    READ(L, slc_hewindow_pos);
    -- EOF
    READ(L, file_eof);
    
    READ(L, dummy_text,ok);

    
    HIT := (
      data_valid => to_unsigned(hit_dv,1)(0),
      mlayer => to_unsigned(hit_ml,1)(0),
      localx => to_unsigned(hit_x, HEG2SFHIT_LOCALX_LEN),
      localy => to_unsigned(hit_y, HEG2SFHIT_LOCALY_LEN),
      radius => to_unsigned(hit_r, HEG2SFHIT_RADIUS_LEN)
    );

    SEED := zero(SEED);
    SEED.data_valid := to_unsigned(slc_dv,1)(0);
    SEED.mdtid := (
        chamber_id => to_unsigned(slc_chamber_id, VEC_MDTID_CHAMBER_ID_LEN),
        chamber_ieta => to_unsigned(slc_chamber_ieta, VEC_MDTID_CHAMBER_IETA_LEN)
    );
    SEED.vec_pos := to_unsigned(slc_vec_pos, UCM2HPS_VEC_POS_LEN);
    SEED.vec_ang := to_unsigned(slc_vec_ang, UCM2HPS_VEC_ANG_LEN);
    SEED.hewindow_pos := to_unsigned(slc_hewindow_pos, HEG2SFSLC_HEWINDOW_POS_LEN);
    

    EOF := to_unsigned(file_eof, 1)(0);

  end procedure;

end csf_textio_pkg;