library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared;
use shared.common_pkg.all;
use shared.config_pkg.all;

package ucm_pkg_pkg is

  type ucm_prepro_rt is record
     data_valid           :  std_logic;
  end record ucm_prepro_rt;
  constant UCM_PREPRO_LEN : integer := 1;
  subtype ucm_prepro_rvt is std_logic_vector(UCM_PREPRO_LEN-1 downto 0);
  function vectorify(x: ucm_prepro_rt) return ucm_prepro_rvt;
  function structify(x: ucm_prepro_rvt) return ucm_prepro_rt;
  function nullify (x: ucm_prepro_rt) return ucm_prepro_rt;

end package ucm_pkg_pkg;

------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared;
use shared.common_pkg.all;
use shared.config_pkg.all;
package body ucm_pkg_pkg is

  function vectorify(x: ucm_prepro_rt) return ucm_prepro_rvt is
    variable y : ucm_prepro_rvt;
  begin
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: ucm_prepro_rvt) return ucm_prepro_rt is
    variable y : ucm_prepro_rt;
  begin
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: ucm_prepro_rt) return ucm_prepro_rt is
    variable y : ucm_prepro_rt;
  begin
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

end package body ucm_pkg_pkg;
