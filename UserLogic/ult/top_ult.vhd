-- --------------------------------------------------------------------------------
-- --
-- --
-- --
-- --------------------------------------------------------------------------------
-- --  Project: ATLAS L0MDT Trigger
-- --  Module: User Logic Top
-- --  Description:
-- --
-- --------------------------------------------------------------------------------
-- --  Revisions:
-- --
-- --------------------------------------------------------------------------------

-- library ieee;
-- use ieee.std_logic_misc.all;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;

-- library shared_lib;
-- use shared_lib.common_ieee_pkg.all;
-- use shared_lib.l0mdt_constants_pkg.all;
-- use shared_lib.l0mdt_dataformats_pkg.all;
-- use shared_lib.common_constants_pkg.all;
-- use shared_lib.common_types_pkg.all;
-- use shared_lib.config_pkg.all;
-- -- use shared_lib.vhdl2008_functions_pkg.all;
-- use shared_lib.detector_param_pkg.all;

-- library ult_lib;

-- library ctrl_lib;
-- use ctrl_lib.HPS_CTRL.all;
-- use ctrl_lib.TAR_CTRL.all;
-- use ctrl_lib.MTC_CTRL.all;
-- use ctrl_lib.UCM_CTRL.all;
-- use ctrl_lib.DAQ_CTRL.all;
-- use ctrl_lib.TF_CTRL.all;
-- use ctrl_lib.MPL_CTRL.all;
-- use ctrl_lib.FM_CTRL.all;

-- library fm_lib;
-- use fm_lib.fm_ult_pkg.all;


-- entity top_ult is
--   generic (
--     DUMMY       : boolean := false

--     -- g_h2s_ctrl  : H2S_CTRL_t := nullify(g_h2s_ctrl);
--     );

--   port (
--     -- pipeline clock
--     -- clock_and_control : in l0mdt_control_rt;
--     clk                 : in std_logic;
--     rst                 : in std_logic;
--     bx                  : in std_logic;

--     ttc_commands        : in l0mdt_ttc_rt;

--     -- axi control

--     h2s_ctrl_r            : in  H2S_CTRL_t;
--     h2s_mon_r             : out H2S_MON_t;

--     tar_ctrl_r            : in  TAR_CTRL_t;
--     tar_mon_r             : out TAR_MON_t;

--     mtc_ctrl_r            : in  MTC_CTRL_t;
--     mtc_mon_r             : out MTC_MON_t;

--     ucm_ctrl_r            : in  UCM_CTRL_t;
--     ucm_mon_r             : out UCM_MON_t;

--     daq_ctrl_r            : in  DAQ_CTRL_t;
--     daq_mon_r             : out DAQ_MON_t;

--     tf_ctrl_r             : in  TF_CTRL_t;
--     tf_mon_r              : out TF_MON_t;

--     mpl_ctrl_r            : in  MPL_CTRL_t;
--     mpl_mon_r             : out MPL_MON_t;

--     fm_ctrl_r             : in FM_CTRL_t;
--     fm_mon_r              : out FM_MON_t;

--     -- TDC Hits from Polmux
--     i_inner_tdc_hits  : in tdcpolmux2tar_avt (c_HPS_MAX_HP_INN -1 downto 0);
--     i_middle_tdc_hits : in tdcpolmux2tar_avt (c_HPS_MAX_HP_MID -1 downto 0);
--     i_outer_tdc_hits  : in tdcpolmux2tar_avt (c_HPS_MAX_HP_OUT -1 downto 0);
--     i_extra_tdc_hits  : in tdcpolmux2tar_avt (c_HPS_MAX_HP_EXT -1 downto 0);

--     -- TDC Hits from Tar
--     -- i_inner_tar_hits  : in tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_INN -1 downto 0);
--     -- i_middle_tar_hits : in tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_MID -1 downto 0);
--     -- i_outer_tar_hits  : in tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_OUT -1 downto 0);
--     -- i_extra_tar_hits  : in tar2hps_avt (c_EN_TAR_HITS*c_HPS_MAX_HP_EXT -1 downto 0);

