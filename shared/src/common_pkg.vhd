--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--  
--  Project: ATLAS L0MDT Trigger 
--  Module:
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--    05/02/2020  0.1  File created
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library l0mdt_lib;
use l0mdt_lib.mdttp_constants_pkg.all;
use l0mdt_lib.mdttp_types_pkg.all;
-- use df_lib.mdttp_functions_pkg.all;

library shared_lib;
use shared_lib.cfg_pkg.all;

package common_pkg is

--------------------------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------------------------
  -- mdt interface
  constant numTDCs_lpGBT  : integer := 9; 
  constant numlpGBTs_mux  : integer := 2; 
  constant numInputs_mux  : integer := numlpGBTs_mux * numTDCs_lpGBT; 

  -- mdt constants
  constant mdt_layer_max  : integer := 10;
  constant MDT_LAYER_WIDTH  : integer := integer(log2(real(mdt_layer_max)));
  constant mdt_tube_max   : integer := 435;
  constant MDT_TUBE_WIDTH  : integer := integer(log2(real(mdt_tube_max)));

  constant MDT_LE_TIME   : integer := 17;
  -- MDT hit coordinates constants
  -- constant x_width                : integer := 14;
  -- constant x_mult                 : real    := 16.0;
  constant MDT_Z_WIDTH              : integer := 14;
  -- constant z_mult                 : real    := 16.0;
  -- constant r_width                : integer := 9;
  -- constant r_mult                 : real    := 32.0;
  -- constant r_over_z_multi_width   : integer := integer(log2(r_mult/z_mult));

  --SLc constants
  -- Header
  constant BCID_WIDTH               : integer := 12;
  
  -- data
  constant SLC_TCID_WIDTH           : integer := 2;
  -- constant mbar_multi             : real    := 1024.0;
  -- constant mbar_multi_width       : integer := integer(log2(mbar_multi));
  constant SLC_PHI_WIDTH            : integer := 9;
  -- constant phi_range              : real    := 0.6; 
  -- constant phi_mult               : real    := real(2**phi_width)/phi_range;
  constant SLC_ETA_WIDTH            : integer := 12;
  -- constant eta_range              : real    := 0.6;
  -- constant eta_mult               : real    := 2.0**eta_width/eta_range;
  constant SLC_PT_THRES_WIDTH       : integer := 4;
  -- barrel
  constant SLC_B_COIN_WIDTH         : integer := 4;
  constant SLC_B_RESERVED           : integer := 8;
  constant SLC_B_ZRPC_WIDTH           : integer := 10;
  -- constant z_roi_width            : integer := 19;
  -- constant r_roi_width            : integer := 19;
  -- constant chamber_id_width       : integer := 3;
  --endcap

  -- segment finders
  constant MDT_R_WIIDTH             : integer := 9;
  -- CSF
  constant SLC_MBAR_WIDTH           : integer := 12;
  constant CSF_X_WIDTH              : integer := 14;
  constant CSF_Z_WIDTH              : integer := 14;

  -- LE
  constant le_x_width    : integer := 14;
  constant le_y_width    : integer := 14;
  -- constant le_r_width    : integer := 9;


--------------------------------------------------------------------------------
--  sub types
--------------------------------------------------------------------------------
-- Sector Logic candidates
    subtype SLc_BCID_st is unsigned(11 downto 0);
    constant null_SLc_BCID_st : SLc_BCID_st := (others => '0');

    subtype SLc_zpos_st is signed(9 downto 0); 
    subtype SLc_phi_st is std_logic_vector(8 downto 0);

-- MDT hits
    subtype mdt_time_le_st is unsigned(MDT_LE_TIME -1 downto 0);   -- 0.78 ns resolution
    subtype mdt_time_pw_st is unsigned(7 downto 0);      -- 0.78 ns resolution
    -- subtype mdt_time_full is unsigned(21 downto 0);     -- 0.78 ns resolution


