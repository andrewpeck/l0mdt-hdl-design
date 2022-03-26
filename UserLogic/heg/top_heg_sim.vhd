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
-- use shared_lib.common_types_vectors_pkg.all;
use shared_lib.config_pkg.all;

library hp_lib;
use hp_lib.hp_pkg.all;
library heg_lib;
use heg_lib.heg_pkg.all;
-- library hegtypes_lib;
-- use hegtypes_lib.hp_pkg.all;
-- use hegtypes_lib.heg_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;
use ctrl_lib.HPS_CTRL_DEF.all;

entity heg_tb is
  generic(
    PRJ_INFO            : string  := "BA3";
    g_STATION_RADIUS    : integer := 0;
    -- IN_SLC_FILE         : string  := "slc_A3_Barrel.csv";
    -- IN_HIT_FILE         : string  := "csm_A3_Barrel.csv";
    FLAVOUR             : integer := 0;
    -- OUT_HEG_BM_SLC_FILE : string  := "hps_heg_bm_slc_A3_Barrel_yt_v04.csv";
    -- OUT_HEG_BM_HIT_FILE : string  := "hps_heg_bm_hit_A3_Barrel_yt_v04.csv";
    -- OUT_PTIN_SF_FILE    : string  := "pt_in_sf_A3_Barrel_yt_v04.csv";
    -- OUT_PTIN_MPL_FILE   : string  := "pt_in_mpl_A3_Barrel_yt_v04.csv";
    -- OUT_MTCIN_PT_FILE   : string  := "mtc_in_pt_A3_Barrel_yt_v04.csv";
    -- OUT_MTCIN_MPL_FILE  : string  := "mtc_in_mpl_A3_Barrel_yt_v04.csv";
    DUMMY               : boolean := false
  );
end entity heg_tb;

architecture beh of heg_tb is
  -- clk
  constant clk_period : time := 3.125 ns;  -- 320Mhz
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles  : integer := 3;
  signal rst                  : std_logic;
  signal ena                  : std_logic := '1';
  --
  signal ctrl_r               : HPS_HEG_HEG_CTRL_t := DEFAULT_HPS_HEG_HEG_CTRL_t ;
  signal mon_r                : HPS_HEG_HEG_MON_t;
  -- constant c_CTRL_LEN         : integer := len(ctrl_r);
  -- constant c_MON_LEN          : integer := len(mon_r);
  signal ctrl_v               : std_logic_vector(HPS_HEG_HEG_CTRL_t'w - 1 downto 0);
  signal mon_v                : std_logic_vector(HPS_HEG_HEG_MON_t'w - 1 downto 0);
  --
  signal i_freeze             : std_logic := '0';
  -- SLc
  signal i_uCM_data_v         : ucm2hps_vt := (others => '0');
  -- MDT hit
  signal i_mdt_full_data_av   : heg_pc2heg_avt(c_HPS_MAX_ARRAY(FLAVOUR)-1 downto 0) := (others => (others => '0'));
  -- to Segment finder
  signal o_sf_control_v       : heg_ctrl2sf_vt := (others => '0');
  signal o_sf_slc_data_v      : heg2sfslc_vt := (others => '0');
  signal o_sf_mdt_data_v      : heg2sfhit_vt := (others => '0');
begin

  ctrl_v <= convert(ctrl_r,ctrl_v);
  mon_r <= convert(mon_v,mon_r);

  HEG : entity heg_lib.heg
  generic map(
    g_STATION_RADIUS    => FLAVOUR,
    g_HPS_NUM_MDT_CH    => c_HPS_MAX_ARRAY(FLAVOUR)
  )
  port map(
    clk                 => clk,
    rst                 => rst,
    glob_en             => ena,
    -- control
    ctrl_v              => ctrl_v,
    mon_v               => mon_v,
    -- cfg
    i_freeze            => i_freeze,
    -- SLc
    i_uCM_data_v        => i_uCM_data_v,
    -- MDT hit
    i_mdt_full_data_av  => i_mdt_full_data_av,
    -- to Segment finder
    o_sf_control_v      => o_sf_control_v,
    o_sf_slc_data_v     => o_sf_slc_data_v,
    o_sf_mdt_data_v     => o_sf_mdt_data_v
  );

  -------------------------------------------------------------------------------------
	-- clock Generator
	-------------------------------------------------------------------------------------
  CLK_MAIN : process begin
    clk <= '0';
    wait for CLK_period/2;
    clk <= '1';
    wait for CLK_period/2;
  end process;
 	-------------------------------------------------------------------------------------
	-- Reset Generator
	-------------------------------------------------------------------------------------
	rst_process: process begin
		rst<='0';
		wait for CLK_period;
		rst<='1';
		wait for CLK_period*reset_init_cycles;
		rst<= '0';
		wait;
  end process;

end beh;


