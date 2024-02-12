--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: pkg
-- File: fct_gtube2chamber_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /fct_gtube2chamber_pkg.vhd
-- -----
-- File Created: Tuesday, 4th April 2023 9:53:08 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Tuesday, 4th April 2023 10:24:09 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
-- 2023-04-04	GLdL	New file only with functions as constant LUTs had been moved to dp_Repo
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.common_constants_pkg.all;
-- use shared_lib.detector_param_pkg.all;

library dp_repo_lib;
use dp_repo_lib.gtube2chamber_pkg.all;

package fct_gtube2chamber_pkg is
 
  function get_b_chamber_from_tubes(sector : integer ; s_side : integer ; station : integer ; tube : integer) return integer;
  
end package fct_gtube2chamber_pkg;

package body fct_gtube2chamber_pkg is
  
  function get_b_chamber_from_tubes(sector : integer ; s_side : integer ; station : integer ; tube : integer) return integer is
    variable y : tubes_per_chamber_t;
    variable tubeacum : integer;
    variable ch : integer;
  begin
    if s_side = 0 then -- side A
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
  
end package body fct_gtube2chamber_pkg;