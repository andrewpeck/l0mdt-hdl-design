library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library xpm;
use xpm.vcomponents.all;

entity daq_fifo is
--------------------------------------------------------------------------------
  generic (g_FIFO_DEPTH       : integer;
           -- auto, block, distributed, ultra
           g_FIFO_MEMORY_TYPE : string := "auto");
  ------------------------------------------------------------------------------
  port (i_sys_clk_fast : in std_logic;
        i_sys_rst      : in std_logic;
        ------------------------------------------------------------------------
        i_src_payload : in  std_logic_vector;
        i_src_wr_strb : in  std_logic;
        ------------------------------------------------------------------------
        i_dst_rd_strb : in  std_logic;
        o_dst_nempty  : out std_logic;
        o_dst_payload : out std_logic_vector);
--------------------------------------------------------------------------------
end entity daq_fifo;

architecture V1 of daq_fifo is

  constant FIFO_READ_DEPTH : integer := (g_FIFO_DEPTH * i_src_payload'length) / o_dst_payload'length;

  constant WRITE_DATA_COUNT_WIDTH : integer := integer(log2(real(g_FIFO_DEPTH)));

  signal empty       : std_logic;
  signal rd_rst_busy : std_logic;
  -- signal wr_count    : std_logic_vector(WRITE_DATA_COUNT_WIDTH-1 downto 0);
  signal wr_rst_busy : std_logic;
  signal rd_en       : std_logic;
  signal wr_en       : std_logic;

  signal empty_d1 : std_logic;

  signal cntr : integer := 0;

begin

  wr_en <= i_src_wr_strb when i_sys_rst = '0' and wr_rst_busy = '0' else '0';

  rd_en <= i_dst_rd_strb when i_sys_rst = '0' and rd_rst_busy = '0' else '0';
  
  -- o_dst_nempty <= '1' when empty = '0' and rd_rst_busy = '0' else '0';
  o_dst_nempty <= '1' when empty = '0' and cntr > 0 else '0';
  
  process (i_sys_clk_fast)
  begin
    if rising_edge(i_sys_clk_fast) then
      if i_sys_rst = '1' then
        cntr <= 0;
      else
        if wr_en = '1' then
          cntr <= cntr + 1;
        elsif rd_en = '1' and cntr > 0 then
          cntr <= cntr - 1;
        end if;
      end if;
    end if;
  end process;

  
  -- o_dst_wr_count(WRITE_DATA_COUNT_WIDTH-1 downto 0) <= wr_count(WRITE_DATA_COUNT_WIDTH-1 downto 0);

  -----------------------------------------
  -- adv
  -- 1000 = 0001 0000 0000 0000
  --           ^            ^
  --           |            |wr_data_count
  --           |valid
  -----------------------------------------

  xpm_fifo_sync_inst : xpm_fifo_sync
    generic map (
      DOUT_RESET_VALUE    => "0",                            -- String
      ECC_MODE            => "no_ecc",                       -- String
      FIFO_MEMORY_TYPE    => g_FIFO_MEMORY_TYPE,             -- String
      FIFO_READ_LATENCY   => 0,                              -- DECIMAL
      FIFO_WRITE_DEPTH    => g_FIFO_DEPTH,                     -- DECIMAL
      FULL_RESET_VALUE    => 0,                              -- DECIMAL
      READ_DATA_WIDTH     => o_dst_payload'length,                -- DECIMAL
      READ_MODE           => "fwft",                         -- String
      SIM_ASSERT_CHK      => 0,                              -- DECIMAL
      USE_ADV_FEATURES    => "1000",                         -- rd counter
      WAKEUP_TIME         => 0,                              -- DECIMAL
      WRITE_DATA_WIDTH    => i_src_payload'length,               -- DECIMAL
      WR_DATA_COUNT_WIDTH => WRITE_DATA_COUNT_WIDTH)         -- DECIMAL
    port map (
      almost_empty  => open,
      almost_full   => open,
      data_valid    => open,
      dbiterr       => open,
      dout          => o_dst_payload,
      empty         => empty,
      full          => open,
      overflow      => open,
      prog_empty    => open,
      prog_full     => open,
      rd_data_count => open,
      rd_rst_busy   => rd_rst_busy,
      sbiterr       => open,
      underflow     => open,
      wr_ack        => open,
      wr_data_count => open,
      wr_rst_busy   => wr_rst_busy,
      din           => i_src_payload,
      injectdbiterr => '0',
      injectsbiterr => '0',
      rd_en         => rd_en,
      rst           => i_sys_rst,
      sleep         => '0',
      wr_clk        => i_sys_clk_fast,
      wr_en         => wr_en);

end architecture V1;
