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

library ucm_lib;
use ucm_lib.ucm_pkg.all;
library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;


entity top_ucm_hps is
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc
    i_slc_data_av          : in slc_rx_data_avt(MAX_NUM_SL -1 downto 0);
    -- MDT hit
    i_mdt_tar_av      : in tar2hps_aavt(MAX_NUM_HPS -1 downto 0);
    -- to pt calc
    o_sf2pt_av           : out sf2pt_aavt(MAX_NUM_HPS -1 downto 0);
    -- pipeline
    o_uCM2pl_vav            : out pipeline_vavt
  );
end entity top_ucm_hps;

architecture beh of top_ucm_hps is

  signal uCM2hps_av  : ucm2hps_aavt(MAX_NUM_HPS -1 downto 0);
  signal uCM2pl_vav   : pipeline_vavt;

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
    o_uCM2pl_vav            => uCM2pl_vav
  );

  HPS_GEN: for hps_i in MAX_NUM_HPS - 1 downto 0 generate
    HPS : entity hps_lib.hps
      generic map(
        radius => hps_i
      )
      port map(
        clk                 => clk,
        Reset_b             => Reset_b,
        glob_en             => glob_en,
        -- configuration, control & Monitoring
        -- i_uCM_pam           => i_uCM_pam,
        -- SLc
        i_uCM2hps_av        => uCM2hps_av(hps_i),
        -- MDT hit
        i_mdt_tar_av        => i_mdt_tar_av(hps_i),
        -- to pt calc
        o_sf2pt_av          => o_sf2pt_av(hps_i)
      );
  end generate;

  MAIN_PL : entity shared_lib.std_pipeline
    generic map(
      num_delays  => MAIN_PIPELINE_CLOCKS,
      num_bits    => PIPELINE_AV_LEN
    )
    port map(
      clk         => clk,
      Reset_b     => Reset_b,
      glob_en     => glob_en,
      --
      i_data      => uCM2pl_vav,
      o_data      => o_uCM2pl_vav
    );


end beh;