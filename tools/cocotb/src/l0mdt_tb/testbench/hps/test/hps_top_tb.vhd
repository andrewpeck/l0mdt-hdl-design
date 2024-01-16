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

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;


library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;

library fm_lib;
use fm_lib.fm_types.all;


entity hps_top_tb is
  generic(
    -- mdt type
    -- type mdt_type;
    -- parameters
    g_STATION_RADIUS    : integer := 0;  --station
    g_HPS_NUM_MDT_CH     : integer := 6
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic := '1';

    -- SLc
    i_uCM2hps_av        : in ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    -- MDT hit
    -- i_mdt_polmux_av    : in tar2hps_avt(g_HPS_NUM_MDT_CH -1 downto 0);
    i_mdt_tar_av        : in tar2hps_avt(g_HPS_NUM_MDT_CH -1 downto 0);
    -- to pt calc
    o_sf2pt_av          : out sf2ptcalc_avt(c_NUM_THREADS -1 downto 0)
  );
end entity hps_top_tb;

architecture beh of hps_top_tb is
    -- control
    signal ctrl              :  HPS_CTRL_t;
    signal mon               :  HPS_MON_t;
    signal ttc_commands      : l0mdt_ttc_rt;
    signal ctrl_len : natural;
    signal ctrl_v : std_logic_vector(HPS_CTRL_t'w-1 downto 0) := (others => '0');
    signal mon_v  : std_logic_vector(HPS_MON_t'w-1 downto 0);
    -- control

  -- signal mdt_polmux_data_av : hps_mdt_input_avt(g_HPS_NUM_MDT_CH -1 downto 0)
    signal fm_hps_sf_mon_inn_v : std_logic_vector(fm_hps_sf_mon'w-1 downto 0);

begin
   ctrl_len <=  HPS_CTRL_t'w;
   --ctrl_v(len(ctrl)-1 downto len(ctrl)-12 ) <= x"03e"; NUM_THREADS=3
   ctrl_v(HPS_CTRL_t'w-1 downto HPS_CTRL_t'w-12 ) <= x"01e"; --NUM_THREADS=3

  -- IN_GEN : for hp_i in g_HPS_NUM_MDT_CH downto 0 generate
  --   mdt_polmux_data_av(hp_i).polmux <= i_mdt_polmux_av(hp_i);
  --   mdt_polmux_data_av(hp_i).tar <= i_mdt_tar_av(hp_i);
  -- end generate;

  HPS : entity hps_lib.hps
    generic map(
      -- mdt type
      -- mdt_type_av          => mdt_polmux_data_avt(g_HPS_NUM_MDT_CH -1 downto 0),
      -- g_SIM_nBUILD         => '1',
      -- parameters
      g_STATION_RADIUS    => g_STATION_RADIUS,
      g_HPS_NUM_MDT_CH     => g_HPS_NUM_MDT_CH
    )
    port map(
      clk                 => clk,
      rst                 => rst,
      glob_en             => glob_en,

      ctrl_v => ctrl_v,
      mon_v => mon_v,
      fm_hps_mon_v => fm_hps_sf_mon_inn_v,
      
      -- SLc
      i_uCM2hps_av        => i_uCM2hps_av,
      -- MDT hit
      i_mdt_tar_av        => i_mdt_tar_av,
      -- to pt calc
      o_sf2pt_av          => o_sf2pt_av
    );


end beh;
