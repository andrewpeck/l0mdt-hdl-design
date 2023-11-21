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
    0  => (mgt_id_m => 32,  mgt_id_s => 33, station_id => INNER,  csm_id => 0, polmux_id => 0,  en => "00000000011111111111", legacy => "00000000000000000000"),
    1  => (mgt_id_m => 34,  mgt_id_s => 35, station_id => INNER,  csm_id => 1, polmux_id => 0,  en => "11111111100000000000", legacy => "00000000000000000000"),
    2  => (mgt_id_m => 36,  mgt_id_s => 37, station_id => INNER,  csm_id => 2, polmux_id => 1,  en => "00000000011111111100", legacy => "00000000000000000000"),
    3  => (mgt_id_m => 38,  mgt_id_s => 39, station_id => INNER,  csm_id => 3, polmux_id => 1,  en => "11111111100000000000", legacy => "00000000000000000000"),
    4  => (mgt_id_m => 40,  mgt_id_s => 41, station_id => INNER,  csm_id => 4, polmux_id => 2,  en => "11111111111111111100", legacy => "00000000000000000000"),
    5  => (mgt_id_m => 42,  mgt_id_s => 43, station_id => INNER,  csm_id => 5, polmux_id => 3,  en => "11111111111111111100", legacy => "00000000000000000000"),
    6  => (mgt_id_m => 44,  mgt_id_s => 45, station_id => INNER,  csm_id => 6, polmux_id => 4,  en => "11111111111111111100", legacy => "00000000000000000000"),
    7  => (mgt_id_m => 46,  mgt_id_s => 47, station_id => INNER,  csm_id => 7, polmux_id => 5,  en => "11111111111111111100", legacy => "00000000000000000000"),

    --SLR2
    8  => (mgt_id_m => 64,  mgt_id_s => 65, station_id => MIDDLE, csm_id => 0, polmux_id => 6,  en => "00000000011111111100", legacy => "00000000000000000000"),
    9  => (mgt_id_m => 66,  mgt_id_s => 67, station_id => MIDDLE, csm_id => 1, polmux_id => 6,  en => "11111111100000000000", legacy => "00000000000000000000"),
    10 => (mgt_id_m => 68,  mgt_id_s => 69, station_id => MIDDLE, csm_id => 2, polmux_id => 7,  en => "00000000011111111100", legacy => "00000000000000000000"),
    11 => (mgt_id_m => 70,  mgt_id_s => 71, station_id => MIDDLE, csm_id => 3, polmux_id => 7,  en => "11111111100000000000", legacy => "00000000000000000000"),
    12 => (mgt_id_m => 72,  mgt_id_s => 73, station_id => MIDDLE, csm_id => 4, polmux_id => 8,  en => "11111111111111111100", legacy => "00000000000000000000"),
    13 => (mgt_id_m => 74,  mgt_id_s => 75, station_id => MIDDLE, csm_id => 5, polmux_id => 9,  en => "11111111111111111100", legacy => "00000000000000000000"),
    14 => (mgt_id_m => 76,  mgt_id_s => 77, station_id => MIDDLE, csm_id => 6, polmux_id => 10, en => "11111111111111111100", legacy => "00000000000000000000"),
    15 => (mgt_id_m => 78,  mgt_id_s => 79, station_id => MIDDLE, csm_id => 7, polmux_id => 11, en => "11111111111111111100", legacy => "00000000000000000000"),

    --SLR3
    16 => (mgt_id_m => 96,  mgt_id_s => 97,  station_id => OUTER, csm_id => 0, polmux_id => 12, en => "00000000011111111100", legacy => "00000000000000000000"),
    17 => (mgt_id_m => 98,  mgt_id_s => 99,  station_id => OUTER, csm_id => 1, polmux_id => 12, en => "11111111100000000000", legacy => "00000000000000000000"),
    18 => (mgt_id_m => 100, mgt_id_s => 101, station_id => OUTER, csm_id => 2, polmux_id => 13, en => "00000000011111111100", legacy => "00000000000000000000"),
    19 => (mgt_id_m => 102, mgt_id_s => 103, station_id => OUTER, csm_id => 3, polmux_id => 13, en => "11111111100000000000", legacy => "00000000000000000000"),
    20 => (mgt_id_m => 104, mgt_id_s => 105, station_id => OUTER, csm_id => 4, polmux_id => 14, en => "11111111111111111100", legacy => "00000000000000000000"),
    21 => (mgt_id_m => 106, mgt_id_s => 107, station_id => OUTER, csm_id => 5, polmux_id => 15, en => "11111111111111111100", legacy => "00000000000000000000"),
    22 => (mgt_id_m => 108, mgt_id_s => 109, station_id => OUTER, csm_id => 6, polmux_id => 16, en => "11111111111111111100", legacy => "00000000000000000000"),
    23 => (mgt_id_m => 110, mgt_id_s => 111, station_id => OUTER, csm_id => 7, polmux_id => 17, en => "11111111111111111100", legacy => "00000000000000000000")
    );

end package link_map;
