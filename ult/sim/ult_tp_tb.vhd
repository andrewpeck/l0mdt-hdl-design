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
  signal ucm_ctrl :  UCM_CTRL_t;
  signal ucm_mon  :  UCM_MON_t;
  signal daq_ctrl :  DAQ_CTRL_t;
  signal daq_mon  :  DAQ_MON_t;
  signal tf_ctrl  :  TF_CTRL_t;
  signal tf_mon   :  TF_MON_t;
  signal mpl_ctrl :  MPL_CTRL_t;
  signal mpl_mon  :  MPL_MON_t;

  -- TDC Hits from Polmux
  signal i_inner_tdc_hits  :  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => (others => '0'));
  signal i_middle_tdc_hits :  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => (others => '0'));
  signal i_outer_tdc_hits  :  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => (others => '0'));
  signal i_extra_tdc_hits  :  mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => (others => '0'));

  -- TDC Hits from Tar
  signal i_mdt_tar_inn_av :  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tar_mid_av :  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tar_out_av :  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => (others => '0'));
  signal i_mdt_tar_ext_av :  tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => (others => '0'));

  -- Sector Logic Candidates
  signal i_main_primary_slc        : slc_rx_bus_avt(2 downto 0) := (others => (others => '0'));  -- is the main SL used
  signal i_main_secondary_slc      : slc_rx_bus_avt(2 downto 0) := (others => (others => '0'));  -- only used in the big endcap
  signal i_plus_neighbor_slc       : slc_rx_rvt := (others => '0');
  signal i_minus_neighbor_slc      : slc_rx_rvt := (others => '0');
  -- Segments in from neighbor
  signal plus_neighbor_segments_i  : sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0) := (others => (others => '0'));
  signal minus_neighbor_segments_i : sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0) := (others => (others => '0'));

  -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
  signal daq_streams_o :  felix_stream_bus_avt (c_NUM_DAQ_STREAMS-1 downto 0) := (others => (others => '0'));

  -- Segments Out to Neighbor
  signal plus_neighbor_segments_o  :  sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0) := (others => (others => '0'));
  signal minus_neighbor_segments_o :  sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0) := (others => (others => '0'));

  -- MUCTPI
  signal MTC_o :  mtc_out_bus_avt(c_NUM_MTC-1 downto 0);
  signal NSP_o :  mtc2nsp_bus_avt(c_NUM_NSP-1 downto 0);

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

  -- -- TDC Hits from Tar
  -- signal i_mdt_tar_inn_ar :  tar2hps_bus_at (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
  -- signal i_mdt_tar_mid_ar :  tar2hps_bus_at (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
  -- signal i_mdt_tar_out_ar :  tar2hps_bus_at (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  -- signal i_mdt_tar_ext_ar :  tar2hps_bus_at (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);

  -- -- Sector Logic Candidates
  -- signal i_main_primary_slc_ar      : slc_rx_bus_at(2 downto 0);  -- is the main SL used
  -- signal i_main_secondary_slc_ar    : slc_rx_bus_at(2 downto 0);  -- only used in the big endcap
  -- signal i_plus_neighbor_slc_ar     : slc_rx_rt;
  -- signal i_minus_neighbor_slc_ar    : slc_rx_rt;
  ---------------------------------------------------------------------------
  -- simulation signals
  ---------------------------------------------------------------------------


  -- type infifo_slc_counts is array (integer range <>) of integer;

  -- type infifo_slc_mem_at is array (integer range <>) of slc_tb_at;

  -- signal slc_element          : slc_tb_at := structify(std_logic_vector(to_unsigned(0,SLC_RX_LEN * TB_SLC_FIFO_WIDTH)));

  -- signal slc_event_r          : input_slc_b_rt;
  -- signal slc_new_event        : input_slc_b_rt;

  -- signal slc_main_prim_fifo   : infifo_slc_mem_at(2 downto 0) := (others => nullify(slc_element));
  -- signal slc_main_seco_fifo   : infifo_slc_mem_at(2 downto 0) := (others => nullify(slc_element));
  -- signal slc_neig_plus_fifo   : infifo_slc_mem_at(0 downto 0) := (others => nullify(slc_element));
  -- signal slc_neig_minu_fifo   : infifo_slc_mem_at(0 downto 0) := (others => nullify(slc_element));

  -- signal slc_main_prim_counts : infifo_slc_counts(2 downto 0) := (others => 0);
  -- signal slc_main_seco_counts : infifo_slc_counts(2 downto 0) := (others => 0);
  -- signal slc_neig_plus_counts : infifo_slc_counts(0 downto 0) := (others => 0);
  -- signal slc_neig_minu_counts : infifo_slc_counts(0 downto 0) := (others => 0);
  -- --------------------------------------------------------------------------
  -- simulation signals
  ---------------------------------------------------------------------------

  -- type tar2hps_tb_at is array(TB_TAR_FIFO_WIDTH-1 downto 0) of tar2hps_rt;
  -- signal line_Example : string;
  -- signal mdt_tar_station  : tar2hps_tb_at;
  

  -- input fifos
  -- signal tar_base : tar2hps_rt;
  -- constant INFIFO_WIDTH : integer := 32;
  -- type infifo_hit_counts is array (integer range <>) of integer;

  -- type infifo_hit_mem_at is array (integer range <>) of tar2hps_tb_at;

  -- signal mdt_tar_event_r  : input_tar_rt;
  -- signal mdt_new_event    : input_tar_rt;

  -- signal mdt_inn_fifo   : infifo_hit_mem_at(c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => nullify(mdt_tar_station));
  -- signal mdt_mid_fifo   : infifo_hit_mem_at(c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => nullify(mdt_tar_station));
  -- signal mdt_out_fifo   : infifo_hit_mem_at(c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => nullify(mdt_tar_station));
  -- signal mdt_ext_fifo   : infifo_hit_mem_at(c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => nullify(mdt_tar_station));

  -- signal mdt_inn_counts : infifo_hit_counts(c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => 0);
  -- signal mdt_mid_counts : infifo_hit_counts(c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => 0);
  -- signal mdt_out_counts : infifo_hit_counts(c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => 0);
  -- signal mdt_ext_counts : infifo_hit_counts(c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => 0);

  ---------------------------------------------------------------------------
  -- simulation output aliases
  ---------------------------------------------------------------------------

  -- alias heg2sf_inn_slc_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_inn.HPS.heg2sfslc_av : heg2sfslc_bus_avt >>;
  -- alias heg2sf_inn_hit_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_inn.HPS.heg2sfhit_av : heg2sfhit_bus_avt >>;
  -- alias heg2sf_mid_slc_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_mid.HPS.heg2sfslc_av : heg2sfslc_bus_avt >>;
  -- alias heg2sf_mid_hit_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_mid.HPS.heg2sfhit_av : heg2sfhit_bus_avt >>;
  -- alias heg2sf_out_slc_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_out.HPS.heg2sfslc_av : heg2sfslc_bus_avt >>;
  -- alias heg2sf_out_hit_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_out.HPS.heg2sfhit_av : heg2sfhit_bus_avt >>;
  -- alias heg2sf_inn_slc_av is << signal.Compactor_tb.CompactorDUT.UT_DP_TOP.OutputFifoWreq : heg2sfslc_bus_avt >>;
  -- alias heg2sf_inn_hit_av is << signal.Compactor_tb.CompactorDUT.UT_DP_TOP.OutputFifoWreq : heg2sfhit_bus_avt >>;

  signal dummy_hit : out_heg_bm_hit_sim_rt;
  signal fummy_slc : out_heg_bm_slc_sim_rt;

  -- signal read_slc : heg2sfslc_rt;
  -- signal read_hit : heg2sfhit_rt;

  -- constant OUTPUT_FIFO_LEN : integer := 128;
  -- type heg2sf_rt is record
  --   typ : std_logic; --0 : slc ; 1 : hit
  --   slc : out_heg_bm_slc_sim_rt;
  --   hit : out_heg_bm_hit_sim_rt;
  -- end record;
  -- type heg2sf_hits_fifo_at is array (integer range <>) of heg2sf_rt;
  -- signal heg2sf_hits_fifo : heg2sf_hits_fifo_at(OUTPUT_FIFO_LEN -1 downto 0);

  -- signal heg2sf_counter : integer;

  -- signal 


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
	-- candidates
  -------------------------------------------------------------------------------------
  -- SLC_READ: process ( rst, clk)

  --   -- file input_slc_file         : text open read_mode is "/mnt/d/L0MDT/dev/hdl/l0mdt-fpga-design/shared/sim/vhdl_input_vect/slc_TB_A3_Barrel.txt";
  --   file input_slc_file         : text open read_mode is IN_SLC_FILE;
  --   variable row                : line;
  --   variable row_counter        : integer := 0;
  --   -- variable tdc_time           : UNSIG_64;
  --   variable v_slc_event        : input_slc_b_rt;
  --   -- variable next_event_time    : integer := 0;
  --   -- variable tb_time            : integer := 0;
  --   variable first_read         : std_logic := '1';

  --   variable v_slc_main_prim_counts : infifo_slc_counts(3 -1 downto 0) := (others => 0);
  --   variable v_slc_main_seco_counts : infifo_slc_counts(3 -1 downto 0) := (others => 0);
  --   variable v_slc_neig_plus_counts : infifo_slc_counts(1 -1 downto 0) := (others => 0);
  --   variable v_slc_neig_minu_counts : infifo_slc_counts(1 -1 downto 0) := (others => 0);

  -- begin

  --   if rising_edge(clk) then
  --     if rst = '1' then

  --     else

  --       if enable_slc = 1 then

  --         -- write to DUT

  --         for wr_i in 2 downto 0 loop
  --           if(v_slc_main_prim_counts(wr_i) > 0) then
  --             i_main_primary_slc(wr_i) <= vectorify(slc_main_prim_fifo(wr_i)(0));
  --             -- for test input read
  --             i_main_primary_slc_ar(wr_i) <= slc_main_prim_fifo(wr_i)(0);
  --             --
  --             for mv_i in TB_SLC_FIFO_WIDTH -1 downto 1 loop
  --               slc_main_prim_fifo(wr_i)(mv_i - 1) <= slc_main_prim_fifo(wr_i)(mv_i);
  --             end loop;
  --             v_slc_main_prim_counts(wr_i) := v_slc_main_prim_counts(wr_i) - 1;
  --           else
  --             i_main_primary_slc(wr_i) <= nullify(i_main_primary_slc(wr_i));
  --             i_main_primary_slc_ar(wr_i) <= nullify(i_main_primary_slc_ar(wr_i));
  --           end if;
  --         end loop;

  --         -- read from file
  --         -- first read from input vector file
  --         if (not endfile(input_slc_file)) and first_read = '1' then
  --           row_counter := row_counter +1;
  --           readline(input_slc_file,row); -- reads header and ignores
  --           readline(input_slc_file,row);
  --           read(row, v_slc_event);
  --           slc_event_r <= v_slc_event;
  --           report "Read line : " & integer'image(row_counter);
  --           first_read := '0';
  --         end if;

  --         -- read from input vector file
  --         RL : while true loop
  --           if (v_slc_event.ToA < tb_curr_tdc_time) then
  --             -- i_mdt_tar_av <= mdt_tar_event_r.tar;
  --             if (endfile(input_slc_file) = false) then

  --               if v_slc_event.slc.common.slcid < 3 then
  --                 slc_main_prim_fifo(2 - to_integer(v_slc_event.slc.common.slcid))(v_slc_main_prim_counts(2 - to_integer(v_slc_event.slc.common.slcid))) <= v_slc_event.slc;
  --                 v_slc_main_prim_counts(2 - to_integer(v_slc_event.slc.common.slcid)) := v_slc_main_prim_counts(2 - to_integer(v_slc_event.slc.common.slcid)) + 1;
  --               end if;

  --               row_counter := row_counter +1;
  --               readline(input_slc_file,row);
  --               read(row, v_slc_event);
  --               slc_event_r <= v_slc_event;
  --               report "Read line : " & integer'image(row_counter);
  --             else
  --               exit;
  --             end if;
  --           else
  --             -- i_mdt_tar_av <= nullify(i_mdt_tar_av);
  --             exit;
  --           end if;
  --         end loop;

  --       end if;

  --     end if;
  --   end if;

  -- end process;
  -------------------------------------------------------------------------------------
	-- hits
  -------------------------------------------------------------------------------------

  -- HIT_READ: process ( rst, clk)

  --   -- file input_mdt_tar_file       : text open read_mode is "/mnt/d/L0MDT/dev/hdl/l0mdt-fpga-design/shared/sim/vhdl_input_vect/csm_TB_A3_Barrel.txt";
  --   file input_mdt_tar_file       : text open read_mode is IN_HIT_FILE;
  --   variable row                  : line;
  --   variable row_counter          : integer := 0;

  --   -- variable tdc_time             : UNSIG_64;
  --   variable v_mdt_event            : input_tar_rt;

  --   variable next_event_time      : integer := 0;
  --   variable tb_time              : integer := 0;

  --   variable first_read           : std_logic := '1';

  --   variable v_mdt_inn_counts     : infifo_hit_counts(c_HPS_NUM_MDT_CH_INN -1 downto 0) := (others => 0);
  --   variable v_mdt_mid_counts     : infifo_hit_counts(c_HPS_NUM_MDT_CH_MID -1 downto 0) := (others => 0);
  --   variable v_mdt_out_counts     : infifo_hit_counts(c_HPS_NUM_MDT_CH_OUT -1 downto 0) := (others => 0);
  --   variable v_mdt_ext_counts     : infifo_hit_counts(c_HPS_NUM_MDT_CH_EXT -1 downto 0) := (others => 0);

  -- begin

  --   -- tb_curr_time <= tb_time;

  --   if rising_edge(clk) then
  --     if(rst= '1') then

  --     else

  --       if enable_mdt = 1 then
  --       -- write to DUT

  --         for wr_i in c_HPS_NUM_MDT_CH_INN -1 downto 0 loop
  --           if(v_mdt_inn_counts(wr_i) > 0) then
  --             i_mdt_tar_inn_av(wr_i) <= vectorify(mdt_inn_fifo(wr_i)(0));
  --             -- for test input read
  --             i_mdt_tar_inn_ar(wr_i) <= mdt_inn_fifo(wr_i)(0);
  --             --
  --             for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
  --               mdt_inn_fifo(wr_i)(mv_i - 1) <= mdt_inn_fifo(wr_i)(mv_i);
  --             end loop;
  --             v_mdt_inn_counts(wr_i) := v_mdt_inn_counts(wr_i) - 1;
  --           else
  --             i_mdt_tar_inn_av(wr_i) <= nullify(i_mdt_tar_inn_av(wr_i));
  --             i_mdt_tar_inn_ar(wr_i) <= nullify(i_mdt_tar_inn_ar(wr_i));
  --           end if;
  --         end loop;

  --         for wr_i in c_HPS_NUM_MDT_CH_MID -1 downto 0 loop
  --           if(v_mdt_mid_counts(wr_i) > 0) then
  --             i_mdt_tar_mid_av(wr_i) <= vectorify(mdt_mid_fifo(wr_i)(0));
  --             -- for test input read
  --             i_mdt_tar_mid_ar(wr_i) <= mdt_mid_fifo(wr_i)(0);
  --             --
  --             for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
  --               mdt_mid_fifo(wr_i)(mv_i - 1) <= mdt_mid_fifo(wr_i)(mv_i);
  --             end loop;
  --             v_mdt_mid_counts(wr_i) := v_mdt_mid_counts(wr_i) - 1;
  --           else
  --             i_mdt_tar_mid_av(wr_i) <= nullify(i_mdt_tar_mid_av(wr_i));
  --             i_mdt_tar_mid_ar(wr_i) <= nullify(i_mdt_tar_mid_ar(wr_i));
  --           end if;
  --         end loop;

  --         for wr_i in c_HPS_NUM_MDT_CH_OUT -1 downto 0 loop
  --           if(v_mdt_out_counts(wr_i) > 0) then
  --             i_mdt_tar_out_av(wr_i) <= vectorify(mdt_out_fifo(wr_i)(0));
  --             -- for test input read
  --             i_mdt_tar_out_ar(wr_i) <= mdt_out_fifo(wr_i)(0);
  --             --
  --             for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
  --               mdt_out_fifo(wr_i)(mv_i - 1) <= mdt_out_fifo(wr_i)(mv_i);
  --             end loop;
  --             v_mdt_out_counts(wr_i) := v_mdt_out_counts(wr_i) - 1;
  --           else
  --             i_mdt_tar_out_av(wr_i) <= nullify(i_mdt_tar_out_av(wr_i));
  --             i_mdt_tar_out_ar(wr_i) <= nullify(i_mdt_tar_out_ar(wr_i));
  --           end if;
  --         end loop;

  --         for wr_i in c_HPS_NUM_MDT_CH_EXT -1 downto 0 loop
  --           if(v_mdt_ext_counts(wr_i) > 0) then
  --             i_mdt_tar_ext_av(wr_i) <= vectorify(mdt_ext_fifo(wr_i)(0));
  --             -- for test input read
  --             i_mdt_tar_ext_ar(wr_i) <= mdt_ext_fifo(wr_i)(0);
  --             --
  --             for mv_i in TB_TAR_FIFO_WIDTH -1 downto 1 loop
  --               mdt_ext_fifo(wr_i)(mv_i - 1) <= mdt_ext_fifo(wr_i)(mv_i);
  --             end loop;
  --             v_mdt_ext_counts(wr_i) := v_mdt_ext_counts(wr_i) - 1;
  --           else
  --             i_mdt_tar_ext_av(wr_i) <= nullify(i_mdt_tar_ext_av(wr_i));
  --             i_mdt_tar_ext_ar(wr_i) <= nullify(i_mdt_tar_ext_ar(wr_i));
  --           end if;
  --         end loop;

  --         -- first read from input vector file
  --         if (not endfile(input_mdt_tar_file)) and first_read = '1' then
  --           row_counter := row_counter +1;
  --           readline(input_mdt_tar_file,row); -- reads header and ignores
  --           readline(input_mdt_tar_file,row);
  --           read(row, v_mdt_event);
  --           mdt_tar_event_r <= v_mdt_event;
  --           report "Read line : " & integer'image(row_counter);
  --           first_read := '0';
  --         end if;

  --         -- read from input vector file
  --         RL : while true loop
  --           if (v_mdt_event.ToA < tb_curr_tdc_time) then
  --             -- i_mdt_tar_av <= mdt_tar_event_r.tar;
  --             if (endfile(input_mdt_tar_file) = false) then

  --               if to_integer(v_mdt_event.station) = 0 then
  --                 mdt_inn_fifo(to_integer(v_mdt_event.chamber) )(v_mdt_inn_counts(to_integer(v_mdt_event.chamber) )) <= v_mdt_event.tar;
  --                 v_mdt_inn_counts(to_integer(v_mdt_event.chamber) ) := v_mdt_inn_counts(to_integer(v_mdt_event.chamber) ) + 1;
  --               elsif to_integer(v_mdt_event.station) = 1 then
  --                 mdt_mid_fifo(to_integer(v_mdt_event.chamber) )(v_mdt_mid_counts(to_integer(v_mdt_event.chamber) )) <= v_mdt_event.tar;
  --                 v_mdt_mid_counts(to_integer(v_mdt_event.chamber) ) := v_mdt_mid_counts(to_integer(v_mdt_event.chamber) ) + 1;
  --               elsif to_integer(v_mdt_event.station) = 2 then
  --                 mdt_out_fifo(to_integer(v_mdt_event.chamber) )(v_mdt_out_counts(to_integer(v_mdt_event.chamber) )) <= v_mdt_event.tar;
  --                 v_mdt_out_counts(to_integer(v_mdt_event.chamber) ) := v_mdt_out_counts(to_integer(v_mdt_event.chamber) ) + 1;
  --               elsif to_integer(v_mdt_event.station) = 3 then
  --                 mdt_ext_fifo(to_integer(v_mdt_event.chamber) )(v_mdt_ext_counts(to_integer(v_mdt_event.chamber) )) <= v_mdt_event.tar;
  --                 v_mdt_ext_counts(to_integer(v_mdt_event.chamber) ) := v_mdt_ext_counts(to_integer(v_mdt_event.chamber) ) + 1;
  --               else
  --                 -- ERROR
  --               end if;
  --               row_counter := row_counter +1;
  --               readline(input_mdt_tar_file,row);
  --               read(row, v_mdt_event);
  --               mdt_tar_event_r <= v_mdt_event;
  --               report "Read line : " & integer'image(row_counter);
  --             else
  --               exit;
  --             end if;
  --           else
  --             -- i_mdt_tar_av <= nullify(i_mdt_tar_av);
  --             exit;
  --           end if;
  --         end loop;





  --       end if;

  --       mdt_inn_counts <= v_mdt_inn_counts;
  --       mdt_mid_counts <= v_mdt_mid_counts;
  --       mdt_out_counts <= v_mdt_out_counts;
  --       mdt_ext_counts <= v_mdt_ext_counts;



  --       -- tb_curr_time <= tb_curr_time + '1';
  --     end if;
  --   end if;

  -- end process;

  -------------------------------------------------------------------------------------
	-- Output HEG BM
  -------------------------------------------------------------------------------------

  HEG_BM: process(clk)

    file file_slc_handler : text open write_mode is OUT_HEG_BM_SLC_FILE;
    file file_hit_handler : text open write_mode is OUT_HEG_BM_HIT_FILE;

    variable row 		: line;

    -- o_sf_control_v

    alias heg2sf_inn_slc_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_inn.HPS.heg2sfslc_av : heg2sfslc_bus_avt >>;
    alias heg2sf_inn_hit_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_inn.HPS.heg2sfhit_av : heg2sfhit_bus_avt >>;
    alias heg2sf_inn_ctrl_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_inn.HPS.heg2sf_ctrl_av : hps_ctrl2sf_avt >>;

    alias heg2sf_mid_slc_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_mid.HPS.heg2sfslc_av : heg2sfslc_bus_avt >>;
    alias heg2sf_mid_hit_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_mid.HPS.heg2sfhit_av : heg2sfhit_bus_avt >>;
    alias heg2sf_mid_ctrl_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_mid.HPS.heg2sf_ctrl_av : hps_ctrl2sf_avt >>;

    alias heg2sf_out_slc_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_out.HPS.heg2sfslc_av : heg2sfslc_bus_avt >>;
    alias heg2sf_out_hit_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_out.HPS.heg2sfhit_av : heg2sfhit_bus_avt >>;
    alias heg2sf_out_ctrl_av is << signal.ult_tp.ULT.logic_gen.H2S.h2s_gen.hps_out.HPS.heg2sf_ctrl_av : hps_ctrl2sf_avt >>;
    -- heg2sf_ctrl_av : hps_ctrl2sf_avt

    -- variable fifo_mem_v : heg2sf_hits_fifo_at(OUTPUT_FIFO_LEN -1 downto 0);
    variable fifo_count : integer := 0;

    variable hit2write : out_heg_bm_hit_sim_rt;
    variable slc2write : out_heg_bm_slc_sim_rt;
    variable ctrl2write : out_heg_bm_ctrl_sim_rt;

    variable read_ctrl  : heg_ctrl2sf_rt;
    variable read_slc   : heg2sfslc_rt;
    variable read_hit   : heg2sfhit_rt;

    variable header2write : std_logic := '0';

  begin
    if rising_edge(clk) then
      if rst = '1' then
            
      else

        if header2write = '0' then
          SWRITE(row, "#----------------------------------------");
          writeline(file_slc_handler,row);
          SWRITE(row, "# Output : HEG buffer mux");
          writeline(file_slc_handler,row);
          SWRITE(row, "# BUS : heg2sfslc_rt ");
          writeline(file_slc_handler,row);
          SWRITE(row, "# IN_SLC_FILE : " & IN_SLC_FILE);
          writeline(file_slc_handler,row);
          SWRITE(row, "# IN_HIT_FILE : " & IN_HIT_FILE);
          writeline(file_slc_handler,row);
          SWRITE(row, "#----------------------------------------");
          writeline(file_slc_handler,row);
          WRITEHEADER(row,slc2write);
          writeline(file_slc_handler,row);
          ----------------------------------------
          SWRITE(row, "#----------------------------------------");
          writeline(file_hit_handler,row);
          SWRITE(row, "# Output : HEG buffer mux");
          writeline(file_hit_handler,row);
          SWRITE(row, "# BUS : heg2sfhit_rt ");
          writeline(file_hit_handler,row);
          SWRITE(row, "# IN_SLC_FILE : " & IN_SLC_FILE);
          writeline(file_hit_handler,row);
          SWRITE(row, "# IN_HIT_FILE : " & IN_HIT_FILE);
          writeline(file_hit_handler,row);
          SWRITE(row, "#----------------------------------------");
          writeline(file_hit_handler,row);
          WRITEHEADER(row,hit2write);
          writeline(file_hit_handler,row);
          header2write := '1';
        end if;

        fifo_count := 0;

        -------------------------------------------------------------------
        -- new SLC
        -------------------------------------------------------------------

        if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
          for heg_i in c_NUM_THREADS -1 downto 0 loop
            read_slc := structify(heg2sf_inn_slc_av(heg_i));
            if read_slc.data_valid = '1' then

              slc2write.ToA      := tb_curr_tdc_time;
              slc2write.station  := to_unsigned(0,4);
              slc2write.thread   := to_unsigned(heg_i,4);
              slc2write.data   := read_slc;
              write(row,slc2write);
              writeline(file_slc_handler,row);

            end if;
          end loop;
        end if;
        if c_STATIONS_IN_SECTOR(1) = '1' then -- MID
          for heg_i in c_NUM_THREADS -1 downto 0 loop
            read_slc := structify(heg2sf_mid_slc_av(heg_i));
            if read_slc.data_valid = '1' then

              slc2write.ToA      := tb_curr_tdc_time;
              slc2write.station  := to_unsigned(1,4);
              slc2write.thread   := to_unsigned(heg_i,4);
              slc2write.data   := read_slc;
              write(row,slc2write);
              writeline(file_slc_handler,row);

            end if;
          end loop;
        end if;
        if c_STATIONS_IN_SECTOR(2) = '1' then -- OUT
          for heg_i in c_NUM_THREADS -1 downto 0 loop
            read_slc := structify(heg2sf_out_slc_av(heg_i));
            if read_slc.data_valid = '1' then

              slc2write.ToA      := tb_curr_tdc_time;
              slc2write.station  := to_unsigned(2,4);
              slc2write.thread   := to_unsigned(heg_i,4);
              slc2write.data   := read_slc;
              write(row,slc2write);
              writeline(file_slc_handler,row);

            end if;
          end loop;
        end if;

        -------------------------------------------------------------------
        -- end SLC
        -------------------------------------------------------------------

        if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
          for heg_i in c_NUM_THREADS -1 downto 0 loop
            read_ctrl := structify(heg2sf_inn_ctrl_av(heg_i));
            -- read_slc := structify(heg2sf_inn_slc_av(heg_i));
            if read_ctrl.eof = '1' then
              read_slc := structify(heg2sf_inn_slc_av(heg_i));
              ctrl2write.ToA      := tb_curr_tdc_time;
              ctrl2write.station  := to_unsigned(0,4);
              ctrl2write.thread   := to_unsigned(heg_i,4);
              ctrl2write.HEG_ctrl := read_ctrl;
              ctrl2write.data    := read_slc;
              write(row,ctrl2write);
              writeline(file_slc_handler,row);

            end if;
          end loop;
        end if;
        if c_STATIONS_IN_SECTOR(1) = '1' then -- MID
          for heg_i in c_NUM_THREADS -1 downto 0 loop
            read_ctrl := structify(heg2sf_mid_ctrl_av(heg_i));
            -- read_slc := structify(heg2sf_mid_slc_av(heg_i));
            if read_ctrl.eof = '1' then
              read_slc := structify(heg2sf_mid_slc_av(heg_i));
              ctrl2write.ToA      := tb_curr_tdc_time;
              ctrl2write.station  := to_unsigned(0,4);
              ctrl2write.thread   := to_unsigned(heg_i,4);
              ctrl2write.HEG_ctrl := read_ctrl;
              ctrl2write.data    := read_slc;
              write(row,ctrl2write);
              writeline(file_slc_handler,row);

            end if;
          end loop;
        end if;
        if c_STATIONS_IN_SECTOR(2) = '1' then -- OUT
          for heg_i in c_NUM_THREADS -1 downto 0 loop
            read_ctrl := structify(heg2sf_out_ctrl_av(heg_i));
            -- read_slc := structify(heg2sf_out_slc_av(heg_i));
            if read_ctrl.eof = '1' then
              read_slc := structify(heg2sf_out_slc_av(heg_i));
              ctrl2write.ToA      := tb_curr_tdc_time;
              ctrl2write.station  := to_unsigned(0,4);
              ctrl2write.thread   := to_unsigned(heg_i,4);
              ctrl2write.HEG_ctrl := read_ctrl;
              ctrl2write.data    := read_slc;
              write(row,ctrl2write);
              writeline(file_slc_handler,row);

            end if;
          end loop;
        end if;

        -------------------------------------------------------------------
        -- new HIT
        -------------------------------------------------------------------

        if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
          for heg_i in c_NUM_THREADS -1 downto 0 loop
            read_hit := structify(heg2sf_inn_hit_av(heg_i));
            if read_hit.data_valid = '1' then
              hit2write.ToA      := tb_curr_tdc_time;
              hit2write.station  := to_unsigned(0,4);
              hit2write.thread   := to_unsigned(heg_i,4);
              hit2write.data   := read_hit;
              write(row,hit2write);
              writeline(file_hit_handler,row);
            end if;
          end loop;
        end if;
        if c_STATIONS_IN_SECTOR(1) = '1' then -- MID
          for heg_i in c_NUM_THREADS -1 downto 0 loop
            read_hit := structify(heg2sf_mid_hit_av(heg_i));
            if read_hit.data_valid = '1' then
              hit2write.ToA      := tb_curr_tdc_time;
              hit2write.station  := to_unsigned(1,4);
              hit2write.thread   := to_unsigned(heg_i,4);
              hit2write.data   := read_hit;
              write(row,hit2write);
              writeline(file_hit_handler,row);
            end if;
          end loop;
        end if;
        if c_STATIONS_IN_SECTOR(2) = '1' then -- OUT
          for heg_i in c_NUM_THREADS -1 downto 0 loop
            read_hit := structify(heg2sf_out_hit_av(heg_i));
            if read_hit.data_valid = '1' then
              hit2write.ToA      := tb_curr_tdc_time;
              hit2write.station  := to_unsigned(2,4);
              hit2write.thread   := to_unsigned(heg_i,4);
              hit2write.data   := read_hit;
              write(row,hit2write);
              writeline(file_hit_handler,row);
            end if;
          end loop;
        end if;

      end if;
    end if;
  end process HEG_BM;




 -------------------------------------------------------------------------------------
	-- Input of PT CALC
  -------------------------------------------------------------------------------------

  SF_MPL_PT: process(clk)

    file file_sf_handler : text open write_mode is OUT_PTIN_SF_FILE ;
    file file_mpl_handler : text open write_mode is OUT_PTIN_MPL_FILE;

    variable row 		: line;

    alias inn_segments_to_pt_av is << signal.ult_tp.ULT.inn_segments_to_pt : sf2pt_bus_avt >>;
    alias mid_segments_to_pt_av is << signal.ult_tp.ULT.mid_segments_to_pt : sf2pt_bus_avt >>;
    alias out_segments_to_pt_av is << signal.ult_tp.ULT.out_segments_to_pt : sf2pt_bus_avt >>;
    alias ext_segments_to_pt_av is << signal.ult_tp.ULT.ext_segments_to_pt : sf2pt_bus_avt >>;

    alias pl2pt_av is << signal.ult_tp.ULT.pl2pt_av : pl2pt_bus_avt >>;

    -- variable fifo_mem_v : heg2sf_hits_fifo_at(OUTPUT_FIFO_LEN -1 downto 0);
    variable fifo_count : integer := 0;

    variable sf2pt : sf2ptcalc_rt;

    variable sf_2write : in_pt_pt2sf_sim_rt;
    variable mpl_2write : in_pt_mpl_sim_rt;

    variable read_sf  : sf2ptcalc_rt;
    variable read_mpl : pl2ptcalc_rt;
    -- variable read_hit   : heg2sfhit_rt;

    variable header2write : std_logic := '0';

  begin
    if rising_edge(clk) then
      if rst = '1' then
            
      else

        if header2write = '0' then
          SWRITE(row, "#----------------------------------------");
          writeline(file_sf_handler,row);
          SWRITE(row, "# Output : SF 2 PTCALC");
          writeline(file_sf_handler,row);
          SWRITE(row, "# BUS : sf2ptcalc_rt ");
          writeline(file_sf_handler,row);
          SWRITE(row, "# IN_SLC_FILE : " & IN_SLC_FILE);
          writeline(file_sf_handler,row);
          SWRITE(row, "# IN_HIT_FILE : " & IN_HIT_FILE);
          writeline(file_sf_handler,row);
          SWRITE(row, "#----------------------------------------");
          writeline(file_sf_handler,row);
          WRITEHEADER(row,sf_2write);
          writeline(file_sf_handler,row);
          ----------------------------------------
          SWRITE(row, "#----------------------------------------");
          writeline(file_mpl_handler,row);
          SWRITE(row, "# Output : SF 2 PTCALC");
          writeline(file_mpl_handler,row);
          SWRITE(row, "# BUS : pl2ptcalc_rt ");
          writeline(file_mpl_handler,row);
          SWRITE(row, "# IN_SLC_FILE : " & IN_SLC_FILE);
          writeline(file_mpl_handler,row);
          SWRITE(row, "# IN_HIT_FILE : " & IN_HIT_FILE);
          writeline(file_mpl_handler,row);
          SWRITE(row, "#----------------------------------------");
          writeline(file_mpl_handler,row);
          WRITEHEADER(row,mpl_2write);
          writeline(file_mpl_handler,row);
          header2write := '1';
        end if;

        fifo_count := 0;

        -------------------------------------------------------------------
        -- new SF
        -------------------------------------------------------------------

        if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
          for heg_i in c_NUM_THREADS -1 downto 0 loop
            read_sf := structify(inn_segments_to_pt_av(heg_i));
            if read_sf.data_valid = '1' then

              sf_2write.ToA      := tb_curr_tdc_time;
              sf_2write.station  := to_unsigned(0,4);
              sf_2write.thread   := to_unsigned(heg_i,4);
              sf_2write.data   := read_sf;
              write(row,sf_2write);
              writeline(file_sf_handler,row);

            end if;
          end loop;
        end if;
        if c_STATIONS_IN_SECTOR(1) = '1' then -- MID
          for heg_i in c_NUM_THREADS -1 downto 0 loop
            read_sf := structify(mid_segments_to_pt_av(heg_i));
            if read_sf.data_valid = '1' then

              sf_2write.ToA      := tb_curr_tdc_time;
              sf_2write.station  := to_unsigned(1,4);
              sf_2write.thread   := to_unsigned(heg_i,4);
              sf_2write.data   := read_sf;
              write(row,sf_2write);
              writeline(file_sf_handler,row);

            end if;
          end loop;
        end if;
        if c_STATIONS_IN_SECTOR(2) = '1' then -- OUT
          for heg_i in c_NUM_THREADS -1 downto 0 loop
            read_sf := structify(out_segments_to_pt_av(heg_i));
            if read_sf.data_valid = '1' then

              sf_2write.ToA      := tb_curr_tdc_time;
              sf_2write.station  := to_unsigned(2,4);
              sf_2write.thread   := to_unsigned(heg_i,4);
              sf_2write.data   := read_sf;
              write(row,sf_2write);
              writeline(file_sf_handler,row);

            end if;
          end loop;
        end if;

        -------------------------------------------------------------------
        -- new HIT
        -------------------------------------------------------------------

        if c_STATIONS_IN_SECTOR(0) = '1' then -- INN
          for heg_i in c_NUM_THREADS -1 downto 0 loop
            read_mpl := structify(pl2pt_av(heg_i));
            if read_mpl.data_valid = '1' then
              mpl_2write.ToA      := tb_curr_tdc_time;
              -- mpl_2write.station  := to_unsigned(0,4);
              mpl_2write.thread   := to_unsigned(heg_i,4);
              mpl_2write.data   := read_mpl;
              write(row,mpl_2write);
              writeline(file_mpl_handler,row);
            end if;
          end loop;
        end if;

      end if;
    end if;
  end process SF_MPL_PT;

end architecture beh;
