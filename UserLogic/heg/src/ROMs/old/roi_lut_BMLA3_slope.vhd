--------------------------------------------------------------------------------
--  UMass , Physics Department               
--  Yuan-Tang Chou                           
--  yuan-tang.chou@cern.ch                         
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger             
--  Module: 1/slope to tube number offset
--  Multiplier: 1024 
--  slope are defined with angle relative to beam line
--  Description: Autogenerated file          
--                                           
--------------------------------------------------------------------------------
--  Revisions: 
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library heg_roi_lib;
use heg_roi_lib.roi_types_pkg.all;

package roi_lut_BMLA3_slope is

  -- add length of constant array
  constant ROM_BMLA3_SLOPE_MAX_SIZE : integer := 1024;

-- VHDL2008 --  constant ROI_BMLA3_SLOPE_MEM : roi_mbar_lut_t(ROM_BMLA3_SLOPE_MAX_SIZE - 1 downto 0)(0 to 5) := (
  constant ROI_BMLA3_SLOPE_MEM : roi_mbar_lut_small_t(ROM_BMLA3_SLOPE_MAX_SIZE - 1 downto 0) := (

    1023 downto 859 => ((-5,5),(-4,6),(-3,7),(5,15),(6,16),(6,16)), -- from 45 to 50 degree 
    858  downto 717 => ((-5,5),(-4,6),(-4,6),(3,13),(4,14),(5,15)), -- from 50 to 55 degree 
    716  downto 477 => ((-5,5),(-5,5),(-4,6),(1,11),(1,11),(2,12)), -- from 55 to 65 degree 
    476  downto 274 => ((-5,5),(-5,5),(-5,5),(-1,9),(-1,9),(-1,9)), -- from 65 to 75 degree 
    273  downto  90 => ((-5,5),(-5,5),(-5,5),(-4,6),(-3,7),(-3,7)), -- from 75 to 85 degree 
    89   downto   0 => ((-5,5),(-5,5),(-5,5),(-5,5),(-5,5),(-5,5))  -- from 85 to 90 degree 
  );

 end package roi_lut_BMLA3_slope;
