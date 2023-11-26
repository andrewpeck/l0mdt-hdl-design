library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
-- use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
-- use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
-- use shared_lib.config_pkg.all;

library daq_lib;

library daq_core;
use daq_core.daq_defs.all;
use daq_core.daq_v3.all;

entity daq_station is
  generic (g_DELAY            : integer := 100; -- number of LHC clocks
           g_PIPELINES        : integer :=  32;
           g_OUTPUT_LINKS     : integer :=   3;
           g_NCHAMBERS        : integer :=   6;
           g_DATA_WIDTH       : integer :=  42;
           g_NBITS_STREAM_HDR : integer :=  16;
           g_NBITS_SYSTEM_HDR : integer :=  32); 
  port (i_clk           : in  std_logic;
        i_rst           : in  std_logic;
        i_bx            : in  std_logic;
        ------------------------------------------------------------------
        o_busy          : out std_logic;
        o_wme_available : out std_logic;
        ------------------------------------------------------------------
        i_req_strb        : in std_logic;
        i_win_opening_cnt : in unsigned(11 downto 0);
        i_win_request_cnt : in unsigned(11 downto 0);
        i_win_closing_cnt : in unsigned(11 downto 0);
        ------------------------------------------------------------------
        i_ctrl_bcid_offset   : in unsigned(11 downto 0);
        i_win_opening_offset : in unsigned(11 downto 0);
        i_win_request_offset : in unsigned(11 downto 0);
        i_win_closing_offset : in unsigned(11 downto 0);
        i_win_window_timeout : in unsigned(11 downto 0);
        i_win_busy_threshold : in unsigned( 7 downto 0);
        ------------------------------------------------------------------
        i_bcid_cnt  : in unsigned(11 downto 0);
        i_curr_bcid : in unsigned(11 downto 0);
        ------------------------------------------------------------------
        i_event_id : in unsigned(31 downto 0);
        ------------------------------------------------------------------
        i_sys_hdr                : in  std_logic_vector(g_NBITS_SYSTEM_HDR-1 downto 0);
        i_station_usr_hdr_v      : in  std_logic_vector(g_NBITS_STREAM_HDR-1 downto 0);
        i_station_tdc_hits_av    : in  std_logic_vector_array(g_NCHAMBERS-1 downto 0)(g_DATA_WIDTH-1 downto 0);
        ------------------------------------------------------------------
        i_station_flx_streams_hfull_bus   : in  std_logic_vector(0 to g_OUTPUT_LINKS-1);
        o_station_flx_streams_wr_strb_bus : out std_logic_vector(0 to g_OUTPUT_LINKS-1);
        o_station_flx_streams_ctrl_bus    : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(1 downto 0);
        o_station_flx_streams_payload_bus : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(31 downto 0));
end entity daq_station;

