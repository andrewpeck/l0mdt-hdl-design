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
-- use ctrl_lib.ctrl_constants_pkg.all;
use ctrl_lib.HPS_CTRL.all;
use ctrl_lib.TAR_CTRL.all;
use ctrl_lib.MTC_CTRL.all;
use ctrl_lib.UCM_CTRL.all;
use ctrl_lib.DAQ_CTRL.all;
use ctrl_lib.TF_CTRL.all;
use ctrl_lib.MPL_CTRL.all;
use ctrl_lib.FM_CTRL.all;

library vamc_lib;

library fm_lib;
use fm_lib.fm_ult_pkg.all;

entity ult is
  generic (
    SUMP_SIGNALS : boolean := false;
    DUMMY        : boolean := false
    );
  port (
    -- clock and ttc
    clock_and_control : in l0mdt_control_rt;
    ttc_commands      : in l0mdt_ttc_rt;

    -- control and monitoring
    hps_inn_ctrl_v        : in std_logic_vector; -- : in  H2S_CTRL_t;
    hps_inn_mon_v         : out std_logic_vector;-- : out H2S_MON_t;
    hps_mid_ctrl_v        : in std_logic_vector; -- : in  H2S_CTRL_t;
    hps_mid_mon_v         : out std_logic_vector;-- : out H2S_MON_t;
    hps_out_ctrl_v        : in std_logic_vector; -- : in  H2S_CTRL_t;
    hps_out_mon_v         : out std_logic_vector;-- : out H2S_MON_t;
    hps_ext_ctrl_v        : in std_logic_vector; -- : in  H2S_CTRL_t;
    hps_ext_mon_v         : out std_logic_vector;-- : out H2S_MON_t;

    -- tar_ctrl_v            : in std_logic_vector; --  : in  TAR_CTRL_t;
    -- tar_mon_v             : out std_logic_vector;--  : out TAR_MON_t;
    tar_inn_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    tar_inn_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    tar_mid_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    tar_mid_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    tar_out_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    tar_out_mon_v         : out std_logic_vector;-- : out TAR_MON_t;
    tar_ext_ctrl_v        : in std_logic_vector; -- : in  TAR_CTRL_t;
    tar_ext_mon_v         : out std_logic_vector;-- : out TAR_MON_t;

    mtc_ctrl_v            : in std_logic_vector; --  : in  MTC_CTRL_t;
    mtc_mon_v             : out std_logic_vector;--  : out MTC_MON_t;

    ucm_ctrl_v            : in std_logic_vector; -- : in  UCM_CTRL_t;
    ucm_mon_v             : out std_logic_vector;-- : out UCM_MON_t;

    daq_ctrl_v            : in std_logic_vector; -- : in  DAQ_CTRL_t;
    daq_mon_v             : out std_logic_vector;-- : out DAQ_MON_t;

    tf_ctrl_v             : in std_logic_vector; --  : in  TF_CTRL_t;
    tf_mon_v              : out std_logic_vector;-- : out TF_MON_t;

    mpl_ctrl_v            : in std_logic_vector; -- : in  MPL_CTRL_t;
    mpl_mon_v             : out std_logic_vector;-- : out MPL_MON_t;

    fm_ctrl_v             : in std_logic_vector;
    fm_mon_v              : out std_logic_vector;

    -- TDC Hits from Polmux
    i_inn_tdc_hits_av : in tdcpolmux2tar_avt (c_HPS_MAX_HP_INN -1 downto 0);
    i_mid_tdc_hits_av : in tdcpolmux2tar_avt (c_HPS_MAX_HP_MID -1 downto 0);
    i_out_tdc_hits_av : in tdcpolmux2tar_avt (c_HPS_MAX_HP_OUT -1 downto 0);
    i_ext_tdc_hits_av : in tdcpolmux2tar_avt (c_HPS_MAX_HP_EXT -1 downto 0);



    -- TDC Hits from Tar
    -- i_inner_tar_hits  : in tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_INN -1 downto 0);
    -- i_middle_tar_hits : in tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_MID -1 downto 0);
    -- i_outer_tar_hits  : in tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_OUT -1 downto 0);
    -- i_extra_tar_hits  : in tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_EXT -1 downto 0);

    -- Sector Logic Candidates
    i_main_primary_slc        : in  slc_rx_avt(2 downto 0);  -- is the main SL used
    i_main_secondary_slc      : in  slc_rx_avt(2 downto 0);  -- only used in the big endcap
    i_plus_neighbor_slc       : in  slc_rx_vt;
    i_minus_neighbor_slc      : in  slc_rx_vt;

    -- Segments in from neighbor
    i_plus_neighbor_segments  : in  sf2ptcalc_avt(c_NUM_SF_INPUTS - 1 downto 0);
    i_minus_neighbor_segments : in  sf2ptcalc_avt(c_NUM_SF_INPUTS - 1 downto 0);

    -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
    -- o_daq_streams : out felix_stream_avt (c_HPS_MAX_HP_INN
    --                                           + c_HPS_MAX_HP_MID
    --                                           + c_HPS_MAX_HP_OUT - 1 downto 0);
    o_daq_streams             : out felix_stream_avt (c_NUM_DAQ_STREAMS-1 downto 0);
    -- o_daq_streams             : out felix_data_avt(4-1 downto 0);

    -- Segments Out to Neighbor
    o_plus_neighbor_segments_av  : out sf2ptcalc_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    o_minus_neighbor_segments_av : out sf2ptcalc_avt(c_NUM_SF_OUTPUTS - 1 downto 0);

    -- -- MUCTPI
    o_MTC                     : out mtc_out_avt(c_NUM_MTC-1 downto 0);
    o_NSP                     : out mtc2nsp_avt(c_NUM_NSP-1 downto 0);
    -- AXI Control


    --FM Monitor Data

    sump : out std_logic

    );

