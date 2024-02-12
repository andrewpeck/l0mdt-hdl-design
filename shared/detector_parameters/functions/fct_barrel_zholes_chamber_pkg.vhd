--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: functions
-- File: fct_barrel_zholes_chamber_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /fct_barrel_zholes_chamber_pkg.vhd
-- -----
-- File Created: Thursday, 18th May 2023 3:07:37 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 18th May 2023 3:26:40 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.detector_param_pkg.all;

library dp_repo_lib;
use dp_repo_lib.barrel_zholes_chamber_pkg.all;

package fct_barrel_zholes_chamber_pkg is

  -- type zhLUT_chamber_integer_t is array (0 to 7) of integer;
  -- type zhLUT_chamber_t is array (0 to 7) of real;
  -- type zhLUT_station_t is array (1 to 16) of zhLUT_chamber_t;
  
  -- constant c_BI_A_zh : zhLUT_station_t :=(
  --   1  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), 
  --   2  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   3  => (330.0,347.5,365.0,549.0,566.5,584.0,0.0,0.0),
  --   4  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   5  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   6  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   7  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   8  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   9  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   10 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   11 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   12 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   13 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   14 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   15 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   16 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
  -- );

  -- constant c_BM_A_zh : zhLUT_station_t :=(
  --   1  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0), 
  --   2  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   3  => (150.0,167.5,185.0,202.5,220.0,237.5,0.0,0.0),
  --   4  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   5  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   6  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   7  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   8  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   9  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   10 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   11 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   12 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   13 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   14 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   15 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   16 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
  -- );

  -- constant c_BO_A_zh : zhLUT_station_t :=(
  --   1  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   2  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   3  => (90.0,107.5,125.0,142.5,160.0,177.5,0.0,0.0),
  --   4  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   5  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   6  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   7  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   8  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   9  => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   10 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   11 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   12 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   13 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   14 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   15 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),
  --   16 => (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)
  -- );
    
  function b_zh_get_layer(sector : integer ; station : integer) return zhLUT_chamber_integer_t;
    
end package fct_barrel_zholes_chamber_pkg;

package body fct_barrel_zholes_chamber_pkg is
  
  function b_zh_get_layer(sector : integer ; station : integer) return zhLUT_chamber_integer_t is
    variable o_layer : zhLUT_chamber_integer_t;
  begin
    if station = 0 then
      -- inner
      for l_i in 0 to 7 loop
        o_layer(l_i) := integer(c_BI_A_zh(sector)(l_i) * MDT_GLOBAL_AXI_MULT);
      end loop;
    elsif station = 1 then
      -- middle
      for l_i in 0 to 7 loop
        o_layer(l_i) := integer(c_BM_A_zh(sector)(l_i) * MDT_GLOBAL_AXI_MULT);
      end loop;
    elsif station = 2 then
      -- outter
      for l_i in 0 to 7 loop
        o_layer(l_i) := integer(c_BO_A_zh(sector)(l_i) * MDT_GLOBAL_AXI_MULT);
      end loop;
    elsif station = 3 then
      --extra
    else
      -- error
    end if;
    return o_layer;
  end function;
  
end package body fct_barrel_zholes_chamber_pkg;