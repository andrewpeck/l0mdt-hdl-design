library work;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity decoder_framer is
  port(
    clock        : in  std_logic;
    resync_i     : in  std_logic;
    synced_o     : out std_logic;
    data_i       : in  std_logic_vector (15 downto 0);  -- receive 16 bits / bx
    data_i_valid : in  std_logic;                       -- input data valid flag
    data_o       : out std_logic_vector (9 downto 0) := (others => '0');
    err_o        : out std_logic;
    data_o_valid : out std_logic                     := '0'
    );
end decoder_framer;

--------------------------------------------------------------------------------------------------
-- Frame aligner logic, extract 10 bit words from 16 bits/clock
--------------------------------------------------------------------------------------------------
-- Least common multiple of 16 and 10 is 80
-- so, because of the weird 10 bit alignment and 16 bits / bx received, there are 80/16 = 5 different mapping of 16
-- ==> 10 bits, and some of the bits have to be buffered from one clock cycle to the next
--
-- bits[79:0]     01234567890123456789012345678901234567890123456789012345678901234567890123456789
--
-- 40MHz frames   < frame0 15:0  >< frame1 31:16 >< frame2 47:32 >< frame3 63:48 >< frame4 79:64 >
--                0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
--
-- 10 bit words   < word0  >< word1  >< word2  >< word3  >< word4  >< word5  >< word6  >< word7  >
--                01234567890123456789012345678901234567890123456789012345678901234567890123456789
-- tdc_word       < header >< data0  >< data1  >< data2  >< data3  ><idle/err>< idle   >< idle   >
--
-- because of this arrangement we also can extract varying numbers of data words per clock:
--   > frame0 gives us 1 word
--   > frame1 gives us 2 words
--   > frame2 gives us 1 word
--   > frame3 gives us 2 words
--   > frame4 gives us 2 words
--   -------------------------
--   > total = 8 ten-bit words over 5 40MHz clocks


-- Usage: LUT=41, FF=25
architecture behavioral of decoder_framer is

  -- frame parser signals
  type frame_state_t is (FRAME0, FRAME1, FRAME2, FRAME3, FRAME4);
  signal frame_state : frame_state_t := FRAME0;
  signal buf         : std_logic_vector (7 downto 0);
  signal zeroeth     : std_logic     := '0';
  signal first       : std_logic     := '0';
  signal second      : std_logic     := '0';

  signal data_r, data : std_logic_vector (15 downto 0);

  signal synced : boolean := false;

  signal valid      : std_logic;
  signal data_o_int : std_logic_vector (9 downto 0) := (others => '0');

  constant wait_for_slip_max : integer := 383;
  signal wait_for_slip : integer := wait_for_slip_max;

  signal timeout       : boolean := false;
  constant timeout_max : integer := 2*3564*8;
  signal timeout_cnt   : integer := 0;

  signal k_good  : boolean := false;
  signal k_good0 : boolean := false;
  signal k_good1 : boolean := false;
  signal k_good2 : boolean := false;
  signal k_good3 : boolean := false;
  signal k_good4 : boolean := false;

  --function isk (a : std_logic_vector) return std_logic is
  --  constant k3cm1 : std_logic_vector (9 downto 0) := "10" & x"7C";
  --  constant k3cp1 : std_logic_vector (9 downto 0) := "01" & x"83";
  --begin
  --  if (a = k3cm1 or a = k3cp1) then
  --    return '1';
  --  else
  --    return '0';
  --  end if;
  --end function isk;

