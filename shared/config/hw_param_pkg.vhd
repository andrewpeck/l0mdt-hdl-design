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
use shared_lib.common_pkg.all;
-- use shared_lib.config_pkg.all;

package hw_param_pkg is
  
  type barrel_stations_radius is array (0 to 3) of integer;
  type ys_barrel is array ( 0 to 1) of barrel_stations_radius;
  constant barrel_radius : ys_barrel :=(
    -- rpc0-rpc1-rpc2-rpc3
      (5000,7000,7500,10000), -- odd sectors
      (4200,7800,8200,10000)  -- even sectors
    );
  function get_barrel_radius ( sector, r_i: integer) return signed;
  
end package hw_param_pkg;

package body hw_param_pkg is
  
  function get_barrel_radius ( sector , r_i : integer) return signed is
    variable y : signed(SLC_Z_RPC_LEN-1 downto 0);

  begin
    if (sector mod 2) = 0 then
      y:= to_signed(barrel_radius(0)(r_i),SLC_Z_RPC_LEN);
    else
      y:= to_signed(barrel_radius(1)(r_i),SLC_Z_RPC_LEN);
    end if;

    return y;
  end function get_barrel_radius;
  
end package body hw_param_pkg;