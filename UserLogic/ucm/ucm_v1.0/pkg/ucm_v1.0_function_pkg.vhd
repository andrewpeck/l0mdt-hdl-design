--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: pkg
-- File: ucm_function_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_function_pkg.vhd
-- -----
-- File Created: Wednesday, 8th June 2022 9:54:44 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 8th February 2023 11:25:11 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

use shared_lib.detector_param_pkg.all;

package ucm_function_pkg is
  
  -- function get_chamber_ieta(
  --    sector : integer ;
  --    station: integer ; 
  --    rpc : integer; --unsigned (SLC_Z_RPC_LEN -1 downto 0)
  --    mult : real
  -- ) return unsigned;
  
end package ucm_function_pkg;

package body ucm_function_pkg is
  
  -- function get_chamber_ieta(
  --    sector : integer ;
  --    station: integer ; 
  --    rpc : integer; -- unsigned (SLC_Z_RPC_LEN -1 downto 0)
  --    mult : real
  -- ) return unsigned is
  --   variable y : unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
  --   variable chamber_z_org_a : b_chamber_z_origin_ait := get_b_chamber_origin_z_i(sector,station,mult);
  -- begin

  --   if rpc < chamber_z_org_a(0) then
  --     y := to_unsigned(0,4);
  --   elsif rpc < chamber_z_org_a(1) then
  --     y := to_unsigned(1,4);
  --   elsif rpc < chamber_z_org_a(2) then
  --     y := to_unsigned(2,4);
  --   elsif rpc < chamber_z_org_a(3) then
  --     y := to_unsigned(3,4);
  --   elsif rpc < chamber_z_org_a(4) then
  --     y := to_unsigned(4,4);
  --   elsif rpc < chamber_z_org_a(5) then
  --     y := to_unsigned(5,4);
  --   elsif rpc < chamber_z_org_a(6) then
  --     y := to_unsigned(6,4);
  --   elsif rpc < chamber_z_org_a(7) then
  --     y := to_unsigned(7,4);
  --   else
  --     y := to_unsigned(8,4);
  --   end if;

  --   return y;
  -- end function;
  
end package body ucm_function_pkg;