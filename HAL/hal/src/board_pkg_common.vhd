library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package board_pkg_common is

  --------------------------------------------------------------------------------
  -- MGT Mapping
  --------------------------------------------------------------------------------

  type station_t is (BARREL, ENDCAP, NIL);
  type station_id_t is (INNER, MIDDLE, OUTER, EXTRA, NIL);

  -- types of MGTs
  type gt_types_t is (GT_NIL, GTH, GTY);

  -- types of Links
  type mgt_types_t is (MGT_NIL, MGT_LPGBT_SIMPLEX, MGT_LPGBT, MGT_LPGBT_EMUL,
                       MGT_C2C, MGT_SL, MGT_TTC, MGT_FELIX);

  -- parameters needed to specify location + type of a serdes
  type mgt_inst_t is record
    mgt_type : mgt_types_t;
    refclk   : integer;
    gt_type  : gt_types_t;
    x_loc    : integer;
    y_loc    : integer;
  end record;

  -- nil type of mgt_inst_t
  constant MGT_NIL_MAP :
    mgt_inst_t := (mgt_type => MGT_NIL,
                   refclk   => -1,
                   gt_type  => GT_NIL,
                   x_loc    => -1,
                   y_loc    => -1
                   );

  -- array of mgt_inst
  type mgt_inst_array_t is array (integer range <>) of mgt_inst_t;

  --------------------------------------------------------------------------------
  -- REFCLK Mapping
  --------------------------------------------------------------------------------

  type refclk_freqs_t is (REF_AXI_C2C, REF_ASYNC320, REF_SYNC320, REF_SYNC240, REF_NIL);

  type refclk_map_t is record
    FREQ      : refclk_freqs_t;
    --REFCLKNUM : integer;
    --QUAD      : integer;
    --GT_TYPE   : gt_types_t;
    --X_LOC     : integer;
    --Y_MIN     : integer;
    --Y_MAX     : integer;
  end record;

  constant REFCLK_NIL_MAP : refclk_map_t := (freq      => REF_NIL
                                             -- ,refclknum => -1
                                             -- ,quad      => -1
                                             -- ,gt_type   => GT_NIL
                                             -- ,x_loc     => -1
                                             -- ,y_min     => -1
                                             -- ,y_max     => -1
                                             );

  type refclk_types_array_t is array (integer range <>) of refclk_map_t;

  type station_array_t is array (integer range <>) of station_id_t;
  constant stations     : station_array_t (0 to 3)     := (INNER, MIDDLE, OUTER, EXTRA);
  type station_str_array_t is array (integer range <>) of string (1 to 3);
  constant stations_str : station_str_array_t (0 to 3) := ("INN", "MID", "OUT", "EXT");

  type tdc_hit_t is record
    station : station_id_t;
    csm     : integer range 0 to 17;
    polmux  : integer range 0 to 17;
    data    : std_logic_vector (31 downto 0);
    valid   : std_logic;
  end record;
  type tdc_hit_array_t is array (integer range <>) of tdc_hit_t;

  --------------------------------------------------------------------------------
  -- CSM Mapping
  --------------------------------------------------------------------------------

  type csm_config_t is record
    polmux_id  : integer;
    mgt_id_m   : integer;
    mgt_id_s   : integer;
    csm_id     : integer;
    en         : std_logic_vector (19 downto 0);
    legacy     : std_logic_vector (19 downto 0);
    station_id : station_id_t;
  end record;

  type mdt_config_t is array (integer range <>) of csm_config_t;

  --------------------------------------------------------------------------------
  -- Utility Functions
  --------------------------------------------------------------------------------

  type int_array_t is array (integer range <>) of integer;
  type bool_array_t is array (integer range <>) of boolean;

  function count_ones(slv : std_logic_vector) return natural;

  function func_fill_subtype_idx (cnt_max : integer; mgt_list : mgt_inst_array_t; i_mgt_type : mgt_types_t)
    return int_array_t;

  function func_fill_csm_downlink_idx (cnt_max : integer; mgt_list : mgt_inst_array_t; csm_config : mdt_config_t)
    return int_array_t;

  function func_fill_csm_uplink_idx (cnt_max : integer; mgt_list : mgt_inst_array_t; csm_config : mdt_config_t)
    return int_array_t;

  function func_count_link_types (mgt_list : mgt_inst_array_t; i_mgt_type : mgt_types_t)
    return integer;

  function func_count_tdc_links (max : integer; mdt_config : mdt_config_t)
    return integer;

  function func_count_polmux (tdc_cnt_max : integer; mdt_config : mdt_config_t; station : station_id_t)
    return integer;

  function func_polmux_maxid (tdc_cnt_max : integer; mdt_config : mdt_config_t)
    return integer;

  function func_count_csms_active (mdt_config : mdt_config_t; num_tdcs : integer)
    return integer;

end package board_pkg_common;

--------------------------------------------------------------------------------
-- Package Body
--------------------------------------------------------------------------------

