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
-- library ult_lib_sim;

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
    IN_SLC_FILE         : string  := "slc_TB_A3_Barrel_yt_v04.txt";
    IN_HIT_FILE         : string  := "csm_TB_A3_Barrel_yt_v04.txt";
    OUT_HEG_BM_SLC_FILE : string  := "hps_heg_bm_slc_A3_Barrel_yt_v04.csv";
    OUT_HEG_BM_HIT_FILE : string  := "hps_heg_bm_hit_A3_Barrel_yt_v04.csv";
    OUT_PTIN_SF_FILE    : string  := "pt_in_sf_A3_Barrel_yt_v04.csv";
    OUT_PTIN_MPL_FILE   : string  := "pt_in_mpl_A3_Barrel_yt_v04.csv";
    OUT_MTCIN_PT_FILE   : string  := "mtc_in_pt_A3_Barrel_yt_v04.csv";
    OUT_MTCIN_MPL_FILE  : string  := "mtc_in_mpl_A3_Barrel_yt_v04.csv";
    DUMMY               : boolean := false
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
  -- axi control

  signal h2s_ctrl :  H2S_CTRL_t;
  signal h2s_mon  :  H2S_MON_t;
  signal tar_ctrl :  TAR_CTRL_t;
  signal tar_mon  :  TAR_MON_t;
  signal mtc_ctrl :  MTC_CTRL_t;
  signal mtc_mon  :  MTC_MON_t;
  signal ucm_ctrl :  UCM_CTRL_t := DEFAULT_UCM_CTRL_t;
  signal ucm_mon  :  UCM_MON_t;
  signal daq_ctrl :  DAQ_CTRL_t;
  signal daq_mon  :  DAQ_MON_t;
  signal tf_ctrl  :  TF_CTRL_t;
  signal tf_mon   :  TF_MON_t;
  signal mpl_ctrl :  MPL_CTRL_t;
  signal mpl_mon  :  MPL_MON_t;

  -- TDC Hits from Polmux
  signal i_mdt_tdc_inn_av :  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_MAX_HP_INN -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tdc_mid_av :  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_MAX_HP_MID -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tdc_out_av :  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_MAX_HP_OUT -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tdc_ext_av :  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_MAX_HP_EXT -1 downto 0) := (others => (others => '0'));

  -- TDC Hits from Tar
  signal i_mdt_tar_inn_av :  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_INN -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tar_mid_av :  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_MID -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tar_out_av :  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_OUT -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tar_ext_av :  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_EXT -1 downto 0) := (others => (others => '0'));

  -- Sector Logic Candidates
  signal i_main_primary_slc        : slc_rx_bus_avt(2 downto 0) := (others => (others => '0'));  -- is the main SL used
  signal i_main_secondary_slc      : slc_rx_bus_avt(2 downto 0) := (others => (others => '0'));  -- only used in the big endcap
  signal i_plus_neighbor_slc       : slc_rx_rvt := (others => '0');
  signal i_minus_neighbor_slc      : slc_rx_rvt := (others => '0');
  -- Segments in from neighbor
  signal i_plus_neighbor_segments  : sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0) := (others => (others => '0'));
  signal i_minus_neighbor_segments : sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0) := (others => (others => '0'));

  -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
  signal o_daq_streams :  felix_stream_bus_avt (c_NUM_DAQ_STREAMS-1 downto 0) := (others => (others => '0'));

  -- Segments Out to Neighbor
  signal o_plus_neighbor_segments  :  sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0) := (others => (others => '0'));
  signal o_minus_neighbor_segments :  sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0) := (others => (others => '0'));

  -- MUCTPI
  signal o_MTC :  mtc_out_bus_avt(c_NUM_MTC-1 downto 0);
  signal o_NSP :  mtc2nsp_bus_avt(c_NUM_NSP-1 downto 0);

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


