--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------  
--  Project: ATLAS L0MDT Trigger 
--  Module: Hit Processor 
--          drift time - radius LUT
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
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

package hp_dtr_lut_rom is
  -- generic (
  --   package hp_pkg is new hp_lib.hp_pkg generic map (num_layers => 8)
  -- );
  -- use hp_pkg.all;

    type dtr_rom_mem_t is array (0 to 7) of integer; -- # bins
    type dtr_rom_mem_sector_t is array (0 to 3) of dtr_rom_mem_t;
    
    constant dtr_i_rom_mem : dtr_rom_mem_t :=(
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7
    );

    constant dtr_mo_rom_mem : dtr_rom_mem_t :=(
        0,1,2,3,4,5,6,7
    );

    constant dtr_rom_mem : dtr_rom_mem_sector_t :=(
        dtr_i_rom_mem , dtr_mo_rom_mem , dtr_mo_rom_mem , dtr_mo_rom_mem
    );
    
end package hp_dtr_lut_rom;