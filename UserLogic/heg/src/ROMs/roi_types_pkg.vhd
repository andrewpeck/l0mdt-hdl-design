--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
------------------------------------------------------------------------------
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

  type roi_mbar_limit is array (0 to 1) of integer;

  -------------------------
  -- VHDL-2001
  -------------------------
  type roi_mbar_layer_large_t is array (0 to 7) of roi_mbar_limit;
  type roi_mbar_layer_small_t is array (0 to 5) of roi_mbar_limit;

  type roi_mbar_lut_large_t is array(integer range <>) of roi_mbar_layer_large_t;
  type roi_mbar_lut_small_t is array(integer range <>) of roi_mbar_layer_small_t;

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










