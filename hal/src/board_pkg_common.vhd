library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package board_pkg_common is

  --------------------------------------------------------------------------------
  -- MGT Mapping
  --------------------------------------------------------------------------------

  type gt_types_t is (GT_NIL, GTH, GTY);

  type mgt_types_t is (MGT_NIL,
                       MGT_LPGBT_SIMPLEX,
                       MGT_LPGBT,
                       MGT_LPGBT_EMUL,
                       MGT_C2C,
                       MGT_SL,
                       MGT_FELIX_UP,
                       MGT_FELIX_DOWN
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

  type refclk_types_t is (REFCLK_SYNC320, REFCLK_SYNC240, REFCLK_NIL);

  type refclk_types_array_t is array (integer range <>) of refclk_types_t;

  type station_id_t is (INNER, MIDDLE, OUTER, NIL);

  --------------------------------------------------------------------------------
  -- CSM Mapping
  --------------------------------------------------------------------------------

  type tdc_link_map_t is record
    link_id    : integer;
    elink      : integer;
    station_id : station_id_t;
    polmux_id  : integer;
    legacy     : boolean;
  end record;
  type tdc_link_map_array_t is array (integer range <>) of tdc_link_map_t;

  --------------------------------------------------------------------------------
  -- Utility Functions
  --------------------------------------------------------------------------------

  type int_array_t is array (integer range <>) of integer;

  function func_fill_subtype_idx (cnt_max : integer; mgt_list : mgt_inst_array_t; i_mgt_type : mgt_types_t; i_mgt_type_alt : mgt_types_t)
    return int_array_t;

  function func_count_link_types (mgt_list : mgt_inst_array_t; i_mgt_type : mgt_types_t)
    return integer;

  function func_count_tdc_links (tdc_map : tdc_link_map_array_t; mgt_list : mgt_inst_array_t)
    return integer;

  function func_count_polmux (tdc_map : tdc_link_map_array_t; num_tdcs : integer; station: station_id_t)
    return integer;

  function func_count_lpgbt_link_mapped_to_csm (tdc_map : tdc_link_map_array_t; num_tdcs : integer)
    return integer;

end package board_pkg_common;

package body board_pkg_common is

  -- given a TDC map and a MGT link map, returns a count of the total number of TDC inputs instantiated
  function func_count_tdc_links (tdc_map : tdc_link_map_array_t; mgt_list : mgt_inst_array_t)
    return integer is
    variable count : integer := 0;
  begin
    for I in 0 to tdc_map'length-1 loop
      if (tdc_map(I).link_id >= 0) then
        assert ((mgt_list(tdc_map(I).link_id).mgt_type = MGT_LPGBT) or mgt_list(tdc_map(I).link_id).mgt_type = MGT_LPGBT_SIMPLEX) report "c_TDC_LINK_MAP specifies a tdc input on a non-lpgbt link" severity error;
        count := count + 1;
      end if;
    end loop;
    return count;
  end func_count_tdc_links;

  function func_fill_subtype_idx (cnt_max : integer; mgt_list : mgt_inst_array_t; i_mgt_type : mgt_types_t; i_mgt_type_alt : mgt_types_t)
    return int_array_t is
    variable count : integer := 0;
    variable idx   : int_array_t (0 to mgt_list'length-1);
  begin
    for I in 0 to mgt_list'length-1 loop
      if (count < cnt_max and (mgt_list(I).mgt_type = i_mgt_type or mgt_list(I).mgt_type = i_mgt_type_alt)) then
        idx(I) := count;
        count  := count + 1;
      else
        idx(I) := -1;
      end if;
    end loop;  -- I
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
  function func_count_polmux (tdc_map : tdc_link_map_array_t; num_tdcs : integer; station: station_id_t)
    return integer is
    variable max : integer := 0;
  begin
    for I in 0 to num_tdcs-1 loop
      if (tdc_map(I).polmux_id > max and station=tdc_map(I).station_id) then
        max := tdc_map(I).polmux_id;
      end if;
    end loop;
    return max+1;                       -- the count is the index of the highest number + 1
  end func_count_polmux;

  -- function to count number of lpgbts
  -- loop over the tdc link mapping and find how many lpgbts are needed for the
  -- number of tdcs requested in the user logic pkg
  function func_count_lpgbt_link_mapped_to_csm (tdc_map : tdc_link_map_array_t; num_tdcs : integer)
    return integer is
    variable max : integer := 0;
  begin
    for I in 0 to num_tdcs-1 loop
      if (tdc_map(I).link_id > max) then
        max := tdc_map(I).link_id;
      end if;
    end loop;

    -- count is index + 1
    max := max + 1;

    -- in the case odd number uplink requested, force it to next multiple of 2 (CSM is always 2tx+1rx)
    if (max mod 2 /= 0) then
      max := max + 1;
    end if;

    return max;

  end func_count_lpgbt_link_mapped_to_csm;

end package body;