--------------------------------------------------------------------------------
--  LOGIC PORTS TYPES
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- data from muon candidate
-- header 32 bits
  type SLc_header_rt is record
    BCID        : SLc_BCID_st;
    num_TCs     : integer range 0 to 7;
    num_mTCs    : integer range 0 to 7;
    reserved    : std_logic_vector(13 downto 0);
  end record;
-- trailer 32 bits
  type SLc_trailer_rt is record
    Comma        : std_logic_vector(7 downto 0);
    Board_ID     : integer range 0 to ((2**6)-1);
    Fiber_ID     : integer range 0 to ((2**4)-1);
    CRC          : std_logic_vector(7 downto 0);
    reserved     : std_logic_vector(5 downto 0);
  end record;

  -- SLc barrel
  type SLc_b_data_rt is record
    ID              : std_logic_vector(SLC_TCID_WIDTH - 1 downto 0);
    tc_2_mdttp      : std_logic;
    pos_etha        : unsigned(SLC_ETA_WIDTH -1 downto 0);
    pos_phi         : unsigned(SLC_PHI_WIDTH -1 downto 0);
    pt_threshold    : std_logic_vector(SLC_PT_THRES_WIDTH - 1 downto 0);
    charge          : std_logic;
    coin_type       : std_logic_vector(SLC_B_COIN_WIDTH - 1 downto 0);
    Z_rpc0          : unsigned(SLC_B_ZRPC_WIDTH - 1 downto 0);
    Z_rpc1          : unsigned(SLC_B_ZRPC_WIDTH - 1 downto 0);
    Z_rpc2          : unsigned(SLC_B_ZRPC_WIDTH - 1 downto 0);
    Z_rpc3          : unsigned(SLC_B_ZRPC_WIDTH - 1 downto 0);
    reserved        : std_logic_vector(SLC_B_RESERVED - 1 downto 0);
  end record;


-- full packet record
  type SLc_b_packet_rt is record
    header_r    : SLc_header_rt;
    data_r      : SLc_b_data_rt;
    tail_r      : SLc_trailer_rt;
  end record;

  subtype st_muoncandidate_data is std_logic_vector(191 downto 0);

-- useful muon candidate data
  type muCand_data_rt is record
      data : std_logic_vector(31 downto 0);
  end record;


  constant SLPREPRO_WIDTH : integer := SLC_MUID_LEN + SLC_COMMON_LEN + 80 +1;
  subtype slprepro_data_stdst is std_logic_vector(SLPREPRO_WIDTH -1 downto 0);
  type slprepro_data_astdst is array ( integer range <>) of slprepro_data_stdst;

  -- constant UCM_DATA_WIDTH : integer := 80 +1;
  subtype ucm_pl_data_stdst is std_logic_vector(SLPREPRO_WIDTH -1 downto 0);
  type ucm_pl_data_astdst is array ( integer range <>) of ucm_pl_data_stdst;

--------------------------------------------------------------------------------
-- data from TAR to hit extraction input fifo
    -- type tar2hec_data_rt is record
    --     multilayer  : integer;
    --     layer       : integer;
    --     tube        : integer;
    --     lead_edge   : std_logic_vector(16 downto 0);
    --     pulse_width : std_logic_vector(7 downto 0); 
    -- end record;

-- data types and records for hit processing block
    
  -- muon candidate procesor to tube range LUT
  type tube_range_config_rt is record
    data_valid  : std_logic;
  end record;

  type muon_candidate_info_rt is record
    mc_time : integer;
    mc_origin : std_logic_vector(13 downto 0);
  end record;

