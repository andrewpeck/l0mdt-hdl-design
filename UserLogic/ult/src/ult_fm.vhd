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


entity ult_fm is
  port(
   clock_and_control : in  l0mdt_control_rt;
   ttc_commands       : in  l0mdt_ttc_rt;
   axi_reset_n        : in std_logic;
   ctrl_v                      : in std_logic_vector; --FM_CTRL_t;
   mon_v                    : out std_logic_vector; --FM_MON_t;
   h2s_fm_data          : in fm_rt_array(0  to h2s_sb_all_station_n -1)
   --ult_fm_data            : in fm_rt_array ( 0 to total_sb-1)
    );
  end entity ult_fm;

  architecture beh of ult_fm is
    
    signal ult_fm_data_avt : fm_data_avt(0 to total_sb-1);
    signal ult_fm_data : fm_rt_array(0  to total_sb-1);
    
    component fm is
      generic(
        total_sb : integer := total_sb
        );
      port(
      clk_hs : in std_logic;
      rst_hs : in std_logic;
      axi_reset_n : in std_logic;
      fm_ctrl_v     :in std_logic_vector; --FM_CTRL_t;
      fm_mon_v      : out std_logic_vector; --FM_MON_t;
      ult_fm_data_v : in fm_data_avt(0 to total_sb-1) -- fm_rt_array ( 0 to total_sb-1)
        );
      end component;
    begin
    FM_PROC : process (clock_and_control.clk) is
        begin
          if (rising_edge(clock_and_control.clk)) then  -- rising clock edge
            H2S_SPYBUFFERS : for I in 0 to h2s_sb_all_station_n-1 loop
              ult_fm_data(I).fm_data <= h2s_fm_data(I).fm_data;
              ult_fm_data(I).fm_vld  <= h2s_fm_data(I).fm_vld;
            end loop;
          end if;
      end process;
          
     ult_fm_data_flatten: for sb_i in 0 to total_sb-1 generate
      --  ult_fm_data_avt(sb_i) <= vectorify(ult_fm_data(sb_i));
       ult_fm_data_avt(sb_i) <= vectorify(ult_fm_data(sb_i),ult_fm_data_avt(sb_i));
     end generate ult_fm_data_flatten;
     
     fm_inst : component fm
       generic map(
         total_sb => total_sb
         )
     port map (
       fm_ctrl_v       => ctrl_v,
       clk_hs          => clock_and_control.clk,
       rst_hs          => clock_and_control.rst,
       axi_reset_n     => axi_reset_n,
       fm_mon_v        => mon_v,
       ult_fm_data_v   => ult_fm_data_avt
       );

    end architecture beh;
