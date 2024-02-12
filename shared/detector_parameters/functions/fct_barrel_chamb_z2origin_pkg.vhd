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
use shared_lib.fct_chamber_main_pkg.all;
use shared_lib.config_pkg.all;

library dp_repo_lib;
-- use dp_repo_lib.fct_chamber_main_pkg.all;
use dp_repo_lib.barrel_chamb_z2origin_pkg.all;

package fct_barrel_chamb_z2origin_pkg is

  type b_chamber_z_origin_aut is array (integer range <> ) of unsigned(16 - 1 downto 0);
  -- type b_chamber_z_origin_aut is array (0 to MAX_NUM_CHAMBER_POS -1 ) of unsigned(16 - 1 downto 0);
  subtype b_chamber_z_origin_avt is std_logic_vector;
  -- subtype b_chamber_z_origin_avt is std_logic_vector(16 * MAX_NUM_CHAMBER_POS -1 downto 0);
  type b_chamber_z_origin_station_aut is array (0 to 3) of b_chamber_z_origin_aut(0 to get_b_chamber_num_max(c_SECTOR_ID) - 1);
  type b_chamber_z_origin_station_avt is array (0 to 3) of b_chamber_z_origin_avt(16*get_b_chamber_num_max(c_SECTOR_ID) - 1 downto 0);
 

  function get_b_chamber_origin_z_u( sector_id, side_id , station : integer; mult : real; out_width : integer := 16) return b_chamber_z_origin_aut;
  function get_b_all_chamber_origin_z_u( sector_id, side_id : integer; mult : real; out_width : integer := 16) return b_chamber_z_origin_station_aut;
  function get_b_chamber_origin_z_i( sector_id, side_id , station : integer; mult : real) return b_chamber_z_origin_ait;

  function convert(x: b_chamber_z_origin_aut) return b_chamber_z_origin_avt;
  function convert(x: b_chamber_z_origin_avt) return b_chamber_z_origin_aut;
  
end package fct_barrel_chamb_z2origin_pkg;

package body fct_barrel_chamb_z2origin_pkg is
  
  function get_b_chamber_origin_z_u(sector_id, side_id , station: integer; mult : real; out_width : integer := 16) return b_chamber_z_origin_aut is
    variable y : b_chamber_z_origin_aut(get_b_chamber_num_station(sector_id,station) - 1 downto 0);
    begin
    for ch_i in  0 to get_b_chamber_num_station(sector_id,station) -1 loop
      y(ch_i) := to_unsigned(integer(b_chamber_z_origin_detector(side_id)(sector_id - 1)(station)(ch_i) * mult) , out_width);
    end loop;
    return y;
  end function;

  function get_b_all_chamber_origin_z_u(sector_id, side_id : integer; mult : real; out_width : integer := 16) return b_chamber_z_origin_station_aut is
    variable y : b_chamber_z_origin_station_aut;
    begin
    for st_i in 0 to 3 loop
      for ch_i in  0 to get_b_chamber_num_station(sector_id,st_i) -1 loop
        y(st_i)(ch_i) := to_unsigned(integer(b_chamber_z_origin_detector(side_id)(sector_id - 1)(st_i)(ch_i) * mult) , out_width);
      end loop;
    end loop;
    return y;
  end function;

  function get_b_chamber_origin_z_i(sector_id, side_id , station : integer; mult : real) return b_chamber_z_origin_ait is
    variable y : b_chamber_z_origin_ait;
    begin
    for ch_i in  0 to get_b_chamber_num_station(sector_id,station) -1 loop
      y(ch_i) := integer(b_chamber_z_origin_detector(side_id)(sector_id - 1)(station)(ch_i) * mult);
    end loop;
    return y;
  end function;

  function convert(x: b_chamber_z_origin_aut) return b_chamber_z_origin_avt is
    variable msb : integer := x'length*16-1;
    variable y : b_chamber_z_origin_avt(16*x'length - 1 downto 0);
    begin
    l : for i in x'range loop
      y(msb downto msb-16+1) := std_logic_vector(x(i));
      msb := msb - 16;
    end loop;
    return y;
  end function;

  function convert(x: b_chamber_z_origin_avt) return b_chamber_z_origin_aut is
    variable y :  b_chamber_z_origin_aut(x'length/16 - 1 downto 0);
    variable msb : integer := x'left;
  begin
    l: for i in y'range loop
      y(i) := unsigned(x(msb downto msb-16+1));
      msb := msb - 16;
    end loop l;
    return y;
  end function;  
  
end package body fct_barrel_chamb_z2origin_pkg;