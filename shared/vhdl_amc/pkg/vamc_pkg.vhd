--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: VHDL Advanced Memory Controller
--  Identifier : VAMC package
--  Description:
--
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- library vamc_lib;
-- use vamc_lib.vamc_pkg.all;

package vamc_pkg is
  
  function init_ADDR_WIDTH(m : integer; d:integer; x : integer) return integer;
  function init_DATA_DEPTH(m : integer; d:integer; x : integer) return integer;
  function init_mem_width(m : integer; x : string) return integer;
  function init_mem_depth(m : integer; x : integer) return integer;
  function init_add_width(m : integer; x : integer) return integer;

end package vamc_pkg;

package body vamc_pkg is
  
  function init_ADDR_WIDTH(m : integer; d:integer; x : integer) return integer is
    variable y : integer;
   begin
    if m /= 0 then
      y := m;
    elsif d/= 0 then
      y := integer(ceil(log2(real(d))));
    else
      y := integer(ceil(log2(real(x))));
    end if;
    return y;
  end function;
  
  function init_DATA_DEPTH(m : integer; d:integer; x : integer) return integer is
    variable y : integer;
   begin
    if m /= 0 then
      y := 2**m;
    elsif d/= 0 then
      y := d;
    else
      y := x;
    end if;
    return y;
  end function;

  function init_mem_width(m : integer; x : string) return integer is
    variable y : integer;
    begin
    if x = "int" then
      y := m + 1;
    else
      y := m;
    end if;
    return y;
  end function;

  function init_mem_depth(m : integer; x : integer) return integer is
    variable y : integer;
    begin
    if m /= 0 then
      y := m;
    else
      y := 2**x;
    end if;
    return y;
  end function;

  function init_add_width(m : integer; x : integer) return integer is
    variable y : integer;
  begin
    if m /= 0 then
      y := integer(ceil(log2(real(m))));
    else
      y := x;
    end if;
    return y;
  end function;
  
end package body vamc_pkg;