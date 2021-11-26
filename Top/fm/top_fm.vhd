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
use fm_lib.fm_ult_pkg.all;

library xil_defaultlib;
use xil_defaultlib.all;


entity top_fm is
  port(
   clock_and_control : in  l0mdt_control_rt;
   ttc_commands      : in  l0mdt_ttc_rt;
   ctrl_v            : in std_logic_vector(2318 downto 0); --M_CTRL_t;
   mon_v             : out std_logic_vector(1781 downto 0); --FM_MON_t;
   sf_mon_data       : in std_logic_vector(mon_dw_max-1 downto 0);
   sf_mon_data_we    : in std_logic;
   ult_fm_data       : in fm_data_avt ( 0 to total_sb-1)
    );
  end entity top_fm;

  architecture behavioral of top_fm is
  

    component fm is
      generic 
        (
          total_sb : positive
          );
      port(
      clk_hs : in std_logic;
      rst_hs : in std_logic;
      fm_ctrl_v    :in std_logic_vector;
      fm_mon_v    : out std_logic_vector;
      ult_fm_data_v : in fm_data_avt ( 0 to total_sb-1)
        );
      end component;
    begin

  

     fm_inst : component fm
       generic map(
         total_sb => total_sb
         )
     port map (
       fm_ctrl_v       => ctrl_v,
       clk_hs          => clock_and_control.clk,
       rst_hs          => clock_and_control.rst,
       fm_mon_v        => mon_v,
       ult_fm_data_v   => ult_fm_data
       );

    end behavioral;
