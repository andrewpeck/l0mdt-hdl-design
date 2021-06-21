-- A parameterized, inferable, true dual-port, dual-clock block RAM in VHDL.
 
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
 
entity bram_tdp is
generic (
       ADDR     : integer := 8;
       DATA     : integer := 64;
       ram_type : string  := "distributed"
);
port (
    -- Port A
    a_clk   : in  std_logic;
    a_wr    : in  std_logic;
    a_addr  : in  std_logic_vector(ADDR-1 downto 0);
    a_din   : in  std_logic_vector(DATA-1 downto 0);
--    a_dout  : out std_logic_vector(StubWidth-1 downto 0);
    -- Port B
--    b_wr    : in  std_logic;
    b_addr  : in  std_logic_vector(ADDR-1 downto 0);
--    b_din   : in  std_logic_vector(StubWidth-1 downto 0);
    b_dout  : out std_logic_vector(DATA-1 downto 0)
);
end bram_tdp;

 
architecture rtl of bram_tdp is
    -- Shared memory
    type mem_type is array ( (2**ADDR)-1 downto 0 ) of std_logic_vector(DATA-1 downto 0);
    
begin
 
-- Port A
process(a_clk)

    variable mem : mem_type := (others => (others => '0'));
    attribute ram_style: string;
    attribute ram_style of mem : variable is ram_type;
    variable last_addr : std_logic_vector(ADDR-1 downto 0) := (others => '1');

begin
    if rising_edge(clk) then
        if(a_wr='1' and last_addr /= conv_integer(a_addr)) then
            mem(conv_integer(a_addr)) := a_din;
        end if;
        b_dout <= mem(conv_integer(b_addr));
    end if;
end process;
 
end rtl;