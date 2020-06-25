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
-- use hal.system_types_pkg.all;
-- use hal.constants_pkg.all;

entity ult is
  generic (
    DUMMY : boolean := false
    );
  port (
    -- pipeline clock
    clock_and_control             : in l0mdt_control_rt;
    -- ttc
    ttc_commands                  : in l0mdt_ttc_rt;
    -- TDC Hits from Polmux
    -- inner_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    -- middle_tdc_hits_i             : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    -- outer_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    -- extra_tdc_hits_i              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    
    -- TDC Hits from Tar
    i_inner_tar_hits              : in tar2hps_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_middle_tar_hits             : in tar2hps_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_outer_tar_hits              : in tar2hps_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_extra_tar_hits              : in tar2hps_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
    -- Sector Logic Candidates
    i_main_primary_slc            : in slc_rx_data_avt(2 downto 0); -- is the main SL used
    i_main_secondary_slc          : in slc_rx_data_avt(2 downto 0); -- only used in the big endcap
    i_plus_neighbor_slc           : in slc_rx_data_rvt;
    i_minus_neighbor_slc          : in slc_rx_data_rvt;
    -- Segments in from neighbor
    plus_neighbor_segments_i      : in sf2pt_avt(c_NUM_SF_INPUTS - 1 downto 0);
    minus_neighbor_segments_i     : in sf2pt_avt(c_NUM_SF_INPUTS - 1 downto 0);
    -- felix
    --tts_commands : out TTS_CMD_rt;
    -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
    daq_streams_o                 : out felix_stream_avt (c_NUM_DAQ_STREAMS-1 downto 0);
    -- Segments Out to Neighbor
    plus_neighbor_segments_o      : out sf2pt_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    minus_neighbor_segments_o     : out sf2pt_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    -- -- MUCTPI
    MTC_o                         : out mtc_out_avt(c_NUM_MTC-1 downto 0);
    NSP_o                         : out mtc2nsp_avt(c_NUM_NSP-1 downto 0);
    -- AXI Control

    sump : out std_logic

    );

