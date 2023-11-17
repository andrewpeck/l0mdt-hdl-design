library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;

library daq_core;
library daq_lib;

entity daq_data_path is
  generic (g_DAQ_LINKS : integer;
           g_DAQ_INN_LINKS : integer;
           g_DAQ_MID_LINKS : integer;
           g_DAQ_OUT_LINKS : integer;
           g_DAQ_EXT_LINKS : integer);
  port (i_clk             : in  std_logic;
        i_rst             : in  std_logic;
        i_bx              : in  std_logic;
        ----------------------------------------------------------------------
        i_orid            : in  std_logic_vector(1 downto 0);
        i_l0a             : in  std_logic;
        i_ecr             : in  std_logic;
        i_bcid            : in  unsigned(11 downto 0);
        ----------------------------------------------------------------------
        i_ctrl_opening_offset : in  unsigned(11 downto 0);
        i_ctrl_request_offset : in  unsigned(11 downto 0);
        i_ctrl_closing_offset : in  unsigned(11 downto 0);
        i_ctrl_window_timeout : in  unsigned(11 downto 0);
        i_ctrl_busy_threshold : in  unsigned( 7 downto 0);
        ----------------------------------------------------------------------
        o_busy : out std_logic;
        ----------------------------------------------------------------------
        i_flags           : in  std_logic_vector(6 downto 0);
        i_ec              : in  std_logic;
        i_sector_id       : in  std_logic_vector(3 downto 0);
        i_frag_id         : in  std_logic_vector(3 downto 0);
        ----------------------------------------------------------------------
        i_inn_tdc_hits_av : in  std_logic_vector_array;
        i_mid_tdc_hits_av : in  std_logic_vector_array;
        i_out_tdc_hits_av : in  std_logic_vector_array;
        i_ext_tdc_hits_av : in  std_logic_vector_array;
        ----------------------------------------------------------------------
        o_daq_stream_data_v : out std_logic_vector_array(g_DAQ_LINKS-1 downto 0)(31 downto 0);
        o_daq_stream_ctrl_v : out std_logic_vector_array(g_DAQ_LINKS-1 downto 0)( 1 downto 0);
        o_daq_stream_wren_v : out std_logic_vector(g_DAQ_LINKS-1 downto 0));
end entity daq_data_path;

architecture behavioral of daq_data_path is

  signal req_cnt : unsigned(11 downto 0);

  signal req_valid : std_logic;
  signal req_strb  : std_logic;

  signal event_id              : unsigned(31 downto 0);

  signal curr_bcid   : unsigned(11 downto 0);

  signal inner_flx_streams_hfull_bus   : std_logic_vector(0 to g_DAQ_INN_LINKS-1) := (others => '0');
  signal inner_flx_streams_wr_strb_bus : std_logic_vector(0 to g_DAQ_INN_LINKS-1);
  signal inner_flx_streams_ctrl_bus    : std_logic_vector_array(0 to g_DAQ_INN_LINKS-1)(1 downto 0);
  signal inner_flx_streams_payload_bus : std_logic_vector_array(0 to g_DAQ_INN_LINKS-1)(31 downto 0);

  signal middle_flx_streams_hfull_bus   : std_logic_vector(0 to g_DAQ_MID_LINKS-1) := (others => '0');
  signal middle_flx_streams_wr_strb_bus : std_logic_vector(0 to g_DAQ_MID_LINKS-1);
  signal middle_flx_streams_ctrl_bus    : std_logic_vector_array(0 to g_DAQ_MID_LINKS-1)(1 downto 0);
  signal middle_flx_streams_payload_bus : std_logic_vector_array(0 to g_DAQ_MID_LINKS-1)(31 downto 0);

  signal outer_flx_streams_hfull_bus   : std_logic_vector(0 to g_DAQ_OUT_LINKS-1) := (others => '0');
  signal outer_flx_streams_wr_strb_bus : std_logic_vector(0 to g_DAQ_OUT_LINKS-1);
  signal outer_flx_streams_ctrl_bus    : std_logic_vector_array(0 to g_DAQ_OUT_LINKS-1)(1 downto 0);
  signal outer_flx_streams_payload_bus : std_logic_vector_array(0 to g_DAQ_OUT_LINKS-1)(31 downto 0);

  signal extra_flx_streams_hfull_bus   : std_logic_vector(0 to g_DAQ_EXT_LINKS-1) := (others => '0');
  signal extra_flx_streams_wr_strb_bus : std_logic_vector(0 to g_DAQ_EXT_LINKS-1);
  signal extra_flx_streams_ctrl_bus    : std_logic_vector_array(0 to g_DAQ_EXT_LINKS-1)(1 downto 0);
  signal extra_flx_streams_payload_bus : std_logic_vector_array(0 to g_DAQ_EXT_LINKS-1)(31 downto 0);

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

  signal daq_stream_ar : felix_stream_art(g_DAQ_LINKS-1 downto 0);
  signal daq_stream_v  : std_logic_vector(daq_stream_ar'length*felix_stream_rt'w-1 downto 0);

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

