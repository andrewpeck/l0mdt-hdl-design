-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity get_trig_vals_sin_tables_high_V_1_rom is 
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


architecture rtl of get_trig_vals_sin_tables_high_V_1_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr1_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 7=> "0000000000000", 8 to 15=> "0000100000001", 16 to 23=> "0001000000010", 
    24 to 31=> "0001100000011", 32 to 39=> "0010000000100", 40 to 47=> "0010100000101", 
    48 to 56=> "0011000000110", 57 to 65=> "0011100000111", 66 to 74=> "0100000001000", 
    75 to 84=> "0100100001001", 85 to 94=> "0101000001010", 95 to 105=> "0101100001011", 
    106 to 118=> "0110000001100", 119 to 133=> "0110100001101", 134 to 151=> "0111000001110", 
    152 to 240=> "0111100001111", 241 to 259=> "0111000001110", 260 to 274=> "0110100001101", 
    275 to 286=> "0110000001100", 287 to 297=> "0101100001011", 298 to 308=> "0101000001010", 
    309 to 317=> "0100100001001", 318 => "0100000001001", 319 to 327=> "0100000001000", 
    328 to 336=> "0011100000111", 337 to 344=> "0011000000110", 345 to 352=> "0010100000101", 
    353 => "0010000000101", 354 to 361=> "0010000000100", 362 to 369=> "0001100000011", 
    370 to 377=> "0001000000010", 378 to 384=> "0000100000001", 385 to 392=> "0000000000000", 
    393 to 400=> "1111111111111", 401 to 408=> "1111011111110", 409 to 416=> "1110111111101", 
    417 to 424=> "1110011111100", 425 to 432=> "1101111111011", 433 to 440=> "1101011111010", 
    441 to 449=> "1100111111001", 450 to 458=> "1100011111000", 459 to 467=> "1011111110111", 
    468 to 477=> "1011011110110", 478 to 487=> "1010111110101", 488 to 498=> "1010011110100", 
    499 to 511=> "1001111110011", 512 to 525=> "1001011110010", 526 => "1000111110010", 
    527 to 544=> "1000111110001", 545 to 633=> "1000011110000", 634 to 652=> "1000111110001", 
    653 to 666=> "1001011110010", 667 => "1001111110010", 668 to 679=> "1001111110011", 
    680 to 690=> "1010011110100", 691 to 701=> "1010111110101", 702 to 710=> "1011011110110", 
    711 to 720=> "1011111110111", 721 to 728=> "1100011111000", 729 => "1100111111000", 
    730 to 737=> "1100111111001", 738 to 745=> "1101011111010", 746 to 754=> "1101111111011", 
    755 to 762=> "1110011111100", 763 to 769=> "1110111111101", 770 to 777=> "1111011111110", 
    778 to 785=> "1111111111111" );

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

entity get_trig_vals_sin_tables_high_V_1 is
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

architecture arch of get_trig_vals_sin_tables_high_V_1 is
    component get_trig_vals_sin_tables_high_V_1_rom is
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
    get_trig_vals_sin_tables_high_V_1_rom_U :  component get_trig_vals_sin_tables_high_V_1_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0,
        addr1 => address1,
        ce1 => ce1,
        q1 => q1);

end architecture;


