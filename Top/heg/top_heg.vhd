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
    i_uCM_data_v        : in ucm2hps_vt;
    -- MDT hit
    i_mdt_full_data_av  : in heg_pc2heg_avt(MAX_NUM_HP -1 downto 0);
    -- to Segment finder
    o_sf_control_v      : out heg_ctrl2hp_vt;
    o_sf_slc_data_v     : out ucm2hps_vt;
    o_sf_mdt_data_v     : out heg_bm2sf_vt
  );
end entity top_heg;

architecture beh of top_heg is

begin

  HEG : entity heg_lib.heg
  generic map(
    radius              => radius 
  )
  port map(
    clk                 => CLK,
    
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- configuration
    -- SLc
    i_uCM_data_v          => i_uCM_data_v,
    -- MDT hit
    i_mdt_full_data_av     => i_mdt_full_data_av,
    -- i_mdt_valid         => i_mdt_valid,
    -- to Segment finder
    o_sf_control_v        => o_sf_control_v,
    o_sf_slc_data_v       => o_sf_slc_data_v,
    o_sf_mdt_data_v       => o_sf_mdt_data_v
  );


end beh;


