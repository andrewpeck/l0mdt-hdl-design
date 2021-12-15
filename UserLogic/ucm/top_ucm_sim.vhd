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

library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;


entity top_ucm_tb is
  generic (
    PRJ_INFO            : string  := "BA3";
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
  -- port (
  --   clk                     : in std_logic;
  --   rst                     : in std_logic;
  --   glob_en                 : in std_logic;
  --   ttc_commands            : in l0mdt_ttc_rt;
  --   -- configuration, control & Monitoring
  --   ctrl                    : in  UCM_CTRL_t;
  --   mon                     : out UCM_MON_t;
  --   -- SLc in
  --   i_slc_data_mainA_av     : in slc_rx_bus_avt(2 downto 0);
  --   i_slc_data_mainB_av     : in slc_rx_bus_avt(2 downto 0);
  --   i_slc_data_neighborA_v  : in slc_rx_rvt;
  --   i_slc_data_neighborB_v  : in slc_rx_rvt;
  --   -- to hps
  --   o_uCM2hps_inn_av        : out ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  --   o_uCM2hps_mid_av        : out ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  --   o_uCM2hps_out_av        : out ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  --   o_uCM2hps_ext_av        : out ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  --   -- pipeline
  --   o_uCM2pl_av             : out ucm2pl_bus_avt(c_MAX_NUM_SL -1 downto 0)
  -- );
end entity top_ucm_tb;

architecture beh of top_ucm_tb is

  signal clk                     : std_logic;
  signal rst                     : std_logic;
  signal glob_en                 : std_logic;
  signal ttc_commands            : l0mdt_ttc_rt;
  -- configuration, control & Monitoring
  signal ctrl_r              : UCM_CTRL_t;
  signal mon_r               : UCM_MON_t;
  signal ctrl_v              : std_logic_vector(len(ctrl_r)-1 downto 0);--UCM_CTRL_t;
  signal mon_v               : std_logic_vector(len(mon_r )-1 downto 0);--UCM_MON_t;
  -- SLc in
  signal i_slc_data_mainA_av     : slc_rx_bus_avt(2 downto 0);
  signal i_slc_data_mainB_av     : slc_rx_bus_avt(2 downto 0);
  signal i_slc_data_neighborA_v  : slc_rx_rvt;
  signal i_slc_data_neighborB_v  : slc_rx_rvt;
  -- to hps
  signal o_uCM2hps_inn_av        : ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_mid_av        : ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_out_av        : ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_ext_av        : ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  -- pipeline
  signal o_uCM2pl_av             : ucm2pl_bus_avt(c_MAX_NUM_SL -1 downto 0);

begin

  UCM : entity ucm_lib.ucm
  port map(
    clk                     => clk,
    rst                     => rst,
    glob_en                 => glob_en,
    ttc_commands            => ttc_commands, 
    -- configuration, control & Monitoring
    ctrl_v                    => ctrl_v,
    mon_v                     => mon_v,
    -- SLc in
    i_slc_data_mainA_av     => i_slc_data_mainA_av,
    i_slc_data_mainB_av     => i_slc_data_mainB_av,
    i_slc_data_neighborA_v => i_slc_data_neighborA_v,
    i_slc_data_neighborB_v => i_slc_data_neighborB_v,
    -- pam out
    -- o_uCM2hps_pam_ar       => o_uCM2hps_pam_ar,
    o_uCM2hps_inn_av        => o_uCM2hps_inn_av,
    o_uCM2hps_mid_av        => o_uCM2hps_mid_av,
    o_uCM2hps_out_av        => o_uCM2hps_out_av,
    o_uCM2hps_ext_av        => o_uCM2hps_ext_av,
    -- MDT hit
    o_uCM2pl_av             => o_uCM2pl_av
  );

  -- TH : for th_i in c_NUM_THREADS -1 downto 0 generate
  --   o_uCM2hps_inn_1b(th_i) <= or_reduce(o_uCM2hps_inn_av(th_i));
  --   o_uCM2hps_mid_1b(th_i) <= or_reduce(o_uCM2hps_mid_av(th_i));
  --   o_uCM2hps_out_1b(th_i) <= or_reduce(o_uCM2hps_out_av(th_i));
  --   o_uCM2hps_ext_1b(th_i) <= or_reduce(o_uCM2hps_ext_av(th_i));
  -- end generate;

  -- PL : for pl_i in c_MAX_NUM_SL -1 downto 0 generate
  --   o_uCM2pl_1b(pl_i) <= or_reduce(o_uCM2pl_av(pl_i));
  -- end generate;




end beh;
