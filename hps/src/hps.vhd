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
library hps_lib;
use hps_lib.hps_pkg.all;

entity hps is
  generic(
    radius      : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- control

    -- SLc
    i_uCM2hps_av        : in ucm2hps_avt(MAX_NUM_HEG -1 downto 0);
    -- MDT hit
    i_mdt_tar_av        : in tar2hps_avt(MAX_NUM_HP -1 downto 0);
    -- to pt calc
    o_sf2pt_av          : out sf2pt_avt(MAX_NUM_HEG -1 downto 0)
  );
end entity hps;

architecture beh of hps is

  signal mdt_full_data : hps_pc2heg_avt(MAX_NUM_HP -1 downto 0);

  -- signal int_uCM_data : ucm2heg_slc_avt(MAX_NUM_HEG -1 downto 0);
  -- signal control_enable(MAX_NUM_HEG -1 downto 0);

  signal heg2sf_control        : heg_int_control_art(MAX_NUM_HEG -1 downto 0);
  signal heg2sf_slc_data       : ucm2hps_avt(MAX_NUM_HEG -1 downto 0);
  signal heg2sf_mdt_data       : hps_bm2sf_vt(MAX_NUM_HEG -1 downto 0);

begin

  -- HPS_SLC_DIST : entity hps_lib.hps_slc_dist
  -- generic map(
  --   radius              => radius
  -- )
  -- port map(
  --   clk                 => clk,
  --   Reset_b             => Reset_b,
  --   glob_en             => glob_en,
  --   --
  --   i_uCM_pam           => i_uCM_pam,
  --   --
  --   i_uCM2hps_av          => i_uCM2hps_av,
  --   o_uCM_data          => int_uCM_data
    
  -- );

  pc_gen : for hp_i in MAX_NUM_HP -1 downto 0 generate
    PC : entity hps_lib.hps_pc 
    generic map(
      radius              => radius
    )
    port map(
      clk                 => clk,
      Reset_b             => Reset_b,
      glob_en             => glob_en,
      --
      i_mdt_tar_v      => i_mdt_tar_av(hp_i),
      o_mdt_full_data     => mdt_full_data(hp_i)
    );
  end generate;

  heg_gen : for heg_i in MAX_NUM_HEG -1 downto 0 generate
    HEG : entity heg_lib.heg
    generic map(
      radius              => radius
    )
    port map(
      clk                 => clk,
      Reset_b             => Reset_b,
      glob_en             => glob_en,
      --
      i_uCM_data_v          => i_uCM2hps_av(heg_i),
      -- MDT hit
      i_mdt_full_data     => mdt_full_data,
      -- to Segment finder
      o_sf_control        => heg2sf_control(heg_i),
      o_sf_slc_data       => heg2sf_slc_data(heg_i),
      o_sf_mdt_data       => heg2sf_mdt_data(heg_i)
    );

    SF : entity hps_lib.hps_sf_wrap
    generic map(
      radius              => radius
    )
    port map(
      clk                 => clk,
      Reset_b             => Reset_b,
      glob_en             => glob_en,
      -- to Segment finder
      i_sf_control        => heg2sf_control(heg_i),
      i_sf_slc_data       => heg2sf_slc_data(heg_i),
      i_sf_mdt_data       => heg2sf_mdt_data(heg_i),
      --
      o_sf2pt_av           => o_sf2pt_av(heg_i)
    );

  end generate;


end beh;