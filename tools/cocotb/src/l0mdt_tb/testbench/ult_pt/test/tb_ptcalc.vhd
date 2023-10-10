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

library ctrl_lib;
use ctrl_lib.TF_CTRL.all;

library ptc_lib;
library upt_lib;
library ult_lib;

entity tb_ptcalc is

 port (
       -- clock and control
    clock                            : in  std_logic;
        rst                                : in std_logic;
        ttc_commands              : in  l0mdt_ttc_rt;
        --ctrl_v                    : in std_logic_vector; --  : in  TF_CTRL_t;
        mon_v                     : out std_logic_vector;-- : out TF_MON_t;
        i_inn_segments            : in  sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
        i_mid_segments            : in  sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
        i_out_segments            : in  sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
        i_ext_segments            : in  sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
        i_minus_neighbor_segments : in  sf2ptcalc_avt(c_NUM_SF_INPUTS - 1 downto 0);
        i_plus_neighbor_segments  : in  sf2ptcalc_avt(c_NUM_SF_INPUTS - 1 downto 0);
        i_pl2pt_av                : in  pl2ptcalc_avt(c_NUM_THREADS-1 downto 0);

        o_pt2mtc                  : out ptcalc2mtc_avt(c_NUM_THREADS -1 downto 0);

        o_sump                : out std_logic
            );
    end entity tb_ptcalc;


 architecture behavioral of tb_ptcalc is
      signal   clock_and_control         :       l0mdt_control_rt;
      signal ctrl_v     : TF_CTRL_t;
      signal tf_ctrl_v  : std_logic_vector(width(ctrl_v) - 1 downto 0);
      
      
      begin

        ctrl_v.ENABLE <= '1';
        ctrl_v.RESET <= rst;
        tf_ctrl_v <= convert(ctrl_v,tf_ctrl_v);
        
        
        clock_and_control.clk <= clock;
          clock_and_control.rst  <= rst;

            ULT_PTCALC : entity ult_lib.ptcalc
                    port map (
                              -- clock, control, and monitoring
                              clock_and_control         => clock_and_control,
                                      ttc_commands              => ttc_commands,
                                      ctrl_v                             => tf_ctrl_v,
                                      mon_v                           => mon_v,
                                      --  segments from neighbors
                                      i_plus_neighbor_segments  => i_plus_neighbor_segments,
                                      i_minus_neighbor_segments => i_minus_neighbor_segments,
                                      -- segments from hps
                                      i_inn_segments            => i_inn_segments,
                                      i_mid_segments            => i_mid_segments,
                                      i_out_segments            => i_out_segments,
                                      i_ext_segments            => i_ext_segments,
                                      -- from pipeline
                                      i_pl2pt_av                => i_pl2pt_av,
                                      -- to mtc
                                      o_pt2mtc                  => o_pt2mtc,
                                      -- dummy
                                      o_sump                    => o_sump
                                    );

        end behavioral;
        
