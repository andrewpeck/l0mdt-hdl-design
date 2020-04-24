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
use shared_lib.cfg_pkg.all;
use shared_lib.interfaces_types_pkg.all;

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
    i_uCM_data          : in ucm2heg_slc_stdst;
    -- MDT hit
    i_mdt_full_data     : in hp_hit_data_astdst(MAX_NUM_HP -1 downto 0);
    -- to Segment finder
    o_sf_control        : out heg_int_control_rt;
    o_sf_slc_data       : out ucm2heg_slc_rt;
    o_sf_mdt_data       : out heg2sf_mdt_rt
  );
end entity heg;

architecture beh of heg is

  -- signal heg_uCM_data       : ucm2heg_slc_rt;
  signal roi_b_Window       : SLc_window_std;
  signal hegC2hp_uCM_data   : hp_slc_rt;
  
  signal hegC_control : heg_int_control_rt;

  signal hp2bm_astd : hp2bm_astdst(MAX_NUM_HP -1 downto 0);

  signal time_offset  : unsigned(7 downto 0);

begin

  o_sf_control <= hegC_control;

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
    i_uCM_data          => i_uCM_data,
    --
    o_uCM2sf_data       => o_sf_slc_data,
    o_uCM2hp_data       => hegC2hp_uCM_data,
    o_SLC_Window        => roi_b_Window,
    o_control           => hegC_control
  );

  hp_gen: for i_hp in MAX_NUM_HP -1 downto 0 generate
    Hit_Processor : entity hp_lib.hit_processor
    generic map(
      radius              => radius
    )
    port map(
      clk                 => clk,
      
      Reset_b             => hegC_control.hp_resets_b(i_hp),
      glob_en             => hegC_control.hp_enables(i_hp),
      -- configuration
      time_offset         => time_offset,

      -- SLc
      i_SLC_Window        => roi_b_Window,
      i_slc_data_av          => hegC2hp_uCM_data,
      -- MDT hit
      i_mdt_data          => i_mdt_full_data(i_hp),
      -- i_mdt_valid         => i_mdt_valid,
      -- i_mdt_time_real     => i_mdt_time_real,
      -- to Segment finder
      -- o_sf_slc_data       => o_sf_slc_data,
      o_mdt2sf_data       => hp2bm_astd(i_hp)
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
    i_mdt_hits          => hp2bm_astd,
    -- MDT out
    o_mdt_hits         => o_sf_mdt_data
  );

end beh;