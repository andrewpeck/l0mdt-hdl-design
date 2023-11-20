--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ucm_ctrl_pam_subth.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_ctrl_pam_subth.vhd
-- -----
-- File Created: Monday, 20th November 2023 3:57:29 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Monday, 20th November 2023 3:57:33 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;

library ucm_lib;
use ucm_lib.ucm_pkg.all;

library  vamc_lib;


entity ucm_ctrl_pam_subth is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    
  );
end entity;

architecture beh of ucm_ctrl_pam_subth is

begin

  

end architecture;