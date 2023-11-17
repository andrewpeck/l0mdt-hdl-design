library ieee;
use ieee.std_logic_misc.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.textio.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
-- use shared_lib.l0mdt_constants_pkg.all;
-- use shared_lib.l0mdt_dataformats_pkg.all;
-- use shared_lib.common_constants_pkg.all;
-- use shared_lib.common_types_pkg.all;
-- use shared_lib.config_pkg.all;

library daq_lib;

entity tb_daq_data_path is
end entity tb_daq_data_path;

architecture behavioral of tb_daq_data_path is

  constant c_DAQ_LINKS     : integer := 9;
  constant c_DAQ_INN_LINKS : integer := 3;
  constant c_DAQ_MID_LINKS : integer := 3;
  constant c_DAQ_OUT_LINKS : integer := 3;
  constant c_DAQ_EXT_LINKS : integer := 0;

  signal clk                 : std_logic := '1';
  signal rst                 : std_logic := '1';
  signal bx                  : std_logic := '0';

  signal orid                : std_logic_vector(1 downto 0);
  signal l1a                 : std_logic;
  signal ecr                 : std_logic;
  signal bcid                : unsigned(11 downto 0) := (others => '0');

  signal flags               : std_logic_vector(6 downto 0);
  signal ec                  : std_logic;
  signal sector_id           : std_logic_vector(3 downto 0);
  signal frag_id             : std_logic_vector(3 downto 0);

  signal inn_tdc_hits_av     : std_logic_vector_array(0 to 3)(43 downto 0);
  signal mid_tdc_hits_av     : std_logic_vector_array(0 to 3)(43 downto 0);
  signal out_tdc_hits_av     : std_logic_vector_array(0 to 3)(43 downto 0);
  signal ext_tdc_hits_av     : std_logic_vector_array(0 to 3)(43 downto 0);

  signal daq_stream_data_v   : std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(31 downto 0);
  signal daq_stream_ctrl_v   : std_logic_vector_array(c_DAQ_LINKS-1 downto 0)( 1 downto 0);
  signal daq_stream_wren_v   : std_logic_vector(c_DAQ_LINKS-1 downto 0);

  signal bx_ctr              : integer := 0;

  signal ctrl_opening_offset : integer;
  signal ctrl_request_offset : integer;
  signal ctrl_closing_offset : integer;
  signal ctrl_window_timeout : integer;
  signal ctrl_busy_threshold : integer;

  signal inn_tdc_hits        : std_logic_vector(255 downto 0);
  signal mid_tdc_hits        : std_logic_vector(255 downto 0);
  signal out_tdc_hits        : std_logic_vector(255 downto 0);
  signal ext_tdc_hits        : std_logic_vector(255 downto 0);

  signal lhc_time            : integer;
  
