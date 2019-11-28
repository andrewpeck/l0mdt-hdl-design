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

entity he_tar is
    port (
        clk_360     : in std_logic;
        Reset_b     : in std_logic;
        --
        in_data_r   : in mux2tar_data_rt;
        in_valid    : in std_logic;
        --
        out_data_r  : out tar2hec_data_rt;
        out_valid   : out std_logic
    );
end entity he_tar;

architecture beh of he_tar is

begin
    
end beh;