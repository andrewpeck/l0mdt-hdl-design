--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Main pipe line
--  Description: pipelines between UCM - TF - MTC
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

library mpl_lib;
use mpl_lib.mpl_pkg.all;

library ctrl_lib;
use ctrl_lib.MPL_CTRL.all;
use ctrl_lib.MPL_CTRL_DEF.all;



entity mpl_tb is
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
  --   clk                 : in std_logic;
  --   rst                 : in std_logic;
  --   glob_en             : in std_logic;
  --   -- AXI to SoC
  --   ctrl                : in  MPL_CTRL_t;
  --   mon                 : out MPL_MON_t;
  --   -- configuration, control & Monitoring
  --   -- SLc pipeline
  --   i_uCM2pl_av         : in ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
  --   o_pl2tf_av          : out pl2ptcalc_avt(c_NUM_THREADS -1 downto 0);
  --   o_pl2mtc_av         : out pl2mtc_avt(c_MAX_NUM_SL -1 downto 0)
  -- );
end entity mpl_tb;

architecture beh of mpl_tb is
  -- clk
  constant clk_period : time := 3.125 ns;  -- 320Mhz
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles : integer := 3;
  signal rst                 : std_logic;
  signal glob_en             : std_logic := '1';
  --
  signal ctrl_r              : MPL_CTRL_t := DEFAULT_MPL_CTRL_t ;
  signal mon_r               : MPL_MON_t;
  signal ctrl_v              : std_logic_vector(MPL_CTRL_t'w - 1 downto 0); --  : in  MPL_CTRL_t;
  signal mon_v               : std_logic_vector(MPL_MON_t'w - 1 downto 0);--  : out MPL_MON_t; 
  -- SLc pipeline
  signal i_uCM2pl_av            : ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
  signal o_pl2ptcalc_av         : pl2ptcalc_avt(c_NUM_THREADS -1 downto 0);
  signal o_pl2mtc_av            : pl2mtc_avt(c_MAX_NUM_SL -1 downto 0);
begin

  ctrl_v <= convert(ctrl_r,ctrl_v);
  mon_r <= convert(mon_v,mon_r);

  MPL : entity mpl_lib.mpl
  port map(
    clk             => clk,
    rst             => rst,
    glob_en         => glob_en,
    --
    ctrl_v          => ctrl_v,
    mon_v           => mon_v,
    --
    i_uCM2pl_av     => i_uCM2pl_av,
    o_pl2ptcalc_av  => o_pl2ptcalc_av,
    o_pl2mtc_av     => o_pl2mtc_av
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
  
  
end architecture beh;
