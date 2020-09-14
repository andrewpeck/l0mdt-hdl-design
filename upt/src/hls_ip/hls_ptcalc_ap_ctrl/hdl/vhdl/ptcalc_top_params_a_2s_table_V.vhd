-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity ptcalc_top_params_a_2s_table_V_rom is 
    generic(
             DWIDTH     : integer := 18; 
             AWIDTH     : integer := 7; 
             MEM_SIZE    : integer := 86
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of ptcalc_top_params_a_2s_table_V_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "000010100101001110", 1 => "101010111101000000", 
    2 => "000010100110010000", 3 => "101010010100010100", 
    4 => "000010100101100000", 5 => "101010001100101010", 
    6 => "000010100100111100", 7 => "101010001110101001", 
    8 => "000010111111011000", 9 => "101001000011000101", 
    10 => "000010101010000110", 11 => "101010110000001100", 
    12 => "000010101001011011", 13 => "101010010110100011", 
    14 => "000010101101101101", 15 => "101011101000010101", 
    16 => "000010101101000001", 17 => "101100001010101011", 
    18 => "000010101011011111", 19 => "101011011001010001", 
    20 => "000010110000101010", 21 => "101111110100101000", 
    22 => "000010101110010011", 23 => "101111101111110111", 
    24 => "000010101110011001", 25 => "101111001110111111", 
    26 => "000010101011111010", 27 => "110000000101101111", 
    28 => "000010101000101101", 29 => "101111010111110111", 
    30 => "000101000001000100", 31 => "101100001100000011", 
    32 => "000101000010010101", 33 => "100110100111110010", 
    34 => "000101010010001001", 35 => "101011010011100101", 
    36 => "000101100100010100", 37 => "101101001100010100", 
    38 => "000101010100010110", 39 => "100111101000100001", 
    40 => "000101101011100111", 41 => "101110001000011110", 
    42 => "000101100000001100", 43 => "101110110000010011", 
    44 => "000101101011011110", 45 => "101001111101000010", 
    46 => "000101010010000010", 47 => "110001100011000101", 
    48 => "000101010101110011", 49 => "101100100111100111", 
    50 => "000100110110010000", 51 => "101111111110111100", 
    52 => "000101011101100000", 53 => "110010011100101100", 
    54 => "000101111000000100", 55 => "110101001101001001", 
    56 => "000101111110110110", 57 => "111001001000000000", 
    58 => "000101011110001110", 59 => "111000010111010110", 
    60 => "000010001011100110", 61 => "101010001001101011", 
    62 => "000010001100010001", 63 => "101001101010011010", 
    64 => "000010010000010011", 65 => "101011110110011001", 
    66 => "000010001110100010", 67 => "101010011000011010", 
    68 => "000010010111100011", 69 => "101011010110111111", 
    70 => "000010011001000100", 71 => "101101101001010101", 
    72 => "000010000111100010", 73 => "101001000000010001", 
    74 => "000010001011000110", 75 => "101100111111010101", 
    76 => "000010001100000001", 77 => "101010100000011111", 
    78 => "000010001101100110", 79 => "101110011010010111", 
    80 => "000010000011110101", 81 => "101100101000100100", 
    82 => "000010001111110100", 83 => "110000000101101100", 
    84 => "000010001011100101", 85 => "110000000110100100" );


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

entity ptcalc_top_params_a_2s_table_V is
    generic (
        DataWidth : INTEGER := 18;
        AddressRange : INTEGER := 86;
        AddressWidth : INTEGER := 7);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of ptcalc_top_params_a_2s_table_V is
    component ptcalc_top_params_a_2s_table_V_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    ptcalc_top_params_a_2s_table_V_rom_U :  component ptcalc_top_params_a_2s_table_V_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


