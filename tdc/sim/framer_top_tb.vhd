library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fifo is
  generic (
    g_WIDTH : natural := 10;
    g_DEPTH : integer := 4
    );
  port (
    i_clk     : in  std_logic;
    i_wr_en   : in  std_logic;
    i_wr_data : in  std_logic_vector(g_WIDTH-1 downto 0);
    i_rd_en   : in  std_logic;
    o_rd_data : out std_logic_vector(g_WIDTH-1 downto 0)
    );
end fifo;

architecture rtl of fifo is

  type t_FIFO_DATA is array (0 to g_DEPTH-1) of std_logic_vector(g_WIDTH-1 downto 0);
  signal r_FIFO_DATA : t_FIFO_DATA := (others => (others => '0'));

  signal r_WR_INDEX : integer range 0 to g_DEPTH-1 := 0;
  signal r_RD_INDEX : integer range 0 to g_DEPTH-1 := 0;

begin

  process (i_clk) is
  begin
    if rising_edge(i_clk) then

      -- Keeps track of the write index (and controls roll-over)
      if (i_wr_en = '1') then
        if r_WR_INDEX = g_DEPTH-1 then
          r_WR_INDEX <= 0;
        else
          r_WR_INDEX <= r_WR_INDEX + 1;
        end if;
      end if;

      -- Keeps track of the read index (and controls roll-over)
      if (i_rd_en = '1') then
        if r_RD_INDEX = g_DEPTH-1 then
          r_RD_INDEX <= 0;
        else
          r_RD_INDEX <= r_RD_INDEX + 1;
        end if;
      end if;

      -- Registers the input data when there is a write
      if i_wr_en = '1' then
        r_FIFO_DATA(r_WR_INDEX) <= i_wr_data;
      end if;

    end if;  -- sync reset
  end process;

  o_rd_data <= r_FIFO_DATA(r_RD_INDEX);

end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ieee;
use ieee.math_real.uniform;
use ieee.math_real.floor;


entity framer_top_tb is
end framer_top_tb;

architecture test of framer_top_tb is

  constant clk_period : time := 3.0 ns;
  constant sim_period : time := 40000000 ns;

  signal reset : std_logic := '1';

  signal sent_frames_cnt : integer := 0;

  signal bad_frames_cnt  : integer := 0;
  signal good_frames_cnt : integer := 0;

  signal slip : std_logic := '0';

  signal clock          : std_logic                      := '1';
  signal data_i         : std_logic_vector (9 downto 0)  := (others => '0');
  signal data_fifo      : std_logic_vector (9 downto 0)  := (others => '0');
  signal data_expect    : std_logic_vector (9 downto 0)  := (others => '0');
  signal data_gen_valid : std_logic                      := '0';
  signal data_i_valid   : std_logic                      := '0';
  signal data_dly       : std_logic_vector (15 downto 0)  := (others => '0');
  signal data_m         : std_logic_vector (15 downto 0) := (others => '0');
  signal data_m_valid   : std_logic                      := '0';
  signal data_o         : std_logic_vector(9 downto 0);
  signal data_o_valid   : std_logic                      := '0';

  signal syncing       : std_logic := '1';
  signal sync_good_cnt : integer   := 0;

  signal match : std_logic := '1';
  signal err   : std_logic := '0';
  signal err_o : std_logic := '0';

  signal slip_err_cnt : integer := 0;