package body board_pkg_common is

  function count_ones(slv : std_logic_vector) return natural is
    variable n_ones : natural := 0;
  begin
    for i in slv'range loop
      if slv(i) = '1' then
        n_ones := n_ones + 1;
      end if;
    end loop;
    return n_ones;
  end function count_ones;

  -- given a TDC map and a MGT link map, returns a count of the total number of TDC inputs instantiated
  function func_count_tdc_links (max : integer; mdt_config : mdt_config_t)
    return integer is
    variable count : integer := 0;
  begin
    for I in mdt_config'range loop
      count := count + count_ones(mdt_config(I).en);
      if (max /= -1 and count >= max) then
        return count;
      end if;
    end loop;
    return count;
  end func_count_tdc_links;

  function func_fill_csm_uplink_idx (cnt_max : integer; mgt_list : mgt_inst_array_t; csm_config : mdt_config_t)
    return int_array_t is
    variable count : integer                              := 0;
    variable idx   : int_array_t (0 to mgt_list'length-1) := (others => -1);
  begin
    for MGT in 0 to mgt_list'length-1 loop
      for CSM in 0 to csm_config'length-1 loop

        if (count < cnt_max and
            mgt_list(MGT).mgt_type = MGT_LPGBT
            and (csm_config(CSM).mgt_id_m = MGT or csm_config(CSM).mgt_id_s = MGT)
            ) then
          idx(MGT) := count;
          count  := count + 1;
        end if;

      end loop;
    end loop;
    return idx;
  end func_fill_csm_uplink_idx;

  function func_fill_csm_downlink_idx (cnt_max : integer; mgt_list : mgt_inst_array_t; csm_config : mdt_config_t)
    return int_array_t is
    variable count : integer                              := 0;
    variable idx   : int_array_t (0 to mgt_list'length-1) := (others => -1);
  begin
    for MGT in 0 to mgt_list'length-1 loop
      for CSM in 0 to csm_config'length-1 loop

        if (count < cnt_max and mgt_list(MGT).mgt_type = MGT_LPGBT and (csm_config(CSM).mgt_id_m = MGT)) then
          idx(MGT) := count;
          count  := count + 1;
        end if;

      end loop;
    end loop;
    return idx;
  end func_fill_csm_downlink_idx;

  function func_fill_subtype_idx (cnt_max : integer; mgt_list : mgt_inst_array_t; i_mgt_type : mgt_types_t)
    return int_array_t is
    variable count : integer                              := 0;
    variable idx   : int_array_t (0 to mgt_list'length-1) := (others => -1);
  begin
    for I in 0 to mgt_list'length-1 loop
      if (count < cnt_max and mgt_list(I).mgt_type = i_mgt_type) then
        idx(I) := count;
        count  := count + 1;
      end if;
    end loop;
    return idx;
  end func_fill_subtype_idx;

  function func_count_link_types (mgt_list : mgt_inst_array_t; i_mgt_type : mgt_types_t)
    return integer is
    variable count : integer := 0;
  begin
    for I in 0 to mgt_list'length-1 loop
      if (mgt_list(I).mgt_type = i_mgt_type) then
        count := count + 1;
      end if;
    end loop;
    return count;
  end func_count_link_types;

  -- function to count number of polmuxes
  -- loop over the tdc link mapping and find how many polmuxes are needed for the
  -- number of tdcs requested in the user logic pkg
  function func_polmux_maxid (tdc_cnt_max : integer; mdt_config : mdt_config_t)
    return integer is
    variable tdc_cnt : integer := 0;
    variable max     : integer := 0;
    variable id      : integer;
  begin
    for I in 0 to mdt_config'length-1 loop
      tdc_cnt := tdc_cnt + count_ones(mdt_config(I).en);
      max     := mdt_config(I).polmux_id;
      if (tdc_cnt >= tdc_cnt_max) then
        return (max);
      end if;
    end loop;
    return -1;
  end func_polmux_maxid;

  -- function to count number of polmuxes
  -- loop over the tdc link mapping and find how many polmuxes are needed for the
  -- number of tdcs requested in the user logic pkg
  function func_count_polmux (tdc_cnt_max : integer; mdt_config : mdt_config_t; station : station_id_t)
    return integer is

    variable polmux_cnt             : integer                 := 0;
    -- 99 is just a random large number, larger than the # of polmuxes we could ever want
    variable polmux_already_counted : bool_array_t (-1 to 99) := (others => false);

    variable tdc_cnt : integer := 0;

  begin
    for I in 0 to mdt_config'length-1 loop

      tdc_cnt := tdc_cnt + count_ones(mdt_config(I).en);
      if (polmux_already_counted(mdt_config(I).polmux_id) = false
          and mdt_config(I).station_id = station) then
        polmux_already_counted(mdt_config(I).polmux_id) := true;
        polmux_cnt                                      := polmux_cnt + 1;
      end if;
      if (tdc_cnt >= tdc_cnt_max) then
        return polmux_cnt;
      end if;
    end loop;
    return -1;
  end func_count_polmux;

  -- function to count number of csms
  -- loop over the tdc link mapping and find how many csms are needed for the
  -- number of tdcs requested in the user logic pkg
  function func_count_csms_active (mdt_config : mdt_config_t; num_tdcs : integer)
    return integer is
    variable max       : integer := -1;
    variable tdc_count : integer := 0;
    variable csm_count : integer := 0;
  begin
    for I in mdt_config'range loop
      tdc_count := tdc_count + count_ones(mdt_config(I).en);
      csm_count := csm_count + 1;
      if (tdc_count >= num_tdcs) then
        return csm_count;
      end if;
    end loop;
    return -1;
  end func_count_csms_active;

end package body;
