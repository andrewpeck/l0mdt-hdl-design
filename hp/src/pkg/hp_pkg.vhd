--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module:
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--   26/11/2019     0.1     File created
--    05/02/2020    0.11    HP matching parameters added
--------------------------------------------------------------------------------

library ieee, l0mdt_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hp_lib;
use hp_lib.cfg_pkg.all;
use l0mdt_lib.common_pkg.all;


package hp_pkg is
--------------------------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--  sub types
--------------------------------------------------------------------------------
-- MDT hits
subtype mdt_time_comp is std_logic_vector(21 downto 0);
--------------------------------------------------------------------------------
--  RECORDS
--------------------------------------------------------------------------------

-- Hit processor internal records
-- SLc barrel record
type hp_SLc_barrel_rt is record
    BCID        : SLc_BCID_st;          -- 12 bits
    b_zpos      : SLc_zpos_st;          -- 10 bits
    b_phi       : SLc_phi_st;           -- 9 bits
end record;  


-- data from TAR to hit extraction input fifo
type hp_hit_data_rt is record
    layer           : unsigned(mdt_layer_bits -1 downto 0);
    tube            : unsigned(mdt_tube_bits - 1 downto 0);
    time_le         : mdt_time_le_st;
    time_pw         : mdt_time_pw_st;
end record;

-- subtype mdt_time_le is unsigned(16 downto 0);   -- 0.78 ns resolution
-- subtype mdt_time_pw is unsigned(7 downto 0);      -- 0.78 ns resolution

-- data types and records for hit processing block
    
-- muon candidate procesor to tube range LUT
-- type tube_range_config_rt is record
--     data_valid  : std_logic;
-- end record;

-- type muon_candidate_info_rt is record
--     mc_time : integer;
--     mc_origin : std_logic_vector(13 downto 0);
-- end record;

-- tube range LUT to Hit Matching
-- type tube_range_cand_rt is record
--     tube_hi     : integer;
--     tube_lo     : integer;
-- end record;

-- output structures

type hp_2_sf_csf_rt is record
    x : unsigned(csf_x_width-1 downto 0);
    z : signed(csf_z_width-1 downto 0);
    r : unsigned(csf_r_width-1 downto 0);
end record;

type hp_2_sf_le_rt is record
    x : unsigned(le_x_width-1 downto 0);
    y : unsigned(le_y_width-1 downto 0);
    r : unsigned(le_r_width-1 downto 0);
end record;

type hp_2_sf_rt is record
    hit_valid       : std_logic;
    -- parameters
    csf             : hp_2_sf_csf_rt;
    le              : hp_2_sf_le_rt;
end record;

--------------------------------------------------------------------------------
-- FUNCTIONS DECLARATION
--------------------------------------------------------------------------------

end package hp_pkg;

package body hp_pkg is
--------------------------------------------------------------------------------
-- FUNCTIONS IMPLEMENTATION
--------------------------------------------------------------------------------
 
end package body hp_pkg;
