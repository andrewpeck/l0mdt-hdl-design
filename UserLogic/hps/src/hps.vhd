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
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
-- use ctrl_lib.ctrl_constants_pkg.all;
use ctrl_lib.H2S_CTRL.all;

entity hps is
  generic(
    g_STATION_RADIUS : integer := 0;    --station
    g_HPS_NUM_MDT_CH : integer := 6
    );
  port (
    clk     : in std_logic;
    rst     : in std_logic;
    glob_en : in std_logic;

    -- control
    ctrl_v  : in std_logic_vector;-- H2S_HPS_CTRL_t;
    mon_v   : out std_logic_vector;--H2S_HPS_MON_t;

    -- SLc
    i_uCM2hps_av : in  ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
    -- MDT hit
    i_mdt_tar_av : in  tar2hps_bus_avt(g_HPS_NUM_MDT_CH -1 downto 0);
    -- to pt calc
    o_sf2pt_av   : out sf2pt_bus_avt(c_NUM_THREADS -1 downto 0)
    );
end entity hps;

architecture beh of hps is

  signal ctrl_r : H2S_HPS_CTRL_t;
  signal mon_r : H2S_HPS_MON_t;

  signal int_rst : std_logic;
  signal int_ena : std_logic;

  signal mdt_full_data_av : heg_pc2heg_avt(g_HPS_NUM_MDT_CH-1 downto 0);

  -- signal int_uCM_data : ucm2heg_slc_avt(c_NUM_THREADS -1 downto 0);
  -- signal control_enable(c_NUM_THREADS -1 downto 0);

  signal heg2sf_ctrl_av : hps_ctrl2sf_avt(c_NUM_THREADS -1 downto 0);
  signal heg2sfslc_av   : heg2sfslc_bus_avt(c_NUM_THREADS -1 downto 0);
  signal heg2sfhit_av   : heg2sfhit_bus_avt(c_NUM_THREADS -1 downto 0);

begin

  ctrl_r <= structify(ctrl_v,ctrl_r);
  mon_v <= vectorify(mon_r,mon_v);

  SUPER : entity hps_lib.hps_supervisor
  generic map(
    g_STATION_RADIUS => g_STATION_RADIUS
  )
  port map(
    clk         => clk,
    rst         => rst,
    glob_en     => glob_en,
    --
    i_actions   => ctrl_r.actions,
    i_configs   => ctrl_r.configs,
    o_status    => mon_r.status,
    --
    o_local_rst => int_rst,
    o_local_en  => int_ena

  );

  -- pc_gen : for hp_i in g_HPS_NUM_MDT_CH -1 downto 0 generate
  --   pc_en : if c_HP_SECTOR_STATION(g_STATION_RADIUS)(hp_i) = '1' generate
      PC : entity hps_lib.hps_pc_top
        generic map(
          -- mdt type
          -- mdt_type            => mdt_polmux_data_rvt,
          -- g_SIM_nBUILD        => g_SIM_nBUILD,
          -- parameters
          -- g_CHAMBER         => hp_i,
          g_HPS_NUM_MDT_CH => g_HPS_NUM_MDT_CH,
          g_STATION_RADIUS  => g_STATION_RADIUS
        )
        port map(
          clk         => clk,
          rst         => int_rst,
          ena         => int_ena,
          --
          i_ctrl_tc   => ctrl_r.MDT_TC.MDT_TC,--(hp_i),
          o_mon_tc    => mon_r.MDT_TC.MDT_TC,--(hp_i),
          i_ctrl_t0   => ctrl_r.MDT_T0.MDT_T0,--(hp_i),
          o_mon_t0    => mon_r.MDT_T0.MDT_T0,--(hp_i),
          --
          i_mdt_tar_v       => i_mdt_tar_av,--(hp_i),
          o_mdt_full_data_v => mdt_full_data_av--(hp_i)
        );
  --   end generate;
  -- end generate;

  heg_gen : for heg_i in c_NUM_THREADS -1 downto 0 generate
    HEG : entity heg_lib.heg
      generic map(
        g_STATION_RADIUS => g_STATION_RADIUS,
        g_HPS_NUM_MDT_CH => g_HPS_NUM_MDT_CH
        )
      port map(
        clk                => clk,
        rst                => int_rst, 
        glob_en            => int_ena,
        --        
        ctrl               => ctrl_r.heg.heg(heg_i),
        mon                => mon_r.heg.heg(heg_i),
        --
        i_uCM_data_v       => i_uCM2hps_av(heg_i),
        -- MDT hit
        i_mdt_full_data_av => mdt_full_data_av,
        -- to Segment finder
        o_sf_control_v     => heg2sf_ctrl_av(heg_i),
        o_sf_slc_data_v    => heg2sfslc_av(heg_i),
        o_sf_mdt_data_v    => heg2sfhit_av(heg_i)
        );

    SF : entity hps_lib.hps_sf_wrap
      generic map(
        g_STATION_RADIUS => g_STATION_RADIUS
        )
      port map(
        clk           => clk,
        rst           => int_rst,
        glob_en       => int_ena,

        lsf_ctrl => ctrl_r.lsf.lsf(heg_i),
        lsf_mon  => mon_r.lsf.lsf(heg_i),

        csf_ctrl => ctrl_r.csf.csf(heg_i),
        csf_mon  => mon_r.csf.csf(heg_i),

        -- to Segment finder
        i_control_v   => heg2sf_ctrl_av(heg_i),
        i_slc_data_v  => heg2sfslc_av(heg_i),
        i_mdt_data_v  => heg2sfhit_av(heg_i),
        --
        o_sf_data_v   => o_sf2pt_av(heg_i)
        );

  end generate;


end beh;
