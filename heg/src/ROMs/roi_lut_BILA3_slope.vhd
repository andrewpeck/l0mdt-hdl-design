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
  constant ROM_BILA3_MAX_SIZE : integer := 1024;

  constant ROI_BILA3_SLOPE_MEM : roi_mbar_lut(ROM_BILA3_MAX_SIZE - 1 downto 0) := (

    1023 downto 858 => vectorify( ((-13,-3),(-12,-2),(-11,-1),(-10,0),(-8,2),(-7,3),(-6,4),(-5,5)) ), -- from 45 to 50 degree 
    859  downto 716 => vectorify( ((-12,-2),(-11,-1),(-10,0) ,(-9,1) ,(-7,3),(-6,4),(-6,4),(-5,5)) ), -- from 50 to 55 degree 
    717  downto 476 => vectorify( ((-10,0) ,(-9,1)  ,(-9,1)  ,(-8,2) ,(-7,3),(-6,4),(-5,5),(-5,5)) ), -- from 55 to 65 degree 
    477  downto 273 => vectorify( ((-8,2)  ,(-7,3)  ,(-7,3)  ,(-7,3) ,(-6,4),(-5,5),(-5,5),(-5,5)) ), -- from 65 to 75 degree 
    274  downto 89  => vectorify( ((-6,4)  ,(-6,4)  ,(-6,4)  ,(-6,4) ,(-5,5),(-5,5),(-5,5),(-5,5)) ), -- from 75 to 85 degree 
    90   downto 0   => vectorify( ((-5,5)  ,(-5,5)  ,(-5,5)  ,(-5,5) ,(-5,5),(-5,5),(-5,5),(-5,5)) )  -- from 85 to 90 degree 
  );

 end package roi_lut_BILA3_slope;
