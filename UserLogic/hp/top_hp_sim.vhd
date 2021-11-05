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

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;


entity top_hp_tb is
  generic (
    PRJ_INFO            : string  := "BA3";
    g_STATION_RADIUS    : integer := 0;
    IN_SLC_FILE         : string  := "slc_A3_Barrel.csv";
    IN_HIT_FILE         : string  := "csm_A3_Barrel.csv";
    
    -- OUT_HEG_BM_SLC_FILE : string  := "hps_heg_bm_slc_A3_Barrel_yt_v04.csv";
    -- OUT_HEG_BM_HIT_FILE : string  := "hps_heg_bm_hit_A3_Barrel_yt_v04.csv";
    -- OUT_PTIN_SF_FILE    : string  := "pt_in_sf_A3_Barrel_yt_v04.csv";
    -- OUT_PTIN_MPL_FILE   : string  := "pt_in_mpl_A3_Barrel_yt_v04.csv";
    -- OUT_MTCIN_PT_FILE   : string  := "mtc_in_pt_A3_Barrel_yt_v04.csv";
    -- OUT_MTCIN_MPL_FILE  : string  := "mtc_in_mpl_A3_Barrel_yt_v04.csv";
    DUMMY               : boolean := false
    );
end entity top_hp_tb;

architecture beh of top_hp_tb is

  signal clk              : std_logic;
  signal rst              : std_logic;
  signal glob_en          : std_logic;

  constant c_CTRL_LEN     : integer := 1711;
  constant c_MON_LEN      : integer := 1042;
  signal ctrl_r           : H2S_HPS_HEG_HEG_HP_HP_CTRL_t;
  signal mon_r            : H2S_HPS_HEG_HEG_HP_HP_MON_t;
  signal ctrl_v           : std_logic_vector(len(ctrl_v) -1 downto 0);
  signal mon_v            : std_logic_vector(len(mon_v) -1 downto 0);

  signal local_rst        : std_logic;
  signal local_en         : std_logic;
  signal i_SLC_Window_av  : hp_heg2hp_window_avt(get_num_layers(g_STATION_RADIUS) -1 downto 0);
  signal i_slc_data_v     : hp_heg2hp_slc_rvt;
  signal i_mdt_data_v     : hp_hpsPc2hp_rvt;
  signal o_hit_data_v     : hp_hp2bm_rvt;

begin

  Hit_Processor : entity hp_lib.hit_processor
  generic map(
    g_STATION_RADIUS    => g_STATION_RADIUS
  )
  port map(
    clk                 => clk,
    rst                 => rst,
    glob_en             => glob_en,
    --
    ctrl_v              => ctrl_v,
    mon_v               => mon_v, 
    -- configuration
    local_rst           => local_rst,
    local_en            => local_en,
    -- SLc
    i_SLC_Window        => i_SLC_Window_av,
    i_slc_data_v        => i_slc_data_v,
    -- MDT hit
    i_mdt_data_v        => i_mdt_data_v,
    -- out 2 bm
    o_hit_data_v       => o_hit_data_v
  );

end beh;
