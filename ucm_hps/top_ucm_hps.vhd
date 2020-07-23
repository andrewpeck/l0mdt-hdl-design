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
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library ucm_hps_lib;
-- use ucm_hps_lib.ucm_hps.all;
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
    rst            : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc
    i_slc_data_mainA_av     : in slc_rx_data_avt(2 downto 0);
    i_slc_data_mainB_av     : in slc_rx_data_avt(2 downto 0);
    i_slc_data_neighborA_v : in slc_rx_data_rvt;
    i_slc_data_neighborB_v : in slc_rx_data_rvt;
    -- MDT hit
    i_mdt_tar_inn_av    : in tar2hps_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_mdt_tar_mid_av    : in tar2hps_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_mdt_tar_out_av    : in tar2hps_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_mdt_tar_ext_av    : in tar2hps_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- to pt calc
    o_sf2pt_inn_av      : out sf2pt_avt(c_NUM_THREADS -1 downto 0);
    o_sf2pt_mid_av      : out sf2pt_avt(c_NUM_THREADS -1 downto 0);
    o_sf2pt_out_av      : out sf2pt_avt(c_NUM_THREADS -1 downto 0);
    o_sf2pt_ext_av      : out sf2pt_avt(c_NUM_THREADS -1 downto 0);
    -- pipeline
    o_uCM2pl_av         : out pipelines_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity top_ucm_hps;

architecture beh of top_ucm_hps is

begin

  TOP : entity ucm_hps_lib.ucm_hps
  port map(
    clk                 => clk,
    rst            => rst,
    glob_en             => glob_en,
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_mainA_av     => i_slc_data_mainA_av,
    i_slc_data_mainB_av     => i_slc_data_mainB_av,
    i_slc_data_neighborA_v => i_slc_data_neighborA_v,
    i_slc_data_neighborB_v => i_slc_data_neighborB_v,
    -- MDT hit
    i_mdt_tar_inn_av    => i_mdt_tar_inn_av,
    i_mdt_tar_mid_av    => i_mdt_tar_mid_av,
    i_mdt_tar_out_av    => i_mdt_tar_out_av,
    i_mdt_tar_ext_av    => i_mdt_tar_ext_av,
    -- to pt calc
    o_sf2pt_inn_av      => o_sf2pt_inn_av,
    o_sf2pt_mid_av      => o_sf2pt_mid_av,
    o_sf2pt_out_av      => o_sf2pt_out_av,
    o_sf2pt_ext_av      => o_sf2pt_ext_av,
    -- MDT hit
    o_uCM2pl_av        => o_uCM2pl_av
  );


end beh;