end entity ult;
architecture behavioral of ult is

  -- ctrl/mon vectors
  -- signal h2s_ctrl_v : std_logic_vector(width(h2s_ctrl) - 1 downto 0);
  -- signal h2s_mon_v  : std_logic_vector(width(h2s_mon) - 1 downto 0);
  -- signal tar_ctrl_v : std_logic_vector(width(tar_ctrl) - 1 downto 0);
  -- signal tar_mon_v  : std_logic_vector(width(tar_mon) - 1 downto 0);
  -- -- signal mtc_ctrl_v : std_logic_vector(width(mtc_ctrl) - 1 downto 0);
  -- -- signal mtc_mon_v  : std_logic_vector(width(mtc_mon) - 1 downto 0);
  -- signal ucm_ctrl_v : std_logic_vector(width(ucm_ctrl) - 1 downto 0);
  -- signal ucm_mon_v  : std_logic_vector(width(ucm_mon) - 1 downto 0);
  -- -- signal daq_ctrl_v : std_logic_vector(width(daq_ctrl) - 1 downto 0);
  -- -- signal daq_mon_v  : std_logic_vector(width(daq_mon) - 1 downto 0);
  -- -- signal tf_ctrl_v  : std_logic_vector(width(tf_ctrl) - 1 downto 0);
  -- -- signal tf_mon_v   : std_logic_vector(width(tf_mon) - 1 downto 0);
  -- signal mpl_ctrl_v : std_logic_vector(width(mpl_ctrl) - 1 downto 0);
  -- signal mpl_mon_v  : std_logic_vector(width(mpl_mon) - 1 downto 0);

  -- "Xilinx recommends using at least three pipeline stages to cross an SLR:
  -- one at the top, one at the bottom, and one in the middle of the SL"
  --
  -- UG949 7 pipeline stages to cross the whole device for a 3 SLR device at 250
  -- MHz

  signal int_inn_tdc_hits_av : tdcpolmux2tar_avt (c_HPS_MAX_HP_INN -1 downto 0);
  signal int_mid_tdc_hits_av : tdcpolmux2tar_avt (c_HPS_MAX_HP_MID -1 downto 0);
  signal int_out_tdc_hits_av : tdcpolmux2tar_avt (c_HPS_MAX_HP_OUT -1 downto 0);
  signal int_ext_tdc_hits_av : tdcpolmux2tar_avt (c_HPS_MAX_HP_EXT -1 downto 0);

  signal i_inn_tdc_hits_v : std_logic_vector (width(i_inn_tdc_hits_av) -1 downto 0);
  signal i_mid_tdc_hits_v : std_logic_vector (width(i_mid_tdc_hits_av) -1 downto 0);
  signal i_out_tdc_hits_v : std_logic_vector (width(i_out_tdc_hits_av) -1 downto 0);
  signal i_ext_tdc_hits_v : std_logic_vector (width(i_ext_tdc_hits_av) -1 downto 0);

  constant SLR_PIPELINE_DEPTH : integer := 12;

  

  -- outputs from candidate manager
  signal inn_slc_to_h2s_plin_av  : ucm2hps_avt(c_NUM_THREADS-1 downto 0);
  signal mid_slc_to_h2s_plin_av  : ucm2hps_avt(c_NUM_THREADS-1 downto 0);
  signal out_slc_to_h2s_plin_av  : ucm2hps_avt(c_NUM_THREADS-1 downto 0);
  signal ext_slc_to_h2s_plin_av  : ucm2hps_avt(c_NUM_THREADS-1 downto 0);
  signal inn_slc_to_h2s_plout_av  : ucm2hps_avt(c_NUM_THREADS-1 downto 0);
  signal mid_slc_to_h2s_plout_av  : ucm2hps_avt(c_NUM_THREADS-1 downto 0);
  signal out_slc_to_h2s_plout_av  : ucm2hps_avt(c_NUM_THREADS-1 downto 0);
  signal ext_slc_to_h2s_plout_av  : ucm2hps_avt(c_NUM_THREADS-1 downto 0);

  -- type ucm2hps_bus_array_t is array (integer range 0 to SLR_PIPELINE_DEPTH)
  --   of ucm2hps_avt(c_NUM_THREADS-1 downto 0);
  -- signal inn_slc_to_h2s_pipeline : ucm2hps_bus_array_t;
  -- signal mid_slc_to_h2s_pipeline : ucm2hps_bus_array_t;
  -- signal out_slc_to_h2s_pipeline : ucm2hps_bus_array_t;
  -- signal ext_slc_to_h2s_pipeline : ucm2hps_bus_array_t;

  -- attribute shreg_extract : string;
  -- attribute shreg_extract of inn_slc_to_h2s_pipeline : signal is "no";
  -- attribute shreg_extract of mid_slc_to_h2s_pipeline : signal is "no";
  -- attribute shreg_extract of out_slc_to_h2s_pipeline : signal is "no";
  -- attribute shreg_extract of ext_slc_to_h2s_pipeline : signal is "no";

  signal ucm2pl_av         : ucm2pl_avt(c_MAX_NUM_SL -1 downto 0);

  -- TDC Hits from tar 2 hps
  signal ult_inn_tar_hits_in_av  : tar2hps_avt(c_HPS_MAX_HP_INN -1 downto 0);
  signal ult_mid_tar_hits_in_av  : tar2hps_avt(c_HPS_MAX_HP_MID -1 downto 0);
  signal ult_out_tar_hits_in_av  : tar2hps_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  signal ult_ext_tar_hits_in_av  : tar2hps_avt(c_HPS_MAX_HP_EXT -1 downto 0);
  signal ult_inn_tar_hits_out_av  : tar2hps_avt(c_HPS_MAX_HP_INN -1 downto 0);
  signal ult_mid_tar_hits_out_av  : tar2hps_avt(c_HPS_MAX_HP_MID -1 downto 0);
  signal ult_out_tar_hits_out_av  : tar2hps_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  signal ult_ext_tar_hits_out_av  : tar2hps_avt(c_HPS_MAX_HP_EXT -1 downto 0);
  -- TDC Hits from tar 2 daq
  signal ult_inn_tdc_hits_out_av  : tdcpolmux2tar_avt(c_HPS_MAX_HP_INN -1 downto 0);
  signal ult_mid_tdc_hits_out_av  : tdcpolmux2tar_avt(c_HPS_MAX_HP_MID -1 downto 0);
  signal ult_out_tdc_hits_out_av  : tdcpolmux2tar_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  signal ult_ext_tdc_hits_out_av  : tdcpolmux2tar_avt(c_HPS_MAX_HP_EXT -1 downto 0);
  signal ult_inn_tdc_hits_in_av  : tdcpolmux2tar_avt(c_HPS_MAX_HP_INN -1 downto 0);
  signal ult_mid_tdc_hits_in_av  : tdcpolmux2tar_avt(c_HPS_MAX_HP_MID -1 downto 0);
  signal ult_out_tdc_hits_in_av  : tdcpolmux2tar_avt(c_HPS_MAX_HP_OUT -1 downto 0);
  signal ult_ext_tdc_hits_in_av  : tdcpolmux2tar_avt(c_HPS_MAX_HP_EXT -1 downto 0);

  -- outputs from hits to segments
  signal inn_segments_to_pt_plin_av  : sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
  signal mid_segments_to_pt_plin_av  : sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
  signal out_segments_to_pt_plin_av  : sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
  signal ext_segments_to_pt_plin_av  : sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
  signal inn_segments_to_pt_plout_av  : sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
  signal mid_segments_to_pt_plout_av  : sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
  signal out_segments_to_pt_plout_av  : sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
  signal ext_segments_to_pt_plout_av  : sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);

  -- type sf2pt_bus_array_t is array (integer range 0 to SLR_PIPELINE_DEPTH)
  --   of sf2ptcalc_avt(c_NUM_THREADS-1 downto 0);
  -- signal inn_segments_to_pt_pipeline : sf2pt_bus_array_t;
  -- signal mid_segments_to_pt_pipeline : sf2pt_bus_array_t;
  -- signal out_segments_to_pt_pipeline : sf2pt_bus_array_t;
  -- signal ext_segments_to_pt_pipeline : sf2pt_bus_array_t;

  -- attribute shreg_extract of inn_segments_to_pt_pipeline : signal is "no";
  -- attribute shreg_extract of mid_segments_to_pt_pipeline : signal is "no";
  -- attribute shreg_extract of out_segments_to_pt_pipeline : signal is "no";
  -- attribute shreg_extract of ext_segments_to_pt_pipeline : signal is "no";

  -- slc to pt (from pipeline)
  -- signal inner_slc_to_pt  : sf2ptcalc_avt (c_NUM_THREADS-1 downto 0);
  -- signal middle_slc_to_pt : sf2ptcalc_avt (c_NUM_THREADS-1 downto 0);
  -- signal outer_slc_to_pt  : sf2ptcalc_avt (c_NUM_THREADS-1 downto 0);
  -- signal extra_slc_to_pt  : sf2ptcalc_avt (c_NUM_THREADS-1 downto 0);

  -- slc to mtc (from pipeline)
  signal pl2pt_av  : pl2ptcalc_avt (c_NUM_THREADS-1 downto 0);
  signal pl2mtc_av : pl2mtc_avt (c_MAX_NUM_SL-1 downto 0);

  -- pt calc 2 mtc
  signal pt2mtc_av : ptcalc2mtc_avt(c_NUM_THREADS-1 downto 0);
  -- signal pt2mtc : pt2mtc_avt (c_NUM_THREADS-1 downto 0);

  signal ucm_sump : std_logic := '1';
  signal pt_sump  : std_logic := '1';
  signal h2s_sump : std_logic := '1';
  signal tar_sump : std_logic := '1';
  signal mtc_sump : std_logic := '1';
  signal daq_sump : std_logic := '1';
  signal mpl_sump : std_logic := '1';

  --FAST MONITORING
