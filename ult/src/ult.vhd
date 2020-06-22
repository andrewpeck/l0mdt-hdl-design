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

-- library hal;
-- use hal.system_types_pkg.all;
-- use hal.constants_pkg.all;

entity top_ult is
  generic (
    DUMMY : boolean := false
    );
  port (
    -- pipeline clock
    clock_and_control             : in l0mdt_control_rt;
    -- ttc
    ttc_commands                  : in l0mdt_ttc_rt;
    -- TDC Hits from Polmux
    inner_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    middle_tdc_hits_i             : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    outer_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    extra_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- Sector Logic Candidates
    main_primary_slc_i            : in slc_rx_data_avt(2 downto 0); -- is the main SL used
    main_secondary_slc_i          : in slc_rx_data_avt(2 downto 0); -- only used in the big endcap
    plus_neighbor_slc_i           : in slc_rx_data_rvt;
    minus_neighbor_slc_i          : in slc_rx_data_rvt;
    -- Segments in from neighbor
    plus_neighbor_segments_i      : in sf2pt_avt(c_NUM_SF_INPUTS-1 downto 0);
    minus_neighbor_segments_i     : in sf2pt_avt(c_NUM_SF_INPUTS-1 downto 0);
    -- felix
    --tts_commands : out TTS_CMD_rt;
    -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
    daq_streams_o                 : out FELIX_STREAM_avt (c_NUM_DAQ_STREAMS-1 downto 0);
    -- Segments Out to Neighbor
    plus_neighbor_segments_o      : out sf2pt_avt(c_NUM_SF_OUTPUTS-1 downto 0);
    minus_neighbor_segments_o     : out sf2pt_avt(c_NUM_SF_OUTPUTS-1 downto 0);
    -- MUCTPI
    MTC_o                         : out MTC_avt(c_NUM_MTC-1 downto 0);
    NSP_o                         : out NSP_avt(c_NUM_NSP-1 downto 0);
    -- AXI Control

    sump : out std_logic

    );

