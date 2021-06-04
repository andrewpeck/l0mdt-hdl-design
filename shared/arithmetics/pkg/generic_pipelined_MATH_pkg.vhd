--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Configurable pipeline Multiplier 
--  Description:
-- 
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package generic_pipelined_MATH_pkg is
  
  function arith_get_out_width(op : string; AW, BW : integer) return integer;
  
end package generic_pipelined_MATH_pkg;

package body generic_pipelined_MATH_pkg is
  
  function arith_get_out_width(op : string; AW, BW : integer) return integer is
    variable OW : integer;
  begin

    if op = "*" then 
        OW := AW + BW;
    elsif op = "-" then
        OW := AW;
    end if;

    return OW;
  end function;
  
end package body generic_pipelined_MATH_pkg;