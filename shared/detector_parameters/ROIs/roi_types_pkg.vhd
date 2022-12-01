--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ROIs
-- File: roi_types_pkg.vhd
-- Module: <<moduleName>>
-- File PATH: /roi_types_pkg.vhd
-- -----
-- File Created: Wednesday, 8th June 2022 9:54:45 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Tuesday, 29th November 2022 3:27:04 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

package roi_types_pkg is

  type roi_z_centers is array (0 to 1) of integer;
  type roi_z_lut_t is array(integer range <>) of roi_z_centers;

  type roi_z_lut_std_t is array(integer range <>) of std_logic_vector(MDT_TUBE_LEN*2 -1 downto 0);

  type roi_mbar_limit is array (0 to 1) of integer;

  -------------------------
  -- VHDL-2001
  -------------------------
  type roi_mbar_layer_large_t is array (0 to 7) of roi_mbar_limit;
  type roi_mbar_layer_small_t is array (0 to 5) of roi_mbar_limit;

  type roi_mbar_lut_large_t is array(integer range <>) of roi_mbar_layer_large_t;
  type roi_mbar_lut_small_t is array(integer range <>) of roi_mbar_layer_small_t;

  type roi_mbar_lut_large_std_t is array (2048 - 1 downto 0) of std_logic_vector(MDT_TUBE_LEN*16 -1 downto 0);
  -------------------------
  -- VHDL-2008
  -------------------------
  -- type roi_mbar_layer_t is array (integer range <>) of roi_mbar_limit;
  -- type roi_mbar_lut_t is array(integer range <>) of roi_mbar_layer_t;

  -------------------------
  -- 
  -------------------------

  type roi_mbar_lut_std is array(integer range <>) of std_logic_vector(MDT_TUBE_LEN * 8 -1 downto 0);


end package;










