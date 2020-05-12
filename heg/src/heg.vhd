--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: 
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;


entity heg is
  generic(
    radius      : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    -- i_heg_control       : in heg_control;
    -- SLc
    i_uCM_data_v          : in ucm2hps_rvt;
    -- MDT hit
    i_mdt_full_data_av     : in heg_pc2heg_avt(MAX_NUM_HP -1 downto 0);
    -- to Segment finder
    o_sf_control_v        : out heg_ctrl2hp_vt;
    o_sf_slc_data_v       : out ucm2hps_rvt;
    o_sf_mdt_data_v       : out heg_bm2sf_vt
  );
end entity heg;

architecture beh of heg is

  -- signal heg_uCM_data       : ucm2heg_slc_rt;
  signal roi_b_Window       : hp_heg2hp_window_vt;
  signal hegC2hp_uCM_data   : hp_heg2hp_slc_vt;
  
  signal hegC_control : heg_ctrl2hp_rt;

  signal hp2bm_av : heg_hp2bm_avt(MAX_NUM_HP -1 downto 0);

  signal time_offset  : unsigned(7 downto 0);

begin

  o_sf_control_v <= vectorify(hegC_control);

  Heg_Control : entity heg_lib.heg_Control
  generic map(
    radius      => radius
    -- MAX_NUM_HP      => MAX_NUM_HP
  )
  port map(
    clk                 => clk,
    
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    --
    i_uCM_data_v        => i_uCM_data_v,
    --
    o_uCM2sf_data_v     => o_sf_slc_data_v,
    o_uCM2hp_data_v     => hegC2hp_uCM_data,
    o_SLC_Window_v      => roi_b_Window,
    o_control           => hegC_control
  );

  hp_gen: for i_hp in MAX_NUM_HP -1 downto 0 generate
    Hit_Processor : entity hp_lib.hit_processor
    generic map(
      radius              => radius
    )
    port map(
      clk                 => clk,
      Reset_b             => Reset_b,
      glob_en             => glob_en,
      -- configuration
      local_Reset_b       => hegC_control.reset_b(i_hp),
      local_en            => hegC_control.enable(i_hp),
      time_offset         => time_offset,

      -- SLc
      i_SLC_Window        => roi_b_Window,
      i_slc_data_v        => hegC2hp_uCM_data,
      -- MDT hit
      i_mdt_data          => i_mdt_full_data_av(i_hp),
      -- i_mdt_valid         => i_mdt_valid,
      -- i_mdt_time_real     => i_mdt_time_real,
      -- to Segment finder
      -- o_sf_slc_data_v       => o_sf_slc_data_v,
      o_hit_data       => hp2bm_av(i_hp)
    );
  end generate;

  Heg_buffer_mux : entity heg_lib.heg_buffermux
  -- generic map(

  -- )
  port map(
    clk                 => clk,
    
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- configuration
    i_control           =>hegC_control,
    -- MDT in
    i_mdt_hits_av       => hp2bm_av,
    -- MDT out
    o_mdt_hits_v        => o_sf_mdt_data_v
  );

end beh;