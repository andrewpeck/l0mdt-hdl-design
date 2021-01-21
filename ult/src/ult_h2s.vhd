--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Muon Candidate Manager
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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;

entity hits_to_segments is
  port (
    -- clock and control
    clock_and_control : in  l0mdt_control_rt;
    ttc_commands      : in  l0mdt_ttc_rt;
    ctrl              : in  H2S_CTRL_t;
    mon               : out H2S_MON_t;

    -- TDC Hits from Polmux
    i_inn_tar_hits  : in tar2hps_bus_avt (c_HPS_MAX_HP_INN -1 downto 0);
    i_mid_tar_hits  : in tar2hps_bus_avt (c_HPS_MAX_HP_MID -1 downto 0);
    i_out_tar_hits  : in tar2hps_bus_avt (c_HPS_MAX_HP_OUT -1 downto 0);
    i_ext_tar_hits  : in tar2hps_bus_avt (c_HPS_MAX_HP_EXT -1 downto 0);
    -- Sector Logic Candidates from uCM
    i_inn_slc       : in ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
    i_mid_slc       : in ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
    i_out_slc       : in ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
    i_ext_slc       : in ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
    -- Segments Out
    o_inn_segments  : out sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
    o_mid_segments  : out sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
    o_out_segments  : out sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
    o_ext_segments  : out sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
    -- Segments Out to Neighbor
    o_plus_neighbor_segments  : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    o_minus_neighbor_segments : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0)
    );

end entity hits_to_segments;

architecture beh of hits_to_segments is
  signal glob_en : std_logic;
begin

  glob_en <= '1';

  H2S_GEN : if c_H2S_ENABLED generate

    HPS_INN : if c_HPS_ENABLE_ST_INN = '1' generate
      HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS    => 0,
        g_HPS_NUM_MDT_CH     => c_HPS_MAX_HP_INN
      )
      port map(
        clk                 => clock_and_control.clk,
        rst                 => clock_and_control.rst,
        glob_en             => glob_en,

        ctrl => ctrl.hps(0),
        mon => mon.hps(0),

        -- configuration & control
        -- i_uCM_pam           => i_uCM_pam,
        -- SLc
        i_uCM2hps_av        => i_inn_slc,
        -- MDT hit
        i_mdt_tar_av        => i_inn_tar_hits,
        -- to pt calc
        o_sf2pt_av          => o_inn_segments
      );
    end generate;

    HPS_MID : if c_HPS_ENABLE_ST_MID = '1' generate
      HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS    => 1,
        g_HPS_NUM_MDT_CH     => c_HPS_MAX_HP_MID
      )
      port map(
        clk                 => clock_and_control.clk,
        rst                 => clock_and_control.rst,
        glob_en             => glob_en,

        ctrl => ctrl.hps(1),
        mon => mon.hps(1),

        -- configuration & control
        -- i_uCM_pam           => i_uCM_pam,
        -- SLc
        i_uCM2hps_av        => i_mid_slc,
        -- MDT hit
        i_mdt_tar_av        => i_mid_tar_hits,
        -- to pt calc
        o_sf2pt_av          => o_mid_segments
      );
    end generate;

    HPS_OUT : if c_HPS_ENABLE_ST_OUT = '1' generate
      HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS    => 2,
        g_HPS_NUM_MDT_CH     => c_HPS_MAX_HP_OUT
      )
      port map(
        clk                 => clock_and_control.clk,
        rst                 => clock_and_control.rst,
        glob_en             => glob_en,

        ctrl => ctrl.hps(2),
        mon => mon.hps(2),

        -- configuration & control
        -- i_uCM_pam           => i_uCM_pam,
        -- SLc
        i_uCM2hps_av        => i_out_slc,
        -- MDT hit
        i_mdt_tar_av        => i_out_tar_hits,
        -- to pt calc
        o_sf2pt_av          => o_out_segments
      );
    end generate;

    HPS_EXT : if c_HPS_ENABLE_ST_EXT = '1' generate
      HPS : entity hps_lib.hps
      generic map(
        g_STATION_RADIUS    => 3,
        g_HPS_NUM_MDT_CH     => c_HPS_MAX_HP_EXT
      )
      port map(
        clk                 => clock_and_control.clk,
        rst                 => clock_and_control.rst,
        glob_en             => glob_en,

        ctrl => ctrl.hps(3),
        mon => mon.hps(3),

        -- configuration & control
        -- i_uCM_pam           => i_uCM_pam,
        -- SLc
        i_uCM2hps_av        => i_ext_slc,
        -- MDT hit
        i_mdt_tar_av        => i_ext_tar_hits,
        -- to pt calc
        o_sf2pt_av          => o_ext_segments
      );
    end generate;

    DIS_HPS_EXT : if c_HPS_ENABLE_ST_EXT = '0' generate
      o_ext_segments <= (others => ( others => '0'));
    end generate;

  end generate;

  
  
end architecture beh;

