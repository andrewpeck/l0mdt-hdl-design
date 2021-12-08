library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
library shared_lib;
use shared_lib.config_pkg.all;

package fm_ult_pkg is

  constant mon_dw_max     : integer := 256;

  constant stations_n       : integer := c_MAX_NUM_HPS; -- INN, MID, OUT
  constant threads_n        : integer := c_NUM_THREADS;





  constant sf_sb_n                  : integer := 3;
  constant sf_sb_single_station_n   : integer := sf_sb_n * threads_n;


  constant h2s_sb_single_station_n  : integer := sf_sb_single_station_n;
  constant h2s_sb_all_station_n     : integer := h2s_sb_single_station_n * stations_n;
  constant total_sb                 : integer := h2s_sb_all_station_n ;
  type fm_rt is record
    fm_data : std_logic_vector(mon_dw_max-1 downto 0);
    fm_vld  : std_logic;
  end record fm_rt;
  function len(x:fm_rt) return natural;
 
  
  function vectorify(x:fm_rt; t: std_logic_vector) return std_logic_vector;
  
    
  type fm_rt_array   is array (integer range<>) of fm_rt;
  type fm_rt_array_v is array (integer range<>) of std_logic_vector;
  type fm_data_avt   is array(integer range<>) of std_logic_vector(mon_dw_max+1 -1 downto 0);
  
  type sf_single_station_array is array (0 to c_NUM_THREADS-1) of fm_rt_array( 0 to sf_sb_n-1);

end package fm_ult_pkg;

package body fm_ult_pkg is
  function len(x:fm_rt) return natural is
    variable l: natural :=0;
  begin
    l := l + mon_dw_max;
    l := l + 1;
    return l;
  end function len;
  
  function vectorify(x:fm_rt; t: std_logic_vector) return std_logic_vector is
    variable left: natural := t'left;
    variable y   : std_logic_vector(t'range);
    begin
      if t'ascending then
         y := x.fm_data & x.fm_vld;
       else
         y := x.fm_vld & x.fm_data;       

         
      end if;
    return y;
  end function vectorify;



end package body fm_ult_pkg;
  
