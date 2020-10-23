--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Tube Adress Remap ()
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

entity tar_tp is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    -- TDC Hits from Polmux
    -- i_inn_tdc_hits    : in  mdt_polmux_bus_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    -- i_mid_tdc_hits   : in  mdt_polmux_bus_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    -- i_out_tdc_hits    : in  mdt_polmux_bus_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    -- i_ext_tdc_hits    : in  mdt_polmux_bus_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    i_inn_tar_hits    : in  tar2hps_bus_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_mid_tar_hits    : in  tar2hps_bus_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_out_tar_hits    : in  tar2hps_bus_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_ext_tar_hits    : in  tar2hps_bus_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC polmux from Tar
    -- o_inn_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    -- o_mid_tdc_hits   : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    -- o_out_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    -- o_ext_tdc_hits    : out mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- TDC Hits from Tar
    o_inn_tar_hits    : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    o_mid_tar_hits    : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    o_out_tar_hits    : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    o_ext_tar_hits    : out tar2hps_bus_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0)
  );
end entity tar_tp;

architecture beh of tar_tp is
  
begin

  INN_EN : if c_HPS_ENABLE_ST_INN = '1' generate
    INN_DELAY : for b_i in c_HPS_NUM_MDT_CH_INN -1 downto 0 generate
      PL : entity shared_lib.std_pipeline
      generic map(
        type_memory => "ultra",
        logic_type  => "ring_buffer",
        num_delays  => TAR_PL_A_LATENCY,
        num_bits    => i_inn_tar_hits(b_i)'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        glob_en     => glob_en,
        --
        i_data      => i_inn_tar_hits(b_i),
        o_data      => o_inn_tar_hits(b_i)
      );
    end generate;
  end generate;

  MID_EN : if c_HPS_ENABLE_ST_MID = '1' generate
    MID_DELAY : for b_i in c_HPS_NUM_MDT_CH_MID -1 downto 0 generate
      PL : entity shared_lib.std_pipeline
      generic map(
        type_memory => "ultra",
        logic_type  => "ring_buffer",
        num_delays  => TAR_PL_A_LATENCY,
        num_bits    => i_mid_tar_hits(b_i)'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        glob_en     => glob_en,
        --
        i_data      => i_mid_tar_hits(b_i),
        o_data      => o_mid_tar_hits(b_i)
      );
    end generate;
  end generate;

  OUT_EN : if c_HPS_ENABLE_ST_OUT = '1' generate
    OUT_DELAY : for b_i in c_HPS_NUM_MDT_CH_OUT -1 downto 0 generate
      PL : entity shared_lib.std_pipeline
      generic map(
        type_memory => "ultra",
        logic_type  => "ring_buffer",
        num_delays  => TAR_PL_A_LATENCY,
        num_bits    => i_out_tar_hits(b_i)'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        glob_en     => glob_en,
        --
        i_data      => i_out_tar_hits(b_i),
        o_data      => o_out_tar_hits(b_i)
      );
    end generate;
  end generate;

  EXT_EN : if c_HPS_ENABLE_ST_EXT = '1' generate
    EXT_DELAY : for b_i in c_HPS_NUM_MDT_CH_EXT -1 downto 0 generate
      PL : entity shared_lib.std_pipeline
      generic map(
        type_memory => "ultra",
        logic_type  => "ring_buffer",
        num_delays  => TAR_PL_A_LATENCY,
        num_bits    => i_ext_tar_hits(b_i)'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        glob_en     => glob_en,
        --
        i_data      => i_ext_tar_hits(b_i),
        o_data      => o_ext_tar_hits(b_i)
      );
    end generate;
  end generate;

  
  
  
  
end architecture beh;