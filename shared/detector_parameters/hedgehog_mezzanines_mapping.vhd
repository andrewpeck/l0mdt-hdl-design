--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Tube address map for hedgehog mezzanine PCBs
--  Description: this file will be auto generated ( in the future) 
--
--------------------------------------------------------------------------------
--  Sector : All
--  Side   : All
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package hedgehog_mezzanines_mapping is
  
  type hh_mezz_param_t is array (0 to 1) of integer; -- layer , tube
  type hh_mezz_t is array(0 to 23) of hh_mezz_param_t;
  
  -- 3 -   | 03 | 07 | 11 | 15 | 19 | 23 |
  -- 2 - | 02 | 06 | 10 | 14 | 18 | 22 |
  -- 1 -   | 01 | 05 | 09 | 13 | 17 | 21 |
  -- 0 - | 00 | 04 | 08 | 12 | 16 | 20 |
  constant hh_mezz_type_A : hh_mezz_t := (
     0 => (0,0)
     1 => (1,0)
     2 => (2,0)
     3 => (3,0)
     4 => (0,1)
     5 => (1,1)
     6 => (2,1)
     7 => (3,1)
     8 => (0,2)
     9 => (1,2)
    10 => (2,2)
    11 => (3,2)
    12 => (0,3)
    13 => (1,3)
    14 => (2,3)
    15 => (3,3)
    16 => (0,4)
    17 => (1,4)
    18 => (2,4)
    19 => (3,4)
    20 => (0,5)
    21 => (1,5)
    22 => (2,5)
    23 => (3,5)
  )


  -- 2 - | 02 | 05 | 08 | 11 | 14 | 17 | 20 | 23 |
  -- 1 -   | 01 | 04 | 07 | 10 | 13 | 16 | 19 | 22 |
  -- 0 - | 00 | 03 | 06 | 09 | 12 | 15 | 18 | 21 |
  constant hh_mezz_type_B : hh_mezz_t := (
    0 => (0,0)
    1 => (1,0)
    2 => (2,0)
    3 => (0,1)
    4 => (1,1)
    5 => (2,1)
    6 => (0,2)
    7 => (1,2)
    8 => (2,2)
    9 => (0,3)
   10 => (1,3)
   11 => (2,3)
   12 => (0,4)
   13 => (1,4)
   14 => (2,4)
   15 => (0,5)
   16 => (1,5)
   17 => (2,5)
   18 => (0,6)
   19 => (1,6)
   20 => (2,6)
   21 => (0,7)
   22 => (1,7)
   23 => (2,7)
 )
  
end package hedgehog_mezzanines_mapping;

