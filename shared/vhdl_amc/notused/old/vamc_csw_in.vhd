--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: VAMC input cross switch 
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee.all;

library vamc_lib;

entity vamc_csw_in is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic
  );
end entity vamc_csw_in;

architecture beh of vamc_csw_in is
  
begin
  
  
  
end architecture beh;