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



entity ucm_hps is
  port (
    clk                 : in std_logic;
    rst            : in std_logic;
    glob_en             : in std_logic;
    -- configuration, control & Monitoring
    -- SLc
    i_slc_data_mainA_av     : in slc_rx_bus_avt(2 downto 0);
    i_slc_data_mainB_av     : in slc_rx_bus_avt(2 downto 0);
    i_slc_data_neighborA_v : in slc_rx_rvt;
    i_slc_data_neighborB_v : in slc_rx_rvt;
    -- MDT hit
    i_mdt_tar_inn_av    : in tar2hps_bus_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_mdt_tar_mid_av    : in tar2hps_bus_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_mdt_tar_out_av    : in tar2hps_bus_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_mdt_tar_ext_av    : in tar2hps_bus_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- to pt calc
    o_sf2pt_inn_av      : out sf2pt_bus_avt(c_NUM_THREADS -1 downto 0);
    o_sf2pt_mid_av      : out sf2pt_bus_avt(c_NUM_THREADS -1 downto 0);
    o_sf2pt_out_av      : out sf2pt_bus_avt(c_NUM_THREADS -1 downto 0);
    o_sf2pt_ext_av      : out sf2pt_bus_avt(c_NUM_THREADS -1 downto 0);
    -- pipeline
    o_uCM2pl_av         : out pipelines_avt(c_MAX_NUM_SL -1 downto 0)
  );
end entity ucm_hps;

architecture beh of ucm_hps is

  type ucm2hps_aavt is array (MAX_NUM_HPS -1 downto 0) of ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  signal uCM2hps_aav  : ucm2hps_aavt;
  -- signal uCM2pl_av   : pipelines_avt;

begin

  UCM : entity ucm_lib.ucm
  port map(
    clk                   => clk,
    rst              => rst,
    glob_en               => glob_en,
    -- configuration, control & Monitoring
    -- SLc in
    i_slc_data_mainA_av     => i_slc_data_mainA_av,
    i_slc_data_mainB_av     => i_slc_data_mainB_av,
    i_slc_data_neighborA_v => i_slc_data_neighborA_v,
    i_slc_data_neighborB_v => i_slc_data_neighborB_v,
    -- pam out
    o_uCM2hps_inn_av      => uCM2hps_aav(0),
    o_uCM2hps_mid_av      => uCM2hps_aav(1),
    o_uCM2hps_out_av      => uCM2hps_aav(2),
    o_uCM2hps_ext_av      => uCM2hps_aav(3),
    -- MDT hit
    o_uCM2pl_av           => o_uCM2pl_av
  );


  HPS_INN_GEN: if c_HPS_ENABLE_ST_INN generate
    HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS             => 0,
        g_HPS_NUM_OF_HP       => c_HPS_NUM_MDT_CH_INN
      )
      port map(
        clk                 => clk,
        rst            => rst,
        glob_en             => glob_en,
        -- configuration, control & Monitoring
        -- SLc
        i_uCM2hps_av        => uCM2hps_aav(0),
        -- MDT hit
        i_mdt_tar_av        => i_mdt_tar_inn_av,
        -- to pt calc
        o_sf2pt_av          => o_sf2pt_inn_av
      );
  end generate;

  HPS_MID_GEN: if c_HPS_ENABLE_ST_MID generate
    HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS             => 1,
        g_HPS_NUM_OF_HP       => c_HPS_NUM_MDT_CH_MID
      )
      port map(
        clk                 => clk,
        rst            => rst,
        glob_en             => glob_en,
        -- configuration, control & Monitoring
        -- SLc
        i_uCM2hps_av        => uCM2hps_aav(1),
        -- MDT hit
        i_mdt_tar_av        => i_mdt_tar_mid_av,
        -- to pt calc
        o_sf2pt_av          => o_sf2pt_mid_av
      );
  end generate;

  HPS_OUT_GEN: if c_HPS_ENABLE_ST_OUT generate
    HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS             => 2,
        g_HPS_NUM_OF_HP       => c_HPS_NUM_MDT_CH_OUT
      )
      port map(
        clk                 => clk,
        rst            => rst,
        glob_en             => glob_en,
        -- configuration, control & Monitoring
        -- SLc
        i_uCM2hps_av        => uCM2hps_aav(2),
        -- MDT hit
        i_mdt_tar_av        => i_mdt_tar_out_av,
        -- to pt calc
        o_sf2pt_av          => o_sf2pt_out_av
      );
  end generate;

  HPS_EXT_GEN: if c_HPS_ENABLE_ST_EXT generate
    HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS             => 3,
        g_HPS_NUM_OF_HP       => c_HPS_NUM_MDT_CH_EXT
      )
      port map(
        clk                 => clk,
        rst            => rst,
        glob_en             => glob_en,
        -- configuration, control & Monitoring
        -- SLc
        i_uCM2hps_av        => uCM2hps_aav(3),
        -- MDT hit
        i_mdt_tar_av        => i_mdt_tar_ext_av,
        -- to pt calc
        o_sf2pt_av          => o_sf2pt_ext_av
      );
  end generate;




end beh;
