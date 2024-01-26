--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: functions
-- File: fct_barrel_chamb_r2center_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /fct_barrel_chamb_r2center_pkg.vhd
-- -----
-- File Created: Thursday, 18th May 2023 8:00:18 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 18th May 2023 8:00:24 pm
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
use dp_repo_lib.barrel_chamb_r2center_pkg.all;

package fct_barrel_chamb_r2center_pkg is
  
  function get_b_chamber_center_radius( sector, station  : integer ; output_len : integer := SLC_Z_RPC_LEN ; scaler : real := 1.0) return b_chamber_center_radius_unsigned_aut;
  
end package fct_barrel_chamb_r2center_pkg;

package body fct_barrel_chamb_r2center_pkg is
  
  function get_b_chamber_center_radius( 
    sector, station  : integer ; 
    output_len : integer := SLC_Z_RPC_LEN ; 
    scaler : real := 1.0) 
  return b_chamber_center_radius_unsigned_aut is
    variable y : b_chamber_center_radius_unsigned_aut(open)(output_len -1 downto 0);
  begin
    -- for ch_i in  0 to MAX _NUM_CHAMBER_POS -1 loop
    for ch_i in  0 to get_b_chamber_num_station(sector,station) -1 loop
      y(ch_i) := to_unsigned(integer(b_chamber_center_radius(sector - 1)(station)(ch_i) * scaler) , output_len);
      -- y(ch_i) := to_unsigned(integer(b_chamber_center_radius(sector - 1)(station)(ch_i) * SLC_Z_RPC_MULT) , SLC_Z_RPC_LEN);
    end loop;
    return y;
  end function get_b_chamber_center_radius;
  
end package body fct_barrel_chamb_r2center_pkg;

