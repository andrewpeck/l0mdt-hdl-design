--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: functions
-- File: fct_barrel_chamb_z2origin_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /fct_barrel_chamb_z2origin_pkg.vhd
-- -----
-- File Created: Tuesday, 4th April 2023 3:16:48 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Tuesday, 4th April 2023 3:30:05 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.detector_param_pkg.all;

library dp_repo_lib;
use dp_repo_lib.barrel_chamb_z2origin_pkg.all;

package fct_barrel_chamb_z2origin_pkg is

  type b_chamber_z_origin_aut is array (0 to MAX_NUM_CHAMBER_POS -1 ) of unsigned(16 - 1 downto 0);
  subtype b_chamber_z_origin_avt is std_logic_vector(16 * MAX_NUM_CHAMBER_POS -1 downto 0);
  type b_chamber_z_origin_station_aut is array (0 to 3) of b_chamber_z_origin_aut;
  type b_chamber_z_origin_station_avt is array (0 to 3) of b_chamber_z_origin_avt;
 

  function get_b_chamber_origin_z_u( sector_id, side_id , station : integer; mult : real; out_width : integer := 16) return b_chamber_z_origin_aut;
  function get_b_chamber_origin_z_i( sector_id, side_id , station : integer; mult : real) return b_chamber_z_origin_ait;

  function convert(x: b_chamber_z_origin_aut) return b_chamber_z_origin_avt;
  function convert(x: b_chamber_z_origin_avt) return b_chamber_z_origin_aut;
  
  
end package fct_barrel_chamb_z2origin_pkg;

package body fct_barrel_chamb_z2origin_pkg is
  
  function get_b_chamber_origin_z_u(sector_id, side_id , station: integer; mult : real; out_width : integer := 16) return b_chamber_z_origin_aut is
    variable y : b_chamber_z_origin_aut;
  begin
    for ch_i in  0 to MAX_NUM_CHAMBER_POS -1 loop
      y(ch_i) := to_unsigned(integer(b_chamber_z_origin_detector(side_id)(sector_id - 1)(station)(ch_i) * mult) , out_width);
    end loop;
    return y;
  end function;
  function get_b_chamber_origin_z_i(sector_id, side_id , station : integer; mult : real) return b_chamber_z_origin_ait is
    variable y : b_chamber_z_origin_ait;
  begin
    for ch_i in  0 to MAX_NUM_CHAMBER_POS -1 loop
      y(ch_i) := integer(b_chamber_z_origin_detector(side_id)(sector_id - 1)(station)(ch_i) * mult);
    end loop;
    return y;
  end function;
  function convert(x: b_chamber_z_origin_aut) return b_chamber_z_origin_avt is
    variable msb : integer := x'length*16-1;
    variable y : b_chamber_z_origin_avt;
  begin
    l : for i in x'range loop
      y(msb downto msb-16+1) := std_logic_vector(x(i));
      msb := msb - 16;
    end loop;
    return y;
  end function;
  function convert(x: b_chamber_z_origin_avt) return b_chamber_z_origin_aut is
    variable y :  b_chamber_z_origin_aut;
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := unsigned(x(msb downto msb-16+1));
      msb := msb - 16;
    end loop l;
    return y;
  end function;  
  
end package body fct_barrel_chamb_z2origin_pkg;