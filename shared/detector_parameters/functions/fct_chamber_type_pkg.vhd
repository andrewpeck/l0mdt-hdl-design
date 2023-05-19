--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: functions
-- File: fct_chamber_type_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /fct_chamber_type_pkg.vhd
-- -----
-- File Created: Thursday, 18th May 2023 9:44:58 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 18th May 2023 9:45:28 pm
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

library dp_repo_lib;
use dp_repo_lib.chamber_type_pkg.all;

package fct_chamber_type_pkg is
  
  function get_b_chamber_type_sector( sector : integer) return b_chamber_type_sector_at;
  function get_b_chamber_type( sector,station,ieta : integer) return integer;
  
end package fct_chamber_type_pkg;

package body fct_chamber_type_pkg is
  
-------------------------------------------------------------------------
  -- Chamber type from
  -------------------------------------------------------------------------
  function get_b_chamber_type_sector( sector : integer) return b_chamber_type_sector_at is
    variable y : b_chamber_type_sector_at;
  begin
    y := b_chamber_type_detector(sector - 1 );

    return y;
  end function;

  function get_b_chamber_type( sector,station,ieta : integer) return integer is
    variable y : integer;
  begin
    y := b_chamber_type_detector(sector - 1)(station)(ieta);
    return y;
  end function;
  
end package body fct_chamber_type_pkg;