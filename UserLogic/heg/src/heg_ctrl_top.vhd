--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

entity heg_ctrl_top is
  generic(
    g_STATION_RADIUS    : integer := 0;  --station
    g_HPS_NUM_MDT_CH    : integer := 6
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    ctrl_v            : in std_logic_vector;  
    mon_v             : out std_logic_vector; 
    -- configuration
    -- SLc in
    i_uCM_data_v        : in ucm2hps_rvt;
    -- SLc out
    o_uCM2sf_data_v     : out heg2sfslc_rvt;
    o_uCM2hp_data_v     : out hp_heg2hp_slc_rvt;
    o_SLC_Window_v      : out hp_heg2hp_window_avt(get_num_layers(g_STATION_RADIUS) -1 downto 0);
    o_SLC_Win_dv        : out std_logic;

    o_sf_control_v      : out heg_ctrl2sf_rvt;
    o_hp_control_r      : out heg_ctrl2hp_bus_at(g_HPS_NUM_MDT_CH -1 downto 0)
  );
end entity heg_ctrl_top;

architecture beh of heg_ctrl_top is

  signal ctrl_r           : H2S_HPS_HEG_HEG_CTRL_CTRL_t;
  signal mon_r            : H2S_HPS_HEG_HEG_CTRL_MON_t;
  signal ctrl_roi_tc_r    : H2S_HPS_HEG_HEG_CTRL_ROI_TC_CTRL_t;
  signal  mon_roi_tc_r    : H2S_HPS_HEG_HEG_CTRL_ROI_TC_MON_t;
  signal ctrl_roi_tc_v    : std_logic_vector(len(ctrl_roi_tc_r)-1 downto 0);
  signal  mon_roi_tc_v    : std_logic_vector(len(mon_roi_tc_r)-1 downto 0);

  -- component ctrl_signals is
  --   generic(
  --     g_STATION_RADIUS    : integer := 0;  --station
  --     g_HPS_NUM_MDT_CH    : integer := 6
  --   );
  --   port (
  --     clk                 : in std_logic;
  --     rst                 : in std_logic;
  --     glob_en             : in std_logic;
  --     --
  --     i_uCM_data_r        : in ucm2hps_rt;
  --     --
  --     i_Roi_win_origin    : in unsigned(MDT_TUBE_LEN-1 downto 0);
  --     i_Roi_win_valid     : in std_logic;
  --     --
  --     o_hp_control_r      : out heg_ctrl2hp_bus_at(g_HPS_NUM_MDT_CH -1 downto 0);
  --     o_sf_control_r      : out heg_ctrl2sf_rt;
  --     --
  --     o_uCM2hp_data_v     : out hp_heg2hp_slc_rvt;
  --     o_uCM2sf_data_v     : out heg2sfslc_rvt
  --   );
  -- end component ctrl_signals;

  signal SLC_Window_v       : hp_heg2hp_window_avt(get_num_layers(g_STATION_RADIUS) -1 downto 0);
  signal SLC_Window_r       : hp_heg2hp_window_at(get_num_layers(g_STATION_RADIUS) -1 downto 0);
  signal win_row_0          : hp_win_tubes_rt; 

  signal uCM_data_r         : ucm2hps_rt;
  signal Roi_win_valid      : std_logic;
  -- signal o_uCM2hp_data_r    : hp_heg2hp_slc_rt;
  signal o_sf_control_r     : heg_ctrl2sf_rt;
  -- signal o_hp_control_r     : heg_ctrl2sf_rt;

  signal roi_global_x        : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  signal roi_global_z        : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  signal roi_dv              : std_logic;

begin

  ctrl_r <= structify(ctrl_v,ctrl_r);
  mon_v <= vectorify(mon_r,mon_v);
  
  ctrl_roi_tc_r <= ctrl_r.ROI_TC;
  mon_r.ROI_TC <= mon_roi_tc_r;
  
  mon_roi_tc_r <= structify(mon_roi_tc_v,mon_roi_tc_r);
  ctrl_roi_tc_v <= vectorify(ctrl_roi_tc_r,ctrl_roi_tc_v);

  o_SLC_Window_v <= SLC_Window_v;
  win_row_0 <= structify(SLC_Window_v(0));

  o_sf_control_v <= vectorify(o_sf_control_r);
  -- o_hp_control_v <= vectorify(o_hp_control_r);

  HEG_CTRL_ROI : entity heg_lib.heg_ctrl_roi
  generic map(
    g_STATION_RADIUS => g_STATION_RADIUS,
    g_HPS_NUM_MDT_CH => g_HPS_NUM_MDT_CH
  )
  port map(
    clk                 => clk,
    rst                 => rst,
    glob_en             => glob_en,
    -- configuration
    -- SLc in
    i_uCM_data_v          => i_uCM_data_v,
    -- SLc out
    o_SLC_Window_v        => SLC_Window_v,
    o_Roi_win_valid       => Roi_win_valid
  );

  SLC_Window_r <= structify(SLC_Window_v);

  HEG_CTRL_ROI_ORG : entity heg_lib.heg_ctrl_roi_tc
  generic map(
    g_STATION_RADIUS => g_STATION_RADIUS
  )
  port map(
    clk                 => clk,
    rst                 => rst,
    ena                 => glob_en,
    --
    ctrl_v              => ctrl_roi_tc_v,
    mon_v               =>  mon_roi_tc_v,
    --
    -- i_layer             => ,
    i_tube              => SLC_Window_r(0).lo,
    i_dv                => Roi_win_valid,
    --
    o_global_x          => roi_global_x,
    o_global_z          => roi_global_z,
    o_dv                => roi_dv
  );

  HEG_SIGNALS : entity heg_lib.heg_ctrl_sig
  generic map(
    g_STATION_RADIUS => g_STATION_RADIUS,
    g_HPS_NUM_MDT_CH => g_HPS_NUM_MDT_CH
  )
  port map(
    clk                 => clk,
    rst                 => rst,
    glob_en             => glob_en,
    -- SLc in
    i_uCM_data_r        => uCM_data_r,
    --
    i_Roi_win_origin    => win_row_0.lo,
    i_Roi_win_valid     => Roi_win_valid,
    --
    i_roi_global_x      => roi_global_x,
    i_roi_global_z      => roi_global_z,
    i_roi_global_dv     => roi_dv,
    -- SLc out
    o_hp_control_r      => o_hp_control_r,
    o_sf_control_r      => o_sf_control_r,
    --
    o_uCM2hp_data_v     => o_uCM2hp_data_v,
    o_uCM2sf_data_v     => o_uCM2sf_data_v
  );

  -- o_uCM2sf_data_v <= int_uCM_data;
  -- o_uCM2hp_data_v.barrel.z <= int_uCM_data.barrel.z;

  uCM_data_r <= structify(i_uCM_data_v);
  -- o_uCM2hp_data_v <= vectorify(o_uCM2hp_data_r);

end beh;
