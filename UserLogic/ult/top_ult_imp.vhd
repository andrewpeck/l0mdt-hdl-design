--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ult
-- File: top_ult_imp.vhd
-- Module: <<moduleName>>
-- File PATH: /top_ult_imp.vhd
-- -----
-- File Created: Friday, 9th June 2020 10:11:27 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Friday, 17th February 2023 10:17:41 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
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



entity top_ult is
  generic (
    PRJ_INFO            : string  := "not_defined";
    DUMMY       : boolean := false
    );

  port (
    -- pipeline clock
    -- clock_and_control : in l0mdt_control_rt;
    clk                 : in std_logic;
    rst                 : in std_logic;
    bx                  : in std_logic;

    ttc_commands        : in l0mdt_ttc_rt;

    -- axi control

    hps_inn_ctrl_b        :  in std_logic; 
    hps_inn_mon_b         : out std_logic;
    hps_mid_ctrl_b        :  in std_logic; 
    hps_mid_mon_b         : out std_logic;
    hps_out_ctrl_b        :  in std_logic; 
    hps_out_mon_b         : out std_logic;
    hps_ext_ctrl_b        :  in std_logic; 
    hps_ext_mon_b         : out std_logic;

    tar_inn_ctrl_b        :  in std_logic; 
    tar_inn_mon_b         : out std_logic;
    tar_mid_ctrl_b        :  in std_logic; 
    tar_mid_mon_b         : out std_logic;
    tar_out_ctrl_b        :  in std_logic; 
    tar_out_mon_b         : out std_logic;
    tar_ext_ctrl_b        :  in std_logic; 
    tar_ext_mon_b         : out std_logic;

    mtc_ctrl_b            : in  std_logic;
    mtc_mon_b             : out std_logic;

    ucm_ctrl_b            : in  std_logic;
    ucm_mon_b             : out std_logic;

    daq_ctrl_b            : in  std_logic;
    daq_mon_b             : out std_logic;

    tf_ctrl_b             : in  std_logic;
    tf_mon_b              : out std_logic;

    mpl_ctrl_b            : in  std_logic;--
    mpl_mon_b             : out std_logic;

    fm_ctrl_b             : in std_logic;
    fm_mon_b              : out std_logic;
    

    -- TDC Hits from Polmux
    i_inn_tdc_hits_ab  : in std_logic_vector(c_HPS_NUM_MDT_CH_INN -1 downto 0);--tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
    i_mid_tdc_hits_ab  : in std_logic_vector(c_HPS_NUM_MDT_CH_MID -1 downto 0);--tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
    i_out_tdc_hits_ab  : in std_logic_vector(c_HPS_NUM_MDT_CH_OUT -1 downto 0);--tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    i_ext_tdc_hits_ab  : in std_logic_vector(c_HPS_NUM_MDT_CH_EXT -1 downto 0);--tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);

    -- TDC Hits from Tar
    -- i_inner_tar_hits  : in tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_INN -1 downto 0);
    -- i_middle_tar_hits : in tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_MID -1 downto 0);
    -- i_outer_tar_hits  : in tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_OUT -1 downto 0);
    -- i_extra_tar_hits  : in tar2hps_avt (c_EN_TAR_HITS*c_HPS_NUM_MDT_CH_EXT -1 downto 0);

    -- Sector Logic Candidates
    i_main_primary_slc_ab        : in std_logic_vector(2 downto 0);--slc_rx_avt(2 downto 0);  -- is the main SL used
    i_main_secondary_slc_ab      : in std_logic_vector(2 downto 0);--slc_rx_avt(2 downto 0);  -- only used in the big endcap
    i_plus_neighbor_slc_b       : in std_logic;--slc_rx_vt;
    i_minus_neighbor_slc_b      : in std_logic;--slc_rx_vt;
    -- Segments in from neighbor
    i_plus_neighbor_segments_ab  : in std_logic_vector(c_NUM_SF_INPUTS - 1 downto 0);--sf2ptcalc_avt(c_NUM_SF_INPUTS - 1 downto 0);
    i_minus_neighbor_segments_ab : in std_logic_vector(c_NUM_SF_INPUTS - 1 downto 0);--sf2ptcalc_avt(c_NUM_SF_INPUTS - 1 downto 0);

    -- Array of DAQ data streams (e.g. 64 bit strams) to send to MGT
    o_daq_streams_ab     : out std_logic_vector(c_DAQ_LINKS - 1 downto 0);--felix_stream_avt (c_HPS_NUM_MDT_CH_INN + c_HPS_NUM_MDT_CH_MID + c_HPS_NUM_MDT_CH_OUT - 1 downto 0);
    -- o_daq_streams : out felix_stream_avt (c_NUM_DAQ_STREAMS-1 downto 0);

    -- Segments Out to Neighbor
    o_plus_neighbor_segments_ab  : out std_logic_vector(c_NUM_SF_OUTPUTS - 1 downto 0);--sf2ptcalc_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
    o_minus_neighbor_segments_ab : out std_logic_vector(c_NUM_SF_OUTPUTS - 1 downto 0);--sf2ptcalc_avt(c_NUM_SF_OUTPUTS - 1 downto 0);

    -- MUCTPI
    o_MTC_ab : out std_logic_vector(c_NUM_MTC-1 downto 0);--mtc_out_avt(c_NUM_MTC-1 downto 0);
    o_NSP_ab : out std_logic_vector(c_NUM_NSP-1 downto 0);--mtc2nsp_avt(c_NUM_NSP-1 downto 0);

    sump : out std_logic

    );