begin

  clk <= not clk after 1 ns;
  rst <= '0' after  6 ns;

  process (clk)
  begin
    if rising_edge(clk) then
      if bx = '1' then
        bx <= '0';
      end if;
      if bx_ctr = 7 then
        bx_ctr <= 0;
        bx     <= '1';
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

  inn_tdc_hits_av <= convert(std_logic_vector(inn_tdc_hits), inn_tdc_hits_av);
  mid_tdc_hits_av <= convert(std_logic_vector(mid_tdc_hits), mid_tdc_hits_av);
  out_tdc_hits_av <= convert(std_logic_vector(out_tdc_hits), out_tdc_hits_av);
  ext_tdc_hits_av <= convert(std_logic_vector(ext_tdc_hits), ext_tdc_hits_av);
         
  -- u_daq_data_path : entity daq_lib.daq_data_path
  --   generic map (g_DAQ_LINKS     => c_DAQ_LINKS,
  --                g_DAQ_INN_LINKS => c_DAQ_INN_LINKS, -- : integer;
  --                g_DAQ_MID_LINKS => c_DAQ_MID_LINKS, -- : integer;
  --                g_DAQ_OUT_LINKS => c_DAQ_OUT_LINKS, -- : integer;
  --                g_DAQ_EXT_LINKS => c_DAQ_EXT_LINKS) -- : integer)
  --   port map (i_clk                 => clk                , -- : in  std_logic;
  --             i_rst                 => rst                , -- : in  std_logic;
  --             i_bx                  => bx                 , -- : in  std_logic;
  --             ----------------------------------------------------------------------
  --             i_orid                => (others => '0')    , -- : in  std_logic_vector(1 downto 0);
  --             i_l0a                 => l1a                , -- : in  std_logic;
  --             i_ecr                 => '0'                , -- : in  std_logic;
  --             i_bcid                => bcid               , -- : in  unsigned(11 downto 0);
  --             ----------------------------------------------------------------------
  --             i_ctrl_opening_offset => ctrl_opening_offset, -- : in  unsigned(11 downto 0);
  --             i_ctrl_request_offset => ctrl_request_offset, -- : in  unsigned(11 downto 0);
  --             i_ctrl_closing_offset => ctrl_closing_offset, -- : in  unsigned(11 downto 0);
  --             i_ctrl_window_timeout => ctrl_window_timeout, -- : in  unsigned(11 downto 0);
  --             i_ctrl_busy_threshold => ctrl_busy_threshold, -- : in  unsigned(11 downto 0);
  --             ----------------------------------------------------------------------
  --             i_flags               => (others => '0')    , -- : in  std_logic_vector(6 downto 0);
  --             i_ec                  => '0'                , -- : in  std_logic;
  --             i_sector_id           => (others => '0')    , -- : in  std_logic_vector(3 downto 0);
  --             i_frag_id             => (others => '0')    , -- : in  std_logic_vector(3 downto 0);
  --             ----------------------------------------------------------------------
  --             i_inn_tdc_hits_av     => inn_tdc_hits_av    , -- : in  std_logic_vector_array;
  --             i_mid_tdc_hits_av     => mid_tdc_hits_av    , -- : in  std_logic_vector_array;
  --             i_out_tdc_hits_av     => out_tdc_hits_av    , -- : in  std_logic_vector_array;
  --             i_ext_tdc_hits_av     => ext_tdc_hits_av    , -- : in  std_logic_vector_array;
  --             ----------------------------------------------------------------------
  --             o_daq_stream_data_v   => daq_stream_data_v  , -- : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)(31 downto 0);
  --             o_daq_stream_ctrl_v   => daq_stream_ctrl_v  , -- : out std_logic_vector_array(c_DAQ_LINKS-1 downto 0)( 1 downto 0);
  --             o_daq_stream_wren_v   => daq_stream_wren_v  ); -- : out std_logic_vector(c_DAQ_LINKS-1 downto 0));
  -- 
  process (clk)
  
    file text_file : text open read_mode is "../tb/stimulus.txt";
    variable text_line : line;
    variable ok : boolean;
  
    variable lhc_time_var : integer;
    variable ctrl_opening_offset_var : integer;
    variable ctrl_request_offset_var : integer;
    variable ctrl_closing_offset_var : integer;
    variable ctrl_window_timeout_var : integer;
    variable ctrl_busy_threshold_var : integer;
  
    variable inn_tdc_hits_var        : std_logic_vector(255 downto 0);
    variable mid_tdc_hits_var        : std_logic_vector(255 downto 0);
    variable out_tdc_hits_var        : std_logic_vector(255 downto 0);
    variable ext_tdc_hits_var        : std_logic_vector(255 downto 0);
    
  begin
  
    if rising_edge(clk) then
  
      while not endfile(text_file) loop
  
        readline(text_file, text_line);
  
        -- Skip empty lines and single-line comments
        if text_line.all'length = 0 or text_line.all(1) = '#' then
          next;
        end if;
  
        read(text_line, lhc_time_var, ok);
        read(text_line, ctrl_opening_offset_var, ok);
        read(text_line, ctrl_request_offset_var, ok);
        read(text_line, ctrl_closing_offset_var, ok);
        read(text_line, ctrl_busy_threshold_var, ok);
        
        read(text_line, inn_tdc_hits_var, ok);
        read(text_line, mid_tdc_hits_var, ok);
        read(text_line, out_tdc_hits_var, ok);
        read(text_line, ext_tdc_hits_var, ok);
  
        lhc_time             <= lhc_time_var;
        
        ctrl_opening_offset  <= ctrl_opening_offset_var;
        ctrl_request_offset  <= ctrl_request_offset_var;
        ctrl_closing_offset  <= ctrl_closing_offset_var;
        ctrl_window_timeout  <= ctrl_window_timeout_var;
        ctrl_busy_threshold  <= ctrl_busy_threshold_var;

        inn_tdc_hits         <= inn_tdc_hits_var;
        mid_tdc_hits         <= mid_tdc_hits_var;
        out_tdc_hits         <= out_tdc_hits_var;
        ext_tdc_hits         <= ext_tdc_hits_var;
        
      end loop;
    end if;
  
  end process;
  
end architecture behavioral;
