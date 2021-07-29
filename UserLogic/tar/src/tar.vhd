--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Tube Adress Remap
--  Description: aplies the fiber mapping to identify the origin of the hits
--
--------------------------------------------------------------------------------
--  Revisions: 
--    v0  - 2020.08.23 creation
--      
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
  -- generic (
  --   EN_TAR_HITS : integer := 0;
  --   EN_MDT_HITS : integer := 1
  --   );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    ctrl_v            : in std_logic_vector; --  : in  TAR_CTRL_t;
    mon_v             : out std_logic_vector;--  : out TAR_MON_t;
    -- TDC Hits from Polmux
    i_inn_tdc_hits_av    : in  mdt_polmux_bus_avt (c_HPS_MAX_HP_INN -1 downto 0);
    i_mid_tdc_hits_av    : in  mdt_polmux_bus_avt (c_HPS_MAX_HP_MID -1 downto 0);
    i_out_tdc_hits_av    : in  mdt_polmux_bus_avt (c_HPS_MAX_HP_OUT -1 downto 0);
    i_ext_tdc_hits_av    : in  mdt_polmux_bus_avt (c_HPS_MAX_HP_EXT -1 downto 0);
    -- TDC Hits from Tar
    -- i_inn_tar_hits_av    : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_INN -1 downto 0);
    -- i_mid_tar_hits_av    : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_MID -1 downto 0);
    -- i_out_tar_hits_av    : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_OUT -1 downto 0);
    -- i_ext_tar_hits_av    : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_EXT -1 downto 0);
    -- TDC polmux from Tar
    o_inn_tdc_hits_av    : out mdt_polmux_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
    o_mid_tdc_hits_av    : out mdt_polmux_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
    o_out_tdc_hits_av    : out mdt_polmux_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
    o_ext_tdc_hits_av    : out mdt_polmux_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0);
    -- TDC Hits from Tar
    o_inn_tar_hits_av    : out tar2hps_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
    o_mid_tar_hits_av    : out tar2hps_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
    o_out_tar_hits_av    : out tar2hps_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
    o_ext_tar_hits_av    : out tar2hps_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0)
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

  signal ctrl_pl_inn_v : std_logic_vector(len(ctrl_r.PL_STATION.PL_INN)-1  downto 0);
  signal ctrl_pl_mid_v : std_logic_vector(len(ctrl_r.PL_STATION.PL_MID)-1  downto 0);
  signal ctrl_pl_out_v : std_logic_vector(len(ctrl_r.PL_STATION.PL_OUT)-1  downto 0);
  -- signal ctrl_pl_ext_v : std_logic_vector(len(ctrl_r.PL_STATION.PL_EXT)-1  downto 0);
  signal mon_pl_inn_v : std_logic_vector(len(mon_r.PL_STATION.PL_INN)-1  downto 0);
  signal mon_pl_mid_v : std_logic_vector(len(mon_r.PL_STATION.PL_MID)-1  downto 0);
  signal mon_pl_out_v : std_logic_vector(len(mon_r.PL_STATION.PL_OUT)-1  downto 0);
  -- signal mon_pl_ext_v : std_logic_vector(len(mon_r.PL_STATION.PL_EXT)-1  downto 0);


  -- TDC polmux from Tar
  signal i_inn_tdc_hits_ar : mdt_polmux_bus_at(c_HPS_MAX_HP_INN -1 downto 0);
  signal i_mid_tdc_hits_ar : mdt_polmux_bus_at(c_HPS_MAX_HP_MID -1 downto 0);
  signal i_out_tdc_hits_ar : mdt_polmux_bus_at(c_HPS_MAX_HP_OUT -1 downto 0);
  signal i_ext_tdc_hits_ar : mdt_polmux_bus_at(c_HPS_MAX_HP_EXT -1 downto 0);
  -- TDC polmux from Tar
  -- signal int_inn_tdc_hits : mdt_polmux_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
  -- signal int_mid_tdc_hits : mdt_polmux_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
  -- signal int_out_tdc_hits : mdt_polmux_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  -- signal int_ext_tdc_hits : mdt_polmux_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0);
  -- TDC Hits from Tar
  -- signal int_inn_tar_hits : tar2hps_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
  -- signal int_mid_tar_hits : tar2hps_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
  -- signal int_out_tar_hits : tar2hps_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  -- signal int_ext_tar_hits : tar2hps_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0);

  signal local_en : std_logic;
  signal local_rst : std_logic;
  signal int_freeze : std_logic;

