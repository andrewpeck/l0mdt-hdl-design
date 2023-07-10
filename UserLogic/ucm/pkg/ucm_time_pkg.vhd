--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: pkg
-- File: ucm_time_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_time_pkg.vhd
-- -----
-- File Created: Wednesday, 8th February 2023 11:22:53 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 8th February 2023 11:24:20 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- library shared_lib;
-- use shared_lib.common_ieee_pkg.all;
-- use shared_lib.l0mdt_constants_pkg.all;
-- use shared_lib.l0mdt_dataformats_pkg.all;
-- use shared_lib.common_constants_pkg.all;
-- use shared_lib.common_types_pkg.all;

package ucm_time_pkg is

  constant UCM_TIME_TOTAL_TIME_2_HPS : integer := 111; -- slope IPR2 & ZCALC IPR2
  constant UCM_TIME_TOTAL_TIME_2_CPL : integer := 10;
  constant UCM_TIME_PRE : integer := 0;
  constant UCM_TIME_CDE : integer := 0;
  constant UCM_TIME_CVP : integer := 0;
  constant UCM_TIME_TOTAL_TIME : integer := 0;
  
  
  
end package ucm_time_pkg;

-- package body ucm_time_pkg is
  
  
  
-- end package body ucm_time_pkg;