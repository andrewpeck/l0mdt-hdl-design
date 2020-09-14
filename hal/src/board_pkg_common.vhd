library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package board_pkg_common is

  --------------------------------------------------------------------------------
  -- MGT Mapping
  --------------------------------------------------------------------------------

  type station_t is (BARREL, ENDCAP, NIL);

  type gt_types_t is (GT_NIL, GTH, GTY);

  type mgt_types_t is (MGT_NIL,
                       MGT_LPGBT_SIMPLEX,
                       MGT_LPGBT,
                       MGT_LPGBT_EMUL,
                       MGT_C2C,
                       MGT_SL,
                       MGT_FELIX_TXRX,
                       MGT_FELIX
                       );

  type mgt_inst_t is record
    mgt_type : mgt_types_t;
    refclk   : integer;
    gt_type  : gt_types_t;
    x_loc    : integer;
    y_loc    : integer;
  end record;

  constant MGT_NIL_MAP : mgt_inst_t := (mgt_type => MGT_NIL,
                                        refclk   => -1,
                                        gt_type  => GT_NIL,
                                        x_loc    => -1,
                                        y_loc    => -1
                                        );

  type mgt_inst_array_t is array (integer range <>) of mgt_inst_t;

  --------------------------------------------------------------------------------
  -- REFCLK Mapping
  --------------------------------------------------------------------------------

  type refclk_freqs_t is (REF_AXI_C2C, REF_FELIX, REF_SF_C2C, REF_SYNC320, REF_SYNC240, REF_NIL);

  type refclk_map_t is record
    REFCLKNUM : integer;
    FREQ      : refclk_freqs_t;
    QUAD      : integer;
    GT_TYPE   : gt_types_t;
    X_LOC     : integer;
    Y_MIN     : integer;
    Y_MAX     : integer;
  end record;

  constant REFCLK_NIL_MAP : refclk_map_t := (refclknum => -1,
                                             freq      => REF_NIL,
                                             quad      => -1,
                                             gt_type   => GT_NIL,
                                             x_loc     => -1,
                                             y_min     => -1,
                                             y_max     => -1
                                             );

  type refclk_types_array_t is array (integer range <>) of refclk_map_t;

  type station_id_t is (INNER, MIDDLE, OUTER, EXTRA, NIL);

  type station_array_t is array (integer range <>) of station_id_t;
  constant stations : station_array_t (0 to 3) := (INNER, MIDDLE, OUTER, EXTRA);
  type station_str_array_t is array (integer range <>) of string (1 to 3);
  constant stations_str : station_str_array_t (0 to 3) := ("INN", "MID", "OUT", "EXT");

  type tdc_hit_t is record
    station  : station_id_t;
    csm : integer range 0 to 17;
    polmux : integer range 0 to 17;
    data : std_logic_vector (31 downto 0);
    valid : std_logic;
  end record;
  type tdc_hit_array_t is array (integer range <>) of tdc_hit_t;

  --------------------------------------------------------------------------------
  -- CSM Mapping
  --------------------------------------------------------------------------------

  type csm_config_t is record
    polmux_id  : integer;
    csm_id     : integer;
    en         : std_logic_vector (17 downto 0);
    legacy     : std_logic_vector (17 downto 0);
    station_id : station_id_t;
  end record;

  type mdt_config_t is array (integer range <>) of csm_config_t;

  --------------------------------------------------------------------------------
  -- Utility Functions
  --------------------------------------------------------------------------------

  type int_array_t is array (integer range <>) of integer;
  type bool_array_t is array (integer range <>) of boolean;

  function count_ones(slv : std_logic_vector) return natural ;

  function func_fill_subtype_idx (cnt_max : integer; mgt_list : mgt_inst_array_t; i_mgt_type : mgt_types_t; i_mgt_type_alt : mgt_types_t)
    return int_array_t;

  --function func_fill_polmux_idx (tdc_cnt_max: integer; mdt_config : mdt_config_t; num_polmux : integer; station : station_id_t)
  --  return int_array_t;

  function func_count_link_types (mgt_list : mgt_inst_array_t; i_mgt_type : mgt_types_t)
    return integer;

  function func_count_tdc_links (max : integer; mdt_config : mdt_config_t)
    return integer;

  function func_count_polmux (tdc_cnt_max: integer; mdt_config : mdt_config_t; station : station_id_t)
    return integer;

  function func_polmux_maxid (tdc_cnt_max: integer; mdt_config : mdt_config_t)
    return integer;

  function func_count_lpgbt_link_mapped_to_csm (mdt_config : mdt_config_t; num_tdcs : integer)
    return integer;