begin

  ctrl_r <= structify(ctrl_v,ctrl_r);
  mon_v <= vectorify(mon_r,mon_v);

  ctrl_pl_inn_v <= convert(ctrl_r.PL_STATION.PL_INN,ctrl_pl_inn_v);
  ctrl_pl_mid_v <= convert(ctrl_r.PL_STATION.PL_MID,ctrl_pl_mid_v);
  ctrl_pl_out_v <= convert(ctrl_r.PL_STATION.PL_OUT,ctrl_pl_out_v);

  mon_r.PL_STATION.PL_INN <= convert(mon_pl_inn_v,mon_r.PL_STATION.PL_INN);
  mon_r.PL_STATION.PL_MID <= convert(mon_pl_mid_v,mon_r.PL_STATION.PL_MID);
  mon_r.PL_STATION.PL_OUT <= convert(mon_pl_out_v,mon_r.PL_STATION.PL_OUT);

  SUPERVISOR : entity tar_lib.tar_supervisor
  port map(
    clk               => clk,
    rst               => rst,
    glob_en           => glob_en,      
    -- AXI to SoC
    actions           => ctrl_r.actions,
    configs           => ctrl_r.configs,
    status            => mon_r.status ,
    --
    o_freeze          => int_freeze,
    -- 
    local_en          => local_en,
    local_rst         => local_rst
  );
  
  -- TDC_INPUTS_GEN : if c_TAR_INSEL = '1' generate

    i_inn_tdc_hits_ar <= structify(i_inn_tdc_hits_av);
    i_mid_tdc_hits_ar <= structify(i_mid_tdc_hits_av);
    i_out_tdc_hits_ar <= structify(i_out_tdc_hits_av);
    i_ext_tdc_hits_ar <= structify(i_ext_tdc_hits_av);

    -- pipelines
    INN_EN : if c_HPS_ENABLE_ST_INN = '1' generate
      TAR_INN : entity tar_lib.tar_station
        generic map(
          g_ARRAY_LEN => c_HPS_MAX_HP_INN,
          g_STATION => 0
        )
        port map (
          -- clock, control, and monitoring
          clk             => clk,
          rst             => local_rst,
          glob_en         => local_en,
          -- ctrl/mon
          ctrl            => ctrl_pl_inn_v,
          mon             => mon_pl_inn_v,
          -- data
          i_tdc_hits_av   => i_inn_tdc_hits_av,
          o_tdc_hits_av   => o_inn_tdc_hits_av,
          o_tar_hits_av   =>  o_inn_tar_hits_av
        );
    end generate;

      MID_EN : if c_HPS_ENABLE_ST_MID = '1' generate
        TAR_MID : entity tar_lib.tar_station
          generic map(
            g_ARRAY_LEN => c_HPS_MAX_HP_MID,
            g_STATION => 1
          )
          port map (
            -- clock, control, and monitoring
            clk             => clk,
            rst             => local_rst,
            glob_en         => local_en,
            -- ctrl/mon
            ctrl            => ctrl_pl_mid_v,
            mon             => mon_pl_mid_v,
            -- data
            i_tdc_hits_av   => i_mid_tdc_hits_av,
            o_tdc_hits_av   => o_mid_tdc_hits_av,
            o_tar_hits_av   =>  o_mid_tar_hits_av
          );
      end generate;
        OUT_EN : if c_HPS_ENABLE_ST_OUT = '1' generate
          TAR_OUT : entity tar_lib.tar_station
            generic map(
              g_ARRAY_LEN => c_HPS_MAX_HP_OUT,
              g_STATION => 2
            )
            port map (
              -- clock, control, and monitoring
              clk             => clk,
              rst             => local_rst,
              glob_en         => local_en,
              -- ctrl/mon
              ctrl            => ctrl_pl_out_v,
              mon             => mon_pl_out_v,
              -- data
              i_tdc_hits_av   => i_out_tdc_hits_av,
              o_tdc_hits_av   => o_out_tdc_hits_av,
              o_tar_hits_av   =>  o_out_tar_hits_av
            );
        end generate;
          EXT_EN : if c_HPS_ENABLE_ST_EXT = '1' generate
            TAR_EXT : entity tar_lib.tar_station
              generic map(
                g_ARRAY_LEN => c_HPS_MAX_HP_EXT,
                g_STATION => 3
              )
              port map (
                -- clock, control, and monitoring
                clk             => clk,
                rst             => local_rst,
                glob_en         => local_en,
                -- ctrl/mon
                ctrl            => ctrl_pl_ext_v,
                mon             => mon_pl_ext_v,
                -- data
                i_tdc_hits_av   => i_ext_tdc_hits_av,
                o_tdc_hits_av   => o_ext_tdc_hits_av,
                o_tar_hits_av   =>  o_ext_tar_hits_av
              );
          else generate
            o_ext_tdc_hits_av <= (others => (others => '0'));
            o_ext_tar_hits_av <= (others => (others => '0'));
          end generate;
  
end architecture beh;