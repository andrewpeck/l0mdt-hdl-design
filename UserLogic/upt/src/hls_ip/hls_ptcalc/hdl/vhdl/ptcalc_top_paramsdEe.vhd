-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ptcalc_top_paramsdEe_rom is
    generic(
             DWIDTH     : integer := 16;
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


architecture rtl of ptcalc_top_paramsdEe_rom is

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0);
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0);
signal mem : mem_array := (
    0 => "0000101001010011", 1 => "1010101111010000", 2 => "0000101001100100",
    3 => "1010100101000101", 4 => "0000101001011000", 5 => "1010100011001010",
    6 => "0000101001001111", 7 => "1010100011101010", 8 => "0000101111110110",
    9 => "1010010000110001", 10 => "0000101010100001", 11 => "1010101100000011",
    12 => "0000101010010110", 13 => "1010100101101000", 14 => "0000101011011011",
    15 => "1010111010000101", 16 => "0000101011010000", 17 => "1011000010101010",
    18 => "0000101010110111", 19 => "1010110110010100", 20 => "0000101100001010",
    21 => "1011111101001010", 22 => "0000101011100100", 23 => "1011111011111101",
    24 => "0000101011100110", 25 => "1011110011101111", 26 => "0000101010111110",
    27 => "1100000001011011", 28 => "0000101010001011", 29 => "1011110101111101",
    30 => "0001010000010001", 31 => "1011000011000000", 32 => "0001010000100101",
    33 => "1001101001111100", 34 => "0001010100100010", 35 => "1010110100111001",
    36 => "0001011001000101", 37 => "1011010011000101", 38 => "0001010101000101",
    39 => "1001111010001000", 40 => "0001011010111001", 41 => "1011100010000111",
    42 => "0001011000000011", 43 => "1011101100000100", 44 => "0001011010110111",
    45 => "1010011111010000", 46 => "0001010100100000", 47 => "1100011000110001",
    48 => "0001010101011100", 49 => "1011001001111001", 50 => "0001001101100100",
    51 => "1011111111101111", 52 => "0001010111011000", 53 => "1100100111001011",
    54 => "0001011110000001", 55 => "1101010011010010", 56 => "0001011111101101",
    57 => "1110010010000000", 58 => "0001010111100011", 59 => "1110000101110101",
    60 => "0000100010111001", 61 => "1010100010011010", 62 => "0000100011000100",
    63 => "1010011010100110", 64 => "0000100100000100", 65 => "1010111101100110",
    66 => "0000100011101000", 67 => "1010100110000110", 68 => "0000100101111000",
    69 => "1010110101101111", 70 => "0000100110010001", 71 => "1011011010010101",
    72 => "0000100001111000", 73 => "1010010000000100", 74 => "0000100010110001",
    75 => "1011001111110101", 76 => "0000100011000000", 77 => "1010101000000111",
    78 => "0000100011011001", 79 => "1011100110100101", 80 => "0000100000111101",
    81 => "1011001010001001", 82 => "0000100011111101", 83 => "1100000001011011",
    84 => "0000100010111001", 85 => "1100000001101001" );


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

entity ptcalc_top_paramsdEe is
    generic (
        DataWidth : INTEGER := 16;
        AddressRange : INTEGER := 86;
        AddressWidth : INTEGER := 7);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of ptcalc_top_paramsdEe is
    component ptcalc_top_paramsdEe_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    ptcalc_top_paramsdEe_rom_U :  component ptcalc_top_paramsdEe_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;
