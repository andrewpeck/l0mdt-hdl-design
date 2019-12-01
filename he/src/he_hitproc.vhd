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
--   26/11/2019  0.1  File created
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library he_lib;
use he_lib.he_pkg.all;

entity he_core is
    Generic(
        datawidth   : integer := 64
    );
    port (
        clk_360             : in std_logic;
        Reset_b             : in std_logic;
        --
        in_tdchits_r        : in tar2hec_data_rt;
        in_tdchits_valid    : in std_logic;
        in_candidate_r      : in muCand_data_rt;
        in_candidate_valid  : in std_logic
    );
end entity he_core;

architecture beh of he_core is


begin

    HE_C_TubeRangeLUT : entity he_c_crlut
    port map (
        
    );

    HE_C_TubeRangeLUT : entity he_c_crlut
    port map (
        
    );

    HE_C_TubeRangeLUT : entity he_c_crlut
    port map (
        
    );

    HE_C_TubeRangeLUT : entity he_c_crlut
    port map (
        
    );

end beh;