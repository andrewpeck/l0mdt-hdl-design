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
use ieee.numeric_std_unsigned.all;
use ieee.std_logic_misc.all;

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
use heg_lib.heg_custom_pkg.all;

entity heg_ctrl_roi is
  generic(
    g_STATION_RADIUS    : integer := 0;  --station
    g_HPS_NUM_MDT_CH    : integer := 6
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_uCM_data_v        : in ucm2hps_rvt;
    --
    o_SLC_Window_v      : out hp_heg2hp_window_avt(get_num_layers(g_STATION_RADIUS) -1 downto 0);
    o_Roi_win_valid      : out std_logic
    
  );
end entity heg_ctrl_roi;

architecture beh of heg_ctrl_roi is

  signal uCM_data_r : ucm2hps_rt;
  -- signal slc_b_data_r  : ucm_csf_barrel_rt;
  
  signal roi_center : heg_roi_center_at(get_num_layers(g_STATION_RADIUS) -1 downto 0);
  signal roi_edges : hp_window_limits_at(get_num_layers(g_STATION_RADIUS) -1 downto 0);
  signal dv_z, dv_mbar : std_logic;
  -- signal slc_e_data : ucm_csf_endcap_rt;
  signal SLC_Window_r : hp_heg2hp_window_at(get_num_layers(g_STATION_RADIUS) -1 downto 0);
  
begin

  BARREL : if c_ST_nBARREL_ENDCAP = '0' generate

    uCM_data_r <= structify(i_uCM_data_v);
    -- slc_b_data_r <= structify(uCM_data_r.specific);
    
    ROI_Z : entity heg_lib.b_z2roi
    generic map(
      g_STATION_RADIUS => g_STATION_RADIUS
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      glob_en             => glob_en,
      --
      i_z                 => uCM_data_r.vec_pos,
      i_dv                => uCM_data_r.data_valid,
      --
      o_roi_center        => roi_center,
      o_dv                => dv_Z
    );

    ROI_MBAR : entity heg_lib.b_slope2roi
    generic map(
      g_STATION_RADIUS => g_STATION_RADIUS
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      glob_en             => glob_en,
      --
      i_ang               => uCM_data_r.vec_ang,
      i_dv                => uCM_data_r.data_valid,
      --
      o_roi_edges         => roi_edges,
      o_dv                => dv_mbar
    );

    o_Roi_win_valid <= dv_z and dv_mbar;

    WIN_GEN : for l_i in get_num_layers(g_STATION_RADIUS)-1 downto 0 generate
      SLC_Window_r(l_i).lo <= unsigned(signed(roi_center(l_i)) + roi_edges(l_i).lo);
      SLC_Window_r(l_i).hi <= unsigned(signed(roi_center(l_i)) + roi_edges(l_i).hi);

      o_SLC_Window_v <= vectorify(SLC_Window_r);
    end generate;



  end generate;
  

  
end architecture beh;


