--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ult_daq.vhd
-- Module: <<moduleName>>
-- File PATH: /ult_daq.vhd
-- -----
-- File Created: Thursday, 16th February 2023 1:31:51 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 16th February 2023 4:30:22 pm
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
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

library ctrl_lib;
use ctrl_lib.DAQ_CTRL.all;

-- library l0mdt;

library daq_lib;
library daq_core;

library fm_lib;
use fm_lib.fm_types.all;

-- use daq_def.daq_defs.all;

entity daq is
  -- generic (DELAY : integer; memory_type: string);
  port (
    -- clock and control
    clock_and_control : in  l0mdt_control_rt;
    ttc_commands      : in  l0mdt_ttc_rt;
    ctrl_v            : in  std_logic_vector(DAQ_CTRL_t'w-1 downto 0); -- : in  DAQ_CTRL_t;
    mon_v             : out std_logic_vector( DAQ_MON_t'w-1 downto 0);-- : out DAQ_MON_t;
    --Fast Monitoring
    fm_daq_mon_v : out std_logic_vector;   
    ----------------------------------------------------------------------
    i_flags           : in  std_logic_vector(6 downto 0);
    i_ec              : in  std_logic;
    i_sector_id       : in  std_logic_vector(3 downto 0);
    i_frag_id         : in  std_logic_vector(3 downto 0);
    ----------------------------------------------------------------------
    i_inn_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_INN-1 downto 0);
    i_mid_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_MID-1 downto 0);
    i_out_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_OUT-1 downto 0);
    i_ext_tdc_hits_av : in  tdcpolmux2tar_avt(c_HPS_NUM_MDT_CH_EXT-1 downto 0);
    ----------------------------------------------------------------------
    o_daq_stream_data_v : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(31 downto 0);
    o_daq_stream_ctrl_v : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)( 1 downto 0);
    o_daq_stream_wren_v : out std_logic_vector(c_DAQ_LINKS-1 downto 0)
    -- o_sump            : out std_logic
  );
end entity daq;

