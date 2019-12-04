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
--   29/11/2019  0.1  File created
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library he_lib;
use he_lib.he_pkg.all;

entity he_hp_hc is
    port (
        clk_360             : in std_logic;
        Reset_b             : in std_logic;
        --
        tdchits_r                : in tar2hec_data_rt;
        tdchits_valid            : in std_logic;
        muon_candidate_info_r         : in muon_candidate_info_rt;
        muon_candidate_info_valid   : in std_logic;
        --
        cal_time        : out integer;
        cal_time_valid  : out std_logic;
        sf_data         : out segment_finder_legendre_rt;
        sf_data_valid   : out std_logic

    );
end entity he_hp_hc;

architecture beh of he_hp_hc is


begin


end beh;