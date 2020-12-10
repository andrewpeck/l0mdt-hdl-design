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

library tar_lib;
use tar_lib.tar_pkg.all;

entity tar is
  -- generic (
  --   EN_TAR_HITS : integer := 0;
  --   EN_MDT_HITS : integer := 1
  --   );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- TDC Hits from Polmux
    i_inn_tdc_hits    : in  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_MAX_HP_INN -1 downto 0);
    i_mid_tdc_hits    : in  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_MAX_HP_MID -1 downto 0);
    i_out_tdc_hits    : in  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_MAX_HP_OUT -1 downto 0);
    i_ext_tdc_hits    : in  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_MAX_HP_EXT -1 downto 0);
    -- TDC Hits from Tar
    i_inn_tar_hits    : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_INN -1 downto 0);
    i_mid_tar_hits    : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_MID -1 downto 0);
    i_out_tar_hits    : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_OUT -1 downto 0);
    i_ext_tar_hits    : in  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_EXT -1 downto 0);
    -- TDC polmux from Tar
    o_inn_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
    o_mid_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
    o_out_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
    o_ext_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0);
    -- TDC Hits from Tar
    o_inn_tar_hits    : out tar2hps_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
    o_mid_tar_hits    : out tar2hps_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
    o_out_tar_hits    : out tar2hps_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
    o_ext_tar_hits    : out tar2hps_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0)
  );
end entity tar;

architecture beh of tar is

  -- TDC polmux from Tar
  signal int_inn_tdc_hits : mdt_polmux_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
  signal int_mid_tdc_hits : mdt_polmux_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
  signal int_out_tdc_hits : mdt_polmux_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  signal int_ext_tdc_hits : mdt_polmux_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0);
  -- TDC Hits from Tar
  signal int_inn_tar_hits : tar2hps_bus_avt(c_HPS_MAX_HP_INN -1 downto 0);
  signal int_mid_tar_hits : tar2hps_bus_avt(c_HPS_MAX_HP_MID -1 downto 0);
  signal int_out_tar_hits : tar2hps_bus_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  signal int_ext_tar_hits : tar2hps_bus_avt(c_HPS_MAX_HP_EXT -1 downto 0);