--     -- Sector Logic Candidates
--     i_main_primary_slc        : in slc_rx_avt(2 downto 0);  -- is the main SL used
--     i_main_secondary_slc      : in slc_rx_avt(2 downto 0);  -- only used in the big endcap
--     i_plus_neighbor_slc       : in slc_rx_rvt;
--     i_minus_neighbor_slc      : in slc_rx_rvt;
--     -- Segments in from neighbor
--     i_plus_neighbor_segments  : in sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);
--     i_minus_neighbor_segments : in sf2pt_bus_avt(c_NUM_SF_INPUTS - 1 downto 0);

--     -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
--     o_daq_streams     : out felix_stream_bus_avt (c_HPS_MAX_HP_INN
--                                                   + c_HPS_MAX_HP_MID
--                                                   + c_HPS_MAX_HP_OUT - 1 downto 0);
--     -- o_daq_streams : out felix_stream_bus_avt (c_NUM_DAQ_STREAMS-1 downto 0);

--     -- Segments Out to Neighbor
--     o_plus_neighbor_segments  : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
--     o_minus_neighbor_segments : out sf2pt_bus_avt(c_NUM_SF_OUTPUTS - 1 downto 0);

--     -- MUCTPI
--     o_MTC : out mtc_out_bus_avt(c_NUM_MTC-1 downto 0);
--     o_NSP : out mtc2nsp_bus_avt(c_NUM_NSP-1 downto 0);

--     sump : out std_logic

--     );

-- end entity top_ult;

-- architecture behavioral of top_ult is
--   signal clock_and_control : l0mdt_control_rt;

--   signal h2s_ctrl_v            : std_logic_vector(len(h2s_ctrl_r ) -1 downto 0);
--   signal h2s_mon_v             : std_logic_vector(len(h2s_mon_r  ) -1 downto 0);
--   signal tar_ctrl_v            : std_logic_vector(len(tar_ctrl_r ) -1 downto 0);
--   signal tar_mon_v             : std_logic_vector(len(tar_mon_r  ) -1 downto 0);
--   signal mtc_ctrl_v            : std_logic_vector(len(mtc_ctrl_r ) -1 downto 0);
--   signal mtc_mon_v             : std_logic_vector(len(mtc_mon_r  ) -1 downto 0);
--   signal ucm_ctrl_v            : std_logic_vector(len(ucm_ctrl_r ) -1 downto 0);
--   signal ucm_mon_v             : std_logic_vector(len(ucm_mon_r  ) -1 downto 0);
--   signal daq_ctrl_v            : std_logic_vector(len(daq_ctrl_r ) -1 downto 0);
--   signal daq_mon_v             : std_logic_vector(len(daq_mon_r  ) -1 downto 0);
--   signal tf_ctrl_v             : std_logic_vector(len(tf_ctrl_r  ) -1 downto 0);
--   signal tf_mon_v              : std_logic_vector(len(tf_mon_r   ) -1 downto 0);
--   signal mpl_ctrl_v            : std_logic_vector(len(mpl_ctrl_r ) -1 downto 0);
--   signal mpl_mon_v             : std_logic_vector(len(mpl_mon_r  ) -1 downto 0);
--   signal fm_ctrl_v             : std_logic_vector(len(fm_ctrl_r  ) -1 downto 0);
--   signal fm_mon_v              : std_logic_vector(len(fm_mon_r  ) -1 downto 0);
-- begin

