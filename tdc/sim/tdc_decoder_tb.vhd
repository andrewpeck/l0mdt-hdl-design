library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

--use std.textio.all;

library ieee;
use ieee.math_real.uniform;
use ieee.math_real.floor;

entity tdc_decoder_tb is
end tdc_decoder_tb;

architecture Behavioral of tdc_decoder_tb is

  constant clk_period : time := 3 ns;
  constant sim_period : time := 40000000 ns;

  signal resync               : std_logic                     := '0';
  signal reset                : std_logic                     := '1';
  signal clock                : std_logic                     := '0';
  signal valid_i              : std_logic;
  signal bitslip              : std_logic;
  signal data_i               : std_logic_vector (15 downto 0);
  signal data_even            : std_logic_vector (7 downto 0);
  signal data_odd             : std_logic_vector (7 downto 0);
  signal data_even_skewed     : std_logic_vector (7 downto 0);
  signal data_odd_skewed      : std_logic_vector (7 downto 0);
  signal tdc_word_o           : std_logic_vector (31 downto 0);
  signal valid_o              : std_logic;
  signal tdc_err_o            : std_logic;
  signal data_8b, data_8b_gen : std_logic_vector (7 downto 0) := x"3C";
  signal KI, KI_gen           : std_logic                     := '1';
  signal data_10b             : std_logic_vector (9 downto 0);
  signal data_10b_int         : std_logic_vector (9 downto 0);
  signal data_10b_valid       : std_logic;
  signal data_gen_valid       : std_logic                     := '0';

  signal syncing : std_logic;

  signal bad_frames_cnt  : integer := 0;
  signal good_frames_cnt : integer := 0;

  ---- Purpose: Increments a std_logic_vector by 1
  --procedure p_INCREMENT_SLV (
  --  signal dword_i : in  std_logic_vector(31 downto 0);
  --  signal byte_o  : out std_logic_vector(7 downto 0)
  --  ) is
  --begin
  --  r_OUT <= std_logic_vector(unsigned(r_IN) + 1);
  --  wait for 1 ns;                      -- Wait is OK here.
  --end p_INCREMENT_SLV;

