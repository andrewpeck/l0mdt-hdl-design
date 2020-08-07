--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: 
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library heg_lib;
use heg_lib.heg_pkg.all;

library heg_roi_lib;
use heg_roi_lib.roi_types_pkg.all;
use heg_roi_lib.ROI_LUT_BILA3.all;
use heg_roi_lib.ROI_LUT_BMLA3.all;
use heg_roi_lib.ROI_LUT_BOLA3.all;
use heg_roi_lib.ROI_LUT_BILA3_slope.all;
use heg_roi_lib.ROI_LUT_BMLA3_slope.all;
use heg_roi_lib.ROI_LUT_BOLA3_slope.all;

package roi_func_pkg is
  -- Z LUT functions
  function get_roi_z_tubes(station : integer) return roi_z_lut_t;
  function get_roi_z_max(station : integer) return integer;
  -- slope LUT functions
  function get_roi_mbar_tubes(station : integer) return roi_mbar_lut_t;
  function get_roi_mbar_max(station : integer) return integer;
  
end package roi_func_pkg;

package body roi_func_pkg is

  function get_roi_z_tubes(station : integer) return roi_z_lut_t is
    -- variable out_mem : roi_mbar_lut_std(0 to get_roi_mbar_max(station) - 1) := (others => (others => '0')) ;
    variable out_mem : roi_z_lut_t(get_roi_z_max(station) - 1 downto 0);
  begin

    if c_SECTOR_ID = 0 then
    elsif c_SECTOR_ID = 3 then
      if station = 0 then
        out_mem := ROI_BILA3_Z_MEM;
      elsif station = 1 then
        out_mem := ROI_BMLA3_Z_MEM;
      elsif station = 2 then
        out_mem := ROI_BOLA3_Z_MEM;
      -- elsif station = 3 then
      end if;
    else
    end if;
    --
    return out_mem;
  end function;

  function get_roi_z_max(station : integer) return integer is
    variable out_max : integer := 0;
  begin
    if c_SECTOR_ID = 0 then
    elsif c_SECTOR_ID = 3 then
      if station = 0 then
        out_max := ROM_BILA3_Z_MAX_SIZE;
      elsif station = 1 then
        out_max := ROM_BMLA3_Z_MAX_SIZE;
      elsif station = 2 then
        out_max := ROM_BOLA3_Z_MAX_SIZE;
      -- elsif station = 3 then
      end if;
    else
    end if;
    --
    return out_max;
  end function;
  
  function get_roi_mbar_tubes(station : integer) return roi_mbar_lut_t is
    -- variable out_mem : roi_mbar_lut_std(0 to get_roi_mbar_max(station) - 1) := (others => (others => '0')) ;
    variable out_mem : roi_mbar_lut_t(get_roi_mbar_max(station) - 1 downto 0)(0 to get_num_layers(station) -1);
  begin

    if c_SECTOR_ID = 0 then
    elsif c_SECTOR_ID = 3 then
      if station = 0 then
        out_mem := ROI_BILA3_SLOPE_MEM;
      elsif station = 1 then
        out_mem := ROI_BMLA3_SLOPE_MEM;
      elsif station = 2 then
        out_mem := ROI_BOLA3_SLOPE_MEM;
      -- elsif station = 3 then
      end if;
    else
    end if;
    --
    return out_mem;
  end function;

  function get_roi_mbar_max(station : integer) return integer is
    variable out_max : integer := 0;
  begin
    if c_SECTOR_ID = 0 then
    elsif c_SECTOR_ID = 3 then
      if station = 0 then
        out_max := ROM_BILA3_SLOPE_MAX_SIZE;
      elsif station = 1 then
        out_max := ROM_BMLA3_SLOPE_MAX_SIZE;
      elsif station = 2 then
        out_max := ROM_BOLA3_SLOPE_MAX_SIZE;
      -- elsif station = 3 then
      end if;
    else
    end if;
    --
    return out_max;
  end function;
  
end package body roi_func_pkg;