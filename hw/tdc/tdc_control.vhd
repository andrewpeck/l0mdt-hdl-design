library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;

entity encoded_control is
  port(
    clk_i : in std_logic;
    dav_i : in std_logic;
    rst_i : in std_logic;

    trg_i : in std_logic;
    bcr_i : in std_logic;
    ecr_i : in std_logic;
    gsr_i : in std_logic;

    enc_o : out std_logic

    );
end encoded_control;

architecture behavioral of encoded_control is
  signal triad : std_logic_vector(2 downto 0);
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

  process (clk_i) is
  begin
    if (rising_edge(clk_i)) then
      if (dav_i='1') then
        if (rst_i='1') then
          triad <= "000";
        else
          if(bcr_i = '1') then
            triad <= "110";
          elsif (trg_i='1') then
            triad <= "100";
          elsif (ecr_i='1') then
            triad <= "111";
          elsif (gsr_i='1') then
            triad <= "101";
          else
            triad <= triad(1 downto 0) & '0';
          end if;
        end if;
      end if;
    end if;
  end process;

  enc_o <= triad(2);

end behavioral;
