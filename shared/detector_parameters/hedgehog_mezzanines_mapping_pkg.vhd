--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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

package hedgehog_mezzanines_mapping is
  
  type hh_mezz_param_t is array (0 to 1) of integer; -- layer , tube
  type hh_mezz_t is array(0 to 23) of hh_mezz_param_t;
  

  -- 0 - | 01 | 03 | 05 | 07 | 06 | 00 | 04 | 02 |
  -- 1 -   | 09 | 11 | 13 | 15 | 14 | 08 | 12 | 10 |
  -- 2 - | 17 | 19 | 21 | 23 | 22 | 16 | 20 | 18 |
  constant hh_mdt_mezz_type_I : hh_mezz_t := (
    0 => (0,5),
    1 => (0,0),
    2 => (0,7),
    3 => (0,1),
    4 => (0,6),
    5 => (0,2),
    6 => (0,4),
    7 => (0,3),
    8 => (1,5),
    9 => (1,0),
   10 => (1,7),
   11 => (1,1),
   12 => (1,6),
   13 => (1,2),
   14 => (1,4),
   15 => (1,3),
   16 => (2,5),
   17 => (2,0),
   18 => (2,7),
   19 => (2,1),
   20 => (2,6),
   21 => (2,2),
   22 => (2,4),
   23 => (2,3)
 );
  -- 0 - | 01 | 03 | 05 | 07 | 06 | 04 | 02 | 00 |
  -- 1 -   | 09 | 11 | 13 | 15 | 14 | 12 | 10 | 08 |
  -- 2 - | 17 | 19 | 21 | 23 | 22 | 20 | 18 | 16 |
  constant hh_mdt_mezz_type_II : hh_mezz_t := (
     0 => (0,7),
     1 => (0,0),
     2 => (0,6),
     3 => (0,1),
     4 => (0,5),
     5 => (0,2),
     6 => (0,4),
     7 => (0,3),
     8 => (1,7),
     9 => (1,0),
    10 => (1,6),
    11 => (1,1),
    12 => (1,5),
    13 => (1,2),
    14 => (1,4),
    15 => (1,3),
    16 => (2,7),
    17 => (2,0),
    18 => (2,6),
    19 => (2,1),
    20 => (2,5),
    21 => (2,2),
    22 => (2,4),
    23 => (2,3)
  );

  -- 0 -   | 05 | 03 | 04 | 02 | 00 | 01 |
  -- 1 - | 11 | 09 | 10 | 08 | 06 | 07 |
  -- 2 -   | 17 | 15 | 16 | 14 | 12 | 13 |
  -- 3 - | 23 | 21 | 22 | 20 | 18 | 19 |
  constant hh_mdt_mezz_type_III : hh_mezz_t := (
     0 => (0,4),
     1 => (0,3),
     2 => (0,5),
     3 => (0,1),
     4 => (0,2),
     5 => (0,0),
     6 => (1,4),
     7 => (1,3),
     8 => (1,5),
     9 => (1,1),
    10 => (1,2),
    11 => (1,0),
    12 => (2,4),
    13 => (2,3),
    14 => (2,5),
    15 => (2,1),
    16 => (2,2),
    17 => (2,0),
    18 => (3,4),
    19 => (3,3),
    20 => (3,5),
    21 => (3,1),
    22 => (3,2),
    23 => (3,0)
  );

  -- 0 -   | 03 | 01 | 05 | 00 | 02 | 04 |
  -- 1 - | 09 | 07 | 11 | 06 | 08 | 10 |
  -- 2 -   | 15 | 13 | 17 | 12 | 14 | 16 |
  -- 3 - | 19 | 21 | 23 | 18 | 20 | 22 |
  constant hh_mdt_mezz_type_IV : hh_mezz_t := (
     0 => (0,3),
     1 => (0,1),
     2 => (0,4),
     3 => (0,0),
     4 => (0,5),
     5 => (0,2),
     6 => (1,3),
     7 => (1,1),
     8 => (1,4),
     9 => (1,0),
    10 => (1,5),
    11 => (1,2),
    12 => (2,3),
    13 => (2,1),
    14 => (2,4),
    15 => (2,0),
    16 => (2,5),
    17 => (2,2),
    18 => (3,3),
    19 => (3,1),
    20 => (3,4),
    21 => (3,0),
    22 => (3,5),
    23 => (3,2)
  );
  
end package hedgehog_mezzanines_mapping;

