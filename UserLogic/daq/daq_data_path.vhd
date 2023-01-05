library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library daq_core;
use daq_core.daq_v3.all;
use daq_core.daq_defs.all;
use daq_core.yml2hdl.all;

entity daq_data_path is
  generic (g_PIPELINES      : integer := 32);
  port (i_sys_clk : in std_logic;
        i_sys_rst : in std_logic;
        i_sys_bx  : in std_logic;
        ------------------------------------------------------------------------
        i_bcid_cnt  : in unsigned(11 downto 0);
        i_orbit_id  : in unsigned( 1 downto 0);
        i_flags     : in std_logic_vector(6 downto 0);
        i_ec        : in std_logic;
        i_sector_id : in std_logic_vector(3 downto 0);
        i_frag_id   : in std_logic_vector(3 downto 0);
        ------------------------------------------------------------------------
        i_lxa_strb : in std_logic;
        i_ecr_strb : in std_logic;
        ------------------------------------------------------------------------
        i_ctrl_opening_offset : in unsigned(11 downto 0);
        i_ctrl_request_offset : in unsigned(11 downto 0);
        i_ctrl_closing_offset : in unsigned(11 downto 0);
        i_ctrl_timeout_window : in unsigned(11 downto 0);
        ------------------------------------------------------------------------
        i_station0_header  : in std_logic_vector(15 downto 0);
        i_station0_valid   : in std_logic;
        i_station0_enable  : in std_logic;
        i_station0_bcid    : in unsigned(11 downto 0);
        i_station0_payload : in std_logic_vector(41 downto 0);
        ------------------------------------------------------------------------
        i_station1_header  : in std_logic_vector(15 downto 0);
        i_station1_valid   : in std_logic;
        i_station1_enable  : in std_logic;
        i_station1_bcid    : in unsigned(11 downto 0);
        i_station1_payload : in std_logic_vector(41 downto 0);
        ------------------------------------------------------------------------
        i_station2_header  : in std_logic_vector(15 downto 0);
        i_station2_valid   : in std_logic;
        i_station2_enable  : in std_logic;
        i_station2_bcid    : in unsigned(11 downto 0);
        i_station2_payload : in std_logic_vector(41 downto 0);
        ------------------------------------------------------------------------
        i_station3_header  : in std_logic_vector(15 downto 0);
        i_station3_valid   : in std_logic;
        i_station3_enable  : in std_logic;
        i_station3_bcid    : in unsigned(11 downto 0);
        i_station3_payload : in std_logic_vector(41 downto 0);
        ------------------------------------------------------------------------
        i_station0_flx_header  : in  std_logic_vector(31 downto 0);
        i_station0_flx_hfull   : in  std_logic;
        o_station0_flx_wr_strb : out std_logic;
        o_station0_flx_ctrl    : out std_logic_vector(1 downto 0);
        o_station0_flx_payload : out std_logic_vector(31 downto 0);
        ------------------------------------------------------------------------
        i_station1_flx_header  : in  std_logic_vector(31 downto 0);
        i_station1_flx_hfull   : in  std_logic;
        o_station1_flx_wr_strb : out std_logic;
        o_station1_flx_ctrl    : out std_logic_vector(1 downto 0);
        o_station1_flx_payload : out std_logic_vector(31 downto 0);
        ------------------------------------------------------------------------
        i_station2_flx_header  : in  std_logic_vector(31 downto 0);
        i_station2_flx_hfull   : in  std_logic;
        o_station2_flx_wr_strb : out std_logic;
        o_station2_flx_ctrl    : out std_logic_vector(1 downto 0);
        o_station2_flx_payload : out std_logic_vector(31 downto 0);
        ------------------------------------------------------------------------
        i_station3_flx_header  : in  std_logic_vector(31 downto 0);
        i_station3_flx_hfull   : in  std_logic;
        o_station3_flx_wr_strb : out std_logic;
        o_station3_flx_ctrl    : out std_logic_vector(1 downto 0);
        o_station3_flx_payload : out std_logic_vector(31 downto 0));
end entity daq_data_path;