--------------------------------------------------------------------------------
--  LOGIC INTERBLOCK TYPES
--------------------------------------------------------------------------------
  -- ucm pam 2 hps
  
  type ucm2heg_pam_rt is record
    addr    : std_logic_vector(3 downto 0);
    sel     : std_logic;
  end record;
  type ucm2heg_pam_art is array(integer range <>) of ucm2heg_pam_rt;
  --------------------------------------------------------------------------------
  -- ucm slc 2 hps
  type ucm2heg_barrel_rt is record --from TAR & PC
    z           : signed(SLC_B_ZRPC_WIDTH - 1 downto 0);          -- 10 bits
    z_0         : signed(SLC_B_ZRPC_WIDTH - 1 downto 0);          -- 10 bits
    phi         : signed(SLC_PHI_WIDTH - 1 downto 0); 
    mbar        : signed(SLC_MBAR_WIDTH - 1 downto 0);
  end record;
  constant null_ucm_slc_barrel_rt : ucm2heg_barrel_rt := ((others => '0'),(others => '0'),(others => '0'),(others => '0'));
  constant UCM2HE_BARREL_STDST_WIDTH : integer := 2*SLC_B_ZRPC_WIDTH + SLC_PHI_WIDTH + SLC_MBAR_WIDTH;
  subtype ucm2heg_barrel_stdst is std_logic_vector(UCM2HE_BARREL_STDST_WIDTH-1 downto 0);
  function ucm2heg_barrel_f_r2std(inputrecord : in ucm2heg_barrel_rt	) return ucm2heg_barrel_stdst;
  function ucm2heg_barrel_f_std2rt(inputvector : in ucm2heg_barrel_stdst  ) return ucm2heg_barrel_rt;
  --
  type ucm2heg_slc_rt is record
    BCID        : unsigned(BCID_WIDTH -1 downto 0);          -- 12 bits
    barrel      : ucm2heg_barrel_rt; --barrel_ucm_t(ST_nBARREL_ENDCAP downto 0);
    -- endcap      : hp_SLc_endcap_rt; --endcap_ucm_t(ST_nBARREL_ENDCAP downto 1);
    data_valid  : std_logic;
  end record;
  constant null_ucm2heg_slc_rt : ucm2heg_slc_rt := (null_SLc_BCID_st,null_ucm_slc_barrel_rt,'0');
  type ucm2heg_slc_art is array (integer range <>) of ucm2heg_slc_rt;

  constant UCM2HEG_SLC_STDST_WIDTH : integer := UCM2HE_BARREL_STDST_WIDTH + BCID_WIDTH + 1;
  subtype ucm2heg_slc_stdst is std_logic_vector(UCM2HEG_SLC_STDST_WIDTH downto 0);
  type ucm2heg_slc_astdst is array(integer range <>) of ucm2heg_slc_stdst;
  function ucm2heg_slc_f_r2std(	inputrecord : in ucm2heg_slc_rt	) return ucm2heg_slc_stdst;
  function ucm2heg_slc_f_std2rt(inputvector : in ucm2heg_slc_stdst  ) return ucm2heg_slc_rt;
  --------------------------------------------------------------------------------
  -- SLC data to hps
  -- subtype ucm2heg_data_stdst is std_logic_vector(100 downto 0);
  -- type ucm2heg_slc_astdst is array (integer range <>) of ucm2heg_data_stdst;
  type ucm2hps_slc_astdst is array (integer range <>) of ucm2heg_slc_astdst(MAX_NUM_HEG -1 downto 0);
  --------------------------------------------------------------------------------
  -- SLC data to pipeline
  type slcproc_pipe_barrel_astdst is array (integer range <>) of SLCPROC_PIPE_BARREL_at;
  --------------------------------------------------------------------------------
  -- mdt from tar
  type tar2heg_mdt_rt is record
    layer           : unsigned(MDT_LAYER_WIDTH -1 downto 0);
    tube            : unsigned(MDT_TUBE_WIDTH - 1 downto 0);
    time_le         : unsigned(MDT_LE_TIME -1 downto 0);
  end record;
  type tar2heg_mdt_art is array(integer range <>) of tar2heg_mdt_rt;
  subtype tar2heg_mdt_stdst is std_logic_vector((MDT_LAYER_WIDTH + MDT_TUBE_WIDTH + MDT_LE_TIME -1) downto 0 );
  type tar2heg_mdt_astdt is array(integer range <>) of tar2heg_mdt_stdst;
  function tar2heg_mdt_f_r2std(	inputrecord : in tar2heg_mdt_rt	) return tar2heg_mdt_stdst;
  function tar2heg_mdt_f_std2rt(inputvector : in tar2heg_mdt_stdst  ) return tar2heg_mdt_rt;
  
  -- sf 2 pt
  type hps2pt_sf_rt is record

    data_valid : std_logic;
  end record;
  type hps2pt_sf_art is array(integer range <>) of hps2pt_sf_rt;
  subtype hps2pt_sf_stdst is std_logic_vector(1 downto 0 );
  type hps2pt_sf_astdst is array(integer range <>) of hps2pt_sf_stdst;



