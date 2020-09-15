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
-- use shared_lib.vhdl2008_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

library ult_tp_list;
use ult_tp_list.gldl_ult_tp_sim_pkg.all;

package gldl_l0mdt_textio_pkg is

  procedure READ(L:inout LINE; VALUE : out input_tar_rt);

  procedure READ(L:inout LINE; VALUE : out slc_rx_rt);

  -- procedure READ(L:inout LINE; VALUE : out TDC_rt);
  -- procedure WRITE(L:inout LINE; VALUE : in TDC_rt);

end gldl_l0mdt_textio_pkg;


package body gldl_l0mdt_textio_pkg is

  -----------------------------------------------
  -- read TAR 
  -----------------------------------------------  
  procedure READ(L:inout LINE; VALUE : out input_tar_rt) is
    variable global_time  : integer;
    variable tdc_time     : integer;
    -- variable space        : string(8 downto 1);
    -- variable c_Station    : string(1 downto 1);
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
    READ(L, tdc_time);
    READ(L, tube_global);
    READ(L, tube_local);
    READ(L, tube_layer);
    READ(L, Chamber);
    -- READ(L, space); -- in string we need to read spaces before
    -- READ(L, c_Station);
    READ(L, i_station);
    READ(L, tube_z);
    READ(L, tube_rho);
    READ(L, tube_radius);

    -- if c_station = "I" then 
    --   i_station := 0;
    -- elsif c_station = "M" then 
    --   i_station := 1;
    -- elsif c_station = "O" then 
    --   i_station := 2;
    -- else
    --   i_station := 3;
    -- end if;

    VALUE := (
      global_time => to_unsigned(global_time,64),
      Station => to_unsigned(i_Station,8),
      Chamber => to_unsigned(chamber,SLC_CHAMBER_LEN),
      tar => (  
        tube => to_unsigned(tube_global,MDT_TUBE_LEN),
        layer => to_unsigned(tube_layer,MDT_LAYER_LEN),
        chamber_ieta => to_unsigned(chamber,SLC_CHAMBER_LEN),
        time => to_unsigned(tdc_time,MDT_TIME_LEN),
        data_valid => '1'
      )
    );

    report "##### HIT : " & integer'image(BCID) &
    " - " & integer'image(global_time) &
    " - " & integer'image(tube_global) &
    " - " & integer'image(tube_local) &
    " - " & integer'image(tube_layer) &
    " - " & integer'image(Chamber) &
    " - " & integer'image(i_station) &
    -- " - " & c_station &
    " - " & integer'image(tube_z) &
    " - " & integer'image(tube_rho) &
    " - " & integer'image(tube_radius);

  end procedure;

  -----------------------------------------------
  -- read SLC 
  -----------------------------------------------  
  procedure READ(L:inout LINE; VALUE : out slc_rx_rt) is
    variable BCID        : integer; 
    variable ToA         : integer; 
    variable nTC         : integer; 
    variable TC_sent     : integer; 
    variable TC_id       : integer; 
    variable Eta         : integer; 
    variable Phi         : integer; 
    variable pT_thr      : integer; 
    variable Charge      : integer; 
    variable Coincidence : integer; 
    variable z_RPC0      : integer; 
    variable z_RPC1      : integer; 
    variable z_RPC2      : integer; 
    variable z_RPC3      : integer; 


  begin
    READ(L,BCID        );
    READ(L,ToA         );
    READ(L,nTC         );
    READ(L,TC_sent     );
    READ(L,TC_id       );
    READ(L,Eta         );
    READ(L,Phi         );
    READ(L,pT_thr      );
    READ(L,Charge      );
    READ(L,Coincidence );
    READ(L,z_RPC0      );
    READ(L,z_RPC1      );
    READ(L,z_RPC2      );
    READ(L,z_RPC3      );

    VALUE := (
      BCID        => to_unsigned(BCID       , SL_HEADER_BCID_LEN) , 
      ToA         => to_unsigned(ToA        , 64) , 
      nTC         => to_unsigned(nTC        , SL_HEADER_NSLC_LEN) , 
      TC_sent     => to_unsigned(TC_sent    , SL_HEADER_NMTC_SL_LEN) , 
      TC_id       => to_unsigned(TC_id      , SL_HEADER_NSLC_LEN) , 
      Eta         => to_signed(Eta          , SLC_COMMON_POSETA_LEN) , 
      Phi         => to_unsigned(Phi        , SLC_COMMON_POSPHI_LEN) , 
      pT_thr      => to_unsigned(pT_thr     , SLC_COMMON_SL_PTTHRESH_LEN) , 
      Charge      => std_logic_vector(to_unsigned(Charge     ,1))(0), 
      Coincidence => to_unsigned(Coincidence,SLC_COMMON_COINTYPE_LEN) , 
      z_RPC0      => to_signed(z_RPC0     ,SLC_BARREL_RPC0_POSZ_LEN) , 
      z_RPC1      => to_signed(z_RPC1     ,SLC_BARREL_RPC1_POSZ_LEN) , 
      z_RPC2      => to_signed(z_RPC2     ,SLC_BARREL_RPC2_POSZ_LEN) , 
      z_RPC3      => to_signed(z_RPC3     ,SLC_BARREL_RPC3_POSZ_LEN) , 
      dv          => '1'
    );

    report "##### SLC : " & integer'image(BCID) &
    " - " & integer'image(ToA) &
    " - " & integer'image(nTC) &
    " - " & integer'image(TC_sent) &
    " - " & integer'image(TC_id) &
    " - " & integer'image(Eta) &
    " - " & integer'image(Phi) &
    " - " & integer'image(pT_thr) &
    " - " & integer'image(Charge) &
    " - " & integer'image(Coincidence) &
    " - " & integer'image(z_RPC0) &
    " - " & integer'image(z_RPC1) &
    " - " & integer'image(z_RPC2) &
    " - " & integer'image(z_RPC3);
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
