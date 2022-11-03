--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: generic_pipelined_MATH_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /shared/arithmetics/pkg/generic_pipelined_MATH_pkg.vhd
-- -----
-- File Created: Monday, 15th November 2021 9:29:29 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 21st September 2022 1:43:51 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.vhdl2008_functions_pkg.all;

package generic_pipelined_MATH_pkg is

  function arith_get_in_width(len , val : integer) return integer;
  
  function arith_get_out_width(op : string; AW, BW , CW, DW : integer) return integer;
  
end package generic_pipelined_MATH_pkg;

package body generic_pipelined_MATH_pkg is

  function arith_get_in_width(len,val : integer) return integer is
    variable ow : integer;
  begin
    if len = 1 then
      if val = 0 then
        ow := 0;
      else
        ow := 1;
      end if;
    else
      ow := len;
    end if;
    return ow;
  end function;
  
  function arith_get_out_width(op : string; AW, BW , CW, DW : integer) return integer is
    variable OW : integer;
  begin

    if op = "*" then 
      OW := AW + BW;
    elsif op = "-" OR  op = "--" then
      OW := max(AW,BW);
    elsif op = "/" then
      OW := max(AW,BW);
    elsif op = "*-" then
      OW := max(AW + BW,CW);
    elsif op="+++" then
      OW := 4 + max(AW, max(BW, max(CW,DW)));
    end if;

    return OW;
  end function;
  
end package body generic_pipelined_MATH_pkg;