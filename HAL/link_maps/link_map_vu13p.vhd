library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.board_pkg_common.all;

package link_map is

  constant c_MDT_CONFIG : mdt_config_t (23 downto 0) := (
    --SLR0
    --n/a
    --sector logic / c2c / felix

    --SLR1
    0  => (station_id => INNER,  csm_id => 1, polmux_id => 0,  en => "000000000111111111", legacy => "000000000000000000"),
    1  => (station_id => INNER,  csm_id => 2, polmux_id => 0,  en => "111111111000000000", legacy => "000000000000000000"),
    2  => (station_id => INNER,  csm_id => 3, polmux_id => 1,  en => "000000000111111111", legacy => "000000000000000000"),
    3  => (station_id => INNER,  csm_id => 4, polmux_id => 1,  en => "111111111000000000", legacy => "000000000000000000"),
    4  => (station_id => INNER,  csm_id => 5, polmux_id => 2,  en => "111111111111111111", legacy => "000000000000000000"),
    5  => (station_id => INNER,  csm_id => 6, polmux_id => 3,  en => "111111111111111111", legacy => "000000000000000000"),
    6  => (station_id => INNER,  csm_id => 7, polmux_id => 4,  en => "111111111111111111", legacy => "000000000000000000"),
    7  => (station_id => INNER,  csm_id => 8, polmux_id => 5,  en => "111111111111111111", legacy => "000000000000000000"),

    --SLR2
    8  => (station_id => MIDDLE, csm_id => 1, polmux_id => 6,  en => "000000000111111111", legacy => "000000000000000000"),
    9  => (station_id => MIDDLE, csm_id => 2, polmux_id => 6,  en => "111111111000000000", legacy => "000000000000000000"),
    10 => (station_id => MIDDLE, csm_id => 3, polmux_id => 7,  en => "000000000111111111", legacy => "000000000000000000"),
    11 => (station_id => MIDDLE, csm_id => 4, polmux_id => 7,  en => "111111111000000000", legacy => "000000000000000000"),
    12 => (station_id => MIDDLE, csm_id => 5, polmux_id => 8,  en => "111111111111111111", legacy => "000000000000000000"),
    13 => (station_id => MIDDLE, csm_id => 6, polmux_id => 9,  en => "111111111111111111", legacy => "000000000000000000"),
    14 => (station_id => MIDDLE, csm_id => 7, polmux_id => 10, en => "111111111111111111", legacy => "000000000000000000"),
    15 => (station_id => MIDDLE, csm_id => 8, polmux_id => 11, en => "111111111111111111", legacy => "000000000000000000"),

    --SLR3
    16 => (station_id => OUTER,  csm_id => 1, polmux_id => 12, en => "000000000111111111", legacy => "000000000000000000"),
    17 => (station_id => OUTER,  csm_id => 2, polmux_id => 12, en => "111111111000000000", legacy => "000000000000000000"),
    18 => (station_id => OUTER,  csm_id => 3, polmux_id => 13, en => "000000000111111111", legacy => "000000000000000000"),
    19 => (station_id => OUTER,  csm_id => 4, polmux_id => 13, en => "111111111000000000", legacy => "000000000000000000"),
    20 => (station_id => OUTER,  csm_id => 5, polmux_id => 14, en => "111111111111111111", legacy => "000000000000000000"),
    21 => (station_id => OUTER,  csm_id => 6, polmux_id => 15, en => "111111111111111111", legacy => "000000000000000000"),
    22 => (station_id => OUTER,  csm_id => 7, polmux_id => 16, en => "111111111111111111", legacy => "000000000000000000"),
    23 => (station_id => OUTER,  csm_id => 8, polmux_id => 17, en => "111111111111111111", legacy => "000000000000000000")
    );

end package link_map;
