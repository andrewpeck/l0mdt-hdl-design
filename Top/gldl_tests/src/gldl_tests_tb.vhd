--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: Test Bench Module for Logic Trigger Path
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      2020.10.12 - compatible only with yt_v04 IV
--
--------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;
use std.textio.all;
use std.standard.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

library project_lib;
-- use project_lib.gldl_ult_tp_sim_pkg.all;
-- use project_lib.gldl_l0mdt_textio_pkg.all;

entity gldl_test_tb is
  generic (
    -- IN_SLC_FILE       : string  := "slc_TB_A3_Barrel_yt_v04.txt";
    -- IN_MDT_FILE       : string  := "csm_TB_A3_Barrel_yt_v04.txt";
    -- OUT_HEG_BM_FILE   : string  := "hps_heg_bm_A3_Barrel_yt_v04.txt";
    DUMMY             : boolean := false
    );
end entity gldl_test_tb;

architecture beh of gldl_test_tb is

  signal enable_mdt : integer := 1;
  signal enable_slc : integer := 1;

  ---------------------------------------------------------------------------
  -- signals related to DUT ports
  ---------------------------------------------------------------------------

  signal clock_and_control : l0mdt_control_rt;
  signal ttc_commands      : l0mdt_ttc_rt;


  signal sump : std_logic;

  ---------------------------------------------------------------------------
  -- simulation signals
  ---------------------------------------------------------------------------
  -- clk
  constant clk_time_period : time := 1 ns;  -- 1Ghz
  signal clk_time : std_logic := '0';
  signal tb_curr_time : unsigned(63 downto 0) := (others => '0');
  -- clk 0.78
  constant clk_tdc_time_period : time := 0.78125 ns;  
  signal clk_tdc_time : std_logic := '0';
  signal tb_curr_tdc_time : unsigned(63 downto 0) := (others => '0');
  -- clk
  constant clk_period : time := 3.125 ns;  -- 320Mhz
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles : integer := 3;
  signal rst: std_logic;

  signal glob_en : std_logic := '1';

  --------------------------------------------------------------------------
  -- simulation signals
  ---------------------------------------------------------------------------
  signal i_test_signal : std_logic_vector(31 downto 0) := (others => '0');
  signal o_test_signal : std_logic_vector(31 downto 0);

  ---------------------------------------------------------------------------
  -- simulation output aliases
  ---------------------------------------------------------------------------

begin

  ULT : entity project_lib.gldl_tests_top
    generic map(
      DUMMY       => false
      )
    port map(
      -- pipeline clock
      clk           => clk,
      rst           => rst,

      -- TDC Hits from Polmux
      i_test_signal => i_test_signal,
      o_test_signal => o_test_signal,
      
      sump => sump
      );

  -------------------------------------------------------------------------------------
	-- clock Generator
	-------------------------------------------------------------------------------------
  CLK_RT : process begin
    clk_time <= '0';
    wait for CLK_time_period/2;
    clk_time <= '1';
    wait for CLK_time_period/2;
  end process;
  -------------------------------------------------------------------------------------
	-- clock tdc Generator
	-------------------------------------------------------------------------------------
  CLK_TDC : process begin
    clk_tdc_time <= '0';
    wait for CLK_tdc_time_period/2;
    clk_tdc_time <= '1';
    wait for CLK_tdc_time_period/2;
  end process;
  -- clock_and_control.clk <= clk;
  -------------------------------------------------------------------------------------
	-- Main FPGA clock
	-------------------------------------------------------------------------------------
  CLK_MAIN : process begin
    clk <= '0';
    wait for CLK_period/2;
    clk <= '1';
    wait for CLK_period/2;
  end process;
  clock_and_control.clk <= clk;
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
  clock_and_control.rst <= rst;
  -------------------------------------------------------------------------------------
	-- Test Bench time
  -------------------------------------------------------------------------------------
  ToA: process(clk_time) begin
    if rising_edge(clk_time) then
      tb_curr_time <= tb_curr_time + '1';
    end if;
  end process;
  -------------------------------------------------------------------------------------
	-- Test Bench tdc time
  -------------------------------------------------------------------------------------
  ToA_tdc: process(clk_tdc_time) begin
    if rising_edge(clk_tdc_time) then
      tb_curr_tdc_time <= tb_curr_tdc_time + '1';
    end if;
  end process;

  -------------------------------------------------------------------------------------
	-- Signal gen
  -------------------------------------------------------------------------------------
  SIG_GEN: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        i_test_signal <= (others => '0');
      else
        i_test_signal <= i_test_signal + '1';
      end if;
    end if;
  end process SIG_GEN;

end architecture beh;
