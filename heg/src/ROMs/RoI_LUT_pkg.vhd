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

package RoI_LUT_pkg is

  -- type trLUT_limits_t is array (0 to 1) of integer;
  -- type trLUT_layer_t is array (0 to 5) of trLUT_limits_t;
  -- type trLUT_mem_t is array(0 to 13000) of trLUT_layer_t;
  -- type b_stations_mem is record
  --   i   : trLUT_mem_t;
  --   m   : trLUT_mem_t;
  --   o   : trLUT_mem_t;
  --   e   : trLUT_mem_t;
  -- end record;
  -- type b_sector_mem is record
  --   a   : b_stations_mem;
  --   c   : b_stations_mem;
  -- end record;
  -- type RoI_LUT_mem is record
  --   S3  : b_sector_mem;
  -- end record;

  function roi_set_mdt_mem(sector, station : integer) return roi_mdt_lut;
  
  function roi_set_max(sector, station : integer) return integer;
  
end package RoI_LUT_pkg;

package body RoI_LUT_pkg is
  
  function roi_set_mdt_mem(sector, station : integer) return roi_mdt_lut is
    variable out_mem : roi_mdt_lut := (others =>(others =>(others => 0))) ;
  begin

    if sector = 0 then

    elsif sector = 3 then
      if station = 0 then
        out_mem := trLUT_s3i_rom_mem;
      elsif station = 1 then

      elsif station = 2 then

      elsif station = 3 then

      end if;
    else

    end if;


  end function;

  function roi_set_max(sector, station : integer) return integer is
    variable out_mem : integer := 0;
  begin

    if sector = 0 then

    elsif sector = 3 then
      if station = 0 then
        out_mem := BILA3_IN_MAX;
      elsif station = 1 then

      elsif station = 2 then

      elsif station = 3 then

      end if;
    else

    end if;


  end function;
  
  
end package body RoI_LUT_pkg;