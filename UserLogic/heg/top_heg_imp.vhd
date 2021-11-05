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

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;

entity top_heg is
  generic(
    g_STATION_RADIUS    : integer := 0;  --station
    g_HPS_NUM_MDT_CH     : integer := 6 
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic := '1';
    -- configuration
    ctrl_b              : in std_logic;
    mon_b               : out std_logic;
    -- SLc
    i_uCM_data_b        : in ucm2hps_rvt;
    -- MDT hit
    i_mdt_full_data_ab  : in heg_pc2heg_avt(g_HPS_NUM_MDT_CH -1 downto 0);
    -- to Segment finder
    o_sf_control_b      : out heg_ctrl2sf_rvt;
    o_sf_slc_data_b     : out heg2sfslc_rvt;
    o_sf_mdt_data_b     : out heg2sfhit_rvt
  );
end entity top_heg;

architecture beh of top_heg is


  signal ctrl_r             : H2S_HPS_HEG_HEG_CTRL_t;
  signal mon_r              : H2S_HPS_HEG_HEG_MON_t;
  constant  c_CTRL_LEN      : integer := len(ctrl_r);
  constant c_MON_LEN        : integer := len(mon_r);
  signal ctrl_v             : std_logic_vector(c_CTRL_LEN -1 downto 0);
  signal mon_v              : std_logic_vector(c_MON_LEN -1 downto 0);

  signal i_uCM_data_rv        : ucm2hps_rvt;
  signal i_uCM_data_v         : std_logic_vector(i_uCM_data_rv'range);
  signal i_mdt_full_data_av   : heg_pc2heg_avt(g_HPS_NUM_MDT_CH -1 downto 0);
  signal o_sf_control_rv      : heg_ctrl2sf_rvt;
  -- signal o_sf_control_v       : std_logic_vector(o_sf_control_rv'range);
  signal o_sf_slc_data_v      : heg2sfslc_rvt;
  signal o_sf_mdt_data_v      : heg2sfhit_rvt;

begin

  ctrl : entity shared_lib.vhdl_utils_deserializer generic map (c_CTRL_LEN) port map(clk,rst,ctrl_b,ctrl_v);
  mon_b <= xor_reduce(mon_v);
  --------------------------------------------------------------
  des0 : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => slc_win_len)port map(clk => clk,rst  => rst,i_data => i_uCM_data_b,o_data => i_uCM_data_v);
  i_uCM_data_v <= i_uCM_data_v;
  for1: for i_h in g_HPS_NUM_MDT_CH -1 downto 0 generate
    des1 : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => slc_win_len)port map(clk => clk,rst  => rst,i_data => i_mdt_full_data_ab(i_h),o_data => i_mdt_full_data_av(i_h));
  end generate generate_label;
  
  -- i_SLC_Window_ar <= structify(i_SLC_Window_v);
  --------------------------------------------------------------
  o_sf_control_v <= xor_reduce(o_sf_control_rv);
  o_sf_slc_data_v <= xor_reduce(o_sf_slc_data_v);
  o_sf_mdt_data_v <= xor_reduce(o_sf_mdt_data_v);
  --------------------------------------------------------------

  HEG : entity heg_lib.heg
  generic map(
    g_STATION_RADIUS    => g_STATION_RADIUS,
    g_HPS_NUM_MDT_CH    => g_HPS_NUM_MDT_CH
  )
  port map(
    clk                 => CLK,
    rst                 => rst,
    glob_en             => glob_en,
    -- configuration
    ctrl_v             => ctrl_v,
    mon_v              => mon_v,
    -- SLc
    i_uCM_data_v          => i_uCM_data_v,
    -- MDT hit
    i_mdt_full_data_av     => i_mdt_full_data_av,
    -- to Segment finder
    o_sf_control_v        => o_sf_control_rv,
    o_sf_slc_data_v       => o_sf_slc_data_v,
    o_sf_mdt_data_v       => o_sf_mdt_data_v
  );


end beh;


