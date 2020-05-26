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
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_pkg.all;
library ucm_lib;
use ucm_lib.ucm_pkg.all;


entity top_ucm is
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av          : in slc_rx_data_avt(MAX_NUM_SL -1 downto 0);
    -- to hps
    -- o_uCM2hps_pam_ar       : out ucm2heg_pam_art(NUM_THREADS -1 downto 0);
    o_uCM2hps_inn_1b      : out std_logic_vector(NUM_THREADS -1 downto 0);
    o_uCM2hps_mid_1b      : out std_logic_vector(NUM_THREADS -1 downto 0);
    o_uCM2hps_out_1b      : out std_logic_vector(NUM_THREADS -1 downto 0);
    o_uCM2hps_ext_1b      : out std_logic_vector(NUM_THREADS -1 downto 0);
    -- pipeline
    o_uCM2pl_1b           : out std_logic_vector(MAX_NUM_SL -1 downto 0)
  );
end entity top_ucm;

architecture beh of top_ucm is

  signal o_uCM2hps_inn_av      : ucm2hps_avt(NUM_THREADS -1 downto 0);
  signal o_uCM2hps_mid_av      : ucm2hps_avt(NUM_THREADS -1 downto 0);
  signal o_uCM2hps_out_av      : ucm2hps_avt(NUM_THREADS -1 downto 0);
  signal o_uCM2hps_ext_av      : ucm2hps_avt(NUM_THREADS -1 downto 0);
  -- pipeline
  signal o_uCM2pl_av           : pipelines_avt(MAX_NUM_SL -1 downto 0);

begin

  UCM : entity ucm_lib.ucm
  port map(
    clk                 => clk,
    Reset_b             => Reset_b,
    glob_en             => glob_en,
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_av         => i_slc_data_av,
    -- pam out
    -- o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
    o_uCM2hps_inn_av      => o_uCM2hps_inn_av,
    o_uCM2hps_mid_av      => o_uCM2hps_mid_av,
    o_uCM2hps_out_av      => o_uCM2hps_out_av,
    o_uCM2hps_ext_av      => o_uCM2hps_ext_av,
    -- MDT hit
    o_uCM2pl_av           => o_uCM2pl_av
  );

  TH : for th_i in NUM_THREADS -1 downto 0 generate
    o_uCM2hps_inn_1b(th_i) <= or_reduce(o_uCM2hps_inn_av(th_i));
    o_uCM2hps_mid_1b(th_i) <= or_reduce(o_uCM2hps_mid_av(th_i));
    o_uCM2hps_out_1b(th_i) <= or_reduce(o_uCM2hps_out_av(th_i));
    o_uCM2hps_ext_1b(th_i) <= or_reduce(o_uCM2hps_ext_av(th_i));
  end generate;

  PL : for pl_i in MAX_NUM_SL -1 downto 0 generate
    o_uCM2pl_1b(pl_i) <= or_reduce(o_uCM2pl_av(pl_i));
  end generate;




end beh;