begin

  --check_sync : process
  --if (reset = '1') then
  --  wait for 5000 ns;
  --  --assert
  --end if;
  --begin
  --end process;



  clk : process
  begin
    wait for clk_period/2.0;
    clock <= '0';
    wait for clk_period/2.0;
    clock <= '1';
  end process;

  process
  begin
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

  res : process
  begin
    wait for 100 ns;
    wait until rising_edge(clock);
    reset <= '0';
  end process;

  ----------------------------------------------------------------------------------------------------
  -- Data
  ----------------------------------------------------------------------------------------------------

  data_gen_proc : process
  begin
    if (reset = '1') then
      wait for 100 ns;
    end if;

    if (syncing = '1') then
      wait until syncing = '0';
    end if;

    wait until rising_edge(data_gen_valid);
    data_8b_gen <= x"3C" after 0.1 ns;
    KI_gen      <= '1'   after 0.1 ns;
    wait until rising_edge(data_gen_valid);
    data_8b_gen <= x"10" after 0.1 ns;
    KI_gen      <= '0'   after 0.1 ns;
    wait until rising_edge(data_gen_valid);
    data_8b_gen <= x"32" after 0.1 ns;
    KI_gen      <= '0'   after 0.1 ns;
    wait until rising_edge(data_gen_valid);
    data_8b_gen <= x"54" after 0.1 ns;
    KI_gen      <= '0'   after 0.1 ns;
    wait until rising_edge(data_gen_valid);
    data_8b_gen <= x"76" after 0.1 ns;
    KI_gen      <= '0'   after 0.1 ns;
    wait until rising_edge(data_gen_valid);
    data_8b_gen <= x"98" after 0.1 ns;
    KI_gen      <= '0'   after 0.1 ns;
    wait until rising_edge(data_gen_valid);
    data_8b_gen <= x"bA" after 0.1 ns;
    KI_gen      <= '0'   after 0.1 ns;
    wait until rising_edge(data_gen_valid);
    data_8b_gen <= x"dc" after 0.1 ns;
    KI_gen      <= '0'   after 0.1 ns;
    wait until rising_edge(data_gen_valid);
    data_8b_gen <= x"fe" after 0.1 ns;
    KI_gen      <= '0'   after 0.1 ns;
  end process;

  data_8b <= data_8b_gen when (syncing = '0') else x"3C";
  KI      <= KI_gen      when (syncing = '0') else '1';

  ----------------------------------------------------------------------------------------------------
  -- 8b10b encoding
  ----------------------------------------------------------------------------------------------------

  enc_8b10b_inst : entity work.enc_8b10b
    port map (
      RESET    => reset,
      SBYTECLK => clock and data_gen_valid,
      AI       => data_8b(0),
      BI       => data_8b(1),
      CI       => data_8b(2),
      DI       => data_8b(3),
      EI       => data_8b(4),
      FI       => data_8b(5),
      GI       => data_8b(6),
      HI       => data_8b(7),
      KI       => KI,
      -- AO, BO, CO, DO, EO, IO, FO, GO, HO, AJO (Least Significant to Most)
      JO       => data_10b_int(9),
      HO       => data_10b_int(8),
      GO       => data_10b_int(7),
      FO       => data_10b_int(6),
      IO       => data_10b_int(5),
      EO       => data_10b_int(4),
      DO       => data_10b_int(3),
      CO       => data_10b_int(2),
      BO       => data_10b_int(1),
      AO       => data_10b_int(0)
      );

  data_10b_valid <= transport data_gen_valid after clk_period;

  latch : process
  begin
    wait until rising_edge(clock);
    if (data_10b_valid = '1') then
      data_10b <= data_10b_int;
    end if;
  end process;

  --data2 : process
  --begin
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "00"& x"3C";
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "00"& x"00";
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "00"& x"00";
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "00"& x"00";
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "00"& x"00";
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "00"& x"00";
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "00"& x"00";
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= "00"& x"00";
  --end process;

  ----------------------------------------------------------------------------------------------------
  -- Encoder Framer
  ----------------------------------------------------------------------------------------------------

  framer2 : entity work.encoder_framer
    port map (
      clock        => clock,
      data_i       => data_10b,
      data_i_valid => data_10b_valid,   -- input data valid flag
      data_o       => data_i,
      data_o_valid => valid_i
      );

  --data2 : process
  --begin
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= x"0000";
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= x"0000";
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= x"c60e";
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= x"60E7";
  --  wait until rising_edge(data_gen_valid);
  --  data_i <= x"0000";
  --  --data_i <= "000011" & "10" & x"7c";
  --end process;
  --valid_i <= transport data_gen_valid after clk_period * 0;

  ----------------------------------------------------------------------------------------------------
  -- Even/odd split
  ----------------------------------------------------------------------------------------------------

  data_odd(0)  <= transport data_i(1)  after clk_period * 0;
  data_odd(1)  <= transport data_i(3)  after clk_period * 0;
  data_odd(2)  <= transport data_i(5)  after clk_period * 0;
  data_odd(3)  <= transport data_i(7)  after clk_period * 0;
  data_odd(4)  <= transport data_i(9)  after clk_period * 0;
  data_odd(5)  <= transport data_i(11) after clk_period * 0;
  data_odd(6)  <= transport data_i(13) after clk_period * 0;
  data_odd(7)  <= transport data_i(15) after clk_period * 0;
  data_even(0) <= transport data_i(0)  after clk_period * 0;
  data_even(1) <= transport data_i(2)  after clk_period * 0;
  data_even(2) <= transport data_i(4)  after clk_period * 0;
  data_even(3) <= transport data_i(6)  after clk_period * 0;
  data_even(4) <= transport data_i(8)  after clk_period * 0;
  data_even(5) <= transport data_i(10) after clk_period * 0;
  data_even(6) <= transport data_i(12) after clk_period * 0;
  data_even(7) <= transport data_i(14) after clk_period * 0;

  -- use alignment buffers to intentionally skew the data
  -- by bitslipping for a random amount of time
  bs : process
    variable seed1 : positive := 4;
    variable seed2 : positive := 4;
    variable x     : real;
    variable y     : time     := 0 ns;
  begin

    -- send k-chars for a while to sync
    syncing <= '1';
    bitslip <= '1';

    wait until rising_edge(clock);
    resync <= '1';
    wait until rising_edge(clock);
    resync <= '0';

    uniform(seed1, seed2, x);
    y       := floor(x*8.0)*clk_period;
    wait for y;
    wait until rising_edge(clock);
    bitslip <= '0';
    wait for 20 us;

    -- send data, wait for a valid
    syncing <= '0';
    wait for 100 us;
    wait until rising_edge(valid_o) for 1 us;
    assert valid_o = '1'report "err, valid=0";

  end process;

  process
  begin
    wait until rising_edge(valid_o);
    assert (tdc_word_o = x"76543210" or tdc_word_o = x"FEDCBA98") report "err, data=" &
      to_hstring(tdc_word_o) severity error;
    if (tdc_word_o = x"76543210" or tdc_word_o = x"FEDCBA98") then
      good_frames_cnt <= good_frames_cnt + 1;
    else
      bad_frames_cnt <= bad_frames_cnt + 1;
    end if;
  end process;

  process
  begin
    wait for sim_period;
    std.env.finish;
  end process;

  process
  begin
    wait for sim_period/10;
    report integer'image(integer(floor((100.0 * real(now / ns) / (real (sim_period / ns)))))) & "% complete";
    report integer'image(bad_frames_cnt) & " bad of " & integer'image(bad_frames_cnt + good_frames_cnt) & " frames";
  end process;

  alignment_buffer_even : entity work.alignment_buffer(parallel)
    port map (
      clock     => clock,
      bitslip_i => bitslip,
      data_i    => data_even,
      valid_i   => valid_i,
      valid_o   => open,
      data_o    => data_even_skewed
      );
  alignment_buffer_odd : entity work.alignment_buffer(parallel)
    port map (
      clock     => clock,
      bitslip_i => bitslip,
      data_i    => data_odd,
      valid_i   => valid_i,
      valid_o   => open,
      data_o    => data_odd_skewed
      );

  tdc_decoder_inst : entity work.tdc_decoder
    port map (
      reset       => '0',
      resync_i    => resync,
      clock       => clock,
      valid_i     => valid_i,
      data_even   => data_even_skewed,
      data_odd    => data_odd_skewed,
      tdc_word_o  => tdc_word_o,
      valid_o     => valid_o,
      read_done_i => valid_o,
      tdc_err_o   => tdc_err_o
      );

end Behavioral;
