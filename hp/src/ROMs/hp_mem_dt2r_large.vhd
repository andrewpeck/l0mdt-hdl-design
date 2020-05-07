--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module:
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--   
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- library shared_lib;
-- use shared_lib.cfg_pkg.all;
-- use shared_lib.common_pkg.all;

-- library hp_lib;
-- use hp_lib.hp_pkg.all;

package hp_mem_dt2r_large_pkg is

  type mem_array is array (0 to MEM_SIZE-1) of integer; 
  constant mem_data : mem_array := (
       0 to  8  => 5, 
       9 to 18  => 9, 
      19 to 28  => 15, 
      29 to 38  => 22, 
      39 to 48  => 29, 
      49 to 58  => 37
       );

end package hp_mem_dt2r_large_pkg;

-- package body hp_mem_dt2r_large_pkg is
-- end package body hp_mem_dt2r_large_pkg;
