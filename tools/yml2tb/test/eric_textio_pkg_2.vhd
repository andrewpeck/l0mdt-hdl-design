
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

library shared_lib;
use shared_lib.eric_types_pkg.all;

package mdttp_textio is
-- RECORD type mdt_tdc
  procedure READ( L:inout LINE; VALUE: out mdt_tdc);
  procedure WRITE( L:inout LINE; VALUE: in mdt_tdc);
-- RECORD type mdt_polmux
  procedure READ( L:inout LINE; VALUE: out mdt_polmux);
  procedure WRITE( L:inout LINE; VALUE: in mdt_polmux);
-- ARRAY type mdt_polmux_
  procedure READ( L:inout LINE; VALUE: out mdt_polmux);
  procedure WRITE( L:inout LINE; VALUE: in mdt_polmux);
-- RECORD type l0mdt_ttc
  procedure READ( L:inout LINE; VALUE: out l0mdt_ttc);
  procedure WRITE( L:inout LINE; VALUE: in l0mdt_ttc);
-- RECORD type l0mdt_control
  procedure READ( L:inout LINE; VALUE: out l0mdt_control);
  procedure WRITE( L:inout LINE; VALUE: in l0mdt_control);

end mdttp_textio;

package body mdttp_textio is

  procedure READ( L:inout LINE; VALUE: out mdt_tdc) is
    variable v_data : mdt_tdc;
  begin
    READ(L, v_data.ch);
    READ(L, v_data.mode);
    READ(L, v_data.coarse);
    READ(L, v_data.fine);
    READ(L, v_data.pw);
  end READ;

  procedure READ( L:inout LINE; VALUE: out mdt_polmux) is
    variable v_data : mdt_polmux;
  begin
    READ(L, v_data.fiberID);
    READ(L, v_data.muxID);
    READ(L, v_data.tdc);
    READ(L, v_data.data_valid);
  end READ;

  procedure READ( L:inout LINE; VALUE: out mdt_polmux) is
    variable v_data : mdt_polmux;
    variable v_index : integer;
  begin
    READ(L, v_data);
  end READ;

  procedure READ( L:inout LINE; VALUE: out l0mdt_ttc) is
    variable v_data : l0mdt_ttc;
  begin
    READ(L, v_data.bcr);
    READ(L, v_data.ocr);
    READ(L, v_data.ecr);
    READ(L, v_data.l0a);
    READ(L, v_data.l1a);
  end READ;

  procedure READ( L:inout LINE; VALUE: out l0mdt_control) is
    variable v_data : l0mdt_control;
  begin
    READ(L, v_data.clk);
    READ(L, v_data.rst);
    READ(L, v_data.bx);
  end READ;

end mdttp_textio;
