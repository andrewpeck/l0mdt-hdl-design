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
use shared_lib.some_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

package roi_types_pkg is

  -- constant ROM_MAX_SIZE : integer := 1024;

  type roi_z_lut_t is array(integer range <>) of integer;


  type roi_mbar_limit is array (0 to 1) of integer;
  type roi_mbar_layer is array (0 to get_num_layers(g_STATION_RADIUS) - 1) of roi_mdt_limit;

  type roi_mbar_lut is array(integer range <>) of roi_mdt_layer;

  function vectorify(x : roi_mbar_layer) return std_logic_vector((MDT_TUBE_LEN * get_num_layers(g_STATION_RADIUS)) -1 downto 0);

  function structify(x : std_logic_vector((MDT_TUBE_LEN * get_num_layers(g_STATION_RADIUS)) -1 downto 0)) return roi_mbar_layer;

end package;

package body roi_types_pkg is
  
  function vectorify(x : roi_mbar_layer) return std_logic_vector((MDT_TUBE_LEN * get_num_layers(g_STATION_RADIUS)) -1 downto 0) is
    variable y : std_logic_vector((MDT_TUBE_LEN * get_num_layers(g_STATION_RADIUS)) -1 downto 0);
  begin
    
    return y;
  end function;

  function structify(x : std_logic_vector((MDT_TUBE_LEN * get_num_layers(g_STATION_RADIUS)) -1 downto 0)) return roi_mbar_layer is
    variable y : roi_mbar_layer;
  begin
    return y;
  end function;
  
  
end package body roi_types_pkg;








