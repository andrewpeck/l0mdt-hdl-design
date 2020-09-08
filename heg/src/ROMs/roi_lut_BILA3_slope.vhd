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

package roi_lut_BILA3_slope is

  -- add length of constant array
  constant ROM_BILA3_SLOPE_MAX_SIZE : integer := 2047;

-- VHDL2008  -- constant ROI_BILA3_SLOPE_MEM : roi_mbar_lut_t(ROM_BILA3_SLOPE_MAX_SIZE - 1 downto 0)(0 to 5) := (
  constant ROI_BILA3_ANGLE_MEM : roi_mbar_lut_large_t(ROM_BILA3_ANGLE_MAX_SIZE - 1 downto 0) := (
    2047 downto 1921 => ( ( -3,  7),( -4,  6),( -4,  6),( -6,  4),( -6,  4),( -7,  3) ), -- from 117.28 to 110 degree 
    1920 downto 1834 => ( ( -4,  6),( -4,  6),( -4,  6),( -6,  4),( -6,  4),( -6,  4) ), -- from 110 to 105 degree 
    1833 downto 1746 => ( ( -4,  6),( -5,  5),( -5,  5),( -5,  5),( -5,  5),( -6,  4) ), -- from 105 to 100 degree 
    1745 downto 1659 => ( ( -5,  5),( -5,  5),( -5,  5),( -5,  5),( -5,  5),( -5,  5) ), -- from 100 to 95 degree 
    1658 downto 1485 => ( ( -5,  5),( -5,  5),( -5,  5),( -5,  5),( -5,  5),( -5,  5) ), -- from 95 to 85 degree 
    1484 downto 1310 => ( ( -5,  5),( -5,  5),( -5,  5),( -5,  5),( -5,  5),( -5,  5) ), -- from 85 to 75 degree 
    1309 downto 1135 => ( ( -6,  4),( -6,  4),( -6,  4),( -4,  6),( -4,  6),( -4,  6) ), -- from 75 to 65 degree 
    1134 downto  961 => ( ( -8,  2),( -7,  3),( -6,  4),( -4,  6),( -3,  7),( -2,  8) ), -- from 65 to 55 degree 
     960 downto  874 => ( ( -9,  1),( -8,  2),( -7,  3),( -3,  7),( -2,  8),( -1,  9) ), -- from 55 to 50 degree 
     873 downto  786 => ( ( -9,  1),( -8,  2),( -8,  2),( -2,  8),( -2,  8),( -1,  9) ), -- from 50 to 45 degree 
     785 downto  699 => ( (-10,  0),( -9,  1),( -8,  2),( -2,  8),( -1,  9),(  0, 10) ), -- from 45 to 40 degree 
     698 downto  612 => ( (-11, -1),(-10,  0),( -9,  1),( -1,  9),(  0, 10),(  1, 11) ), -- from 40 to 35 degree 
     611 downto  525 => ( (-13, -3),(-11, -1),(-10,  0),(  0, 10),(  1, 11),(  3, 13) ), -- from 35 to 30 degree 
     524 downto  437 => ( (-15, -5),(-13, -3),(-11, -1),(  1, 11),(  3, 13),(  5, 15) ), -- from 30 to 25 degree 
     436 downto  350 => ( (-17, -7),(-15, -5),(-13, -3),(  3, 13),(  5, 15),(  7, 17) ), -- from 25 to 20 degree 
     349 downto  263 => ( (-21,-11),(-18, -8),(-15, -5),(  5, 15),(  8, 18),( 11, 21) ), -- from 20 to 15 degree 
     262 downto  176 => ( (-29,-19),(-24,-14),(-20,-10),( 10, 20),( 14, 24),( 19, 29) ), -- from 15 to 10 degree 
     175 downto   0 => ( (-45,-35),(-37,-27),(-30,-20),( 20, 30),( 27, 37),( 35, 45) )  -- from 10 to 5 degree 
  );

 end package roi_lut_BILA3_slope;

