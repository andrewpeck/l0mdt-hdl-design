--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.chrn.ch
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

-- library hegtypes_lib; --heg_lib;
-- use hegtypes_lib.heg_pkg.all; --heg_lib.heg_pkg.all;

library heg_roi_lib;
use heg_roi_lib.roi_types_pkg.all;
use heg_roi_lib.ROI_LUT_BILA3.all;
use heg_roi_lib.ROI_LUT_BMLA3.all;
use heg_roi_lib.ROI_LUT_BOLA3.all;
use heg_roi_lib.ROI_LUT_BILA3_angle.all;
use heg_roi_lib.ROI_LUT_BMLA3_angle.all;
use heg_roi_lib.ROI_LUT_BOLA3_angle.all;

package roi_func_pkg is


  -- Z LUT functions
  function get_roi_z_tubes(station : integer) return roi_z_lut_t;
  function get_roi_z_tubes_std(station : integer) return roi_z_lut_std_t;
  function get_roi_z_max(station : integer) return integer;
  -- slope LUT functions

  -- VHDL2008 -- function get_roi_mbar_tubes(station : integer) return roi_mbar_lut_t;
  function get_roi_mbar_tubes(station : integer) return roi_mbar_lut_small_t;
  function get_roi_mbar_tubes(station : integer) return roi_mbar_lut_large_t;
  
  function get_roi_mbar_tubes_std(station : integer) return roi_mbar_lut_large_std_t;

  function get_roi_mbar_max(station : integer) return integer;


  -- function get_win_slope_8l(slope : integer) return roi_mbar_layer_large_t;
  -- function get_win_slope_6l(station_index, slope : integer) return roi_mbar_layer_small_t;

  
end package roi_func_pkg;

