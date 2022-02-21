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
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;
use ctrl_lib.HPS_CTRL_DEF.all;

entity hps_tb is
  generic(
    -- mdt type
    -- type mdt_type;
    -- parameters
    FLAVOUR             : integer := 0;
    g_STATION_RADIUS    : integer := 0;  --station
    g_HPS_NUM_MDT_CH    : integer := 6 
  );
  -- port (
    -- clk                 : in std_logic;
    -- rst                 : in std_logic;
    -- glob_en             : in std_logic := '1';

    -- -- control
    -- ctrl_v              : in  HPS_CTRL_t;
    -- mon_v               : out HPS_MON_t;

    -- -- control
    -- -- SLc
    -- i_uCM2hps_av        : in ucm2hps_avt(c_NUM_THREADS -1 downto 0);
    -- -- MDT hit
    -- -- i_mdt_polmux_av    : in tar2hps_avt(g_HPS_NUM_MDT_CH -1 downto 0);
    -- i_mdt_tar_av        : in tar2hps_avt(g_HPS_NUM_MDT_CH -1 downto 0);
    -- -- to pt calc
    -- o_sf2pt_av          : out sf2ptcalc_avt(c_NUM_THREADS -1 downto 0)
  -- );
end entity hps_tb;

architecture beh of hps_tb is

  -- clk
  constant clk_period : time := 3.125 ns;  -- 320Mhz
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles  : integer := 3;
  signal rst                  : std_logic;
  signal ena                  : std_logic := '1';
  --
  signal ctrl_r             : HPS_CTRL_t := DEFAULT_HPS_CTRL_t;
  signal mon_r              : HPS_MON_t;
  signal ctrl_v             : std_logic_vector(len(ctrl_r) -1 downto 0);
  signal mon_v              : std_logic_vector(len(mon_r) -1 downto 0);
  signal i_uCM2hps_av       : ucm2hps_avt(c_NUM_THREADS -1 downto 0);
  signal i_mdt_tar_av       : tar2hps_avt(g_HPS_NUM_MDT_CH -1 downto 0);
  signal o_sf2pt_av         : sf2ptcalc_avt(c_NUM_THREADS -1 downto 0);

begin

  -- IN_GEN : for hp_i in g_HPS_NUM_MDT_CH downto 0 generate
  --   mdt_polmux_data_av(hp_i).polmux <= i_mdt_polmux_av(hp_i);
  --   mdt_polmux_data_av(hp_i).tar <= i_mdt_tar_av(hp_i);
  -- end generate;

  ctrl_v <= convert(ctrl_r,ctrl_v);
  mon_r <= convert(mon_v,mon_r);

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
      glob_en             => ena,

      ctrl_v => ctrl_v,
      mon_v => mon_v,

      -- configuration & control
      -- i_uCM_pam           => i_uCM_pam,
      -- SLc
      i_uCM2hps_av        => i_uCM2hps_av,
      -- MDT hit
      i_mdt_tar_av        => i_mdt_tar_av,
      -- to pt calc
      o_sf2pt_av          => o_sf2pt_av
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
