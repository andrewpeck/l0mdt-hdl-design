library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package fm_sb_pkg is
  constant total_sb       : integer := 2;
  constant mon_dw_max     : integer := 256;

  type fm_rt is record
    fm_data : std_logic_vector(mon_dw_max-1 downto 0);
    fm_vld  : std_logic;
  end record fm_rt;

  type fm_rt_array is array (integer range<>) of fm_rt;
  type t_mon_a is array (0 to total_sb-1) of std_logic_vector(mon_dw_max-1 downto 0);
end package fm_sb_pkg;
