--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: MDT tdc data addres remap
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
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

entity mdt_tar is
  port (
    -- pipeline clock
    clock_and_control : in  l0mdt_control_rt;
    --
    tar_inn_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    tar_inn_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    tar_mid_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    tar_mid_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    tar_out_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    tar_out_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    tar_ext_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    tar_ext_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
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
    o_inn_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_mid_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_out_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_ext_tdc_hits_av  : out tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- outputs to h2s Tar
    o_inn_tar_hits_av  : out tar2hps_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_mid_tar_hits_av  : out tar2hps_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_out_tar_hits_av  : out tar2hps_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_ext_tar_hits_av  : out tar2hps_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);

    o_sump            : out std_logic

    );
end entity mdt_tar;

architecture beh of mdt_tar is
  -- signal tdc_hit_inner_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_INN-1 downto 0);
  -- signal tdc_hit_middle_sump : std_logic_vector (c_HPS_NUM_MDT_CH_MID-1 downto 0);
  -- signal tdc_hit_outer_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
  -- signal tdc_hit_extra_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_EXT-1 downto 0);
  signal glob_en : std_logic := '1';
begin

  HPS_INN : if c_HPS_ENABLE_ST_INN = '1' generate
    TAR : entity tar_lib.tar
    generic map(
        g_HPS_MAX_HP => c_HPS_NUM_MDT_CH_INN,
        g_STATION => 0
      )
    port map (
      -- clock, control, and monitoring
      clk             => clock_and_control.clk,
      rst             => clock_and_control.rst,
      glob_en         => glob_en,
      --
      ctrl_v            => tar_inn_ctrl_v,
      mon_v             => tar_inn_mon_v ,
      -- TDC Hits from Polmux
      i_tdc_hits_av  => i_inn_tdc_hits_av,
      -- to daq
      o_tdc_hits_av  => o_inn_tdc_hits_av,
  
      -- outputs to h2s
      o_tar_hits_av  => o_inn_tar_hits_av
    );
  end generate;
  HPS_MID : if c_HPS_ENABLE_ST_MID = '1' generate
    TAR : entity tar_lib.tar
    generic map(
      g_HPS_MAX_HP => c_HPS_NUM_MDT_CH_MID,
      g_STATION => 1
    )
    port map (
      -- clock, control, and monitoring
      clk             => clock_and_control.clk,
      rst             => clock_and_control.rst,
      glob_en         => glob_en,
      --
      ctrl_v            => tar_mid_ctrl_v,
      mon_v             => tar_mid_mon_v ,
      -- TDC Hits from Polmux
      i_tdc_hits_av  => i_mid_tdc_hits_av,
      -- to daq
      o_tdc_hits_av  => o_mid_tdc_hits_av,
  
      -- outputs to h2s
      o_tar_hits_av  => o_mid_tar_hits_av
    );
  end generate;
  HPS_OUT : if c_HPS_ENABLE_ST_OUT = '1' generate
    TAR : entity tar_lib.tar
    generic map(
      g_HPS_MAX_HP => c_HPS_NUM_MDT_CH_OUT,
      g_STATION => 2
    )
    port map (
      -- clock, control, and monitoring
      clk             => clock_and_control.clk,
      rst             => clock_and_control.rst,
      glob_en         => glob_en,
      --
      ctrl_v            => tar_out_ctrl_v,
      mon_v             => tar_out_mon_v ,
      -- TDC Hits from Polmux
      i_tdc_hits_av  => i_out_tdc_hits_av,
      -- to daq
      o_tdc_hits_av  => o_out_tdc_hits_av,
  
      -- outputs to h2s
      o_tar_hits_av  => o_out_tar_hits_av
    );
  end generate;
  HPS_EXT : if c_HPS_ENABLE_ST_EXT = '1' generate
    TAR : entity tar_lib.tar
    generic map(
      g_HPS_MAX_HP => c_HPS_NUM_MDT_CH_EXT,
      g_STATION => 3
    )
    port map (
      -- clock, control, and monitoring
      clk             => clock_and_control.clk,
      rst             => clock_and_control.rst,
      glob_en         => glob_en,
      --
      ctrl_v            => tar_ext_ctrl_v,
      mon_v             => tar_ext_mon_v ,
      -- TDC Hits from Polmux
      i_tdc_hits_av  => i_ext_tdc_hits_av,
      -- to daq
      o_tdc_hits_av  => o_ext_tdc_hits_av,
  
      -- outputs to h2s
      o_tar_hits_av  => o_ext_tar_hits_av
    );
  end generate;

  o_sump <= glob_en;
  
      -- TAR : entity tar_lib.tar
      -- port map (
      --   -- clock, control, and monitoring
      --   clk             => clock_and_control.clk,
      --   rst             => clock_and_control.rst,
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
