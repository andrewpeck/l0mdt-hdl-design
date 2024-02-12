--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Tube address map for hedgehog mezzanine PCBs to the TDC
--  Description: 
--
--------------------------------------------------------------------------------
--  History : 2020.12.6 : only MDT chambers (missing sMDT)
--      
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
use dp_repo_lib.tdc_mezz_mapping_pkg.all;

package fct_tdc_mezz_mapping_pkg is
  
  -- type hh_mezz_param_t is array (0 to 1) of integer; -- layer , tube
  -- type hh_mezz_t is array(0 to 23) of hh_mezz_param_t;
  
  type hh_mdt_mezz_map_t is array (0 to 23) of integer;
  function get_tdc_tube_map(station : integer; multilayer : integer; t_nl : integer) return hh_mdt_mezz_map_t;

  -- type chamb_b_station_numch_t is array(0 to 15) of integer;
  -- type chamb_b_station_side_t is array(0 to 1) of chamb_b_station_numch_t;


  function get_num_tubes_layer_station(sr: integer) return integer;

  -- function get_num_chamb( ) return integer;

  subtype mezz_b_chamber_dist_chamber_t is dp_mezz_b_chamber_dist_chamber_t;
  -- type mezz_b_chamber_dist_chamber_t is array (0 to MAX _NUM_CHAMBER_POS - 1) of integer;
  -- type mezz_b_chamber_dist_side_t is array ( 0 to 1) of mezz_b_chamber_dist_chamber_t;
  -- type mezz_b_chamber_dist_t is array (0 to 15) of mezz_b_chamber_dist_side_t;


  function get_csm_accumulated_tubes(station : integer) return mezz_b_chamber_dist_chamber_t;

  subtype tdc_accumulated_tubes_t is dp_tdc_accumulated_tubes_t;
  -- type tdc_accumulated_tubes_t is array ( 0 to 17) of integer;
  -- constant tdc_inn_accumulated : tdc_accumulated_tubes_t := (0,0,6,6,12,12,18,18,24,24,30,30,36,36,42,42,48,48);
  -- constant tdc_mid_out_accumulated : tdc_accumulated_tubes_t := (0,0,8,8,16,16,24,24,32,32,40,40,48,48,56,56,64,64);
  function get_tdc_accumulated_tubes(station : integer) return tdc_accumulated_tubes_t;

  function get_num_tubes_layer_chamber(sr , c : integer) return integer ;
  
end package fct_tdc_mezz_mapping_pkg;

