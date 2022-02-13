
--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Hit Processor Top
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      26/11/2019  0.1     File created
--      05/02/2020  0.11    Change name and structure to Hit processor as the diagram
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

library vamc_lib;

library hp_lib;
--use hp_lib.hp_pkg.all;
library hegtypes_lib;
use hegtypes_lib.hp_pkg.all;

entity hit_processor is
  generic(
    g_STATION_RADIUS    : integer := 0
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic := '1';
    --
    ctrl_v              : in std_logic_vector;
    mon_v               : out std_logic_vector;
    -- configuration
    local_rst           : in std_logic;
    local_en            : in std_logic;
    -- time_offset         : in unsigned(12 -1 downto 0);

    -- SLc
    i_SLC_Window        : in hp_heg2hp_window_avt(get_num_layers(g_STATION_RADIUS) -1 downto 0);
    i_slc_data_v        : in hp_heg2hp_slc_rvt;
    -- MDT hit
    i_mdt_data_v          : in hp_hpsPc2hp_rvt;
    -- to Segment finder
    o_hit_data_v          : out hp_hp2bm_rvt
  );
end entity hit_processor;

architecture beh of hit_processor is
  signal slc_data_r             : hp_heg2hp_slc_rt;
  signal mdt_data_r             : hp_hpsPc2hp_rt;
  -- signal tdc_time_t0          : mdt_time_le_st;
  -- signal tdc_time_comp_valid  : std_logic;
  -- signal tdc_hitmatch_valid   : std_logic;
  -- signal tdc_hitmatch_valid_pl: std_logic;
  signal tdc_paramcalc_valid  : std_logic;

  signal hm2pl      : std_logic_vector(1 downto 0);
  signal plout_hm   : std_logic_vector(1 downto 0);
  
  signal data_2_sf_r          : hp_hp2bm_rt;

  signal hp_rst  : std_logic;
  signal hp_ena  : std_logic;

  

begin

  hp_rst  <= rst OR local_rst;
  hp_ena  <= glob_en AND local_en;

  mdt_data_r <= structify(i_mdt_data_v);
  slc_data_r <= structify(i_slc_data_v);

  o_hit_data_v <= vectorify(data_2_sf_r);


  HP_HM : entity hp_lib.hp_matching
  generic map(
    g_STATION_RADIUS     => g_STATION_RADIUS
  )
  port map(
    clk                 => clk,
    rst                 => hp_rst,
    glob_en             => hp_ena,
    -- configuration
    -- time_offset         => time_offset,
    -- RoI_size            => RoI_size,
    -- SLc
    i_SLC_Window        => i_SLC_Window,
    -- i_SLc_rpc_z         => i_slc_data_av.barrel.z,
    i_SLc_BCID          => slc_data_r.BCID,
    -- MDT hit
    i_mdt_layer         => mdt_data_r.layer,
    i_mdt_tube          => mdt_data_r.tube,
    i_mdt_time_real     => mdt_data_r.time_t0,
    i_data_valid        => mdt_data_r.data_valid,
    -- to Segment finder
    o_hit_valid         => hm2pl(0),
    o_data_valid        => hm2pl(1)

  );

  HP_PC : entity hp_lib.hp_paramCalc
  generic map(
      g_STATION_RADIUS     => g_STATION_RADIUS
  )
  port map(
    clk                 => clk,
    rst                 => hp_rst,
    glob_en             => hp_ena,
    --
    ctrl_v          => ctrl_v,
    mon_v           => mon_v , 
    -- SLc-
    -- i_SLC_RoI_org       => structify(i_SLC_Window(0)).lo,
    i_SLc_data_v        => i_slc_data_v,--.specific,
    -- i_SLc_BCID          => slc_data_r.BCID,
    -- MDT hit
    i_mdt_time_real     => mdt_data_r.time_t0,
    i_global_z          => mdt_data_r.global_z,
    i_global_x          => mdt_data_r.global_x,
    i_mdt_layer         => mdt_data_r.layer,
    i_data_valid        => mdt_data_r.data_valid,
    -- to Segment finder
    o_tube_radius       => data_2_sf_r.data.radius,
    o_local_x           => data_2_sf_r.data.local_x,
    o_local_y           => data_2_sf_r.data.local_y,
    o_ml                => data_2_sf_r.data.mlayer,
    o_data_valid        => tdc_paramcalc_valid

  );

  dv_delay : entity vamc_lib.vamc_spl
  generic map(
    g_DELAY_CYCLES        => 1,
    g_PIPELINE_WIDTH      => 2
  )
  port map(
    clk         => clk,
    rst         => hp_rst,
    ena         => hp_ena,
    --
    i_data      => hm2pl,
    -- i_dv        => i_mdt_tar_r.data_valid,
    o_data      => plout_hm
    -- o_dv        => pl_mdt_tar_dv
  );

  data_2_sf_r.mdt_valid <= plout_hm(0);
  data_2_sf_r.data_valid <= plout_hm(1) and tdc_paramcalc_valid;

end beh;

