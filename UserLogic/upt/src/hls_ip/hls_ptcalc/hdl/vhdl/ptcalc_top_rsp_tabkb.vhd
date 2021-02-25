-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ptcalc_top_rsp_tabkb_rom is
    generic(
             DWIDTH     : integer := 7;
             AWIDTH     : integer := 12;
             MEM_SIZE    : integer := 4096
    );
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0);
          ce0       : in std_logic;
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    );
end entity;


architecture rtl of ptcalc_top_rsp_tabkb_rom is

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0);
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0);
signal mem : mem_array := (
    0 to 2=> "1000000", 3 to 366=> "0111111", 367 to 524=> "0111110", 525 to 650=> "0111101",
    651 to 760=> "0111100", 761 to 860=> "0111011", 861 to 955=> "0111010", 956 to 1045=> "0111001",
    1046 to 1133=> "0111000", 1134 to 1218=> "0110111", 1219 to 1302=> "0110110", 1303 to 1386=> "0110101",
    1387 to 1469=> "0110100", 1470 to 1552=> "0110011", 1553 to 1636=> "0110010", 1637 to 1720=> "0110001",
    1721 to 1806=> "0110000", 1807 to 1892=> "0101111", 1893 to 1981=> "0101110", 1982 to 2071=> "0101101",
    2072 to 2163=> "0101100", 2164 to 2257=> "0101011", 2258 to 2354=> "0101010", 2355 to 2454=> "0101001",
    2455 to 2557=> "0101000", 2558 to 2664=> "0100111", 2665 to 2775=> "0100110", 2776 to 2890=> "0100101",
    2891 to 3010=> "0100100", 3011 to 3135=> "0100011", 3136 to 3266=> "0100010", 3267 to 3403=> "0100001",
    3404 to 3547=> "0100000", 3548 to 3699=> "0011111", 3700 to 3859=> "0011110", 3860 to 4029=> "0011101",
    4030 to 4095=> "0011100" );


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

entity ptcalc_top_rsp_tabkb is
    generic (
        DataWidth : INTEGER := 7;
        AddressRange : INTEGER := 4096;
        AddressWidth : INTEGER := 12);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of ptcalc_top_rsp_tabkb is
    component ptcalc_top_rsp_tabkb_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    ptcalc_top_rsp_tabkb_rom_U :  component ptcalc_top_rsp_tabkb_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;
