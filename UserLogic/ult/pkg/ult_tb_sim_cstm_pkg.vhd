--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Test Bench Module for Logic Trigger Path
--  Description: custom types
--
--------------------------------------------------------------------------------
--  Revisions:
--      2021.09.29 Creation 
--
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;


package ult_tb_sim_cstm_pkg is
  
  type event_ait is array (integer range <>) of unsigned(31 downto 0);
  
end package ult_tb_sim_cstm_pkg;


package body ult_tb_sim_cstm_pkg is
  
  
  
end package body ult_tb_sim_cstm_pkg;