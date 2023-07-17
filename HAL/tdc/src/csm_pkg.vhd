library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hal;
use hal.board_pkg_common.all;

package csm_pkg is

  constant CSM_ENC_DOWNLINK : integer := 0;  -- specify which 80 Mbps elink (0 to 15) is the ENC

  constant CSM_SCA0_UP_PRI : integer := -1;     -- specify which 80 Mbps elink (0 to 15) is the SCA
  constant CSM_SCA1_UP_PRI : integer := 4*3+0;  -- specify which 80 Mbps elink (0 to 15) is the SCA
  constant CSM_SCA2_UP_PRI : integer := 4*3+2;  -- specify which 80 Mbps elink (0 to 15) is the SCA
  constant CSM_SCA0_UP_AUX : integer := 4*4+1;  -- specify which 80 Mbps elink (0 to 15) is the SCA
  constant CSM_SCA1_UP_AUX : integer := 4*2+3;  -- specify which 80 Mbps elink (0 to 15) is the SCA
  constant CSM_SCA2_UP_AUX : integer := 4*3+1;  -- specify which 80 Mbps elink (0 to 15) is the SCA

  constant CSM_SCA0_DOWN_PRI : integer := -1;       -- specify which 80 Mbps elink (0 to 15) is the SCA
  constant CSM_SCA1_DOWN_PRI : integer := (4*1)+1;  -- specify which 80 Mbps elink (0 to 15) is the SCA
  constant CSM_SCA2_DOWN_PRI : integer := (4*2)+0;  -- specify which 80 Mbps elink (0 to 15) is the SCA
  constant CSM_SCA0_DOWN_AUX : integer := (4*2)+3;  -- specify which 80 Mbps elink (0 to 15) is the SCA
  constant CSM_SCA1_DOWN_AUX : integer := (4*1)+2;  -- specify which 80 Mbps elink (0 to 15) is the SCA
  constant CSM_SCA2_DOWN_AUX : integer := (4*1)+3;  -- specify which 80 Mbps elink (0 to 15) is the SCA

  constant CSM_SCA0_UP : integer := CSM_SCA0_UP_AUX;
  constant CSM_SCA1_UP : integer := CSM_SCA1_UP_PRI;
  constant CSM_SCA2_UP : integer := CSM_SCA2_UP_PRI;

  constant CSM_SCA0_DOWN : integer := CSM_SCA0_DOWN_AUX;
  constant CSM_SCA1_DOWN : integer := CSM_SCA1_DOWN_PRI;
  constant CSM_SCA2_DOWN : integer := CSM_SCA2_DOWN_PRI;

  type int_array_t is array (integer range <>) of integer;

  -- for each CSM channel (0-19) specify an elink pair (0-27)
  -- to match LpGBT / CSM naming specify as G*4+P
  -- where G and P are the group and pair,
  -- e.g. 63 = group 6 pair 3 = channel 27

  type tdc_elink_pair is record
    lpgbt : integer;
    ch1   : integer;
    ch2   : integer;
  end record;

  type elink_pair_map_t is array (integer range 0 to 19) of tdc_elink_pair;

  constant elink_pair_map : elink_pair_map_t := (
    0  => (lpgbt => 0, ch1 => 6*4+3, ch2 => 6*4+2),  -- M
    1  => (lpgbt => 0, ch1 => 5*4+1, ch2 => 5*4+0),  -- M
    2  => (lpgbt => 0, ch1 => 6*4+1, ch2 => 6*4+0),  -- M
    3  => (lpgbt => 0, ch1 => 4*4+3, ch2 => 4*4+2),  -- M
    4  => (lpgbt => 0, ch1 => 5*4+3, ch2 => 5*4+2),  -- M
    5  => (lpgbt => 0, ch1 => 1*4+0, ch2 => 1*4+1),  -- M
    6  => (lpgbt => 0, ch1 => 0*4+0, ch2 => 0*4+1),  -- M
    7  => (lpgbt => 0, ch1 => 1*4+2, ch2 => 1*4+3),  -- M
    8  => (lpgbt => 0, ch1 => 0*4+2, ch2 => 0*4+3),  -- M
    9  => (lpgbt => 0, ch1 => 2*4+0, ch2 => 2*4+1),  -- M
    10 => (lpgbt => 1, ch1 => 6*4+3, ch2 => 6*4+2),  -- S
    11 => (lpgbt => 1, ch1 => 4*4+1, ch2 => 4*4+0),  -- S
    12 => (lpgbt => 1, ch1 => 6*4+1, ch2 => 6*4+0),  -- S
    13 => (lpgbt => 1, ch1 => 3*4+3, ch2 => 3*4+2),  -- S
    14 => (lpgbt => 1, ch1 => 4*4+3, ch2 => 4*4+2),  -- S
    15 => (lpgbt => 1, ch1 => 1*4+0, ch2 => 1*4+1),  -- S
    16 => (lpgbt => 1, ch1 => 0*4+0, ch2 => 0*4+1),  -- S
    17 => (lpgbt => 1, ch1 => 1*4+2, ch2 => 1*4+3),  -- S
    18 => (lpgbt => 1, ch1 => 0*4+2, ch2 => 0*4+3),  -- S
    19 => (lpgbt => 1, ch1 => 2*4+0, ch2 => 2*4+1)   -- S
    );

end package csm_pkg;