end package board_pkg_common;

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

  function func_fill_subtype_idx (cnt_max : integer; mgt_list : mgt_inst_array_t; i_mgt_type : mgt_types_t; i_mgt_type_alt : mgt_types_t)
    return int_array_t is
    variable count : integer := 0;
    variable idx   : int_array_t (0 to mgt_list'length-1) := (others => -1);
  begin
    for I in 0 to mgt_list'length-1 loop
      if (count < cnt_max and (mgt_list(I).mgt_type = i_mgt_type or mgt_list(I).mgt_type = i_mgt_type_alt)) then
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

  --function func_fill_polmux_idx (tdc_cnt_max: integer; mdt_config : mdt_config_t; num_polmux : integer; station : station_id_t)
  --  return int_array_t is
  --  variable polmux_already_counted : bool_array_t (-1 to 99) := (others => false);
  --  -- 99 is just a random large number, larger than the # of polmuxes we could ever want
  --  variable tdc_cnt : integer := 0;
  --  variable cnt     : integer := 0;
  --  variable idx_arr : int_array_t (0 to num_polmux) := (others => -1);
  --begin
  --  assert false report "num_polmux=" & integer'image(num_polmux) severity note;
  --  for I in 0 to mdt_config'length-1 loop

  --    if (mdt_config(I).link_id /= -1) then
  --      tdc_cnt := tdc_cnt + 1;
  --    end if;

  --    if (tdc_cnt < tdc_cnt_max and polmux_already_counted(mdt_config(I).polmux_id)=false) then
  --      if (station = mdt_config(I).station_id) then
  --        polmux_already_counted(mdt_config(I).polmux_id) := true;
  --        idx_arr(mdt_config(I).polmux_id) := cnt;
  --        if (cnt = num_polmux-1) then
  --          return idx_arr;
  --        else
  --          cnt := cnt + 1;
  --        end if;
  --      end if;
  --    end if;
  --  end loop;
  --  return idx_arr;
  --end func_fill_polmux_idx;

  -- function to count number of polmuxes
  -- loop over the tdc link mapping and find how many polmuxes are needed for the
  -- number of tdcs requested in the user logic pkg
  function func_polmux_maxid (tdc_cnt_max: integer; mdt_config : mdt_config_t)
    return integer is
    variable tdc_cnt : integer := 0;
    variable max : integer := 0;
    variable id : integer;
  begin
    for I in 0 to mdt_config'length-1 loop
      tdc_cnt := tdc_cnt + count_ones(mdt_config(I).en);
      max := mdt_config(I).polmux_id;
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

    variable polmux_cnt : integer := 0;
    -- 99 is just a random large number, larger than the # of polmuxes we could ever want
    variable polmux_already_counted : bool_array_t (-1 to 99) := (others => false);

    variable tdc_cnt : integer := 0;

  begin
    for I in 0 to mdt_config'length-1 loop

      tdc_cnt := tdc_cnt + count_ones(mdt_config(I).en);
      if (polmux_already_counted(mdt_config(I).polmux_id)=false
          and mdt_config(I).station_id = station) then
        polmux_already_counted(mdt_config(I).polmux_id) := true;
        polmux_cnt := polmux_cnt + 1;
      end if;
      if (tdc_cnt >= tdc_cnt_max) then
        return polmux_cnt;
      end if;
    end loop;
    return -1;
  end func_count_polmux;

  -- function to count number of lpgbts
  -- loop over the tdc link mapping and find how many lpgbts are needed for the
  -- number of tdcs requested in the user logic pkg
  function func_count_lpgbt_link_mapped_to_csm (mdt_config : mdt_config_t; num_tdcs : integer)
    return integer is
    variable max : integer := -1;
    variable tdc_count : integer := 0;
    variable link_count : integer := 0;
  begin
    for I in mdt_config'range loop
      tdc_count := count_ones(mdt_config(I).en);
      link_count := link_count + 1;
      if (tdc_count >= num_tdcs) then
        -- in the case odd number uplink requested, force it to next multiple of 2 (CSM is always 2tx+1rx)
        if (link_count > 0 and (link_count mod 2 /= 0)) then
          return link_count;
        end if;
      end if;
    end loop;
    return link_count;

  end func_count_lpgbt_link_mapped_to_csm;

end package body;