begin

  synced_o <= '1' when synced else '0';
  k_good <= k_good0 and k_good1 and k_good2 and k_good3 and k_good4;
  err_o  <= '1' when (timeout) or (not synced and wait_for_slip = 0 and valid = '1' and not k_good) else '0';

  -- have a watchdog to make sure we see a comma sequence every so many bxs
  process (clock) is
  begin
    if (rising_edge(clock)) then
      if (k_good) then
        timeout_cnt <= 0;
        timeout     <= false;
      elsif (timeout_cnt < timeout_max) then
        timeout_cnt <= timeout_cnt + 1;
        timeout     <= false;
      else
        timeout_cnt <= 0;
        timeout     <= true;
      end if;
    end if;
  end process;

  process (clock) is
  begin
    if (rising_edge(clock)) then

      if (k_good) then
        synced <= true;
      elsif (timeout or resync_i = '1') then
        synced <= false;
      end if;

      -- only bitslip every so many clocks to make sure we have
      -- time for the feedback to propagate through the system
      if (err_o = '1') then
        wait_for_slip <= wait_for_slip_max;
      elsif (wait_for_slip > 0) then
        wait_for_slip <= wait_for_slip - 1;
      end if;

      -- It takes 2 clocks to transition state
      data_r <= data_i;
      data   <= data_r;

    end if;
  end process;

  zeroeth <= data_i_valid;

  process (clock) is
  begin
    if (rising_edge(clock)) then

      first  <= zeroeth;
      second <= first;

      case frame_state is

        when FRAME0 =>

          -- frame_state

          if (data = x"0e7c" or data = x"f183") then
            k_good0 <= true;
          else
            k_good0 <= false;
          end if;

          if ((k_good0 or synced) and first = '1') then
            frame_state <= FRAME1;
          end if;

          -- word 0
          valid <= '0';
          if (first = '1') then
            buf (5 downto 0) <= data(15 downto 10);
            valid            <= '1';
            data_o_int       <= data(9 downto 0);
          end if;

        when FRAME1 =>

        if (data = x"e7c6" or data = x"1839") then
          k_good1 <= true;
        else
          k_good1 <= false;
        end if;

          -- frame_state
          if (not (k_good0 or synced)) then
            frame_state <= FRAME0;
          elsif (first = '1') then
            frame_state <= FRAME2;
          end if;

          -- word 0
          valid <= '0';
          if (zeroeth = '1') then
            valid                  <= '1';
            buf(1 downto 0)        <= data(15 downto 14);
            data_o_int(9 downto 6) <= data (3 downto 0);
            data_o_int(5 downto 0) <= buf(5 downto 0);
          end if;
          -- word 1
          if (first = '1') then
            valid      <= '1';
            data_o_int <= data(13 downto 4);
          end if;

        when FRAME2 =>

        if (data = x"7c60" or data = x"839f") then
          k_good2 <= true;
        else
          k_good2 <= false;
        end if;

          -- frame_state
          if (not ((k_good0 and k_good1) or synced)) then
            frame_state <= FRAME0;
          elsif (first = '1') then
            frame_state <= FRAME3;
          end if;

          -- word 0
          valid <= '0';
          if (zeroeth = '1') then
            valid                  <= '1';
            buf(7 downto 0)        <= data (15 downto 8);
            data_o_int(9 downto 2) <= data (7 downto 0);
            data_o_int(1 downto 0) <= buf (1 downto 0);
          end if;

        when FRAME3 =>

        if (data = x"c60e" or data = x"39f1") then
          k_good3 <= true;
        else
          k_good3 <= false;
        end if;
          -- frame_state
          if (not ((k_good0 and k_good1 and k_good2) or synced)) then
            frame_state <= FRAME0;
          elsif (first = '1') then
            frame_state <= FRAME4;
          end if;

          -- word 0
          valid <= '0';
          if (zeroeth = '1') then
            valid                  <= '1';
            data_o_int(9 downto 8) <= data (1 downto 0);
            data_o_int(7 downto 0) <= buf(7 downto 0);
          end if;
          -- word 1
          if (first = '1') then
            valid            <= '1';
            data_o_int       <= data (11 downto 2);
            buf (3 downto 0) <= data (15 downto 12);
          end if;

        when FRAME4 =>

        if (data = x"60e7" or data = x"9f18") then
          k_good4 <= true;
        else
          k_good4 <= false;
        end if;

          -- frame_state
          if (not ((k_good0 and k_good1 and k_good2 and k_good3) or synced)) then
            frame_state <= FRAME0;
          elsif (first = '1') then
            frame_state <= FRAME0;
          end if;

          -- word 0
          valid <= '0';
          if (zeroeth = '1') then
            valid                  <= '1';
            data_o_int(9 downto 4) <= data (5 downto 0);
            data_o_int(3 downto 0) <= buf (3 downto 0);
          end if;
          -- word 1
          if (first = '1') then
            valid      <= '1';
            data_o_int <= data (15 downto 6);
          end if;

      end case;

    end if;

  end process;

  data_o       <= (others => '0') when not synced else data_o_int;
  data_o_valid <= '0'             when not synced else valid;

end behavioral;
