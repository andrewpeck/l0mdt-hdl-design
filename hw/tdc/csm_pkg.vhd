library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package csm_pkg is

  -- FIXME: these should be real numbers based on the board design
  constant CSM_SCA_UPLINK_ELINK0 : integer := 0;
  constant CSM_SCA_UPLINK_ELINK1 : integer := 1;
  constant CSM_SCA_DOWNLINK_ELINK0 : integer := 0;  -- specify which 160 Mbps elink (0 to 15) is the SCA
  constant CSM_SCA_DOWNLINK_ELINK1 : integer := 1;  -- specify which 160 Mbps elink (0 to 15) is the SCA

  constant CSM_ENC_DOWNLINK_ELINK0 : integer := 2;  -- specify which 160 Mbps elink (0 to 15) is the ENC


  type int_pair_t is array (integer range 0 to 1) of integer;
  type int_array_t is array (integer range <>) of int_pair_t;


  -- TODO: add an assert to make sure only valid combinations are used
  -- TODO: update these mappings once a real CSM is made that is actually useable
  --
  -- create a list based on CSM hardware of which elinks are "primary" (even)
  -- elinks that can be connected to a tdc
  constant c_MASTER_ELINK_MAP : int_array_t (13 downto 0) := (
    0  => (0, 1),
    1  => (2, 3),
    2  => (4, 5),
    3  => (6, 7),
    4  => (8, 9),
    5  => (10, 11),
    6  => (12, 13),
    7  => (14, 15),
    8  => (16, 17),
    9  => (18, 19),
    10 => (20, 21),
    11 => (22, 23),
    12 => (24, 25),
    13 => (26, 27)
    );

  -- create a list based on CSM hardware of which elinks are "primary" (even)
  -- elinks that can be connected to a tdc
  constant c_SLAVE_ELINK_MAP : int_array_t (13 downto 0) := (
    0  => (0, 1),
    1  => (2, 3),
    2  => (4, 5),
    3  => (6, 7),
    4  => (8, 9),
    5  => (10, 11),
    6  => (12, 13),
    7  => (14, 15),
    8  => (16, 17),
    9  => (18, 19),
    10 => (20, 21),
    11 => (22, 23),
    12 => (24, 25),
    13 => (26, 27)
    );

end package csm_pkg;
