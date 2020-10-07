-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity ptcalc_top_params_a_3s_table_V_rom is 
    generic(
             DWIDTH     : integer := 24; 
             AWIDTH     : integer := 6; 
             MEM_SIZE    : integer := 60
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of ptcalc_top_params_a_3s_table_V_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "001011110101001010001111", 1 => "111111111011001010111101", 
    2 => "001011111111011111111010", 3 => "111111111010100100001000", 
    4 => "001100001010111000001000", 5 => "111111111010101100101110", 
    6 => "001011111101001111000100", 7 => "111111111011001000100010", 
    8 => "001011101110101011100111", 9 => "111111111010010100100010", 
    10 => "001100001110000011100101", 11 => "111111111011000000101110", 
    12 => "001100010011000100100101", 13 => "111111111010111100011011", 
    14 => "001101001011011110110011", 15 => "111111111010101001010001", 
    16 => "001100110100101101001011", 17 => "111111111011011000010010", 
    18 => "001100111011110100001000", 19 => "111111111011011000000100", 
    20 => "010000011010100000001101", 21 => "111111111101000001111011", 
    22 => "001101010000010111000111", 23 => "111111111011001010011011", 
    24 => "001101110101001100001001", 25 => "111111111010010010001111", 
    26 => "001110100111011111010010", 27 => "111111111011111100000101", 
    28 => "001110010110110110100101", 29 => "111111111011101110001001", 
    30 => "001111000100110101101001", 31 => "111111111100100001000001", 
    32 => "001111010001001101101101", 33 => "111111111010011100100010", 
    34 => "001111011111001110010110", 35 => "111111111010110000111111", 
    36 => "001111111001111111101001", 37 => "111111111100111111000000", 
    38 => "010000001110010011100101", 39 => "111111111100011100010010", 
    40 => "010001011111000110100011", 41 => "111111111110000100110000", 
    42 => "010000100000101111111011", 43 => "111111111101001100101111", 
    44 => "010011101111111100000011", 45 => "111111111011111110101011", 
    46 => "010001000000010110100111", 47 => "111111111101001011100111", 
    48 => "010001001101010110100011", 49 => "111111111010101011101011", 
    50 => "010001001011011010111000", 51 => "111111111101011011111011", 
    52 => "010001001110010010001100", 53 => "111111111101011110001010", 
    54 => "010001100101110100110111", 55 => "111111111100111011110001", 
    56 => "010000101110000110111111", 57 => "111111111101001000100110", 
    58 => "010001101000000001000001", 59 => "111111111100110111111110" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity ptcalc_top_params_a_3s_table_V is
    generic (
        DataWidth : INTEGER := 24;
        AddressRange : INTEGER := 60;
        AddressWidth : INTEGER := 6);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of ptcalc_top_params_a_3s_table_V is
    component ptcalc_top_params_a_3s_table_V_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    ptcalc_top_params_a_3s_table_V_rom_U :  component ptcalc_top_params_a_3s_table_V_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


