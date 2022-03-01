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

library tar_lib;
use tar_lib.tar_pkg.all;

library ctrl_lib;
use ctrl_lib.tar_CTRL.all;
use ctrl_lib.TAR_CTRL_DEF.all;


entity tar_tb is
  generic (
    g_HPS_MAX_HP : integer := 6;
    g_STATION :   integer := 0;
    --
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
end entity tar_tb;

architecture beh of tar_tb is

  -- clk
  constant clk_period : time := 3.125 ns;  -- 320Mhz
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles : integer := 3;
  signal rst                 : std_logic;
  signal glob_en             : std_logic := '1';
  --
  signal ctrl_r              : TAR_CTRL_t := DEFAULT_TAR_CTRL_t ;
  signal mon_r               : TAR_MON_t;
  signal ctrl_v              : std_logic_vector(len(ctrl_r) - 1 downto 0); --  : in  TAR_CTRL_t;
  signal mon_v               : std_logic_vector(len(mon_r) - 1 downto 0);--  : out TAR_MON_t;
  -- TDC Hits from Polmux
  signal i_tdc_hits_av    : tdcpolmux2tar_avt (g_HPS_MAX_HP -1 downto 0):= (others => (others => '0'));
  -- TDC polmux from Tar
  signal o_tdc_hits_av    : tdcpolmux2tar_avt(g_HPS_MAX_HP -1 downto 0);
  -- TDC Hits from Tar
  signal o_tar_hits_av    : tar2hps_avt(g_HPS_MAX_HP -1 downto 0);

begin

  ctrl_v <= convert(ctrl_r,ctrl_v);
  mon_r <= convert(mon_v,mon_r);

  TAR : entity tar_lib.tar
  generic map(
    g_HPS_MAX_HP => g_HPS_MAX_HP,
    g_STATION => g_STATION
  )
  port map (
    -- clock, control, and monitoring
    clk             => clk,
    rst             => rst,
    glob_en         => glob_en,
    --
    ctrl_v            => ctrl_v,
    mon_v             => mon_v,
    -- TDC Hits from Polmux
    i_tdc_hits_av  => i_tdc_hits_av,
    -- to daq
    o_tdc_hits_av  => o_tdc_hits_av,
    -- outputs to h2s
    o_tar_hits_av  => o_tar_hits_av

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
