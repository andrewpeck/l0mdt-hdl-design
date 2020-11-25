--------------------------------------------------------------------------------
--
--
--
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: User Logic Top
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

library ult_lib;

library ctrl_lib;
use ctrl_lib.H2S_CTRL.all;
use ctrl_lib.TAR_CTRL.all;
use ctrl_lib.MTC_CTRL.all;
use ctrl_lib.UCM_CTRL.all;
use ctrl_lib.DAQ_CTRL.all;
use ctrl_lib.TF_CTRL.all;
use ctrl_lib.MPL_CTRL.all;

entity ult is
  generic (
    DUMMY       : boolean := false
    );
  port (
    -- clock and ttc
    clock_and_control : in l0mdt_control_rt;
    ttc_commands      : in l0mdt_ttc_rt;

    -- control and monitoring

    h2s_ctrl : in  H2S_CTRL_t;
    h2s_mon  : out H2S_MON_t;

    tar_ctrl : in  TAR_CTRL_t;
    tar_mon  : out TAR_MON_t;

    mtc_ctrl : in  MTC_CTRL_t;
    mtc_mon  : out MTC_MON_t;

    ucm_ctrl : in  UCM_CTRL_t;
    ucm_mon  : out UCM_MON_t;

    daq_ctrl : in  DAQ_CTRL_t;
    daq_mon  : out DAQ_MON_t;

    tf_ctrl : in  TF_CTRL_t;
    tf_mon  : out TF_MON_t;

    mpl_ctrl : in  MPL_CTRL_t;
    mpl_mon  : out MPL_MON_t;

    -- TDC Hits from Polmux
    i_inner_tdc_hits  : in mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_middle_tdc_hits : in mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_outer_tdc_hits  : in mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_extra_tdc_hits  : in mdt_polmux_bus_avt (c_EN_MDT_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);

    -- TDC Hits from Tar
    i_inner_tar_hits  : in tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_middle_tar_hits : in tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_outer_tar_hits  : in tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_extra_tar_hits  : in tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);

    -- Sector Logic Candidates
    i_main_primary_slc        : in  slc_rx_bus_avt(2 downto 0);  -- is the main SL used
    i_main_secondary_slc      : in  slc_rx_bus_avt(2 downto 0);  -- only used in the big endcap
    i_plus_neighbor_slc       : in  slc_rx_rvt;
    i_minus_neighbor_slc      : in  slc_rx_rvt;

    -- Segments in from neighbor
    i_plus_neighbor_segments  : in  sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);
    i_minus_neighbor_segments : in  sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);

    -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
    o_daq_streams             : out felix_stream_bus_avt (c_NUM_DAQ_STREAMS-1 downto 0);

    -- Segments Out to Neighbor
    o_plus_neighbor_segments  : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    o_minus_neighbor_segments : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);

    -- -- MUCTPI
    o_MTC                     : out mtc_out_bus_avt(c_NUM_MTC-1 downto 0);
    o_NSP                     : out mtc2nsp_bus_avt(c_NUM_NSP-1 downto 0);
    -- AXI Control

    sump : out std_logic

    );

end entity ult;
architecture behavioral of ult is

  -- outputs from candidate manager
  signal inner_slc_to_hts  : ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
  signal middle_slc_to_hts : ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
  signal outer_slc_to_hts  : ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
  signal extra_slc_to_hts  : ucm2hps_bus_avt(c_NUM_THREADS-1 downto 0);
  signal ucm2pl_av         : ucm2pl_bus_avt(c_MAX_NUM_SL -1 downto 0);

  -- TDC Hits from tar 2 hps
  signal inner_tar_hits  : tar2hps_bus_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal middle_tar_hits : tar2hps_bus_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal outer_tar_hits  : tar2hps_bus_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal extra_tar_hits  : tar2hps_bus_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);

  -- TDC Hits from tar 2 daq
  signal inner_tdc_hits  : mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal middle_tdc_hits : mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal outer_tdc_hits  : mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal extra_tdc_hits  : mdt_polmux_bus_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);

  -- outputs from hits to segments
  signal inn_segments_to_pt  : sf2pt_bus_avt(c_NUM_THREADS-1 downto 0);
  signal mid_segments_to_pt  : sf2pt_bus_avt(c_NUM_THREADS-1 downto 0);
  signal out_segments_to_pt  : sf2pt_bus_avt(c_NUM_THREADS-1 downto 0);
  signal ext_segments_to_pt  : sf2pt_bus_avt(c_NUM_THREADS-1 downto 0);

  -- slc to pt (from pipeline)
  signal inner_slc_to_pt  : sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
  signal middle_slc_to_pt : sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
  signal outer_slc_to_pt  : sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);
  signal extra_slc_to_pt  : sf2pt_bus_avt (c_NUM_THREADS-1 downto 0);

  -- slc to mtc (from pipeline)
  signal pl2pt_av  : pl2pt_bus_avt (c_NUM_THREADS-1 downto 0);
  signal pl2mtc_av : pl2mtc_bus_avt (c_MAX_NUM_SL-1 downto 0);

  -- pt calc 2 mtc
  signal pt2mtc_av : tf2mtc_bus_avt(c_NUM_THREADS-1 downto 0);
  -- signal pt2mtc : pt2mtc_avt (c_NUM_THREADS-1 downto 0);

