library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
-- use shared_lib.config_pkg.all;

library daq_lib;
library daq_core;

entity tb_daq_station is
end entity tb_daq_station;

architecture behavioral of tb_daq_station is

  constant c_DAQ_LINKS     : integer := 9;
  constant c_DAQ_INN_LINKS : integer := 3;
  constant c_DAQ_MID_LINKS : integer := 3;
  constant c_DAQ_OUT_LINKS : integer := 3;
  constant c_DAQ_EXT_LINKS : integer := 0;
  constant c_OUTPUT_LINKS  : integer := 1;
  
  procedure something(file     tv_file        :     text;
                      signal   clk_i          : in  std_logic;
                      signal   chamber_time_i : out integer;
                      signal   chamber_data_i : out std_logic_vector) is
    variable ok           : boolean;
    variable l            : line;
    variable chamber_time : integer;
    variable chamber_data : std_logic_vector(chamber_data_i'range);
  begin
    if not endfile(tv_file) then
      readline(tv_file, l);
      if not(l.all'length = 0 or l.all(1) = '#') then

        read(l, chamber_time, ok);
        read(l, chamber_data, ok);

        assert false
          report "ok: " & boolean'image(ok)
          severity note;
        
        assert false
          report "chamber time: " & integer'image(chamber_time)
          severity note;
        
        assert false
          report "chamber data: " & to_string(chamber_data)
          severity note;
        
        chamber_time_i <= chamber_time;
        chamber_data_i <= chamber_data;

      end if;
    end if;
  end procedure something;

  signal clk                 : std_logic := '1';
  signal rst                 : std_logic := '1';
  signal bx                  : std_logic := '0';

  signal orid                : std_logic_vector(1 downto 0);
  signal l0a                 : std_logic;
  signal ecr                 : std_logic;
  signal bcid                : unsigned(11 downto 0) := (others => '0');

  signal flags               : std_logic_vector(6 downto 0);
  signal ec                  : std_logic;
  signal sector_id           : std_logic_vector(3 downto 0);
  signal frag_id             : std_logic_vector(3 downto 0);

  signal daq_stream_data_a   : std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(31 downto 0);
  signal daq_stream_ctrl_a   : std_logic_vector_array(c_DAQ_LINKS-1 downto 0)( 1 downto 0);
  signal daq_stream_wren_a   : std_logic_vector(c_DAQ_LINKS-1 downto 0);

  signal bx_ctr              : integer := 0;

  signal ctrl_opening_offset : integer;
  signal ctrl_request_offset : integer;
  signal ctrl_closing_offset : integer;
  signal ctrl_window_timeout : integer;
  signal ctrl_busy_threshold : integer;

  signal chamber_data_a      : tdcpolmux2tar_avt(2 downto 0) := (others => (others => '0'));
  signal chamber_time_a      : integer_vector(2 downto 0) := (others => 0);

  signal req_strb : std_logic := '0';

  signal bcid_cnt    : unsigned(11 downto 0) := (others => '0');
  signal opening_cnt : unsigned(11 downto 0) := (others => '0');
  signal request_cnt : unsigned(11 downto 0) := (others => '0');
  signal closing_cnt : unsigned(11 downto 0) := (others => '0');
  
  file f0 : text open read_mode is "../tb/chamber0_data.txt";
  file f1 : text open read_mode is "../tb/chamber1_data.txt";
  file f2 : text open read_mode is "../tb/chamber2_data.txt";

  signal finetime : integer := 0;

  signal wme_available                   : std_logic;

  signal wm_req_strb                     : std_logic;
  signal wm_opening_cnt                  : unsigned(11 downto 0);
  signal wm_request_cnt                  : unsigned(11 downto 0);
  signal wm_closing_cnt                  : unsigned(11 downto 0);

  signal wm_opening_offset               : unsigned(11 downto 0);
  signal wm_request_offset               : unsigned(11 downto 0);
  signal wm_closing_offset               : unsigned(11 downto 0);
  signal wm_window_timeout               : unsigned(11 downto 0);
  signal wm_busy_threshold               : unsigned( 7 downto 0);

  signal wm_curr_bcid                    : unsigned(11 downto 0);

  signal wm_event_id                     : unsigned(31 downto 0);

  signal wm_sys_hdr                      : std_logic_vector(31 downto 0) := (others => '1');
  signal wm_user_header                  : std_logic_vector(31 downto 0) := (others => '1');

  signal station_flx_streams_wr_strb_bus : std_logic_vector(0 to c_OUTPUT_LINKS-1);
  signal station_flx_streams_ctrl_bus    : std_logic_vector_array(0 to c_OUTPUT_LINKS-1)(1 downto 0);
  signal station_flx_streams_payload_bus : std_logic_vector_array(0 to c_OUTPUT_LINKS-1)(31 downto 0);

  signal req_cnt : unsigned(11 downto 0);

  signal l0a_next : integer := 0;
  signal l0a_bcid : integer_vector(0 to 100) := (0 => 200, others => 5000);
  
begin

  clk <= not clk after 1 ns;
  rst <= '0' after  6 ns;

  process (clk)
  begin
    if rising_edge(clk) then
      l0a <= '0';
      if bx = '1' then
        bx <= '0';
      end if;
      if bx_ctr = 7 then
        bx_ctr <= 0;
        bx     <= '1';
        bcid_cnt <= bcid_cnt + 1;
        if bcid_cnt+1 = l0a_bcid(l0a_next) then
          l0a <= '1';
          l0a_next <= l0a_next + 1;
        end if;
      else
        bx_ctr <= bx_ctr + 1;
      end if;
    end if;
  end process;

  process (clk)
  begin
    if rising_edge(clk) then
      if bx = '1' then
        bcid <= bcid + 1;
      end if;
    end if;
  end process;

  process (clk)
  begin
    if rising_edge(clk) then
      chamber_data_a(0)(chamber_data_a(0)'high) <= '0';
      finetime <= finetime + 1;
      if finetime = chamber_time_a(0) then

        assert false
          report "finetime:  " & integer'image(finetime)
          severity note;
        
        chamber_data_a(0)(chamber_data_a(0)'high) <= '1';
        something(f0, clk, chamber_time_a(0), chamber_data_a(0)(chamber_data_a(0)'left-1 downto 0));
      end if;
    end if;
  end process;

  u_daq_station : entity daq_lib.daq_station
    generic map (g_DELAY        => 100                                      , -- : integer := 100; -- number of LHC clocks
                 g_PIPELINES    => 32                                       , -- : integer :=  32;
                 g_OUTPUT_LINKS => c_OUTPUT_LINKS                           , -- : integer := 3)
                 g_NCHAMBERS    => chamber_data_a'length                    , -- : integer :=   6;
                 g_DATA_WIDTH   => chamber_data_a(chamber_data_a'low)'length) -- : integer :=  42)
    port map (i_clk                             => clk                            ,  -- : in  std_logic;
              i_rst                             => rst                            ,  -- : in  std_logic;
              i_bx                              => bx                             ,  -- : in  std_logic;
              ------------------------------------------------------------------
              o_busy                            => open                           ,  -- : out std_logic;
              o_wme_available                   => wme_available                  ,  -- : out std_logic;
              ------------------------------------------------------------------
              i_req_strb                        => wm_req_strb                    ,  -- : in std_logic;
              i_win_opening_cnt                 => wm_opening_cnt                 ,  -- : in unsigned(11 downto 0);
              i_win_request_cnt                 => wm_request_cnt                 ,  -- : in unsigned(11 downto 0);
              i_win_closing_cnt                 => wm_closing_cnt                 ,  -- : in unsigned(11 downto 0);
              -------------------------------------------------------- ----------
              i_ctrl_bcid_offset                => to_unsigned(40, 12)            ,  -- : in unsigned(11 downto 0);
              i_win_opening_offset              => wm_opening_offset              ,  -- : in unsigned(11 downto 0);
              i_win_request_offset              => wm_request_offset              ,  -- : in unsigned(11 downto 0);
              i_win_closing_offset              => wm_closing_offset              ,  -- : in unsigned(11 downto 0);
              i_win_window_timeout              => wm_window_timeout              ,  -- : in unsigned(11 downto 0);
              i_win_busy_threshold              => wm_busy_threshold              ,  -- : in unsigned( 7 downto 0);
              ------------------------------------------------------------------
              i_bcid_cnt                        => bcid_cnt                       ,  -- : in unsigned(11 downto 0);
              i_curr_bcid                       => wm_curr_bcid                   ,  -- : in unsigned(11 downto 0);
              ------------------------------------------------------------------
              i_event_id                        => wm_event_id                    ,  -- : in unsigned(31 downto 0);
              ------------------------------------------------------------------
              i_sys_hdr                         => wm_sys_hdr                     ,  -- : in  std_logic_vector;
              i_station_usr_hdr                 => wm_user_header                 ,  -- : in  std_logic_vector;
              i_station_tdc_hits_av             => chamber_data_a                 ,  -- : in  std_logic_vector_array;
              ------------------------------------------------------------------
              i_station_flx_streams_hfull_bus   => (others => '0')                ,  -- : in  std_logic_vector(0 to g_OUTPUT_LINKS-1);
              o_station_flx_streams_wr_strb_bus => station_flx_streams_wr_strb_bus,  -- : out std_logic_vector(0 to g_OUTPUT_LINKS-1);
              o_station_flx_streams_ctrl_bus    => station_flx_streams_ctrl_bus   ,  -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(1 downto 0);
              o_station_flx_streams_payload_bus => station_flx_streams_payload_bus); -- : out std_logic_vector_array(0 to g_OUTPUT_LINKS-1)(31 downto 0));

  u_daq_req : entity daq_core.daq_req
    port map (i_sys_clk_fast => clk,
              i_sys_rst      => rst,
              i_sys_bx       => bx,
              ------------------------------------------------------------------
              i_lxa_strb     => l0a,
              i_ecr_strb     => ecr,
              i_bcid_cnt     => bcid,
              o_request_cnt  => req_cnt,
              ------------------------------------------------------------------
              i_ctrl_opening_offset => to_unsigned( 12, 12),
              i_ctrl_request_offset => to_unsigned( 10, 12),
              i_ctrl_closing_offset => to_unsigned(  8, 12),
              i_ctrl_window_timeout => to_unsigned(100, 12),
              i_ctrl_busy_threshold => to_unsigned( 32,  8),
              ------------------------------------------------------------------
              o_status_valid  => open,
              i_wme_available => wme_available,
              ------------------------------------------------------------------
              i_user_header => x"EEEEEEEE",
              i_sys_hdr     => (31 downto 0 => '0'),
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


  
end architecture behavioral;
