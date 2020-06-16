--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------  
--  Project: ATLAS L0MDT Trigger 
--  Module: Hit Processor drift time and T0 compensation
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      14/02/2019  0.1     File created
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

package hps_rom_b_t0_pkg is
  -- integer values for T0 with 0.78 ns resolution
  -- T0 = ToF + t0
  -- t0 = 817

  type t0LUT_chamber_t is array (1 to 8) of integer;
  type t0LUT_station_t is array (1 to 16) of t0LUT_chamber_t;
  
  constant c_BI_T0 : t0LUT_station_t :=(
    1  => (0,0,0,0,0,0,0,0), 
    2  => (0,0,0,0,0,0,0,0),
    3  => (1068,1069,1071,1074,1077,1080,0,0),
    4  => (0,0,0,0,0,0,0,0),
    5  => (0,0,0,0,0,0,0,0),
    6  => (0,0,0,0,0,0,0,0),
    7  => (0,0,0,0,0,0,0,0),
    8  => (0,0,0,0,0,0,0,0),
    9  => (0,0,0,0,0,0,0,0),
    10 => (0,0,0,0,0,0,0,0),
    11 => (0,0,0,0,0,0,0,0),
    12 => (0,0,0,0,0,0,0,0),
    13 => (0,0,0,0,0,0,0,0),
    14 => (0,0,0,0,0,0,0,0),
    15 => (0,0,0,0,0,0,0,0),
    16 => (0,0,0,0,0,0,0,0)
  );

  constant c_BM_T0 : t0LUT_station_t :=(
    1  => (0,0,0,0,0,0,0,0), 
    2  => (0,0,0,0,0,0,0,0),
    3  => (1078,1080,1083,1086,1090,1094,0,0),
    4  => (0,0,0,0,0,0,0,0),
    5  => (0,0,0,0,0,0,0,0),
    6  => (0,0,0,0,0,0,0,0),
    7  => (0,0,0,0,0,0,0,0),
    8  => (0,0,0,0,0,0,0,0),
    9  => (0,0,0,0,0,0,0,0),
    10 => (0,0,0,0,0,0,0,0),
    11 => (0,0,0,0,0,0,0,0),
    12 => (0,0,0,0,0,0,0,0),
    13 => (0,0,0,0,0,0,0,0),
    14 => (0,0,0,0,0,0,0,0),
    15 => (0,0,0,0,0,0,0,0),
    16 => (0,0,0,0,0,0,0,0)
  );

  constant c_BO_T0 : t0LUT_station_t :=(
    1  => (0,0,0,0,0,0,0,0), 
    2  => (0,0,0,0,0,0,0,0),
    3  => (1088,1090,1094,1099,1104,1110,0,0),
    4  => (0,0,0,0,0,0,0,0),
    5  => (0,0,0,0,0,0,0,0),
    6  => (0,0,0,0,0,0,0,0),
    7  => (0,0,0,0,0,0,0,0),
    8  => (0,0,0,0,0,0,0,0),
    9  => (0,0,0,0,0,0,0,0),
    10 => (0,0,0,0,0,0,0,0),
    11 => (0,0,0,0,0,0,0,0),
    12 => (0,0,0,0,0,0,0,0),
    13 => (0,0,0,0,0,0,0,0),
    14 => (0,0,0,0,0,0,0,0),
    15 => (0,0,0,0,0,0,0,0),
    16 => (0,0,0,0,0,0,0,0)
  );
    


    
end package hps_rom_b_t0_pkg;