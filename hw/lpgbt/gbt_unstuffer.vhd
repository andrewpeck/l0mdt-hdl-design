library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

entity gbt_unstuffer is
  generic (
    g_HEADER : std_logic_vector := x"7E"
    );
  port(
    clock_i    : in std_logic;          -- 320 MHz please
    clock_en_i : in std_logic;          -- 40MHz clock_en
    reset_i    : in std_logic;
    ic         : in std_logic_vector(1 downto 0);

    frame_o  : out std_logic_vector (7 downto 0);
    valid_o  : out std_logic;
    header_o : out std_logic
    );
end gbt_unstuffer;

architecture Behavioral of gbt_unstuffer is

  --signal waiting_for_trailer : std_logic := '0';

  signal ic_buf    : std_logic_vector (1 downto 0) := "00";
  signal ic_first  : std_logic                     := '0';
  signal ic_second : std_logic                     := '0';
  signal d         : std_logic;

  signal count_ones : integer range 0 to 8;

  signal en_shift     : std_logic;
  signal rx_sr        : std_logic_vector (7 downto 0);
  signal unstuffed_sr : std_logic_vector (7 downto 0);
  signal dav_sr       : std_logic_vector (7 downto 0);
  signal header_dly   : std_logic_vector (7 downto 0);
  signal dav          : std_logic;
  signal header       : std_logic;

  signal header_in_rxsr : std_logic;
  signal receiving_data : std_logic;

  signal clk_en80 : std_logic;

begin

  --------------------------------------------------------------------------------
  -- 80 MHz enable, goes high 1 of 4 clocks, synced to 40MHz enable
  --------------------------------------------------------------------------------

  process (clock_i)
    variable counter : integer range 0 to 8;
  begin
    if (rising_edge(clock_i)) then

      if clock_en_i = '1' then
        counter  := 1;
        clk_en80 <= '0';
      else
        counter := counter + 1;

        if counter = 8 then
          counter := 0;
        end if;

        clk_en80 <= '0';
        if counter = 0 or counter = 4 then
          clk_en80 <= '1';
        end if;
      end if;

    end if;
  end process;

  --------------------------------------------------------------------------------
  -- multiplex the high and lo bits at 80mhz
  --------------------------------------------------------------------------------

  process (clock_i)
  begin

    if (rising_edge(clock_i)) then

      if (reset_i = '1') then
        ic_buf <= "00";
      elsif (clock_en_i = '1') then
        ic_buf <= ic;
      end if;

      if (reset_i = '1') then
        d <= '0';
      elsif (clk_en80 = '1') then
        if (clock_en_i = '1') then
          d <= ic_buf(1);
        else
          d <= ic_buf(0);
        end if;
      end if;
    end if;

  end process;

  --------------------------------------------------------------------------------
  -- rx_sr
  --------------------------------------------------------------------------------

  -- push the incoming (stuffed) bits into a 8 bit shift register

  process (clock_i)
  begin
    if (clk_en80 = '1' and rising_edge(clock_i)) then
      if (reset_i = '1') then
        rx_sr <= (others => '0');
      else
        rx_sr <= d & rx_sr(7 downto 1);
      end if;
    end if;
  end process;

  --------------------------------------------------------------------------------
  -- unstuffed_sr
  --------------------------------------------------------------------------------

  -- shift a new bit into the "unstuffed" shift register when it is enabled
  -- by the unstuffing sm

  process (clock_i)
  begin
    if (clk_en80 = '1' and rising_edge(clock_i)) then
      if (reset_i = '1') then
        unstuffed_sr <= (others => '0');
      elsif (en_shift = '1') then
        unstuffed_sr <= rx_sr(0) & unstuffed_sr(7 downto 1);
      end if;
    end if;
  end process;

  process (clock_i)
  begin
    if (clk_en80 = '1' and rising_edge(clock_i)) then

      if count_ones = 8 or reset_i = '1' then
        count_ones <= 0;
      elsif (rx_sr(0) = '1') then
        count_ones <= count_ones + 1;
      else
        count_ones <= 0;
      end if;

    end if;
  end process;

  header_in_rxsr <= '1' when (rx_sr = g_HEADER) else '0';

  en_shift <= '0' when header_in_rxsr = '0' and (count_ones = 5 and rx_sr(0) = '0')  -- received 5 ones then a zero
              else '1';

  --------------------------------------------------------------------------------
  -- Frame alignment
  --------------------------------------------------------------------------------

  process (clock_i)
  begin
    if (clk_en80 = '1' and rising_edge(clock_i)) then
      if (reset_i = '1') then
        dav_sr <= (others => '0');
      elsif (header_in_rxsr = '1') then
        dav_sr <= "10000000";
      elsif (en_shift = '1') then
        dav_sr <= dav_sr(0) & dav_sr(7 downto 1);
      end if;
    end if;
  end process;

  process (clock_i)
  begin
    if (clk_en80 = '1' and rising_edge(clock_i)) then
      if (reset_i = '1') then
        header_dly <= (others => '0');
      elsif (en_shift = '1') then
        header_dly <= header_in_rxsr & header_dly(7 downto 1);
      end if;
    end if;
  end process;

  -- header_sr_dly_inst : entity SRL16E
  -- port map (
  --              CLK => clock_i,
  --              CE => clk_en80,
  --              D => header_in_rxsr,
  --              Q => header_dly,
  --              A0 => '1',
  --              A1 => '1',
  --              A2 => '1',
  --              A3 => '0'
  -- );


  process (clock_i)
  begin
    if (clk_en80 = '1' and rising_edge(clock_i)) then
      if (reset_i = '1') then
        receiving_data <= '0';
      elsif (receiving_data = '0' and header = '1') then
        receiving_data <= '1';
      elsif (receiving_data = '1' and header = '1') then
        receiving_data <= '0';
      end if;
    end if;
  end process;

  header <= '1' when header_dly(0) = '1'and en_shift = '1' else '0';
  dav    <= clk_en80 and (header or (receiving_data and dav_sr(0) and en_shift));

  process (clock_i)
  begin
    if (rising_edge(clock_i)) then
      if (reset_i = '1') then
        frame_o <= (others => '0');
      elsif (dav = '1') then
        frame_o <= unstuffed_sr;
      end if;

    end if;
  end process;

  process (clock_i)
  begin
    if (rising_edge(clock_i)) then
      valid_o  <= dav;
      header_o <= header;
    end if;
  end process;

end Behavioral;
