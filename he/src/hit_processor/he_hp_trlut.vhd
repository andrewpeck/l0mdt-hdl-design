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

entity he_hp_crlut is
    port (
        clk_360             : in std_logic;
        Reset_b             : in std_logic;
        --
        hit_layer                   : in integer;
        hit_layer_valid             : in std_logic;
        tube_ranges_config          : in tube_range_config_rt;
        tube_ranges_config_valid    : in std_logic;
        --
        tube_range          : out tube_range_cand_rt;
        out_data_valid      : out std_logic


    );
end entity he_hp_crlut;

architecture beh of he_hp_crlut is


begin


end beh;