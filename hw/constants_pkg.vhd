library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library framework;
use framework.board_pkg.all;
use framework.user_pkg.all;

package constants_pkg is

  function set_user_const (user : integer; max : integer)
    return integer;

  constant c_NUM_CSM_LINKS : integer := set_user_const (user_CSM_LINKS, c_MAX_CSM_LINKS);

  constant c_NUM_LPGBT_UPLINKS   : integer := c_NUM_CSM_LINKS;
  constant c_NUM_LPGBT_DOWNLINKS : integer := c_NUM_CSM_LINKS;

  constant c_NUM_TDC_INPUTS  : integer := set_user_const (user_TDC_INPUTS, c_MAX_TDC_INPUTS);

  constant c_NUM_SECTOR_LOGIC_INPUTS : integer := set_user_const (user_SECTOR_LOGIC_INPUTS, c_MAX_SECTOR_LOGIC_INPUTS);
  constant c_NUM_SECTOR_LOGIC_OUTPUTS : integer := set_user_const (user_SECTOR_LOGIC_OUTPUTS, c_MAX_SECTOR_LOGIC_OUTPUTS);

  constant c_NUM_SL_BARREL_CANDIDATES : integer := 0;
  constant c_NUM_SL_ENDCAP_CANDIDATES : integer := 0;

  constant c_NUM_DAQ_LINKS              : integer := 0;
  constant c_NUM_SLCPROC_ENDCAP_OUTPUTS : integer := 0;
  constant c_NUM_SLCPROC_BARREL_OUTPUTS : integer := 0;
  constant c_NUM_C2C_INPUTS             : integer := 0;
  constant c_NUM_C2C_OUTPUTS            : integer := 0;

  constant c_TOP_NUM_FELIX_UPLINKS   : integer := 0;
  constant c_TOP_NUM_FELIX_DOWNLINKS : integer := 0;
  constant c_TOP_NUM_CORNELL_LEDS    : integer := 0;
  constant c_TOP_NUM_DDR_INPUTS      : integer := 0;
  constant c_TOP_NUM_DDR_OUTPUTS     : integer := 0;

end package constants_pkg;

--------------------------------------------------------------------------------
-- Body
--------------------------------------------------------------------------------

package body constants_pkg is

  function set_user_const (user : integer; max : integer)
    return integer is
  begin
    if user = -1 then
      return max;
    else
      return user;
    end if;
  end function;


end package body constants_pkg;