architecture V2 of daq_data_path is
  
  signal req_stable         : std_logic;
  signal req_valid          : std_logic;
  signal req_strb           : std_logic;
  signal win_opening_cnt    : unsigned(11 downto 0);
  signal win_request_cnt    : unsigned(11 downto 0);
  signal win_closing_cnt    : unsigned(11 downto 0);
  signal win_timeout_cnt    : unsigned(11 downto 0);
  signal win_opening_offset : unsigned(11 downto 0);
  signal win_request_offset : unsigned(11 downto 0);
  signal win_closing_offset : unsigned(11 downto 0);
  signal win_timeout_window : unsigned(11 downto 0);

  signal sys_hdr : std_logic_vector(31 downto 0);
  signal event_id : unsigned(31 downto 0);
  
begin

  sys_hdr <= "00"
             & std_logic_vector(i_orbit_id)
             & std_logic_vector(win_request_cnt)
             & i_flags
             & i_ec
             & i_sector_id
             & i_frag_id;

  -- daq request ---------------------------------------------------------------
  u_daq_req : entity daq_core.daq_req
    port map (i_sys_clk_fast => i_sys_clk,
              i_sys_clk_slow => '0',
              i_sys_rst      => i_sys_rst,
              i_sys_bx       => i_sys_bx,
              ------------------------------------------------------------------
              i_lxa_strb => i_lxa_strb,
              i_bcr_strb => '0',
              i_ecr_strb => i_ecr_strb,
              i_bcid_cnt => i_bcid_cnt,
              o_event_id => event_id,
              ------------------------------------------------------------------
              i_ctrl_wr_en          => '0',
              i_ctrl_opening_offset => i_ctrl_opening_offset,
              i_ctrl_request_offset => i_ctrl_request_offset,
              i_ctrl_closing_offset => i_ctrl_closing_offset,
              i_ctrl_timeout_window => i_ctrl_timeout_window,
              ------------------------------------------------------------------
              o_status_stable => req_stable,
              o_status_valid  => req_valid,
              ------------------------------------------------------------------
              o_wm_wr_strb        => req_strb,
              o_wm_opening_cnt    => win_opening_cnt,
              o_wm_request_cnt    => win_request_cnt,
              o_wm_closing_cnt    => win_closing_cnt,
              o_wm_timeout_cnt    => win_timeout_cnt,
              o_wm_opening_offset => win_opening_offset,
              o_wm_request_offset => win_request_offset,
              o_wm_closing_offset => win_closing_offset,
              o_wm_timeout_window => win_timeout_window);

  -- 1st e-link --------------------------------------------------------------
  u_station0_data : entity daq_core.daq_algo
    generic map (g_PIPELINES                         => g_PIPELINES,
                 g_STREAM_WIDTH_ARRAY                => (0 => i_station0_payload'length),
                 g_FIFO_DEPTH_ARRAY                  => (0 => 1024),
                 g_FIFO_MEMORY_TYPE_ARRAY            => (0 => 0),
                 g_NBITS_STREAM_HDR_FIFO_DEPTH_ARRAY => (0 => 16),
                 g_NBITS_STREAM_HDR_WIDTH_ARRAY      => (0 => 16),
                 g_NBITS_STREAM_HDR_COUNTER_ARRAY    => (0 => 16),
                 g_NBITS_STREAM_HDR_USER_ARRAY       => (0 => i_station0_header'length))
    ----------------------------------------------------------------------------
    port map (i_sys_clk_fast => i_sys_clk, -- : in std_logic;
              i_sys_clk_slow => '0',
              i_sys_rst      => i_sys_rst, -- : in std_logic;
              i_sys_bx       => i_sys_bx    , -- : in std_logic;
              ------------------------------------------------------------------
              i_sys_hdr => sys_hdr,
              ------------------------------------------------------------------
              i_req_strb        => req_strb, -- : in std_logic;
              i_req_stable      => req_stable, -- : in std_logic;
              i_win_opening_cnt => win_opening_cnt, -- : in unsigned(11 downto 0);
              i_win_request_cnt => win_request_cnt, -- : in unsigned(11 downto 0);
              i_win_closing_cnt => win_closing_cnt, -- : in unsigned(11 downto 0);
              i_win_timeout_cnt => win_timeout_cnt, -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_win_opening_offset => win_opening_offset, -- : in unsigned(11 downto 0);
              i_win_request_offset => win_request_offset, -- : in unsigned(11 downto 0);
              i_win_closing_offset => win_closing_offset, -- : in unsigned(11 downto 0);
              i_win_timeout_window => win_timeout_window, -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_bcid_cnt => i_bcid_cnt, -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_event_id => event_id, -- : in unsigned(11 downto 0);
              i_usr_hdr_payload => i_station0_flx_header,
              ------------------------------------------------------------------
              i_stream_user_header_emurray => i_station0_header,
              i_stream_ctrl_bcid_array     => (0 => i_station0_bcid),
              i_stream_data_bcid_array     => (0 => i_station0_bcid),
              i_stream_valid_array         => (0 => i_station0_valid),
              i_stream_enable_array        => (0 => i_station0_enable),
              i_stream_payload_emurray     => i_station0_payload,
              ------------------------------------------------------------------
              i_f2e_hfull   => i_station0_flx_hfull, -- : in  std_logic;
              o_f2e_ctrl    => o_station0_flx_ctrl, -- : out std_logic_vector(1 downto 0);
              o_f2e_wr_strb => o_station0_flx_wr_strb, -- : out std_logic;
              o_f2e_payload => o_station0_flx_payload); -- : out std_logic_vector);

  -- 2nd e-link --------------------------------------------------------------
  u_station1_data : entity daq_core.daq_algo
    generic map (g_PIPELINES                         => g_PIPELINES,
                 g_STREAM_WIDTH_ARRAY                => (0 => i_station1_payload'length),
                 g_FIFO_DEPTH_ARRAY                  => (0 => 1024),
                 g_FIFO_MEMORY_TYPE_ARRAY            => (0 => 0),
                 g_NBITS_STREAM_HDR_FIFO_DEPTH_ARRAY => (0 => 16),
                 g_NBITS_STREAM_HDR_WIDTH_ARRAY      => (0 => 16),
                 g_NBITS_STREAM_HDR_COUNTER_ARRAY    => (0 => 16),
                 g_NBITS_STREAM_HDR_USER_ARRAY       => (0 => i_station1_header'length))
    ----------------------------------------------------------------------------
    port map (i_sys_clk_fast => i_sys_clk, -- : in std_logic;
              i_sys_clk_slow => '0',
              i_sys_rst      => i_sys_rst, -- : in std_logic;
              i_sys_bx       => i_sys_bx    , -- : in std_logic;
              ------------------------------------------------------------------
              i_sys_hdr => sys_hdr,
              ------------------------------------------------------------------
              i_req_strb        => req_strb, -- : in std_logic;
              i_req_stable      => req_stable, -- : in std_logic;
              i_win_opening_cnt => win_opening_cnt, -- : in unsigned(11 downto 0);
              i_win_request_cnt => win_request_cnt, -- : in unsigned(11 downto 0);
              i_win_closing_cnt => win_closing_cnt, -- : in unsigned(11 downto 0);
              i_win_timeout_cnt => win_timeout_cnt, -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_win_opening_offset => win_opening_offset, -- : in unsigned(11 downto 0);
              i_win_request_offset => win_request_offset, -- : in unsigned(11 downto 0);
              i_win_closing_offset => win_closing_offset, -- : in unsigned(11 downto 0);
              i_win_timeout_window => win_timeout_window, -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_bcid_cnt => i_bcid_cnt, -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_event_id => event_id, -- : in unsigned(11 downto 0);
              i_usr_hdr_payload => i_station1_flx_header,
              ------------------------------------------------------------------
              i_stream_user_header_emurray => i_station1_header,
              i_stream_ctrl_bcid_array     => (0 => i_station1_bcid),
              i_stream_data_bcid_array     => (0 => i_station1_bcid),
              i_stream_valid_array         => (0 => i_station1_valid),
              i_stream_enable_array        => (0 => i_station1_enable),
              i_stream_payload_emurray     => i_station1_payload,
              ------------------------------------------------------------------
              i_f2e_hfull   => i_station1_flx_hfull, -- : in  std_logic;
              o_f2e_ctrl    => o_station1_flx_ctrl, -- : out std_logic_vector(1 downto 0);
              o_f2e_wr_strb => o_station1_flx_wr_strb, -- : out std_logic;
              o_f2e_payload => o_station1_flx_payload); -- : out std_logic_vector);


  -- 3rd e-link --------------------------------------------------------------
  u_station2_data : entity daq_core.daq_algo
    generic map (g_PIPELINES                         => g_PIPELINES,
                 g_STREAM_WIDTH_ARRAY                => (0 => i_station2_payload'length),
                 g_FIFO_DEPTH_ARRAY                  => (0 => 1024),
                 g_FIFO_MEMORY_TYPE_ARRAY            => (0 => 0),
                 g_NBITS_STREAM_HDR_FIFO_DEPTH_ARRAY => (0 => 16),
                 g_NBITS_STREAM_HDR_WIDTH_ARRAY      => (0 => 16),
                 g_NBITS_STREAM_HDR_COUNTER_ARRAY    => (0 => 16),
                 g_NBITS_STREAM_HDR_USER_ARRAY       => (0 => i_station2_header'length))
    ----------------------------------------------------------------------------
    port map (i_sys_clk_fast => i_sys_clk, -- : in std_logic;
              i_sys_clk_slow => '0',
              i_sys_rst      => i_sys_rst, -- : in std_logic;
              i_sys_bx       => i_sys_bx    , -- : in std_logic;
              ------------------------------------------------------------------
              i_sys_hdr => sys_hdr,
              ------------------------------------------------------------------
              i_req_strb        => req_strb, -- : in std_logic;
              i_req_stable      => req_stable, -- : in std_logic;
              i_win_opening_cnt => win_opening_cnt, -- : in unsigned(11 downto 0);
              i_win_request_cnt => win_request_cnt, -- : in unsigned(11 downto 0);
              i_win_closing_cnt => win_closing_cnt, -- : in unsigned(11 downto 0);
              i_win_timeout_cnt => win_timeout_cnt, -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_win_opening_offset => win_opening_offset, -- : in unsigned(11 downto 0);
              i_win_request_offset => win_request_offset, -- : in unsigned(11 downto 0);
              i_win_closing_offset => win_closing_offset, -- : in unsigned(11 downto 0);
              i_win_timeout_window => win_timeout_window, -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_bcid_cnt => i_bcid_cnt, -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_event_id => event_id, -- : in unsigned(11 downto 0);
              i_usr_hdr_payload => i_station2_flx_header,
              ------------------------------------------------------------------
              i_stream_user_header_emurray => i_station2_header,
              i_stream_ctrl_bcid_array     => (0 => i_station2_bcid),
              i_stream_data_bcid_array     => (0 => i_station2_bcid),
              i_stream_valid_array         => (0 => i_station2_valid),
              i_stream_enable_array        => (0 => i_station2_enable),
              i_stream_payload_emurray     => i_station2_payload,
              ------------------------------------------------------------------
              i_f2e_hfull   => i_station2_flx_hfull, -- : in  std_logic;
              o_f2e_ctrl    => o_station2_flx_ctrl, -- : out std_logic_vector(1 downto 0);
              o_f2e_wr_strb => o_station2_flx_wr_strb, -- : out std_logic;
              o_f2e_payload => o_station2_flx_payload); -- : out std_logic_vector);

  -- 4th e-link --------------------------------------------------------------
  u_station3_data : entity daq_core.daq_algo
    generic map (g_PIPELINES                         => g_PIPELINES,
                 g_STREAM_WIDTH_ARRAY                => (0 => i_station3_payload'length),
                 g_FIFO_DEPTH_ARRAY                  => (0 => 1024),
                 g_FIFO_MEMORY_TYPE_ARRAY            => (0 => 0),
                 g_NBITS_STREAM_HDR_FIFO_DEPTH_ARRAY => (0 => 16),
                 g_NBITS_STREAM_HDR_WIDTH_ARRAY      => (0 => 16),
                 g_NBITS_STREAM_HDR_COUNTER_ARRAY    => (0 => 16),
                 g_NBITS_STREAM_HDR_USER_ARRAY       => (0 => i_station3_header'length))
    ----------------------------------------------------------------------------
    port map (i_sys_clk_fast => i_sys_clk, -- : in std_logic;
              i_sys_clk_slow => '0',
              i_sys_rst      => i_sys_rst, -- : in std_logic;
              i_sys_bx       => i_sys_bx    , -- : in std_logic;
              ------------------------------------------------------------------
              i_sys_hdr => sys_hdr,
              ------------------------------------------------------------------
              i_req_strb        => req_strb, -- : in std_logic;
              i_req_stable      => req_stable, -- : in std_logic;
              i_win_opening_cnt => win_opening_cnt, -- : in unsigned(11 downto 0);
              i_win_request_cnt => win_request_cnt, -- : in unsigned(11 downto 0);
              i_win_closing_cnt => win_closing_cnt, -- : in unsigned(11 downto 0);
              i_win_timeout_cnt => win_timeout_cnt, -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_win_opening_offset => win_opening_offset, -- : in unsigned(11 downto 0);
              i_win_request_offset => win_request_offset, -- : in unsigned(11 downto 0);
              i_win_closing_offset => win_closing_offset, -- : in unsigned(11 downto 0);
              i_win_timeout_window => win_timeout_window, -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_bcid_cnt => i_bcid_cnt, -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_event_id => event_id, -- : in unsigned(11 downto 0);
              i_usr_hdr_payload => i_station3_flx_header,
              ------------------------------------------------------------------
              i_stream_user_header_emurray => i_station3_header,
              i_stream_ctrl_bcid_array     => (0 => i_station3_bcid),
              i_stream_data_bcid_array     => (0 => i_station3_bcid),
              i_stream_valid_array         => (0 => i_station3_valid),
              i_stream_enable_array        => (0 => i_station3_enable),
              i_stream_payload_emurray     => i_station3_payload,
              ------------------------------------------------------------------
              i_f2e_hfull   => i_station3_flx_hfull, -- : in  std_logic;
              o_f2e_ctrl    => o_station3_flx_ctrl, -- : out std_logic_vector(1 downto 0);
              o_f2e_wr_strb => o_station3_flx_wr_strb, -- : out std_logic;
              o_f2e_payload => o_station3_flx_payload); -- : out std_logic_vector);





  

  -- ttc_u : entity ttc_lib.ttc
  --   port map (ttc_ir => ttc_er.i, ttc_or => ttc_er.o);
  -- 
  -- ttc_er.i.sys <= data_path_ir.sys;
  -- ttc_er.i.data <= data_path_ir.ttc;
  -- 
  -- u_daq_branch: entity daq_lib.daq_branch
  --   generic map (PIPELINES       => 40,
  --                BRANCHES_MASK   => (1, 1, 1, 1, others => 0),
  --                BRANCHES_STRUCT => (
  --                  ((42, 1024), others => (0, 0)),
  --                  ((42, 1024), others => (0, 0)),
  --                  ((42, 1024), others => (0, 0)),
  --                  ((42, 1024), others => (0, 0)),
  --                  others => (others => (0, 0))),
  --                COUNTER_WIDTH     => 32,
  --                OUTPUT_DATA_WIDTH => 16)
  --   port map (branch_ir => branch_er.i, branch_or =>  branch_er.o);
  -- 
  -- branch_er.i.sys.clk320 <= data_path_ir.sys.clk320;
  -- branch_er.i.sys.rst <= data_path_ir.sys.rst;
  -- 
  -- branch_er.i.ttc <= ttc_er.o;
  -- branch_er.i.ctrl <= data_path_ir.ctrl;
  -- 
  -- branch_er.i.branches(0)(0) <= data_path_ir.stream_0;
  -- branch_er.i.branches(1)(0) <= data_path_ir.stream_1;
  -- branch_er.i.branches(2)(0) <= data_path_ir.stream_2;
  -- branch_er.i.branches(3)(0) <= data_path_ir.stream_3;
  -- 
  -- branch_er.i.f2e_bus(0) <= data_path_ir.f2e0;
  -- branch_er.i.f2e_bus(1) <= data_path_ir.f2e1;
  -- branch_er.i.f2e_bus(2) <= data_path_ir.f2e2;
  -- branch_er.i.f2e_bus(3) <= data_path_ir.f2e3;
  -- 
  -- data_path_or.f2e0 <= branch_er.o.f2e_bus(0);
  -- data_path_or.f2e1 <= branch_er.o.f2e_bus(1);
  -- data_path_or.f2e2 <= branch_er.o.f2e_bus(2);
  -- data_path_or.f2e3 <= branch_er.o.f2e_bus(3);
  -- 
  -- data_path_or.status0 <= branch_er.o.status_bus(0);
  -- data_path_or.status1 <= branch_er.o.status_bus(1);
  -- data_path_or.status2 <= branch_er.o.status_bus(2);
  -- data_path_or.status3 <= branch_er.o.status_bus(3);

end architecture V2;

