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

library project_lib;
use project_lib.gldl_ult_tp_sim_pkg.all;

package gldl_l0mdt_textio_pkg is

  procedure READ(L:inout LINE; VALUE : out input_tar_rt);

  procedure READ(L:inout LINE; VALUE : out input_slc_b_rt);

  -- procedure READ(L:inout LINE; VALUE : out TDC_rt);
  procedure WRITEHEADER(L:inout LINE; VALUE : in out_heg_bm_hit_sim_rt);
  procedure WRITEHEADER(L:inout LINE; VALUE : in out_heg_bm_slc_sim_rt);

  procedure WRITE(L:inout LINE; VALUE : in out_heg_bm_hit_sim_rt);
  procedure WRITE(L:inout LINE; VALUE : in out_heg_bm_slc_sim_rt);
  procedure WRITE(L:inout LINE; VALUE : in out_heg_bm_ctrl_sim_rt);

end gldl_l0mdt_textio_pkg;


package body gldl_l0mdt_textio_pkg is

  -----------------------------------------------
  -- read TAR 
  -----------------------------------------------  
  procedure READ(L:inout LINE; VALUE : out input_tar_rt) is
    variable mdt_ToA  : integer;
    -- variable tdc_time     : integer;
    -- variable space        : string(8 downto 1);
    -- variable c_Station    : string(1 downto 1);
    variable i_station    : integer;
    variable Chamber_id      : integer;
    variable Chamber_ieta      : integer;
    variable mdt_time_coarse  : integer;
    variable mdt_time_fine  : integer;
    variable tube_global  : integer;
    variable tube_local   : integer;
    variable tube_layer   : integer;
    variable tube_z       : integer;
    variable tube_rho     : integer;
    variable tube_radius  : integer;
    variable event        : integer;

    variable dummy_text  : string(1 to 100);
    variable ok : boolean;

    -- variable
  begin
    READ(L, mdt_ToA);
    READ(L, mdt_time_coarse);
    READ(L, mdt_time_fine);
    READ(L, tube_local);
    READ(L, tube_global);
    READ(L, tube_layer);
    READ(L, Chamber_id);
    READ(L, Chamber_ieta);
    READ(L, i_station);
    READ(L, dummy_text,ok);
    -- READ(L, tube_z);
    -- READ(L, tube_rho);
    -- READ(L, tube_radius);
    -- READ(L, event);

    VALUE := (
      ToA => to_unsigned(mdt_ToA,64),
      Station => to_unsigned(i_Station,8),
      Chamber => to_unsigned(chamber_ieta,SLC_CHAMBER_LEN),
      tar => (  
        tube => to_unsigned(tube_global,MDT_TUBE_LEN),
        layer => to_unsigned(tube_layer,MDT_LAYER_LEN),
        chamber_ieta => to_unsigned(chamber_ieta,SLC_CHAMBER_LEN),
        time => to_unsigned(mdt_time_coarse,TDC_COARSETIME_LEN) & to_unsigned(mdt_time_fine,TDC_COARSETIME_LEN),
        data_valid => '1'
      )
    );

    report "##### HIT : " & integer'image(mdt_ToA) &
    " - " & integer'image(mdt_time_coarse) &
    " - " & integer'image(mdt_time_fine) &
    " - " & integer'image(tube_global) &
    " - " & integer'image(tube_local) &
    " - " & integer'image(tube_layer) &
    " - " & integer'image(Chamber_id) &
    " - " & integer'image(Chamber_ieta) &
    " - " & integer'image(i_station);
    -- " - " & c_station &
    -- " - " & integer'image(tube_z) &
    -- " - " & integer'image(tube_rho) &
    -- " - " & integer'image(tube_radius);

  end procedure;

  -----------------------------------------------
  -- read SLC 
  -----------------------------------------------  
  procedure READ(L:inout LINE; VALUE : out input_slc_b_rt) is
    variable BCID         : integer; 
    variable ToA          : integer; 
    variable nTC          : integer; 
    variable TC_sent      : integer; 
    variable TC_id        : integer; 
    variable Eta          : real; 
    variable Phi          : real; 
    variable pT_thr       : integer; 
    variable Charge       : integer; 
    variable Coincidence  : integer; 
    variable z_RPC0       : integer; 
    variable z_RPC1       : integer; 
    variable z_RPC2       : integer; 
    variable z_RPC3       : integer; 

    variable header       : sl_header_rt;
    variable trailer      : sl_trailer_rt;
    variable common       : slc_common_rt;
    variable specific     : slc_barrel_rt;
    
    variable tcoverflow : std_logic;


  begin
    READ( L , BCID );
    READ( L , ToA );
    READ( L , nTC );
    READ( L , TC_sent );
    READ( L , TC_id );
    READ( L , Eta );
    READ( L , Phi );
    READ( L , pT_thr );
    READ( L , Charge );
    READ( L , Coincidence );
    READ( L , z_RPC0 );
    READ( L , z_RPC1 );
    READ( L , z_RPC2 );
    READ( L , z_RPC3 );

    if nTC > 3 then 
      tcoverflow := '1';
    else
      tcoverflow := '0';
    end if;

    header := (
      h_reserved => (others => '1'),
      tcoverflow => tcoverflow,
      nmtc_sl    => to_unsigned(nTC, SL_HEADER_NSLC_LEN),
      nmtc_mdt   => (others => '1'),
      nslc       => (others => '1'),
      bcid       => to_unsigned(BCID, SL_HEADER_BCID_LEN)
    );

    trailer :=(
      t_reserved => (others => '1'),
      crc        => (others => '1'),
      fiberid    => (others => '1'),
      slid       => (others => '1'),
      comma      => (others => '1')
    );

    common := (
      header      => header,
      slcid       => to_unsigned(TC_id, SL_HEADER_NSLC_LEN),
      tcsent      => std_logic(to_unsigned(TC_sent,1)(0)),
      poseta      => to_signed(integer(Eta * SLC_COMMON_POSETA_MULT), SLC_COMMON_POSETA_LEN) ,
      posphi      => to_unsigned(integer(Phi * SLC_COMMON_POSPHI_MULT), SLC_COMMON_POSPHI_LEN) , 
      sl_pt       => ( others => '0'),
      sl_ptthresh => to_unsigned(pT_thr, SLC_COMMON_SL_PTTHRESH_LEN) , 
      sl_charge   => std_logic(to_unsigned(Charge,1)(0)), 
      cointype    => std_logic_vector(to_unsigned(Coincidence,SLC_COMMON_COINTYPE_LEN)), 
      trailer     => trailer
    );

    specific :=(
      b_reserved  => (others => '0'),
      rpc0_posz   => to_signed(integer(real(z_RPC0) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC0_POSZ_LEN) ,
      rpc1_posz   => to_signed(integer(real(z_RPC1) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC1_POSZ_LEN) ,
      rpc2_posz   => to_signed(integer(real(z_RPC2) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC2_POSZ_LEN) ,
      rpc3_posz   => to_signed(integer(real(z_RPC3) * SLC_Z_RPC_MULT) ,SLC_BARREL_RPC3_POSZ_LEN)
    );

    VALUE := (
      ToA => to_unsigned(ToA , 64) , 
      slc => (
        data_Valid  => '1',
        common      => common,
        specific    => std_logic_vector(vectorify(specific))
      )
    );

    report "##### SLC : " & integer'image(BCID) &
    " - " & integer'image(ToA) &
    " - " & integer'image(nTC) &
    " - " & integer'image(TC_sent) &
    " - " & integer'image(TC_id) &
    " - " & real'image(Eta) &
    " - " & real'image(Phi) &
    " - " & integer'image(pT_thr) &
    " - " & integer'image(Charge) &
    " - " & integer'image(Coincidence) &
    " - " & integer'image(z_RPC0) &
    " - " & integer'image(z_RPC1) &
    " - " & integer'image(z_RPC2) &
    " - " & integer'image(z_RPC3);
  end procedure;

  procedure WRITEHEADER(L:inout LINE; VALUE : in out_heg_bm_hit_sim_rt) is
  begin
    SWRITE(L, "#HIT:",left,12);
    SWRITE(L, "ToA",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "station",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "thread",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "data_valid",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "mlayer",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "localx",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "localy",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "radius",left,12);
  end procedure;
  
  procedure WRITEHEADER(L:inout LINE; VALUE : in out_heg_bm_slc_sim_rt) is
  begin

    SWRITE(L, "#SLC:(FLAG) ",left,12);
    SWRITE(L, "ToA",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "station",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "thread",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "slcid",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "slid",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "bcid",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "mdtseg_dest",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "chamber_id",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "chamber_ieta",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "vec_pos",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "vec_ang",left,12);
    -- WRITE(L, ' ');
    SWRITE(L, "hewindow_pos",left,12);
  end procedure;

  procedure WRITE(L:inout LINE; VALUE : in out_heg_bm_hit_sim_rt) is

    variable ToA      : unsigned(64-1 downto 0);
    variable station  : unsigned(4-1 downto 0);
    variable thread   : unsigned(4-1 downto 0);
    variable mlayer   : std_logic;
    variable localx   : unsigned(HEG2SFHIT_LOCALX_LEN-1 downto 0);
    variable localy   : unsigned(HEG2SFHIT_LOCALY_LEN-1 downto 0);
    variable radius   : unsigned(HEG2SFHIT_RADIUS_LEN-1 downto 0);
    variable data_valid : std_logic;

  begin

    ToA     := VALUE.ToA;
    station := VALUE.station;
    thread  := VALUE.thread;
    data_valid  := VALUE.heg_bm.data_valid;
    mlayer  := VALUE.heg_bm.mlayer;
    localx  := VALUE.heg_bm.localx;
    localy  := VALUE.heg_bm.localy;
    radius  := VALUE.heg_bm.radius;

    SWRITE(L, " HIT: ",left,12);
    WRITE(L, to_integer( ToA),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( station),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( thread),left,12);
    -- WRITE(L, ' ');
    WRITE(L, data_valid,left,12);
    -- WRITE(L, ' ');
    WRITE(L, mlayer,left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( localx),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( localy),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( radius),left,12);

  end procedure;


  procedure WRITE(L:inout LINE; VALUE : in out_heg_bm_slc_sim_rt) is

    variable ToA          : unsigned(64-1 downto 0);
    variable station      : unsigned(4-1 downto 0);
    variable thread       : unsigned(4-1 downto 0);
    variable slcid        : unsigned(SLC_COMMON_SLCID_LEN-1 downto 0);
    variable slid         : unsigned(SL_TRAILER_SLID_LEN-1 downto 0);
    variable bcid         : unsigned(SL_HEADER_BCID_LEN-1 downto 0);
    variable mdtseg_dest  : std_logic_vector(HEG2SFSLC_MDTSEG_DEST_LEN-1 downto 0);
    variable chamber_id   : unsigned(VEC_MDTID_CHAMBER_ID_LEN-1 downto 0);
    variable chamber_ieta : unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
    variable vec_pos      : unsigned(UCM2HPS_VEC_POS_LEN-1 downto 0);
    variable vec_ang      : unsigned(UCM2HPS_VEC_ANG_LEN-1 downto 0);
    variable hewindow_pos : unsigned(HEG2SFSLC_HEWINDOW_POS_LEN-1 downto 0);

  begin

    ToA           := VALUE.ToA;
    station       := VALUE.station;
    thread        := VALUE.thread;
    slcid         := VALUE.heg_bm.muid.slcid;
    slid          := VALUE.heg_bm.muid.slid;
    bcid          := VALUE.heg_bm.muid.bcid;
    mdtseg_dest   := VALUE.heg_bm.mdtseg_dest; 
    chamber_id    := VALUE.heg_bm.mdtid.chamber_id;
    chamber_ieta  := VALUE.heg_bm.mdtid.chamber_ieta;
    vec_pos       := VALUE.heg_bm.vec_pos;
    vec_ang       := VALUE.heg_bm.vec_ang;
    hewindow_pos  := VALUE.heg_bm.hewindow_pos;

    SWRITE(L, " SLC:(SOF) ",left,12);
    WRITE(L, to_integer( ToA),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( station),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( thread),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( slcid),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( slid),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( bcid),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer(unsigned(mdtseg_dest)),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( chamber_id),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( chamber_ieta),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( vec_pos),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( vec_ang),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( hewindow_pos),left,12);

  end procedure;

  procedure WRITE(L:inout LINE; VALUE : in out_heg_bm_ctrl_sim_rt) is

    variable ToA          : unsigned(64-1 downto 0);
    variable station      : unsigned(4-1 downto 0);
    variable thread       : unsigned(4-1 downto 0);
    variable slcid        : unsigned(SLC_COMMON_SLCID_LEN-1 downto 0);
    variable slid         : unsigned(SL_TRAILER_SLID_LEN-1 downto 0);
    variable bcid         : unsigned(SL_HEADER_BCID_LEN-1 downto 0);
    variable mdtseg_dest  : std_logic_vector(HEG2SFSLC_MDTSEG_DEST_LEN-1 downto 0);
    variable chamber_id   : unsigned(VEC_MDTID_CHAMBER_ID_LEN-1 downto 0);
    variable chamber_ieta : unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
    variable vec_pos      : unsigned(UCM2HPS_VEC_POS_LEN-1 downto 0);
    variable vec_ang      : unsigned(UCM2HPS_VEC_ANG_LEN-1 downto 0);
    variable hewindow_pos : unsigned(HEG2SFSLC_HEWINDOW_POS_LEN-1 downto 0);

  begin

    ToA           := VALUE.ToA;
    station       := VALUE.station;
    thread        := VALUE.thread;
    slcid         := VALUE.heg_bm.muid.slcid;
    slid          := VALUE.heg_bm.muid.slid;
    bcid          := VALUE.heg_bm.muid.bcid;
    mdtseg_dest   := VALUE.heg_bm.mdtseg_dest; 
    chamber_id    := VALUE.heg_bm.mdtid.chamber_id;
    chamber_ieta  := VALUE.heg_bm.mdtid.chamber_ieta;
    vec_pos       := VALUE.heg_bm.vec_pos;
    vec_ang       := VALUE.heg_bm.vec_ang;
    hewindow_pos  := VALUE.heg_bm.hewindow_pos;

    SWRITE(L, " SLC:(EOF) ",left,12);
    WRITE(L, to_integer( ToA),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( station),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( thread),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( slcid),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( slid),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( bcid),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer(unsigned(mdtseg_dest)),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( chamber_id),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( chamber_ieta),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( vec_pos),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( vec_ang),left,12);
    -- WRITE(L, ' ');
    WRITE(L, to_integer( hewindow_pos),left,12);

  end procedure;

end gldl_l0mdt_textio_pkg;
