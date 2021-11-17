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



library ctrl_lib;
use ctrl_lib.FM_CTRL.all;

library fm_lib;
use fm_lib.fm_ult_pkg.all;

library xil_defaultlib;
use xil_defaultlib.all;


entity ult_fm is
  port(
   clock_and_control : in  l0mdt_control_rt;
   ttc_commands      : in  l0mdt_ttc_rt;
   ctrl_v            : in std_logic_vector; --FM_CTRL_t;
   mon_v             : out std_logic_vector; --FM_MON_t;
   ult_fm_data       : in fm_rt_array ( 0 to total_sb-1)
    );
  end entity ult_fm;

  architecture beh of ult_fm is
    signal ctrl_r           : FM_CTRL_t;
    signal mon_r            : FM_MON_t;

    component fm is
      generic(
        total_sb : integer := total_sb
        );
      port(
      clk_hs : in std_logic;
      rst_hs : in std_logic;
      fm_ctrl_in  :in FM_CTRL_t;
      fm_mon_out  : out FM_MON_t;
      ult_fm_data : in fm_rt_array ( 0 to total_sb-1)
        );
      end component;
    begin

     ctrl_r              <= structify(ctrl_v,ctrl_r);
     mon_v               <= vectorify(mon_r,mon_v);

     fm_inst : component fm
       generic map(
         total_sb => total_sb
         )
     port map (
       fm_ctrl_in      => ctrl_r,
       clk_hs          => clock_and_control.clk,
       rst_hs          => clock_and_control.rst,
       fm_mon_out      => mon_r,
       ult_fm_data     => ult_fm_data
       );

    end architecture beh;