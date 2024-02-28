--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ult_tar.vhd
-- Module: <<moduleName>>
-- File PATH: /ult_tar.vhd
-- -----
-- File Created: Thursday, 15th February 2024 9:45:20 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 15th February 2024 1:42:55 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library ctrl_lib;
use ctrl_lib.TAR_CTRL.all;

library tar_lib;
use tar_lib.tar_pkg.all;

library fm_lib;
use fm_lib.fm_types.all;

library ult_lib;
  use ult_lib.ult_pkg.all;

entity ult_tar is
  port (
    -- pipeline clock
    clock_and_control : in  l0mdt_control_rt;
    i_ull_super_globa_v : in ull_super_globa_vt;

    --
    tar_inn_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    tar_inn_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    tar_mid_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    tar_mid_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    tar_out_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    tar_out_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    tar_ext_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    tar_ext_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    --Fast Monitoring
    fm_tar_mon_v          : out std_logic_vector;
    fm_tar_polmux2tar_pb_v  : in tdcpolmux2tar_avt(tar_sb_all_stations_n-1 downto 0);
    -- ttc
    -- ttc_commands      : in  l0mdt_ttc_rt;
    -- TDC Hits from Polmux
    i_inn_tdc_hits_av : in  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_mid_tdc_hits_av : in  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_out_tdc_hits_av : in  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_ext_tdc_hits_av : in  tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    -- i_inn_tar_hits    : in  tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
    -- i_mid_tar_hits    : in  tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
    -- i_out_tar_hits    : in  tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    -- i_ext_tar_hits    : in  tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- to DAQ
    -- o_inn_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    -- o_mid_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    -- o_out_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    -- o_ext_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- outputs to h2s Tar
    o_inn_tar_hits_av  : out tar2hps_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_mid_tar_hits_av  : out tar2hps_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_out_tar_hits_av  : out tar2hps_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_ext_tar_hits_av  : out tar2hps_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);

    o_sump            : out std_logic

    );
end entity ult_tar;

architecture beh of ult_tar is
  -- signal tdc_hit_inner_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_INN-1 downto 0);
  -- signal tdc_hit_middle_sump : std_logic_vector (c_HPS_NUM_MDT_CH_MID-1 downto 0);
  -- signal tdc_hit_outer_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
  -- signal tdc_hit_extra_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_EXT-1 downto 0);
  signal i_ull_super_globa_r : ull_super_globa_rt;
  signal glob_en : std_logic;
  signal glob_rst : std_logic;
  signal glob_freeze : std_logic;
  signal sumps : std_logic_vector(3 downto 0) := (others => '0');

  signal int_inn_tdc_hits_av  : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal int_mid_tdc_hits_av  : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal int_out_tdc_hits_av  : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal int_ext_tdc_hits_av  : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);


  signal fm_tar_mon_r : fm_tar_mon_data;
  signal fm_i_inn_tdc_hits_av  : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal fm_i_mid_tdc_hits_av : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal fm_i_out_tdc_hits_av  : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  