package body roi_func_pkg is

  -- function get_win_slope_8l(slope : integer) return roi_mbar_layer_large_t is
  --   variable y : roi_mbar_layer_large_t;
  --   variable station : roi_mbar_lut_large_t(14 - 1 downto 0);
  -- begin

  --   station := ROI_BILA3_ANGLE_MEM;

  --   if slope > 11704 then
  --     y := station(13);
  --   elsif slope >   3822 then
  --     y := station(12);
  --   elsif slope >   2196 then
  --     y := station(11);
  --   elsif slope >   1462 then
  --     y := station(10);
  --   elsif slope >   1220 then
  --     y := station(9);
  --   elsif slope >   1024 then
  --     y := station(8);
  --   elsif slope >    859 then
  --     y := station(7);
  --   elsif slope >    717 then
  --     y := station(6);
  --   elsif slope >    591 then
  --     y := station(5);
  --   elsif slope >    477 then
  --     y := station(4);
  --   elsif slope >    373 then
  --     y := station(3);
  --   elsif slope >    274 then
  --     y := station(2);
  --   elsif slope >    181 then  
  --     y := station(1);
  --   else 
  --     y := station(0);
  --   end if;
  --   return y;
  -- end function;

  -- function get_win_slope_6l( station_index , slope : integer) return roi_mbar_layer_small_t is
  --   variable y : roi_mbar_layer_small_t;
  --   variable station : roi_mbar_lut_small_t(14 - 1 downto 0);
  -- begin

  --   if station_index = 1 then
  --     station := ROI_BMLA3_ANGLE_MEM;
  --   elsif station_index = 2 then
  --     station := ROI_BOLA3_ANGLE_MEM;
  --   else
  --     -- ERROR
  --   end if;
  --   if slope > 11704 then
  --     y := station(13);
  --   elsif slope >   3822 then
  --     y := station(12);
  --   elsif slope >   2196 then
  --     y := station(11);
  --   elsif slope >   1462 then
  --     y := station(10);
  --   elsif slope >   1220 then
  --     y := station(9);
  --   elsif slope >   1024 then
  --     y := station(8);
  --   elsif slope >    859 then
  --     y := station(7);
  --   elsif slope >    717 then
  --     y := station(6);
  --   elsif slope >    591 then
  --     y := station(5);
  --   elsif slope >    477 then
  --     y := station(4);
  --   elsif slope >    373 then
  --     y := station(3);
  --   elsif slope >    274 then
  --     y := station(2);
  --   elsif slope >    181 then  
  --     y := station(1);
  --   else 
  --     y := station(0);
  --   end if;
  --   return y;
  -- end function;

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

  function get_roi_z_tubes_std(station : integer) return roi_z_lut_std_t is
    -- variable out_mem : roi_mbar_lut_std(0 to get_roi_mbar_max(station) - 1) := (others => (others => '0')) ;
    variable out_mem : roi_z_lut_std_t(0 to get_roi_z_max(station) - 1);
  begin

    if c_SECTOR_ID = 0 then
    elsif c_SECTOR_ID = 3 then
      if station = 0 then
        for i in 0 to ROM_BILA3_Z_MAX_SIZE - 1 loop
          out_mem(i) := std_logic_vector(to_unsigned(ROI_BILA3_Z_MEM(i)(0),MDT_TUBE_LEN)) &
                        std_logic_vector(to_unsigned(ROI_BILA3_Z_MEM(i)(1),MDT_TUBE_LEN));
        end loop;
        
      elsif station = 1 then
        -- out_mem := ROI_BMLA3_Z_MEM;
        for i in 0 to ROM_BMLA3_Z_MAX_SIZE - 1 loop
          out_mem(i) := std_logic_vector(to_unsigned(ROI_BMLA3_Z_MEM(i)(0),MDT_TUBE_LEN)) &
                        std_logic_vector(to_unsigned(ROI_BMLA3_Z_MEM(i)(1),MDT_TUBE_LEN));
        end loop;
      elsif station = 2 then
        -- out_mem := ROI_BOLA3_Z_MEM;
        for i in 0 to ROM_BOLA3_Z_MAX_SIZE - 1 loop
          out_mem(i) := std_logic_vector(to_unsigned(ROI_BOLA3_Z_MEM(i)(0),MDT_TUBE_LEN)) &
                        std_logic_vector(to_unsigned(ROI_BOLA3_Z_MEM(i)(1),MDT_TUBE_LEN));
        end loop;
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
  
  -------------------------
  -- VHDL-2001
  -------------------------
  function get_roi_mbar_tubes(station : integer) return roi_mbar_lut_small_t is
    -- variable out_mem : roi_mbar_lut_std(0 to get_roi_mbar_max(station) - 1) := (others => (others => '0')) ;
    variable out_mem : roi_mbar_lut_small_t(get_roi_mbar_max(station) - 1 downto 0);
  begin

    if c_SECTOR_ID = 0 then
    elsif c_SECTOR_ID = 3 then
      if station = 0 then
        -- out_mem := ROI_BILA3_ANGLE_MEM;
        -- ERROR
      elsif station = 1 then
        out_mem := ROI_BMLA3_ANGLE_MEM;
      elsif station = 2 then
        out_mem := ROI_BOLA3_ANGLE_MEM;
      -- elsif station = 3 then
      end if;
    else
    end if;
    --
    return out_mem;
  end function;

  function get_roi_mbar_tubes_std(station : integer) return roi_mbar_lut_large_std_t is
    -- variable out_mem : roi_mbar_lut_std(0 to get_roi_mbar_max(station) - 1) := (others => (others => '0')) ;
    variable out_mem : roi_mbar_lut_large_std_t;--roi_mbar_lut_small_t(get_roi_mbar_max(station) - 1 downto 0);
  begin

    if c_SECTOR_ID = 0 then
    elsif c_SECTOR_ID = 3 then
      if station = 0 then
        mem_init : for i in 0 to 2047 loop
          out_mem(i) := std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(7)(0),MDT_TUBE_LEN)) &
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(7)(1),MDT_TUBE_LEN)) &
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(6)(0),MDT_TUBE_LEN)) & 
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(6)(1),MDT_TUBE_LEN)) &
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(5)(0),MDT_TUBE_LEN)) & 
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(5)(1),MDT_TUBE_LEN)) &
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(4)(0),MDT_TUBE_LEN)) & 
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(4)(1),MDT_TUBE_LEN)) &
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(3)(0),MDT_TUBE_LEN)) & 
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(3)(1),MDT_TUBE_LEN)) &
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(2)(0),MDT_TUBE_LEN)) & 
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(2)(1),MDT_TUBE_LEN)) &
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(1)(0),MDT_TUBE_LEN)) & 
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(1)(1),MDT_TUBE_LEN)) &
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(0)(0),MDT_TUBE_LEN)) & 
                        std_logic_vector(to_signed(ROI_BILA3_ANGLE_MEM(i)(0)(1),MDT_TUBE_LEN));
        end loop ;
        -- ERROR
      -- elsif station = 1 then
      --   out_mem := ROI_BMLA3_ANGLE_MEM;
      -- elsif station = 2 then
      --   out_mem := ROI_BOLA3_ANGLE_MEM;
      -- elsif station = 3 then
      end if;
    else
    end if;
    --
    return out_mem;
  end function;

  function get_roi_mbar_tubes(station : integer) return roi_mbar_lut_large_t is
    -- variable out_mem : roi_mbar_lut_std(0 to get_roi_mbar_max(station) - 1) := (others => (others => '0')) ;
    variable out_mem : roi_mbar_lut_large_t(get_roi_mbar_max(station) - 1 downto 0);
  begin

    if c_SECTOR_ID = 0 then
    elsif c_SECTOR_ID = 3 then
      if station = 0 then
        out_mem := ROI_BILA3_ANGLE_MEM;
      -- elsif station = 1 then
      --   out_mem := ROI_BMLA3_ANGLE_MEM;
      -- elsif station = 2 then
      --   out_mem := ROI_BOLA3_ANGLE_MEM;
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
        out_max := ROM_BILA3_ANGLE_MAX_SIZE;
      elsif station = 1 then
        out_max := ROM_BMLA3_ANGLE_MAX_SIZE;
      elsif station = 2 then
        out_max := ROM_BOLA3_ANGLE_MAX_SIZE;
      -- elsif station = 3 then
      end if;
    else
    end if;
    --
    return out_max;
  end function;

    -------------------------
  -- VHDL-2008
  -------------------------
  
  -- function get_roi_mbar_tubes(station : integer) return roi_mbar_lut_t is
  --   -- variable out_mem : roi_mbar_lut_std(0 to get_roi_mbar_max(station) - 1) := (others => (others => '0')) ;
  --   variable out_mem : roi_mbar_lut_t(get_roi_mbar_max(station) - 1 downto 0)(0 to get_num_layers(station) -1);
  -- begin

  --   if c_SECTOR_ID = 0 then
  --   elsif c_SECTOR_ID = 3 then
  --     if station = 0 then
  --       out_mem := ROI_BILA3_ANGLE_MEM;
  --     elsif station = 1 then
  --       out_mem := ROI_BMLA3_ANGLE_MEM;
  --     elsif station = 2 then
  --       out_mem := ROI_BOLA3_ANGLE_MEM;
  --     -- elsif station = 3 then
  --     end if;
  --   else
  --   end if;
  --   --
  --   return out_mem;
  -- end function;

  
end package body roi_func_pkg;
