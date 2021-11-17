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


entity top_fm is
  port(
   clock_and_control : in  l0mdt_control_rt;
   ttc_commands      : in  l0mdt_ttc_rt;
   ctrl_v            : in std_logic_vector(1023 downto 0); --M_CTRL_t;
   mon_v             : out std_logic_vector(1023 downto 0); --FM_MON_t;
   sf_mon_data       : in std_logic_vector(mon_dw_max-1 downto 0);
   sf_mon_data_we    : in std_logic;
   ult_fm_data       : in fm_rt_array ( 0 to total_sb-1)
    );
  end entity top_fm;

  architecture behavioral of top_fm is
    signal ctrl_r           : FM_CTRL_t;
    signal mon_r            : FM_MON_t;

    component fm is
      port(
      clk_hs : in std_logic;
      rst_hs : in std_logic;
      fm_ctrl_in :in FM_CTRL_t;
      fm_mon_out : out FM_MON_t;
      ult_fm_data : in fm_rt_array ( 0 to total_sb-1)
        );
      end component;
    begin

      ctrl_r              <= structify(ctrl_v,ctrl_r);
      mon_v               <= vectorify(mon_r,mon_v);

     fm_inst : component fm
     port map (
       fm_ctrl_in      => ctrl_r,
       clk_hs          => clock_and_control.clk,
       rst_hs          => clock_and_control.rst,
       fm_mon_out      => mon_r,
       ult_fm_data    => ult_fm_data
       );

    end behavioral;