end entity top_ult;
architecture behavioral of top_ult is

  -- outputs from candidate manager
  signal inner_slc_to_hts    : SLC_avt(c_NUM_THREADS-1 downto 0);
  signal middle_slc_to_hts   : SLC_avt(c_NUM_THREADS-1 downto 0);
  signal outer_slc_to_hts    : SLC_avt(c_NUM_THREADS-1 downto 0);
  signal extra_slc_to_hts    : SLC_avt(c_NUM_THREADS-1 downto 0);
  signal all_slc_to_pipeline : pipelines_avt(MAX_NUM_SL -1 downto 0);

  -- outputs from hits to segments
  signal inner_segments_to_pt  : sf2pt_avt(c_NUM_THREADS-1 downto 0);
  signal middle_segments_to_pt : sf2pt_avt(c_NUM_THREADS-1 downto 0);
  signal outer_segments_to_pt  : sf2pt_avt(c_NUM_THREADS-1 downto 0);
  signal extra_segments_to_pt  : sf2pt_avt(c_NUM_THREADS-1 downto 0);

  -- slc to pt (from pipeline)
  signal slc_to_pt : SLC_avt (c_NUM_THREADS-1 downto 0);

  -- slc to mtc (from pipeline)
  signal slc_to_mtc : SLC_avt (c_NUM_SLC-1 downto 0);

  -- pt calc
  signal slcpipe_ptcalc : SLCPIPE_PTCALC_avt (c_NUM_THREADS-1 downto 0);

  component candidate_manager is
    port (
      -- pipeline clock
      clock_and_control : in l0mdt_control_rt;
      -- ttc
      ttc_commands : in l0mdt_ttc_rt;
      -- Sector Logic Candidates
      i_slc_data_mainA_av     : in slc_rx_data_avt(2 downto 0);
      i_slc_data_mainB_av     : in slc_rx_data_avt(2 downto 0);
      i_slc_data_neightborA_v : in slc_rx_data_rvt;
      i_slc_data_neightborB_v : in slc_rx_data_rvt;
      -- Sector Logic Candidates Out of X-point Switch
      o_uCM2hps_inn_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
      o_uCM2hps_mid_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
      o_uCM2hps_out_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
      o_uCM2hps_ext_av        : out ucm2hps_avt(c_NUM_THREADS -1 downto 0);
      -- pipeline
      o_uCM2pl_av             : out pipelines_avt(MAX_NUM_SL -1 downto 0)
      );
  end component candidate_manager;

  component hits_to_segments is
    port (
      -- pipeline clock
      clock_and_control : in l0mdt_control_rt;

      -- ttc
      ttc_commands : in l0mdt_ttc_rt;

      -- TDC Hits from Polmux
      inner_tdc_hits_i  : in tar2hps_avt(c_NUM_THREADS -1 downto 0);
      middle_tdc_hits_i : in tar2hps_avt(c_NUM_THREADS -1 downto 0);
      outer_tdc_hits_i  : in tar2hps_avt(c_NUM_THREADS -1 downto 0);
      extra_tdc_hits_i  : in tar2hps_avt(c_NUM_THREADS -1 downto 0);

      -- Sector Logic Candidates from uCM
      inner_slc_i  : in SLC_avt;
      middle_slc_i : in SLC_avt;
      outer_slc_i  : in SLC_avt;
      extra_slc_i  : in SLC_avt;

      -- Segments Out
      inner_segments_o  : out sf2pt_avt;
      middle_segments_o : out sf2pt_avt;
      outer_segments_o  : out sf2pt_avt;
      extra_segments_o  : out sf2pt_avt;

      -- Segments Out to Neighbor
      plus_neighbor_segments_o  : out sf2pt_avt;
      minus_neighbor_segments_o : out sf2pt_avt
      );

  end component hits_to_segments;

  component track_fitting is
    port (
      -- pipeline clock
      clock_and_control : in l0mdt_control_rt;

      -- ttc
      ttc_commands : in l0mdt_ttc_rt;

      -- Segments in from segment finder
      inner_segments_i  : in sf2pt_avt;
      middle_segments_i : in sf2pt_avt;
      outer_segments_i  : in sf2pt_avt;
      extra_segments_i  : in sf2pt_avt;

      -- Segments in from neighbor
      minus_neighbor_segments_i : in sf2pt_avt;
      plus_neighbor_segments_i  : in sf2pt_avt;

      -- Sector Logic Candidates from pipeline
      slc_i : in SLC_avt;

      -- array of corrected SLC outputs to UCM
      slcpipe_ptcalc_o : out SLCPIPE_PTCALC_avt
      );
  end component track_fitting;

  component mtc_builder is
    port (
      -- pipeline clock
      clock_and_control : in l0mdt_control_rt;

      -- ttc
      ttc_commands : in l0mdt_ttc_rt;

      -- array of pt corrected SLC outputs from x-point switch
      slcpipe_ptcalc_i : in SLCPIPE_PTCALC_avt;

      -- Sector Logic Candidates from pipeline
      slc_i : in SLC_avt;

      -- NSP + MUCTPI
      mtc_o : out MTC_avt;
      nsp_o : out NSP_avt

     -- DAQ
      );
  end component mtc_builder;

  component pipeline is
    port (
      -- pipeline clock
      clock_and_control : in l0mdt_control_rt;

      -- ttc
      ttc_commands : in l0mdt_ttc_rt;

      -- Sector Logic Candidates from uCM
      all_slc_i : in SLC_avt;

      -- Sector Logic Candidates to Track fitting
      slc_to_pt_o : out SLC_avt;

      -- Sector Logic Candidates to mTC
      slc_to_mtc_o : out SLC_avt
      );
  end component pipeline;

  component daq is
    port (
      -- pipeline clock
      clock_and_control : in l0mdt_control_rt;

      -- ttc
      ttc_commands : in l0mdt_ttc_rt;

      -- TDC Hits from Polmux
      inner_tdc_hits_i  : in mdt_pullmux_data_avt;
      middle_tdc_hits_i : in mdt_pullmux_data_avt;
      outer_tdc_hits_i  : in mdt_pullmux_data_avt;
      extra_tdc_hits_i  : in mdt_pullmux_data_avt;

      -- Tracks from MTC

      -- Array of DAQ data streams (e.g. 64 bit streams) to send to MGT
      daq_streams_o : out FELIX_STREAM_avt
      );
  end component daq;

  component control is
    port (
      -- pipeline clock
      clock_and_control : in l0mdt_control_rt;

      -- ttc
      ttc_commands : in l0mdt_ttc_rt
      );
  end component control;

