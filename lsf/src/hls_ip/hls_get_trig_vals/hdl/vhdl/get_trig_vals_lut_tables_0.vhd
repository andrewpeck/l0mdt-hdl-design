-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity get_trig_vals_lut_tables_0_rom is 
    generic(
             DWIDTH     : integer := 36; 
             AWIDTH     : integer := 9; 
             MEM_SIZE    : integer := 394
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


architecture rtl of get_trig_vals_lut_tables_0_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr1_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "111111000000010111100000000000111111", 
    1 => "111111001000100011100000000000110000", 
    2 => "111111010000101111100000000000100010", 
    3 => "111111011000111011100000000000010111", 
    4 => "111111100001000111100000000000001110", 
    5 => "111111101001010011100000000000001000", 
    6 => "111111110001011111100000000000000011", 
    7 => "111111111001101011100000000000000000", 
    8 => "000000000001110111100000000000000000", 
    9 => "000000001010000011100000000000000001", 
    10 => "000000010010001111100000000000000101", 
    11 => "000000011010011011100000000000001010", 
    12 => "000000100010100111100000000000010010", 
    13 => "000000101010110010100000000000011100", 
    14 => "000000110010111110100000000000101000", 
    15 => "000000111011001010100000000000110110", 
    16 => "000001000011010110100000000001000110", 
    17 => "000001001011100010100000000001011001", 
    18 => "000001010011101101100000000001101101", 
    19 => "000001011011111001100000000010000100", 
    20 => "000001100100000100100000000010011100", 
    21 => "000001101100001111100000000010110111", 
    22 => "000001110100011011100000000011010011", 
    23 => "000001111100100110100000000011110010", 
    24 => "000010000100110001100000000100010011", 
    25 => "000010001100111100100000000100110110", 
    26 => "000010010101000110100000000101011011", 
    27 => "000010011101010001100000000110000011", 
    28 => "000010100101011011100000000110101100", 
    29 => "000010101101100101100000000111010111", 
    30 => "000010110101101111100000001000000101", 
    31 => "000010111101111001100000001000110100", 
    32 => "000011000110000011100000001001100110", 
    33 => "000011001110001100100000001010011010", 
    34 => "000011010110010101100000001011001111", 
    35 => "000011011110011111100000001100000111", 
    36 => "000011100110100111100000001101000001", 
    37 => "000011101110110000100000001101111101", 
    38 => "000011110110111000100000001110111011", 
    39 => "000011111111000000100000001111111100", 
    40 => "000100000111001000100000010000111110", 
    41 => "000100001111010000100000010010000010", 
    42 => "000100010111010111100000010011001001", 
    43 => "000100011111011110100000010100010001", 
    44 => "000100100111100100100000010101011100", 
    45 => "000100101111101011100000010110101000", 
    46 => "000100110111110001100000010111110111", 
    47 => "000100111111110111100000011001001000", 
    48 => "000101000111111100100000011010011011", 
    49 => "000101010000000001100000011011110000", 
    50 => "000101011000000110100000011101000111", 
    51 => "000101100000001010100000011110100000", 
    52 => "000101101000001110100000011111111011", 
    53 => "000101110000010010100000100001011000", 
    54 => "000101111000010101100000100010110111", 
    55 => "000110000000011000100000100100011001", 
    56 => "000110001000011010100000100101111100", 
    57 => "000110010000011100100000100111100010", 
    58 => "000110011000011110100000101001001001", 
    59 => "000110100000011111100000101010110011", 
    60 => "000110101000100000100000101100011110", 
    61 => "000110110000100001100000101110001100", 
    62 => "000110111000100001100000101111111100", 
    63 => "000111000000100000100000110001101101", 
    64 => "000111001000011111100000110011100001", 
    65 => "000111010000011110100000110101010111", 
    66 => "000111011000011100100000110111001111", 
    67 => "000111100000011001100000111001001001", 
    68 => "000111101000010111100000111011000101", 
    69 => "000111110000010011100000111101000011", 
    70 => "000111111000001111100000111111000011", 
    71 => "001000000000001011100001000001000101", 
    72 => "001000001000000110100001000011001001", 
    73 => "001000010000000001100001000101001111", 
    74 => "001000010111111011100001000111010111", 
    75 => "001000011111110100100001001001100001", 
    76 => "001000100111101101100001001011101101", 
    77 => "001000101111100101100001001101111011", 
    78 => "001000110111011101100001010000001011", 
    79 => "001000111111010100100001010010011110", 
    80 => "001001000111001011100001010100110010", 
    81 => "001001001111000001100001010111001000", 
    82 => "001001010110110110100001011001100000", 
    83 => "001001011110101011100001011011111011", 
    84 => "001001100110011111100001011110010111", 
    85 => "001001101110010011100001100000110101", 
    86 => "001001110110000110100001100011010101", 
    87 => "001001111101111000100001100101110111", 
    88 => "001010000101101010100001101000011100", 
    89 => "001010001101011011100001101011000010", 
    90 => "001010010101001011100001101101101010", 
    91 => "001010011100111010100001110000010100", 
    92 => "001010100100101001100001110011000000", 
    93 => "001010101100011000100001110101101110", 
    94 => "001010110100000101100001111000011110", 
    95 => "001010111011110010100001111011010001", 
    96 => "001011000011011110100001111110000101", 
    97 => "001011001011001001100010000000111011", 
    98 => "001011010010110100100010000011110011", 
    99 => "001011011010011110100010000110101100", 
    100 => "001011100010000111100010001001101000", 
    101 => "001011101001110000100010001100100110", 
    102 => "001011110001010111100010001111100110", 
    103 => "001011111000111110100010010010101000", 
    104 => "001100000000100100100010010101101011", 
    105 => "001100001000001001100010011000110001", 
    106 => "001100001111101110100010011011111000", 
    107 => "001100010111010010100010011111000010", 
    108 => "001100011110110101100010100010001101", 
    109 => "001100100110010111100010100101011011", 
    110 => "001100101101111000100010101000101010", 
    111 => "001100110101011000100010101011111011", 
    112 => "001100111100111000100010101111001110", 
    113 => "001101000100010111100010110010100011", 
    114 => "001101001011110101100010110101111010", 
    115 => "001101010011010010100010111001010011", 
    116 => "001101011010101110100010111100101110", 
    117 => "001101100010001001100011000000001011", 
    118 => "001101101001100011100011000011101001", 
    119 => "001101110000111101100011000111001010", 
    120 => "001101111000010101100011001010101100", 
    121 => "001101111111101101100011001110010000", 
    122 => "001110000111000100100011010001110110", 
    123 => "001110001110011010100011010101011110", 
    124 => "001110010101101111100011011001001000", 
    125 => "001110011101000011100011011100110100", 
    126 => "001110100100010110100011100000100010", 
    127 => "001110101011101000100011100100010001", 
    128 => "001110110010111001100011101000000010", 
    129 => "001110111010001001100011101011110110", 
    130 => "001111000001011000100011101111101011", 
    131 => "001111001000100110100011110011100010", 
    132 => "001111001111110100100011110111011010", 
    133 => "001111010111000000100011111011010101", 
    134 => "001111011110001011100011111111010001", 
    135 => "001111100101010101100100000011010000", 
    136 => "001111101100011110100100000111010000", 
    137 => "001111110011100110100100001011010010", 
    138 => "001111111010101101100100001111010101", 
    139 => "010000000001110100100100010011011011", 
    140 => "010000001000111001100100010111100010", 
    141 => "010000001111111100100100011011101011", 
    142 => "010000010110111111100100011111110110", 
    143 => "010000011110000001100100100100000011", 
    144 => "010000100101000010100100101000010010", 
    145 => "010000101100000010100100101100100010", 
    146 => "010000110011000000100100110000110100", 
    147 => "010000111001111110100100110101001000", 
    148 => "010001000000111010100100111001011110", 
    149 => "010001000111110101100100111101110101", 
    150 => "010001001110101111100101000010001111", 
    151 => "010001010101101000100101000110101010", 
    152 => "010001011100100000100101001011000111", 
    153 => "010001100011010111100101001111100101", 
    154 => "010001101010001100100101010100000101", 
    155 => "010001110001000001100101011000100111", 
    156 => "010001110111110100100101011101001011", 
    157 => "010001111110100110100101100001110001", 
    158 => "010010000101010111100101100110011000", 
    159 => "010010001100000111100101101011000001", 
    160 => "010010010010110101100101101111101100", 
    161 => "010010011001100011100101110100011000", 
    162 => "010010100000001111100101111001000110", 
    163 => "010010100110111010100101111101110110", 
    164 => "010010101101100011100110000010101000", 
    165 => "010010110100001100100110000111011011", 
    166 => "010010111010110011100110001100010000", 
    167 => "010011000001011001100110010001000111", 
    168 => "010011000111111110100110010101111111", 
    169 => "010011001110100001100110011010111001", 
    170 => "010011010101000011100110011111110101", 
    171 => "010011011011100100100110100100110010", 
    172 => "010011100010000100100110101001110001", 
    173 => "010011101000100011100110101110110010", 
    174 => "010011101111000000100110110011110100", 
    175 => "010011110101011100100110111000111000", 
    176 => "010011111011110110100110111101111110", 
    177 => "010100000010001111100111000011000101", 
    178 => "010100001000100111100111001000001110", 
    179 => "010100001110111110100111001101011000", 
    180 => "010100010101010011100111010010100100", 
    181 => "010100011011100111100111010111110010", 
    182 => "010100100001111010100111011101000001", 
    183 => "010100101000001011100111100010010010", 
    184 => "010100101110011011100111100111100101", 
    185 => "010100110100101001100111101100111001", 
    186 => "010100111010110111100111110010001111", 
    187 => "010101000001000011100111110111100110", 
    188 => "010101000111001101100111111100111111", 
    189 => "010101001101010110101000000010011010", 
    190 => "010101010011011110101000000111110110", 
    191 => "010101011001100100101000001101010011", 
    192 => "010101011111101001101000010010110011", 
    193 => "010101100101101100101000011000010011", 
    194 => "010101101011101110101000011101110110", 
    195 => "010101110001101111101000100011011010", 
    196 => "010101110111101110101000101000111111", 
    197 => "010101111101101100101000101110100110", 
    198 => "010110000011101001101000110100001110", 
    199 => "010110001001100011101000111001111000", 
    200 => "010110001111011101101000111111100100", 
    201 => "010110010101010101101001000101010001", 
    202 => "010110011011001011101001001010111111", 
    203 => "010110100001000001101001010000101111", 
    204 => "010110100110110100101001010110100000", 
    205 => "010110101100100110101001011100010011", 
    206 => "010110110010010111101001100010001000", 
    207 => "010110111000000110101001100111111110", 
    208 => "010110111101110100101001101101110101", 
    209 => "010111000011100000101001110011101110", 
    210 => "010111001001001010101001111001101000", 
    211 => "010111001110110100101001111111100100", 
    212 => "010111010100011011101010000101100001", 
    213 => "010111011010000001101010001011011111", 
    214 => "010111011111100110101010010001011111", 
    215 => "010111100101001001101010010111100001", 
    216 => "010111101010101010101010011101100100", 
    217 => "010111110000001010101010100011101000", 
    218 => "010111110101101001101010101001101110", 
    219 => "010111111011000101101010101111110101", 
    220 => "011000000000100001101010110101111101", 
    221 => "011000000101111010101010111100000111", 
    222 => "011000001011010010101011000010010010", 
    223 => "011000010000101001101011001000011111", 
    224 => "011000010101111110101011001110101101", 
    225 => "011000011011010001101011010100111100", 
    226 => "011000100000100011101011011011001101", 
    227 => "011000100101110011101011100001011111", 
    228 => "011000101011000001101011100111110010", 
    229 => "011000110000001110101011101110000111", 
    230 => "011000110101011001101011110100011101", 
    231 => "011000111010100011101011111010110100", 
    232 => "011000111111101011101100000001001100", 
    233 => "011001000100110010101100000111100110", 
    234 => "011001001001110110101100001110000010", 
    235 => "011001001110111001101100010100011110", 
    236 => "011001010011111011101100011010111100", 
    237 => "011001011000111011101100100001011011", 
    238 => "011001011101111001101100100111111100", 
    239 => "011001100010110101101100101110011101", 
    240 => "011001100111110000101100110101000000", 
    241 => "011001101100101001101100111011100100", 
    242 => "011001110001100000101101000010001010", 
    243 => "011001110110010110101101001000110000", 
    244 => "011001111011001010101101001111011000", 
    245 => "011001111111111100101101010110000001", 
    246 => "011010000100101101101101011100101100", 
    247 => "011010001001011100101101100011010111", 
    248 => "011010001110001001101101101010000100", 
    249 => "011010010010110101101101110000110010", 
    250 => "011010010111011111101101110111100001", 
    251 => "011010011100000111101101111110010010", 
    252 => "011010100000101101101110000101000011", 
    253 => "011010100101010010101110001011110110", 
    254 => "011010101001110100101110010010101010", 
    255 => "011010101110010101101110011001011111", 
    256 => "011010110010110101101110100000010101", 
    257 => "011010110111010010101110100111001100", 
    258 => "011010111011101110101110101110000101", 
    259 => "011011000000001000101110110100111110", 
    260 => "011011000100100001101110111011111001", 
    261 => "011011001000110111101111000010110101", 
    262 => "011011001101001100101111001001110010", 
    263 => "011011010001011111101111010000110000", 
    264 => "011011010101110000101111010111101111", 
    265 => "011011011010000000101111011110101111", 
    266 => "011011011110001101101111100101110001", 
    267 => "011011100010011001101111101100110011", 
    268 => "011011100110100011101111110011110110", 
    269 => "011011101010101011101111111010111011", 
    270 => "011011101110110010110000000010000000", 
    271 => "011011110010110110110000001001000111", 
    272 => "011011110110111001110000010000001111", 
    273 => "011011111010111010110000010111010111", 
    274 => "011011111110111001110000011110100001", 
    275 => "011100000010110110110000100101101100", 
    276 => "011100000110110010110000101100111000", 
    277 => "011100001010101011110000110100000100", 
    278 => "011100001110100011110000111011010010", 
    279 => "011100010010011001110001000010100001", 
    280 => "011100010110001101110001001001110000", 
    281 => "011100011001111111110001010001000001", 
    282 => "011100011101101111110001011000010011", 
    283 => "011100100001011110110001011111100101", 
    284 => "011100100101001011110001100110111001", 
    285 => "011100101000110101110001101110001101", 
    286 => "011100101100011110110001110101100011", 
    287 => "011100110000000101110001111100111001", 
    288 => "011100110011101010110010000100010000", 
    289 => "011100110111001101110010001011101001", 
    290 => "011100111010101111110010010011000010", 
    291 => "011100111110001110110010011010011100", 
    292 => "011101000001101100110010100001110111", 
    293 => "011101000101000111110010101001010010", 
    294 => "011101001000100001110010110000101111", 
    295 => "011101001011111001110010111000001100", 
    296 => "011101001111001111110010111111101011", 
    297 => "011101010010100011110011000111001010", 
    298 => "011101010101110101110011001110101010", 
    299 => "011101011001000101110011010110001011", 
    300 => "011101011100010011110011011101101101", 
    301 => "011101011111100000110011100101001111", 
    302 => "011101100010101010110011101100110010", 
    303 => "011101100101110010110011110100010111", 
    304 => "011101101000111001110011111011111011", 
    305 => "011101101011111110110100000011100001", 
    306 => "011101101111000000110100001011001000", 
    307 => "011101110010000001110100010010101111", 
    308 => "011101110101000000110100011010010111", 
    309 => "011101110111111100110100100010000000", 
    310 => "011101111010110111110100101001101001", 
    311 => "011101111101110000110100110001010100", 
    312 => "011110000000100111110100111000111111", 
    313 => "011110000011011100110101000000101011", 
    314 => "011110000110001111110101001000010111", 
    315 => "011110001001000000110101010000000100", 
    316 => "011110001011101111110101010111110010", 
    317 => "011110001110011100110101011111100001", 
    318 => "011110010001000111110101100111010000", 
    319 => "011110010011110000110101101111000000", 
    320 => "011110010110010111110101110110110001", 
    321 => "011110011000111100110101111110100010", 
    322 => "011110011011011111110110000110010100", 
    323 => "011110011110000001110110001110000111", 
    324 => "011110100000100000110110010101111010", 
    325 => "011110100010111101110110011101101110", 
    326 => "011110100101011000110110100101100010", 
    327 => "011110100111110001110110101101010111", 
    328 => "011110101010001000110110110101001101", 
    329 => "011110101100011101110110111101000011", 
    330 => "011110101110110001110111000100111010", 
    331 => "011110110001000010110111001100110010", 
    332 => "011110110011010001110111010100101010", 
    333 => "011110110101011110110111011100100011", 
    334 => "011110110111101001110111100100011100", 
    335 => "011110111001110010110111101100010110", 
    336 => "011110111011111001110111110100010000", 
    337 => "011110111101111110110111111100001011", 
    338 => "011111000000000001111000000100000110", 
    339 => "011111000010000010111000001100000010", 
    340 => "011111000100000001111000010011111110", 
    341 => "011111000101111110111000011011111011", 
    342 => "011111000111111000111000100011111001", 
    343 => "011111001001110001111000101011110110", 
    344 => "011111001011101000111000110011110101", 
    345 => "011111001101011101111000111011110100", 
    346 => "011111001111001111111001000011110011", 
    347 => "011111010001000000111001001011110011", 
    348 => "011111010010101111111001010011110011", 
    349 => "011111010100011011111001011011110100", 
    350 => "011111010110000110111001100011110101", 
    351 => "011111010111101110111001101011110110", 
    352 => "011111011001010100111001110011111000", 
    353 => "011111011010111001111001111011111010", 
    354 => "011111011100011011111010000011111101", 
    355 => "011111011101111011111010001100000000", 
    356 => "011111011111011001111010010100000100", 
    357 => "011111100000110101111010011100000111", 
    358 => "011111100010001111111010100100001100", 
    359 => "011111100011100111111010101100010000", 
    360 => "011111100100111101111010110100010101", 
    361 => "011111100110010001111010111100011010", 
    362 => "011111100111100011111011000100100000", 
    363 => "011111101000110011111011001100100110", 
    364 => "011111101010000000111011010100101100", 
    365 => "011111101011001100111011011100110011", 
    366 => "011111101100010101111011100100111001", 
    367 => "011111101101011101111011101101000001", 
    368 => "011111101110100010111011110101001000", 
    369 => "011111101111100101111011111101010000", 
    370 => "011111110000100110111100000101011000", 
    371 => "011111110001100101111100001101100000", 
    372 => "011111110010100010111100010101101000", 
    373 => "011111110011011101111100011101110001", 
    374 => "011111110100010110111100100101111010", 
    375 => "011111110101001101111100101110000011", 
    376 => "011111110110000010111100110110001100", 
    377 => "011111110110110100111100111110010110", 
    378 => "011111110111100101111101000110100000", 
    379 => "011111111000010011111101001110101001", 
    380 => "011111111000111111111101010110110100", 
    381 => "011111111001101010111101011110111110", 
    382 => "011111111010010010111101100111001000", 
    383 => "011111111010111000111101101111010011", 
    384 => "011111111011011100111101110111011110", 
    385 => "011111111011111110111101111111101001", 
    386 => "011111111100011110111110000111110100", 
    387 => "011111111100111011111110001111111111", 
    388 => "011111111101010111111110011000001010", 
    389 => "011111111101110000111110100000010101", 
    390 => "011111111110001000111110101000100001", 
    391 => "011111111110011101111110110000101101", 
    392 => "011111111110110000111110111000111000", 
    393 => "000000000000000000000000000000000000" );


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

entity get_trig_vals_lut_tables_0 is
    generic (
        DataWidth : INTEGER := 36;
        AddressRange : INTEGER := 394;
        AddressWidth : INTEGER := 9);
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

architecture arch of get_trig_vals_lut_tables_0 is
    component get_trig_vals_lut_tables_0_rom is
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
    get_trig_vals_lut_tables_0_rom_U :  component get_trig_vals_lut_tables_0_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0,
        addr1 => address1,
        ce1 => ce1,
        q1 => q1);

end architecture;


