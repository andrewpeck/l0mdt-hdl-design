--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module: Functions VHDL 2008
--  Description: Functions from vhdl 2008 that are not supported by Vivado simualtor
--
--------------------------------------------------------------------------------
--  Revisions:
--    
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- library shared_lib;
-- use shared_lib.cfg_global_pkg.all;

-- library project_lib;
-- use project_lib.config_pkg.all;

package vhdl2008_functions_pkg is

  function max (x,y : integer) return integer;

end vhdl2008_functions_pkg;

package body vhdl2008_functions_pkg is

  function max(x,y : integer) return integer is
    variable z : integer;
  begin
    if ( x > y) then
      z := x;
    else
      z := y;
    end if;
    return z;
  end function;

end vhdl2008_functions_pkg;