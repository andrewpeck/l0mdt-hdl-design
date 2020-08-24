--------------------------------------------------------------------------------
-- Prototype of functions to convert values to/from text for testbenches
--------------------------------------------------------------------------------
-- original   : Eric Hazen
--      v0.1  : Guillermo   :   added support for TAR

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.some_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

-- library ucm_hps_lib;
-- use ucm_hps_lib.ucm_hps_pkg.all;

package gldl_l0mdt_textio_pkg is

  type input_tar_rt is record
    global_time : unsigned(64-1 downto 0);
    station : unsigned(8-1 downto 0);
    chamber : unsigned(8-1 downto 0);
    tar : tar2hps_rt;
  end record input_tar_rt;

  type tar2hps_tb_at is array(TB_TAR_FIFO_WIDTH-1 downto 0) of tar2hps_rt;

  procedure READ(L:inout LINE; VALUE : out input_tar_rt);

  -- procedure READ(L:inout LINE; VALUE : out TDC_rt);
  -- procedure WRITE(L:inout LINE; VALUE : in TDC_rt);

end gldl_l0mdt_textio_pkg;


package body gldl_l0mdt_textio_pkg is

  -----------------------------------------------
  -- read TAR 
  -----------------------------------------------  
  procedure READ(L:inout LINE; VALUE : out input_tar_rt) is
    variable global_time  : integer;
    variable space        : string(8 downto 1);
    variable c_Station    : string(1 downto 1);
    variable i_station    : integer;
    variable Chamber      : integer;
    variable BCID         : integer;
    variable tube_global  : integer;
    variable tube_local   : integer;
    variable tube_layer   : integer;
    variable tube_z       : integer;
    variable tube_rho     : integer;
    variable tube_radius  : integer;

    -- variable
  begin
    READ(L, BCID);
    READ(L, global_time);
    READ(L, tube_global);
    READ(L, tube_local);
    READ(L, tube_layer);
    READ(L, Chamber);
    READ(L, space); -- in string we need to read spaces before
    READ(L, c_Station);
    READ(L, tube_z);
    READ(L, tube_rho);
    READ(L, tube_radius);

    if c_station = "I" then 
      i_station := 0;
    elsif c_station = "M" then 
      i_station := 1;
    elsif c_station = "O" then 
      i_station := 2;
    else
      i_station := 3;
    end if;

    VALUE := (
      global_time => to_unsigned(global_time,64),
      Station => to_unsigned(i_Station,8),
      Chamber => to_unsigned((chamber - 1),8),
      tar => (  
        tube => to_unsigned(tube_global,MDT_TUBE_LEN),
        layer => to_unsigned(tube_layer,MDT_LAYER_LEN),
        chamber_id => to_unsigned((chamber - 1),8),
        time => to_unsigned(global_time,MDT_TIME_LEN),
        data_valid => '1'
      )
    );

    report "Read line : " & integer'image(BCID) &
    " - " & integer'image(global_time) &
    " - " & integer'image(tube_global) &
    " - " & integer'image(tube_local) &
    " - " & integer'image(tube_layer) &
    " - " & integer'image(Chamber) &
    " - " & c_station &
    " - " & integer'image(tube_z) &
    " - " & integer'image(tube_rho) &
    " - " & integer'image(tube_radius);

  end procedure;

  -----------------------------------------------
  -- read TDC record type as 5 decimal numbers
  -----------------------------------------------
  -- procedure READ(L : inout LINE; VALUE : out TDC_rt) is

  --   variable i_chanid     : integer;
  --   variable i_edgemode   : integer;
  --   variable i_coarsetime : integer;
  --   variable i_finetime   : integer;
  --   variable i_pulsewidth : integer;

  --   variable v_chanid     : std_logic_vector(TDC_CHANID_LEN-1 downto 0);    -- 4
  --   variable v_edgemode   : std_logic_vector(TDC_EDGEMODE_LEN-1 downto 0);  -- 1
  --   variable v_coarsetime : std_logic_vector(TDC_COARSETIME_LEN-1 downto 0);  -- 11
  --   variable v_finetime   : std_logic_vector(TDC_FINETIME_LEN-1 downto 0);  -- 4
  --   variable v_pulsewidth : std_logic_vector(TDC_PULSEWIDTH_LEN-1 downto 0);  -- 7

  --   variable v_SPACE : character;

  -- begin

  --   READ(L, i_chanid);
  --   READ(L, v_SPACE);           -- read in the space character
  --   READ(L, i_edgemode);
  --   READ(L, v_SPACE);
  --   READ(L, i_coarsetime);
  --   READ(L, v_SPACE);
  --   READ(L, i_finetime);
  --   READ(L, v_SPACE);
  --   READ(L, i_pulsewidth);

  --   v_chanid := std_logic_vector( to_unsigned( i_chanid, TDC_CHANID_LEN));
  --   v_edgemode := std_logic_vector( to_unsigned( i_edgemode, TDC_EDGEMODE_LEN));
  --   v_coarsetime := std_logic_vector( to_unsigned( i_coarsetime, TDC_COARSETIME_LEN));
  --   v_finetime := std_logic_vector( to_unsigned( i_finetime, TDC_FINETIME_LEN));
  --   v_pulsewidth := std_logic_vector( to_unsigned( i_pulsewidth, TDC_PULSEWIDTH_LEN));

  --   VALUE := ( chanid => v_chanid,
  --              edgemode => v_edgemode,
  --              coarsetime => v_coarsetime,
  --              finetime => v_finetime,
  --              pulsewidth => v_pulsewidth);
  -- end READ;



  -----------------------------------------------
  -- write TDC record type as 5 decimal numbers
  -----------------------------------------------
  -- procedure WRITE(L:inout LINE; VALUE : in TDC_rt) is

  --   variable v_chanid     : std_logic_vector(TDC_CHANID_LEN-1 downto 0);    -- 4
  --   variable v_edgemode   : std_logic_vector(TDC_EDGEMODE_LEN-1 downto 0);  -- 1
  --   variable v_coarsetime : std_logic_vector(TDC_COARSETIME_LEN-1 downto 0);  -- 11
  --   variable v_finetime   : std_logic_vector(TDC_FINETIME_LEN-1 downto 0);  -- 4
  --   variable v_pulsewidth : std_logic_vector(TDC_PULSEWIDTH_LEN-1 downto 0);  -- 7

  -- begin

  --   v_chanid := VALUE.chanid;
  --   v_edgemode := VALUE.edgemode;
  --   v_coarsetime := VALUE.coarsetime;
  --   v_finetime := VALUE.finetime;
  --   v_pulsewidth := VALUE.pulsewidth;

  --   WRITE(L, to_integer( unsigned(v_chanid)));
  --   WRITE(L, ' ');
  --   WRITE(L, to_integer( unsigned(v_edgemode)));
  --   WRITE(L, ' ');
  --   WRITE(L, to_integer( unsigned(v_coarsetime)));
  --   WRITE(L, ' ');
  --   WRITE(L, to_integer( unsigned(v_finetime)));
  --   WRITE(L, ' ');
  --   WRITE(L, to_integer( unsigned(v_pulsewidth)));

  -- end WRITE;

end gldl_l0mdt_textio_pkg;
