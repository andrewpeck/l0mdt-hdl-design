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
        clk_360 : in std_logic;
        nReset  : in std_logic;
        --
        indata : in tr_mux2tar_data;
        --
        outdata : out tr_tar2fifo_data
    );
end entity he_tar;

architecture beh of he_tar is

begin
    
end beh;