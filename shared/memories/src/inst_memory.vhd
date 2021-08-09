library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;
use ieee.std_logic_textio.all;



entity inst_memory is
port
(
addr: IN std_logic_VECTOR(8 downto 0);
inst: OUT std_logic_VECTOR(23 downto 0)
);
end inst_memory;



architecture behavioral of inst_memory is

type rom_type is array (511 downto 0) of std_logic_vector (23 downto 0);
type rom_array is array(5 downto 0) of rom_type;


impure function InitRomFromFile (RomFileName : in string) return rom_array is
FILE romfile : text is in RomFileName;
variable RomFileLine : line;
variable rom : rom_array;
type t_integer_array       is array(integer range <> )  of integer;
variable v_data_read    : t_integer_array(5 downto 0);

begin
for i in rom_type'range loop
    readline(romfile, RomFileLine);
    for k in rom_array'range loop
        hread(RomFileLine, rom(k)(i));
    end loop;
end loop;
return rom;
end function;



signal rom_a0 : rom_array := InitRomFromFile("../../pt/data/params.txt");

begin

 

inst <= rom_a0(0)(conv_integer(addr));

end behavioral;