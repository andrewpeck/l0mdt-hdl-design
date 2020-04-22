--------------------------------------------------------------------------------
-- Prototype of functions to convert values to/from text for testbenches
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;


library l0mdt_lib;
use l0mdt_lib.mdttp_constants_pkg.all;
use l0mdt_lib.mdttp_types_pkg.all;

package mdttp_textio is

  procedure READ(L:inout LINE; VALUE : out TDC_rt);
  procedure WRITE(L:inout LINE; VALUE : in TDC_rt);

end mdttp_textio;


package body mdttp_textio is

  -----------------------------------------------
  -- read TDC record type as 5 decimal numbers
  -----------------------------------------------
  procedure READ(L : inout LINE; VALUE : out TDC_rt) is

    variable i_chanid     : integer;
    variable i_edgemode   : integer;
    variable i_coarsetime : integer;
    variable i_finetime   : integer;
    variable i_pulsewidth : integer;

    variable v_chanid     : std_logic_vector(TDC_CHANID_LEN-1 downto 0);    -- 4
    variable v_edgemode   : std_logic_vector(TDC_EDGEMODE_LEN-1 downto 0);  -- 1
    variable v_coarsetime : std_logic_vector(TDC_COARSETIME_LEN-1 downto 0);  -- 11
    variable v_finetime   : std_logic_vector(TDC_FINETIME_LEN-1 downto 0);  -- 4
    variable v_pulsewidth : std_logic_vector(TDC_PULSEWIDTH_LEN-1 downto 0);  -- 7

    variable v_SPACE : character;

  begin

    READ(L, i_chanid);
    READ(L, v_SPACE);           -- read in the space character
    READ(L, i_edgemode);
    READ(L, v_SPACE);
    READ(L, i_coarsetime);
    READ(L, v_SPACE);
    READ(L, i_finetime);
    READ(L, v_SPACE);
    READ(L, i_pulsewidth);

    v_chanid := std_logic_vector( to_unsigned( i_chanid, TDC_CHANID_LEN));
    v_edgemode := std_logic_vector( to_unsigned( i_edgemode, TDC_EDGEMODE_LEN));
    v_coarsetime := std_logic_vector( to_unsigned( i_coarsetime, TDC_COARSETIME_LEN));
    v_finetime := std_logic_vector( to_unsigned( i_finetime, TDC_FINETIME_LEN));
    v_pulsewidth := std_logic_vector( to_unsigned( i_pulsewidth, TDC_PULSEWIDTH_LEN));

    VALUE := ( chanid => v_chanid,
               edgemode => v_edgemode,
               coarsetime => v_coarsetime,
               finetime => v_finetime,
               pulsewidth => v_pulsewidth);
  end READ;



  -----------------------------------------------
  -- write TDC record type as 5 decimal numbers
  -----------------------------------------------
  procedure WRITE(L:inout LINE; VALUE : in TDC_rt) is

    variable v_chanid     : std_logic_vector(TDC_CHANID_LEN-1 downto 0);    -- 4
    variable v_edgemode   : std_logic_vector(TDC_EDGEMODE_LEN-1 downto 0);  -- 1
    variable v_coarsetime : std_logic_vector(TDC_COARSETIME_LEN-1 downto 0);  -- 11
    variable v_finetime   : std_logic_vector(TDC_FINETIME_LEN-1 downto 0);  -- 4
    variable v_pulsewidth : std_logic_vector(TDC_PULSEWIDTH_LEN-1 downto 0);  -- 7

  begin

    v_chanid := VALUE.chanid;
    v_edgemode := VALUE.edgemode;
    v_coarsetime := VALUE.coarsetime;
    v_finetime := VALUE.finetime;
    v_pulsewidth := VALUE.pulsewidth;

    WRITE(L, to_integer( unsigned(v_chanid)));
    WRITE(L, ' ');
    WRITE(L, to_integer( unsigned(v_edgemode)));
    WRITE(L, ' ');
    WRITE(L, to_integer( unsigned(v_coarsetime)));
    WRITE(L, ' ');
    WRITE(L, to_integer( unsigned(v_finetime)));
    WRITE(L, ' ');
    WRITE(L, to_integer( unsigned(v_pulsewidth)));

  end WRITE;

end mdttp_textio;
