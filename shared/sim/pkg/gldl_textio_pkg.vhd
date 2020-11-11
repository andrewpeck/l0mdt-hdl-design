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

  -- HEG 2 SF
  procedure WRITEHEADER(L:inout LINE; VALUE : in out_heg_bm_hit_sim_rt);
  procedure WRITE(L:inout LINE; VALUE : in out_heg_bm_hit_sim_rt);

  procedure WRITEHEADER(L:inout LINE; VALUE : in out_heg_bm_slc_sim_rt);
  procedure WRITE(L:inout LINE; VALUE : in out_heg_bm_slc_sim_rt);
  procedure WRITE(L:inout LINE; VALUE : in out_heg_bm_ctrl_sim_rt);
  
  -- PT IN
  procedure WRITEHEADER(L:inout LINE; VALUE : in in_pt_pt2sf_sim_rt);
  procedure WRITE(L:inout LINE; VALUE : in in_pt_pt2sf_sim_rt);

  procedure WRITEHEADER(L:inout LINE; VALUE : in in_pt_mpl_sim_rt);
  procedure WRITE(L:inout LINE; VALUE : in in_pt_mpl_sim_rt);




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
        time => to_unsigned((mdt_time_coarse * 25) + mdt_time_fine ,TDC_COARSETIME_LEN + 5), -- & to_unsigned(mdt_time_fine,TDC_COARSETIME_LEN),
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
    -- SWRITE(L, "#");
    -- SWRITE(L, "FLAG");
    SWRITE(L, "ToA");
    WRITE(L, ',');
    SWRITE(L, "station");
    WRITE(L, ',');
    SWRITE(L, "thread");
    WRITE(L, ',');
    SWRITE(L, "data_valid");
    WRITE(L, ',');
    SWRITE(L, "mlayer");
    WRITE(L, ',');
    SWRITE(L, "localx");
    WRITE(L, ',');
    SWRITE(L, "localy");
    WRITE(L, ',');
    SWRITE(L, "radius");
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
    data_valid  := VALUE.data.data_valid;
    mlayer  := VALUE.data.mlayer;
    localx  := VALUE.data.localx;
    localy  := VALUE.data.localy;
    radius  := VALUE.data.radius;

    -- SWRITE(L, " HIT: ");
    -- SWRITE(L, "NONE");
    WRITE(L, to_integer( ToA));
    WRITE(L, ',');
    WRITE(L, to_integer( station));
    WRITE(L, ',');
    WRITE(L, to_integer( thread));
    WRITE(L, ',');
    WRITE(L, data_valid);
    WRITE(L, ',');
    WRITE(L, mlayer);
    WRITE(L, ',');
    WRITE(L, to_integer( localx));
    WRITE(L, ',');
    WRITE(L, to_integer( localy));
    WRITE(L, ',');
    WRITE(L, to_integer( radius));

  end procedure;

  procedure WRITEHEADER(L:inout LINE; VALUE : in out_heg_bm_slc_sim_rt) is
  begin

    SWRITE(L, "ToA");
    WRITE(L, ',');
    SWRITE(L, "FLAG");
    WRITE(L, ',');

    SWRITE(L, "station");
    WRITE(L, ',');
    SWRITE(L, "thread");
    WRITE(L, ',');
    SWRITE(L, "slcid");
    WRITE(L, ',');
    SWRITE(L, "slid");
    WRITE(L, ',');
    SWRITE(L, "bcid");
    WRITE(L, ',');
    SWRITE(L, "mdtseg_dest");
    WRITE(L, ',');
    SWRITE(L, "chamber_id");
    WRITE(L, ',');
    SWRITE(L, "chamber_ieta");
    WRITE(L, ',');
    SWRITE(L, "vec_pos");
    WRITE(L, ',');
    SWRITE(L, "vec_ang");
    WRITE(L, ',');
    SWRITE(L, "hewindow_pos");
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
    slcid         := VALUE.data.muid.slcid;
    slid          := VALUE.data.muid.slid;
    bcid          := VALUE.data.muid.bcid;
    mdtseg_dest   := VALUE.data.mdtseg_dest; 
    chamber_id    := VALUE.data.mdtid.chamber_id;
    chamber_ieta  := VALUE.data.mdtid.chamber_ieta;
    vec_pos       := VALUE.data.vec_pos;
    vec_ang       := VALUE.data.vec_ang;
    hewindow_pos  := VALUE.data.hewindow_pos;

    WRITE(L, to_integer( ToA));
    WRITE(L, ',');
    SWRITE(L, "SOF");
    WRITE(L, ',');
    WRITE(L, to_integer( station));
    WRITE(L, ',');
    WRITE(L, to_integer( thread));
    WRITE(L, ',');
    WRITE(L, to_integer( slcid));
    WRITE(L, ',');
    WRITE(L, to_integer( slid));
    WRITE(L, ',');
    WRITE(L, to_integer( bcid));
    WRITE(L, ',');
    WRITE(L, to_integer(unsigned(mdtseg_dest)));
    WRITE(L, ',');
    WRITE(L, to_integer( chamber_id));
    WRITE(L, ',');
    WRITE(L, to_integer( chamber_ieta));
    WRITE(L, ',');
    WRITE(L, to_integer( vec_pos));
    WRITE(L, ',');
    WRITE(L, to_integer( vec_ang));
    WRITE(L, ',');
    WRITE(L, to_integer( hewindow_pos));

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
    slcid         := VALUE.data.muid.slcid;
    slid          := VALUE.data.muid.slid;
    bcid          := VALUE.data.muid.bcid;
    mdtseg_dest   := VALUE.data.mdtseg_dest; 
    chamber_id    := VALUE.data.mdtid.chamber_id;
    chamber_ieta  := VALUE.data.mdtid.chamber_ieta;
    vec_pos       := VALUE.data.vec_pos;
    vec_ang       := VALUE.data.vec_ang;
    hewindow_pos  := VALUE.data.hewindow_pos;

    WRITE(L, to_integer( ToA));
    WRITE(L, ',');
    SWRITE(L, "EOF");
    WRITE(L, ',');
    WRITE(L, to_integer( station));
    WRITE(L, ',');
    WRITE(L, to_integer( thread));
    WRITE(L, ',');
    WRITE(L, to_integer( slcid));
    WRITE(L, ',');
    WRITE(L, to_integer( slid));
    WRITE(L, ',');
    WRITE(L, to_integer( bcid));
    WRITE(L, ',');
    WRITE(L, to_integer(unsigned(mdtseg_dest)));
    WRITE(L, ',');
    WRITE(L, to_integer( chamber_id));
    WRITE(L, ',');
    WRITE(L, to_integer( chamber_ieta));
    WRITE(L, ',');
    WRITE(L, to_integer( vec_pos));
    WRITE(L, ',');
    WRITE(L, to_integer( vec_ang));
    WRITE(L, ',');
    WRITE(L, to_integer( hewindow_pos));

  end procedure;




  procedure WRITEHEADER(L:inout LINE; VALUE : in in_pt_pt2sf_sim_rt) is
  begin

    -- SWRITE(L, "# ");
    -- SWRITE(L, "FLAG");
    -- WRITE(L, ',');
    SWRITE(L, "ToA");
    WRITE(L, ',');
    SWRITE(L, "station");
    WRITE(L, ',');
    SWRITE(L, "thread");
    WRITE(L, ',');
    SWRITE(L, "slcid");
    WRITE(L, ',');
    SWRITE(L, "slid");
    WRITE(L, ',');
    SWRITE(L, "bcid");
    -- WRITE(L, ',');
    -- SWRITE(L, "mdtseg_dest");
    WRITE(L, ',');
    SWRITE(L, "chamber_id");
    WRITE(L, ',');
    SWRITE(L, "chamber_ieta");
    WRITE(L, ',');
    SWRITE(L, "segpos");
    WRITE(L, ',');
    SWRITE(L, "segangle");
    WRITE(L, ',');
    SWRITE(L, "segquality");
  end procedure;

  procedure WRITE(L:inout LINE; VALUE : in in_pt_pt2sf_sim_rt) is

    variable ToA          : unsigned(64-1 downto 0);
    variable station      : unsigned(4-1 downto 0);
    variable thread       : unsigned(4-1 downto 0);
    variable slcid        : unsigned(SLC_COMMON_SLCID_LEN-1 downto 0);
    variable slid         : unsigned(SL_TRAILER_SLID_LEN-1 downto 0);
    variable bcid         : unsigned(SL_HEADER_BCID_LEN-1 downto 0);
    -- variable mdtseg_dest  : std_logic_vector(HEG2SFSLC_MDTSEG_DEST_LEN-1 downto 0);
    variable chamber_id   : unsigned(VEC_MDTID_CHAMBER_ID_LEN-1 downto 0);
    variable chamber_ieta : unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
    -- variable vec_pos      : unsigned(UCM2HPS_VEC_POS_LEN-1 downto 0);
    -- variable vec_ang      : unsigned(UCM2HPS_VEC_ANG_LEN-1 downto 0);
    -- variable hewindow_pos : unsigned(HEG2SFSLC_HEWINDOW_POS_LEN-1 downto 0);
    variable segpos       : unsigned(SF2PTCALC_SEGPOS_LEN-1 downto 0);
    variable segangle     : unsigned(SF2PTCALC_SEGANGLE_LEN-1 downto 0);
    variable segquality   : std_logic;

  begin

    ToA           := VALUE.ToA;
    station       := VALUE.station;
    thread        := VALUE.thread;
    slcid         := VALUE.data.muid.slcid;
    slid          := VALUE.data.muid.slid;
    bcid          := VALUE.data.muid.bcid;
    -- mdtseg_dest   := VALUE.data.mdtseg_dest; 
    chamber_id    := VALUE.data.mdtid.chamber_id;
    chamber_ieta  := VALUE.data.mdtid.chamber_ieta;
    segpos        := VALUE.data.segpos;
    segangle      := VALUE.data.segangle;
    segquality    := VALUE.data.segquality;


    WRITE(L, to_integer( ToA));
    WRITE(L, ',');
    WRITE(L, to_integer( station));
    WRITE(L, ',');
    WRITE(L, to_integer( thread));
    WRITE(L, ',');
    WRITE(L, to_integer( slcid));
    WRITE(L, ',');
    WRITE(L, to_integer( slid));
    WRITE(L, ',');
    WRITE(L, to_integer( bcid));
    WRITE(L, ',');
    -- WRITE(L, to_integer(unsigned(mdtseg_dest)));
    -- WRITE(L, ',');
    WRITE(L, to_integer( chamber_id));
    WRITE(L, ',');
    WRITE(L, to_integer( chamber_ieta));
    WRITE(L, ',');
    WRITE(L, to_integer( segpos));
    WRITE(L, ',');
    WRITE(L, to_integer( segangle));
    WRITE(L, ',');
    WRITE(L, segquality);

  end procedure;

  procedure WRITEHEADER(L:inout LINE; VALUE : in in_pt_mpl_sim_rt) is
  begin

    -- SWRITE(L, "# ");
    -- SWRITE(L, "FLAG");
    -- WRITE(L, ',');
    SWRITE(L, "ToA");
    WRITE(L, ',');
    -- SWRITE(L, "station");
    -- WRITE(L, ',');
    SWRITE(L, "thread");
    WRITE(L, ',');
    SWRITE(L, "slcid");
    WRITE(L, ',');
    SWRITE(L, "slid");
    WRITE(L, ',');
    SWRITE(L, "bcid");
    WRITE(L, ',');
    -- SWRITE(L, "mdtseg_dest");
    -- WRITE(L, ',');
    SWRITE(L, "phimod");
    WRITE(L, ',');
    SWRITE(L, "sl_charge");
    WRITE(L, ',');
    SWRITE(L, "nswseg_poseta");
    WRITE(L, ',');
    SWRITE(L, "nswseg_posphi");
    WRITE(L, ',');
    SWRITE(L, "nswseg_angdtheta");
  end procedure;

  procedure WRITE(L:inout LINE; VALUE : in in_pt_mpl_sim_rt) is

    variable ToA              : unsigned(64-1 downto 0);
    variable station          : unsigned(4-1 downto 0);
    variable thread           : unsigned(4-1 downto 0);
    -- variable busy             : std_logic;
    -- variable process_ch       : std_logic_vector(UCM2PL_PROCESS_CH_LEN-1 downto 0);
    variable slcid            : unsigned(SLC_COMMON_SLCID_LEN-1 downto 0);
    variable slid             : unsigned(SL_TRAILER_SLID_LEN-1 downto 0);
    variable bcid             : unsigned(SL_HEADER_BCID_LEN-1 downto 0);
    variable phimod           : signed(UCM2PL_PHIMOD_LEN-1 downto 0);
    variable sl_charge        : std_logic;
    variable nswseg_poseta    : unsigned(SLC_ENDCAP_NSWSEG_POSETA_LEN-1 downto 0);
    variable nswseg_posphi    : unsigned(SLC_ENDCAP_NSWSEG_POSPHI_LEN-1 downto 0);
    variable nswseg_angdtheta : signed(SLC_ENDCAP_NSWSEG_ANGDTHETA_LEN-1 downto 0);
  

  begin

    ToA               := VALUE.ToA;
    -- station           := VALUE.station;
    thread            := VALUE.thread;
    -- busy          := VALUE.data.busy;
    -- process_ch    := VALUE.data.process_ch;
    slcid             := VALUE.data.muid.slcid;
    slid              := VALUE.data.muid.slid;
    bcid              := VALUE.data.muid.bcid;
    phimod            := VALUE.data.phimod; 
    sl_charge         := VALUE.data.sl_charge;
    nswseg_poseta     := VALUE.data.nswseg_poseta;
    nswseg_posphi     := VALUE.data.nswseg_posphi;
    nswseg_angdtheta  := VALUE.data.nswseg_angdtheta;

    WRITE(L, to_integer( ToA));
    WRITE(L, ',');
    -- WRITE(L, to_integer( station));
    -- WRITE(L, ',');
    WRITE(L, to_integer( thread));
    WRITE(L, ',');
    -- WRITE(L, to_integer( slcid));
    -- WRITE(L, ',');
    -- WRITE(L, to_integer( slcid));
    -- WRITE(L, ',');
    WRITE(L, to_integer( slcid));
    WRITE(L, ',');
    WRITE(L, to_integer( slid));
    WRITE(L, ',');
    WRITE(L, to_integer( bcid));
    WRITE(L, ',');
    -- WRITE(L, to_integer(unsigned(mdtseg_dest)));
    -- WRITE(L, ',');
    WRITE(L, to_integer( phimod));
    WRITE(L, ',');
    WRITE(L, sl_charge);
    WRITE(L, ',');
    WRITE(L, to_integer( nswseg_poseta));
    WRITE(L, ',');
    WRITE(L, to_integer( nswseg_posphi));
    WRITE(L, ',');
    WRITE(L, to_integer( nswseg_angdtheta));

  end procedure;


end gldl_l0mdt_textio_pkg;