library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.system_types_pkg.all;
use work.board_pkg_common.all;
use work.board_pkg.all;
use work.user_pkg.all;
use work.link_map.all;

package constants_pkg is

  function set_user_const (user : integer; max : integer)
    return integer;

  --------------------------------------------------------------------------------
  -- CSM
  --------------------------------------------------------------------------------

  -- Number of LPGBT Uplinks
  constant c_MAX_LPGBT_UPLINKS : integer :=
    func_count_link_types (c_MGT_MAP, MGT_LPGBT)
    + func_count_link_types (c_MGT_MAP, MGT_LPGBT_SIMPLEX);

  -- Number of LPGBT Downlinks
  constant c_MAX_LPGBT_DOWNLINKS : integer :=
    func_count_link_types (c_MGT_MAP, MGT_LPGBT);

  -- Total number of user requested active TDC links
  constant c_NUM_TDC_INPUTS : integer :=
    func_count_tdc_links (user_TDC_INPUTS, c_MDT_CONFIG);

  -- Total number of user requested active CSMs
  constant c_NUM_CSMS_ACTIVE : integer :=
    func_count_csms_active (c_MDT_CONFIG, c_NUM_TDC_INPUTS);

  constant c_NUM_CSM_UPLINKS   : integer := set_user_const (user_LPGBT_UPLINKS, c_NUM_CSMS_ACTIVE*2);
  constant c_NUM_CSM_DOWNLINKS : integer := set_user_const (user_LPGBT_DOWNLINKS, c_NUM_CSMS_ACTIVE);

  constant c_NUM_POLMUX_INNER  : integer := func_count_polmux (c_NUM_TDC_INPUTS, c_MDT_CONFIG, INNER);
  constant c_NUM_POLMUX_MIDDLE : integer := func_count_polmux (c_NUM_TDC_INPUTS, c_MDT_CONFIG, MIDDLE);
  constant c_NUM_POLMUX_OUTER  : integer := func_count_polmux (c_NUM_TDC_INPUTS, c_MDT_CONFIG, OUTER);
  constant c_NUM_POLMUX_EXTRA  : integer := func_count_polmux (c_NUM_TDC_INPUTS, c_MDT_CONFIG, EXTRA);
  constant c_NUM_POLMUX        : integer := c_NUM_POLMUX_INNER + c_NUM_POLMUX_MIDDLE + c_NUM_POLMUX_OUTER + c_NUM_POLMUX_EXTRA;

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

  constant c_NUM_FELIX_UPLINKS : integer := func_count_link_types (c_MGT_MAP, MGT_FELIX);
  constant c_NUM_FELIX_DOWNLINKS : integer := 1;


  constant c_NUM_C2C_LINKS : integer := func_count_link_types (c_MGT_MAP, MGT_C2C);

  --------------------------------------------------------------------------------
  -- LPGBT
  --------------------------------------------------------------------------------

  -- lpgbt links are the number of CSM links + ONE felix link
  constant c_NUM_LPGBT_UPLINKS   : integer := c_NUM_CSM_UPLINKS;
  constant c_NUM_LPGBT_DOWNLINKS : integer := c_NUM_CSM_DOWNLINKS;

  constant c_FELIX_LPGBT_INDEX : integer := c_NUM_LPGBT_UPLINKS;

  --------------------------------------------------------------------------------
  -- Chip-to-Chip Segments
  --------------------------------------------------------------------------------

  --constant c_NUM_SF_INPUTS       : integer := 0;
  --constant c_NUM_SF_OUTPUTS      : integer := 0;
  constant c_NUM_SF_INPUT_LINKS  : integer := 1;
  constant c_NUM_SF_OUTPUT_LINKS : integer := 1;

  --------------------------------------------------------------------------------
  -- Sector Logic
  --------------------------------------------------------------------------------

  constant c_MAX_SECTOR_LOGIC_INPUTS  : integer := 12;
  constant c_MAX_SECTOR_LOGIC_OUTPUTS : integer := 12;

  constant c_NUM_SECTOR_LOGIC_INPUTS : integer := set_user_const
                                                  (user_SECTOR_LOGIC_INPUTS, c_MAX_SECTOR_LOGIC_INPUTS);
  constant c_NUM_SECTOR_LOGIC_OUTPUTS : integer := set_user_const
                                                   (user_SECTOR_LOGIC_OUTPUTS, c_MAX_SECTOR_LOGIC_OUTPUTS);

  constant c_NUM_SL_BARREL_CANDIDATES : integer := 0;
  constant c_NUM_SL_ENDCAP_CANDIDATES : integer := 0;

  constant c_NUM_SLCPROC_ENDCAP_OUTPUTS : integer := 0;
  constant c_NUM_SLCPROC_BARREL_OUTPUTS : integer := 0;

  --------------------------------------------------------------------------------
  -- board specific
  --------------------------------------------------------------------------------

  -- cornell
  constant c_NUM_CORNELL_LEDS : integer := 0;
  constant c_NUM_DDR_INPUTS   : integer := 0;

  -- mpi
  constant c_NUM_DDR_OUTPUTS : integer := 0;

  --------------------------------------------------------------------------------
  -- Generated Index Arrays... e.g. say there are 4 MGTs, 2 of which are
  -- LPGBT and 2 of which are Sector Logic then these index arrays will look like:
  -- lpgbt_idx_array = (
  -- 0 => 0,
  -- 1 => 1,
  -- 2 => -1,-- not an lpgbt type
  -- 3 => -1 -- not an lpgbt type
  -- )
  --
  -- sl_idx_array = (
  -- 0 => -1, -- not an sl type
  -- 1 => -1, -- not an sl type
  -- 2 =>  0,
  -- 3 =>  1
  -- )
  --
  --------------------------------------------------------------------------------

  -- list of lpgbt emulator cores
  constant emul_idx_array : int_array_t (0 to c_NUM_MGTS-1) :=
    func_fill_subtype_idx (c_NUM_LPGBT_EMUL_UPLINKS, c_MGT_MAP, MGT_LPGBT_EMUL);

  -- list of lpgbt uplinks
  constant lpgbt_uplink_idx_array : int_array_t (0 to c_NUM_MGTS-1) :=
    func_fill_csm_uplink_idx (c_NUM_CSM_UPLINKS, c_MGT_MAP, c_MDT_CONFIG);

  -- list of lpgbt downlinks
  constant lpgbt_downlink_idx_array : int_array_t (0 to c_NUM_MGTS-1) :=
    func_fill_csm_downlink_idx (c_NUM_CSM_DOWNLINKS, c_MGT_MAP, c_MDT_CONFIG);

  -- list of lpgbt mgts, simplex and duplex
  constant lpgbt_idx_array : int_array_t (0 to c_NUM_MGTS-1) := lpgbt_uplink_idx_array;

  -- list of sector logic mgts
  constant sl_idx_array : int_array_t (0 to c_NUM_MGTS-1) :=
    func_fill_subtype_idx (c_NUM_SECTOR_LOGIC_INPUTS, c_MGT_MAP, MGT_SL);

  -- list of felix mgts
  constant felix_idx_array : int_array_t (0 to c_NUM_MGTS-1) :=
    func_fill_subtype_idx (c_NUM_FELIX_UPLINKS, c_MGT_MAP, MGT_FELIX);

  -- list of ttc mgts
  constant ttc_idx_array : int_array_t (0 to c_NUM_MGTS-1) :=
    func_fill_subtype_idx (1, c_MGT_MAP, MGT_TTC);

  constant c2c_idx_array :  int_array_t (0 to c_NUM_MGTS-1) :=
    func_fill_subtype_idx (c_NUM_C2C_LINKS, c_MGT_MAP, MGT_C2C);

  type hi_lo_t is record
    hi : integer;
    lo : integer;
  end record;

  type hi_lo_array_t is array (integer range <>) of hi_lo_t;

  function get_sl_mgt_num (sl_id : integer; mgt_map : mgt_inst_array_t)
    return integer;
  function get_csm_hi_lo (mdt_config : mdt_config_t)
    return hi_lo_array_t;
  function get_polmux_hi_lo (mdt_config : mdt_config_t)
    return hi_lo_array_t;
  function get_polmux_global_id (mdt_config : mdt_config_t; index : integer; station : station_id_t)
    return integer;

  --constant csm_hi_lo    : hi_lo_array_t (c_MDT_CONFIG'range)      := get_csm_hi_lo (c_MDT_CONFIG);
  --constant polmux_hi_lo : hi_lo_array_t (c_NUM_POLMUX-1 downto 0) := get_polmux_hi_lo (c_MDT_CONFIG);

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

  -- We have some number of polling multiplexers say, up to 17 if each CSM has its own, but
  -- ideally it is less, e.g. 12 since many CSM inputs are not populated with tdcs
  -- From all these CSMs, then, there is a smaller number of TDC inputs, (e.g. just say 100)
  -- if we concatenate the tdc inputs into a 100 wide array, then we need some function that can
  -- figure out that, e.g.
  -- polmux0 connects to inputs 0 to 9
  -- polmux1 connects to inputs 10 to 22
  -- polmux3 connects to inputs ....
  -- etc

  function get_polmux_hi_lo (mdt_config : mdt_config_t)
    return hi_lo_array_t is
    variable hi_lo : hi_lo_array_t (c_NUM_POLMUX-1 downto 0);
    variable cnt   : integer := 0;
  begin

    -- initialize output
    for I in 0 to hi_lo'length-1 loop
      hi_lo(I).hi := -1;
      hi_lo(I).lo := -1;
    end loop;

    for polmux in 0 to hi_lo'length-1 loop
      cnt := 0;
      for I in 0 to mdt_config'length-1 loop
        for J in 0 to mdt_config(I).en'length-1 loop
          if (mdt_config(I).en(J) = '1') then
            if (mdt_config(I).en(J) = '1' and mdt_config(I).polmux_id = polmux) then
              if (hi_lo(polmux).lo = -1) then
                hi_lo(polmux).lo := cnt;
              else
                hi_lo(polmux).hi := cnt;
              end if;
            end if;
            cnt := cnt + 1;
          end if;
        end loop;
      end loop;
    end loop;

    return hi_lo;
  end function;

  function get_sl_mgt_num (sl_id : integer; mgt_map : mgt_inst_array_t)
    return integer is
    variable cnt   : integer := 0;
  begin

    -- for a given SL (e.g. 0-11) get the MGT link number (e.g. 0-127)
    -- assumign the same ordination between the SL and MGT numbers
    for I in 0 to mgt_map'length-1 loop
      if (mgt_map(I).mgt_type = MGT_SL) then
        if (cnt=sl_id) then
          return I;
        end if;
        cnt := cnt + 1;
      end if;
    end loop;
    return -1;
  end function;

  function get_csm_hi_lo (mdt_config : mdt_config_t)
    return hi_lo_array_t is
    variable hi_lo : hi_lo_array_t (mdt_config'range);
    variable cnt   : integer := 0;
  begin
    --

    -- initialize output
    for I in 0 to hi_lo'length -1 loop
      hi_lo(I).hi := -1;
      hi_lo(I).lo := -1;
    end loop;

    for csm in 0 to mdt_config'length-1 loop
      for ch in 0 to mdt_config(csm).en'length-1 loop
        if (mdt_config(csm).en(ch) = '1') then
          if (hi_lo(csm).lo = -1) then
            hi_lo(csm).lo := cnt;
          else
            hi_lo(csm).hi := cnt;
          end if;
          cnt := cnt + 1;
        end if;
      end loop;
    end loop;
    return hi_lo;
  end function;

  function get_polmux_global_id (mdt_config : mdt_config_t;
                                 index      : integer;
                                 station    : station_id_t)
    return integer is
    variable cnt_local      : integer := 0;
    variable polmux_id_last : integer := -1;
    variable polmux_id      : integer := 0;
    variable station_int    : integer;
  begin
    if (station = INNER) then
      station_int := 0;
    elsif (station = MIDDLE) then
      station_int := 1;
    elsif (station = OUTER) then
      station_int := 2;
    elsif (station = EXTRA) then
      station_int := 3;
    end if;

    assert false report "Finding polmux for station "
      & stations_str(station_int)
      & " index #" & integer'image(index) severity note;

    for I in 0 to mdt_config'length-1 loop

      assert false report "  > CSM #" & integer'image(I) severity note;

      polmux_id := mdt_config(I).polmux_id;

      if (station = mdt_config(I).station_id) then

        if (polmux_id_last = -1) then
          polmux_id_last := polmux_id;
        elsif (polmux_id /= polmux_id_last) then
          cnt_local      := cnt_local + 1;
          polmux_id_last := polmux_id;
        end if;

        assert false report "      > Found station "severity note;
        if (cnt_local = index) then
          assert false report "      > returning polmux #" & integer'image(polmux_id) severity note;
          return polmux_id;
        end if;

      end if;

      --assert false report "cnt_local =" & integer'image(cnt_local) severity note;

    end loop;
    return -1;
  end function;

end package body constants_pkg;