begin

  ULT : entity ult_lib.ult
  generic map(
    DUMMY       => false
    )
  port map(
    -- pipeline clock
    clock_and_control => clock_and_control,
    ttc_commands      => ttc_commands,

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

    -- TDC Hits from Polmux
    i_inner_tdc_hits  => i_mdt_tdc_inn_av,
    i_middle_tdc_hits => i_mdt_tdc_mid_av,
    i_outer_tdc_hits  => i_mdt_tdc_out_av,
    i_extra_tdc_hits  => i_mdt_tdc_ext_av,

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
    i_plus_neighbor_segments  => i_plus_neighbor_segments,
    i_minus_neighbor_segments => i_minus_neighbor_segments,

    -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
    o_daq_streams => o_daq_streams,

    -- Segments Out to Neighbor
    o_plus_neighbor_segments  => o_plus_neighbor_segments,
    o_minus_neighbor_segments => o_minus_neighbor_segments,

    -- MUCTPI
    o_MTC => o_MTC,
    o_NSP => o_NSP,

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
	-- hits
  -------------------------------------------------------------------------------------
  TAR_HIT : if c_EN_TAR_HITS = 1 generate -- TAR data injection
    HIT : entity project_lib.ult_tb_reader_tar 
    generic map (
      IN_HIT_FILE => IN_HIT_FILE
    )
    port map(
      clk => clk,
      rst => rst,
      enable => enable_mdt,
      --
      tb_curr_tdc_time => tb_curr_tdc_time,
      -- TAR Hits for simulation
      i_mdt_tar_inn_av => i_mdt_tar_inn_av,
      i_mdt_tar_mid_av => i_mdt_tar_mid_av,
      i_mdt_tar_out_av => i_mdt_tar_out_av,
      i_mdt_tar_ext_av => i_mdt_tar_ext_av
    );
  end generate;

  TDC_HIT : if c_EN_MDT_HITS = 1 generate -- TAR data injection
    HIT : entity project_lib.ult_tb_reader_tdc 
    generic map (
      IN_HIT_FILE => IN_HIT_FILE
    )
    port map(
      clk => clk,
      rst => rst,
      enable => enable_mdt,
      --
      tb_curr_tdc_time => tb_curr_tdc_time,
      -- TAR Hits for simulation
      i_mdt_tdc_inn_av => i_mdt_tdc_inn_av,
      i_mdt_tdc_mid_av => i_mdt_tdc_mid_av,
      i_mdt_tdc_out_av => i_mdt_tdc_out_av,
      i_mdt_tdc_ext_av => i_mdt_tdc_ext_av
    );
  end generate;

 	-------------------------------------------------------------------------------------
	-- candidates
  -------------------------------------------------------------------------------------
  SLC : entity project_lib.ult_tb_reader_slc 
  generic map (
    IN_SLC_FILE => IN_SLC_FILE
  )
  port map(
    clk => clk,
    rst => rst,
    enable => enable_slc,
    --
    tb_curr_tdc_time => tb_curr_tdc_time,
    -- TAR Hits for simulation
    i_main_primary_slc    => i_main_primary_slc  ,
    i_main_secondary_slc  => i_main_secondary_slc,
    i_plus_neighbor_slc   => i_plus_neighbor_slc ,
    i_minus_neighbor_slc  => i_minus_neighbor_slc
  );

  -------------------------------------------------------------------------------------
	-- HEG_BM 2 SF
  -------------------------------------------------------------------------------------
  HEG_2_SF_EN : if c_H2S_ENABLED = '1' generate
    HEG_2_SF : entity project_lib.ult_tb_writer_heg2sf 
    generic map (
      IN_HIT_FILE => IN_HIT_FILE,
      IN_SLC_FILE => IN_SLC_FILE,
      OUT_HEG_BM_SLC_FILE => OUT_HEG_BM_SLC_FILE,
      OUT_HEG_BM_HIT_FILE => OUT_HEG_BM_HIT_FILE
    )
    port map(
      clk => clk,
      rst => rst,
      enable => enable_slc,
      --
      tb_curr_tdc_time => tb_curr_tdc_time
    );
  end generate;
  
  -------------------------------------------------------------------------------------
	-- Input of PT CALC
  -------------------------------------------------------------------------------------

  SF_2_PT : entity project_lib.ult_tb_writer_sf2pt 
  generic map (
    IN_HIT_FILE => IN_HIT_FILE,
    IN_SLC_FILE => IN_SLC_FILE,
    OUT_PTIN_SF_FILE => OUT_PTIN_SF_FILE,
    OUT_PTIN_MPL_FILE => OUT_PTIN_MPL_FILE
  )
  port map(
    clk => clk,
    rst => rst,
    enable => enable_slc,
    --
    tb_curr_tdc_time => tb_curr_tdc_time
  );

    -------------------------------------------------------------------------------------
    -- Input of MTC Builder
    -------------------------------------------------------------------------------------

  PT_2_MTC : entity project_lib.ult_tb_writer_pt2mtcb
  generic map (
    IN_HIT_FILE => IN_HIT_FILE,
    IN_SLC_FILE => IN_SLC_FILE,
    OUT_MTCIN_PT_FILE  => OUT_MTCIN_PT_FILE,
    OUT_MTCIN_MPL_FILE => OUT_MTCIN_MPL_FILE
  )
  port map(
    clk => clk,
    rst => rst,
    enable => enable_slc,
    --
    tb_curr_tdc_time => tb_curr_tdc_time
  );








end architecture beh;
