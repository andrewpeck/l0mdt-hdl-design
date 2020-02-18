--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------  
--  Project: ATLAS L0MDT Trigger 
--  Module: Hit Processor 
--          pulse width - drif time LUT
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

package hp_pwdt_lut_rom is

    type pw_dt_rom_mem_t is array (0 to 7) of integer;
    
    constant pw_dt_rom_mem : pw_dt_rom_mem_t :=(
        0,1,2,3,4,5,6,7
    );
    
end package hp_pwdt_lut_rom;