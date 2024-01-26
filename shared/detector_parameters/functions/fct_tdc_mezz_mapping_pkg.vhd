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
-- use shared_lib.detector_param_pkg.all;
use shared_lib.config_pkg.all;

library dp_repo_lib;
use dp_repo_lib.tdc_mezz_mapping_pkg.all;

package fct_tdc_mezz_mapping_pkg is
  
  -- type hh_mezz_param_t is array (0 to 1) of integer; -- layer , tube
  -- type hh_mezz_t is array(0 to 23) of hh_mezz_param_t;
  

  -- constant hh_mdt_mezz_type_I_right : hh_mezz_t := (
    --   -- 2 - | 01 | 03 | 05 | 07 | 06 | 00 | 04 | 02 |
    --   -- 1 -   | 09 | 11 | 13 | 15 | 14 | 08 | 12 | 10 |
    --   -- 0 - | 17 | 19 | 21 | 23 | 22 | 16 | 20 | 18 |
    --   -- IP -------------------------------------------> Z
    --   0 => (2,5),
    --   1 => (2,0),
    --   2 => (2,7),
    --   3 => (2,1),
    --   4 => (2,6),
    --   5 => (2,2),
    --   6 => (2,4),
    --   7 => (2,3),
    --   8 => (1,5),
    --   9 => (1,0),
    --  10 => (1,7),
    --  11 => (1,1),
    --  12 => (1,6),
    --  13 => (1,2),
    --  14 => (1,4),
    --  15 => (1,3),
    --  16 => (0,5),
    --  17 => (0,0),
    --  18 => (0,7),
    --  19 => (0,1),
    --  20 => (0,6),
    --  21 => (0,2),
    --  22 => (0,4),
    --  23 => (0,3)
    -- );

  -- constant hh_mdt_mezz_type_I_left : hh_mezz_t := (
    --   -- 2 -   | 18 | 20 | 16 | 22 | 23 | 21 | 19 | 17 |
    --   -- 1 - | 10 | 12 | 08 | 14 | 15 | 13 | 11 | 09 |
    --   -- 0 -   | 02 | 04 | 00 | 06 | 07 | 05 | 03 | 01 |
    --   -- Z <------------------------------------------------ IP
    --   0 => (0,5),
    --   1 => (0,0),
    --   2 => (0,7),
    --   3 => (0,1),
    --   4 => (0,6),
    --   5 => (0,2),
    --   6 => (0,4),
    --   7 => (0,3),
    --   8 => (1,5),
    --   9 => (1,0),
    --   10 => (1,7),
    --   11 => (1,1),
    --   12 => (1,6),
    --   13 => (1,2),
    --   14 => (1,4),
    --   15 => (1,3),
    --   16 => (2,5),
    --   17 => (2,0),
    --   18 => (2,7),
    --   19 => (2,1),
    --   20 => (2,6),
    --   21 => (2,2),
    --   22 => (2,4),
    --   23 => (2,3)
    -- );

  -- constant hh_mdt_mezz_type_II_right : hh_mezz_t := (
    --   -- 2 - | 01 | 03 | 05 | 07 | 06 | 04 | 02 | 00 |
    --   -- 1 -   | 09 | 11 | 13 | 15 | 14 | 12 | 10 | 08 |
    --   -- 0 - | 17 | 19 | 21 | 23 | 22 | 20 | 18 | 16 |
    --   -- IP -------------------------------------------> Z
    --    0 => (2,7),
    --    1 => (2,0),
    --    2 => (2,6),
    --    3 => (2,1),
    --    4 => (2,5),
    --    5 => (2,2),
    --    6 => (2,4),
    --    7 => (2,3),
    --    8 => (1,7),
    --    9 => (1,0),
    --   10 => (1,6),
    --   11 => (1,1),
    --   12 => (1,5),
    --   13 => (1,2),
    --   14 => (1,4),
    --   15 => (1,3),
    --   16 => (0,7),
    --   17 => (0,0),
    --   18 => (0,6),
    --   19 => (0,1),
    --   20 => (0,5),
    --   21 => (0,2),
    --   22 => (0,4),
    --   23 => (0,3)
    -- );

  -- constant hh_mdt_mezz_type_II_left : hh_mezz_t := (
    --   -- 2 -   | 16 | 18 | 20 | 22 | 23 | 21 | 19 | 17 |
    --   -- 1 - | 08 | 10 | 12 | 14 | 15 | 13 | 11 | 09 |
    --   -- 0 -   | 00 | 02 | 04 | 06 | 07 | 05 | 03 | 01 |
    --   -- Z <------------------------------------------------ IP
    --    0 => (0,7),
    --    1 => (0,0),
    --    2 => (0,6),
    --    3 => (0,1),
    --    4 => (0,5),
    --    5 => (0,2),
    --    6 => (0,4),
    --    7 => (0,3),
    --    8 => (1,7),
    --    9 => (1,0),
    --   10 => (1,6),
    --   11 => (1,1),
    --   12 => (1,5),
    --   13 => (1,2),
    --   14 => (1,4),
    --   15 => (1,3),
    --   16 => (2,7),
    --   17 => (2,0),
    --   18 => (2,6),
    --   19 => (2,1),
    --   20 => (2,5),
    --   21 => (2,2),
    --   22 => (2,4),
    --   23 => (2,3)
    -- );


  -- constant hh_mdt_mezz_type_III_right : hh_mezz_t := (
    --   -- 3 -   | 19 | 18 | 20 | 22 | 21 | 23 |
    --   -- 2 - | 13 | 12 | 14 | 16 | 15 | 17 |
    --   -- 1 -   | 07 | 06 | 08 | 10 | 09 | 11 |
    --   -- 0 - | 01 | 00 | 02 | 04 | 03 | 05 |
    --   -- IP -------------------------------------------> Z
    --    0 => (0,1),
    --    1 => (0,0),
    --    2 => (0,2),
    --    3 => (0,4),
    --    4 => (0,3),
    --    5 => (0,5),
    --    6 => (1,1),
    --    7 => (1,0),
    --    8 => (1,2),
    --    9 => (1,4),
    --   10 => (1,3),
    --   11 => (1,5),
    --   12 => (2,1),
    --   13 => (2,0),
    --   14 => (2,2),
    --   15 => (2,4),
    --   16 => (2,3),
    --   17 => (2,5),
    --   18 => (3,1),
    --   19 => (3,0),
    --   20 => (3,2),
    --   21 => (3,4),
    --   22 => (3,3),
    --   23 => (3,5)
    -- );

  -- constant hh_mdt_mezz_type_III_left : hh_mezz_t := (
    --   -- 3 -   | 05 | 03 | 04 | 02 | 00 | 01 |
    --   -- 2 - | 11 | 09 | 10 | 08 | 06 | 07 |
    --   -- 1 -   | 17 | 15 | 16 | 14 | 12 | 13 |
    --   -- 0 - | 23 | 21 | 22 | 20 | 18 | 19 |
    --   -- Z <------------------------------------------------ IP
    --    0 => (3,1),
    --    1 => (3,0),
    --    2 => (3,2),
    --    3 => (3,4),
    --    4 => (3,3),
    --    5 => (3,5),
    --    6 => (2,1),
    --    7 => (2,0),
    --    8 => (2,2),
    --    9 => (2,4),
    --   10 => (2,3),
    --   11 => (2,5),
    --   12 => (1,1),
    --   13 => (1,0),
    --   14 => (1,2),
    --   15 => (1,4),
    --   16 => (1,3),
    --   17 => (1,5),
    --   18 => (0,1),
    --   19 => (0,0),
    --   20 => (0,2),
    --   21 => (0,4),
    --   22 => (0,3),
    --   23 => (0,5)
    -- );

  -- constant hh_mdt_mezz_type_IV_right : hh_mezz_t := (
    --   -- 3 -   | 22 | 20 | 18 | 23 | 21 | 19 |
    --   -- 2 - | 16 | 14 | 12 | 17 | 13 | 15 |
    --   -- 1 -   | 10 | 08 | 06 | 11 | 07 | 09 |
    --   -- 0 - | 04 | 02 | 00 | 05 | 01 | 03 |
    --   -- IP -------------------------------------------> Z
    --    0 => (0,2),
    --    1 => (0,4),
    --    2 => (0,1),
    --    3 => (0,5),
    --    4 => (0,0),
    --    5 => (0,3),
    --    6 => (1,2),
    --    7 => (1,4),
    --    8 => (1,1),
    --    9 => (1,5),
    --   10 => (1,0),
    --   11 => (1,3),
    --   12 => (2,2),
    --   13 => (2,4),
    --   14 => (2,1),
    --   15 => (2,5),
    --   16 => (2,0),
    --   17 => (2,3),
    --   18 => (3,2),
    --   19 => (3,5),
    --   20 => (3,1),
    --   21 => (3,4),
    --   22 => (3,0),
    --   23 => (3,4)
    -- );

  -- constant hh_mdt_mezz_type_IV_left : hh_mezz_t := (
    --   -- 3 -   | 03 | 01 | 05 | 00 | 02 | 04 |
    --   -- 2 - | 09 | 07 | 11 | 06 | 08 | 10 |
    --   -- 1 -   | 15 | 13 | 17 | 12 | 14 | 16 |
    --   -- 0 - | 19 | 21 | 23 | 18 | 20 | 22 |
    --   -- Z <------------------------------------------------ IP
    --    0 => (3,2),
    --    1 => (3,4),
    --    2 => (3,1),
    --    3 => (3,5),
    --    4 => (3,0),
    --    5 => (3,3),
    --    6 => (2,2),
    --    7 => (2,4),
    --    8 => (2,1),
    --    9 => (2,5),
    --   10 => (2,0),
    --   11 => (2,3),
    --   12 => (1,2),
    --   13 => (1,4),
    --   14 => (1,1),
    --   15 => (1,5),
    --   16 => (1,0),
    --   17 => (1,3),
    --   18 => (0,2),
    --   19 => (0,5),
    --   20 => (0,1),
    --   21 => (0,4),
    --   22 => (0,0),
    --   23 => (0,4)
    -- );


  type hh_mdt_mezz_map_t is array (0 to 23) of integer;
  function get_tdc_tube_map(station : integer; multilayer : integer; t_nl : integer) return hh_mdt_mezz_map_t;

  -- type chamb_b_station_numch_t is array(0 to 15) of integer;
  -- type chamb_b_station_side_t is array(0 to 1) of chamb_b_station_numch_t;

  -- constant num_chamb_b_inn_station : chamb_b_station_side_t :=(
    --   (6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6),
    --   (6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6)
    -- );

  -- constant num_chamb_b_mid_station : chamb_b_station_side_t :=(
  --   (6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6),
  --   (6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6)
  -- );

  -- constant num_chamb_b_out_station : chamb_b_station_side_t :=(
  --   (6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6),
  --   (6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6)
  -- );

  -- constant num_chamb_b_ext_station : chamb_b_station_side_t :=(
  --   (6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6),
  --   (6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6)
  -- );

  function get_num_tubes_layer_station(sr: integer) return integer;

  -- function get_num_chamb( ) return integer;

  subtype mezz_b_chamber_dist_chamber_t is dp_mezz_b_chamber_dist_chamber_t;
  -- type mezz_b_chamber_dist_chamber_t is array (0 to MAX _NUM_CHAMBER_POS - 1) of integer;
  -- type mezz_b_chamber_dist_side_t is array ( 0 to 1) of mezz_b_chamber_dist_chamber_t;
  -- type mezz_b_chamber_dist_t is array (0 to 15) of mezz_b_chamber_dist_side_t;

  -- constant accum_mezz_barrel_inn_chamber_dist : mezz_b_chamber_dist_t := (
    --    0 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --    1 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --    2 => ((0,10,22,32,44,54,66,0),(0,10,22,32,44,54,66,0)),
    --    3 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --    4 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --    5 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --    6 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --    7 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --    8 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --    9 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   10 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   11 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   12 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   13 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   14 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   15 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0))
    -- );

  -- constant num_mezz_barrel_inn_chamber_dist : mezz_b_chamber_dist_t := (
    --   0 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   1 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   2 => ((10,12,10,12,10,12,0,0),(0,0,0,0,0,0,0,0)),
    --   3 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   4 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   5 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   6 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   7 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   8 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   9 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   10 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   11 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   12 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   13 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   14 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   15 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0))
    -- );

  -- constant accum_mezz_barrel_mid_chamber_dist : mezz_b_chamber_dist_t := (
    --   0 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   1 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   2 => ((0,14,28,42,52,62,74,0),(0,12,26,40,50,60,72,0)),
    --   3 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   4 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   5 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   6 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   7 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   8 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   9 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   10 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   11 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   12 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   13 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   14 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   15 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0))
    -- );

  -- constant num_mezz_barrel_mid_chamber_dist : mezz_b_chamber_dist_t := (
    --   0 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   1 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   2 => ((14,14,14,10,10,12,0,0),(0,0,0,0,0,0,0,0)),
    --   3 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   4 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   5 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   6 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   7 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   8 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   9 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   10 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   11 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   12 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   13 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   14 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   15 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0))
    -- );

  -- constant accum_mezz_barrel_out_chamber_dist : mezz_b_chamber_dist_t := (
    --   0 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   1 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   2 => ((0,18,36,50,68,86,100,0),(0,12,30,44,62,80,94,0)),
    --   3 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   4 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   5 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   6 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   7 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   8 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   9 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   10 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   11 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   12 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   13 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   14 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   15 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0))
    -- );

  -- constant num_mezz_barrel_out_chamber_dist : mezz_b_chamber_dist_t := (
    --   0 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   1 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   2 => ((18,18,14,18,18,14,0,0),(0,0,0,0,0,0,0,0)),
    --   3 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   4 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   5 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   6 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   7 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   8 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   9 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   10 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   11 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   12 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   13 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   14 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   15 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0))
    -- );

  -- constant accum_mezz_barrel_ext_chamber_dist : mezz_b_chamber_dist_t := (
    --   0 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   1 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   2 => ((0,10,22,32,44,54,64,0),(0,0,0,0,0,0,0,0)),
    --   3 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   4 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   5 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   6 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   7 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   8 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   9 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   10 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   11 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   12 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   13 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   14 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   15 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0))
    -- );

  -- constant num_mezz_barrel_ext_chamber_dist : mezz_b_chamber_dist_t := (
    --   0 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   1 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   2 => ((10,12,10,12,10,12,0,0),(0,0,0,0,0,0,0,0)),
    --   3 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   4 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   5 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   6 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   7 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   8 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   9 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   10 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   11 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   12 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   13 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   14 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0)),
    --   15 => ((0,0,0,0,0,0,0,0),(0,0,0,0,0,0,0,0))
    -- );


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
