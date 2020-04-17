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

package heg_trLUT_s3_pkg is

    constant max_num_indexes : integer := 6;
    constant max_num_indexes_bits : integer := integer(log2(real(max_num_indexes)));

    type trLUT_limits_t is array (0 to 1) of integer;
    
    type trLUT_layer_t is array (0 to 7) of trLUT_limits_t; -- 1 layer has up to 435 tubes
    
    type trLUT_station_t is array (0 to max_num_indexes - 1) of trLUT_layer_t; -- 1 station has up to 8 layers

    type trLut_sector_t is array ( 0 to 3) of trLUT_station_t; -- 1 sector has 4 station

    constant trLUT_s3i_rom_mem : trLUT_station_t := (
        ((1,11),(11,12),(21,13),(31,14),(41,15),(51,16),(61,17),(71,18)),
        ((2,21),(12,22),(22,23),(32,24),(42,25),(52,26),(62,27),(72,28)),
        ((3,31),(13,32),(23,33),(33,34),(43,35),(53,36),(63,37),(73,38)),
        ((4,41),(14,42),(24,43),(34,44),(44,45),(54,46),(64,47),(74,48)),
        ((5,51),(15,52),(25,53),(35,54),(45,55),(55,56),(65,57),(75,58)),
        ((6,61),(16,62),(26,63),(36,64),(46,65),(56,66),(66,67),(76,68))
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



end package heg_trLUT_s3_pkg;