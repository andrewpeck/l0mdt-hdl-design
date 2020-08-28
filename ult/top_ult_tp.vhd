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


entity top_ult_tp is
  generic (
    DUMMY       : boolean := false;
    EN_TAR_HITS : integer := 1;
    EN_MDT_HITS : integer := 0
    );

  port (
    -- pipeline clock
    clock_and_control : in l0mdt_control_rt;
    ttc_commands      : in l0mdt_ttc_rt;

    -- axi control

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
    i_inner_tdc_hits  : in mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_middle_tdc_hits : in mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_outer_tdc_hits  : in mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_extra_tdc_hits  : in mdt_polmux_bus_avt (EN_MDT_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);

    -- TDC Hits from Tar
    i_inner_tar_hits  : in tar2hps_bus_avt (EN_TAR_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_middle_tar_hits : in tar2hps_bus_avt (EN_TAR_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_outer_tar_hits  : in tar2hps_bus_avt (EN_TAR_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_extra_tar_hits  : in tar2hps_bus_avt (EN_TAR_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);

    -- Sector Logic Candidates
    i_main_primary_slc        : in slc_rx_bus_avt(2 downto 0);  -- is the main SL used
    i_main_secondary_slc      : in slc_rx_bus_avt(2 downto 0);  -- only used in the big endcap
    i_plus_neighbor_slc       : in slc_rx_rvt;
    i_minus_neighbor_slc      : in slc_rx_rvt;
    -- Segments in from neighbor
    plus_neighbor_segments_i  : in sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);
    minus_neighbor_segments_i : in sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);

    -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
    daq_streams_o : out felix_stream_bus_avt (c_NUM_DAQ_STREAMS-1 downto 0);

    -- Segments Out to Neighbor
    plus_neighbor_segments_o  : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    minus_neighbor_segments_o : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);

    -- MUCTPI
    MTC_o : out mtc_out_bus_avt(c_NUM_MTC-1 downto 0);
    NSP_o : out mtc2nsp_bus_avt(c_NUM_NSP-1 downto 0);

    sump : out std_logic

    );

end entity top_ult_tp;

architecture behavioral of top_ult_tp is

begin

  ULT : entity ult_lib.ult
    generic map(
      EN_TAR_HITS => EN_TAR_HITS,
      EN_MDT_HITS => EN_MDT_HITS,
      DUMMY       => DUMMY
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


end behavioral;