end entity top_ult;

architecture behavioral of top_ult is
  signal clock_and_control     : l0mdt_control_rt;
  signal axi_reset_n : std_logic;

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

  signal i_inner_tdc_hits  : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal i_middle_tdc_hits : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal i_outer_tdc_hits  : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal i_extra_tdc_hits  : tdcpolmux2tar_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);

  signal temp_tdcpolmux2tar_vt : tdcpolmux2tar_vt;
  constant TDCPOLMUX2TAR_LEN : integer := temp_tdcpolmux2tar_vt'length;

  type mdt_polmux_bus_std_avt is array(integer range <>) of std_logic_vector(TDCPOLMUX2TAR_LEN - 1 downto 0);

  signal i_inn_tdc_hits_av : mdt_polmux_bus_std_avt (c_HPS_NUM_MDT_CH_INN -1 downto 0);
  signal i_mid_tdc_hits_av : mdt_polmux_bus_std_avt (c_HPS_NUM_MDT_CH_MID -1 downto 0);
  signal i_out_tdc_hits_av : mdt_polmux_bus_std_avt (c_HPS_NUM_MDT_CH_OUT -1 downto 0);
  signal i_ext_tdc_hits_av : mdt_polmux_bus_std_avt (c_HPS_NUM_MDT_CH_EXT -1 downto 0);

  signal temp_slc_rx_vt : slc_rx_vt;
  constant SLC_RX_LEN : integer := temp_slc_rx_vt'length;

  signal i_main_primary_slc        :slc_rx_avt(2 downto 0);  -- is the main SL used
  signal i_main_secondary_slc      :slc_rx_avt(2 downto 0);  -- only used in the big endcap
  signal i_plus_neighbor_slc       :slc_rx_vt;
  signal i_minus_neighbor_slc      :slc_rx_vt;

  type slc_rx_bus_std_avt is array(integer range <>) of std_logic_vector(SLC_RX_LEN - 1 downto 0);

  signal i_main_primary_slc_av        :slc_rx_bus_std_avt(2 downto 0);  -- is the main SL used
  signal i_main_secondary_slc_av      :slc_rx_bus_std_avt(2 downto 0);  -- only used in the big endcap
  signal i_plus_neighbor_slc_av       :slc_rx_bus_std_avt(0 downto 0);
  signal i_minus_neighbor_slc_av      :slc_rx_bus_std_avt(0 downto 0);

  signal i_plus_neighbor_segments  : sf2ptcalc_avt(c_NUM_SF_INPUTS - 1 downto 0);
  signal i_minus_neighbor_segments : sf2ptcalc_avt(c_NUM_SF_INPUTS - 1 downto 0);

  signal temp_sf2ptcalc_vt : sf2ptcalc_vt;
  constant SF2PTCALC_LEN : integer := temp_sf2ptcalc_vt'length;

  type sf2pt_bus_std_avt is array(integer range <>) of std_logic_vector(SF2PTCALC_LEN - 1 downto 0);

  signal i_plus_neighbor_segments_av  : sf2pt_bus_std_avt(c_NUM_SF_INPUTS - 1 downto 0);
  signal i_minus_neighbor_segments_av : sf2pt_bus_std_avt(c_NUM_SF_INPUTS - 1 downto 0);

  -- signal o_daq_streams     : felix_stream_avt (c_DAQ_LINKS- 1 downto 0);
  signal daq_stream_data_v : std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(31 downto 0);
  signal daq_stream_ctrl_v : std_logic_vector_array(c_DAQ_LINKS-1 downto 0)( 1 downto 0);
  signal daq_stream_wren_v : std_logic_vector(c_DAQ_LINKS-1 downto 0);

  
  signal o_plus_neighbor_segments  : sf2ptcalc_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
  signal o_minus_neighbor_segments : sf2ptcalc_avt(c_NUM_SF_OUTPUTS - 1 downto 0);

  signal o_MTC : mtc_out_avt(c_NUM_MTC-1 downto 0);
  signal o_NSP : mtc2nsp_avt(c_NUM_NSP-1 downto 0);

