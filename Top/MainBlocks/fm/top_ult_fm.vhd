library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;


library ult_lib;
use ult_lib.all;


library ctrl_lib;
use ctrl_lib.FM_CTRL.all;

library fm_lib;
use fm_lib.fm_ult_pkg.all;

library xil_defaultlib;
use xil_defaultlib.all;

library ult_lib;
use ult_lib.all;

entity top_ult_fm is
  port(
   clock_and_control : in  l0mdt_control_rt;
   ttc_commands       : in  l0mdt_ttc_rt;
   fm_ctrl_v                : in std_logic_vector(2318 downto 0); --M_CTRL_t;
   fm_mon_v              : out std_logic_vector(1781 downto 0); --FM_MON_t;
   h2s_fm_data          : in fm_rt_array(0  to h2s_sb_all_station_n -1)
   --ult_fm_data       : in fm_rt_array ( 0 to total_sb-1)
    );
  end entity top_ult_fm;

  architecture behavioral of top_ult_fm is
    signal fm_ctrl_r           : FM_CTRL_t;
    signal fm_mon_r            : FM_MON_t;


    begin

   
     ult_fm_inst :  entity ult_lib.ult_fm
     port map (
       clock_and_control => clock_and_control,
       ttc_commands     => ttc_commands,
       ctrl_v           => fm_ctrl_v,
       mon_v            => fm_mon_v,
       h2s_fm_data      => h2s_fm_data
       );

    end behavioral;
