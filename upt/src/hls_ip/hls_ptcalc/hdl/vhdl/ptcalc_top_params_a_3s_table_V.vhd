-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity ptcalc_top_params_a_3s_table_V_rom is 
    generic(
             DWIDTH     : integer := 26; 
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
    0 => "00101111010100101000111101", 1 => "11111111101100101011110100", 
    2 => "00101111111101111111101000", 3 => "11111111101010010000100000", 
    4 => "00110000101011100000100000", 5 => "11111111101010110010111000", 
    6 => "00101111110100111100010001", 7 => "11111111101100100010001001", 
    8 => "00101110111010101110011111", 9 => "11111111101001010010001010", 
    10 => "00110000111000001110010101", 11 => "11111111101100000010111000", 
    12 => "00110001001100010010010101", 13 => "11111111101011110001101110", 
    14 => "00110100101101111011001101", 15 => "11111111101010100101000100", 
    16 => "00110011010010110100101111", 17 => "11111111101101100001001010", 
    18 => "00110011101111010000100011", 19 => "11111111101101100000010000", 
    20 => "01000001101010000000110101", 21 => "11111111110100000111101101", 
    22 => "00110101000001011100011100", 23 => "11111111101100101001101111", 
    24 => "00110111010100110000100110", 25 => "11111111101001001000111101", 
    26 => "00111010011101111101001000", 27 => "11111111101111110000010100", 
    28 => "00111001011011011010010101", 29 => "11111111101110111000100100", 
    30 => "00111100010011010110100101", 31 => "11111111110010000100000110", 
    32 => "00111101000100110110110100", 33 => "11111111101001110010001000", 
    34 => "00111101111100111001011010", 35 => "11111111101011000011111100", 
    36 => "00111111100111111110100111", 37 => "11111111110011111100000011", 
    38 => "01000000111001001110010100", 39 => "11111111110001110001001011", 
    40 => "01000101111100011010001111", 41 => "11111111111000010011000000", 
    42 => "01000010000010111111101101", 43 => "11111111110100110010111100", 
    44 => "01001110111111110000001111", 45 => "11111111101111111010101110", 
    46 => "01000100000001011010011100", 47 => "11111111110100101110011110", 
    48 => "01000100110101011010001110", 49 => "11111111101010101110101111", 
    50 => "01000100101101101011100001", 51 => "11111111110101101111101110", 
    52 => "01000100111001001000110010", 53 => "11111111110101111000101000", 
    54 => "01000110010111010011011110", 55 => "11111111110011101111000110", 
    56 => "01000010111000011011111100", 57 => "11111111110100100010011001", 
    58 => "01000110100000000100000100", 59 => "11111111110011011111111011" );


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
        DataWidth : INTEGER := 26;
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