--   -- ctrl/mon
--   ucm_ctrl_v  <= vectorify(ucm_ctrl_r,ucm_ctrl_v);
--   ucm_mon_r   <= structify(ucm_mon_v,ucm_mon_r);
--   tar_ctrl_v  <= vectorify(tar_ctrl_r,tar_ctrl_v);
--   tar_mon_r   <= structify(tar_mon_v,tar_mon_r);
--   h2s_ctrl_v  <= vectorify(h2s_ctrl_r,h2s_ctrl_v);
--   h2s_mon_r   <= structify(h2s_mon_v,h2s_mon_r);
--   mpl_ctrl_v  <= vectorify(mpl_ctrl_r,mpl_ctrl_v);
--   mpl_mon_r   <= structify(mpl_mon_v,mpl_mon_r);
--   tf_ctrl_v   <= vectorify(tf_ctrl_r,tf_ctrl_v);
--   tf_mon_r    <= structify(tf_mon_v,tf_mon_r);
--   mtc_ctrl_v  <= vectorify(mtc_ctrl_r,mtc_ctrl_v);
--   mtc_mon_r   <= structify(mtc_mon_v,mtc_mon_r);
--   daq_ctrl_v  <= vectorify(daq_ctrl_r,daq_ctrl_v);
--   daq_mon_r   <= structify(daq_mon_v,daq_mon_r);
--   fm_ctrl_v   <= vectorify(fm_ctrl_r,fm_ctrl_v);
--   fm_mon_r    <= structify(fm_mon_v,fm_mon_r);
  
  
--   clock_and_control.clk <= clk;
--   clock_and_control.rst <= rst;
--   clock_and_control.bx  <= bx;


--   ULT : entity ult_lib.ult
--     generic map(
--       DUMMY       => DUMMY
--       )
--     port map(
--       -- pipeline clock
--       clock_and_control => clock_and_control,
--       ttc_commands      => ttc_commands,

--       -- TDC Hits from Polmux
--       i_inn_tdc_hits_av => i_inner_tdc_hits,
--       i_mid_tdc_hits_av => i_middle_tdc_hits,
--       i_out_tdc_hits_av => i_outer_tdc_hits,
--       i_ext_tdc_hits_av => i_extra_tdc_hits,

--       -- TAR Hits for simulation
--       -- i_inner_tar_hits  => i_inner_tar_hits,
--       -- i_middle_tar_hits => i_middle_tar_hits,
--       -- i_outer_tar_hits  => i_outer_tar_hits,
--       -- i_extra_tar_hits  => i_extra_tar_hits,

--       -- Sector Logic Candidates
--       i_main_primary_slc   => i_main_primary_slc,
--       i_main_secondary_slc => i_main_secondary_slc,
--       i_plus_neighbor_slc  => i_plus_neighbor_slc,
--       i_minus_neighbor_slc => i_minus_neighbor_slc,

--       -- Segments in from neighbor
--       i_plus_neighbor_segments  => i_plus_neighbor_segments,
--       i_minus_neighbor_segments => i_minus_neighbor_segments,

--       -- ULT Control

--       h2s_ctrl_v => h2s_ctrl_v,
--       h2s_mon_v  => h2s_mon_v,
--       tar_ctrl_v => tar_ctrl_v,
--       tar_mon_v  => tar_mon_v,
--       mtc_ctrl_v => mtc_ctrl_v,
--       mtc_mon_v  => mtc_mon_v,
--       ucm_ctrl_v => ucm_ctrl_v,
--       ucm_mon_v  => ucm_mon_v,
--       daq_ctrl_v => daq_ctrl_v,
--       daq_mon_v  => daq_mon_v,
--       tf_ctrl_v  => tf_ctrl_v,
--       tf_mon_v   => tf_mon_v,
--       mpl_ctrl_v => mpl_ctrl_v,
--       mpl_mon_v  => mpl_mon_v,

--       fm_ctrl_v  => fm_ctrl_v,
--       fm_mon_v   => fm_mon_v,

--       -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
--       o_daq_streams => o_daq_streams,

--       -- Segments Out to Neighbor
--       o_plus_neighbor_segments_av  => o_plus_neighbor_segments,
--       o_minus_neighbor_segments_av => o_minus_neighbor_segments,

--       -- MUCTPI
--       o_MTC => o_MTC,
--       o_NSP => o_NSP,

--       sump => sump
--       );


-- end behavioral;
