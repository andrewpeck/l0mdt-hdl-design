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

entity tar_station is
  generic(
    g_ARRAY_LEN : integer := 0;
    g_STATION :   integer := 0
  );
  port (
    clk              : in std_logic;
    rst              : in std_logic;
    glob_en          : in std_logic;
    -- ctrl/mon

    -- data
    i_tdc_hits_av    : in  mdt_polmux_bus_avt (g_ARRAY_LEN -1 downto 0);
    o_tdc_hits_av    : out mdt_polmux_bus_avt(g_ARRAY_LEN -1 downto 0);
    o_tar_hits_av    : out tar2hps_bus_avt(g_ARRAY_LEN -1 downto 0)
    
  );
end entity tar_station;

architecture beh of tar_station is

  signal i_tdc_hits_ar : mdt_polmux_bus_at(g_ARRAY_LEN -1 downto 0);
  signal int_tdc_hits_av : mdt_polmux_bus_avt(g_ARRAY_LEN -1 downto 0);

  
begin

  i_tdc_hits_ar <= structify(i_tdc_hits_av);
  
  PL_ARRAY : for b_i in g_ARRAY_LEN -1 downto 0 generate
    POLMUX_EN : if c_HP_SECTOR_STATION(0)(b_i) = '1' generate

      VAMC_PL : entity vamc_lib.vamc_top
      generic map(
        g_MEMORY_MODE       => "pipeline",
        g_MEMORY_TYPE       => "ultra",
        g_DATA_WIDTH        => i_tdc_hits_av(b_i)'length,
        g_DATA_DEPTH        => 4000,
        g_PIPELINE_TYPE     => "mpcvmem",
        g_MEMORY_STRUCTURE  => "XPM",
        g_DELAY_CYCLES      => TDC_PL_A_LATENCY,
        g_PIPELINE_WIDTH    => i_tdc_hits_av(b_i)'length, -- necesario?
        -- BU bus
        g_APBUS_ENABLED    => '0'
        -- g_XML_NODE_NAME    => "MEM_INT_12A148D",
        -- g_APBUS_CTRL_WIDTH => apb_ctr_v'length,--integer(len(ctrl)),
        -- g_APBUS_MON_WIDTH  => apb_mon_v'length --integer(len(mon))
      ) 
      port map(
        clk         => clk,
        rst         => rst,
        ena         => glob_en,
        -- Ctrl/Mon 
        -- ctrl  => apb_ctrl_mem_v,
        -- mon   => apb_mon_mem_v,
        -- i_freeze    => i_freeze,
  
        --
        i_data      => i_tdc_hits_av(b_i),
        i_dv        => i_tdc_hits_ar(b_i).data_valid,
        o_data      => int_tdc_hits_av(b_i)
        -- o_dv        => pl2pl_dv
      );

      REMAP: entity tar_lib.tar_remap
      generic map(
        g_STATION => 0
      )
      port map (
        -- clock, control, and monitoring
        clk             => clk,
        rst             => rst,
        glob_en         => glob_en,
        -- TDC Hits from Polmux
        i_tdc_hits  => int_tdc_hits_av(b_i),
        -- outputs to h2s
        o_tar_hits  => o_tar_hits_av(b_i)
      );

      o_tdc_hits_av(b_i) <= int_tdc_hits_av(b_i);

    end generate;
  end generate;
  
end architecture beh;