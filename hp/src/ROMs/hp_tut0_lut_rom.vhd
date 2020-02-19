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

library l0mdt_lib;
use l0mdt_lib.common_pkg.all;

library hp_lib;
use hp_lib.cfg_pkg.all;
use hp_lib.hp_pkg.all;

package hp_t0lut_rom is

    type t0LUT_layer_t is array (0 to 7) of integer;
    type t0LUT_station_t is array (0 to 5) of t0LUT_layer_t;
    type t0Lut_sector_t is array ( 0 to 3) of t0LUT_station_t;
    
    constant t0_ie_rom_mem : t0LUT_station_t :=(
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7)
    );

    constant t0_me_rom_mem : t0LUT_station_t :=(
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7)
    );

    constant t0_oe_rom_mem : t0LUT_station_t :=(
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7)
    );

    constant t0_ee_rom_mem : t0LUT_station_t :=(
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7),
        (0,1,2,3,4,5,6,7)
    );

    constant t0LUT_e_mem : t0Lut_sector_t :=(
        t0_ie_rom_mem , t0_me_rom_mem , t0_oe_rom_mem , t0_ee_rom_mem
    );
    
end package hp_t0lut_rom;