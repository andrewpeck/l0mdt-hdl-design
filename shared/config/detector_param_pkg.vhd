--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module: Detector parameters
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
-- use shared_lib.config_pkg.all;

package detector_param_pkg is
  

  type barrel_stations_radius is array (0 to 3) of real;
  type ys_barrel is array ( 0 to 1) of barrel_stations_radius;
  constant barrel_radius : ys_barrel :=(
  -- rpc0 - rpc1 - rpc2 - rpc3
    (5000.0,7000.0,7500.0,10000.0), -- odd sectors
    (4200.0,7800.0,8200.0,10000.0)  -- even sectors
  );

  type b_chamber_origin_tube_radius is array (0 to 7) of real;
  type b_chamber_origin_station is array (0 to 3) of b_chamber_origin_tube_radius;
  type b_chamber_origin_chamber is array ( 0 to 15) of b_chamber_origin_station;
  constant b_a_layer_radius : ys_barrel :=(
    --     INN MID OUT EXT
     0 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S1
     1 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S2
     2 => ( (4755.93,4755.93,4755.93,4755.93,4755.93,4755.93,0.0,0.0),
            (6898.46,6898.46,6898.46,6898.46,6898.46,6898.46,0.0,0.0),
            (9259.46,9259.46,9259.46,9259.46,9259.46,9259.46,0.0,0.0),
            (0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S3
     3 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S4
     4 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S5
     5 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S6
     6 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S7
     7 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S8
     8 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S9
     9 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S10
    10 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S11
    11 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S12
    12 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S13
    13 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S14
    14 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)), -- S15
    15 => ((0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0),(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)) -- S16
  );

  -------------------------------------------------------------------------
  --
  -------------------------------------------------------------------------

  function get_barrel_radius ( sector, r_i: integer) return signed;

  function get_b_layer_radius ( sector, r_i: integer) return unsigned;
  
end package detector_param_pkg;

package body detector_param_pkg is
  
  function get_barrel_radius ( sector , r_i : integer) return signed is
    variable y : signed(SLC_Z_RPC_LEN-1 downto 0);
    variable r: real;
    variable r_c: integer;
  begin
    if (sector mod 2) = 0 then
      r:= barrel_radius(0)(r_i);
      -- y:= to_signed((barrel_radius(0)(r_i) / SLC_Z_RPC_MULT),SLC_Z_RPC_LEN);
    else
      r:= barrel_radius(1)(r_i);
      -- y:= to_signed((barrel_radius(1)(r_i) / SLC_Z_RPC_MULT),SLC_Z_RPC_LEN);
    end if;
    r_c := integer(r / SLC_Z_RPC_MULT);
    y := to_signed(r_c,SLC_Z_RPC_LEN);
    return y;
  end function get_barrel_radius;

  function get_b_layer_radius ( sector , r_i : integer) return unsigned is
    variable y : unsigned(MDT_LOCAL_Y_LEN-1 downto 0);
    variable r: real;
    variable r_c: integer;
  begin

    return y;
  end function get_b_layer_radius;
  
end package body detector_param_pkg;