--  signal ult_fm_data : fm_rt_array(0  to total_sb-1);
  signal h2s_fm_data : fm_rt_array(0  to h2s_sb_all_station_n -1);
begin

  -- -- ctrl/mon
  -- ucm_ctrl_v <= convert(ucm_ctrl,ucm_ctrl_v);
  -- ucm_mon <= structify(ucm_mon_v,ucm_mon);
  -- tar_ctrl_v <= convert(tar_ctrl,tar_ctrl_v);
  -- tar_mon <= structify(tar_mon_v,tar_mon);
  -- h2s_ctrl_v <= convert(h2s_ctrl,h2s_ctrl_v);
  -- h2s_mon <= structify(h2s_mon_v,h2s_mon);
  -- mpl_ctrl_v <= convert(mpl_ctrl,mpl_ctrl_v);
  -- mpl_mon <= structify(mpl_mon_v,mpl_mon);
  -- tf_ctrl_v <= convert(tf_ctrl,tf_ctrl_v);
  -- tf_mon <= structify(tf_mon_v,tf_mon);
  -- mtc_ctrl_v <= convert(mtc_ctrl,mtc_ctrl_v);
  -- mtc_mon <= structify(mtc_mon_v,mtc_mon);
  -- daq_ctrl_v <= convert(daq_ctrl,daq_ctrl_v);
  -- daq_mon <= structify(daq_mon_v,daq_mon);

  logic_gen : if (not DUMMY) generate
    TAR_GEN : if c_TAR_ENABLED = '1' generate
      ULT_TAR : entity ult_lib.mdt_tar
      port map (
        -- clock, control, and monitoring
        clock_and_control => clock_and_control,  --
        -- ttc_commands      => ttc_commands,       --
        tar_inn_ctrl_v => tar_inn_ctrl_v,
        tar_inn_mon_v  => tar_inn_mon_v ,
        tar_mid_ctrl_v => tar_mid_ctrl_v,
        tar_mid_mon_v  => tar_mid_mon_v ,
        tar_out_ctrl_v => tar_out_ctrl_v,
        tar_out_mon_v  => tar_out_mon_v ,
        tar_ext_ctrl_v => tar_ext_ctrl_v,
        tar_ext_mon_v  => tar_ext_mon_v ,
        -- TDC Hits from Polmux
        i_inn_tdc_hits_av  => int_inn_tdc_hits_av,
        i_mid_tdc_hits_av  => int_mid_tdc_hits_av,
        i_out_tdc_hits_av  => int_out_tdc_hits_av,
        i_ext_tdc_hits_av  => int_ext_tdc_hits_av,

        -- candidates in from hal
        -- i_inn_tar_hits_av  => i_inner_tar_hits,
        -- i_mid_tar_hits_av  => i_middle_tar_hits,
        -- i_out_tar_hits  => i_outer_tar_hits,
        -- i_ext_tar_hits_av  => i_extra_tar_hits,
        --
        o_inn_tdc_hits_av  => ult_inn_tdc_hits_out_av,
        o_mid_tdc_hits_av  => ult_mid_tdc_hits_out_av,
        o_out_tdc_hits_av  => ult_out_tdc_hits_out_av,
        o_ext_tdc_hits_av  => ult_ext_tdc_hits_out_av,
        -- outputs to h2s_out
        o_inn_tar_hits_av  => ult_inn_tar_hits_out_av,
        o_mid_tar_hits_av  => ult_mid_tar_hits_out_av,
        o_out_tar_hits_av  => ult_out_tar_hits_out_av,
        o_ext_tar_hits_av  => ult_ext_tar_hits_out_av

        -- o_sump          => tar_sump

      );
    else generate

      tar_inn_mon_v <= (tar_inn_mon_v'length - 1 downto 0 => '0');
      tar_mid_mon_v <= (tar_mid_mon_v'length - 1 downto 0 => '0');
      tar_out_mon_v <= (tar_out_mon_v'length - 1 downto 0 => '0');
      tar_ext_mon_v <= (tar_ext_mon_v'length - 1 downto 0 => '0');
    
      SUMP_TAR : entity ult_lib.tar_sump
      port map (
        -- clock, control, and monitoring
        -- clock_and_control => clock_and_control,  --
        -- ttc_commands      => ttc_commands,       --
        -- ctrl              => tar_ctrl,
        -- mon               => tar_mon,
        -- TDC Hits from Polmux
        i_inn_tdc_hits_av  => int_inn_tdc_hits_av,
        i_mid_tdc_hits_av  => int_mid_tdc_hits_av,
        i_out_tdc_hits_av  => int_out_tdc_hits_av,
        i_ext_tdc_hits_av  => int_ext_tdc_hits_av,

        -- candidates in from hal
        -- i_inn_tar_hits_av  => i_inner_tar_hits,
        -- i_mid_tar_hits_av  => i_middle_tar_hits,
        -- i_out_tar_hits  => i_outer_tar_hits,
        -- i_ext_tar_hits_av  => i_extra_tar_hits,
        --
        o_inn_tdc_hits_av  => ult_inn_tdc_hits_out_av,
        o_mid_tdc_hits_av  => ult_mid_tdc_hits_out_av,
        o_out_tdc_hits_av  => ult_out_tdc_hits_out_av,
        o_ext_tdc_hits_av  => ult_ext_tdc_hits_out_av,
        -- outputs to h2s_out
        o_inn_tar_hits_av  => ult_inn_tar_hits_out_av,
        o_mid_tar_hits_av  => ult_mid_tar_hits_out_av,
        o_out_tar_hits_av  => ult_out_tar_hits_out_av,
        o_ext_tar_hits_av  => ult_ext_tar_hits_out_av,

        o_sump          => tar_sump

      );
    end generate;
      
      
      

      HPS_INN : if c_HPS_ENABLE_ST_INN = '1' generate
        int_inn_tdc_hits_av <= i_inn_tdc_hits_av;
        ult_inn_tdc_hits_in_av <= ult_inn_tdc_hits_out_av;
        ult_inn_tar_hits_in_av <= ult_inn_tar_hits_out_av;
      end generate;
      -------------------------------------
      HPS_MID : if c_HPS_ENABLE_ST_MID = '1' generate
        int_mid_tdc_hits_av <= i_mid_tdc_hits_av;
        ult_mid_tdc_hits_in_av <= ult_mid_tdc_hits_out_av;
        ult_mid_tar_hits_in_av <= ult_mid_tar_hits_out_av;
      end generate;
      -------------------------------------
      HPS_OUT : if c_HPS_ENABLE_ST_OUT = '1' generate
        int_out_tdc_hits_av <= i_out_tdc_hits_av;
        ult_out_tdc_hits_in_av <= ult_out_tdc_hits_out_av;
        ult_out_tar_hits_in_av <= ult_out_tar_hits_out_av;
      end generate;
      -------------------------------------
      HPS_EXT : if c_HPS_ENABLE_ST_EXT = '1' generate
        int_ext_tdc_hits_av <= i_ext_tdc_hits_av;
        ult_ext_tdc_hits_in_av <= ult_ext_tdc_hits_out_av;
        ult_ext_tar_hits_in_av <= ult_ext_tar_hits_out_av;
      end generate;

    UCM_GEN : if c_UCM_ENABLED = '1' generate

      -- block
      ULT_UCM : entity ult_lib.candidate_manager
      port map (
        -- clock, control, and monitoring
        clock_and_control       => clock_and_control,  --
        ttc_commands            => ttc_commands,       --
        ctrl_v                    => ucm_ctrl_v,
        mon_v                     => ucm_mon_v,
        -- candidates in from hal
        i_slc_data_mainA_av     => i_main_primary_slc,
        i_slc_data_mainB_av     => i_main_secondary_slc,
        i_slc_data_neighborA_v => i_plus_neighbor_slc,
        i_slc_data_neighborB_v => i_minus_neighbor_slc,
        -- outputs to ucm
        o_uCM2hps_inn_av        => inn_slc_to_h2s_plin_av,
        o_uCM2hps_mid_av        => mid_slc_to_h2s_plin_av,
        o_uCM2hps_out_av        => out_slc_to_h2s_plin_av,
        o_uCM2hps_ext_av        => ext_slc_to_h2s_plin_av,
        -- o_uCM2hps_inn_av        => inn_slc_to_h2s_plin_av,
        -- o_uCM2hps_mid_av        => mid_slc_to_h2s_plin_av,
        -- o_uCM2hps_out_av        => out_slc_to_h2s_plin_av,
        -- o_uCM2hps_ext_av        => ext_slc_to_h2s_plin_av,
        -- pipeline
        o_uCM2pl_av             => ucm2pl_av
      );
    else generate
      ucm_mon_v <= (ucm_mon_v'length - 1 downto 0 => '0');
      SUMP_UCM : entity ult_lib.ucm_sump
      port map (
        -- clock, control, and monitoring
        -- clock_and_control       => clock_and_control,  --
        -- ttc_commands            => ttc_commands,       --
        -- ctrl                    => ucm_ctrl,
        -- mon                     => ucm_mon,
        -- candidates in from hal
        i_slc_data_mainA_av     => i_main_primary_slc,
        i_slc_data_mainB_av     => i_main_secondary_slc,
        i_slc_data_neighborA_v => i_plus_neighbor_slc,
        i_slc_data_neighborB_v => i_minus_neighbor_slc,
        -- outputs to ucm
        o_uCM2hps_inn_av        => inn_slc_to_h2s_plin_av,
        o_uCM2hps_mid_av        => mid_slc_to_h2s_plin_av,
        o_uCM2hps_out_av        => out_slc_to_h2s_plin_av,
        o_uCM2hps_ext_av        => ext_slc_to_h2s_plin_av,
        -- pipeline
        o_uCM2pl_av             => ucm2pl_av,
        o_sump                  => ucm_sump

      );
    end generate;

    slc2hps_loop: for th_i in c_NUM_THREADS -1 downto 0 generate
      HPS_INN : if c_HPS_ENABLE_ST_INN = '1' generate
        SLC2HPS_INN_PL : entity vamc_lib.vamc_spl
          generic map(
            
            g_PIPELINE_TYPE     => "shift_reg",
            g_DELAY_CYCLES      => SLR_PIPELINE_DEPTH,
            g_PIPELINE_WIDTH    => inn_slc_to_h2s_plin_av(th_i)'length,
            --
            g_PL_DV             => '0',
            g_PL_ENABLE_ENA     => '0',
            g_PL_ENABLE_RST     => '0',
            --
            g_SHREG_EXTRACT     => "no"
          )
          port map(
            clk         => clock_and_control.clk,
            rst         => clock_and_control.rst,
            ena         => '1',
            --
            i_data      => inn_slc_to_h2s_plin_av(th_i),
            o_data      => inn_slc_to_h2s_plout_av(th_i)
        );
      end generate;
      -------------------------------------
      HPS_MID : if c_HPS_ENABLE_ST_MID = '1' generate
        SLC2HPS_MID_PL : entity vamc_lib.vamc_spl
          generic map(
            
            g_PIPELINE_TYPE     => "shift_reg",
            g_DELAY_CYCLES      => SLR_PIPELINE_DEPTH,
            g_PIPELINE_WIDTH    => mid_slc_to_h2s_plin_av(th_i)'length,
            --
            g_PL_DV             => '0',
            g_PL_ENABLE_ENA     => '0',
            g_PL_ENABLE_RST     => '0',
            --
            g_SHREG_EXTRACT     => "no"
          )
          port map(
            clk         => clock_and_control.clk,
            rst         => clock_and_control.rst,
            ena         => '1',
            --
            i_data      => mid_slc_to_h2s_plin_av(th_i),
            o_data      => mid_slc_to_h2s_plout_av(th_i)
        );
      end generate;
      -------------------------------------
      HPS_OUT : if c_HPS_ENABLE_ST_OUT = '1' generate
        SLC2HPS_OUT_PL : entity vamc_lib.vamc_spl
          generic map(
            
            g_PIPELINE_TYPE     => "shift_reg",
            g_DELAY_CYCLES      => SLR_PIPELINE_DEPTH,
            g_PIPELINE_WIDTH    => out_slc_to_h2s_plin_av(th_i)'length,
            --
            g_PL_DV             => '0',
            g_PL_ENABLE_ENA     => '0',
            g_PL_ENABLE_RST     => '0',
            --
            g_SHREG_EXTRACT     => "no"
          )
          port map(
            clk         => clock_and_control.clk,
            rst         => clock_and_control.rst,
            ena         => '1',
            --
            i_data      => out_slc_to_h2s_plin_av(th_i),
            o_data      => out_slc_to_h2s_plout_av(th_i)
        );
      end generate;
      -------------------------------------
      HPS_EXT : if c_HPS_ENABLE_ST_EXT = '1' generate
        SLC2HPS_EXT_PL : entity vamc_lib.vamc_spl
          generic map(
            
            g_PIPELINE_TYPE     => "shift_reg",
            g_DELAY_CYCLES      => SLR_PIPELINE_DEPTH,
            g_PIPELINE_WIDTH    => ext_slc_to_h2s_plin_av(th_i)'length,
            --
            g_PL_DV             => '0',
            g_PL_ENABLE_ENA     => '0',
            g_PL_ENABLE_RST     => '0',
            --
            g_SHREG_EXTRACT     => "no"
          )
          port map(
            clk         => clock_and_control.clk,
            rst         => clock_and_control.rst,
            ena         => '1',
            --
            i_data      => ext_slc_to_h2s_plin_av(th_i),
            o_data      => ext_slc_to_h2s_plout_av(th_i)
        );
      end generate;
    end generate;

      
    -- process (clock_and_control.clk) is
    -- begin
    --   if (rising_edge(clock_and_control.clk)) then

    --     for I in 1 to SLR_PIPELINE_DEPTH loop
    --       inn_slc_to_h2s_pipeline(I) <= inn_slc_to_h2s_pipeline(I-1);
    --       mid_slc_to_h2s_pipeline(I) <= mid_slc_to_h2s_pipeline(I-1);
    --       out_slc_to_h2s_pipeline(I) <= out_slc_to_h2s_pipeline(I-1);
    --       ext_slc_to_h2s_pipeline(I) <= ext_slc_to_h2s_pipeline(I-1);
    --     end loop;

    --   end if;
    -- end process;



    H2S_GEN : if c_H2S_ENABLED = '1' generate
      ULT_H2S : entity ult_lib.hits_to_segments
      port map (
        -- clock, control, and monitoring
        clock_and_control         => clock_and_control,
        ttc_commands              => ttc_commands,
        --
        inn_ctrl_v                => hps_inn_ctrl_v,
        inn_mon_v                 => hps_inn_mon_v ,
        mid_ctrl_v                => hps_mid_ctrl_v,
        mid_mon_v                 => hps_mid_mon_v ,
        out_ctrl_v                => hps_out_ctrl_v,
        out_mon_v                 => hps_out_mon_v ,
        ext_ctrl_v                => hps_ext_ctrl_v,
        ext_mon_v                 => hps_ext_mon_v ,
        --
        h2s_fm_data                 => h2s_fm_data,
        -- inputs from hal
        i_inn_tar_hits_av             => ult_inn_tar_hits_in_av,
        i_mid_tar_hits_av             => ult_mid_tar_hits_in_av,
        i_out_tar_hits_av             => ult_out_tar_hits_in_av,
        i_ext_tar_hits_av             => ult_ext_tar_hits_in_av,
        -- Sector Logic Candidates from uCM
        -- i_inn_slc_av                  => inn_slc_to_h2s_av,
        -- i_mid_slc_av                  => mid_slc_to_h2s_av,
        -- i_out_slc_av                  => out_slc_to_h2s_av,
        -- i_ext_slc_av                  => ext_slc_to_h2s_av,
        i_inn_slc_av                  => inn_slc_to_h2s_plout_av,
        i_mid_slc_av                  => mid_slc_to_h2s_plout_av,
        i_out_slc_av                  => out_slc_to_h2s_plout_av,
        i_ext_slc_av                  => ext_slc_to_h2s_plout_av,
        -- Segments Out to pt calculation
        -- o_inn_segments_av             => inn_segments_to_pt_pipeline(0),
        -- o_mid_segments_av             => mid_segments_to_pt_pipeline(0),
        -- o_out_segments_av             => out_segments_to_pt_pipeline(0),
        -- o_ext_segments_av             => ext_segments_to_pt_pipeline(0),
        o_inn_segments_av            => inn_segments_to_pt_plin_av,
        o_mid_segments_av            => mid_segments_to_pt_plin_av,
        o_out_segments_av            => out_segments_to_pt_plin_av,
        o_ext_segments_av            => ext_segments_to_pt_plin_av,
        -- Segment outputs to HA  L
        o_plus_neighbor_segments_av   => o_plus_neighbor_segments_av,
        o_minus_neighbor_segments_av  => o_minus_neighbor_segments_av


        -- o_sump                    => h2s_sump
      );
    else generate

      hps_inn_mon_v <= (hps_inn_mon_v'length - 1 downto 0 => '0');
      hps_mid_mon_v <= (hps_mid_mon_v'length - 1 downto 0 => '0');
      hps_out_mon_v <= (hps_out_mon_v'length - 1 downto 0 => '0');
      hps_ext_mon_v <= (hps_ext_mon_v'length - 1 downto 0 => '0');

      SUMP_H2S : entity ult_lib.h2s_sump
      port map (
        -- clock, control, and monitoring
        -- clock_and_control         => clock_and_control,
        -- ttc_commands              => ttc_commands,
        -- ctrl                      => h2s_ctrl,
        -- mon                       => h2s_mon,
        -- inputs from hal
        i_inn_tar_hits_av            => ult_inn_tar_hits_in_av,
        i_mid_tar_hits_av            => ult_mid_tar_hits_in_av,
        i_out_tar_hits_av            => ult_out_tar_hits_in_av,
        i_ext_tar_hits_av            => ult_ext_tar_hits_in_av,
        -- Sector Logic Candidates from uCM
        -- i_inn_slc_av                 => inn_slc_to_h2s_av,
        -- i_mid_slc_av                 => mid_slc_to_h2s_av,
        -- i_out_slc_av                 => out_slc_to_h2s_av,
        -- i_ext_slc_av                 => ext_slc_to_h2s_av,
        i_inn_slc_av                 => inn_slc_to_h2s_plout_av,
        i_mid_slc_av                 => mid_slc_to_h2s_plout_av,
        i_out_slc_av                 => out_slc_to_h2s_plout_av,
        i_ext_slc_av                 => ext_slc_to_h2s_plout_av,
        -- Segments Out to pt calculation
        -- o_inn_segments_av             => inn_segments_to_pt_pipeline(0),
        -- o_mid_segments_av             => mid_segments_to_pt_pipeline(0),
        -- o_out_segments_av             => out_segments_to_pt_pipeline(0),
        -- o_ext_segments_av             => ext_segments_to_pt_pipeline(0),
        o_inn_segments_av            => inn_segments_to_pt_plin_av,
        o_mid_segments_av            => mid_segments_to_pt_plin_av,
        o_out_segments_av            => out_segments_to_pt_plin_av,
        o_ext_segments_av            => ext_segments_to_pt_plin_av,
        -- Segment outputs to HAL
        o_plus_neighbor_segments_av  => o_plus_neighbor_segments_av,
        o_minus_neighbor_segments_av => o_minus_neighbor_segments_av,

        o_sump                    => h2s_sump
      );
    end generate;

    MPL_GEN : if c_MPL_ENABLED = '1' generate
      ULT_MPL : entity ult_lib.pipeline
      port map (
        -- clock, control, and monitoring
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,
        ctrl_v              => mpl_ctrl_v,
        mon_v               => mpl_mon_v,

        -- Sector Logic Candidates from uCM
        i_ucm2pl_av => ucm2pl_av,

        -- Sector Logic Candidates to pt calculation
        o_pl2pt_av  => pl2pt_av,
        -- Sector Logic Candidates to mTC
        o_pl2mtc_av => pl2mtc_av
      );
    else generate
      mpl_mon_v <= (mpl_mon_v'length - 1 downto 0 => '0');

      SUMP_MPL : entity ult_lib.mpl_sump
      port map (
        -- clock, control, and monitoring
        -- clock_and_control => clock_and_control,
        -- ttc_commands      => ttc_commands,
        -- ctrl              => mpl_ctrl,
        -- mon               => mpl_mon,

        -- Sector Logic Candidates from uCM
        i_ucm2pl_av => ucm2pl_av,

        -- Sector Logic Candidates to pt calculation
        o_pl2pt_av  => pl2pt_av,
        -- Sector Logic Candidates to mTC
        o_pl2mtc_av => pl2mtc_av,

        o_sump => mpl_sump
      );
    end generate;

    hps2pt_loop: for th_i in c_NUM_THREADS -1 downto 0 generate
      HPS_INN : if c_HPS_ENABLE_ST_INN = '1' generate
        SLC2HPS_INN_PL : entity vamc_lib.vamc_spl
          generic map(
            
            g_PIPELINE_TYPE     => "shift_reg",
            g_DELAY_CYCLES      => SLR_PIPELINE_DEPTH,
            g_PIPELINE_WIDTH    => inn_segments_to_pt_plin_av(th_i)'length,
            --
            g_PL_DV             => '0',
            g_PL_ENABLE_ENA     => '0',
            g_PL_ENABLE_RST     => '0',
            --
            g_SHREG_EXTRACT     => "no"
          )
          port map(
            clk         => clock_and_control.clk,
            rst         => clock_and_control.rst,
            ena         => '1',
            --
            i_data      => inn_segments_to_pt_plin_av(th_i),
            o_data      => inn_segments_to_pt_plout_av(th_i)
        );
      end generate;
      -------------------------------------
      HPS_MID : if c_HPS_ENABLE_ST_MID = '1' generate
        SLC2HPS_MID_PL : entity vamc_lib.vamc_spl
          generic map(
            
            g_PIPELINE_TYPE     => "shift_reg",
            g_DELAY_CYCLES      => SLR_PIPELINE_DEPTH,
            g_PIPELINE_WIDTH    => mid_segments_to_pt_plin_av(th_i)'length,
            --
            g_PL_DV             => '0',
            g_PL_ENABLE_ENA     => '0',
            g_PL_ENABLE_RST     => '0',
            --
            g_SHREG_EXTRACT     => "no"
          )
          port map(
            clk         => clock_and_control.clk,
            rst         => clock_and_control.rst,
            ena         => '1',
            --
            i_data      => mid_segments_to_pt_plin_av(th_i),
            o_data      => mid_segments_to_pt_plout_av(th_i)
        );
      end generate;
      -------------------------------------
      HPS_OUT : if c_HPS_ENABLE_ST_OUT = '1' generate
        SLC2HPS_OUT_PL : entity vamc_lib.vamc_spl
          generic map(
            
            g_PIPELINE_TYPE     => "shift_reg",
            g_DELAY_CYCLES      => SLR_PIPELINE_DEPTH,
            g_PIPELINE_WIDTH    => out_segments_to_pt_plin_av(th_i)'length,
            --
            g_PL_DV             => '0',
            g_PL_ENABLE_ENA     => '0',
            g_PL_ENABLE_RST     => '0',
            --
            g_SHREG_EXTRACT     => "no"
          )
          port map(
            clk         => clock_and_control.clk,
            rst         => clock_and_control.rst,
            ena         => '1',
            --
            i_data      => out_segments_to_pt_plin_av(th_i),
            o_data      => out_segments_to_pt_plout_av(th_i)
        );
      end generate;
      -------------------------------------
      HPS_EXT : if c_HPS_ENABLE_ST_EXT = '1' generate
        SLC2HPS_EXT_PL : entity vamc_lib.vamc_spl
          generic map(
            
            g_PIPELINE_TYPE     => "shift_reg",
            g_DELAY_CYCLES      => SLR_PIPELINE_DEPTH,
            g_PIPELINE_WIDTH    => ext_segments_to_pt_plin_av(th_i)'length,
            --
            g_PL_DV             => '0',
            g_PL_ENABLE_ENA     => '0',
            g_PL_ENABLE_RST     => '0',
            --
            g_SHREG_EXTRACT     => "no"
          )
          port map(
            clk         => clock_and_control.clk,
            rst         => clock_and_control.rst,
            ena         => '1',
            --
            i_data      => ext_segments_to_pt_plin_av(th_i),
            o_data      => ext_segments_to_pt_plout_av(th_i)
        );
      end generate;
    end generate;

    PT_GEN : if c_PT_ENABLED = '1' generate
      ULT_PTCALC : entity ult_lib.ptcalc
      port map (
        -- clock, control, and monitoring
        clock_and_control         => clock_and_control,
        ttc_commands              => ttc_commands,
        ctrl_v                    => tf_ctrl_v,
        mon_v                     => tf_mon_v,
        --  segments from neighbors
        i_plus_neighbor_segments  => i_plus_neighbor_segments,
        i_minus_neighbor_segments => i_minus_neighbor_segments,
        -- segments from hps
        i_inn_segments            => inn_segments_to_pt_plout_av,
        i_mid_segments            => mid_segments_to_pt_plout_av,
        i_out_segments            => out_segments_to_pt_plout_av,
        i_ext_segments            => ext_segments_to_pt_plout_av,
        -- i_inn_segments            => inn_segments_to_pt_pipeline(SLR_PIPELINE_DEPTH),
        -- i_mid_segments            => mid_segments_to_pt_pipeline(SLR_PIPELINE_DEPTH),
        -- i_out_segments            => out_segments_to_pt_pipeline(SLR_PIPELINE_DEPTH),
        -- i_ext_segments            => ext_segments_to_pt_pipeline(SLR_PIPELINE_DEPTH),
        -- from pipeline
        i_pl2pt_av                => pl2pt_av,
        -- to mtc
        o_pt2mtc                  => pt2mtc_av,
        -- dummy
        o_sump                    => pt_sump
      );
    else generate
      tf_mon_v <= (tf_mon_v'length - 1 downto 0 => '0');

      SUMP_PT : entity ult_lib.ptc_sump
      port map (
        -- clock, control, and monitoring
        -- clock_and_control         => clock_and_control,
        -- ttc_commands              => ttc_commands,
        -- ctrl                      => tf_ctrl,
        -- mon                       => tf_mon,
        --  segments from neighbors
        i_plus_neighbor_segments  => i_plus_neighbor_segments,
        i_minus_neighbor_segments => i_minus_neighbor_segments,
        -- segments from hps
        -- i_inn_segments            => inn_segments_to_pt_pipeline(0),
        -- i_mid_segments            => mid_segments_to_pt_pipeline(0),
        -- i_out_segments            => out_segments_to_pt_pipeline(0),
        -- i_ext_segments            => ext_segments_to_pt_pipeline(0),
        i_inn_segments            => inn_segments_to_pt_plout_av,
        i_mid_segments            => mid_segments_to_pt_plout_av,
        i_out_segments            => out_segments_to_pt_plout_av,
        i_ext_segments            => ext_segments_to_pt_plout_av,
        -- from pipeline
        i_pl2pt_av                => pl2pt_av,
        -- to mtc
        o_pt2mtc                  => pt2mtc_av,
        -- dummy
        o_sump                    => pt_sump
      );
    end generate;

    MTC_GEN : if c_MTC_ENABLED = '1' generate
      ULT_MTCB : entity ult_lib.mtc_builder
      port map (
        -- clock, control, and monitoring
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,
        ctrl_v            => mtc_ctrl_v,
        mon_v             => mtc_mon_v,
        --  inputs
        i_ptcalc          => pt2mtc_av,
        i_pl2mtc          => pl2mtc_av,
        -- outputs
        o_mtc             => o_mtc,
        o_nsp             => o_nsp,

        o_sump            => mtc_sump
      );
    else generate
      mtc_mon_v <= (mtc_mon_v'length - 1 downto 0 => '0');

      ULT_MTCB : entity ult_lib.mtc_sump
      port map (
        -- clock, control, and monitoring
        -- clock_and_control => clock_and_control,
        -- ttc_commands      => ttc_commands,
        -- ctrl              => mtc_ctrl,
        -- mon               => mtc_mon,
        --  inputs
        i_ptcalc          => pt2mtc_av,
        i_pl2mtc          => pl2mtc_av,
        -- outputs
        o_mtc             => o_mtc,
        o_nsp             => o_nsp,

        o_sump            => mtc_sump
      );
    end generate;

    DAQ_GEN : if c_DAQ_ENABLED = '1' generate
      ULT_DAQ : entity ult_lib.daq
        -- generic map(DELAY => 9600, memory_type => "ultra")
        port map (
          -- clock, control, and monitoring
          clock_and_control => clock_and_control,
          ttc_commands      => ttc_commands,
          ctrl_v            => daq_ctrl_v,
          mon_v             => daq_mon_v,
          ----------------------------------------------------------------------
          i_flags     => (others => '0'), -- : in  std_logic_vector(6 downto 0);
          i_ec        => '0', -- : in  std_logic;
          i_sector_id => (others => '0'), -- : in  std_logic_vector(3 downto 0);
          i_frag_id   => (others => '0'), -- : in  std_logic_vector(3 downto 0);
          ----------------------------------------------------------------------
          -- TDC Hits from Polmux
          i_inn_tdc_hits_av  => ult_inn_tdc_hits_in_av,
          i_mid_tdc_hits_av  => ult_mid_tdc_hits_in_av,
          i_out_tdc_hits_av  => ult_out_tdc_hits_in_av,
          i_ext_tdc_hits_av  => ult_ext_tdc_hits_in_av,

          -- Tracks from MTC
          -- ???

          -- Array of DAQ data streams (e.g. 64 bit streams) to send to MGT
          o_daq_streams => o_daq_streams

          -- o_sump => daq_sump
          );

      else generate

        daq_mon_v <= (daq_mon_v'length - 1 downto 0 => '0');

        SUMP_DAQ : entity ult_lib.daq_sump
        -- generic map(DELAY => 9600, memory_type => "ultra")
        port map (
          -- clock, control, and monitoring
          -- clock_and_control => clock_and_control,
          -- ttc_commands      => ttc_commands,
          -- ctrl              => daq_ctrl,
          -- mon               => daq_mon,

          -- TDC Hits from Polmux
          i_inn_tdc_hits_av  => ult_inn_tdc_hits_in_av,
          i_mid_tdc_hits_av  => ult_mid_tdc_hits_in_av,
          i_out_tdc_hits_av  => ult_out_tdc_hits_in_av,
          i_ext_tdc_hits_av  => ult_ext_tdc_hits_in_av,

          -- Tracks from MTC
          -- ???

          -- Array of DAQ data streams (e.g. 64 bit streams) to send to MGT
          o_daq_streams => o_daq_streams,

          o_sump => daq_sump
        );
      end generate;

      --Fast Monitoring
    FM_GEN : if c_FM_ENABLED = '1' generate
    

      ULT_FM : entity ult_lib.ult_fm
      port map (
        -- clock, control, and monitoring
        clock_and_control => clock_and_control,
        ttc_commands      => ttc_commands,
        ctrl_v            => fm_ctrl_v,
        mon_v             => fm_mon_v,
        --  inputs
        h2s_fm_data   => h2s_fm_data
--        ult_fm_data      => ult_fm_data
      );
    else generate
      SUMP_FM:
           fm_mon_v <= (fm_mon_v'length - 1 downto 0 => '0');
    end generate;


    sump <= tar_sump xor ucm_sump xor h2s_sump xor pt_sump xor mtc_sump xor daq_sump xor mpl_sump;

    else generate









  -- dummy_gen : if (DUMMY) generate
    signal tdc_hit_inner_sump  : std_logic_vector (c_HPS_MAX_HP_INN-1 downto 0);
    signal tdc_hit_middle_sump : std_logic_vector (c_HPS_MAX_HP_MID-1 downto 0);
    signal tdc_hit_outer_sump  : std_logic_vector (c_HPS_MAX_HP_OUT-1 downto 0);
    signal tdc_hit_extra_sump  : std_logic_vector (c_HPS_MAX_HP_OUT-1 downto 0);

    signal slc_data_mainA_av     : std_logic_vector(2 downto 0);
    signal slc_data_mainB_av     : std_logic_vector(2 downto 0);
    signal slc_data_neighborA_v  : std_logic;
    signal slc_data_neighborB_v  : std_logic;
  begin

    MDT_INN_SUMP: for I in 0 to 2 generate
      slc_data_mainA_av(I) <= xor_reduce(i_main_primary_slc(I));
      slc_data_mainB_av(I) <= xor_reduce(i_main_secondary_slc(I));
    end generate;
      slc_data_neighborA_v <= xor_reduce(i_plus_neighbor_slc);
      slc_data_neighborB_v <= xor_reduce(i_minus_neighbor_slc);

    sump_proc : process (clock_and_control.clk) is
    begin  -- process tdc_hit_sump_proc
      if (rising_edge(clock_and_control.clk)) then  -- rising clock edge

        inner_tdc_sump_loop : for I in 0 to c_HPS_MAX_HP_INN-1 loop
          tdc_hit_inner_sump(I) <= xor_reduce(convert(i_inn_tdc_hits_av(I),i_inn_tdc_hits_v));
        end loop;
        middle_tdc_sump_loop : for I in 0 to c_HPS_MAX_HP_MID-1 loop
          tdc_hit_middle_sump(I) <= xor_reduce(convert(i_mid_tdc_hits_av(I),i_mid_tdc_hits_v));
        end loop;
        outer_tdc_sump_loop : for I in 0 to c_HPS_MAX_HP_OUT-1 loop
          tdc_hit_outer_sump(I) <= xor_reduce(convert(i_out_tdc_hits_av(I),i_out_tdc_hits_v));
        end loop;
        extra_tdc_sump_loop : for I in 0 to c_HPS_MAX_HP_EXT-1 loop
          tdc_hit_extra_sump(I) <= xor_reduce(convert(i_ext_tdc_hits_av(I),i_ext_tdc_hits_v));
        end loop;

        sump <= xor_reduce(tdc_hit_inner_sump)
                xor xor_reduce(tdc_hit_middle_sump)
                xor xor_reduce(tdc_hit_outer_sump)
                xor xor_reduce(tdc_hit_extra_sump)
                xor xor_reduce(slc_data_mainA_av)
                xor xor_reduce(slc_data_mainB_av)
                xor slc_data_neighborA_v
                xor slc_data_neighborB_v;
      end if;
    end process;
  end generate;

end behavioral;
