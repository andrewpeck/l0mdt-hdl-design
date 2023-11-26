library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_types_pkg.all;

library daq_lib;

entity latency_buffer is
  generic (g_NCHAMBERS         : integer :=   6;
           g_DATA_WIDTH        : integer :=  42;
           g_CHAMBER_FIFO_TYPE : string  := "bram";
           g_STATION_FIFO_TYPE : string  := "ultra";
           g_LATENCY_DELAY     : integer := 100);
  port (i_clk           : in  std_logic;
        i_rst           : in  std_logic;
        ------------------------------------------------------------------
        i_bcid_cntr     : in  unsigned(11 downto 0);
        ------------------------------------------------------------------
        i_payload_array : in  std_logic_vector_array(g_NCHAMBERS-1 downto 0)(g_DATA_WIDTH-1 downto 0);
        ------------------------------------------------------------------
        o_wr_strb       : out std_logic;
        o_payload       : out std_logic_vector(g_DATA_WIDTH-1 downto 0));
end entity latency_buffer;

architecture logic of latency_buffer is
  signal chamber_struct_array : tdcpolmux2tar_art(g_NCHAMBERS-1 downto 0);

  signal delivered_bcid : std_logic_vector(11 downto 0);

  signal ptr : integer range 0 to g_NCHAMBERS-1:= 0;

  signal chamber_fifo_rd_strb_array : std_logic_vector(g_NCHAMBERS-1 downto 0);
  signal chamber_fifo_nempty_array  : std_logic_vector(g_NCHAMBERS-1 downto 0);
  signal chamber_fifo_payload_array : std_logic_vector_array(g_NCHAMBERS-1 downto 0)(g_DATA_WIDTH-1 downto 0);
  
  signal station_fifo_rd_strb : std_logic;
  signal station_fifo_nempty  : std_logic;

  constant DELAY : unsigned(11 downto 0) := to_unsigned(g_LATENCY_DELAY,12);
  
begin

  chamber_struct_array <= convert(i_payload_array, chamber_struct_array);

  GEN_CHAMBER_INPUT_FIFO : for jj in 0 to g_NCHAMBERS-1 generate
  begin

    u_chamber_fifo : entity daq_lib.daq_fifo
      generic map (g_FIFO_DEPTH       => 16, -- : integer;
                   g_FIFO_MEMORY_TYPE => g_CHAMBER_FIFO_TYPE) -- : integer range 0 to 3 := 0)
      port map (i_sys_clk_fast => i_clk                              , -- : in std_logic;
                i_sys_rst      => i_rst                              , -- : in std_logic;
                ---------------------------------------------
                i_src_payload  => i_payload_array(jj)        , -- : in  std_logic_vector;
                i_src_wr_strb  => chamber_struct_array(jj).data_valid, -- : in  std_logic;
                ---------------------------------------------
                i_dst_rd_strb  => chamber_fifo_rd_strb_array(jj),  -- : in  std_logic;
                o_dst_nempty   => chamber_fifo_nempty_array(jj), -- : out std_logic;
                o_dst_payload  => chamber_fifo_payload_array(jj)); -- : out std_logic_vector);

  end generate GEN_CHAMBER_INPUT_FIFO;


  u_station_fifo : entity daq_lib.daq_fifo
    generic map (g_FIFO_DEPTH       => 1024               , -- : integer;
                 g_FIFO_MEMORY_TYPE => g_STATION_FIFO_TYPE) -- : string
    port map (i_sys_clk_fast => i_clk, -- : in std_logic;
              i_sys_rst      => i_rst, -- : in std_logic;
              ---------------------------------------------
              i_src_payload                                        => std_logic_vector(i_bcid_cntr) & chamber_fifo_payload_array(ptr), -- : in  std_logic_vector;
              i_src_wr_strb                                        => chamber_fifo_nempty_array(ptr), -- : in  std_logic;
              ---------------------------------------------
              i_dst_rd_strb                                        => station_fifo_rd_strb,  -- : in  std_logic;
              o_dst_nempty                                         => station_fifo_nempty ,  -- : out std_logic;
              o_dst_payload(g_DATA_WIDTH-1 downto 0)               => o_payload           ,
              o_dst_payload(g_DATA_WIDTH+12-1 downto g_DATA_WIDTH) => delivered_bcid      ); -- : out std_logic_vector);

  process (i_clk)
    function get_next(this: natural range 0 to g_NCHAMBERS-1; nempty_array : std_logic_vector; cntr : natural range 0 to g_NCHAMBERS-2) return natural is
      constant nxt : natural range 0 to g_NCHAMBERS-1 := (this+1) mod g_NCHAMBERS;
    begin
      if nempty_array(this) = '1' or cntr = 0 then
        return this;
      end if;
      return get_next(nxt, nempty_array, cntr-1);
    end function get_next;
    variable nxt : natural range 0 to g_NCHAMBERS-1;
  begin
    if rising_edge(i_clk) then
      nxt := (ptr+1) mod g_NCHAMBERS;
      ptr <= get_next(nxt, chamber_fifo_nempty_array, g_NCHAMBERS-2);
    end if;
  end process;
  

  process (i_clk)
  begin  
    if rising_edge(i_clk) then
      station_fifo_rd_strb <= '0';
      o_wr_strb <= '0';
      if (((i_bcid_cntr >= unsigned(delivered_bcid) and i_bcid_cntr-unsigned(delivered_bcid) > DELAY)
           or (i_bcid_cntr < unsigned(delivered_bcid) and unsigned(delivered_bcid)-i_bcid_cntr > DELAY))
          and station_fifo_nempty = '1') then
        station_fifo_rd_strb <= '1';
        o_wr_strb <= '1';
      eNd if;
    end if;
  end process;

  
end architecture logic;
