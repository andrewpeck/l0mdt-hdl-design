--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Muon Candidate Manager
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
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
use shared_lib.some_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

library ult_lib;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;
use ctrl_lib.TAR_CTRL.all;
use ctrl_lib.MTC_CTRL.all;
use ctrl_lib.UCM_CTRL.all;
use ctrl_lib.DAQ_CTRL.all;
use ctrl_lib.TF_CTRL.all;
use ctrl_lib.MPL_CTRL.all;

entity ult_tp is
  generic (
    DUMMY       : boolean := false;
    EN_TAR_HITS : integer := 1;
    EN_MDT_HITS : integer := 0
    );
end entity ult_tp;

architecture beh of ult_tp is

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
  signal i_inner_tdc_hits  :  mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal i_middle_tdc_hits :  mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal i_outer_tdc_hits  :  mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal i_extra_tdc_hits  :  mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);

  -- TDC Hits from Tar
  signal i_inner_tar_hits  :  tar2hps_bus_avt (EN_TAR_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal i_middle_tar_hits :  tar2hps_bus_avt (EN_TAR_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal i_outer_tar_hits  :  tar2hps_bus_avt (EN_TAR_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal i_extra_tar_hits  :  tar2hps_bus_avt (EN_TAR_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);

  -- Sector Logic Candidates
  signal i_main_primary_slc        : slc_rx_data_bus_avt(2 downto 0);  -- is the main SL used
  signal i_main_secondary_slc      : slc_rx_data_bus_avt(2 downto 0);  -- only used in the big endcap
  signal i_plus_neighbor_slc       : slc_rx_data_rvt;
  signal i_minus_neighbor_slc      : slc_rx_data_rvt;
  -- Segments in from neighbor
  signal plus_neighbor_segments_i  : sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);
  signal minus_neighbor_segments_i : sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);

  -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
  signal daq_streams_o :  felix_stream_bus_avt (c_NUM_DAQ_STREAMS-1 downto 0);

  -- Segments Out to Neighbor
  signal plus_neighbor_segments_o  :  sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
  signal minus_neighbor_segments_o :  sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);

  -- MUCTPI
  signal MTC_o :  mtc_out_bus_avt(c_NUM_MTC-1 downto 0);
  signal NSP_o :  mtc2nsp_bus_avt(c_NUM_NSP-1 downto 0);

  signal sump : std_logic;

-----------------------------------------------------------------------------------------------------
  -- clk
  constant clk_period : time := 2.7778 ns;
  signal clk : std_logic := '0';
  -- rest
  constant reset_init_cycles : integer := 3;
  signal rst: std_logic;
  
  signal glob_en : std_logic := '1';

  -- signal clock_and_control : l0mdt_control_rt;

  -- SLc in
  signal i_slc_data_mainA_av     : slc_rx_data_bus_avt(2 downto 0);
  signal i_slc_data_mainB_av     : slc_rx_data_bus_avt(2 downto 0);
  signal i_slc_data_neighborA_v : slc_rx_data_rvt;
  signal i_slc_data_neighborB_v : slc_rx_data_rvt;
  -- to hps
  signal o_uCM2hps_inn_av       : ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_mid_av       : ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_out_av       : ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  signal o_uCM2hps_ext_av       : ucm2hps_bus_avt(c_NUM_THREADS -1 downto 0);
  -- pipeline
  -- signal o_uCM2pl_av            : pipelines_avt(c_MAX_NUM_SL -1 downto 0);

  signal cand1 , cand2 , cand3 , cand4 : slc_rx_data_rt;
  signal barrel1 , barrel2 , barrel3 , barrel4 : slc_barrel_rt;

  ------------------------------------
  signal tb_motor : std_logic_vector(3 downto 0);

