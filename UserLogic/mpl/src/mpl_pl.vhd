--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Main pipe line
--  Description: pipelines between UCM - TF - MTC
--
--------------------------------------------------------------------------------
--  Revisions:
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

library mpl_lib;
use mpl_lib.mpl_pkg.all;

library ctrl_lib;
use ctrl_lib.MPL_CTRL.all;

entity mpl_pl is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    enable              : in std_logic;
    -- AXI to SoC
    ctrl                : in  MPL_PL_MEM_PL_MEM_CTRL_t;
    mon                 : out MPL_PL_MEM_PL_MEM_MON_t;
    --
    i_freeze            : in std_logic := '0';
    --
    i_uCM2pl_v       : in  ucm2pl_rvt;
    o_pl2ptcalc_v    : out ucm2pl_rvt;
    o_pl2mtc_v       : out pl2mtc_rvt
    
    );
end entity mpl_pl;

architecture beh of mpl_pl is

  signal i_uCM2pl_r : ucm2pl_rt;
  signal pl2pl_v    : ucm2pl_rvt;
  signal pl2pl_r    : ucm2pl_rt;
  signal pl2mtc_r   : pl2mtc_rt;
  signal pl2mtc_v   : pl2mtc_rvt;
  
begin

  i_uCM2pl_r <= structify(i_uCM2pl_v);
  
  PL_A : entity shared_lib.std_pipeline
    generic map(
      g_MEMORY_TYPE     => "ultra",
      g_PIPELINE_TYPE   => "mpcvmem",
      g_DELAY_CYCLES    => c_MPL_PL_A_LATENCY,
      g_PIPELINE_WIDTH  => i_uCM2pl_v'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      glob_en     => enable,
      --
      i_freeze    => i_freeze,
      --
      i_data      => i_uCM2pl_v,
      i_dv        => i_uCM2pl_r.data_valid,
      o_data      => pl2pl_v
    );

  o_pl2ptcalc_v <= pl2pl_v;

  pl2pl_r <= structify(pl2pl_v);

  -- PL_2_MTC : for sl_i in c_MAX_NUM_SL -1 downto 0 generate
    pl2mtc_r.common      <= pl2pl_r.common;
    pl2mtc_r.process_ch  <= pl2pl_r.process_ch;
    pl2mtc_r.busy        <= pl2pl_r.busy;
    pl2mtc_r.data_valid  <= pl2pl_r.data_valid;
  -- end generate;

  pl2mtc_v <= vectorify(pl2mtc_r);

  PL_B : entity shared_lib.std_pipeline
    generic map(
      g_DELAY_CYCLES      => MPL_PL_B_LATENCY,
      g_PIPELINE_WIDTH    => pl2mtc_v'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      glob_en     => enable,
      --
      i_data      => pl2mtc_v,
      o_data      => o_pl2mtc_v
    );
    

  
end architecture beh;