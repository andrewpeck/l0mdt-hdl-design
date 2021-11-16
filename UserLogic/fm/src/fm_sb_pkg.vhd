library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
library shared_lib;
use shared_lib.config_pkg.all;

package fm_sb_pkg is

  constant mon_dw_max     : integer := 256;

  constant stations_n       : integer := 3; -- INN, MID, OUT
  constant threads_n        : integer := c_NUM_THREADS; -- INN, MID, OUT





  constant sf_sb_n                  : integer := 3;
  constant sf_sb_single_station_n   : integer := sf_sb_n * threads_n;


  constant h2s_sb_single_station_n  : integer := sf_sb_single_station_n;
  constant h2s_sb_all_station_n     : integer := h2s_sb_single_station_n * stations_n;
  constant total_sb                 : integer := h2s_sb_all_station_n ;
  type fm_rt is record
    fm_data : std_logic_vector(mon_dw_max-1 downto 0);
    fm_vld  : std_logic;
  end record fm_rt;

  type fm_rt_array is array (integer range<>) of fm_rt;
  type fm_rt_array_2 is array (integer range<>) of fm_rt_array( 0 to c_NUM_THREADS-1);
  type t_mon_a is array (0 to total_sb-1) of std_logic_vector(mon_dw_max-1 downto 0);
end package fm_sb_pkg;