begin
  
  TDC_INPUTS_GEN : if c_TAR_INSEL = '1' generate

    -- pipelines
    INN_EN : if c_HPS_ENABLE_ST_INN = '1' generate
      INN_DELAY : for b_i in c_HPS_MAX_HP_INN -1 downto 0 generate
        INN_EN : if c_HP_SECTOR_STATION(0)(b_i) = '1' generate
          
          PL : entity shared_lib.std_pipeline
          generic map(
            g_MEMORY_TYPE     => "ultra",
            g_PIPELINE_TYPE   => "ring_buffer",
            g_DELAY_CYCLES    => TDC_PL_A_LATENCY,
            g_PIPELINE_WIDTH  =>  i_inn_tdc_hits(b_i)'length
          )
          port map(
            clk         => clk,
            rst         => rst,
            glob_en     => glob_en,
            --
            i_data      => i_inn_tdc_hits(b_i),
            o_data      => int_inn_tdc_hits(b_i)
          );

          REMAP_INN : entity tar_lib.tar_remap
          generic map(
            g_STATION => 0
          )
          port map (
            -- clock, control, and monitoring
            clk             => clk,
            rst             => rst,
            glob_en         => glob_en,
            -- TDC Hits from Polmux
            i_tdc_hits  => int_inn_tdc_hits(b_i),
            -- outputs to ucm
            o_tar_hits  => o_inn_tar_hits(b_i)
          );

          o_inn_tdc_hits(b_i) <= int_inn_tdc_hits(b_i);

        end generate;
      end generate;
    end generate;
  
    MID_EN : if c_HPS_ENABLE_ST_MID = '1' generate
      MID_DELAY : for b_i in c_HPS_MAX_HP_MID -1 downto 0 generate
        MID_EN : if c_HP_SECTOR_STATION(1)(b_i) = '1' generate
          PL : entity shared_lib.std_pipeline
          generic map(
            g_MEMORY_TYPE     => "ultra",
            g_PIPELINE_TYPE   => "ring_buffer",
            g_DELAY_CYCLES    => TDC_PL_A_LATENCY,
            g_PIPELINE_WIDTH  => i_mid_tdc_hits(b_i)'length
          )
          port map(
            clk         => clk,
            rst         => rst,
            glob_en     => glob_en,
            --
            i_data      => i_mid_tdc_hits(b_i),
            o_data      => int_mid_tdc_hits(b_i)
          );
          REMAP_MID : entity tar_lib.tar_remap
          generic map(
            g_STATION => 1
          )
          port map (
            -- clock, control, and monitoring
            clk             => clk,
            rst             => rst,
            glob_en         => glob_en,
            -- TDC Hits from Polmux
            i_tdc_hits  => int_mid_tdc_hits(b_i),
            -- outputs to ucm
            o_tar_hits  => o_mid_tar_hits(b_i)
          );

          o_mid_tdc_hits(b_i) <= int_mid_tdc_hits(b_i);
        end generate;
      end generate;
    end generate;
  
    OUT_EN : if c_HPS_ENABLE_ST_OUT = '1' generate
      OUT_DELAY : for b_i in c_HPS_MAX_HP_OUT -1 downto 0 generate
        OUT_EN : if c_HP_SECTOR_STATION(2)(b_i) = '1' generate
          PL : entity shared_lib.std_pipeline
          generic map(
            g_MEMORY_TYPE     => "ultra",
            g_PIPELINE_TYPE   => "ring_buffer",
            g_DELAY_CYCLES    => TDC_PL_A_LATENCY,
            g_PIPELINE_WIDTH  => i_out_tdc_hits(b_i)'length
          )
          port map(
            clk         => clk,
            rst         => rst,
            glob_en     => glob_en,
            --
            i_data      => i_out_tdc_hits(b_i),
            o_data      => int_out_tdc_hits(b_i)
          );
          REMAP_OUT : entity tar_lib.tar_remap
          generic map(
            g_STATION => 2
          )
          port map (
            -- clock, control, and monitoring
            clk             => clk,
            rst             => rst,
            glob_en         => glob_en,
            -- TDC Hits from Polmux
            i_tdc_hits  => int_out_tdc_hits(b_i),
            -- outputs to ucm
            o_tar_hits  => o_out_tar_hits(b_i)
          );

          o_out_tdc_hits(b_i) <= int_out_tdc_hits(b_i);
        end generate;
      end generate;
    end generate;
  
    EXT_EN : if c_HPS_ENABLE_ST_EXT = '1' generate
      EXT_DELAY : for b_i in c_HPS_MAX_HP_EXT -1 downto 0 generate
        EXT_EN : if c_HP_SECTOR_STATION(0)(b_i) = '1' generate
          PL : entity shared_lib.std_pipeline
          generic map(
            g_MEMORY_TYPE     => "ultra",
            g_PIPELINE_TYPE   => "ring_buffer",
            g_DELAY_CYCLES    => TDC_PL_A_LATENCY,
            g_PIPELINE_WIDTH  => i_ext_tdc_hits(b_i)'length
          )
          port map(
            clk         => clk,
            rst         => rst,
            glob_en     => glob_en,
            --
            i_data      => i_ext_tdc_hits(b_i),
            o_data      => int_ext_tdc_hits(b_i)
          );
          REMAP_INN : entity tar_lib.tar_remap
          generic map(
            g_STATION => 3
          )
          port map (
            -- clock, control, and monitoring
            clk             => clk,
            rst             => rst,
            glob_en         => glob_en,
            -- TDC Hits from Polmux
            i_tdc_hits  => int_ext_tdc_hits(b_i),
            -- outputs to ucm
            o_tar_hits  => o_ext_tar_hits(b_i)
          );

          o_ext_tdc_hits(b_i) <= int_ext_tdc_hits(b_i);
        end generate;
      end generate;
    end generate;
    -- remapping 

  end generate;




