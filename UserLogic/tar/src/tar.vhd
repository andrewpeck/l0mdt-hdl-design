--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: tar.vhd
-- File PATH: /UserLogic/tar/src/tar.vhd
-- -----
-- File Created: Tuesday, 23rd November 2021 2:24:35 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 15th December 2021 1:32:07 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------




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

use shared_lib.detector_param_pkg.all;

library vamc_lib;

library tar_lib;
use tar_lib.tar_pkg.all;

library ctrl_lib;
use ctrl_lib.TAR_CTRL.all;

entity tar is
  generic(
    c_HPS_MAX_HP : integer := 6
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    ctrl_v            : in std_logic_vector; --  : in  TAR_CTRL_t;
    mon_v             : out std_logic_vector;--  : out TAR_MON_t;
    -- TDC Hits from Polmux
    i_tdc_hits_av    : in  mdt_polmux_bus_avt (c_HPS_MAX_HP -1 downto 0);
    -- TDC polmux from Tar
    o_tdc_hits_av    : out mdt_polmux_bus_avt(c_HPS_MAX_HP -1 downto 0);
    -- TDC Hits from Tar
    o_tar_hits_av    : out tar2hps_bus_avt(c_HPS_MAX_HP -1 downto 0)

  );
end entity tar;

architecture beh of tar is
  --
  signal ctrl_r            : TAR_CTRL_t;
  signal mon_r             : TAR_MON_t;

  -- type ctrl_st_apb_mem_vt is array (5 downto 0) of std_logic_vector(len(ctrl_r.PL_STATION)-1  downto 0);
  -- type mon_st_apb_mem_vt  is array (5 downto 0) of std_logic_vector(len(mon_r.PL_STATION)-1  downto 0);

  -- signal ctrl_apb_mem_av : ctrl_apb_mem_avt;
  -- signal mon_apb_mem_av  : mon_apb_mem_avt; 

  constant PL_ST_CTRL_LEN : integer := len(ctrl_r.PL_ST);--426;
  constant PL_ST_MON_LEN : integer := len(mon_r.PL_ST);--258;

  signal ctrl_pl_v : std_logic_vector(PL_ST_CTRL_LEN - 1 downto 0);--(len(ctrl_r.PL_ST.PL_ST(0))-1  downto 0);

  signal mon_pl_v : std_logic_vector(PL_ST_MON_LEN - 1 downto 0);--(len(mon_r.PL_ST.PL_ST(0))-1  downto 0);

  -- TDC polmux from Tar
  signal i_tdc_hits_ar : mdt_polmux_bus_at(c_HPS_MAX_HP -1 downto 0);

  signal local_en : std_logic;
  signal local_rst : std_logic;
  signal int_freeze : std_logic;

