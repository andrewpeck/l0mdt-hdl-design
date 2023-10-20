--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ult
-- File: top_ult_sim.vhd
-- Module: <<moduleName>>
-- File PATH: /top_ult_sim.vhd
-- -----
-- File Created: Wednesday, 8th June 2022 9:54:45 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Saturday, 11th February 2023 12:49:28 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;
use shared_lib.detector_time_param_pkg.all;

use shared_lib.l0mdt_sim_cstm_pkg.all;
use shared_lib.vhdl_textio_csv_pkg.all;
--
-- use shared_lib.tar_sim_pkg.all;

library ult_lib;

library ctrl_lib;
use ctrl_lib.HPS_CTRL.all;
use ctrl_lib.TAR_CTRL.all;
use ctrl_lib.MTC_CTRL.all;
use ctrl_lib.UCM_CTRL.all;
use ctrl_lib.DAQ_CTRL.all;
use ctrl_lib.TF_CTRL.all;
use ctrl_lib.MPL_CTRL.all;
use ctrl_lib.FM_CTRL.all;

library fm_lib;
use fm_lib.fm_types.all;


entity ult_tb is
  generic (
    PRJ_INFO            : string  := "not_defined";
    IN_SLC_FILE         : string  := "not_defined.csv";
    IN_HIT_FILE         : string  := "not_defined.csv";
    IN_CTRL_FILE        : string  := "not_defined.csv";
    g_ST_ENABLE         : std_logic_vector(3 downto 0) := "0111";
    DUMMY               : boolean := false
  );
end entity ult_tb;