begin

  u_data_fifo : entity work.fifo
    generic map (
      g_WIDTH => 10,
      g_DEPTH => 8
      )
    port map (
      i_clk     => clock,
      i_wr_en   => data_i_valid,
      i_wr_data => data_i,
      i_rd_en   => data_o_valid,
      o_rd_data => data_expect
      );

  process (reset, data_m)
    variable seed1 : positive := 1;
    variable seed2 : positive := 1;
    variable x     : real;
    variable y     : time := 0 ns;
  begin
    if (rising_edge(reset)) then
      uniform(seed1, seed2, x);
      y := 8.0*floor(x * 5.0)*clk_period;
    end if;
    data_dly  <= transport data_m after y;
  end process;

  encoder_framer : entity work.encoder_framer
    port map (
      clock        => clock,
      data_i       => data_i,
      data_i_valid => data_i_valid,     -- input data valid flag
      data_o       => data_m,
      data_o_valid => data_m_valid
      );

  decoder_framer : entity work.decoder_framer
    port map (
      reset        => slip or reset,
      clock        => clock,
      data_i       => data_dly,
      data_i_valid => data_m_valid,     -- input data valid flag
      data_o       => data_o,
      data_o_valid => data_o_valid
      );


  data : process(clock)
  begin
    if rising_edge(clock) then

      if (slip_err_cnt = 1) then
        slip <= '1';
      else
        slip <= '0';
      end if;


      if (err = '0') then
        slip_err_cnt <= 0;
      elsif (slip_err_cnt = 20) then
        slip_err_cnt <= 0;
      else
        slip_err_cnt <= slip_err_cnt + 1;
      end if;
    end if;
  end process;

  --data_proc : process
  --begin
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "1000010000";             -- 0
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "0100001100";             -- 1
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "1101100101";             -- 2
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "1001100001";             -- 3
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "0010111010";             -- 4
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "1110110111";             -- 5
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "0000001111";             -- 6
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "0000000000";             -- 7
  --end process;

  rand : process is
    variable seed1 : positive := 1;
    variable seed2 : positive := 1;
    variable x     : real;
    variable y     : integer;
  begin

    if reset = '1' then
      wait until reset = '0';
    end if;

    wait until rising_edge(data_gen_valid);
    uniform(seed1, seed2, x);
    y               := integer(floor(x * 1024.0));
    data_i          <= std_logic_vector(to_unsigned(y, 10));
    sent_frames_cnt <= sent_frames_cnt + 1;
  end process;

  match <= '0' when (or_reduce(data_expect xor data_o) = '1') else '1';
  err_proc : process
  begin
    wait until falling_edge(clock);
    if (data_o_valid = '1') then
      err   <= not match;
      err_o <= err and not syncing;
      if (syncing = '0') then
        assert err = '0' report "err: " & "0x" & to_hstring(unsigned(data_o)) & " != " & "0x" & to_hstring(unsigned(data_expect)) severity note;
        if (match = '1') then
          good_frames_cnt <= good_frames_cnt + 1;
        else
          bad_frames_cnt <= bad_frames_cnt + 1;
        end if;
      end if;
    end if;
  end process;

  clk : process
  begin
    wait for clk_period/2.0;
    clock <= '0';
    wait for clk_period/2.0;
    clock <= '1';
  end process;

  process
  begin
    wait for sim_period/10;
    report integer'image(integer(floor((100.0 * real(now / ns) / (real (sim_period / ns)))))) & "% complete";
    report integer'image(bad_frames_cnt) & " bad of " & integer'image(bad_frames_cnt + good_frames_cnt) & " frames";
  end process;

  process
  begin

    wait until rising_edge(clock);

    if (reset = '1') then
      syncing       <= '1';
      sync_good_cnt <= 0;
    elsif (syncing = '1') then
      if (err = '1') then
        sync_good_cnt <= 0;
      elsif (sync_good_cnt = 255) then
        syncing <= '0';
      else
        sync_good_cnt <= sync_good_cnt + 1;
      end if;
    end if;

  end process;

  process
  begin
    wait for sim_period;
    --assert sent_frames_cnt = (good_frames_cnt + bad_frames_cnt) report
    --  "err: frame count mismatch sent=" & integer'image(sent_frames_cnt) & " received=" &  integer'image(good_frames_cnt + bad_frames_cnt) severity error;
    std.env.finish;
  end process;

  process
    variable seed1 : positive := 1;
    variable seed2 : positive := 1;
    variable x     : real;
    variable y     : time;
    variable z     : time;
  begin

    uniform(seed1, seed2, x);
    y := ((floor(x * 5000.0))+5000.0) * clk_period;
    z := (floor(x * 32.0)) * clk_period;

    reset <= '0';
    wait for y;
    reset <= '1';
    wait for z;
    reset <= '0';

  end process;

--process
--begin
--  wait until rising_edge(data_o_valid);
--  report "0x" & to_hstring(unsigned(data_o)) & LF;
--end process;

  process
  begin

    if reset = '1' then
      wait until reset = '0';
    end if;

    wait until rising_edge(clock);
    data_i_valid <= '1';
    wait until rising_edge(clock);
    data_i_valid <= '0';
    wait until rising_edge(clock);
    wait until rising_edge(clock);
    wait until rising_edge(clock);
    wait until rising_edge(clock);
    wait until rising_edge(clock);
    wait until rising_edge(clock);

  end process;


  process
  begin
    if reset = '1' then
      wait until reset = '0';
    end if;

    wait until rising_edge(clock);
    data_gen_valid <= '1';
    wait until rising_edge(clock);
    data_gen_valid <= '0';
    wait until rising_edge(clock);
    wait until rising_edge(clock);
    wait until rising_edge(clock);
    wait until rising_edge(clock);
    wait until rising_edge(clock);
    wait until rising_edge(clock);

  end process;


end test;