end package common_pkg;

package body common_pkg is
  -- slc from ucm
  function ucm2heg_barrel_f_r2std(	i_rec : in ucm2heg_barrel_rt	) return ucm2heg_barrel_stdst is
    variable o_vec : ucm2heg_barrel_stdst;
  begin
    o_vec := std_logic_vector(i_rec.z) & std_logic_vector(i_rec.z_0) & 
    std_logic_vector(i_rec.phi) & std_logic_vector(i_rec.mbar); 
    return o_vec;
  end function;

  function ucm2heg_barrel_f_std2rt(i_vec : in ucm2heg_barrel_stdst  ) return ucm2heg_barrel_rt is
    variable o_rec : ucm2heg_barrel_rt;
  begin
    o_rec.z     := signed(i_vec(2*SLC_B_ZRPC_WIDTH + SLC_PHI_WIDTH -1 downto SLC_B_ZRPC_WIDTH + SLC_PHI_WIDTH + SLC_MBAR_WIDTH));
    o_rec.z_0   := signed(i_vec(SLC_B_ZRPC_WIDTH + SLC_PHI_WIDTH - 1 downto SLC_PHI_WIDTH + SLC_MBAR_WIDTH));
    o_rec.phi   := signed(i_vec(SLC_PHI_WIDTH - 1 downto SLC_MBAR_WIDTH));
    o_rec.mbar  := signed(i_vec(SLC_MBAR_WIDTH - 1 downto 0));
    return o_rec;
  end function;
  --
  function ucm2heg_slc_f_r2std(	i_rec : in ucm2heg_slc_rt	) return ucm2heg_slc_stdst is
    variable o_vec : ucm2heg_slc_stdst;
  begin
    o_vec := std_logic_vector(i_rec.BCID) & ucm2heg_barrel_f_r2std(i_rec.barrel) & i_rec.data_valid;
    return o_vec;
  end function;
  function ucm2heg_slc_f_std2rt(i_vec : in ucm2heg_slc_stdst  ) return ucm2heg_slc_rt is
    variable o_rec : ucm2heg_slc_rt;
  begin
    o_rec.BCID := UNSIGNED(i_vec(UCM2HEG_SLC_STDST_WIDTH -1 downto UCM2HE_BARREL_STDST_WIDTH + 1 ));
    o_rec.barrel := ucm2heg_barrel_f_std2rt(i_vec(UCM2HE_BARREL_STDST_WIDTH downto 1));
    o_rec.data_valid := i_vec(0);
    return o_rec;
  end function;
  -- mdt from tar
  function tar2heg_mdt_f_r2std(	i_rec : in tar2heg_mdt_rt	) return tar2heg_mdt_stdst is
    variable o_vec : tar2heg_mdt_stdst;
  begin
    o_vec := std_logic_vector(i_rec.layer) & std_logic_vector(i_rec.tube) & std_logic_vector(i_rec.time_le);
    return o_vec;
  end function;
  function tar2heg_mdt_f_std2rt(i_vec : in tar2heg_mdt_stdst  ) return tar2heg_mdt_rt is
    variable o_rec : tar2heg_mdt_rt;
  begin
    o_rec.layer   := unsigned(i_vec(MDT_LAYER_WIDTH + MDT_TUBE_WIDTH + MDT_LE_TIME -1 downto MDT_TUBE_WIDTH + MDT_LE_TIME )); 
    o_rec.tube    := unsigned(i_vec(MDT_TUBE_WIDTH + MDT_LE_TIME -1 downto MDT_LE_TIME));
    o_rec.time_le := unsigned(i_vec(MDT_LE_TIME -1 downto 0));
    return o_rec;
  end function;


end package body common_pkg;
