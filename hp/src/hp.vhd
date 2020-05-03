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
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;

entity hit_processor is
  generic(
    radius      : integer := 0
  );
  port (
    clk                 : in std_logic;    
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    time_offset         : in unsigned(7 downto 0);

    -- SLc
    i_SLC_Window        : in hp_heg2hp_window_vt;
    i_slc_data_v        : in hp_heg2hp_slc_vt;
    -- MDT hit
    i_mdt_data          : in hp_hpsPc2hp_vt;

    -- to Segment finder
    o_mdt2sf_data    : out hp2bm_vt
  );
end entity hit_processor;

architecture beh of hit_processor is
  signal slc_data             : hp_heg2hp_slc_rt;
  signal mdt_data             : hp_hpsPc2hp_rt;
  -- signal tdc_time_t0          : mdt_time_le_st;
  signal tdc_time_comp_valid  : std_logic;
  signal tdc_hitmatch_valid   : std_logic;
  signal tdc_paramcalc_valid  : std_logic;

  signal data_2_sf            : hp2bm_rt;

begin
    
  mdt_data <= structify(i_mdt_data);
  slc_data <= structify(i_slc_data_v);

  o_mdt2sf_data <= hp2bm_rt_f_r2std(data_2_sf);


  HP_HM : entity hp_lib.hp_matching
  generic map(
    radius      => radius
  )
  port map(
    clk                 => clk,
    Reset_b             => Reset_b,
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
    -- i_mdt_valid         => tdc_time_comp_valid,
    -- to Segment finder
    o_hit_valid         => data_2_sf.mdt_valid
    -- o_data_valid        => tdc_hitmatch_valid

  );

  HP_PC : entity hp_lib.hp_paramCalc
  generic map(
      radius      => radius
  )
  port map(
    clk                 => clk,
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- SLc
    i_SLc_specific      => slc_data.specific,
    i_SLc_BCID          => slc_data.BCID,
    -- MDT hit
    i_mdt_time_real     => mdt_data.time_t0,
    i_mdt_z_0           => mdt_data.global_z,
    i_mdt_y_0           => mdt_data.global_y,
    i_mdt_valid         => mdt_data.data_valid,
    -- to Segment finder
    o_segFinder_data    => data_2_sf.sf_data
    -- o_data_valid        => tdc_paramcalc_valid

  );

  dv_delay : entity shared_lib.std_pipeline
  generic map(
    num_delays    => 4,
    num_bits      => 1
  )
  port map(
    clk               => clk,
    Reset_b           => Reset_b,
    glob_en           => glob_en,
    --
    i_data(0)         => mdt_data.data_valid,
    o_data(0)         => data_2_sf.data_valid
  );

end beh;

