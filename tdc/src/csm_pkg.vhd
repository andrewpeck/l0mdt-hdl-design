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

  -- for each CSM channel (0-17) specify an elink pair (0-27)
  -- to match LpGBT / CSM naming specify as G*4+P
  -- where G and P are the group and pair,
  -- e.g. 63 = group 6 pair 3 = channel 27
  constant elink_pair_map : elink_pair_map_t := (
    0  => (ch1 => 6*4+3, ch2 => 6*4+2), -- M
    1  => (ch1 => 5*4+1, ch2 => 5*4+0), -- M
    2  => (ch1 => 6*4+1, ch2 => 6*4+0), -- M
    3  => (ch1 => 4*4+3, ch2 => 4*4+2), -- M
    4  => (ch1 => 5*4+3, ch2 => 5*4+2), -- M
    5  => (ch1 => 1*4+0, ch2 => 1*4+1), -- M
    6  => (ch1 => 0*4+0, ch2 => 0*4+1), -- M
    7  => (ch1 => 1*4+2, ch2 => 1*4+3), -- M
    8  => (ch1 => 0*4+2, ch2 => 0*4+3), -- M
    9  => (ch1 => 2*4+0, ch2 => 2*4+1), -- M
    10 => (ch1 => 6*4+3, ch2 => 6*4+2), -- S
    11 => (ch1 => 4*4+1, ch2 => 4*4+0), -- S
    12 => (ch1 => 6*4+1, ch2 => 6*4+0), -- S
    13 => (ch1 => 3*4+3, ch2 => 3*4+2), -- S
    14 => (ch1 => 4*4+3, ch2 => 4*4+2), -- S
    15 => (ch1 => 1*4+0, ch2 => 1*4+1), -- S
    16 => (ch1 => 0*4+0, ch2 => 0*4+1), -- S
    17 => (ch1 => 1*4+2, ch2 => 1*4+3)  -- S
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