package body fct_tdc_mezz_mapping_pkg is
  
  function get_tdc_tube_map(
    station : integer; 
    multilayer : integer;
    t_nl : integer
  ) return hh_mdt_mezz_map_t is
    variable out_mem : hh_mdt_mezz_map_t;
  begin

    if c_ST_nBARREL_ENDCAP = '0' then -- BARREL
      if c_SECTOR_SIDE = 0 then -- SIDE A
        if station = 0 then -- INN STATION
          
          if c_SECTOR_ID = 3 then -- BIL
            if multilayer = 0 then
              for mem_i in 0 to 23 loop
                out_mem(mem_i) := hh_mdt_mezz_type_IV_right(mem_i)(t_nl);
              end loop;
            else
              for mem_i in 0 to 23 loop
                out_mem(mem_i) := hh_mdt_mezz_type_III_right(mem_i)(t_nl);
              end loop;
            end if;
          end if;

        elsif station = 1 then -- MID STATION
          if c_SECTOR_ID = 3 then
            if multilayer = 0 then
              for mem_i in 0 to 23 loop
                out_mem(mem_i) := hh_mdt_mezz_type_II_right(mem_i)(t_nl);
              end loop;
            else
              for mem_i in 0 to 23 loop
                out_mem(mem_i) := hh_mdt_mezz_type_I_right(mem_i)(t_nl);
              end loop;
            end if;
          end if;
        elsif station = 2 then -- OUT STATION
          if c_SECTOR_ID = 3 then
            if multilayer = 0 then
              for mem_i in 0 to 23 loop
                out_mem(mem_i) := hh_mdt_mezz_type_II_right(mem_i)(t_nl);
              end loop;
            else
              for mem_i in 0 to 23 loop
                out_mem(mem_i) := hh_mdt_mezz_type_I_right(mem_i)(t_nl);
              end loop;
            end if;
          end if;
        else -- EXT STATION

        end if;
      else -- SIDE C

      end if;
    end if;

    return out_mem;
  end function;

  function get_csm_accumulated_tubes(station : integer) return mezz_b_chamber_dist_chamber_t is
    variable out_mem : mezz_b_chamber_dist_chamber_t;
  begin
    if station = 0 then
      for ch_i in 0 to get_b_chamber_num_station(c_SECTOR_ID,station) -1 loop
        out_mem(ch_i) := accum_mezz_barrel_inn_chamber_dist(c_SECTOR_ID-1)(c_SECTOR_SIDE)(ch_i) * 3;
      end loop;
    elsif station = 1 then
      for ch_i in 0 to get_b_chamber_num_station(c_SECTOR_ID,station) -1 loop
        out_mem(ch_i) := accum_mezz_barrel_mid_chamber_dist(c_SECTOR_ID-1)(c_SECTOR_SIDE)(ch_i) * 4;
        end loop;
    elsif station = 2 then
      for ch_i in 0 to get_b_chamber_num_station(c_SECTOR_ID,station) -1 loop
        out_mem(ch_i) := accum_mezz_barrel_out_chamber_dist(c_SECTOR_ID-1)(c_SECTOR_SIDE)(ch_i) * 4;
        end loop;
    elsif station = 4 then

    else

    end if;

    return out_mem;
  end function;
  
  function get_tdc_accumulated_tubes(station : integer) return tdc_accumulated_tubes_t is
    variable out_mem : tdc_accumulated_tubes_t;
  begin
    
    if station = 0 then
      out_mem := tdc_inn_accumulated;
    elsif station = 1 then
      out_mem := tdc_mid_out_accumulated;
    elsif station = 2 then
      out_mem := tdc_mid_out_accumulated;
    elsif station = 4 then

    else

    end if;
    return out_mem;
  end function;

  function get_num_tubes_layer_chamber(sr , c : integer) return integer is
    variable y : integer;
  begin
    
    if sr = 0 then
      y := integer(ceil((real(num_mezz_barrel_inn_chamber_dist(c_SECTOR_ID-1)(c_SECTOR_SIDE)(c))/2.0)*6.0));
    elsif sr = 1 then
      y := integer(ceil((real(num_mezz_barrel_mid_chamber_dist(c_SECTOR_ID-1)(c_SECTOR_SIDE)(c))/2.0)*8.0));
    elsif sr = 2 then
      y := integer(ceil((real(num_mezz_barrel_out_chamber_dist(c_SECTOR_ID-1)(c_SECTOR_SIDE)(c))/2.0)*8.0));
    elsif sr = 4 then

    else

    end if;
    return y;
  end function;

  function get_num_tubes_layer_station(sr: integer) return integer is
    variable y : integer;
  begin
    
    if sr = 0 then
      y := integer(ceil((real(accum_mezz_barrel_inn_chamber_dist(c_SECTOR_ID-1)(c_SECTOR_SIDE)(num_chamb_b_inn_station(c_SECTOR_SIDE)(c_SECTOR_ID-1)))/2.0)*6.0));
    elsif sr = 1 then
      y := integer(ceil((real(accum_mezz_barrel_mid_chamber_dist(c_SECTOR_ID-1)(c_SECTOR_SIDE)(num_chamb_b_mid_station(c_SECTOR_SIDE)(c_SECTOR_ID-1)))/2.0)*8.0));
    elsif sr = 2 then
      y := integer(ceil((real(accum_mezz_barrel_out_chamber_dist(c_SECTOR_ID-1)(c_SECTOR_SIDE)(num_chamb_b_out_station(c_SECTOR_SIDE)(c_SECTOR_ID-1)))/2.0)*8.0));
    elsif sr = 4 then

    else

    end if;
    return y;
  end function;
  
  
end package body fct_tdc_mezz_mapping_pkg;