begin

  -- ctrl/mon
  -- ucm_ctrl_v  <= convert(ucm_ctrl_r,ucm_ctrl_v);
  -- ucm_mon_r   <= convert(ucm_mon_v,ucm_mon_r);
  -- tar_ctrl_v  <= convert(tar_ctrl_r,tar_ctrl_v);
  -- tar_mon_r   <= convert(tar_mon_v,tar_mon_r);
  -- h2s_ctrl_v  <= convert(h2s_ctrl_r,h2s_ctrl_v);
  -- h2s_mon_r   <= convert(h2s_mon_v,h2s_mon_r);
  -- mpl_ctrl_v  <= convert(mpl_ctrl_r,mpl_ctrl_v);
  -- mpl_mon_r   <= convert(mpl_mon_v,mpl_mon_r);
  -- tf_ctrl_v   <= convert(tf_ctrl_r,tf_ctrl_v);
  -- tf_mon_r    <= convert(tf_mon_v,tf_mon_r);
  -- mtc_ctrl_v  <= convert(mtc_ctrl_r,mtc_ctrl_v);
  -- mtc_mon_r   <= convert(mtc_mon_v,mtc_mon_r);
  -- daq_ctrl_v  <= convert(daq_ctrl_r,daq_ctrl_v);
  -- daq_mon_r   <= convert(daq_mon_v,daq_mon_r);

  clock_and_control.clk <= clk;
  clock_and_control.rst <= rst;
  clock_and_control.bx  <= bx;

  -- ser/Des
  hps_inn : entity shared_lib.vhdl_utils_deserializer generic map (HPS_CTRL_t'w) port map(clk,rst,hps_inn_ctrl_b,hps_inn_ctrl_v); 
  hps_inn_mon_b <= xor_reduce(hps_inn_mon_v);
  hps_mid : entity shared_lib.vhdl_utils_deserializer generic map (HPS_CTRL_t'w) port map(clk,rst,hps_mid_ctrl_b,hps_mid_ctrl_v); 
  hps_mid_mon_b <= xor_reduce(hps_mid_mon_v);
  hps_out : entity shared_lib.vhdl_utils_deserializer generic map (HPS_CTRL_t'w) port map(clk,rst,hps_out_ctrl_b,hps_out_ctrl_v); 
  hps_out_mon_b <= xor_reduce(hps_out_mon_v);
  hps_ext : entity shared_lib.vhdl_utils_deserializer generic map (HPS_CTRL_t'w) port map(clk,rst,hps_ext_ctrl_b,hps_ext_ctrl_v); 
  hps_ext_mon_b <= xor_reduce(hps_ext_mon_v);

  tar_inn : entity shared_lib.vhdl_utils_deserializer generic map (TAR_CTRL_t'w) port map(clk,rst,tar_inn_ctrl_b,tar_inn_ctrl_v); 
  tar_inn_mon_b <= xor_reduce(tar_inn_mon_v);
  tar_mid : entity shared_lib.vhdl_utils_deserializer generic map (TAR_CTRL_t'w) port map(clk,rst,tar_mid_ctrl_b,tar_mid_ctrl_v); 
  tar_mid_mon_b <= xor_reduce(tar_mid_mon_v);
  tar_out : entity shared_lib.vhdl_utils_deserializer generic map (TAR_CTRL_t'w) port map(clk,rst,tar_out_ctrl_b,tar_out_ctrl_v); 
  tar_out_mon_b <= xor_reduce(tar_out_mon_v);
  tar_ext : entity shared_lib.vhdl_utils_deserializer generic map (TAR_CTRL_t'w) port map(clk,rst,tar_ext_ctrl_b,tar_ext_ctrl_v); 
  tar_ext_mon_b <= xor_reduce(tar_ext_mon_v);

  mtc_ctrl : entity shared_lib.vhdl_utils_deserializer generic map (MTC_CTRL_t'w) port map(clk,rst,mtc_ctrl_b,mtc_ctrl_v);
  mtc_mon_b <= xor_reduce(mtc_mon_v);
  ucm_ctrl : entity shared_lib.vhdl_utils_deserializer generic map (UCM_CTRL_t'w) port map(clk,rst,ucm_ctrl_b,ucm_ctrl_v);
  ucm_mon_b <= xor_reduce(ucm_mon_v);
  daq_ctrl : entity shared_lib.vhdl_utils_deserializer generic map (DAQ_CTRL_t'w) port map(clk,rst,daq_ctrl_b,daq_ctrl_v);
  daq_mon_b <= xor_reduce(daq_mon_v);
  tf_ctrl : entity shared_lib.vhdl_utils_deserializer generic map (TF_CTRL_t'w) port map(clk,rst,tf_ctrl_b,tf_ctrl_v);
  tf_mon_b <= xor_reduce(tf_mon_v);
  mpl_ctrl : entity shared_lib.vhdl_utils_deserializer generic map (MPL_CTRL_t'w) port map(clk,rst,mpl_ctrl_b,mpl_ctrl_v);
  mpl_mon_b <= xor_reduce(mpl_mon_v);
  fm_ctrl  : entity shared_lib.vhdl_utils_deserializer generic map (FM_CTRL_t'w) port map(clk,rst,fm_ctrl_b,fm_ctrl_v);
  fm_mon_b <= xor_reduce(fm_mon_v);


  inn_tdc: for i_h in c_HPS_NUM_MDT_CH_INN -1 downto 0 generate
    tdc_inn : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => TDCPOLMUX2TAR_LEN)port map(clk => clk,rst  => rst,i_data => i_inn_tdc_hits_ab(i_h),o_data => i_inn_tdc_hits_av(i_h));
    i_inner_tdc_hits(i_h) <= i_inn_tdc_hits_av(i_h);
  end generate;
  mid_tdc: for i_h in c_HPS_NUM_MDT_CH_MID -1 downto 0 generate
    tdc_mid : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => TDCPOLMUX2TAR_LEN)port map(clk => clk,rst  => rst,i_data => i_mid_tdc_hits_ab(i_h),o_data => i_mid_tdc_hits_av(i_h));
    i_middle_tdc_hits(i_h) <= i_mid_tdc_hits_av(i_h);
  end generate;
  out_tdc: for i_h in c_HPS_NUM_MDT_CH_OUT -1 downto 0 generate
    tdc_out : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => TDCPOLMUX2TAR_LEN)port map(clk => clk,rst  => rst,i_data => i_out_tdc_hits_ab(i_h),o_data => i_out_tdc_hits_av(i_h));
    i_outer_tdc_hits(i_h) <= i_out_tdc_hits_av(i_h);
  end generate;
  ext_tdc: for i_h in c_HPS_NUM_MDT_CH_EXT -1 downto 0 generate
  tdc_ext : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => TDCPOLMUX2TAR_LEN)port map(clk => clk,rst  => rst,i_data => i_ext_tdc_hits_ab(i_h),o_data => i_ext_tdc_hits_av(i_h));
    i_extra_tdc_hits(i_h) <= i_ext_tdc_hits_av(i_h);
  end generate;
  --------------------------------------------------------------
  slc_mp: for i_h in 2 downto 0 generate
    des : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => SLC_RX_LEN)port map(clk => clk,rst  => rst,i_data => i_main_primary_slc_ab(i_h),o_data => i_main_primary_slc_av(i_h));
    i_main_primary_slc(i_h) <= i_main_primary_slc_av(i_h);
  end generate;

  slc_ms: for i_h in 2 downto 0  generate
    des : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => SLC_RX_LEN)port map(clk => clk,rst  => rst,i_data => i_main_secondary_slc_ab(i_h),o_data => i_main_secondary_slc_av(i_h));
    i_main_secondary_slc(i_h) <= i_main_secondary_slc_av(i_h);
  end generate;

  des_p : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => SLC_RX_LEN)port map(clk => clk,rst  => rst,i_data => i_plus_neighbor_slc_b,o_data => i_plus_neighbor_slc);
  des_m : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => SLC_RX_LEN)port map(clk => clk,rst  => rst,i_data => i_minus_neighbor_slc_b,o_data => i_minus_neighbor_slc);
  --------------------------------------------------------------
  ns_p: for i_h in c_NUM_SF_INPUTS - 1 downto 0 generate
    des : entity shared_lib.vhdl_utils_deserializer 
      generic map (g_DATA_WIDTH => SF2PTCALC_LEN)
      port map(clk => clk,rst  => rst,i_data => i_plus_neighbor_segments_ab(i_h),o_data => i_plus_neighbor_segments_av(i_h));
    i_plus_neighbor_segments(i_h) <= i_plus_neighbor_segments_av(i_h);
  end generate;

  ns_m: for i_h in c_NUM_SF_INPUTS - 1 downto 0  generate
    des : entity shared_lib.vhdl_utils_deserializer generic map (g_DATA_WIDTH => SF2PTCALC_LEN)port map(clk => clk,rst  => rst,i_data => i_minus_neighbor_segments_ab(i_h),o_data => i_minus_neighbor_segments_av(i_h));
    i_minus_neighbor_segments(i_h) <= i_minus_neighbor_segments_av(i_h);
  end generate;
  --------------------------------------------------------------
  daq: for i_d in c_DAQ_LINKS - 1 downto 0 generate
    -- o_daq_streams_ab(i_d) <= xor_reduce(o_daq_streams(i_d));
    o_daq_streams_ab(i_d) <= xor_reduce(daq_stream_data_v(i_d));
  end generate;
  --------------------------------------------------------------
  -- o_plus_neighbor_segments_ab  : out std_logic_vector(c_NUM_SF_OUTPUTS - 1 downto 0);--sf2ptcalc_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
  -- o_minus_neighbor_segments_ab : out std_logic_vector(c_NUM_SF_OUTPUTS - 1 downto 0);--sf2ptcalc_avt(c_NUM_SF_OUTPUTS - 1 downto 0);
  pns: for i_d in c_NUM_SF_OUTPUTS - 1 downto 0 generate
    o_plus_neighbor_segments_ab(i_d) <= xor_reduce(o_plus_neighbor_segments(i_d));
  end generate;
  mns: for i_d in c_NUM_SF_OUTPUTS - 1 downto 0 generate
    o_minus_neighbor_segments_ab(i_d) <= xor_reduce(o_minus_neighbor_segments(i_d));
  end generate;
    
  --------------------------------------------------------------
  MTC: for i_d in c_NUM_MTC - 1 downto 0 generate
    o_MTC_ab(i_d)  <= xor_reduce(o_MTC(i_d));
  end generate;
  --------------------------------------------------------------
  NSP: for i_d in c_NUM_NSP - 1 downto 0 generate
    o_NSP_ab(i_d)  <= xor_reduce(o_NSP(i_d));
  end generate;
  --------------------------------------------------------------

  ULT : entity ult_lib.ult
    generic map(
      DUMMY       => DUMMY
      )
    port map(
      -- pipeline clock
      clock_and_control => clock_and_control,
      axi_reset_n       => axi_reset_n,
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


end behavioral;
