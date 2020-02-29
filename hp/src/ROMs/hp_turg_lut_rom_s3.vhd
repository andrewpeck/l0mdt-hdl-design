--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module: Tube range LUT for sector 3
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--    05/02/2020  0.1  File created
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package hp_trLUT_s3_pkg is

    type trLUT_limits_t is array (0 to 1) of integer;
    
    type trLUT_layer_t is array (0 to 7) of trLUT_limits_t; -- 1 layer has up to 435 tubes
    
    type trLUT_station_t is array (0 to 5) of trLUT_layer_t; -- 1 station has up to 8 layers

    type trLut_sector_t is array ( 0 to 3) of trLUT_station_t; -- 1 sector has 4 station

    constant trLUT_s3i_rom_mem : trLUT_station_t := (
        ((1,1),(1,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8)),
        ((2,1),(2,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8)),
        ((3,1),(3,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8)),
        ((4,1),(4,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8)),
        ((5,1),(5,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8)),
        ((6,1),(6,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8))
    );

    constant trLUT_s3m_rom_mem : trLUT_station_t := (
        (others => (others => (0,0)))
    );
    

    constant trLUT_s3o_rom_mem : trLUT_station_t := (
        (others => (others => (0,0)))
    );

    constant trLUT_s3e_rom_mem : trLUT_station_t := (
        (others => (others => (0,0)))
    );

    constant trLUT_s3_mem : trLut_sector_t :=(
        trLUT_s3i_rom_mem , trLUT_s3m_rom_mem , trLUT_s3o_rom_mem , trLUT_s3e_rom_mem
    );



end package hp_trLUT_s3_pkg;