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

library ucm_lib;
use ucm_lib.ucm_pkg.all;
library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;



entity top_ucm_hps is
  generic(
    radius      : integer := 0  --station
  );
  port (
    clk                 : in std_logic;
    
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- control
    -- SLc
    i_slc_data_av          : in slc_rx_data_avt(MAX_NUM_SL -1 downto 0);
    -- i_uCM_pam           : in ucm2heg_pam_art(MAX_NUM_HEG -1 downto 0);
    -- i_uCM2hps_av          : in ucm2hps_avt(MAX_NUM_HEG -1 downto 0);
    -- MDT hit
    i_mdt_tar_av      : in tar2hps_avt(MAX_NUM_HP -1 downto 0);
    -- to pt calc
    o_sf2pt_av           : out sf2pt_avt(MAX_NUM_HEG -1 downto 0);
    -- pipeline
    o_uCM2pl_av            : out pipeline_avt(MAX_NUM_SL -1 downto 0)
  );
end entity top_ucm_hps;

architecture beh of top_ucm_hps is

  signal uCM2hps_av  : ucm2hps_avt(MAX_NUM_HEG -1 downto 0);
  signal uCM2pl_av   : pipeline_avt(MAX_NUM_SL -1 downto 0)
begin

  UCM : entity ucm_lib.ucm
  port map(
    clk                 => clk,
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av          => i_slc_data_av,
    -- pam out
    -- o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
    o_uCM2hps_data_av      => uCM2hps_av,
    -- MDT hit
    o_uCM2pl_av            => o_uCM2pl_av
  );

  HPS_GEN: if hps_i in MAX_NUM_HPS downto 0 generate

  HPS : entity hps_lib.hps
    generic map(
      radius => radius
    )
    port map(
      clk                 => clk,
      Reset_b             => Reset_b,
      glob_en             => glob_en,
      -- configuration & control
      -- i_uCM_pam           => i_uCM_pam,
      -- SLc
      i_uCM2hps_av        => uCM2hps_av(hps_i),
      -- MDT hit
      i_mdt_tar_av        => i_mdt_tar_av,
      -- to pt calc
      o_sf2pt_av          => o_sf2pt_av
    );
  end generated

  MAIN_PL : entity shared_lib.std_pipeline
    generic map(
      num_delays  => UCM_INPUT_PL_LATENCY,
      num_bits    => UCM_PREPRO_LEN
    )
    port map(
      clk         => clk,
      Reset_b     => Reset_b,
      glob_en     => glob_en,
      --
      i_data      => ucm_prepro_av(sl_i),
      o_data      => csw_main_in_av(sl_i)
    );


end beh;