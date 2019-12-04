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

entity he_hp_hm is
    port (
        clk_360             : in std_logic;
        Reset_b             : in std_logic;
        --
        tdchits_r           : in tar2hec_data_rt;
        tdchits_valid     : in std_logic;
        tube_range_r        : in tube_range_cand_rt;
        tube_range_valid    : in std_logic;

        cal_time            : in integer;
        cal_time_valid      : in std_logic;
        --
        valid_hit           : out std_logic
        --ouput_data_valid    : out std_logic


    );
end entity he_hp_hm;

architecture beh of he_hp_hm is


begin


end beh;