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

library ult_lib;

library heg_lib;
use heg_lib.heg_pkg.all;
library hps_lib;
use hps_lib.hps_pkg.all;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;
use ctrl_lib.TAR_CTRL.all;
use ctrl_lib.MTC_CTRL.all;
use ctrl_lib.UCM_CTRL.all;
use ctrl_lib.DAQ_CTRL.all;
use ctrl_lib.TF_CTRL.all;
use ctrl_lib.MPL_CTRL.all;

library project_lib;
use project_lib.gldl_ult_tp_sim_pkg.all;
use project_lib.gldl_l0mdt_textio_pkg.all;

entity ult_tp is
  generic (
    IN_SLC_FILE       : string  := "slc_TB_A3_Barrel_yt_v04.txt";
    IN_MDT_FILE       : string  := "csm_TB_A3_Barrel_yt_v04.txt";
    OUT_HEG_BM_FILE   : string  := "hps_heg_bm_A3_Barrel_yt_v04.txt";
    DUMMY             : boolean := false
    );
end entity ult_tp;

architecture beh of ult_tp is

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

  
  ---------------------------------------------------------------------------
  -- simulation signals
  ---------------------------------------------------------------------------

  ---------------------------------------------------------------------------
  -- simulation signals
  ---------------------------------------------------------------------------

  --------------------------------------------------------------------------
  -- simulation signals
  ---------------------------------------------------------------------------


  ---------------------------------------------------------------------------
  -- simulation output aliases
  ---------------------------------------------------------------------------

begin

  ULT : entity ult_lib.ult
    generic map(
      DUMMY       => false
      )
    port map(
      -- pipeline clock
      clock_and_control => clock_and_control,
      ttc_commands      => ttc_commands,

      -- TDC Hits from Polmux
      i_inner_tdc_hits  => i_inner_tdc_hits,
      i_middle_tdc_hits => i_middle_tdc_hits,
      i_outer_tdc_hits  => i_outer_tdc_hits,
      i_extra_tdc_hits  => i_extra_tdc_hits,

      -- TAR Hits for simulation
      i_inner_tar_hits  => i_mdt_tar_inn_av,
      i_middle_tar_hits => i_mdt_tar_mid_av,
      i_outer_tar_hits  => i_mdt_tar_out_av,
      i_extra_tar_hits  => i_mdt_tar_ext_av,

      -- Sector Logic Candidates
      i_main_primary_slc   => i_main_primary_slc,
      i_main_secondary_slc => i_main_secondary_slc,
      i_plus_neighbor_slc  => i_plus_neighbor_slc,
      i_minus_neighbor_slc => i_minus_neighbor_slc,

      -- Segments in from neighbor
      plus_neighbor_segments_i  => plus_neighbor_segments_i,
      minus_neighbor_segments_i => minus_neighbor_segments_i,

      -- ULT Control

      h2s_ctrl => h2s_ctrl,
      h2s_mon  => h2s_mon,
      tar_ctrl => tar_ctrl,
      tar_mon  => tar_mon,
      mtc_ctrl => mtc_ctrl,
      mtc_mon  => mtc_mon,
      ucm_ctrl => ucm_ctrl,
      ucm_mon  => ucm_mon,
      daq_ctrl => daq_ctrl,
      daq_mon  => daq_mon,
      tf_ctrl  => tf_ctrl,
      tf_mon   => tf_mon,
      mpl_ctrl => mpl_ctrl,
      mpl_mon  => mpl_mon,

      -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
      daq_streams_o => daq_streams_o,

      -- Segments Out to Neighbor
      plus_neighbor_segments_o  => plus_neighbor_segments_o,
      minus_neighbor_segments_o => minus_neighbor_segments_o,

      -- MUCTPI
      MTC_o => MTC_o,
      NSP_o => NSP_o,

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


end architecture beh;
