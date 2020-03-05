library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package board_pkg_common is

  type gt_types_t is (GT_NIL, GTH, GTY);

  type mgt_types_t is (MGT_NIL, MGT_LPGBT_SIMPLEX, MGT_LPGBT, MGT_LPGBT_EMUL, MGT_C2C, MGT_SL, MGT_TCDS, MGT_FELIX);

  type refclk_types_t is (REFCLK_SYNC320, REFCLK_SYNC240, REFCLK_NIL);


  type mgt_inst_t is record
    mgt_type : mgt_types_t;
    refclk   : integer;
    gt_type  : gt_types_t;
    x_loc    : integer;
    y_loc    : integer;
  end record;

  type mgt_map_t is record
    mgt_id : integer;
  end record;

  type mgt_info_t is record
    gt_type      : gt_types_t;
    refclk0_freq : real;
    refclk1_freq : real;
  end record;

  constant c_mgtinfo_nil : mgt_info_t := (GT_NIL, 0.0, 0.0);
  constant c_mgt_nil     : mgt_inst_t := (MGT_NIL, -1, GT_NIL, -1, -1);

  type mgt_inst_array_t is array (integer range <>) of mgt_inst_t;
  type mgt_info_array_t is array (integer range <>) of mgt_info_t;
  type mgt_map_array_t is array (integer range <>) of mgt_map_t;

  type refclk_types_array_t is array (integer range <>) of refclk_types_t;

  type station_id_t is (INNER, MIDDLE, OUTER, EXTRA);
  type tdc_link_map_t is record
    lpgbt_link : integer;
    even_elink : integer;
    odd_elink  : integer;
    station_id : integer;
  end record;
  type tdc_link_map_array_t is array (integer range <>) of tdc_link_map_t;

  --type mgt_subtype_idx_array is array (0 to c_NUM_MGTS-1) of integer;

  type int_array_t is array (integer range <>) of integer;

  function func_fill_subtype_idx (cnt_max : integer; mgt_list : mgt_inst_array_t; i_mgt_type : mgt_types_t; i_mgt_type_alt : mgt_types_t)
    return int_array_t;

  function func_count_link_types (mgt_list : mgt_inst_array_t; i_mgt_type : mgt_types_t)
    return integer;


end package board_pkg_common;

package body board_pkg_common is

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
        count  := count + 1;
      end if;
    end loop;
    return count;
  end func_count_link_types;

end package body;
