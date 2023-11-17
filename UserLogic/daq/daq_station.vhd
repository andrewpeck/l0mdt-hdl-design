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

entity daq_station is
  generic (g_DELAY        : integer := 100; -- number of LHC clocks
           g_PIPELINES    : integer :=  32;
           g_OUTPUT_LINKS : integer :=   3;
           g_NCHAMBERS    : integer :=   6;
           g_DATA_WIDTH   : integer :=  42); 
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
        i_sys_hdr                : in  std_logic_vector;
        i_station_usr_hdr        : in  std_logic_vector;
        i_station_tdc_hits_av    : in  std_logic_vector_array(g_NCHAMBERS-1 downto 0)(g_DATA_WIDTH-1 downto 0);
        ------------------------------------------------------------------
        i_station_flx_streams_hfull_bus   : in  std_logic_vector(0 to g_OUTPUT_LINKS-1);
        o_station_flx_streams_wr_strb_bus : out std_logic_vector(0 to g_OUTPUT_LINKS-1);
        o_station_flx_streams_ctrl_bus    : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(1 downto 0);
        o_station_flx_streams_payload_bus : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(31 downto 0));
end entity daq_station;

architecture behavioral of daq_station is

  signal station_payload_r : tdcpolmux2tar_rt;
  signal station_payload_v : std_logic_vector(tdcpolmux2tar_vt'w-1 downto 0);

  signal station_tdc_hits_av        : std_logic_vector_array(i_station_tdc_hits_av'range)(i_station_tdc_hits_av(i_station_tdc_hits_av'low)'range);
  signal station_tdc_hits_ar        : tdcpolmux2tar_art(i_station_tdc_hits_av'range);
  signal station_tdc_hits_emurray_v : std_logic_vector(i_station_tdc_hits_av'length*i_station_tdc_hits_av(i_station_tdc_hits_av'low)'length-1 downto 0);

  signal station_flx_streams_ar          : felix_data_art(0 to g_OUTPUT_LINKS-1);
  -- signal station_flx_streams_hfull_bus   : std_logic_vector(station_flx_streams_ar'range);
  -- signal station_flx_streams_wr_strb_bus : std_logic_vector(station_flx_streams_ar'range);
  signal station_flx_streams_ctrl_bus    : daq_core.yml2hdl.std_logic_vector_array(station_flx_streams_ar'range)(1 downto 0);
  signal station_flx_streams_payload_bus : daq_core.yml2hdl.std_logic_vector_array(station_flx_streams_ar'range)(31 downto 0);

  signal chamber_fifo_rd_strb_bus : std_logic_vector(station_tdc_hits_av'range);
  signal chamber_fifo_nempty_bus  : std_logic_vector(station_tdc_hits_av'range);
  signal chamber_fifo_payload_bus : std_logic_vector_array(station_tdc_hits_av'range)(station_tdc_hits_av(station_tdc_hits_av'low)'range);

  signal chamber_fifo_payload : std_logic_vector(i_station_tdc_hits_av(i_station_tdc_hits_av'low)'range);
  signal chamber_fifo_nempty  : std_logic;
  signal chamber_fifo_rd_strb  : std_logic;
    
  signal station_fifo_rd_strb   : std_logic;
  signal station_fifo_nempty    : std_logic;
  signal station_fifo_payload_v : std_logic_vector(station_tdc_hits_av(station_tdc_hits_av'low)'length+11 downto 0);
  signal station_fifo_payload_r : tdcpolmux2tar_rt;

  signal station_wr_strb : std_logic;
  signal station_payload : std_logic_vector(station_payload_v'range);

  signal f2e_ctrl_array : daq_core.yml2hdl.std_logic_vector_array(station_flx_streams_ar'range)(1 downto 0);
  signal f2e_payload_array : daq_core.yml2hdl.std_logic_vector_array(station_flx_streams_ar'range)(31 downto 0);

  signal delivered : unsigned(11 downto 0);

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

  station_tdc_hits_av        <= i_station_tdc_hits_av;
  station_tdc_hits_ar        <= convert(station_tdc_hits_av, station_tdc_hits_ar);

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
  
  
  gen_daq_chamber_fifos: for jj in 0 to station_tdc_hits_ar'high generate
  begin
    G0: if jj = 0  generate
      u_daq_fifo_pipeline : entity daq_lib.daq_fifo_pipeline
        generic map (g_FIFO_DEPTH       => 16, -- : integer;
                     g_FIFO_MEMORY_TYPE => "bram") -- : string)
        port map (i_clk => i_clk, -- : std_logic;
                  i_rst => i_rst, -- : std_logic;
                  -- priority -----------------------------------
                  i_1st_src_payload => station_tdc_hits_av(jj), -- : in  std_logic_vector;
                  i_1st_src_wr_strb => station_tdc_hits_ar(jj).data_valid, -- : in  std_logic;
                  -- secondary ----------------------------------
                  i_2nd_src_nempty   => '0', -- : out std_logic;
                  i_2nd_src_payload  => (station_tdc_hits_av(jj)'range => '0'), -- : out std_logic_vector;
                  o_2nd_src_rd_strb  => open, -- : in  std_logic;
                  -- read ---------------------------------------
                  o_dst_nempty  => chamber_fifo_nempty_bus(jj), -- : out std_logic;
                  i_dst_rd_strb => chamber_fifo_rd_strb_bus(jj), -- : in  std_logic;
                  o_dst_payload => chamber_fifo_payload_bus(jj)); -- : out std_logic_vector);
     else generate
      u_daq_fifo_pipeline : entity daq_lib.daq_fifo_pipeline
        generic map (g_FIFO_DEPTH       => 2**(jj+5), -- : integer;
                     g_FIFO_MEMORY_TYPE => "bram") -- : string)
        port map (i_clk => i_clk, -- : std_logic;
                  i_rst => i_rst, -- : std_logic;
                  -- priority -----------------------------------
                  i_1st_src_payload => station_tdc_hits_av(jj), -- : in  std_logic_vector;
                  i_1st_src_wr_strb => station_tdc_hits_ar(jj).data_valid, -- : in  std_logic;
                  -- secondary ----------------------------------
                  i_2nd_src_nempty   => chamber_fifo_nempty_bus(jj-1) , -- : out std_logic;
                  i_2nd_src_payload  => chamber_fifo_payload_bus(jj-1), -- : out std_logic_vector;
                  o_2nd_src_rd_strb  => chamber_fifo_rd_strb_bus(jj-1), -- : in  std_logic;
                  -- read ---------------------------------------
                  o_dst_nempty  => chamber_fifo_nempty_bus(jj)  , -- : out std_logic;
                  i_dst_rd_strb => chamber_fifo_rd_strb_bus(jj) , -- : in  std_logic;
                  o_dst_payload => chamber_fifo_payload_bus(jj)); -- : out std_logic_vector);
      end generate G0;
  end generate gen_daq_chamber_fifos;

  chamber_fifo_rd_strb_bus(chamber_fifo_rd_strb_bus'high) <= chamber_fifo_nempty;

  -- gen_daq_chamber_rd_enable: for jj in 1 to station_tdc_hits_ar'high-1 generate
  -- begin
  --   chamber_fifo_rd_strb_bus(jj-1) <= chamber_fifo_rd_strb_bus(jj);
  -- end generate gen_daq_chamber_rd_enable;

  u_station_fifo : entity daq_lib.daq_fifo
    generic map (g_FIFO_DEPTH       => 1024, -- : integer;
                 g_FIFO_MEMORY_TYPE => "ultra") -- : integer range 0 to 3 := 0)
    port map (i_sys_clk_fast => i_clk, -- : in std_logic;
              i_sys_rst      => i_rst, -- : in std_logic;
              ---------------------------------------------
              i_src_payload  => std_logic_vector(i_bcid_cnt) & chamber_fifo_payload, -- : in  std_logic_vector;
              i_src_wr_strb  => chamber_fifo_nempty, -- : in  std_logic;
              ---------------------------------------------
              i_dst_rd_strb  => station_fifo_rd_strb, -- : in  std_logic;
              o_dst_nempty   => station_fifo_nempty, -- : out std_logic;
              o_dst_payload  => station_fifo_payload_v); -- : out std_logic_vector);

  
  -- write to station fifo from chamber fifos ----------------------------------------------------------------------------

  process (i_clk)
    variable ptr : integer := 0;
    variable cnt : integer;
  begin
    if rising_edge(i_clk) then
      chamber_fifo_nempty  <= chamber_fifo_nempty_bus(chamber_fifo_nempty_bus'high);
      chamber_fifo_payload <= chamber_fifo_payload_bus(chamber_fifo_payload_bus'high);
    end if;
  end process;    

  
  -- read from station fifo to daq engine --------------------------------------------------------------------------------

  station_payload_r <= convert(station_payload_v, station_payload_r);

  process (i_clk)
  begin  
    if rising_edge(i_clk) then

      delivered <= unsigned(station_fifo_payload_v(station_fifo_payload_v'high downto station_fifo_payload_v'length-bcid'length));
      if station_fifo_nempty = '1' then
        station_payload_v <= station_fifo_payload_v(station_fifo_payload_v'high-bcid'length downto 0);
      else
        station_payload_v <= (others => '0');
        -- delivered <= (others => '0');
      end if;
      
      station_fifo_rd_strb <= '0';
      station_wr_strb <= '0';
      if (((i_bcid_cnt >= delivered and i_bcid_cnt-delivered >= g_DELAY)
          or (i_bcid_cnt < delivered and delivered-i_bcid_cnt >= g_DELAY))
          and station_fifo_nempty = '1') then
        station_fifo_rd_strb <= '1';
        station_wr_strb <= '1';
      end if;
      
    end if;
  end process;

  u_daq : entity daq_core.daq_algo
    generic map (g_PIPELINES                         => g_PIPELINES,
                 g_STREAM_WIDTH_ARRAY                => (0 => station_payload_v'length),
                 g_FIFO_DEPTH_ARRAY                  => (0 => 1024),
                 g_FIFO_MEMORY_TYPE_ARRAY            => (0 => "ultra"),
                 g_NBITS_STREAM_HDR_FIFO_DEPTH_ARRAY => (0 => 16),
                 g_NBITS_STREAM_HDR_WIDTH_ARRAY      => (0 => 16),
                 g_NBITS_STREAM_HDR_COUNTER_ARRAY    => (0 => 16),
                 g_NBITS_STREAM_HDR_USER_ARRAY       => (0 => i_station_usr_hdr'length),
                 g_OUTPUT_LINKS                      => g_OUTPUT_LINKS,
                 g_PACKET_BUILDER_FIFO_TYPE          => "bram", 
                 g_BUS_CONVERTER_FIFO_TYPE           => "bram",
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
              i_stream_user_header_emurray => i_station_usr_hdr,
              i_stream_ctrl_bcid_array     => (0 => ctrl_bcid),
              i_stream_data_bcid_array     => (0 => station_payload_r.tdc.coarsetime),
              i_stream_valid_array         => (0 => station_payload_r.data_valid),
              i_stream_enable_array        => (0 => '1'),
              i_stream_payload_emurray     => station_payload_v,
              ------------------------------------------------------------------
              i_f2e_pfull_array   => i_station_flx_streams_hfull_bus, -- : in  std_logic;
              o_f2e_ctrl_array    => station_flx_streams_ctrl_bus, -- : out std_logic_vector(1 downto 0);
              o_f2e_wr_strb_array => o_station_flx_streams_wr_strb_bus, -- : out std_logic;
              o_f2e_payload_array => station_flx_streams_payload_bus); -- : out std_logic_vector);

  o_station_flx_streams_ctrl_bus  <= convert(station_flx_streams_ctrl_bus);
  o_station_flx_streams_payload_bus <= convert(station_flx_streams_payload_bus);

  
end architecture behavioral;
