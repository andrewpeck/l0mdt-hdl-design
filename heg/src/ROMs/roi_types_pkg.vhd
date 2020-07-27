library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package roi_types_pkg is

  -- constant ROM_MAX_SIZE : integer := 1024;

  type roi_z_lut_t is array(integer range <>) of integer;


  type roi_mdt_limit is array (0 to 1) of integer;
  type roi_mdt_layer is array (0 to 5) of roi_mdt_limit;
  type roi_mbar_lut is array(integer range <>) of roi_mdt_layer;


end package;









