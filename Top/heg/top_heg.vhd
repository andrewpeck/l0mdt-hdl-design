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
use shared_lib.common_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;

entity top_heg is
  generic(
    radius      : integer := 0  --station
    -- num_layers  : integer := 8;
    -- MAX_NUM_HP      : integer := 6
  );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration
    -- i_heg_control       : in heg_control;
    -- SLc
    i_uCM_data          : in ucm2heg_slc_vt;
    -- MDT hit
    i_mdt_full_data     : in heg_pc2heg_avt(MAX_NUM_HP -1 downto 0);
    -- to Segment finder
    o_sf_control        : out heg_int_control_rt;
    o_sf_slc_data       : out ucm2heg_slc_rt;
    o_sf_mdt_data       : out heg2sf_mdt_rt
  );
end entity top_heg;

architecture beh of top_heg is

  signal roi_Window : SLc_window_at;

begin

  HEG : entity heg_lib.heg
  generic map(
    radius              => radius
    -- num_layers          => num_layers
    -- MAX_NUM_HP              => MAX_NUM_HP    
  )
  port map(
    clk                 => CLK,
    
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- configuration
    -- SLc
    i_uCM_data          => i_uCM_data,
    -- MDT hit
    i_mdt_full_data     => i_mdt_full_data,
    -- i_mdt_valid         => i_mdt_valid,
    -- to Segment finder
    o_sf_control        => o_sf_control,
    o_sf_slc_data       => o_sf_slc_data,
    o_sf_mdt_data       => o_sf_mdt_data
  );


end beh;