begin

  logic_gen : if (not DUMMY) generate

    candidate_manager_inst : candidate_manager
      port map (
        clock_and_control => clock_and_control,  --
        ttc_commands      => ttc_commands,       --
        slc_i             => slc_i,              -- candidates in from hal

        -- outputs to ucm
        inner_slc_o  => inner_slc_to_hts,
        middle_slc_o => middle_slc_to_hts,
        outer_slc_o  => outer_slc_to_hts,
        extra_slc_o  => extra_slc_to_hts,
        all_slc_o    => all_slc_to_pipeline
        );


    hits_to_segments_inst : hits_to_segments
      port map (
        --
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,

        -- inputs from hal
        inner_tdc_hits_i  => inner_tdc_hits_i,
        middle_tdc_hits_i => middle_tdc_hits_i,
        outer_tdc_hits_i  => outer_tdc_hits_i,
        extra_tdc_hits_i  => extra_tdc_hits_i,

        -- inputs from ucm
        inner_slc_i  => inner_slc_to_hts,
        middle_slc_i => middle_slc_to_hts,
        outer_slc_i  => outer_slc_to_hts,
        extra_slc_i  => extra_slc_to_hts,

        -- outputs to track fitting
        inner_segments_o  => inner_segments_to_pt,
        middle_segments_o => middle_segments_to_pt,
        outer_segments_o  => outer_segments_to_pt,
        extra_segments_o  => extra_segments_to_pt,

        -- segment outputs to hal
        plus_neighbor_segments_o  => plus_neighbor_segments_o,
        minus_neighbor_segments_o => minus_neighbor_segments_o
        );

    track_fitting_inst : track_fitting
      port map (
        --
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,

        --  from hal
        plus_neighbor_segments_i  => plus_neighbor_segments_i,
        minus_neighbor_segments_i => minus_neighbor_segments_i,

        --
        inner_segments_i  => inner_segments_to_pt,
        middle_segments_i => middle_segments_to_pt,
        outer_segments_i  => outer_segments_to_pt,
        extra_segments_i  => extra_segments_to_pt,

        slc_i => slc_to_pt,

        slcpipe_ptcalc_o => slcpipe_ptcalc
        );

    mtc_builder_inst : mtc_builder
      port map (
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,
        slcpipe_ptcalc_i  => slcpipe_ptcalc,
        slc_i             => slc_i,
        mtc_o             => mtc_o,
        nsp_o             => nsp_o
        );

    pipeline_inst : pipeline
      port map (
        --
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,

        -- slc inputs
        all_slc_i => all_slc_to_pipeline,

        -- slc outputs
        slc_to_pt_o  => slc_to_pt,
        slc_to_mtc_o => slc_to_mtc
        );

    daq_inst : daq
      port map (
        --
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,

        --
        inner_tdc_hits_i  => inner_tdc_hits_i,
        middle_tdc_hits_i => middle_tdc_hits_i,
        outer_tdc_hits_i  => outer_tdc_hits_i,
        extra_tdc_hits_i  => extra_tdc_hits_i,

        --
        daq_streams_o => daq_streams_o
        );

    sump <= '0';

  end generate;

  dummy_gen : if (DUMMY) generate
    signal tdc_hit_inner_sump  : std_logic_vector (c_NUM_POLMUX_INNER-1 downto 0);
    signal tdc_hit_middle_sump : std_logic_vector (c_NUM_POLMUX_MIDDLE-1 downto 0);
    signal tdc_hit_outer_sump  : std_logic_vector (c_NUM_POLMUX_OUTER-1 downto 0);
    signal endcap_hit_sump     : std_logic_vector (c_NUM_SL_ENDCAP_CANDIDATES-1 downto 0);
    signal barrel_hit_sump     : std_logic_vector (c_NUM_SL_BARREL_CANDIDATES-1 downto 0);
  begin

    sump_proc : process (clock_and_control.clk) is
    begin  -- process tdc_hit_sump_proc
      if (rising_edge(clock_and_control.clk)) then  -- rising clock edge

        -- inner_tdc_sump_loop : for I in 0 to c_NUM_POLMUX_INNER-1 loop
        --   tdc_hit_inner_sump(I) <= xor_reduce(tdcpolmux_2af(inner_tdc_hits_i(I)));
        -- end loop;
        -- middle_tdc_sump_loop : for I in 0 to c_NUM_POLMUX_MIDDLE-1 loop
        --   tdc_hit_middle_sump(I) <= xor_reduce(tdcpolmux_2af(middle_tdc_hits_i(I)));
        -- end loop;
        -- outer_tdc_sump_loop : for I in 0 to c_NUM_POLMUX_OUTER-1 loop
        --   tdc_hit_outer_sump(I) <= xor_reduce(tdcpolmux_2af(outer_tdc_hits_i(I)));
        -- end loop;

        --barrel_sump_loop : for I in 0 to c_NUM_SL_BARREL_CANDIDATES-1 loop
        --  barrel_hit_sump(I) <= xor_reduce(slc_barrel_2af(barrel_slc_candidates(I)));
        --end loop;

        --endcap_sump_loop : for I in 0 to c_NUM_SL_ENDCAP_CANDIDATES-1 loop
        --  endcap_hit_sump(I) <= xor_reduce(slc_endcap_2af(endcap_slc_candidates(I)));
        --end loop;

        sump <= xor_reduce(tdc_hit_inner_sump)
                xor xor_reduce(tdc_hit_middle_sump)
                xor xor_reduce(tdc_hit_outer_sump)
                xor xor_reduce (barrel_hit_sump)
                xor xor_reduce (endcap_hit_sump);

      end if;
    end process;
  end generate;

end behavioral;
