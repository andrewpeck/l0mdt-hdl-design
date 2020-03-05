-- THIS SYNCHRONIZER IS ONLY DESIGNED TO WORK FOR TRANSFERRING TO AND FROM
-- SYNCHRONOUS CLOCKS!!!!
--
-- It is just used for frequency shifting on clocks from the same mmcm!!
--
-- Do not use for anything else!!
--
-- You've been warned!!

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sync_cdc is
  generic (
    WIDTH    : integer := 1; -- set to 1 to introduce 2 clocks of latency and
                             -- make sure to set a datapath only max_delay of
                             -- less than 2 clocks to the data_o ffs
    N_STAGES : integer := 1
    );
  port (
    clk_i   : in  std_logic;
    valid_i : in  std_logic;
    data_i  : in  std_logic_vector (WIDTH-1 downto 0);
    valid_o : out std_logic;
    data_o  : out std_logic_vector (WIDTH-1 downto 0)
    );
end sync_cdc;

architecture sync_cdc_arch of sync_cdc is

  signal s_resync : std_logic_vector(N_STAGES downto 0) := (others => '0');

  attribute ASYNC_REG                 : string;
  attribute ASYNC_REG of s_resync     : signal is "TRUE";
  attribute SHREG_EXTRACT             : string;
  attribute SHREG_EXTRACT of s_resync : signal is "NO";


begin

  s_resync(0) <= valid_i;

  -- https://forums.xilinx.com/t5/Timing-Analysis/Setting-ASYNC-REG-in-VHDL-for-Two-Flop-Synchronizer/td-p/700175/page/2

  sync_gen : if (N_STAGES > 0) generate

    gen_ff : for i in 0 to N_STAGES-1 generate
    begin
      process (clk_i)
      begin
        if (rising_edge(clk_i)) then
          s_resync(i+1) <= s_resync(i);
        end if;
      end process;
    end generate gen_ff;

  end generate sync_gen;

  -- put a dummy generate just to apply a label that I can pick out of the
  -- hierarchy later
  gen_cdc_bus_inst : if (true) generate
    process (clk_i)
    begin

      if (rising_edge(clk_i) and s_resync(N_STAGES) = '1') then
        data_o <= data_i;
      end if;

      if (rising_edge(clk_i)) then
        valid_o <= s_resync(N_STAGES);
      end if;

    end process;
  end generate;

end sync_cdc_arch;
