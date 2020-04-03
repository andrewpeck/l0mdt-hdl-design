
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package priority_encoder_pkg is
  type bus_array is array(natural range <>) of std_logic_vector;

end package;

package body priority_encoder_pkg is

  function flatten_bus (arr : TDCPOLMUX_rt_array) return std_logic_vector is
    variable ret : std_logic_vector (TDCPOLMUX_LEN*arr'length-1);
  begin
    for I in 0 to arr'length-1 loop
      ret((I+1)*TDCPOLMUX_LEN-1 downto I*TDCPOLMUX_LEN) := tdcpolmux_2af(arr(I));
    end loop;
    return ret;
  end function;

  function unflatten_bus (vec : std_logic_vector) return TDCPOLMUX_rt_array is
    variable ret : TDCPOLMUX_rt_array (vec'length / TDCPOLMUX_LEN - 1 downto 0);
  begin
    for I in 0 to vec'length / TDCPOLMUX_LEN -1 loop
      ret(I) <= tdcpolmux_2rf(vec((I+1)*TDCPOLMUX_len -1 downto I*TDCPOLMUX_len));
    end loop;
    return ret;
  end function;

end package body;