--------------------------------------------------------------------
--
--                TAR INPUT
--
--------------------------------------------------------------------
-- no DAQ output implemented

  TAR_INPUTS_GEN : if c_TAR_INSEL = '0' generate

    o_inn_tar_hits <= int_inn_tar_hits;
    o_mid_tar_hits <= int_mid_tar_hits;
    o_out_tar_hits <= int_out_tar_hits;
    o_ext_tar_hits <= int_ext_tar_hits;


    -- pipeline
    INN_EN : if c_HPS_ENABLE_ST_INN = '1' generate
      INN_DELAY : for b_i in c_HPS_MAX_HP_INN -1 downto 0 generate
        INN_EN : if c_HP_SECTOR_STATION(0)(b_i) = '1' generate
          PL : entity shared_lib.std_pipeline
          generic map(
            g_MEMORY_TYPE     => "ultra",
            g_PIPELINE_TYPE   => "ring_buffer",
            g_DELAY_CYCLES    => TAR_PL_A_LATENCY,
            g_PIPELINE_WIDTH  =>  i_inn_tar_hits(b_i)'length
          )
          port map(
            clk         => clk,
            rst         => rst,
            glob_en     => glob_en,
            --
            i_data      => i_inn_tar_hits(b_i),
            o_data      => int_inn_tar_hits(b_i)
          );
        end generate;
      end generate;
    end generate;
  
    MID_EN : if c_HPS_ENABLE_ST_MID = '1' generate
      MID_DELAY : for b_i in c_HPS_MAX_HP_MID -1 downto 0 generate
        MID_EN : if c_HP_SECTOR_STATION(1)(b_i) = '1' generate
          PL : entity shared_lib.std_pipeline
          generic map(
            g_MEMORY_TYPE     => "ultra",
            g_PIPELINE_TYPE   => "ring_buffer",
            g_DELAY_CYCLES    => TAR_PL_A_LATENCY,
            g_PIPELINE_WIDTH  => i_mid_tar_hits(b_i)'length
          )
          port map(
            clk         => clk,
            rst         => rst,
            glob_en     => glob_en,
            --
            i_data      => i_mid_tar_hits(b_i),
            o_data      => int_mid_tar_hits(b_i)
          );
        end generate;
      end generate;
    end generate;
  
    OUT_EN : if c_HPS_ENABLE_ST_OUT = '1' generate
      OUT_DELAY : for b_i in c_HPS_MAX_HP_OUT -1 downto 0 generate
        OUT_EN : if c_HP_SECTOR_STATION(2)(b_i) = '1' generate
          PL : entity shared_lib.std_pipeline
          generic map(
            g_MEMORY_TYPE     => "ultra",
            g_PIPELINE_TYPE   => "ring_buffer",
            g_DELAY_CYCLES    => TAR_PL_A_LATENCY,
            g_PIPELINE_WIDTH  => i_out_tar_hits(b_i)'length
          )
          port map(
            clk         => clk,
            rst         => rst,
            glob_en     => glob_en,
            --
            i_data      => i_out_tar_hits(b_i),
            o_data      => int_out_tar_hits(b_i)
          );
        end generate;
      end generate;
    end generate;
  
    EXT_EN : if c_HPS_ENABLE_ST_EXT = '1' generate
      EXT_DELAY : for b_i in c_HPS_MAX_HP_EXT -1 downto 0 generate
        EXT_EN : if c_HP_SECTOR_STATION(0)(b_i) = '1' generate
          PL : entity shared_lib.std_pipeline
          generic map(
            g_MEMORY_TYPE     => "ultra",
            g_PIPELINE_TYPE   => "ring_buffer",
            g_DELAY_CYCLES    => TAR_PL_A_LATENCY,
            g_PIPELINE_WIDTH  => i_ext_tar_hits(b_i)'length
          )
          port map(
            clk         => clk,
            rst         => rst,
            glob_en     => glob_en,
            --
            i_data      => i_ext_tar_hits(b_i),
            o_data      => int_ext_tar_hits(b_i)
          );
        end generate;
      end generate;
    end generate;

  end generate;

  -- REMAP : entity tar_lib.tar_remap
  -- port map (
  --   -- clock, control, and monitoring
  --   clk             => clk,
  --   rst             => rst,
  --   glob_en         => glob_en,
  --   -- TDC Hits from Polmux
  --   i_inn_tdc_hits  => int_inn_tdc_hits,
  --   i_mid_tdc_hits  => int_mid_tdc_hits,
  --   i_out_tdc_hits  => int_out_tdc_hits,
  --   i_ext_tdc_hits  => int_ext_tdc_hits,
  --   -- candidates in from hal
  --   i_inn_tar_hits  => int_inn_tar_hits,
  --   i_mid_tar_hits  => int_mid_tar_hits,
  --   i_out_tar_hits  => int_out_tar_hits,
  --   i_ext_tar_hits  => int_ext_tar_hits,
  --   -- 
  --   o_inn_tdc_hits  => o_inn_tdc_hits,
  --   o_mid_tdc_hits  => o_mid_tdc_hits,
  --   o_out_tdc_hits  => o_out_tdc_hits,
  --   o_ext_tdc_hits  => o_ext_tdc_hits,
  --   -- outputs to ucm
  --   o_inn_tar_hits  => o_inn_tar_hits,
  --   o_mid_tar_hits  => o_mid_tar_hits,
  --   o_out_tar_hits  => o_out_tar_hits,
  --   o_ext_tar_hits  => o_ext_tar_hits

  -- );
  
end architecture beh;