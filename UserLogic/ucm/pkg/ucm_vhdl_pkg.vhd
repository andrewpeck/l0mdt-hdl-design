--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: pkg
-- File: ucm_vhdl_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_vhdl_pkg.vhd
-- -----
-- File Created: Wednesday, 23rd August 2023 10:56:24 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 23rd August 2023 10:56:55 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;

library ucm_lib;

package ucm_vhdl_pkg is

  type rpc_art is array ( 0 to 3) of signed(SLC_Z_RPC_LEN - 1 downto 0);
  type rad_art is array ( 0 to 3) of signed(SLC_Z_RPC_LEN - 1 downto 0);
  
end package;

