--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module: Detector function to get the chamber depending on the global tube number
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
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.common_constants_pkg.all;

package gtube2chamber_pkg is
  
  type tubes_per_chamber_t is array (0 to 7) of integer;
  type tubes_per_chamber_station_t is array (1 to 16) of tubes_per_chamber_t;
  
  constant t2c_BI_A : tubes_per_chamber_station_t :=(
    1  => (0,0,0,0,0,0,0,0), 
    2  => (0,0,0,0,0,0,0,0),
    3  => (30,36,30,36,30,36,0,0),
    4  => (0,0,0,0,0,0,0,0),
    5  => (0,0,0,0,0,0,0,0),
    6  => (0,0,0,0,0,0,0,0),
    7  => (0,0,0,0,0,0,0,0),
    8  => (0,0,0,0,0,0,0,0),
    9  => (0,0,0,0,0,0,0,0),
    10 => (0,0,0,0,0,0,0,0),
    11 => (0,0,0,0,0,0,0,0),
    12 => (0,0,0,0,0,0,0,0),
    13 => (0,0,0,0,0,0,0,0),
    14 => (0,0,0,0,0,0,0,0),
    15 => (0,0,0,0,0,0,0,0),
    16 => (0,0,0,0,0,0,0,0)
  );

  constant t2c_BM_A : tubes_per_chamber_station_t :=(
    1  => (0,0,0,0,0,0,0,0), 
    2  => (0,0,0,0,0,0,0,0),
    3  => (56,56,56,40,40,48,0,0),
    4  => (0,0,0,0,0,0,0,0),
    5  => (0,0,0,0,0,0,0,0),
    6  => (0,0,0,0,0,0,0,0),
    7  => (0,0,0,0,0,0,0,0),
    8  => (0,0,0,0,0,0,0,0),
    9  => (0,0,0,0,0,0,0,0),
    10 => (0,0,0,0,0,0,0,0),
    11 => (0,0,0,0,0,0,0,0),
    12 => (0,0,0,0,0,0,0,0),
    13 => (0,0,0,0,0,0,0,0),
    14 => (0,0,0,0,0,0,0,0),
    15 => (0,0,0,0,0,0,0,0),
    16 => (0,0,0,0,0,0,0,0)
  );

  constant t2c_BO_A : tubes_per_chamber_station_t :=(
    1  => (0,0,0,0,0,0,0,0),
    2  => (0,0,0,0,0,0,0,0),
    3  => (72,72,56,72,72,56,0,0),
    4  => (0,0,0,0,0,0,0,0),
    5  => (0,0,0,0,0,0,0,0),
    6  => (0,0,0,0,0,0,0,0),
    7  => (0,0,0,0,0,0,0,0),
    8  => (0,0,0,0,0,0,0,0),
    9  => (0,0,0,0,0,0,0,0),
    10 => (0,0,0,0,0,0,0,0),
    11 => (0,0,0,0,0,0,0,0),
    12 => (0,0,0,0,0,0,0,0),
    13 => (0,0,0,0,0,0,0,0),
    14 => (0,0,0,0,0,0,0,0),
    15 => (0,0,0,0,0,0,0,0),
    16 => (0,0,0,0,0,0,0,0)
  );
    
  function get_b_chamber_from_tubes(sector : integer ; s_side : std_logic ; station : integer ; tube : integer) return integer;
  
end package gtube2chamber_pkg;

package body gtube2chamber_pkg is
  
  function get_b_chamber_from_tubes(sector : integer ; s_side : std_logic ; station : integer ; tube : integer) return integer is
    variable y : tubes_per_chamber_t;
    variable tubeacum : integer;
    variable ch : integer;
  begin
    if s_side = '0' then -- side A
      if station = 0 then
        -- inner
        for l_i in 0 to 7 loop
          y(l_i) := integer(t2c_BI_A(sector)(l_i));
        end loop;
      elsif station = 1 then
        -- middle
        for l_i in 0 to 7 loop
          y(l_i) := integer(t2c_BM_A(sector)(l_i));
        end loop;
      elsif station = 2 then
        -- outter
        for l_i in 0 to 7 loop
          y(l_i) := integer(t2c_BO_A(sector)(l_i));
        end loop;
      elsif station = 3 then
        --extra
      else
        -- error
      end if;
    else -- side C

    end if;

    tubeacum := 0;
    for t_i in 0 to 7 loop
      if tube < y(t_i) + tubeacum then
        ch := t_i;
      else
        tubeacum := tubeacum + y(t_i);
      end if;
    end loop;

    return ch;
  
  end function;
  
end package body gtube2chamber_pkg;