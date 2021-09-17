--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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
-- use ult_lib.ult_tb_sim_pkg.all;


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
use ctrl_lib.MPL_CTRL_DEF.all;
use ctrl_lib.UCM_CTRL_DEF.all;
use ctrl_lib.H2S_CTRL_DEF.all;
use ctrl_lib.TAR_CTRL_DEF.all;
use ctrl_lib.MTC_CTRL_DEF.all;
use ctrl_lib.DAQ_CTRL_DEF.all;
use ctrl_lib.TF_CTRL_DEF.all;

library project_lib;
-- use project_lib.gldl_ult_tp_sim_pkg.all;
use project_lib.ult_tb_sim_pkg.all;
-- use project_lib.gldl_l0mdt_textio_pkg.all;

entity ult_tp is
  generic (
    PRJ_INFO            : string  := "BA3_yt_v04";
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

  signal h2s_ctrl :  H2S_CTRL_t := DEFAULT_H2S_CTRL_t;
  signal h2s_mon  :  H2S_MON_t;
  signal tar_ctrl :  TAR_CTRL_t := DEFAULT_TAR_CTRL_t;
  signal tar_mon  :  TAR_MON_t ;
  signal mtc_ctrl :  MTC_CTRL_t := DEFAULT_MTC_CTRL_t;
  signal mtc_mon  :  MTC_MON_t;
  signal ucm_ctrl :  UCM_CTRL_t := DEFAULT_UCM_CTRL_t;
  signal ucm_mon  :  UCM_MON_t;
  signal daq_ctrl :  DAQ_CTRL_t := DEFAULT_DAQ_CTRL_t;
  signal daq_mon  :  DAQ_MON_t;
  signal tf_ctrl  :  TF_CTRL_t := DEFAULT_TF_CTRL_t;
  signal tf_mon   :  TF_MON_t;
  signal mpl_ctrl :  MPL_CTRL_t := DEFAULT_MPL_CTRL_t;
  signal mpl_mon  :  MPL_MON_t;

  signal h2s_ctrl_v : std_logic_vector(len(h2s_ctrl)-1 downto 0);
  signal h2s_mon_v  : std_logic_vector(len(h2s_mon )-1 downto 0);
  signal tar_ctrl_v : std_logic_vector(len(tar_ctrl)-1 downto 0);
  signal tar_mon_v  : std_logic_vector(len(tar_mon )-1 downto 0);
  signal mtc_ctrl_v : std_logic_vector(len(mtc_ctrl)-1 downto 0);
  signal mtc_mon_v  : std_logic_vector(len(mtc_mon )-1 downto 0);
  signal ucm_ctrl_v : std_logic_vector(len(ucm_ctrl)-1 downto 0);
  signal ucm_mon_v  : std_logic_vector(len(ucm_mon )-1 downto 0);
  signal daq_ctrl_v : std_logic_vector(len(daq_ctrl)-1 downto 0);
  signal daq_mon_v  : std_logic_vector(len(daq_mon )-1 downto 0);
  signal tf_ctrl_v  : std_logic_vector(len(tf_ctrl )-1 downto 0);
  signal tf_mon_v   : std_logic_vector(len(tf_mon  )-1 downto 0);
  signal mpl_ctrl_v : std_logic_vector(len(mpl_ctrl)-1 downto 0);
  signal mpl_mon_v  : std_logic_vector(len(mpl_mon )-1 downto 0);

  -- TDC Hits from Polmux
  signal i_mdt_tdc_inn_av :  mdt_polmux_bus_avt (c_HPS_MAX_HP_INN -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tdc_mid_av :  mdt_polmux_bus_avt (c_HPS_MAX_HP_MID -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tdc_out_av :  mdt_polmux_bus_avt (c_HPS_MAX_HP_OUT -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tdc_ext_av :  mdt_polmux_bus_avt (c_HPS_MAX_HP_EXT -1 downto 0) := (others => (others => '0'));

  -- TDC Hits from Tar
  -- signal i_mdt_tar_inn_av :  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_INN -1 downto 0) := (others => (others => '0'));
  -- signal i_mdt_tar_mid_av :  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_MID -1 downto 0) := (others => (others => '0'));
  -- signal i_mdt_tar_out_av :  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_OUT -1 downto 0) := (others => (others => '0'));
  -- signal i_mdt_tar_ext_av :  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_EXT -1 downto 0) := (others => (others => '0'));

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
  signal o_plus_neighbor_segments_av  :  sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0) := (others => (others => '0'));
  signal o_minus_neighbor_segments_av :  sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0) := (others => (others => '0'));

  -- MUCTPI
  signal o_MTC :  mtc_out_bus_avt(c_NUM_MTC-1 downto 0);
  signal o_NSP :  mtc2nsp_bus_avt(c_NUM_NSP-1 downto 0);

  signal sump : std_logic;

  ---------------------------------------------------------------------------
  -- simulation signals
  ---------------------------------------------------------------------------
  -- AXI clk & rst
  signal axi_rst      : std_logic;
  signal clk_axi      : std_logic;
  signal clk_axi_cnt  : integer;
  constant c_CLK_AXI_MULT : integer := 5; 
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

  signal bx : std_logic := '0';


