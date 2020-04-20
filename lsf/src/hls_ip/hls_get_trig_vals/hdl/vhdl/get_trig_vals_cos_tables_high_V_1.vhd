-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity get_trig_vals_cos_tables_high_V_1_rom is 
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


architecture rtl of get_trig_vals_cos_tables_high_V_1_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
signal addr1_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 44=> "0111100001111", 45 to 62=> "0111000001110", 63 => "0110100001110", 
    64 to 77=> "0110100001101", 78 to 90=> "0110000001100", 91 to 101=> "0101100001011", 
    102 to 111=> "0101000001010", 112 to 121=> "0100100001001", 122 to 130=> "0100000001000", 
    131 to 139=> "0011100000111", 140 to 148=> "0011000000110", 149 to 156=> "0010100000101", 
    157 to 164=> "0010000000100", 165 to 172=> "0001100000011", 173 to 180=> "0001000000010", 
    181 to 188=> "0000100000001", 189 to 196=> "0000000000000", 197 to 204=> "1111111111111", 
    205 to 211=> "1111011111110", 212 to 219=> "1110111111101", 220 to 227=> "1110011111100", 
    228 to 235=> "1101111111011", 236 => "1101011111011", 237 to 244=> "1101011111010", 
    245 to 252=> "1100111111001", 253 to 261=> "1100011111000", 262 to 270=> "1011111110111", 
    271 => "1011011110111", 272 to 280=> "1011011110110", 281 to 291=> "1010111110101", 
    292 to 302=> "1010011110100", 303 to 314=> "1001111110011", 315 to 329=> "1001011110010", 
    330 to 348=> "1000111110001", 349 to 437=> "1000011110000", 438 to 455=> "1000111110001", 
    456 to 470=> "1001011110010", 471 to 483=> "1001111110011", 484 to 494=> "1010011110100", 
    495 to 504=> "1010111110101", 505 to 514=> "1011011110110", 515 to 523=> "1011111110111", 
    524 to 532=> "1100011111000", 533 to 541=> "1100111111001", 542 to 549=> "1101011111010", 
    550 to 557=> "1101111111011", 558 to 565=> "1110011111100", 566 to 573=> "1110111111101", 
    574 to 581=> "1111011111110", 582 to 589=> "1111111111111", 590 to 596=> "0000000000000", 
    597 => "0000100000000", 598 to 604=> "0000100000001", 605 to 612=> "0001000000010", 
    613 to 620=> "0001100000011", 621 to 628=> "0010000000100", 629 to 637=> "0010100000101", 
    638 to 645=> "0011000000110", 646 to 654=> "0011100000111", 655 to 663=> "0100000001000", 
    664 to 673=> "0100100001001", 674 to 683=> "0101000001010", 684 => "0101100001010", 
    685 to 695=> "0101100001011", 696 to 707=> "0110000001100", 708 to 722=> "0110100001101", 
    723 to 741=> "0111000001110", 742 to 785=> "0111100001111" );

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

entity get_trig_vals_cos_tables_high_V_1 is
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

architecture arch of get_trig_vals_cos_tables_high_V_1 is
    component get_trig_vals_cos_tables_high_V_1_rom is
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
    get_trig_vals_cos_tables_high_V_1_rom_U :  component get_trig_vals_cos_tables_high_V_1_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0,
        addr1 => address1,
        ce1 => ce1,
        q1 => q1);

end architecture;


