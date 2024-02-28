--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: tar
-- File: tar_station.vhd
-- Module: TAR
-- File PATH: /src/tar_station.vhd
-- -----
-- File Created: Tuesday, 23rd November 2021 2:24:35 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 15th December 2021 2:46:20 pm
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

-- use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;

library vamc_lib;

library tar_lib;
use tar_lib.tar_pkg.all;

library ctrl_lib;
use ctrl_lib.TAR_CTRL.all;

entity tar_station is
  generic(
    g_ARRAY_LEN : integer := 0;
    g_STATION :   integer := 0
  );
  port (
    clk               : in std_logic;
    rst               : in std_logic;
    glob_en           : in std_logic;
    -- ctrl/mon
    ctrl_v            : in  std_logic_vector;--TAR_PL_MEM_PL_MEM_CTRL_t;
    mon_v             : out std_logic_vector;--TAR_PL_MEM_PL_MEM_MON_t;
    -- supervisor
    i_freeze          : in std_logic :=  '0';
    -- data
    i_tdc_hits_av    : in  tdcpolmux2tar_avt (g_ARRAY_LEN -1 downto 0);
    o_tdc_hits_av    : out tdcpolmux2tar_avt(g_ARRAY_LEN -1 downto 0);
    o_tar_hits_av    : out tar2hps_avt(g_ARRAY_LEN -1 downto 0)
    
  );
end entity tar_station;

architecture beh of tar_station is

  signal ctrl_r : TAR_PL_ST_CTRL_t;
  signal mon_r  : TAR_PL_ST_MON_t;

  -- constant CTRL_LEN : integer := width(ctrl_r.PL_MEM(0));--71;
  -- constant MON_LEN : integer := width(mon_r.PL_MEM(0));--43;

  type ctrl_apb_mem_avt is array (5 downto 0) of std_logic_vector(TAR_PL_ST_PL_MEM_CTRL_t'w -1  downto 0);
  type mon_apb_mem_avt  is array (5 downto 0) of std_logic_vector(TAR_PL_ST_PL_MEM_MON_t'w -1  downto 0);

  signal ctrl_apb_mem_av : ctrl_apb_mem_avt;
  signal mon_apb_mem_av  : mon_apb_mem_avt; 

  signal i_tdc_hits_ar : tdcpolmux2tar_art(g_ARRAY_LEN -1 downto 0);
  signal int_tdc_hits_av : tdcpolmux2tar_avt(g_ARRAY_LEN -1 downto 0);


begin

  ctrl_r <= convert(ctrl_v,ctrl_r);
  mon_v <= convert(mon_r,mon_v);

  tdc_loop: for b_i in g_ARRAY_LEN -1 downto 0 generate
    i_tdc_hits_ar(b_i) <= convert(i_tdc_hits_av(b_i),i_tdc_hits_ar(b_i));
  end generate tdc_loop;
  
  
  PL_ARRAY : for b_i in g_ARRAY_LEN -1 downto 0 generate

    ctrl_apb_mem_av(b_i) <= convert(ctrl_r.PL_MEM(b_i),ctrl_apb_mem_av(b_i));
    mon_r.PL_MEM(b_i) <= convert(mon_apb_mem_av(b_i),mon_r.PL_MEM(b_i));

    POLMUX_EN : if c_HP_SECTOR_STATION(0)(b_i) = '1' generate

      VAMC_PL : entity vamc_lib.vamc_top
      generic map(
        g_MEMORY_MODE       => "pipeline",
        g_MEMORY_TYPE       => "ultra",
        g_DATA_WIDTH        => i_tdc_hits_av(b_i)'length,
        g_DATA_DEPTH        => 4000,
        g_PIPELINE_TYPE     => "XPM",
        g_MEMORY_STRUCTURE  => "SDP",
        g_DELAY_CYCLES      => TDC_PL_A_LATENCY,
        g_PIPELINE_WIDTH    => i_tdc_hits_av(b_i)'length, -- necesario?
        g_PARALLEL_MEM      => 1,
        -- BU bus
        -- g_APBUS_ENABLED    => '1',
        g_EXT_INT           => "APB",
        g_XML_NODE_NAME    => "MEM_INT_12A42D"
        -- g_APBUS_CTRL_WIDTH => ctrl_apb_mem_av(b_i)'length,--integer(len(ctrl)),
        -- g_APBUS_MON_WIDTH  => mon_apb_mem_av(b_i)'length --integer(len(mon))
      ) 
      port map(
        clk         => clk,
        rst         => rst,
        ena         => glob_en,
        --
        -- Ctrl/Mon 
        ctrl_v        => ctrl_apb_mem_av(b_i),
        mon_v         => mon_apb_mem_av(b_i),
        i_freeze    => i_freeze,
        --
        i_data      => i_tdc_hits_av(b_i),
        i_dv        => i_tdc_hits_ar(b_i).data_valid,
        o_data      => int_tdc_hits_av(b_i)
        -- o_dv        => pl2pl_dv
      );

      REMAP: entity tar_lib.tar_remap
      generic map(
        g_STATION => g_STATION
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