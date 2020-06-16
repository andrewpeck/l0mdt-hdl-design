
--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
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
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity hit_processor is
  generic(
    radius      : integer := 0
  );
  port (
    clk                 : in std_logic;
    rst            : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    local_rst      : in std_logic;
    local_en            : in std_logic;
    time_offset         : in unsigned(7 downto 0);

    -- SLc
    i_SLC_Window        : in hp_heg2hp_window_avt;
    i_slc_data_v        : in hp_heg2hp_slc_rvt;
    -- MDT hit
    i_mdt_data          : in hp_hpsPc2hp_rvt;
    -- to Segment finder
    o_hit_data          : out hp_hp2bm_rvt
  );
end entity hit_processor;

architecture beh of hit_processor is
  signal slc_data             : hp_heg2hp_slc_rt;
  signal mdt_data             : hp_hpsPc2hp_rt;
  -- signal tdc_time_t0          : mdt_time_le_st;
  signal tdc_time_comp_valid  : std_logic;
  signal tdc_hitmatch_valid   : std_logic;
  signal tdc_paramcalc_valid  : std_logic;

  signal data_2_sf_r          : hp_hp2bm_rt;

  signal int_hit_valid       : std_logic;

begin

  mdt_data <= structify(i_mdt_data);
  slc_data <= structify(i_slc_data_v);

  o_hit_data <= vectorify(data_2_sf_r);


  HP_HM : entity hp_lib.hp_matching
  generic map(
    radius      => radius
  )
  port map(
    clk                 => clk,
    rst            => rst,
    glob_en             => glob_en,
    -- configuration
    time_offset         => time_offset,
    -- RoI_size            => RoI_size,
    -- SLc
    i_SLC_Window        => i_SLC_Window,
    -- i_SLc_rpc_z         => i_slc_data_av.barrel.z,
    i_SLc_BCID          => slc_data.BCID,
    -- MDT hit
    i_mdt_layer         => mdt_data.layer,
    i_mdt_tube          => mdt_data.tube,
    i_mdt_time_real     => mdt_data.time_t0,
    i_data_valid         => mdt_data.data_valid,
    -- to Segment finder
    o_hit_valid         => int_hit_valid
    -- o_data_valid        => tdc_hitmatch_valid

  );

  HP_PC : entity hp_lib.hp_paramCalc
  generic map(
      radius      => radius
  )
  port map(
    clk                 => clk,
    rst            => rst,
    glob_en             => glob_en,
    -- SLc
    i_SLc_specific      => slc_data.specific,
    i_SLc_BCID          => slc_data.BCID,
    -- MDT hit
    i_mdt_time_real     => mdt_data.time_t0,
    i_mdt_z             => mdt_data.global_z,
    i_mdt_y             => mdt_data.global_y,
    i_data_valid         => mdt_data.data_valid,
    -- to Segment finder
    o_tube_radius       => data_2_sf_r.data.radius,
    o_local_y           => data_2_sf_r.data.local_y,
    o_local_z           => data_2_sf_r.data.local_x
    -- o_data_valid        => tdc_paramcalc_valid

  );

  dv_delay : entity shared_lib.std_pipeline
  generic map(
    num_delays    => 4,
    num_bits      => 1
  )
  port map(
    clk               => clk,
    rst          => rst,
    glob_en           => glob_en,
    --
    i_data(0)         => mdt_data.data_valid,
    o_data(0)         => data_2_sf_r.data_valid
  );

  hv_delay : entity shared_lib.std_pipeline
  generic map(
    num_delays    => 4,
    num_bits      => 1
  )
  port map(
    clk               => clk,
    rst          => rst,
    glob_en           => glob_en,
    --
    i_data(0)         => int_hit_valid,
    o_data(0)         => data_2_sf_r.mdt_valid
  );

end beh;

