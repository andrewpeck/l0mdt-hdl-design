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
-- use shared_lib.vhdl2008_functions_pkg.all;
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


entity top_ult is
  generic (
    DUMMY       : boolean := false
    );

  port (
    -- pipeline clock
    -- clock_and_control : in l0mdt_control_rt;
    clk                 : in std_logic;
    rst                 : in std_logic;
    bx                  : in std_logic;

    ttc_commands      : in l0mdt_ttc_rt;

    -- axi control

    h2s_ctrl_v : in  std_logic_vector;--H2S_CTRL_t;
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
    i_inner_tdc_hits  : in mdt_polmux_bus_avt (c_HPS_MAX_HP_INN -1 downto 0);
    i_middle_tdc_hits : in mdt_polmux_bus_avt (c_HPS_MAX_HP_MID -1 downto 0);
    i_outer_tdc_hits  : in mdt_polmux_bus_avt (c_HPS_MAX_HP_OUT -1 downto 0);
    i_extra_tdc_hits  : in mdt_polmux_bus_avt (c_HPS_MAX_HP_EXT -1 downto 0);

    -- TDC Hits from Tar
    -- i_inner_tar_hits  : in tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_INN -1 downto 0);
    -- i_middle_tar_hits : in tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_MID -1 downto 0);
    -- i_outer_tar_hits  : in tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_OUT -1 downto 0);
    -- i_extra_tar_hits  : in tar2hps_bus_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_EXT -1 downto 0);

    -- Sector Logic Candidates
    i_main_primary_slc        : in slc_rx_bus_avt(2 downto 0);  -- is the main SL used
    i_main_secondary_slc      : in slc_rx_bus_avt(2 downto 0);  -- only used in the big endcap
    i_plus_neighbor_slc       : in slc_rx_rvt;
    i_minus_neighbor_slc      : in slc_rx_rvt;
    -- Segments in from neighbor
    i_plus_neighbor_segments  : in sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);
    i_minus_neighbor_segments : in sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);

    -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
    o_daq_streams : out felix_stream_bus_avt (c_NUM_DAQ_STREAMS-1 downto 0);

    -- Segments Out to Neighbor
    o_plus_neighbor_segments  : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    o_minus_neighbor_segments : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);

    -- MUCTPI
    o_MTC : out mtc_out_bus_avt(c_NUM_MTC-1 downto 0);
    o_NSP : out mtc2nsp_bus_avt(c_NUM_NSP-1 downto 0);

    sump : out std_logic

    );

end entity top_ult;

architecture behavioral of top_ult is
  signal clock_and_control : l0mdt_control_rt;

begin

  clock_and_control.clk <= clk;
  clock_and_control.rst <= rst;
  clock_and_control.bx  <= bx;


  ULT : entity ult_lib.ult
    generic map(
      DUMMY       => DUMMY
      )
    port map(
      -- pipeline clock
      clock_and_control => clock_and_control,
      ttc_commands      => ttc_commands,

      -- TDC Hits from Polmux
      i_inn_tdc_hits_av => i_inner_tdc_hits,
      i_mid_tdc_hits_av => i_middle_tdc_hits,
      i_out_tdc_hits_av => i_outer_tdc_hits,
      i_ext_tdc_hits_av => i_extra_tdc_hits,

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

      h2s_ctrl_v => h2s_ctrl_v,
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
      o_daq_streams => o_daq_streams,

      -- Segments Out to Neighbor
      o_plus_neighbor_segments_av  => o_plus_neighbor_segments,
      o_minus_neighbor_segments_av => o_minus_neighbor_segments,

      -- MUCTPI
      o_MTC => o_MTC,
      o_NSP => o_NSP,

      sump => sump
      );


end behavioral;