begin

  o_busy <= or(busy);
            
  (wm_inner_usr_hdr, wm_middle_usr_hdr, wm_outer_usr_hdr, wm_extra_usr_hdr) <= wm_user_header;

  req_input_sys_hdr <= "00"
                       & std_logic_vector(i_orid(1 downto 0))
                       & std_logic_vector(req_cnt)
                       & i_flags
                       & i_ec
                       & i_sector_id
                       & i_frag_id;

  u_daq_req : entity daq_core.daq_req
    port map (i_sys_clk_fast => i_clk,
              i_sys_rst      => i_rst,
              i_sys_bx       => i_bx,
              ------------------------------------------------------------------
              i_lxa_strb     => i_l0a,
              i_ecr_strb     => i_ecr,
              i_bcid_cnt     => i_bcid,
              o_request_cnt  => req_cnt,
              ------------------------------------------------------------------
              i_ctrl_opening_offset => i_ctrl_opening_offset,
              i_ctrl_request_offset => i_ctrl_request_offset,
              i_ctrl_closing_offset => i_ctrl_closing_offset,
              i_ctrl_window_timeout => i_ctrl_window_timeout,
              i_ctrl_busy_threshold => i_ctrl_busy_threshold,
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


  GEN_INNER : if g_DAQ_INN_LINKS > 0 generate
    constant MAX : natural := g_DAQ_INN_LINKS;
    constant MIN : natural := 0;
    signal flx_stream_hfull_bus   : std_logic_vector(0 to g_DAQ_INN_LINKS-1);
    signal flx_stream_wr_strb_bus : std_logic_vector(0 to g_DAQ_INN_LINKS-1);
    signal flx_stream_ctrl_bus    : std_logic_vector_array(0 to g_DAQ_INN_LINKS-1)(1 downto 0);
    signal flx_stream_payload_bus : std_logic_vector_array(0 to g_DAQ_INN_LINKS-1)(31 downto 0);
  begin

    u_daq_inner :  entity daq_lib.daq_station
      generic map (g_DELAY        =>             100, -- : integer := 100; -- number of LHC clocks
                   g_PIPELINES    =>              32, -- : integer :=  32;
                   g_OUTPUT_LINKS => g_DAQ_INN_LINKS) -- : integer := 3);
      port map (i_clk => i_clk,
                i_rst => i_rst,
                i_bx  => i_bx,
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
                i_bcid_cnt                        => i_bcid , -- : in unsigned(11 downto 0);
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

  GEN_MIDDLE : if g_DAQ_MID_LINKS > 0 generate
    constant MAX : natural := g_DAQ_INN_LINKS+g_DAQ_MID_LINKS;
    constant MIN : natural := g_DAQ_INN_LINKS;
    signal flx_stream_hfull_bus   : std_logic_vector(0 to g_DAQ_MID_LINKS-1);
    signal flx_stream_wr_strb_bus : std_logic_vector(0 to g_DAQ_MID_LINKS-1);
    signal flx_stream_ctrl_bus    : std_logic_vector_array(0 to g_DAQ_MID_LINKS-1)(1 downto 0);
    signal flx_stream_payload_bus : std_logic_vector_array(0 to g_DAQ_MID_LINKS-1)(31 downto 0);
  begin
    u_daq_middle :  entity daq_lib.daq_station
      generic map (g_DELAY        =>             100, -- : integer := 100; -- number of LHC clocks
                   g_PIPELINES    =>              32, -- : integer :=  32;
                   g_OUTPUT_LINKS => g_DAQ_MID_LINKS) -- : integer := 3);
      port map (i_clk => i_clk, 
                i_rst => i_rst, 
                i_bx  => i_bx,  
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
                i_bcid_cnt                        => i_bcid                , -- : in unsigned(11 downto 0);
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

  GEN_OUTER : if g_DAQ_OUT_LINKS > 0 generate
    constant MAX : natural := g_DAQ_INN_LINKS+g_DAQ_MID_LINKS+g_DAQ_OUT_LINKS;
    constant MIN : natural := g_DAQ_INN_LINKS+g_DAQ_MID_LINKS;
    signal flx_stream_hfull_bus   : std_logic_vector(0 to g_DAQ_OUT_LINKS-1);
    signal flx_stream_wr_strb_bus : std_logic_vector(0 to g_DAQ_OUT_LINKS-1);
    signal flx_stream_ctrl_bus    : std_logic_vector_array(0 to g_DAQ_OUT_LINKS-1)(1 downto 0);
    signal flx_stream_payload_bus : std_logic_vector_array(0 to g_DAQ_OUT_LINKS-1)(31 downto 0);
  begin

    u_daq_outer :  entity daq_lib.daq_station
      generic map (g_DELAY        =>             100, -- : integer := 100; -- number of LHC clocks
                   g_PIPELINES    =>              32, -- : integer :=  32;
                   g_OUTPUT_LINKS => g_DAQ_OUT_LINKS) -- : integer := 3);
      port map (i_clk => i_clk, 
                i_rst => i_rst, 
                i_bx  => i_bx,  
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
                i_bcid_cnt                        => i_bcid, -- : in unsigned(11 downto 0);
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

  GEN_EXTRA: if g_DAQ_EXT_LINKS > 0 generate
    constant MAX : natural := g_DAQ_INN_LINKS+g_DAQ_MID_LINKS+g_DAQ_OUT_LINKS+g_DAQ_EXT_LINKS;
    constant MIN : natural := g_DAQ_INN_LINKS+g_DAQ_MID_LINKS+g_DAQ_OUT_LINKS;
    signal flx_stream_hfull_bus   : std_logic_vector(0 to g_DAQ_EXT_LINKS-1);
    signal flx_stream_wr_strb_bus : std_logic_vector(0 to g_DAQ_EXT_LINKS-1);
    signal flx_stream_ctrl_bus    : std_logic_vector_array(0 to g_DAQ_EXT_LINKS-1)(1 downto 0);
    signal flx_stream_payload_bus : std_logic_vector_array(0 to g_DAQ_EXT_LINKS-1)(31 downto 0);
  begin
    u_daq_extra :  entity daq_lib.daq_station
      generic map (g_DELAY        =>             100, -- : integer := 100; -- number of LHC clocks
                   g_PIPELINES    =>              32, -- : integer :=  32;
                   g_OUTPUT_LINKS => g_DAQ_EXT_LINKS) -- : integer := 3);
      port map (i_clk => i_clk, 
                i_rst => i_rst, 
                i_bx  => i_bx,  
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
                i_bcid_cnt                        => i_bcid                , -- : in unsigned(11 downto 0);
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

end behavioral;

