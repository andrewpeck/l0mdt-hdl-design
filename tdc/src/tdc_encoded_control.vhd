library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity encoded_control is
  port(
    clk_i : in std_logic;
    dav_i : in std_logic;

    trg_i : in std_logic;
    bcr_i : in std_logic;
    ecr_i : in std_logic;
    gsr_i : in std_logic;

    enc_o : out std_logic

    );
end encoded_control;

architecture behavioral of encoded_control is
  signal triad   : std_logic_vector(2 downto 0) := (others => '0');
  signal busy_sr : std_logic_vector(1 downto 0) := (others => '0');
  signal busy    : std_logic;
begin

  --------------------------------------------------------------------------------
  -- Legacy TDC Endoded Control
  --------------------------------------------------------------------------------
  --
  -- http://atlas.kek.jp/tdc/amt3/AMT3manual_034.pdf
  --
  -- Four basic signals are encoded using three clock periods (Table 1). The simple
  -- coding scheme is restricted to only distribute one command in each period of
  -- three clock periods. A command is signaled with a start bit followed by two bits
  -- determining the command. When using encoded trigger and resets an additional
  -- latency of three clock periods is introduced by the decoding compared to the use
  -- of the direct individual trigger and resets.
  --
  -- Trigger = 3'b100 = 4
  -- Reset   = 3'b101 = 5
  -- BCR     = 3'b110 = 6
  -- ECR     = 3'b111 = 7
  --
  -- Can accept a new ttc input every 3rd clock
  --
  -- TTC commands received during transmission of another are silently dropped
  --
  --            _____   _____   _____   _____   _____   _____   _____
  -- clk_i    __|   |___|   |___|   |___|   |___|   |___|   |___|   |
  --
  --            _________               _________
  -- ttc_i    __|       |_______________|       |__________________
  --
  --                    _________________       ___________________
  -- busy     __________|               |_______|
  --
  -- enc_o    ----------< bit2 >< bit1 >< bit0 >< bit2 >< bit1 >< bit0 >

  busy <= busy_sr(0) or busy_sr(1);

  process (clk_i) is
  begin
    if (rising_edge(clk_i)) then
      if (dav_i = '1') then
        if (busy = '0' and bcr_i = '1') then
          triad   <= "110";
          busy_sr <= "11";
        elsif (busy = '0' and gsr_i = '1') then
          triad   <= "101";
          busy_sr <= "11";
        elsif (busy = '0' and trg_i = '1') then
          triad   <= "100";
          busy_sr <= "11";
        elsif (busy = '0' and ecr_i = '1') then
          triad   <= "111";
          busy_sr <= "11";
        else
          triad   <= triad(1 downto 0) & '0';
          busy_sr <= busy_sr (0) & '0';
        end if;
      end if;  -- dav
    end if;  --clk
  end process;

  enc_o <= triad(2);

end behavioral;
