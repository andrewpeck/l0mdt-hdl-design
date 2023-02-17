library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package user_pkg is

  -- These user parameters can be used to override the board defaults
  -- for any specified constant, setting a value of (-1)  will cause the
  -- framework to assume the board default value specified in the board_pkg
  --
  -- user values should be less than or equal to the board maximum

  constant user_LPGBT_UPLINKS        : integer := -1;
  constant user_LPGBT_DOWNLINKS      : integer := -1;
  constant user_CSM_LINKS            : integer := -1;  -- # of 1 tx + 2 rx csm links

  constant user_SECTOR_LOGIC_INPUTS  : integer := -1;
  constant user_SECTOR_LOGIC_OUTPUTS : integer := -1;
  constant user_SLC_ENDCAP_LINKS     : integer := -1;
  constant user_SLC_BARREL_LINKS     : integer := -1;
  constant user_TDC_INPUTS           : integer := -1;  -- # of TDC inputs

end package user_pkg;