end entity ult;
architecture behavioral of ult is

  -- outputs from candidate manager
  signal inner_slc_to_hts    : ucm2hps_avt(c_NUM_THREADS-1 downto 0);
  signal middle_slc_to_hts   : ucm2hps_avt(c_NUM_THREADS-1 downto 0);
  signal outer_slc_to_hts    : ucm2hps_avt(c_NUM_THREADS-1 downto 0);
  signal extra_slc_to_hts    : ucm2hps_avt(c_NUM_THREADS-1 downto 0);
  signal ucm2pl_av : ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);

  -- TDC Hits from tar 2 hps
  signal inner_tar_hits  : tar2hps_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal middle_tar_hits : tar2hps_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal outer_tar_hits  : tar2hps_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal extra_tar_hits  : tar2hps_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);

  -- TDC Hits from tar 2 daq
  signal inner_tdc_hits  : mdt_polmux_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal middle_tdc_hits : mdt_polmux_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal outer_tdc_hits  : mdt_polmux_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal extra_tdc_hits  : mdt_polmux_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);

  -- outputs from hits to segments
  signal inner_segments_to_pt  : sf2pt_avt(c_NUM_THREADS-1 downto 0);
  signal middle_segments_to_pt : sf2pt_avt(c_NUM_THREADS-1 downto 0);
  signal outer_segments_to_pt  : sf2pt_avt(c_NUM_THREADS-1 downto 0);
  signal extra_segments_to_pt  : sf2pt_avt(c_NUM_THREADS-1 downto 0);

  -- slc to pt (from pipeline)
  signal inner_slc_to_pt  : sf2pt_avt (c_NUM_THREADS-1 downto 0);
  signal middle_slc_to_pt : sf2pt_avt (c_NUM_THREADS-1 downto 0);
  signal outer_slc_to_pt  : sf2pt_avt (c_NUM_THREADS-1 downto 0);
  signal extra_slc_to_pt  : sf2pt_avt (c_NUM_THREADS-1 downto 0);

  -- slc to mtc (from pipeline)
  signal pl2pt_av : pl2pt_avt (c_NUM_THREADS-1 downto 0);
  signal pl2mtc_av : pl2mtc_avt (c_MAX_NUM_SL-1 downto 0);
          
  -- pt calc 2 mtc
  signal pt2mtc_av : tf2mtc_avt(c_NUM_THREADS-1 downto 0);
  -- signal pt2mtc : pt2mtc_avt (c_NUM_THREADS-1 downto 0);

  component mdt_tar is
    port (
      -- pipeline clock
      clock_and_control : in l0mdt_control_rt;
      -- ttc
      ttc_commands : in l0mdt_ttc_rt;
      -- Sector Logic Candidates
      -- TDC Hits from Polmux
      -- i_inner_tdc_hits              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
      -- i_middle_tdc_hits             : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
      -- i_outer_tdc_hits              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
      -- i_extra_tdc_hits              : in mdt_polmux_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);
      
      -- TDC Hits from Tar
      i_inner_tar_hits              : in tar2hps_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
      i_middle_tar_hits             : in tar2hps_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
      i_outer_tar_hits              : in tar2hps_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
      i_extra_tar_hits              : in tar2hps_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);

      -- TDC polmux from Tar
      o_inner_tdc_hits              : out mdt_polmux_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
      o_middle_tdc_hits             : out mdt_polmux_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
      o_outer_tdc_hits              : out mdt_polmux_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
      o_extra_tdc_hits              : out mdt_polmux_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);

      -- TDC Hits from Tar
      o_inner_tar_hits              : out tar2hps_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
      o_middle_tar_hits             : out tar2hps_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
      o_outer_tar_hits              : out tar2hps_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
      o_extra_tar_hits              : out tar2hps_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0)

      );
  end component mdt_tar;

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
      o_uCM2pl_av             : out ucm2pl_avt(c_MAX_NUM_SL -1 downto 0)
      );
  end component candidate_manager;

  component hits_to_segments is
    port (
      -- pipeline clock
      clock_and_control : in l0mdt_control_rt;

      -- ttc
      ttc_commands : in l0mdt_ttc_rt;

      -- TDC Hits from Polmux
      inner_tar_hits_i  : in tar2hps_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
      middle_tar_hits_i : in tar2hps_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
      outer_tar_hits_i  : in tar2hps_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
      extra_tar_hits_i  : in tar2hps_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);

      -- Sector Logic Candidates from uCM
      inner_slc_i  : in ucm2hps_avt(c_NUM_THREADS-1 downto 0);
      middle_slc_i : in ucm2hps_avt(c_NUM_THREADS-1 downto 0);
      outer_slc_i  : in ucm2hps_avt(c_NUM_THREADS-1 downto 0);
      extra_slc_i  : in ucm2hps_avt(c_NUM_THREADS-1 downto 0);

      -- Segments Out
      inner_segments_o  : out sf2pt_avt (c_NUM_THREADS-1 downto 0);
      middle_segments_o : out sf2pt_avt (c_NUM_THREADS-1 downto 0);
      outer_segments_o  : out sf2pt_avt (c_NUM_THREADS-1 downto 0);
      extra_segments_o  : out sf2pt_avt (c_NUM_THREADS-1 downto 0);

      -- Segments Out to Neighbor
      plus_neighbor_segments_o  : out sf2pt_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
      minus_neighbor_segments_o : out sf2pt_avt(c_NUM_SF_OUTPUTS - 1 downto 0)
      );

  end component hits_to_segments;

  component track_fitting is
    port (
      -- pipeline clock
      clock_and_control         : in l0mdt_control_rt;
      -- ttc
      ttc_commands              : in l0mdt_ttc_rt;
      -- Segments in from segment finder
      inner_segments_i          : in sf2pt_avt;
      middle_segments_i         : in sf2pt_avt;
      outer_segments_i          : in sf2pt_avt;
      extra_segments_i          : in sf2pt_avt;
      -- Segments in from neighbor
      minus_neighbor_segments_i : in sf2pt_avt;
      plus_neighbor_segments_i  : in sf2pt_avt;
      -- Sector Logic Candidates from pipeline
      i_pl2pt_av                : in pl2pt_avt(c_NUM_THREADS-1 downto 0);
      -- array of corrected SLC outputs to UCM
      o_pt2mtc                  : out tf2mtc_avt(c_NUM_THREADS -1 downto 0)
      );
  end component track_fitting;

  component mtc_builder is
    port (
      -- pipeline clock
      clock_and_control : in l0mdt_control_rt;
      -- ttc
      ttc_commands      : in l0mdt_ttc_rt;
      -- array of pt corrected SLC outputs from x-point switch
      i_ptcalc          : in tf2mtc_avt(c_NUM_THREADS -1 downto 0);
      -- Sector Logic Candidates from pipeline
      i_pl2mtc          : in pl2mtc_avt(c_MAX_NUM_SL -1 downto 0);
      -- NSP + MUCTPI
      o_mtc             : out mtc_out_avt(c_NUM_MTC -1 downto 0);
      o_nsp             : out mtc2nsp_avt(c_NUM_NSP -1 downto 0)

     -- DAQ
      );
  end component mtc_builder;

  component pipeline is
    port (
      -- pipeline clock
      clock_and_control : in l0mdt_control_rt;
      -- ttc
      ttc_commands      : in l0mdt_ttc_rt;
      -- Sector Logic Candidates from uCM
      i_ucm2pl_av       : in ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);
      -- Sector Logic Candidates to Track fitting
      o_pl2pt_av        : out pl2pt_avt(c_NUM_THREADS -1 downto 0);
      -- Sector Logic Candidates to mTC
      o_pl2mtc_av       : out pl2mtc_avt(c_MAX_NUM_SL -1 downto 0)
      );
  end component pipeline;

  component daq is
    port (
      -- pipeline clock
      clock_and_control : in l0mdt_control_rt;
      -- ttc
      ttc_commands : in l0mdt_ttc_rt;
      -- TDC Hits from Polmux
      i_inner_tdc_hits      : in mdt_polmux_avt(c_HPS_NUM_MDT_CH_INN -1 downto 0);
      i_middle_tdc_hits     : in mdt_polmux_avt(c_HPS_NUM_MDT_CH_MID -1 downto 0);
      i_outer_tdc_hits      : in mdt_polmux_avt(c_HPS_NUM_MDT_CH_OUT -1 downto 0);
      i_extra_tdc_hits      : in mdt_polmux_avt(c_HPS_NUM_MDT_CH_EXT -1 downto 0);

      -- Tracks from MTC

      -- Array of DAQ data streams (e.g. 64 bit streams) to send to MGT
      daq_streams_o : out felix_stream_avt
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

    TAR : mdt_tar
      port map (
        clock_and_control => clock_and_control,  --
        ttc_commands      => ttc_commands,       --
        -- TDC Hits from Polmux
        -- i_inner_tdc_hits  =>  i_inner_tdc_hits ,
        -- i_middle_tdc_hits =>  i_middle_tdc_hits,
        -- i_outer_tdc_hits  =>  i_outer_tdc_hits ,
        -- i_extra_tdc_hits  =>  i_extra_tdc_hits ,
        -- candidates in from hal
        i_inner_tar_hits    => i_inner_tar_hits  ,
        i_middle_tar_hits   => i_middle_tar_hits ,
        i_outer_tar_hits    => i_outer_tar_hits  ,
        i_extra_tar_hits    => i_extra_tar_hits  ,

        o_inner_tdc_hits    => inner_tdc_hits,
        o_middle_tdc_hits   => middle_tdc_hits,
        o_outer_tdc_hits    => outer_tdc_hits,
        o_extra_tdc_hits    => extra_tdc_hits,

        -- outputs to ucm
        o_inner_tar_hits    => inner_tar_hits ,
        o_middle_tar_hits   => middle_tar_hits,
        o_outer_tar_hits    => outer_tar_hits ,
        o_extra_tar_hits    => extra_tar_hits 

        );

    candidate_manager_inst : candidate_manager
      port map (
        clock_and_control => clock_and_control,  --
        ttc_commands      => ttc_commands,       --
        -- candidates in from hal
        i_slc_data_mainA_av     => i_main_primary_slc   ,
        i_slc_data_mainB_av     => i_main_secondary_slc ,
        i_slc_data_neightborA_v => i_plus_neighbor_slc  ,
        i_slc_data_neightborB_v => i_minus_neighbor_slc ,


        -- outputs to ucm
        o_uCM2hps_inn_av => inner_slc_to_hts,
        o_uCM2hps_mid_av  => middle_slc_to_hts,
        o_uCM2hps_out_av => outer_slc_to_hts,
        o_uCM2hps_ext_av => extra_slc_to_hts,

        o_uCM2pl_av    => ucm2pl_av
        );


    hits_to_segments_inst : hits_to_segments
      port map (
        --
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,

        -- inputs from hal
        inner_tar_hits_i  => inner_tar_hits ,
        middle_tar_hits_i => middle_tar_hits,
        outer_tar_hits_i  => outer_tar_hits ,
        extra_tar_hits_i  => extra_tar_hits ,

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

        i_pl2pt_av => pl2pt_av,

        o_pt2mtc => pt2mtc_av
        );

    mtc_builder_inst : mtc_builder
      port map (
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,
        i_ptcalc          => pt2mtc_av,
        i_pl2mtc          => pl2mtc_av,
        o_mtc             => mtc_o,
        o_nsp             => nsp_o
        );

    pipeline_inst : pipeline
      port map (
        --
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,

        -- slc inputs
        i_ucm2pl_av => ucm2pl_av,

        -- slc outputs
        o_pl2pt_av  => pl2pt_av,
        o_pl2mtc_av => pl2mtc_av
        );

    daq_inst : daq
      port map (
        --
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,

        --
        i_inner_tdc_hits  => inner_tdc_hits,
        i_middle_tdc_hits => middle_tdc_hits,
        i_outer_tdc_hits  => outer_tdc_hits,
        i_extra_tdc_hits  => extra_tdc_hits,

        --
        daq_streams_o => daq_streams_o
        );

    sump <= '0';

  end generate;

  dummy_gen : if (DUMMY) generate
    signal tdc_hit_inner_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_INN-1 downto 0);
    signal tdc_hit_middle_sump : std_logic_vector (c_HPS_NUM_MDT_CH_MID-1 downto 0);
    signal tdc_hit_outer_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
    -- signal endcap_hit_sump     : std_logic_vector (c_NUM_SL_ENDCAP_CANDIDATES-1 downto 0);
    -- signal barrel_hit_sump     : std_logic_vector (c_NUM_SL_BARREL_CANDIDATES-1 downto 0);
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
                xor xor_reduce(tdc_hit_outer_sump);
                -- xor xor_reduce (barrel_hit_sump)
                -- xor xor_reduce (endcap_hit_sump);

      end if;
    end process;
  end generate;

end behavioral;