begin

  ctrl_r <= convert(ctrl_v,ctrl_r);
  mon_v <= convert(mon_r,mon_v);

  ctrl_pl_v <= convert(ctrl_r.PL_ST,ctrl_pl_v);

  mon_r.PL_ST <= convert(mon_pl_v,mon_r.PL_ST);

  SUPERVISOR : entity tar_lib.tar_supervisor
  port map(
    clk               => clk,
    rst               => rst,
    glob_en           => glob_en,      
    -- AXI to SoC
    i_actions           => ctrl_r.actions,
    i_configs           => ctrl_r.configs,
    o_status            => mon_r.status ,
    --
    o_freeze          => int_freeze,
    -- 
    o_local_en          => local_en,
    o_local_rst         => local_rst
  );
  
  -- TDC_INPUTS_GEN : if c_TAR_INSEL = '1' generate

    i_tdc_hits_ar <= structify(i_tdc_hits_av);
    -- i_mid_tdc_hits_ar <= structify(i_mid_tdc_hits_av);
    -- i_out_tdc_hits_ar <= structify(i_out_tdc_hits_av);
    -- i_ext_tdc_hits_ar <= structify(i_ext_tdc_hits_av);

    -- pipelines
    -- INN_EN : if c_HPS_ENABLE_ST_INN = '1' generate
      TAR_INN : entity tar_lib.tar_station
        generic map(
          g_ARRAY_LEN => c_HPS_MAX_HP,
          g_STATION => 0
        )
        port map (
          -- clock, control, and monitoring
          clk             => clk,
          rst             => local_rst,
          glob_en         => local_en,
          -- ctrl/mon
          ctrl_v          => ctrl_pl_v,
          mon_v           => mon_pl_v,
          -- supervisor
          i_freeze        => int_freeze,
          -- data
          i_tdc_hits_av   => i_tdc_hits_av,
          o_tdc_hits_av   => o_tdc_hits_av,
          o_tar_hits_av   =>  o_tar_hits_av
        );
    -- end generate;

    -- MID_EN : if c_HPS_ENABLE_ST_MID = '1' generate
    --   TAR_MID : entity tar_lib.tar_station
    --     generic map(
    --       g_ARRAY_LEN => c_HPS_MAX_HP_MID,
    --       g_STATION => 1
    --     )
    --     port map (
    --       -- clock, control, and monitoring
    --       clk             => clk,
    --       rst             => local_rst,
    --       glob_en         => local_en,
    --       -- ctrl/mon
    --       ctrl_v            => ctrl_pl_mid_v,
    --       mon_v             => mon_pl_mid_v,
    --       -- supervisor
    --       i_freeze        => int_freeze,
    --       -- data
    --       i_tdc_hits_av   => i_mid_tdc_hits_av,
    --       o_tdc_hits_av   => o_mid_tdc_hits_av,
    --       o_tar_hits_av   =>  o_mid_tar_hits_av
    --     );
    -- end generate;

    -- OUT_EN : if c_HPS_ENABLE_ST_OUT = '1' generate
    --   TAR_OUT : entity tar_lib.tar_station
    --     generic map(
    --       g_ARRAY_LEN => c_HPS_MAX_HP_OUT,
    --       g_STATION => 2
    --     )
    --     port map (
    --       -- clock, control, and monitoring
    --       clk             => clk,
    --       rst             => local_rst,
    --       glob_en         => local_en,
    --       -- ctrl/mon
    --       ctrl_v            => ctrl_pl_out_v,
    --       mon_v             => mon_pl_out_v,
    --       -- supervisor
    --       i_freeze        => int_freeze,
    --       -- data
    --       i_tdc_hits_av   => i_out_tdc_hits_av,
    --       o_tdc_hits_av   => o_out_tdc_hits_av,
    --       o_tar_hits_av   =>  o_out_tar_hits_av
    --     );
    -- end generate;

    -- EXT_EN : if c_HPS_ENABLE_ST_EXT = '1' generate
    --   -- TAR_EXT : entity tar_lib.tar_station
    --   --   generic map(
    --   --     g_ARRAY_LEN => c_HPS_MAX_HP_EXT,
    --   --     g_STATION => 3
    --   --   )
    --   --   port map (
    --   --     -- clock, control, and monitoring
    --   --     clk             => clk,
    --   --     rst             => local_rst,
    --   --     glob_en         => local_en,
    --   --     -- ctrl/mon
    --   --     ctrl_v            => ctrl_pl_ext_v,
    --   --     mon_v             => mon_pl_ext_v,
    --   --     -- data
    --   --     i_tdc_hits_av   => i_ext_tdc_hits_av,
    --   --     o_tdc_hits_av   => o_ext_tdc_hits_av,
    --   --     o_tar_hits_av   =>  o_ext_tar_hits_av
    --   --   );
    --   else generate
    --     o_ext_tdc_hits_av <= (others => (others => '0'));
    --     o_ext_tar_hits_av <= (others => (others => '0'));
    --     mon_pl_ext_v <= (others  => '0');
    -- end generate;
  
end architecture beh;