--
-- overloaded READ and WRITE for textio of unsigned and std_logic_vector
-- for unsigned, use READ and WRITE
-- for slv, use DREAD and DWRITE (since READ and WRITE only work for binary)
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

package my_textio is

  procedure READ( L:inout LINE; VALUE:out unsigned);
  procedure WRITE( L:inout LINE; VALUE:in unsigned);

  procedure DREAD( L:inout LINE; VALUE:out std_logic_vector);
  procedure DWRITE( L:inout LINE; VALUE:in std_logic_vector);


end my_textio;

package body my_textio is

  procedure WRITE( L:inout LINE; VALUE:in unsigned) is
    variable v: integer;
  begin
    v := to_integer(VALUE);
    WRITE(L, V);
  end WRITE;
  
  procedure READ( L:inout LINE; VALUE:out unsigned) is
    variable v: integer;
  begin
    READ(L, v);
    VALUE := to_unsigned( v, VALUE'length);
  end READ;

  procedure DREAD( L:inout LINE; VALUE:out std_logic_vector) is
    variable v: integer;
  begin
    READ(L, v);
    VALUE := std_logic_vector(to_unsigned(v, VALUE'length));
  end DREAD;
  

  procedure DWRITE( L:inout LINE; VALUE:in std_logic_vector) is
    variable v: integer;
  begin
    v := to_integer(unsigned(VALUE));
    WRITE(L, V);
  end DWRITE;
  
  
  
end my_textio;
  