begin

  h2s_ctrl_v <= vectorify(h2s_ctrl,h2s_ctrl_v);

  ULT : entity ult_lib.ult
  generic map(
    DUMMY       => false
    )
  port map(

    -- pipeline clock
    clock_and_control => clock_and_control,
    -- clk => clk,
    -- rst => rst,
    -- bx  => bx ,

    ttc_commands      => ttc_commands,

    -- ULT Control
    h2s_ctrl_v => h2s_ctrl_v,
    h2s_mon_v  => h2s_mon_v,
    tar_ctrl_v => tar_ctrl_v,
    tar_mon_v  => tar_mon_v,
    mtc_ctrl_v => mtc_ctrl_v,
    mtc_mon_v  => mtc_mon_v,
    ucm_ctrl_v => ucm_ctrl_v,
    ucm_mon_v  => ucm_mon_v,
    daq_ctrl_v => daq_ctrl_v,
    daq_mon_v  => daq_mon_v,
    tf_ctrl_v  => tf_ctrl_v,
    tf_mon_v   => tf_mon_v,
    mpl_ctrl_v => mpl_ctrl_v,
    mpl_mon_v  => mpl_mon_v,

    -- TDC Hits from Polmux
    i_inn_tdc_hits_av => i_mdt_tdc_inn_av,
    i_mid_tdc_hits_av => i_mdt_tdc_mid_av,
    i_out_tdc_hits_av => i_mdt_tdc_out_av,
    i_ext_tdc_hits_av => i_mdt_tdc_ext_av,

    -- TAR Hits for simulation
    -- i_inner_tar_hits  => i_mdt_tar_inn_av,
    -- i_middle_tar_hits => i_mdt_tar_mid_av,
    -- i_outer_tar_hits  => i_mdt_tar_out_av,
    -- i_extra_tar_hits  => i_mdt_tar_ext_av,

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
    o_plus_neighbor_segments_av  => o_plus_neighbor_segments_av,
    o_minus_neighbor_segments_av => o_minus_neighbor_segments_av,

    -- MUCTPI
    o_MTC => o_MTC,
    o_NSP => o_NSP,

    sump => sump
  );

    -- ctrl/mon
    ucm_ctrl_v <= vectorify(ucm_ctrl,ucm_ctrl_v);
    ucm_mon <= structify(ucm_mon_v,ucm_mon);
    tar_ctrl_v <= vectorify(tar_ctrl,tar_ctrl_v);
    tar_mon <= structify(tar_mon_v,tar_mon);
    h2s_ctrl_v <= vectorify(h2s_ctrl,h2s_ctrl_v);
    h2s_mon <= structify(h2s_mon_v,h2s_mon);
    mpl_ctrl_v <= vectorify(mpl_ctrl,mpl_ctrl_v);
    mpl_mon <= structify(mpl_mon_v,mpl_mon);
    tf_ctrl_v <= vectorify(tf_ctrl,tf_ctrl_v);
    tf_mon <= structify(tf_mon_v,tf_mon);
    mtc_ctrl_v <= vectorify(mtc_ctrl,mtc_ctrl_v);
    mtc_mon <= structify(mtc_mon_v,mtc_mon);
    daq_ctrl_v <= vectorify(daq_ctrl,daq_ctrl_v);
    daq_mon <= structify(daq_mon_v,daq_mon);

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
  --    AXI CLK
  -------------------------------------------------------------------------------------
  axi_clk_proc : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        clk_axi <= '0';
        clk_axi_cnt <= 0;
      else
        if clk_axi_cnt < c_CLK_AXI_MULT then
          clk_axi_cnt <= clk_axi_cnt + 1;
        else
          clk_axi_cnt <= 0;
          clk_axi <= not clk_axi;
        end if;
      end if;
    end if;
  end process axi_clk_proc;
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
	-- readers
  -------------------------------------------------------------------------------------

    MDT : entity project_lib.ult_tb_reader_tdc 
    generic map (
      IN_HIT_FILE => "csm_A3_Barrel.csv"--IN_HIT_FILE
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
  -- end generate;

  SLC : entity project_lib.ult_tb_reader_slc 
  generic map (
    IN_SLC_FILE => "slc_A3_Barrel.csv"--IN_SLC_FILE
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
  -------------------------------------------------------------------------------------
	-- writers
  -------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------

  -------------------------------------------------------------------------------------
	-- TAR2HPS
  -------------------------------------------------------------------------------------
  -- TAR2HPS : entity project_lib.ult_tb_writer_sf2pt 
  -- generic map (
  --   g_PRJ_INFO    => PRJ_INFO,
  --   g_IN_HIT_FILE => IN_HIT_FILE,
  --   g_IN_SLC_FILE => IN_SLC_FILE
  --   -- OUT_PTIN_SF_FILE => OUT_PTIN_SF_FILE,
  --   -- OUT_PTIN_MPL_FILE => OUT_PTIN_MPL_FILE
  -- )
  -- port map(
  --   clk => clk,
  --   rst => rst,
  --   enable => enable_slc,
  --   --
  --   tb_curr_tdc_time => tb_curr_tdc_time
  -- );
  -------------------------------------------------------------------------------------
	-- TAR2DAQ
  -------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------
	-- UCM2HPS
  -------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------
	-- UCM2MPL
  -------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------
	-- HEG2SF
  -------------------------------------------------------------------------------------
  -- HEG_2_SF_EN : if c_H2S_ENABLED = '1' generate
  --   HEG_2_SF : entity project_lib.ult_tb_writer_heg2sf 
  --   generic map (
  --     g_IN_HIT_FILE => IN_HIT_FILE,
  --     g_IN_SLC_FILE => IN_SLC_FILE,
  --     g_OUT_HEG_BM_SLC_FILE => OUT_HEG_BM_SLC_FILE,
  --     g_OUT_HEG_BM_HIT_FILE => OUT_HEG_BM_HIT_FILE
  --   )
  --   port map(
  --     clk => clk,
  --     rst => rst,
  --     enable => enable_slc,
  --     --
  --     tb_curr_tdc_time => tb_curr_tdc_time
  --   );
  -- end generate;
  -------------------------------------------------------------------------------------
	-- SF2OUT
  -------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------
	-- MPL2PT
  -------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------
	-- SF2PT
  -------------------------------------------------------------------------------------

  -- SF_2_PT : entity project_lib.ult_tb_writer_sf2pt 
  -- generic map (
  --   g_IN_HIT_FILE => IN_HIT_FILE,
  --   g_IN_SLC_FILE => IN_SLC_FILE
  --   -- OUT_PTIN_SF_FILE => OUT_PTIN_SF_FILE,
  --   -- OUT_PTIN_MPL_FILE => OUT_PTIN_MPL_FILE
  -- )
  -- port map(
  --   clk => clk,
  --   rst => rst,
  --   enable => enable_slc,
  --   --
  --   tb_curr_tdc_time => tb_curr_tdc_time
  -- );
  -------------------------------------------------------------------------------------
	-- MPL2MTCB
  -------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------
  -- PT2MTCB
  -------------------------------------------------------------------------------------

  -- PT_2_MTC : entity project_lib.ult_tb_writer_pt2mtcb
  -- generic map (
  --   g_IN_HIT_FILE => IN_HIT_FILE,
  --   g_IN_SLC_FILE => IN_SLC_FILE
  --   -- OUT_MTCIN_PT_FILE  => OUT_MTCIN_PT_FILE,
  --   -- OUT_MTCIN_MPL_FILE => OUT_MTCIN_MPL_FILE
  -- )
  -- port map(
  --   clk => clk,
  --   rst => rst,
  --   enable => enable_slc,
  --   --
  --   tb_curr_tdc_time => tb_curr_tdc_time
  -- );








end architecture beh;