architecture beh of ult_tb is
  ---------------------------------------------------------------------------
  -- simulation signals generation
  ---------------------------------------------------------------------------
  -- AXI clk & rst
  signal axi_rst      : std_logic := '0';
  signal clk_axi      : std_logic := '0';
  signal clk_axi_cnt  : integer;
  constant c_CLK_AXI_MULT : integer := 5; 
  -- clk
  constant clk_time_period : time := 1 ns;  -- 1Ghz
  signal clk_time : std_logic := '0';
  signal tb_curr_time : unsigned(63 downto 0) := (others => '0');
  -- clk 0.78125
  constant clk_tdc_time_period : time := 0.78125 ns;  
  signal clk_tdc_time : std_logic := '0';
  signal tb_curr_tdc_time : unsigned(63 downto 0) := (others => '0');
  -- clk 100ps
  constant clk_sim_time_period : time := 100 ps;  
  signal clk_sim_time : std_logic := '0';
  signal tb_curr_sim_time : unsigned(63 downto 0) := (others => '0');
  -- clk
  constant clk_period : time := 3.125 ns;  -- 320Mhz
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles : integer := 3;
  signal rst: std_logic;

  signal glob_en : std_logic := '1';

  signal bx : std_logic := '0';

  signal ttc_commands            : l0mdt_ttc_rt;
  ---------------------------------------------------------------------------
  -- signals DUT
  ---------------------------------------------------------------------------
  signal clock_and_control     : l0mdt_control_rt;

  signal i_mdt_tdc_inn_av : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal i_mdt_tdc_mid_av : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal i_mdt_tdc_out_av : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal i_mdt_tdc_ext_av : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);

  signal i_main_primary_slc       :slc_rx_avt(2 downto 0);  -- is the main SL used
  signal i_main_secondary_slc     :slc_rx_avt(2 downto 0);  -- only used in the big endcap
  signal i_plus_neighbor_slc      :slc_rx_vt;
  signal i_minus_neighbor_slc     :slc_rx_vt;

  signal i_plus_neighbor_segments  : sf2ptcalc_avt(c_NUM_SF_INPUTS - 1 downto 0);
  signal i_minus_neighbor_segments : sf2ptcalc_avt(c_NUM_SF_INPUTS - 1 downto 0);

  signal hps_inn_ctrl_r        : HPS_CTRL_t;
  signal hps_inn_mon_r         : HPS_MON_t;
  signal hps_mid_ctrl_r        : HPS_CTRL_t;
  signal hps_mid_mon_r         : HPS_MON_t;
  signal hps_out_ctrl_r        : HPS_CTRL_t;
  signal hps_out_mon_r         : HPS_MON_t;
  signal hps_ext_ctrl_r        : HPS_CTRL_t;
  signal hps_ext_mon_r         : HPS_MON_t;

  signal tar_inn_ctrl_r        : TAR_CTRL_t;
  signal tar_inn_mon_r         : TAR_MON_t;
  signal tar_mid_ctrl_r        : TAR_CTRL_t;
  signal tar_mid_mon_r         : TAR_MON_t;
  signal tar_out_ctrl_r        : TAR_CTRL_t;
  signal tar_out_mon_r         : TAR_MON_t;
  signal tar_ext_ctrl_r        : TAR_CTRL_t;
  signal tar_ext_mon_r         : TAR_MON_t;

  signal mtc_ctrl_r            : MTC_CTRL_t;
  signal mtc_mon_r             : MTC_MON_t;
  signal ucm_ctrl_r            : UCM_CTRL_t;
  signal ucm_mon_r             : UCM_MON_t;
  signal daq_ctrl_r            : DAQ_CTRL_t;
  signal daq_mon_r             : DAQ_MON_t;
  signal tf_ctrl_r             : TF_CTRL_t;
  signal tf_mon_r              : TF_MON_t;
  signal mpl_ctrl_r            : MPL_CTRL_t;
  signal mpl_mon_r             : MPL_MON_t;
  signal fm_ctrl_r             : FM_CTRL_t;
  signal fm_mon_r              : FM_MON_t;

  signal hps_inn_ctrl_v        : std_logic_vector(HPS_CTRL_t'w -1 downto 0); -- : in  H2S_CTRL_t;
  signal hps_inn_mon_v         : std_logic_vector(HPS_MON_t'w -1 downto 0);--  : out H2S_MON_t;
  signal hps_mid_ctrl_v        : std_logic_vector(HPS_CTRL_t'w -1 downto 0); -- : in  H2S_CTRL_t;
  signal hps_mid_mon_v         : std_logic_vector(HPS_MON_t'w -1 downto 0);--  : out H2S_MON_t;
  signal hps_out_ctrl_v        : std_logic_vector(HPS_CTRL_t'w -1 downto 0); -- : in  H2S_CTRL_t;
  signal hps_out_mon_v         : std_logic_vector(HPS_MON_t'w -1 downto 0);--  : out H2S_MON_t;
  signal hps_ext_ctrl_v        : std_logic_vector(HPS_CTRL_t'w -1 downto 0); -- : in  H2S_CTRL_t;
  signal hps_ext_mon_v         : std_logic_vector(HPS_MON_t'w -1 downto 0);--  : out H2S_MON_t;
  
  signal tar_inn_ctrl_v        : std_logic_vector(TAR_CTRL_t'w -1 downto 0);
  signal tar_inn_mon_v         : std_logic_vector(TAR_MON_t'w -1 downto 0);
  signal tar_mid_ctrl_v        : std_logic_vector(TAR_CTRL_t'w -1 downto 0);
  signal tar_mid_mon_v         : std_logic_vector(TAR_MON_t'w -1 downto 0);
  signal tar_out_ctrl_v        : std_logic_vector(TAR_CTRL_t'w -1 downto 0);
  signal tar_out_mon_v         : std_logic_vector(TAR_MON_t'w -1 downto 0);
  signal tar_ext_ctrl_v        : std_logic_vector(TAR_CTRL_t'w -1 downto 0);
  signal tar_ext_mon_v         : std_logic_vector(TAR_MON_t'w -1 downto 0);

  signal mtc_ctrl_v            : std_logic_vector(MTC_CTRL_t'w -1 downto 0);
  signal mtc_mon_v             : std_logic_vector(MTC_MON_t'w -1 downto 0);

  signal ucm_ctrl_v            : std_logic_vector(UCM_CTRL_t'w -1 downto 0);
  signal ucm_mon_v             : std_logic_vector(UCM_MON_t'w -1 downto 0);
  
  signal daq_ctrl_v            : std_logic_vector(DAQ_CTRL_t'w -1 downto 0);
  signal daq_mon_v             : std_logic_vector(DAQ_MON_t'w -1 downto 0);
  
  signal tf_ctrl_v             : std_logic_vector(TF_CTRL_t'w -1 downto 0);
  signal tf_mon_v              : std_logic_vector(TF_MON_t'w -1 downto 0);
  
  signal mpl_ctrl_v            : std_logic_vector(MPL_CTRL_t'w -1 downto 0);
  signal mpl_mon_v             : std_logic_vector(MPL_MON_t'w -1 downto 0);
  
  signal fm_ctrl_v             : std_logic_vector(FM_CTRL_t'w -1 downto 0);
  signal fm_mon_v              : std_logic_vector(FM_MON_t'w -1 downto 0);

  -- signal o_daq_streams     : felix_stream_avt (c_DAQ_LINKS - 1 downto 0);
  signal daq_stream_data_v : std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(31 downto 0);
  signal daq_stream_ctrl_v : std_logic_vector_array(c_DAQ_LINKS-1 downto 0)( 1 downto 0);
  signal daq_stream_wren_v : std_logic_vector(c_DAQ_LINKS-1 downto 0);

  signal o_plus_neighbor_segments  : sf2ptcalc_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
  signal o_minus_neighbor_segments : sf2ptcalc_avt(c_NUM_SF_OUTPUTS - 1 downto 0);

  signal o_MTC : mtc_out_avt(c_NUM_MTC-1 downto 0);
  signal o_NSP : mtc2nsp_avt(c_NUM_NSP-1 downto 0);

  signal slc_file_ok      : std_logic;
  signal slc_file_ts      : string(1 to LINE_LENGTH_MAX);
  signal mdt_file_ok      : std_logic;
  signal mdt_file_ts      : string(1 to LINE_LENGTH_MAX);

  signal slc_event_ai     : event_xaut(c_MAX_NUM_SL -1 downto 0);
  signal hit_mdt_event_ai     : event_tdc_aut := (others => (others => (others => '0')));
  signal hit_slc_event_ai     : event_tdc_aut := (others => (others => (others => '0')));

  signal sump : std_logic;
  signal axi_reset_n       : std_logic := '0';


begin
  
  ULT : entity ult_lib.ult
  generic map(
    DUMMY       => DUMMY
    )
  port map(
    -- pipeline clock
    clock_and_control => clock_and_control,
    ttc_commands      => ttc_commands,


    --reset from AXI
    axi_reset_n       => axi_reset_n,

    -- TDC Hits from Polmux
    i_inn_tdc_hits_av => i_mdt_tdc_inn_av,
    i_mid_tdc_hits_av => i_mdt_tdc_mid_av,
    i_out_tdc_hits_av => i_mdt_tdc_out_av,
    i_ext_tdc_hits_av => i_mdt_tdc_ext_av,

    -- TAR Hits for simulation
    -- i_inner_tar_hits  => i_inner_tar_hits,
    -- i_middle_tar_hits => i_middle_tar_hits,
    -- i_outer_tar_hits  => i_outer_tar_hits,
    -- i_extra_tar_hits  => i_extra_tar_hits,

    -- Sector Logic Candidates
    i_main_primary_slc   => i_main_primary_slc,
    i_main_secondary_slc => i_main_secondary_slc,
    i_plus_neighbor_slc  => i_plus_neighbor_slc,
    i_minus_neighbor_slc => i_minus_neighbor_slc,

    -- Segments in from neighbor
    i_plus_neighbor_segments  => i_plus_neighbor_segments,
    i_minus_neighbor_segments => i_minus_neighbor_segments,

    -- ULT Control

    hps_inn_ctrl_v => hps_inn_ctrl_v ,
    hps_inn_mon_v  => hps_inn_mon_v  ,
    hps_mid_ctrl_v => hps_mid_ctrl_v ,
    hps_mid_mon_v  => hps_mid_mon_v  ,
    hps_out_ctrl_v => hps_out_ctrl_v ,
    hps_out_mon_v  => hps_out_mon_v  ,
    hps_ext_ctrl_v => hps_ext_ctrl_v ,
    hps_ext_mon_v  => hps_ext_mon_v  ,
    tar_inn_ctrl_v => tar_inn_ctrl_v,
    tar_inn_mon_v  => tar_inn_mon_v ,
    tar_mid_ctrl_v => tar_mid_ctrl_v,
    tar_mid_mon_v  => tar_mid_mon_v ,
    tar_out_ctrl_v => tar_out_ctrl_v,
    tar_out_mon_v  => tar_out_mon_v ,
    tar_ext_ctrl_v => tar_ext_ctrl_v,
    tar_ext_mon_v  => tar_ext_mon_v ,
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
    fm_ctrl_v  => fm_ctrl_v,
    fm_mon_v   => fm_mon_v,

    
    -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
    -- o_daq_streams => o_daq_streams,
    daq_stream_data_vo => daq_stream_data_v, -- : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(31 downto 0);
    daq_stream_ctrl_vo => daq_stream_ctrl_v, -- : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)( 1 downto 0);
    daq_stream_wren_vo => daq_stream_wren_v, -- : out std_logic_vector(c_DAQ_LINKS-1 downto 0);
    

    -- Segments Out to Neighbor
    o_plus_neighbor_segments_av  => o_plus_neighbor_segments,
    o_minus_neighbor_segments_av => o_minus_neighbor_segments,

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
	-- clock Sim Generator
	-------------------------------------------------------------------------------------
  CLK_SIM : process begin
    clk_sim_time <= '0';
    wait for clk_sim_time_period/2;
    clk_sim_time <= '1';
    wait for clk_sim_time_period/2;
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
  -- clk <= clk;
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
  -- rst <= rst;
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
	-- Test Bench sim time
  -------------------------------------------------------------------------------------
  ToA_sim: process(clk_sim_time) begin
    if rising_edge(clk_sim_time) then
      tb_curr_sim_time <= tb_curr_sim_time + '1';
    end if;
  end process;

  -------------------------------------------------------------------------------------
	-- CSV
  -------------------------------------------------------------------------------------
  CSV_SLC : if c_UCM_ENABLED generate
    CSV_SLC_IN : entity shared_lib.csv_reader_slc 
      generic map (
        IN_SLC_FILE => IN_SLC_FILE,
        g_verbose => 2
      )
      port map(
        clk               => clk,
        rst               => rst,
        enable            => glob_en,
        --
        tb_curr_tdc_time  => tb_curr_tdc_time,
        --
        o_file_ok         => slc_file_ok,
        o_file_ts         => slc_file_ts, 
        --
        o_slc_event_ai        => slc_event_ai,
        --
        o_main_primary_slc    => i_main_primary_slc,
        o_main_secondary_slc  => i_main_secondary_slc,
        o_plus_neighbor_slc   => i_plus_neighbor_slc,
        o_minus_neighbor_slc  => i_minus_neighbor_slc

      );
      end generate;

  -------------------------------------------------------------------------------------
	-- MDT IN
  -------------------------------------------------------------------------------------
  CAS_TAR : if c_TAR_ENABLED generate
    MDT : entity shared_lib.csv_reader_mdt 
    generic map (
      IN_HIT_FILE => IN_HIT_FILE,
      g_verbose => 2
    )
    port map(
      clk               => clk,
      rst               => rst,
      enable            => glob_en,
      --
      tb_curr_sim_time  => tb_curr_sim_time,
      tb_curr_tdc_time  => tb_curr_tdc_time,
      --
      o_file_ok         => mdt_file_ok,
      o_file_ts         => mdt_file_ts, 
      --
      o_mdt_event_ai    => hit_mdt_event_ai,
      o_slc_event_ai    => hit_slc_event_ai,
      -- TAR Hits for simulation
      o_mdt_tdc_inn_av  => i_mdt_tdc_inn_av,
      o_mdt_tdc_mid_av  => i_mdt_tdc_mid_av,
      o_mdt_tdc_out_av  => i_mdt_tdc_out_av,
      o_mdt_tdc_ext_av  => i_mdt_tdc_ext_av
    );
  end generate;

  
  
end architecture beh;