begin

  logic_gen : if (not DUMMY) generate

    TAR : entity work.mdt_tar
      port map (
        -- clock, control, and monitoring
        clock_and_control => clock_and_control,  --
        ttc_commands      => ttc_commands,       --
        ctrl              => tar_ctrl,
        mon               => tar_mon,
        -- TDC Hits from Polmux
        i_inner_tdc_hits  => i_inner_tdc_hits,
        i_middle_tdc_hits => i_middle_tdc_hits,
        i_outer_tdc_hits  => i_outer_tdc_hits,
        i_extra_tdc_hits  => i_extra_tdc_hits,

        -- candidates in from hal
        i_inner_tar_hits  => i_inner_tar_hits,
        i_middle_tar_hits => i_middle_tar_hits,
        i_outer_tar_hits  => i_outer_tar_hits,
        i_extra_tar_hits  => i_extra_tar_hits,
        --
        o_inner_tdc_hits  => inner_tdc_hits,
        o_middle_tdc_hits => middle_tdc_hits,
        o_outer_tdc_hits  => outer_tdc_hits,
        o_extra_tdc_hits  => extra_tdc_hits,
        -- outputs to ucm
        o_inner_tar_hits  => inner_tar_hits,
        o_middle_tar_hits => middle_tar_hits,
        o_outer_tar_hits  => outer_tar_hits,
        o_extra_tar_hits  => extra_tar_hits

      );

    UCM : entity work.candidate_manager
    port map (
      -- clock, control, and monitoring
      clock_and_control       => clock_and_control,  --
      ttc_commands            => ttc_commands,       --
      ctrl                    => ucm_ctrl,
      mon                     => ucm_mon,
      -- candidates in from hal
      i_slc_data_mainA_av     => i_main_primary_slc,
      i_slc_data_mainB_av     => i_main_secondary_slc,
      i_slc_data_neighborA_v => i_plus_neighbor_slc,
      i_slc_data_neighborB_v => i_minus_neighbor_slc,
      -- outputs to ucm
      o_uCM2hps_inn_av        => inner_slc_to_hts,
      o_uCM2hps_mid_av        => middle_slc_to_hts,
      o_uCM2hps_out_av        => outer_slc_to_hts,
      o_uCM2hps_ext_av        => extra_slc_to_hts,
      -- pipeline
      o_uCM2pl_av             => ucm2pl_av
    );


    H2S : entity work.hits_to_segments
    port map (
      -- clock, control, and monitoring
      clock_and_control         => clock_and_control,
      ttc_commands              => ttc_commands,
      ctrl                      => h2s_ctrl,
      mon                       => h2s_mon,
      -- inputs from hal
      i_inn_tar_hits            => inner_tar_hits,
      i_mid_tar_hits            => middle_tar_hits,
      i_out_tar_hits            => outer_tar_hits,
      i_ext_tar_hits            => extra_tar_hits,
      -- Sector Logic Candidates from uCM
      i_inn_slc                 => inner_slc_to_hts,
      i_mid_slc                 => middle_slc_to_hts,
      i_out_slc                 => outer_slc_to_hts,
      i_ext_slc                 => extra_slc_to_hts,
      -- Segments Out to pt calculation
      o_inn_segments            => inn_segments_to_pt,
      o_mid_segments            => mid_segments_to_pt,
      o_out_segments            => out_segments_to_pt,
      o_ext_segments            => ext_segments_to_pt,
      -- Segment outputs to HAL
      o_plus_neighbor_segments  => o_plus_neighbor_segments,
      o_minus_neighbor_segments => o_minus_neighbor_segments
    );

    pipeline_inst : entity ult_lib.pipeline
    port map (
      -- clock, control, and monitoring
      clock_and_control => clock_and_control,
      ttc_commands      => ttc_commands,
      ctrl              => mpl_ctrl,
      mon               => mpl_mon,

      -- Sector Logic Candidates from uCM
      i_ucm2pl_av => ucm2pl_av,

      -- Sector Logic Candidates to pt calculation
      o_pl2pt_av  => pl2pt_av,
      -- Sector Logic Candidates to mTC
      o_pl2mtc_av => pl2mtc_av
    );

    ptcalc_inst : entity work.ptcalc
    port map (
      -- clock, control, and monitoring
      clock_and_control         => clock_and_control,
      ttc_commands              => ttc_commands,
      ctrl                      => tf_ctrl,
      mon                       => tf_mon,
      --  segments from neighbors
      plus_neighbor_segments_i  => i_plus_neighbor_segments,
      minus_neighbor_segments_i => i_minus_neighbor_segments,
      -- segments from hps
      inner_segments_i          => inn_segments_to_pt,
      middle_segments_i         => mid_segments_to_pt,
      outer_segments_i          => out_segments_to_pt,
      extra_segments_i          => ext_segments_to_pt,
      -- from pipeline
      i_pl2pt_av                => pl2pt_av,
      -- to mtc
      o_pt2mtc                  => pt2mtc_av
    );

    mtc_builder_inst : entity work.mtc_builder
    port map (
      -- clock, control, and monitoring
      clock_and_control => clock_and_control,
      ttc_commands      => ttc_commands,
      ctrl              => mtc_ctrl,
      mon               => mtc_mon,
      --  inputs
      i_ptcalc          => pt2mtc_av,
      i_pl2mtc          => pl2mtc_av,
      -- outputs
      o_mtc             => o_mtc,
      o_nsp             => o_nsp
    );

    daq_inst : entity work.daq
      generic map(DELAY => 9600, memory_type => "ultra")
      port map (
        -- clock, control, and monitoring
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,
        ctrl              => daq_ctrl,
        mon               => daq_mon,
        
        -- TDC Hits from Polmux
        i_inner_tdc_hits  => inner_tdc_hits,
        i_middle_tdc_hits => middle_tdc_hits,
        i_outer_tdc_hits  => outer_tdc_hits,
        i_extra_tdc_hits  => extra_tdc_hits,
        
        -- Tracks from MTC
        -- ???
        
        -- Array of DAQ data streams (e.g. 64 bit streams) to send to MGT
        daq_streams_o => o_daq_streams);

    sump <= '0';

  end generate;

  dummy_gen : if (DUMMY) generate
    signal tdc_hit_inner_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_INN-1 downto 0);
    signal tdc_hit_middle_sump : std_logic_vector (c_HPS_NUM_MDT_CH_MID-1 downto 0);
    signal tdc_hit_outer_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
    signal tdc_hit_extra_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
  begin

    sump_proc : process (clock_and_control.clk) is
    begin  -- process tdc_hit_sump_proc
      if (rising_edge(clock_and_control.clk)) then  -- rising clock edge

        inner_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_INN-1 loop
          tdc_hit_inner_sump(I) <= xor_reduce(vectorify(i_inner_tdc_hits(I)));
        end loop;
        middle_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_MID-1 loop
          tdc_hit_middle_sump(I) <= xor_reduce(vectorify(i_middle_tdc_hits(I)));
        end loop;
        outer_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_OUT-1 loop
          tdc_hit_outer_sump(I) <= xor_reduce(vectorify(i_outer_tdc_hits(I)));
        end loop;
        extra_tdc_sump_loop : for I in 0 to c_HPS_NUM_MDT_CH_EXT-1 loop
          tdc_hit_extra_sump(I) <= xor_reduce(vectorify(i_extra_tdc_hits(I)));
        end loop;

        sump <= xor_reduce(tdc_hit_inner_sump)
                xor xor_reduce(tdc_hit_middle_sump)
                xor xor_reduce(tdc_hit_outer_sump)
                xor xor_reduce(tdc_hit_extra_sump);
      end if;
    end process;
  end generate;

end behavioral;