architecture behavioral of daq is


  signal ctrl_opening_offset : unsigned(11 downto 0);
  signal ctrl_request_offset : unsigned(11 downto 0);
  signal ctrl_closing_offset : unsigned(11 downto 0);
  signal ctrl_window_timeout : unsigned(11 downto 0);
  signal ctrl_busy_threshold : unsigned( 7 downto 0);

  signal req_cnt : unsigned(11 downto 0);

  signal req_valid : std_logic;
  signal req_strb  : std_logic;

  signal event_id              : unsigned(31 downto 0);

  signal curr_bcid   : unsigned(11 downto 0);

  signal inner_flx_streams_hfull_bus   : std_logic_vector(0 to c_DAQ_INN_LINKS-1) := (others => '0');
  signal inner_flx_streams_wr_strb_bus : std_logic_vector(0 to c_DAQ_INN_LINKS-1);
  signal inner_flx_streams_ctrl_bus    : std_logic_vector_array(0 to c_DAQ_INN_LINKS-1)(1 downto 0);
  signal inner_flx_streams_payload_bus : std_logic_vector_array(0 to c_DAQ_INN_LINKS-1)(31 downto 0);

  signal middle_flx_streams_hfull_bus   : std_logic_vector(0 to c_DAQ_MID_LINKS-1) := (others => '0');
  signal middle_flx_streams_wr_strb_bus : std_logic_vector(0 to c_DAQ_MID_LINKS-1);
  signal middle_flx_streams_ctrl_bus    : std_logic_vector_array(0 to c_DAQ_MID_LINKS-1)(1 downto 0);
  signal middle_flx_streams_payload_bus : std_logic_vector_array(0 to c_DAQ_MID_LINKS-1)(31 downto 0);

  signal outer_flx_streams_hfull_bus   : std_logic_vector(0 to c_DAQ_OUT_LINKS-1) := (others => '0');
  signal outer_flx_streams_wr_strb_bus : std_logic_vector(0 to c_DAQ_OUT_LINKS-1);
  signal outer_flx_streams_ctrl_bus    : std_logic_vector_array(0 to c_DAQ_OUT_LINKS-1)(1 downto 0);
  signal outer_flx_streams_payload_bus : std_logic_vector_array(0 to c_DAQ_OUT_LINKS-1)(31 downto 0);

  signal extra_flx_streams_hfull_bus   : std_logic_vector(0 to c_DAQ_EXT_LINKS-1) := (others => '0');
  signal extra_flx_streams_wr_strb_bus : std_logic_vector(0 to c_DAQ_EXT_LINKS-1);
  signal extra_flx_streams_ctrl_bus    : std_logic_vector_array(0 to c_DAQ_EXT_LINKS-1)(1 downto 0);
  signal extra_flx_streams_payload_bus : std_logic_vector_array(0 to c_DAQ_EXT_LINKS-1)(31 downto 0);

  signal req_input_sys_hdr : std_logic_vector(31 downto 0);

  constant INNER_USR_HDR  : std_logic_vector(15 downto 0) := x"AAAA";
  constant MIDDLE_USR_HDR : std_logic_vector(15 downto 0) := x"BBBB";
  constant OUTER_USR_HDR  : std_logic_vector(15 downto 0) := x"CCCC";
  constant EXTRA_USR_HDR  : std_logic_vector(15 downto 0) := x"DDDD";

  signal wm_inner_usr_hdr  : std_logic_vector(15 downto 0) := x"AAAA";
  signal wm_middle_usr_hdr : std_logic_vector(15 downto 0) := x"BBBB";
  signal wm_outer_usr_hdr  : std_logic_vector(15 downto 0) := x"CCCC";
  signal wm_extra_usr_hdr  : std_logic_vector(15 downto 0) := x"DDDD";

  signal req_input_pkt_headers : std_logic_vector(INNER_USR_HDR'length
                                                  + MIDDLE_USR_HDR'length
                                                  + OUTER_USR_HDR'length
                                                  + EXTRA_USR_HDR'length - 1 downto 0)
    := INNER_USR_HDR & MIDDLE_USR_HDR & OUTER_USR_HDR & EXTRA_USR_HDR;


  signal wm_sys_hdr        : std_logic_vector(31 downto 0);
  signal wm_event_id       : unsigned(31 downto 0);
  signal wm_user_header    : std_logic_vector(req_input_pkt_headers'range);
  signal wm_curr_bcid      : unsigned(11 downto 0);
  signal wm_req_strb       : std_logic;
  signal wm_opening_cnt    : unsigned(11 downto 0);
  signal wm_request_cnt    : unsigned(11 downto 0);
  signal wm_closing_cnt    : unsigned(11 downto 0);
  signal wm_opening_offset : unsigned(11 downto 0);
  signal wm_request_offset : unsigned(11 downto 0);
  signal wm_closing_offset : unsigned(11 downto 0);
  signal wm_window_timeout : unsigned(11 downto 0);
  signal wm_busy_threshold : unsigned( 7 downto 0);

  signal daq_stream_ar : felix_stream_art(c_DAQ_LINKS-1 downto 0);
  signal daq_stream_v  : std_logic_vector(daq_stream_ar'length*felix_stream_rt'w-1 downto 0);

  signal fm_daq_mon_r : fm_daq_mon_data;
  -- emulation

  -- -- signal ptcalc_sump         : std_logic_vector (c_NUM_THREADS -1 downto 0);
  -- -- signal pl2mtc_sump         : std_logic_vector (c_MAX_NUM_SL -1 downto 0);
  -- -- signal tdc_hit_inner_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_INN-1 downto 0);
  -- -- signal tdc_hit_middle_sump : std_logic_vector (c_HPS_NUM_MDT_CH_MID-1 downto 0);
  -- -- signal tdc_hit_outer_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_OUT-1 downto 0);
  -- -- signal tdc_hit_extra_sump  : std_logic_vector (c_HPS_NUM_MDT_CH_EXT-1 downto 0);

  -- implementation


  function streamify_output (wr_strb_bus : std_logic_vector;
                             ctrl_bus    : std_logic_vector_array;
                             payload_bus : std_logic_vector_array) return felix_stream_art is
    variable y : felix_stream_art(wr_strb_bus'range);
  begin
    for ii in wr_strb_bus'range loop
      y(ii).valid := wr_strb_bus(ii);
      y(ii).data := ctrl_bus(ii) & payload_bus(ii);
    end loop;
    return y;
  end function streamify_output;

  signal wme_available : std_logic_vector(0 to 3) := (others => '1');
  signal busy          : std_logic_vector(0 to 3) := (others => '0');

  signal ctrl_r : DAQ_CTRL_t;
  signal mon_r  : DAQ_MON_t;

begin

  ctrl_r <= convert(ctrl_v, ctrl_r);
  mon_v <= convert( mon_r,  mon_v);
  fm_daq_mon_v <= convert(fm_daq_mon_r, fm_daq_mon_v);

  -- daq_stream_v <= convert(daq_stream_ar, daq_stream_v);
  -- o_daq_stream <= convert(daq_stream_v, o_daq_stream);

  (wm_inner_usr_hdr, wm_middle_usr_hdr, wm_outer_usr_hdr, wm_extra_usr_hdr) <= wm_user_header;


  process(clock_and_control.clk)
  begin
    if rising_edge(clock_and_control.clk) then
      if ctrl_r.action.wr_en = '1' then
        ctrl_opening_offset <= unsigned(ctrl_r.wr0.opening_offset);
        ctrl_request_offset <= unsigned(ctrl_r.wr0.request_offset);
        ctrl_closing_offset <= unsigned(ctrl_r.wr1.closing_offset);
        ctrl_window_timeout <= unsigned(ctrl_r.wr1.window_timeout);
        ctrl_busy_threshold <= unsigned(ctrl_r.wr1.busy_threshold);
      end if; -- wr en
      mon_r.rd0.opening_offset <= std_logic_vector(ctrl_opening_offset);
      mon_r.rd0.request_offset <= std_logic_vector(ctrl_request_offset);
      mon_r.rd1.closing_offset <= std_logic_vector(ctrl_closing_offset);
      mon_r.rd1.window_timeout <= std_logic_vector(ctrl_window_timeout);
      mon_r.rd1.busy_threshold <= std_logic_vector(ctrl_busy_threshold);
      mon_r.status.busy       <= or(busy);
    end if; -- clk



  end process;

  DAQ_GEN : if c_DAQ_ENABLED generate

    req_input_sys_hdr <= "00"
               & std_logic_vector(ttc_commands.orid(1 downto 0))
               & std_logic_vector(req_cnt)
               & i_flags
               & i_ec
               & i_sector_id
               & i_frag_id;

    u_daq_req : entity daq_core.daq_req
      port map (i_sys_clk_fast => clock_and_control.clk,
                i_sys_rst      => clock_and_control.rst,
                i_sys_bx       => clock_and_control.bx,
                ------------------------------------------------------------------
                i_lxa_strb     => ttc_commands.l0a,
                i_ecr_strb     => ttc_commands.ecr,
                i_bcid_cnt     => ttc_commands.bcid,
                o_request_cnt  => req_cnt,
                ------------------------------------------------------------------
                i_ctrl_opening_offset => ctrl_opening_offset,
                i_ctrl_request_offset => ctrl_request_offset,
                i_ctrl_closing_offset => ctrl_closing_offset,
                i_ctrl_window_timeout => ctrl_window_timeout,
                i_ctrl_busy_threshold => ctrl_busy_threshold,
                ------------------------------------------------------------------
                o_status_valid  => req_valid,
                i_wme_available => and(wme_available),
                ------------------------------------------------------------------
                i_user_header => req_input_pkt_headers,
                i_sys_hdr     => req_input_sys_hdr,
                ------------------------------------------------------------------
                o_wm_sys_hdr        => wm_sys_hdr       , -- : out std_logic_vector;x
                o_wm_event_id       => wm_event_id      , -- : out unsigned(31 downto 0);x
                o_wm_user_header    => wm_user_header   , -- : out std_logic_vector;x
                o_wm_curr_bcid      => wm_curr_bcid     , -- : out unsigned(11 downto 0);x
                o_wm_wr_strb        => wm_req_strb      , -- : out std_logic;x
                o_wm_opening_cnt    => wm_opening_cnt   , -- : out unsigned(11 downto 0);x
                o_wm_request_cnt    => wm_request_cnt   , -- : out unsigned(11 downto 0);x
                o_wm_closing_cnt    => wm_closing_cnt   , -- : out unsigned(11 downto 0);x
                o_wm_opening_offset => wm_opening_offset, -- : out unsigned(11 downto 0);x
                o_wm_request_offset => wm_request_offset, -- : out unsigned(11 downto 0);x
                o_wm_closing_offset => wm_closing_offset, -- : out unsigned(11 downto 0);x
                o_wm_window_timeout => wm_window_timeout, -- : out unsigned(11 downto 0);x
                o_wm_busy_threshold => wm_busy_threshold); -- : out unsigned( 7 downto 0);x


    GEN_INNER : if c_DAQ_INN_LINKS > 0 generate
      constant MAX : natural := c_DAQ_INN_LINKS;
      constant MIN : natural := 0;
      signal flx_stream_hfull_bus   : std_logic_vector(0 to c_DAQ_INN_LINKS-1);
      signal flx_stream_wr_strb_bus : std_logic_vector(0 to c_DAQ_INN_LINKS-1);
      signal flx_stream_ctrl_bus    : std_logic_vector_array(0 to c_DAQ_INN_LINKS-1)(1 downto 0);
      signal flx_stream_payload_bus : std_logic_vector_array(0 to c_DAQ_INN_LINKS-1)(31 downto 0);
    begin

      u_daq_inner :  entity daq_lib.daq_station
        generic map (g_DELAY        =>             100, -- : integer := 100; -- number of LHC clocks
                     g_PIPELINES    =>              32, -- : integer :=  32;
                     g_OUTPUT_LINKS => c_DAQ_INN_LINKS) -- : integer := 3);
        port map (clock_and_control                 => clock_and_control , -- : in  l0mdt_control_rt;
                  ------------------------------------------------------------------------------------
                  o_busy => busy(0),
                  o_wme_available => wme_available(0),
                  ------------------------------------------------------------------------------------
                  i_req_strb                        => wm_req_strb          , -- : in std_logic;
                  i_win_opening_cnt                 => wm_opening_cnt   , -- : in unsigned(11 downto 0);
                  i_win_request_cnt                 => wm_request_cnt   , -- : in unsigned(11 downto 0);
                  i_win_closing_cnt                 => wm_closing_cnt   , -- : in unsigned(11 downto 0);
                  ------------------------------------------------------------------------------------
                  i_win_opening_offset              => wm_opening_offset, -- : in unsigned(11 downto 0);
                  i_win_request_offset              => wm_request_offset, -- : in unsigned(11 downto 0);
                  i_win_closing_offset              => wm_closing_offset, -- : in unsigned(11 downto 0);
                  i_win_window_timeout              => wm_window_timeout, -- : in unsigned(11 downto 0);
                  i_win_busy_threshold              => wm_busy_threshold,
                  ------------------------------------------------------------------------------------
                  i_curr_bcid                       => wm_curr_bcid,
                  ------------------------------------------------------------------------------------
                  i_bcid_cnt                        => ttc_commands.bcid , -- : in unsigned(11 downto 0);
                  ------------------------------------------------------------------------------------
                  i_event_id                        => wm_event_id          , -- : in unsigned(31 downto 0);
                  ------------------------------------------------------------------------------------
                  i_sys_hdr                         => wm_sys_hdr , -- : in  std_logic_vector := (31 downto 0 => '0');
                  i_station_usr_hdr                 => wm_inner_usr_hdr  , -- : in  std_logic_vector := (15 downto 0 => '0');
                  i_station_tdc_hits_av             => i_inn_tdc_hits_av , -- : in  tdcpolmux2tar_avt := (5 downto 0 => (tdcpolmux2tar_vt'range => '0'));
                  ---------------------------------------------------------------------------------------------------
                  i_station_flx_streams_hfull_bus   => flx_stream_hfull_bus  , -- : in  std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_wr_strb_bus => flx_stream_wr_strb_bus, -- : out std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_ctrl_bus    => flx_stream_ctrl_bus   , -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(1 downto 0);
                  o_station_flx_streams_payload_bus => flx_stream_payload_bus); -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(31 downto 0));

      o_daq_stream_data_v(MAX-1 downto MIN) <= flx_stream_payload_bus;
      o_daq_stream_ctrl_v(MAX-1 downto MIN) <= flx_stream_ctrl_bus;
      o_daq_stream_wren_v(MAX-1 downto MIN) <= flx_stream_wr_strb_bus;

    end generate GEN_INNER;

    GEN_MIDDLE : if c_DAQ_MID_LINKS > 0 generate
      constant MAX : natural := c_DAQ_INN_LINKS+c_DAQ_MID_LINKS;
      constant MIN : natural := c_DAQ_INN_LINKS;
      signal flx_stream_hfull_bus   : std_logic_vector(0 to c_DAQ_MID_LINKS-1);
      signal flx_stream_wr_strb_bus : std_logic_vector(0 to c_DAQ_MID_LINKS-1);
      signal flx_stream_ctrl_bus    : std_logic_vector_array(0 to c_DAQ_MID_LINKS-1)(1 downto 0);
      signal flx_stream_payload_bus : std_logic_vector_array(0 to c_DAQ_MID_LINKS-1)(31 downto 0);
    begin
      u_daq_middle :  entity daq_lib.daq_station
        generic map (g_DELAY        =>             100, -- : integer := 100; -- number of LHC clocks
                     g_PIPELINES    =>              32, -- : integer :=  32;
                     g_OUTPUT_LINKS => c_DAQ_MID_LINKS) -- : integer := 3);
        port map (clock_and_control                 => clock_and_control                , -- : in  l0mdt_control_rt;
                  ------------------------------------------------------------------------------------
                  o_busy => busy(1),
                  o_wme_available => wme_available(1),
                  ---------------------------------------------------------------------------------------------------
                  i_req_strb                        => wm_req_strb                     , -- : in std_logic;
                  i_win_opening_cnt                 => wm_opening_cnt                  , -- : in unsigned(11 downto 0);
                  i_win_request_cnt                 => wm_request_cnt                  , -- : in unsigned(11 downto 0);
                  i_win_closing_cnt                 => wm_closing_cnt                  , -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_win_opening_offset              => wm_opening_offset               , -- : in unsigned(11 downto 0);
                  i_win_request_offset              => wm_request_offset               , -- : in unsigned(11 downto 0);
                  i_win_closing_offset              => wm_closing_offset               , -- : in unsigned(11 downto 0);
                  i_win_window_timeout              => wm_window_timeout               , -- : in unsigned(11 downto 0);
                  i_win_busy_threshold              => wm_busy_threshold,
                 ---------------------------------------------------------------------------------------------------
                  i_curr_bcid                       => wm_curr_bcid,
                  ------------------------------------------------------------------------------------
                  i_bcid_cnt                        => ttc_commands.bcid                , -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_event_id                        => wm_event_id                         , -- : in unsigned(31 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_sys_hdr                         => wm_sys_hdr                , -- : in  std_logic_vector := (31 downto 0 => '0');
                  i_station_usr_hdr                 => wm_middle_usr_hdr                 , -- : in  std_logic_vector := (15 downto 0 => '0');
                  i_station_tdc_hits_av             => i_mid_tdc_hits_av                , -- : in  tdcpolmux2tar_avt := (5 downto 0 => (tdcpolmux2tar_vt'range => '0'));
                  ---------------------------------------------------------------------------------------------------
                  i_station_flx_streams_hfull_bus   => flx_stream_hfull_bus  , -- : in  std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_wr_strb_bus => flx_stream_wr_strb_bus, -- : out std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_ctrl_bus    => flx_stream_ctrl_bus   , -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(1 downto 0);
                  o_station_flx_streams_payload_bus => flx_stream_payload_bus); -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(31 downto 0));

      o_daq_stream_data_v(MAX-1 downto MIN) <= flx_stream_payload_bus;
      o_daq_stream_ctrl_v(MAX-1 downto MIN) <= flx_stream_ctrl_bus;
      o_daq_stream_wren_v(MAX-1 downto MIN) <= flx_stream_wr_strb_bus;

    end generate GEN_MIDDLE;

    GEN_OUTER : if c_DAQ_OUT_LINKS > 0 generate
      constant MAX : natural := c_DAQ_INN_LINKS+c_DAQ_MID_LINKS+c_DAQ_OUT_LINKS;
      constant MIN : natural := c_DAQ_INN_LINKS+c_DAQ_MID_LINKS;
      signal flx_stream_hfull_bus   : std_logic_vector(0 to c_DAQ_OUT_LINKS-1);
      signal flx_stream_wr_strb_bus : std_logic_vector(0 to c_DAQ_OUT_LINKS-1);
      signal flx_stream_ctrl_bus    : std_logic_vector_array(0 to c_DAQ_OUT_LINKS-1)(1 downto 0);
      signal flx_stream_payload_bus : std_logic_vector_array(0 to c_DAQ_OUT_LINKS-1)(31 downto 0);
    begin

      u_daq_outer :  entity daq_lib.daq_station
        generic map (g_DELAY        =>             100, -- : integer := 100; -- number of LHC clocks
                     g_PIPELINES    =>              32, -- : integer :=  32;
                     g_OUTPUT_LINKS => c_DAQ_OUT_LINKS) -- : integer := 3);
        port map (clock_and_control                 => clock_and_control, -- : in  l0mdt_control_rt;
                  ------------------------------------------------------------------------------------
                  o_busy => busy(2),
                  o_wme_available => wme_available(2),
                  ---------------------------------------------------------------------------------------------------
                  i_req_strb                        => wm_req_strb       , -- : in std_logic;
                  i_win_opening_cnt                 => wm_opening_cnt, -- : in unsigned(11 downto 0);
                  i_win_request_cnt                 => wm_request_cnt, -- : in unsigned(11 downto 0);
                  i_win_closing_cnt                 => wm_closing_cnt, -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_win_opening_offset              => wm_opening_offset, -- : in unsigned(11 downto 0);
                  i_win_request_offset              => wm_request_offset, -- : in unsigned(11 downto 0);
                  i_win_closing_offset              => wm_closing_offset, -- : in unsigned(11 downto 0);
                  i_win_window_timeout              => wm_window_timeout, -- : in unsigned(11 downto 0);
                  i_win_busy_threshold              => wm_busy_threshold,
                  ---------------------------------------------------------------------------------------------------
                  i_curr_bcid                       => wm_curr_bcid,
                  ------------------------------------------------------------------------------------
                  i_bcid_cnt                        => ttc_commands.bcid, -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_event_id                        => wm_event_id, -- : in unsigned(31 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_sys_hdr                         => wm_sys_hdr, -- : in  std_logic_vector := (31 downto 0 => '0');
                  i_station_usr_hdr                 => wm_outer_usr_hdr, -- : in  std_logic_vector := (15 downto 0 => '0');
                  i_station_tdc_hits_av             => i_out_tdc_hits_av, -- : in  tdcpolmux2tar_avt := (5 downto 0 => (tdcpolmux2tar_vt'range => '0'));
                  ---------------------------------------------------------------------------------------------------
                  i_station_flx_streams_hfull_bus   => flx_stream_hfull_bus  , -- : in  std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_wr_strb_bus => flx_stream_wr_strb_bus, -- : out std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_ctrl_bus    => flx_stream_ctrl_bus   , -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(1 downto 0);
                  o_station_flx_streams_payload_bus => flx_stream_payload_bus); -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(31 downto 0));

      o_daq_stream_data_v(MAX-1 downto MIN) <= flx_stream_payload_bus;
      o_daq_stream_ctrl_v(MAX-1 downto MIN) <= flx_stream_ctrl_bus;
      o_daq_stream_wren_v(MAX-1 downto MIN) <= flx_stream_wr_strb_bus;

    end generate GEN_OUTER;

    GEN_EXTRA: if c_DAQ_EXT_LINKS > 0 generate
      constant MAX : natural := c_DAQ_INN_LINKS+c_DAQ_MID_LINKS+c_DAQ_OUT_LINKS+c_DAQ_EXT_LINKS;
      constant MIN : natural := c_DAQ_INN_LINKS+c_DAQ_MID_LINKS+c_DAQ_OUT_LINKS;
      signal flx_stream_hfull_bus   : std_logic_vector(0 to c_DAQ_EXT_LINKS-1);
      signal flx_stream_wr_strb_bus : std_logic_vector(0 to c_DAQ_EXT_LINKS-1);
      signal flx_stream_ctrl_bus    : std_logic_vector_array(0 to c_DAQ_EXT_LINKS-1)(1 downto 0);
      signal flx_stream_payload_bus : std_logic_vector_array(0 to c_DAQ_EXT_LINKS-1)(31 downto 0);
    begin
      u_daq_extra :  entity daq_lib.daq_station
        generic map (g_DELAY        =>             100, -- : integer := 100; -- number of LHC clocks
                     g_PIPELINES    =>              32, -- : integer :=  32;
                     g_OUTPUT_LINKS => c_DAQ_ext_LINKS) -- : integer := 3);
        port map (clock_and_control                 => clock_and_control                , -- : in  l0mdt_control_rt;
                  ------------------------------------------------------------------------------------
                  o_busy => busy(3),
                  o_wme_available => wme_available(3),
                  ---------------------------------------------------------------------------------------------------
                  i_req_strb                        => wm_req_strb                         , -- : in std_logic;
                  i_win_opening_cnt                 => wm_opening_cnt                  , -- : in unsigned(11 downto 0);
                  i_win_request_cnt                 => wm_request_cnt                  , -- : in unsigned(11 downto 0);
                  i_win_closing_cnt                 => wm_closing_cnt                  , -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_win_opening_offset              => wm_opening_offset               , -- : in unsigned(11 downto 0);
                  i_win_request_offset              => wm_request_offset               , -- : in unsigned(11 downto 0);
                  i_win_closing_offset              => wm_closing_offset               , -- : in unsigned(11 downto 0);
                  i_win_window_timeout              => wm_window_timeout               , -- : in unsigned(11 downto 0);
                  i_win_busy_threshold              => wm_busy_threshold,
                  ---------------------------------------------------------------------------------------------------
                  i_curr_bcid                       => wm_curr_bcid,
                  ------------------------------------------------------------------------------------
                  i_bcid_cnt                        => ttc_commands.bcid                , -- : in unsigned(11 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_event_id                        => wm_event_id                         , -- : in unsigned(31 downto 0);
                  ---------------------------------------------------------------------------------------------------
                  i_sys_hdr                         => wm_sys_hdr                , -- : in  std_logic_vector := (31 downto 0 => '0');
                  i_station_usr_hdr                 => wm_extra_usr_hdr                    , -- : in  std_logic_vector := (15 downto 0 => '0');
                  i_station_tdc_hits_av             => i_ext_tdc_hits_av                , -- : in  tdcpolmux2tar_avt := (5 downto 0 => (tdcpolmux2tar_vt'range => '0'));
                  ---------------------------------------------------------------------------------------------------
                  i_station_flx_streams_hfull_bus   => flx_stream_hfull_bus  , -- : in  std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_wr_strb_bus => flx_stream_wr_strb_bus, -- : out std_logic_vector(0 to g_OUTPUT_LINKS-1);
                  o_station_flx_streams_ctrl_bus    => flx_stream_ctrl_bus   , -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(1 downto 0);
                  o_station_flx_streams_payload_bus => flx_stream_payload_bus); -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(31 downto 0));


      o_daq_stream_data_v(MAX-1 downto MIN) <= flx_stream_payload_bus;
      o_daq_stream_ctrl_v(MAX-1 downto MIN) <= flx_stream_ctrl_bus;
      o_daq_stream_wren_v(MAX-1 downto MIN) <= flx_stream_wr_strb_bus; 

    end generate GEN_EXTRA;

  end generate DAQ_GEN;

  FM_DAQ: for k in 0 to daq_sb_all_stations_n -1 - 1  generate
        fm_daq_mon_r(k).fm_data <= (mon_dw_max-1 downto  35 => '0') & o_daq_stream_wren_v(k) & o_daq_stream_ctrl_v(k) & o_daq_stream_data_v(k) ;
        fm_daq_mon_r(k).fm_vld   <= o_daq_stream_data_v(k)(31) or o_daq_stream_wren_v(k);
  end generate;
  

  -- -- DAQ_EMU : if not c_DAQ_ENABLED generate
  -- -- end generate;

  -------------------------------------------------------------------------

  --# Thu 29 Dec 2022 11:54:35 PM -03
  --# ctrl2mon : entity shared_lib.vhdl_utils_deserializer
  --#   generic map (g_DATA_WIDTH => mon_v'length)
  --#   port map(
  --#     clk     => clock_and_control.clk,
  --#     rst     => clock_and_control.rst,
  --#     i_data  => xor_reduce(ctrl_v),
  --#     o_data  => mon_v
  --# );
  --#
  --# inn_xor : for i in c_HPS_NUM_MDT_CH_INN -1 downto 0 generate
  --#   inn_tdc_hits_ab(i) <= xor_reduce(i_inn_tdc_hits_av(i));
  --# end generate ; -- inn_xor
  --# mid_xor : for i in c_HPS_NUM_MDT_CH_mid -1 downto 0 generate
  --#   mid_tdc_hits_ab(i) <= xor_reduce(i_mid_tdc_hits_av(i));
  --# end generate ; -- mid_xor
  --# out_xor : for i in c_HPS_NUM_MDT_CH_out -1 downto 0 generate
  --#   out_tdc_hits_ab(i) <= xor_reduce(i_out_tdc_hits_av(i));
  --# end generate ; -- out_xor
  --# -- ext_xor : for i in c_HPS_NUM_MDT_CH_ext -1 downto 0 generate
  --# --   ext_tdc_hits_ab <= xor_reduce(i_ext_tdc_hits_av(i));
  --# -- end generate ; -- ext_xor
  --#
  --# daq_stream_ab <= inn_tdc_hits_ab & mid_tdc_hits_ab & out_tdc_hits_ab;
  --#
  --# daq_o : for i in c_HPS_NUM_MDT_CH_INN + c_HPS_NUM_MDT_CH_MID + c_HPS_NUM_MDT_CH_OUT - 1 downto 0 generate
  --#   daq_o : entity shared_lib.vhdl_utils_deserializer
  --#   generic map (g_DATA_WIDTH => o_daq_stream(i)'length)
  --#   port map(
  --#     clk     => clock_and_control.clk,
  --#     rst     => clock_and_control.rst,
  --#     i_data  => daq_stream_ab(i),
  --#     o_data  => o_daq_stream(i)
  --# );
  --# end generate ; -- daq_o




end behavioral;
