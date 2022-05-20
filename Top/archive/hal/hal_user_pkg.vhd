library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package user_pkg is

  -- These user parameters can be used to override the board defaults
  -- for any specified constant, setting a value of (-1)  will cause the
  -- framework to assume the board default value specified in the board_pkg
  --
  -- user values should be less than or equal to the board maximum

  constant user_LPGBT_UPLINKS        : integer := 20;
  constant user_LPGBT_DOWNLINKS      : integer := 10;
  constant user_TDC_INPUTS           : integer := 10;  -- # of TDC inputs

  constant user_SECTOR_LOGIC_INPUTS  : integer := -1;
  constant user_SECTOR_LOGIC_OUTPUTS : integer := -1;
  constant user_SLC_ENDCAP_LINKS     : integer := -1;
  constant user_SLC_BARREL_LINKS     : integer := -1;

end package user_pkg;
