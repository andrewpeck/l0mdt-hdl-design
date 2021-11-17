library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;


library project_lib;
use project_lib.prj_cfg.all;

library ult_lib;
use ult_lib.all;


library ctrl_lib;
use ctrl_lib.FM_CTRL.all;

library fm_lib;
use fm_lib.fm_sb_pkg.all;

library xil_defaultlib;
use xil_defaultlib.all;

library ult_lib;
use ult_lib.all;

entity top_ult_fm is
  port(
   clock_and_control : in  l0mdt_control_rt;
   ttc_commands      : in  l0mdt_ttc_rt;
   fm_ctrl_v         : in std_logic_vector(1023 downto 0); --M_CTRL_t;
   fm_mon_v          : out std_logic_vector(1023 downto 0); --FM_MON_t;
   ult_fm_data       : in fm_rt_array ( 0 to total_sb-1)
    );
  end entity top_fm;

  architecture behavioral of top_fm is
    signal fm_ctrl_r           : FM_CTRL_t;
    signal fm_mon_r            : FM_MON_t;


    begin

      fm_ctrl_r              <= structify(fm_ctrl_v,fm_ctrl_r);
      fm_mon_v               <= vectorify(fm_mon_r,fm_mon_v);

     ult_fm_inst : component ult_lib.ult_fm
     port map (
       lock_and_control => lock_and_control,
       ttc_commands     => ttc_commands,
       ctrl_v           => fm_ctrl_v,
       mon_v            => fm_mon_v,
       ult_fm_data      => ult_fm_data
       );

    end behavioral;