architecture behavioral of daq_station is

  signal station_flx_streams_ar          : felix_data_art(0 to g_OUTPUT_LINKS-1);
  signal station_flx_streams_ctrl_bus    : daq_core.yml2hdl.std_logic_vector_array(station_flx_streams_ar'range)(1 downto 0);
  signal station_flx_streams_payload_bus : daq_core.yml2hdl.std_logic_vector_array(station_flx_streams_ar'range)(31 downto 0);

  signal station_struct : tdcpolmux2tar_rt;
  signal station_wr_strb : std_logic;
  signal station_payload : std_logic_vector(g_DATA_WIDTH-1 downto 0);

  signal f2e_ctrl_array : daq_core.yml2hdl.std_logic_vector_array(station_flx_streams_ar'range)(1 downto 0);
  signal f2e_payload_array : daq_core.yml2hdl.std_logic_vector_array(station_flx_streams_ar'range)(31 downto 0);

  function convert(x: daq_core.yml2hdl.std_logic_vector_array) return shared_lib.common_ieee_pkg.std_logic_vector_array is
    variable y : shared_lib.common_ieee_pkg.std_logic_vector_array(x'range)(x(x'low)'range);
  begin
    for ii in x'range loop
      y(ii) := x(ii);
    end loop;
    return y;
  end function convert;

  signal ctrl_bcid : unsigned(11 downto 0);
  
begin

  process (i_clk)
  begin
    if rising_edge(i_clk) then
      if i_bx = '1' then
        if i_bcid_cnt = i_ctrl_bcid_offset then
          ctrl_bcid <= (others => '0');
        else
          ctrl_bcid <= ctrl_bcid + 1;
        end if;
      end if;
    end if;
  end process;



  u_latbuf : entity daq_lib.latency_buffer
    generic map (g_NCHAMBERS  => g_NCHAMBERS , -- : integer :=   6;
                 g_DATA_WIDTH => g_DATA_WIDTH) -- : integer :=  42)
    port map (i_clk           => i_clk, -- : in  std_logic;
              i_rst           => i_rst, -- : in  std_logic;
              ------------------------------------------------------------------
              i_bcid_cntr     => i_bcid_cnt, -- : in  unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_payload_array => i_station_tdc_hits_av, -- : in  std_logic_vector_array(g_NCHAMBERS-1 downto 0)(g_DATA_WIDTH-1 downto 0);
              ------------------------------------------------------------------
              o_wr_strb       => station_wr_strb,  -- : out std_logic;
              o_payload       => station_payload); -- : out std_logic_vector(g_DATA_WIDTH-1 downto 0));

  station_struct <= convert(station_payload, station_struct);
  
  u_daq : entity daq_core.daq_algo
    generic map (g_PIPELINES                         => g_PIPELINES,
                 g_STREAM_WIDTH_ARRAY                => (0 => g_DATA_WIDTH),
                 g_FIFO_DEPTH_ARRAY                  => (0 => 1024),
                 g_FIFO_MEMORY_TYPE_ARRAY            => (0 => "ultra"),
                 g_NBITS_STREAM_HDR_FIFO_DEPTH_ARRAY => (0 => 16),
                 g_NBITS_STREAM_HDR_WIDTH_ARRAY      => (0 => 16),
                 g_NBITS_STREAM_HDR_COUNTER_ARRAY    => (0 => 16),
                 g_NBITS_STREAM_HDR_USER_ARRAY       => (0 => g_NBITS_STREAM_HDR),
                 g_OUTPUT_LINKS                      => g_OUTPUT_LINKS,
                 g_PACKET_BUILDER_FIFO_TYPE          => "ultra", 
                 g_BUS_CONVERTER_FIFO_TYPE           => "ultra",
                 g_NBITS_SNAPSHOT                    => 40,
                 g_FORMAT_VERSION                    => 1)
    ----------------------------------------------------------------------------
    port map (i_sys_clk_fast => i_clk, -- : in std_logic;
              i_sys_rst      => i_rst, -- : in std_logic;
              i_sys_bx       => i_bx , -- : in std_logic;
              ------------------------------------------------------------------
              o_busy          => o_busy,
              o_wme_available => o_wme_available,
              ------------------------------------------------------------------
              i_sys_hdr => i_sys_hdr,
              ------------------------------------------------------------------
              i_req_strb        => i_req_strb, -- : in std_logic;
              i_win_opening_cnt => i_win_opening_cnt, -- : in unsigned(11 downto 0);
              i_win_request_cnt => i_win_request_cnt, -- : in unsigned(11 downto 0);
              i_win_closing_cnt => i_win_closing_cnt, -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_win_opening_offset => i_win_opening_offset, -- : in unsigned(11 downto 0);
              i_win_request_offset => i_win_request_offset, -- : in unsigned(11 downto 0);
              i_win_closing_offset => i_win_closing_offset, -- : in unsigned(11 downto 0);
              i_win_window_timeout => i_win_window_timeout, -- : in unsigned(11 downto 0);
              i_win_busy_threshold => i_win_busy_threshold,
              ------------------------------------------------------------------
              i_bcid_cnt  => i_bcid_cnt, -- : in unsigned(11 downto 0);
              i_curr_bcid => i_curr_bcid,
              ------------------------------------------------------------------
              i_event_id => i_event_id, -- : in unsigned(11 downto 0);
              i_usr_hdr_payload => "",
              ------------------------------------------------------------------
              i_stream_user_header_emurray => i_station_usr_hdr_v                          , 
              i_stream_ctrl_bcid_array     => (0 => ctrl_bcid)                             ,
              i_stream_data_bcid_array     => (0 => station_struct.tdc.coarsetime)      ,
              i_stream_valid_array         => (0 => station_wr_strb)                       ,
              i_stream_enable_array        => (0 => '1')                                   ,
              i_stream_payload_emurray     => station_payload,
              ------------------------------------------------------------------
              i_f2e_pfull_array   => i_station_flx_streams_hfull_bus, -- : in  std_logic;
              o_f2e_ctrl_array    => station_flx_streams_ctrl_bus, -- : out std_logic_vector(1 downto 0);
              o_f2e_wr_strb_array => o_station_flx_streams_wr_strb_bus, -- : out std_logic;
              o_f2e_payload_array => station_flx_streams_payload_bus); -- : out std_logic_vector);
  
  o_station_flx_streams_ctrl_bus  <= convert(station_flx_streams_ctrl_bus);
  o_station_flx_streams_payload_bus <= convert(station_flx_streams_payload_bus);

  
end architecture behavioral;