begin
  
  ULT : entity ult_lib.ult
    generic map(
      EN_TAR_HITS => 1,
      EN_MDT_HITS => 0,
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
      i_inner_tar_hits  => i_inner_tar_hits,
      i_middle_tar_hits => i_middle_tar_hits,
      i_outer_tar_hits  => i_outer_tar_hits,
      i_extra_tar_hits  => i_extra_tar_hits,

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
  

      clock_and_control.clk <= clk;
      clock_and_control.rst <= rst;
 	-------------------------------------------------------------------------------------
	-- clock Generator
	-------------------------------------------------------------------------------------
  CLK_320 : process begin
    clk <= '0';
    wait for CLK_period/2;
    clk <= '1';
    wait for CLK_period/2;
  end process;

 	-------------------------------------------------------------------------------------
	-- Reset Generator
	-------------------------------------------------------------------------------------
	rst_process: process
	begin
		rst<='0';
		wait for CLK_period;
		rst<='1';
		wait for CLK_period*reset_init_cycles;
		rst<= '0';
		wait;
  end process;
 	-------------------------------------------------------------------------------------
	-- candidates
  -------------------------------------------------------------------------------------
  barrel1.spare_bits          <= std_logic_vector(to_unsigned( 0 , SLC_B_SPARE_LEN ));
  barrel1.coin_type           <= std_logic_vector(to_unsigned( 3 , SLC_COIN_TYPE_LEN ));
  barrel1.z_rpc0              <= to_signed(integer(-2079.0 / SLC_Z_RPC_MULT) , SLC_Z_RPC_LEN );
  barrel1.z_rpc1              <= to_signed(integer( 0.0 / SLC_Z_RPC_MULT) , SLC_Z_RPC_LEN );
  barrel1.z_rpc2              <= to_signed(integer( -3858.0 / SLC_Z_RPC_MULT) , SLC_Z_RPC_LEN );
  barrel1.z_rpc3              <= to_signed(integer( -4806.0 / SLC_Z_RPC_MULT) , SLC_Z_RPC_LEN );
  cand1.muid.slcid            <= to_unsigned( 1 , SLC_SLCID_LEN);
  cand1.muid.slid             <= to_unsigned( 1 , SLC_SLID_LEN );
  cand1.muid.bcid             <= to_unsigned( 477 , BCID_LEN );
  cand1.chambers.mdt_inn      <= to_unsigned( 1 , SLC_CHAMBER_LEN );
  cand1.chambers.mdt_mid      <= to_unsigned( 2 , SLC_CHAMBER_LEN );
  cand1.chambers.mdt_out      <= to_unsigned( 2 , SLC_CHAMBER_LEN );
  cand1.chambers.mdt_ext      <= to_unsigned( 3 , SLC_CHAMBER_LEN );
  cand1.common.tcid           <= std_logic_vector(to_unsigned( 1 , SLC_TCID_LEN ));
  cand1.common.tcsent         <= '1'; --std_logic_vector(to_unsigned( 1 , SLC_TCSENT_LEN ));
  cand1.common.pos_eta        <= to_signed( -1355 , SLC_POS_ETA_LEN );
  cand1.common.pos_phi        <= to_unsigned( 292 , SLC_POS_PHI_LEN );
  cand1.common.rpc_pt         <= std_logic_vector(to_unsigned( 0 , 8));
  cand1.common.pt_th          <= std_logic_vector(to_unsigned( 11 , SLC_PT_TH_LEN ));
  cand1.common.charge         <= '0'; --std_logic_vector(to_unsigned( 1 , SLC_CHARGE_LEN ));
  cand1.specific              <= vectorify(barrel1);
  cand1.data_valid            <= '1';
  ------------------------
  barrel2.spare_bits          <= std_logic_vector(to_unsigned( 0 , SLC_B_SPARE_LEN ));
  barrel2.coin_type           <= std_logic_vector(to_unsigned( 1 , SLC_COIN_TYPE_LEN ));
  barrel2.z_rpc0              <= to_signed(integer( -537.0 / SLC_Z_RPC_MULT) , SLC_Z_RPC_LEN );
  barrel2.z_rpc1              <= to_signed(integer( -675.0 / SLC_Z_RPC_MULT), SLC_Z_RPC_LEN );
  barrel2.z_rpc2              <= to_signed(integer( -721.0 / SLC_Z_RPC_MULT), SLC_Z_RPC_LEN );
  barrel2.z_rpc3              <= to_signed(integer( 0.0 / SLC_Z_RPC_MULT), SLC_Z_RPC_LEN );
  cand2.muid.slcid            <= to_unsigned( 1 , SLC_SLCID_LEN);
  cand2.muid.slid             <= to_unsigned( 1 , SLC_SLID_LEN );
  cand2.muid.bcid             <= to_unsigned( 1253 , BCID_LEN );
  cand2.chambers.mdt_inn      <= to_unsigned( 1 , SLC_CHAMBER_LEN );
  cand2.chambers.mdt_mid      <= to_unsigned( 2 , SLC_CHAMBER_LEN );
  cand2.chambers.mdt_out      <= to_unsigned( 2 , SLC_CHAMBER_LEN );
  cand2.chambers.mdt_ext      <= to_unsigned( 3 , SLC_CHAMBER_LEN );
  cand2.common.tcid           <= std_logic_vector(to_unsigned( 1 , SLC_TCID_LEN ));
  cand2.common.tcsent         <= '1'; --std_logic_vector(to_unsigned( 1 , SLC_TCSENT_LEN ));
  cand2.common.pos_eta        <= to_signed( -313 , SLC_POS_ETA_LEN );
  cand2.common.pos_phi        <= to_unsigned( 307 , SLC_POS_PHI_LEN );
  cand2.common.rpc_pt         <= std_logic_vector(to_unsigned( 0 , 8));
  cand2.common.pt_th          <= std_logic_vector(to_unsigned( 2 , SLC_PT_TH_LEN ));
  cand2.common.charge         <= '0'; --std_logic_vector(to_unsigned( 1 , SLC_CHARGE_LEN ));
  cand2.specific              <= vectorify(barrel2);
  cand2.data_valid            <= '1';
 	-------------------------------------------------------------------------------------
	-- Reset Generator
	-------------------------------------------------------------------------------------
  feed_1_slc : process(clk,rst)

  begin
    if rst= '1' then
      tb_motor <= x"0";
      i_slc_data_mainA_av <= ( others => (others => '0'));
      i_slc_data_mainB_av <= (others => (others => '0'));
      i_slc_data_neighborA_v <= (others => '0');
      i_slc_data_neighborB_v <= (others => '0');
    elsif rising_edge(clk) then

      case tb_motor is
        when x"0"=>
          tb_motor <= x"1";
          i_slc_data_mainA_av(2) <= (others => '0');
          i_slc_data_mainA_av(1) <= (others => '0');
          i_slc_data_mainA_av(0) <= (others => '0');
          i_slc_data_neighborA_v <= (others => '0');
          i_slc_data_neighborB_v <= (others => '0');
        when x"1" =>
          tb_motor <= x"2";
          i_slc_data_mainA_av(2) <= vectorify(cand1);
          i_slc_data_mainA_av(1) <= vectorify(cand2);
          i_slc_data_mainA_av(0) <= (others => '0');
          i_slc_data_neighborA_v <= vectorify(cand2);
          i_slc_data_neighborB_v <= (others => '0');
        when others =>
          i_slc_data_mainA_av(2) <= (others => '0');
          i_slc_data_mainA_av(1) <= (others => '0');
          i_slc_data_mainA_av(0) <= (others => '0');
          i_slc_data_neighborA_v <= (others => '0');
          i_slc_data_neighborB_v <= (others => '0');
          -- nothing to do 
      end case;
    end if;

  end process;


  
end architecture beh;
