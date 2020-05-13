-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity get_trig_vals_sin_tables_high_V_5_rom is 
    generic(
             DWIDTH     : integer := 13; 
             AWIDTH     : integer := 10; 
             MEM_SIZE    : integer := 786
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


architecture rtl of get_trig_vals_sin_tables_high_V_5_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr1_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 7=> "0000000000000", 8 to 14=> "0000100000001", 15 => "0001000000001", 
    16 to 22=> "0001000000010", 23 to 30=> "0001100000011", 31 to 39=> "0010000000100", 
    40 to 47=> "0010100000101", 48 to 55=> "0011000000110", 56 to 64=> "0011100000111", 
    65 to 73=> "0100000001000", 74 => "0100100001000", 75 to 83=> "0100100001001", 
    84 to 94=> "0101000001010", 95 to 105=> "0101100001011", 106 to 117=> "0110000001100", 
    118 to 132=> "0110100001101", 133 to 151=> "0111000001110", 152 to 240=> "0111100001111", 
    241 to 258=> "0111000001110", 259 => "0110100001110", 260 to 273=> "0110100001101", 
    274 to 286=> "0110000001100", 287 to 297=> "0101100001011", 298 to 307=> "0101000001010", 
    308 to 317=> "0100100001001", 318 to 326=> "0100000001000", 327 to 335=> "0011100000111", 
    336 to 344=> "0011000000110", 345 to 352=> "0010100000101", 353 to 360=> "0010000000100", 
    361 to 368=> "0001100000011", 369 to 376=> "0001000000010", 377 to 384=> "0000100000001", 
    385 to 392=> "0000000000000", 393 to 400=> "1111111111111", 401 to 407=> "1111011111110", 
    408 to 415=> "1110111111101", 416 to 423=> "1110011111100", 424 to 431=> "1101111111011", 
    432 => "1101011111011", 433 to 440=> "1101011111010", 441 to 448=> "1100111111001", 
    449 to 457=> "1100011111000", 458 to 466=> "1011111110111", 467 to 476=> "1011011110110", 
    477 to 487=> "1010111110101", 488 to 498=> "1010011110100", 499 to 510=> "1001111110011", 
    511 to 525=> "1001011110010", 526 to 544=> "1000111110001", 545 to 633=> "1000011110000", 
    634 to 651=> "1000111110001", 652 to 666=> "1001011110010", 667 to 679=> "1001111110011", 
    680 to 690=> "1010011110100", 691 to 700=> "1010111110101", 701 to 710=> "1011011110110", 
    711 to 719=> "1011111110111", 720 to 728=> "1100011111000", 729 to 737=> "1100111111001", 
    738 to 745=> "1101011111010", 746 to 753=> "1101111111011", 754 to 761=> "1110011111100", 
    762 to 769=> "1110111111101", 770 to 777=> "1111011111110", 778 to 784=> "1111111111111", 
    785 => "0000000000000" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "block_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "block";

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

entity get_trig_vals_sin_tables_high_V_5 is
    generic (
        DataWidth : INTEGER := 13;
        AddressRange : INTEGER := 786;
        AddressWidth : INTEGER := 10);
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

architecture arch of get_trig_vals_sin_tables_high_V_5 is
    component get_trig_vals_sin_tables_high_V_5_rom is
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
    get_trig_vals_sin_tables_high_V_5_rom_U :  component get_trig_vals_sin_tables_high_V_5_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0,
        addr1 => address1,
        ce1 => ce1,
        q1 => q1);

end architecture;


