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
use fm_lib.fm_sb_pkg.all;

library xil_defaultlib;
use xil_defaultlib.all;


entity top_fm is
  port(
   clock_and_control : in  l0mdt_control_rt;
   ttc_commands      : in  l0mdt_ttc_rt;
   ctrl_v            : in FM_CTRL_t;
   mon_v             : out FM_MON_t;
   sf_mon_data       : in std_logic_vector(mon_dw_max-1 downto 0);
   sf_mon_data_we    : in std_logic
    );
  end entity top_fm;

  architecture behavioral of top_fm is
    signal  fm_i   : fm_rt_array ( 0 to total_sb-1);
    signal  ult_mon_data_we : std_logic_vector(total_sb-1 downto 0);
    signal  ult_mon_unused  : std_logic_vector(total_sb-2 downto 0);
    component fm is
      port(
      clk_hs : in std_logic;
      rst_hs : in std_logic;
      fm_ctrl_in :in FM_CTRL_t;
      fm_mon_out : out FM_MON_t;
      ult_mon_data : in fm_rt_array ( 0 to total_sb-1)
        );
      end component;
    begin

     fm_i(0).fm_data     <= sf_mon_data;
     ult_mon_unused      <= (others=>'0');
     fm_i(0).fm_vld      <= sf_mon_data_we;


     fm_inst : component fm
     port map (
       fm_ctrl_in      => ctrl_v,
       clk_hs          => clock_and_control.clk,
       rst_hs          => clock_and_control.rst,
       fm_mon_out      => mon_v,
       ult_mon_data    => fm_i
       );

    end behavioral;