begin


    
  FM_CTRL_GEN : if c_FM_ENABLED generate

  fm_tar_mon_v <= convert(fm_tar_mon_r, fm_tar_mon_v);
  -- else generate
    
  end generate;
  i_ull_super_globa_r <= convert(i_ull_super_globa_v,i_ull_super_globa_r);
  glob_en <= i_ull_super_globa_r.global_ena;
  glob_rst <= clock_and_control.rst or i_ull_super_globa_r.global_rst;
  glob_freeze <= i_ull_super_globa_r.global_freeze;

   
  TAR_INN : if c_HPS_ENABLE_ST_INN = '1' generate
    TAR_GEN : if c_TAR_ENABLED = '1' generate 
      TAR : entity tar_lib.tar
      generic map(
          g_HPS_MAX_HP => c_HPS_NUM_MDT_CH_INN,
          g_STATION => 0
        )
      port map (
        -- clock, control, and monitoring
        clk             => clock_and_control.clk,
        rst             => glob_rst,
        glob_en         => glob_en,
        glob_freeze    => glob_freeze,
        --
        ctrl_v            => tar_inn_ctrl_v,
        mon_v             => tar_inn_mon_v ,
        -- TDC Hits from Polmux
        i_tdc_hits_av  => int_inn_tdc_hits_av, -- i_inn_tdc_hits_av,
        -- to daq
        -- o_tdc_hits_av  => o_inn_tdc_hits_av,
        -- outputs to h2s
        o_tar_hits_av  => o_inn_tar_hits_av
      );
    else generate
      sump_tar : entity ult_lib.tar_sump
        generic map(g_HPS_MAX_HP => c_HPS_NUM_MDT_CH_INN)
        port map (
          -- clock, control, and monitoring
          clk             => clock_and_control.clk,
          rst             => glob_rst,
          glob_en         => glob_en,
          glob_freeze    => glob_freeze,
          --
          ctrl_v            => tar_inn_ctrl_v,
          mon_v             => tar_inn_mon_v ,
          -- TDC Hits from Polmux
          i_tdc_hits_av  => int_inn_tdc_hits_av, -- i_inn_tdc_hits_av,
          -- to daq
          -- o_tdc_hits_av  => o_inn_tdc_hits_av,
          -- outputs to h2s
          o_tar_hits_av  => o_inn_tar_hits_av,
          --
          o_sump_b => sumps(0)
        );
    end generate;

    FM_CTRL_GEN : if c_FM_ENABLED generate
      int_inn_tdc_hits_av <= fm_tar_polmux2tar_pb_v(c_HPS_NUM_MDT_CH_INN -1 downto 0);
      -- fm_i_mid_tdc_hits_av <= fm_tar_polmux2tar_pb_v(csm_polmux_in_sb_n + c_HPS_NUM_MDT_CH_MID -1 downto csm_polmux_in_sb_n);
      -- fm_i_out_tdc_hits_av <= fm_tar_polmux2tar_pb_v(2*csm_polmux_in_sb_n + c_HPS_NUM_MDT_CH_OUT  -1 downto 2*csm_polmux_in_sb_n); 
      FM_INN_TAR: for k in 0 to csm_polmux_in_sb_n/2-1  generate
          fm_tar_mon_r(0)(k).fm_data <= (mon_dw_max-1 downto  tdcpolmux2tar_vt'w => '0') & i_inn_tdc_hits_av(k);
          fm_tar_mon_r(0)(k).fm_vld   <= i_inn_tdc_hits_av(k)(tdcpolmux2tar_vt'w-1);
          -- fm_tar_mon_r(0)(csm_polmux_in_sb_n/2 + k).fm_data <= (mon_dw_max-1 downto  tdcpolmux2tar_vt'w => '0') & o_inn_tdc_hits_av(k);
          -- fm_tar_mon_r(0)(csm_polmux_in_sb_n/2 + k).fm_vld   <= o_inn_tdc_hits_av(k)(tdcpolmux2tar_vt'w-1);
        end generate;        
    else generate
      int_inn_tdc_hits_av <= i_inn_tdc_hits_av;
    end generate;   

  end generate;
  
  HPS_MID : if c_HPS_ENABLE_ST_MID = '1' generate
    TAR_GEN : if c_TAR_ENABLED = '1' generate 
      TAR : entity tar_lib.tar
      generic map(
        g_HPS_MAX_HP => c_HPS_NUM_MDT_CH_MID,
        g_STATION => 1
      )
      port map (
        -- clock, control, and monitoring
        clk             => clock_and_control.clk,
        rst             => glob_rst,
        glob_en         => glob_en,
        glob_freeze    => glob_freeze,
        --
        ctrl_v            => tar_mid_ctrl_v,
        mon_v             => tar_mid_mon_v ,
        -- TDC Hits from Polmux
        i_tdc_hits_av  => int_mid_tdc_hits_av , --i_mid_tdc_hits_av,
        -- to daq
        -- o_tdc_hits_av  => o_mid_tdc_hits_av,
    
        -- outputs to h2s
        o_tar_hits_av  => o_mid_tar_hits_av
      );
    else generate
      sump_tar : entity ult_lib.tar_sump
        generic map(g_HPS_MAX_HP => c_HPS_NUM_MDT_CH_MID)
        port map (
          -- clock, control, and monitoring
          clk             => clock_and_control.clk,
          rst             => glob_rst,
          glob_en         => glob_en,
          glob_freeze    => glob_freeze,
          --
          ctrl_v            => tar_mid_ctrl_v,
          mon_v             => tar_mid_mon_v ,
          -- TDC Hits from Polmux
          i_tdc_hits_av  => int_mid_tdc_hits_av , --i_mid_tdc_hits_av,
          -- to daq
          -- o_tdc_hits_av  => o_mid_tdc_hits_av,
      
          -- outputs to h2s
          o_tar_hits_av  => o_mid_tar_hits_av,
          --
          o_sump_b => sumps(1)
        );
    end generate;
    FM_CTRL_GEN : if c_FM_ENABLED generate
      int_mid_tdc_hits_av <= fm_tar_polmux2tar_pb_v(csm_polmux_in_sb_n + c_HPS_NUM_MDT_CH_MID -1 downto csm_polmux_in_sb_n);      
      FM_MID_TAR: for k in 0 to csm_polmux_in_sb_n/2-1  generate
        fm_tar_mon_r(1)(k).fm_data <= (mon_dw_max-1 downto  tdcpolmux2tar_vt'w => '0') &  i_mid_tdc_hits_av(k);
        fm_tar_mon_r(1)(k).fm_vld   <= i_mid_tdc_hits_av(k)(tdcpolmux2tar_vt'w-1);
        -- fm_tar_mon_r(1)(csm_polmux_in_sb_n/2 + k).fm_data <=  (mon_dw_max-1 downto  tdcpolmux2tar_vt'w => '0') &  o_mid_tdc_hits_av(k);
        -- fm_tar_mon_r(1)(csm_polmux_in_sb_n/2 + k).fm_vld   <= o_mid_tdc_hits_av(k)(tdcpolmux2tar_vt'w-1);
      end generate;       
    else generate
      int_mid_tdc_hits_av <= i_mid_tdc_hits_av;
    end generate;
    
  end generate;
  HPS_OUT : if c_HPS_ENABLE_ST_OUT = '1' generate
    TAR_GEN : if c_TAR_ENABLED = '1' generate 
      TAR : entity tar_lib.tar
      generic map(
        g_HPS_MAX_HP => c_HPS_NUM_MDT_CH_OUT,
        g_STATION => 2
      )
      port map (
        -- clock, control, and monitoring
        clk             => clock_and_control.clk,
        rst             => glob_rst,
        glob_en         => glob_en,
        glob_freeze    => glob_freeze,
        --
        ctrl_v            => tar_out_ctrl_v,
        mon_v             => tar_out_mon_v ,
        -- TDC Hits from Polmux
        i_tdc_hits_av  =>  int_out_tdc_hits_av, --i_out_tdc_hits_av,
        -- to daq
        -- o_tdc_hits_av  => o_out_tdc_hits_av,
    
        -- outputs to h2s
        o_tar_hits_av  => o_out_tar_hits_av
      );
    else generate
      sump_tar : entity ult_lib.tar_sump
        generic map(g_HPS_MAX_HP => c_HPS_NUM_MDT_CH_OUT)
        port map (
          -- clock, control, and monitoring
          clk             => clock_and_control.clk,
          rst             => glob_rst,
          glob_en         => glob_en,
          glob_freeze    => glob_freeze,
          --
          ctrl_v            => tar_out_ctrl_v,
          mon_v             => tar_out_mon_v ,
          -- TDC Hits from Polmux
          i_tdc_hits_av  =>  int_out_tdc_hits_av, --i_out_tdc_hits_av,
          -- to daq
          -- o_tdc_hits_av  => o_out_tdc_hits_av,
      
          -- outputs to h2s
          o_tar_hits_av  => o_out_tar_hits_av,
          --
          o_sump_b => sumps(2)
        );
    end generate;

    FM_CTRL_GEN : if c_FM_ENABLED generate
      int_out_tdc_hits_av <= fm_tar_polmux2tar_pb_v(2*csm_polmux_in_sb_n + c_HPS_NUM_MDT_CH_OUT  -1 downto 2*csm_polmux_in_sb_n);    
      FM_OUT_TAR: for k in 0 to csm_polmux_in_sb_n/2-1  generate
        fm_tar_mon_r(2)(k).fm_data <= (mon_dw_max-1 downto  tdcpolmux2tar_vt'w => '0') & i_out_tdc_hits_av(k);
        fm_tar_mon_r(2)(k).fm_vld   <= i_out_tdc_hits_av(k)(tdcpolmux2tar_vt'w-1);
        -- fm_tar_mon_r(2)(csm_polmux_in_sb_n/2 + k).fm_data <=  (mon_dw_max-1 downto  tdcpolmux2tar_vt'w => '0') &  o_out_tdc_hits_av(k);
        -- fm_tar_mon_r(2)(csm_polmux_in_sb_n/2 + k).fm_vld   <= o_out_tdc_hits_av(k)(tdcpolmux2tar_vt'w-1);
      end generate;    
    else generate
      int_out_tdc_hits_av <= i_out_tdc_hits_av;
    end generate;
   
    
  end generate;
  HPS_EXT : if c_HPS_ENABLE_ST_EXT = '1' generate
    TAR_GEN : if c_TAR_ENABLED = '1' generate 
      TAR : entity tar_lib.tar
      generic map(
        g_HPS_MAX_HP => c_HPS_NUM_MDT_CH_EXT,
        g_STATION => 3
      )
      port map (
        -- clock, control, and monitoring
        clk             => clock_and_control.clk,
        rst             => glob_rst,
        glob_en         => glob_en,
        glob_freeze    => glob_freeze,
        --
        ctrl_v            => tar_ext_ctrl_v,
        mon_v             => tar_ext_mon_v ,
        -- TDC Hits from Polmux
        i_tdc_hits_av  => int_ext_tdc_hits_av,
        -- to daq
        -- o_tdc_hits_av  => o_ext_tdc_hits_av,
    
        -- outputs to h2s
        o_tar_hits_av  => o_ext_tar_hits_av
      );
    else generate
      sump_tar : entity ult_lib.tar_sump
        generic map(g_HPS_MAX_HP => c_HPS_NUM_MDT_CH_OUT)
        port map (
          -- clock, control, and monitoring
          clk             => clock_and_control.clk,
          rst             => glob_rst,
          glob_en         => glob_en,
          glob_freeze    => glob_freeze,
          --
          ctrl_v            => tar_out_ctrl_v,
          mon_v             => tar_out_mon_v ,
          -- TDC Hits from Polmux
          i_tdc_hits_av  =>  int_out_tdc_hits_av, --i_out_tdc_hits_av,
          -- to daq
          -- o_tdc_hits_av  => o_out_tdc_hits_av,
      
          -- outputs to h2s
          o_tar_hits_av  => o_out_tar_hits_av,
          --
          o_sump_b => sumps(3)
        );
      end generate;

    FM_CTRL_GEN : if c_FM_ENABLED generate
      -- int_inn_tdc_hits_av <= fm_tar_polmux2tar_pb_v(c_HPS_NUM_MDT_CH_INN -1 downto 0);
      -- int_ext_tdc_hits_av <= fm_tar_polmux2tar_pb_v(csm_polmux_in_sb_n + c_HPS_NUM_MDT_CH_MID -1 downto csm_polmux_in_sb_n);
      -- fm_i_out_tdc_hits_av <= fm_tar_polmux2tar_pb_v(2*csm_polmux_in_sb_n + c_HPS_NUM_MDT_CH_OUT  -1 downto 2*csm_polmux_in_sb_n); 
      
      -- FM_OUT_TAR: for k in 0 to csm_polmux_in_sb_n/2-1  generate
      --   fm_tar_mon_r(2)(k).fm_data <= (mon_dw_max-1 downto  tdcpolmux2tar_vt'w => '0') & i_out_tdc_hits_av(k);
      --   fm_tar_mon_r(2)(k).fm_vld   <= i_out_tdc_hits_av(k)(tdcpolmux2tar_vt'w-1);
      --   fm_tar_mon_r(2)(csm_polmux_in_sb_n/2 + k).fm_data <=  (mon_dw_max-1 downto  tdcpolmux2tar_vt'w => '0') &  o_out_tdc_hits_av(k);
      --   fm_tar_mon_r(2)(csm_polmux_in_sb_n/2 + k).fm_vld   <= o_out_tdc_hits_av(k)(tdcpolmux2tar_vt'w-1);
      -- end generate;    
    else generate
      int_ext_tdc_hits_av <= i_ext_tdc_hits_av;
    end generate;
  end generate;

  o_sump <= xor_reduce(sumps);


  --Fast Monitoring
 

   
      -- TAR : entity tar_lib.tar
      -- port map (
      --   -- clock, control, and monitoring
      --   clk             => clock_and_control.clk,
      --   rst             => glob_rst,
      --   glob_en         => glob_en,
      --   --
      --   ctrl_v            => ctrl_v,
      --   mon_v             => mon_v,
      --   -- TDC Hits from Polmux
      --   i_inn_tdc_hits_av  => i_inn_tdc_hits_av,
      --   i_mid_tdc_hits_av  => i_mid_tdc_hits_av,
      --   i_out_tdc_hits_av  => i_out_tdc_hits_av,
      --   i_ext_tdc_hits_av  => i_ext_tdc_hits_av,
      --   -- candidates in from hal
      --   -- i_inn_tar_hits_av  => i_inn_tar_hits,
      --   -- i_mid_tar_hits_av  => i_mid_tar_hits,
      --   -- i_out_tar_hits_av  => i_out_tar_hits,
      --   -- i_ext_tar_hits_av  => i_ext_tar_hits,
      --   -- to daq
      --   o_inn_tdc_hits_av  => o_inn_tdc_hits_av,
      --   o_mid_tdc_hits_av  => o_mid_tdc_hits_av,
      --   o_out_tdc_hits_av  => o_out_tdc_hits_av,
      --   o_ext_tdc_hits_av  => o_ext_tdc_hits_av,
      --   -- outputs to h2s
      --   o_inn_tar_hits_av  => o_inn_tar_hits_av,
      --   o_mid_tar_hits_av  => o_mid_tar_hits_av,
      --   o_out_tar_hits_av  => o_out_tar_hits_av,
      --   o_ext_tar_hits_av  => o_ext_tar_hits_av
  
      -- );

end architecture beh;
