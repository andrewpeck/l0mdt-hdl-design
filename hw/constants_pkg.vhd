library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library framework;
use framework.system_types_pkg.all;
use framework.board_pkg_common.all;
use framework.board_pkg.all;
use framework.user_pkg.all;

package constants_pkg is

  function set_user_const (user : integer; max : integer)
    return integer;


  -- TODO: should just count the number of LPGBT and LPGBT Simplex Links Here

  --------------------------------------------------------------------------------
  -- CSM
  --------------------------------------------------------------------------------

  constant c_MAX_LPGBT_UPLINKS   : integer := func_count_link_types (c_MGT_MAP, MGT_LPGBT) + func_count_link_types (c_MGT_MAP, MGT_LPGBT_SIMPLEX);
  constant c_MAX_LPGBT_DOWNLINKS : integer := func_count_link_types (c_MGT_MAP, MGT_LPGBT);

  constant c_MAX_CSM_LINKS : integer := c_MAX_LPGBT_UPLINKS/2;
  constant c_NUM_CSM_LINKS : integer := set_user_const (user_CSM_LINKS, c_MAX_CSM_LINKS);

  constant c_NUM_LPGBT_UPLINKS   : integer := set_user_const (user_LPGBT_UPLINKS, c_MAX_LPGBT_UPLINKS);
  constant c_NUM_LPGBT_DOWNLINKS : integer := set_user_const (user_LPGBT_DOWNLINKS, c_MAX_LPGBT_DOWNLINKS);

  constant c_MAX_TDC_INPUTS : integer := func_count_tdc_links (c_TDC_LINK_MAP, c_MGT_MAP);

  constant c_NUM_TDC_INPUTS : integer := set_user_const (user_TDC_INPUTS, c_MAX_TDC_INPUTS);

  --------------------------------------------------------------------------------
  -- Emulator
  --------------------------------------------------------------------------------

  constant c_NUM_LPGBT_EMUL_UPLINKS   : integer := func_count_link_types (c_MGT_MAP, MGT_LPGBT_EMUL);
  constant c_NUM_LPGBT_EMUL_DOWNLINKS : integer := func_count_link_types (c_MGT_MAP, MGT_LPGBT_EMUL);

  --------------------------------------------------------------------------------
  -- DAQ
  --------------------------------------------------------------------------------

  constant c_MAX_DAQ_LINKS : integer := func_count_link_types (c_MGT_MAP, MGT_FELIX);
  constant c_NUM_DAQ_LINKS : integer := 0;

  constant c_NUM_FELIX_UPLINKS   : integer := 0;
  constant c_NUM_FELIX_DOWNLINKS : integer := 0;

  --------------------------------------------------------------------------------
  -- Sector Logic
  --------------------------------------------------------------------------------

  constant c_MAX_SECTOR_LOGIC_INPUTS  : integer := 12;
  constant c_MAX_SECTOR_LOGIC_OUTPUTS : integer := 12;

  constant c_NUM_SECTOR_LOGIC_INPUTS  : integer := set_user_const (user_SECTOR_LOGIC_INPUTS, c_MAX_SECTOR_LOGIC_INPUTS);
  constant c_NUM_SECTOR_LOGIC_OUTPUTS : integer := set_user_const (user_SECTOR_LOGIC_OUTPUTS, c_MAX_SECTOR_LOGIC_OUTPUTS);

  constant c_NUM_SL_BARREL_CANDIDATES : integer := 0;
  constant c_NUM_SL_ENDCAP_CANDIDATES : integer := 0;

  constant c_NUM_SLCPROC_ENDCAP_OUTPUTS : integer := 0;
  constant c_NUM_SLCPROC_BARREL_OUTPUTS : integer := 0;

  --------------------------------------------------------------------------------
  -- C2C
  --------------------------------------------------------------------------------

  constant c_NUM_C2C_INPUTS  : integer := 0;
  constant c_NUM_C2C_OUTPUTS : integer := 0;

  -- board specific

  -- cornell
  constant c_NUM_CORNELL_LEDS : integer := 0;
  constant c_NUM_DDR_INPUTS   : integer := 0;

  -- mpi
  constant c_NUM_DDR_OUTPUTS : integer := 0;

  -- list of lpgbt emulator cores
  constant emul_idx_array : int_array_t (0 to c_NUM_MGTS-1) := func_fill_subtype_idx (c_NUM_LPGBT_EMUL_UPLINKS, c_MGT_MAP, MGT_LPGBT_EMUL, MGT_LPGBT_EMUL);

  -- list of lpgbt mgts, simplex and duplex
  constant lpgbt_idx_array : int_array_t (0 to c_NUM_MGTS-1) := func_fill_subtype_idx (c_NUM_LPGBT_UPLINKS, c_MGT_MAP, MGT_LPGBT, MGT_LPGBT_SIMPLEX);

  -- list of lpgbt mgts, simplex and duplex
  constant lpgbt_uplink_idx_array : int_array_t (0 to c_NUM_MGTS-1) := func_fill_subtype_idx (c_NUM_LPGBT_UPLINKS, c_MGT_MAP, MGT_LPGBT, MGT_LPGBT_SIMPLEX);

  -- list of lpgbt mgts, simplex and duplex
  constant lpgbt_downlink_idx_array : int_array_t (0 to c_NUM_MGTS-1) := func_fill_subtype_idx (c_NUM_LPGBT_UPLINKS, c_MGT_MAP, MGT_LPGBT, MGT_LPGBT);

  -- list of simplex only lpgbts
  constant lpgbt_simplex_idx_array : int_array_t (0 to c_NUM_MGTS-1) := func_fill_subtype_idx (c_NUM_LPGBT_UPLINKS, c_MGT_MAP, MGT_LPGBT_SIMPLEX, MGT_LPGBT_SIMPLEX);

  -- list of sector logic mgts
  constant sl_idx_array : int_array_t (0 to c_NUM_MGTS-1) := func_fill_subtype_idx (c_NUM_SECTOR_LOGIC_INPUTS, c_MGT_MAP, MGT_SL, MGT_SL);


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
