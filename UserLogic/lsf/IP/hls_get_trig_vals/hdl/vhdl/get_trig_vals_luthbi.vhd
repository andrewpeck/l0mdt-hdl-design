-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity get_trig_vals_luthbi_rom is
    generic(
             DWIDTH     : integer := 36;
             AWIDTH     : integer := 8;
             MEM_SIZE    : integer := 197
    );
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0);
          ce0       : in std_logic;
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          addr1      : in std_logic_vector(AWIDTH-1 downto 0);
          ce1       : in std_logic;
          q1         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    );
end entity;


architecture rtl of get_trig_vals_luthbi_rom is

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0);
signal addr1_tmp : std_logic_vector(AWIDTH-1 downto 0);
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0);
signal mem : mem_array := (
    0 => "111111001101001010100000000000101000",
    1 => "111111011101100010100000000000010010",
    2 => "111111101101111001100000000000000101",
    3 => "111111111110010001100000000000000000",
    4 => "000000001110101001100000000000000011",
    5 => "000000011111000001100000000000001111",
    6 => "000000101111011001100000000000100011",
    7 => "000000111111110001100000000000111111",
    8 => "000001010000001000100000000001100100",
    9 => "000001100000011111100000000010010001",
    10 => "000001110000110110100000000011000111",
    11 => "000010000001001100100000000100000101",
    12 => "000010010001100010100000000101001011",
    13 => "000010100001110111100000000110011010",
    14 => "000010110010001011100000000111110001",
    15 => "000011000010011111100000001001010000",
    16 => "000011010010110001100000001010111000",
    17 => "000011100011000011100000001100101000",
    18 => "000011110011010101100000001110100000",
    19 => "000100000011100101100000010000100001",
    20 => "000100010011110100100000010010101010",
    21 => "000100100100000001100000010100111011",
    22 => "000100110100001110100000010111010100",
    23 => "000101000100011010100000011001110110",
    24 => "000101010100100100100000011100100000",
    25 => "000101100100101100100000011111010011",
    26 => "000101110100110100100000100010001110",
    27 => "000110000100111001100000100101010000",
    28 => "000110010100111101100000101000011100",
    29 => "000110100101000000100000101011101111",
    30 => "000110110101000001100000101111001010",
    31 => "000111000101000000100000110010101110",
    32 => "000111010100111101100000110110011010",
    33 => "000111100100111000100000111010001110",
    34 => "000111110100110001100000111110001010",
    35 => "001000000100101000100001000010001111",
    36 => "001000010100011101100001000110011011",
    37 => "001000100100010000100001001010110000",
    38 => "001000110100000001100001001111001100",
    39 => "001001000011101111100001010011110001",
    40 => "001001010011011011100001011000011101",
    41 => "001001100011000101100001011101010010",
    42 => "001001110010101100100001100010001111",
    43 => "001010000010010000100001100111010100",
    44 => "001010010001110010100001101100100000",
    45 => "001010100001010001100001110001110101",
    46 => "001010110000101101100001110111010001",
    47 => "001011000000000111100001111100110110",
    48 => "001011001111011101100010000010100010",
    49 => "001011011110110001100010001000010110",
    50 => "001011101110000010100010001110010010",
    51 => "001011111101010000100010010100010101",
    52 => "001100001100011010100010011010100001",
    53 => "001100011011100001100010100000110100",
    54 => "001100101010100101100010100111001111",
    55 => "001100111001100110100010101101110010",
    56 => "001101001000100100100010110100011100",
    57 => "001101010111011110100010111011001110",
    58 => "001101100110010100100011000010001000",
    59 => "001101110101000111100011001001001001",
    60 => "001110000011110110100011010000010001",
    61 => "001110010010100010100011010111100010",
    62 => "001110100001001001100011011110111001",
    63 => "001110101111101101100011100110011001",
    64 => "001110111110001110100011101101111111",
    65 => "001111001100101010100011110101101101",
    66 => "001111011011000010100011111101100011",
    67 => "001111101001010110100100000101011111",
    68 => "001111110111100111100100001101100011",
    69 => "010000000101110010100100010101101111",
    70 => "010000010011111010100100011110000001",
    71 => "010000100001111110100100100110011011",
    72 => "010000101111111101100100101110111100",
    73 => "010000111101111000100100110111100100",
    74 => "010001001011101110100101000000010011",
    75 => "010001011001100000100101001001001010",
    76 => "010001100111001101100101010010000111",
    77 => "010001110100110110100101011011001011",
    78 => "010010000010011010100101100100010111",
    79 => "010010001111111001100101101101101001",
    80 => "010010011101010100100101110111000010",
    81 => "010010101010101001100110000000100010",
    82 => "010010110111111010100110001010001001",
    83 => "010011000101000110100110010011110110",
    84 => "010011010010001101100110011101101010",
    85 => "010011011111001110100110100111100101",
    86 => "010011101100001011100110110001100111",
    87 => "010011111001000011100110111011101111",
    88 => "010100000101110101100111000101111110",
    89 => "010100010010100010100111010000010011",
    90 => "010100011111001010100111011010101111",
    91 => "010100101011101100100111100101010001",
    92 => "010100111000001001100111101111111001",
    93 => "010101000100100001100111111010101000",
    94 => "010101010000110011101000000101011101",
    95 => "010101011100111111101000010000011001",
    96 => "010101101001000110101000011011011010",
    97 => "010101110101000111101000100110100010",
    98 => "010110000001000010101000110001110000",
    99 => "010110001100111000101000111101000100",
    100 => "010110011000101000101001001000011111",
    101 => "010110100100010010101001010011111111",
    102 => "010110101111110110101001011111100101",
    103 => "010110111011010100101001101011010001",
    104 => "010111000110101100101001110111000010",
    105 => "010111010001111110101010000010111010",
    106 => "010111011101001010101010001110110111",
    107 => "010111101000010000101010011010111010",
    108 => "010111110011001111101010100111000011",
    109 => "010111111110001001101010110011010001",
    110 => "011000001000111100101010111111100101",
    111 => "011000010011101001101011001011111110",
    112 => "011000011110001111101011011000011101",
    113 => "011000101000101111101011100101000001",
    114 => "011000110011001001101011110001101011",
    115 => "011000111101011100101011111110011010",
    116 => "011001000111101000101100001011001110",
    117 => "011001010001101110101100011000000111",
    118 => "011001011011101110101100100101000101",
    119 => "011001100101100110101100110010001001",
    120 => "011001101111011000101100111111010001",
    121 => "011001111001000100101101001100011111",
    122 => "011010000010101000101101011001110001",
    123 => "011010001100000110101101100111001000",
    124 => "011010010101011100101101110100100100",
    125 => "011010011110101100101110000010000101",
    126 => "011010100111110101101110001111101011",
    127 => "011010110000110111101110011101010101",
    128 => "011010111001110010101110101011000100",
    129 => "011011000010100110101110111000110111",
    130 => "011011001011010011101111000110101111",
    131 => "011011010011111001101111010100101011",
    132 => "011011011100010111101111100010101100",
    133 => "011011100100101111101111110000110001",
    134 => "011011101100111111101111111110111010",
    135 => "011011110101001000110000001101000111",
    136 => "011011111101001010110000011011011001",
    137 => "011100000101000100110000101001101110",
    138 => "011100001100110111110000111000001000",
    139 => "011100010100100010110001000110100101",
    140 => "011100011100000111110001010101000111",
    141 => "011100100011100011110001100011101100",
    142 => "011100101010111001110001110010010101",
    143 => "011100110010000110110010000001000010",
    144 => "011100111001001100110010001111110011",
    145 => "011101000000001011110010011110100111",
    146 => "011101000111000010110010101101011110",
    147 => "011101001101110010110010111100011001",
    148 => "011101010100011001110011001011011000",
    149 => "011101011010111001110011011010011010",
    150 => "011101100001010010110011101001011111",
    151 => "011101100111100010110011111000100111",
    152 => "011101101101101011110100000111110011",
    153 => "011101110011101100110100010111000001",
    154 => "011101111001100110110100100110010011",
    155 => "011101111111010111110100110101101000",
    156 => "011110000101000001110101000101000000",
    157 => "011110001010100011110101010100011010",
    158 => "011110001111111100110101100011110111",
    159 => "011110010101001110110101110011010111",
    160 => "011110011010011000110110000010111010",
    161 => "011110011111011010110110010010011111",
    162 => "011110100100010100110110100010000111",
    163 => "011110101001000110110110110001110001",
    164 => "011110101101110000110111000001011110",
    165 => "011110110010010010110111010001001101",
    166 => "011110110110101100110111100000111111",
    167 => "011110111010111110110111110000110010",
    168 => "011110111111001000111000000000101000",
    169 => "011111000011001001111000010000100000",
    170 => "011111000111000011111000100000011010",
    171 => "011111001010110100111000110000010110",
    172 => "011111001110011101111001000000010011",
    173 => "011111010001111110111001010000010011",
    174 => "011111010101010111111001100000010100",
    175 => "011111011000101000111001110000010111",
    176 => "011111011011110000111010000000011100",
    177 => "011111011110110000111010010000100010",
    178 => "011111100001101000111010100000101010",
    179 => "011111100100011000111010110000110011",
    180 => "011111100110111111111011000000111101",
    181 => "011111101001011111111011010001001001",
    182 => "011111101011110101111011100001010110",
    183 => "011111101110000100111011110001100101",
    184 => "011111110000001010111100000001110100",
    185 => "011111110010001000111100010010000100",
    186 => "011111110011111110111100100010010110",
    187 => "011111110101101011111100110010101000",
    188 => "011111110111010000111101000010111011",
    189 => "011111111000101100111101010011001111",
    190 => "011111111010000001111101100011100100",
    191 => "011111111011001100111101110011111001",
    192 => "011111111100010000111110000100001111",
    193 => "011111111101001011111110010100100101",
    194 => "011111111101111110111110100100111100",
    195 => "011111111110101000111110110101010011",
    196 => "000000000000000000000000000000000000" );


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

memory_access_guard_1: process (addr1)
begin
      addr1_tmp <= addr1;
--synthesis translate_off
      if (CONV_INTEGER(addr1) > mem_size-1) then
           addr1_tmp <= (others => '0');
      else
           addr1_tmp <= addr1;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)
begin
    if (clk'event and clk = '1') then
        if (ce0 = '1') then
            q0 <= mem(CONV_INTEGER(addr0_tmp));
        end if;
        if (ce1 = '1') then
            q1 <= mem(CONV_INTEGER(addr1_tmp));
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity get_trig_vals_luthbi is
    generic (
        DataWidth : INTEGER := 36;
        AddressRange : INTEGER := 197;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address1 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of get_trig_vals_luthbi is
    component get_trig_vals_luthbi_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR;
            addr1 : IN STD_LOGIC_VECTOR;
            ce1 : IN STD_LOGIC;
            q1 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    get_trig_vals_luthbi_rom_U :  component get_trig_vals_luthbi_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0,
        addr1 => address1,
        ce1 => ce1,
        q1 => q1);

end architecture;
