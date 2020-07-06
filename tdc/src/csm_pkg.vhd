library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hal;
use hal.board_pkg_common.all;

package csm_pkg is

  -- FIXME: these should be real numbers based on the board design
  constant CSM_SCA_UPLINK_ELINK0   : integer := 0;
  constant CSM_SCA_UPLINK_ELINK1   : integer := 1;
  constant CSM_SCA_DOWNLINK_ELINK0 : integer := 0;  -- specify which 160 Mbps elink (0 to 15) is the SCA
  constant CSM_SCA_DOWNLINK_ELINK1 : integer := 1;  -- specify which 160 Mbps elink (0 to 15) is the SCA

  constant CSM_ENC_DOWNLINK_ELINK0 : integer := 2;  -- specify which 160 Mbps elink (0 to 15) is the ENC

  type int_array_t is array (integer range <>) of integer;

  type tdc_elink_pair is record
    ch1 : integer;
    ch2 : integer;
  end record;

  type elink_pair_map_t is array (integer range 0 to 17) of tdc_elink_pair;

  -- FIXME: update this map with real values from CSM schematic
  -- TODO: use a function to set this..? would probably be clearer
  constant elink_pair_map : elink_pair_map_t := (
    0  => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    1  => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    2  => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    3  => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    4  => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    5  => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    6  => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    7  => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    8  => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    9  => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    10 => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    11 => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    12 => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    13 => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    14 => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    15 => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    16 => (ch1 => 6*4+3, ch2 => 6*4+2),  -- 63 62
    17 => (ch1 => 6*4+3, ch2 => 6*4+2)   -- 63 62
    );

  -- FIXME: update these mappings once a real CSM is made that is actually useable
  -- create a list based on CSM hardware of which elinks are "primary" (even)
  -- elinks that can be connected to a tdc
  constant c_MASTER_ELINK_MAP : int_array_t (27 downto 0) := (
    -- allowed even e-links should be assigned to their pair
    0  => 1,
    2  => 3,
    4  => 5,
    6  => 7,
    8  => 9,
    10 => 11,
    12 => 13,
    14 => 15,
    16 => 17,
    18 => 19,
    20 => 21,
    22 => 23,
    24 => 25,
    26 => 27,
    -- disallowed e-links (SCA, odd pair)
    1  => -1,
    3  => -1,
    5  => -1,
    7  => -1,
    9  => -1,
    11 => -1,
    13 => -1,
    15 => -1,
    17 => -1,
    19 => -1,
    21 => -1,
    23 => -1,
    25 => -1,
    27 => -1
    );

  -- create a list based on CSM hardware of which elinks are "primary" (even)
  -- elinks that can be connected to a tdc
  constant c_SLAVE_ELINK_MAP : int_array_t (27 downto 0) := (
    -- allowed even e-links should be assigned to their pair
    0  => 1,
    2  => 3,
    4  => 5,
    6  => 7,
    8  => 9,
    10 => 11,
    12 => 13,
    14 => 15,
    16 => 17,
    18 => 19,
    20 => 21,
    22 => 23,
    24 => 25,
    26 => 27,
    -- disallowed e-links (SCA, odd pair)
    1  => -1,
    3  => -1,
    5  => -1,
    7  => -1,
    9  => -1,
    11 => -1,
    13 => -1,
    15 => -1,
    17 => -1,
    19 => -1,
    21 => -1,
    23 => -1,
    25 => -1,
    27 => -1
    );

  function func_get_tdc_odd_id (id : integer; mgt_type : mgt_types_t; master_map : int_array_t; slave_map : int_array_t) return integer;

end package csm_pkg;

package body csm_pkg is

  -- given a TDC map and a MGT link map, returns a count of the total number of TDC inputs instantiated
  function func_get_tdc_odd_id (id : integer; mgt_type : mgt_types_t; master_map : int_array_t; slave_map : int_array_t)
    return integer is
  begin
    if (mgt_type = MGT_LPGBT) then
      return master_map(id);
    elsif (mgt_type = MGT_LPGBT_SIMPLEX) then
      return slave_map(id);
    else
      return -1;
    end if;
  end func_get_tdc_odd_id;

end package body;
