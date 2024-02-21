--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: mechanics
-- File: mem_phi_center_chamber_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /mem_phi_center_chamber_pkg.vhd
-- -----
-- File Created: Thursday, 16th March 2023 8:02:59 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 18th May 2023 3:37:20 pm
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
-- use shared_lib.sl2mdt_constants_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library dp_repo_lib;
use dp_repo_lib.sector_phi_center_pkg.all;

package fct_sector_phi_center_pkg is
  
  function get_sector_phi_center( sector : integer; len : integer) return sector_phi_center_t;

  -- constant phi_center_default : real := sector_phi_center_default(sector  - 1);
  
end package fct_sector_phi_center_pkg;

package body fct_sector_phi_center_pkg is
  
  function get_sector_phi_center( sector : integer; len : integer) return sector_phi_center_t is
    variable mem_out : sector_phi_center_t;
    variable a , b : real;
  begin
    a := sector_phi_center_default(sector  - 1);
    -- b := 1/SL2MDT _SLC_COMMON_POSPHI_RES;
    mem_out := to_unsigned( integer(a * SLC_COMMON_POSPHI_MULT),len);
    -- mem_out := to_unsigned( integer(a / SL2MDT _SLC_COMMON_POSPHI_RES),len);
    return mem_out;
  end function;
  
end package body fct_sector_phi_center_pkg;