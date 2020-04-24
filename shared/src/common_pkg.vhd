-- --------------------------------------------------------------------------------
-- --  UMass , Physics Department
-- --  Guillermo Loustau de Linares
-- --  gloustau@cern.ch
-- --  
-- --  Project: ATLAS L0MDT Trigger 
-- --  Module:
-- --  Description:
-- --
-- --------------------------------------------------------------------------------
-- --  Revisions:
-- --    05/02/2020  0.1  File created
-- --------------------------------------------------------------------------------

-- library ieee;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use ieee.math_real.all;

-- library l0mdt_lib;
-- use l0mdt_lib.mdttp_constants_pkg.all;
-- use l0mdt_lib.mdttp_types_pkg.all;
-- -- use df_lib.mdttp_functions_pkg.all;

-- library shared_lib;
-- use shared_lib.cfg_pkg.all;

-- package common_pkg is

-- --------------------------------------------------------------------------------
-- -- CONSTANTS
-- --------------------------------------------------------------------------------
--   -- delay constants
--   constant LATENCY_HPS_CH : integer := 10;

--   -- mdt interface
--   constant numTDCs_lpGBT  : integer := 9; 
--   constant numlpGBTs_mux  : integer := 2; 
--   constant numInputs_mux  : integer := numlpGBTs_mux * numTDCs_lpGBT; 

--   -- mdt constants
--   constant mdt_layer_max  : integer := 10;
--   constant MDT_LAYER_WIDTH  : integer := integer(log2(real(mdt_layer_max)));
--   constant mdt_tube_max   : integer := 435;
--   constant MDT_TUBE_WIDTH  : integer := integer(log2(real(mdt_tube_max)));

--   constant MDT_LE_TIME   : integer := 17;
--   -- MDT hit coordinates constants
--   -- constant x_width                : integer := 14;
--   -- constant x_mult                 : real    := 16.0;
--   constant MDT_Z_WIDTH              : integer := 14;
--   -- constant z_mult                 : real    := 16.0;
--   -- constant r_width                : integer := 9;
--   -- constant r_mult                 : real    := 32.0;
--   -- constant r_over_z_multi_width   : integer := integer(log2(r_mult/z_mult));

--   --SLc constants
--   -- Header
--   -- constant BCID_WIDTH               : integer := 12;
  
--   -- data
--   -- constant SLC_TCID_WIDTH           : integer := 2;
--   -- constant mbar_multi             : real    := 1024.0;
--   -- constant mbar_multi_width       : integer := integer(log2(mbar_multi));
--   constant SLC_PHI_WIDTH            : integer := 9;
--   -- constant phi_range              : real    := 0.6; 
--   -- constant phi_mult               : real    := real(2**phi_width)/phi_range;
--   constant SLC_ETA_WIDTH            : integer := 12;
--   -- constant eta_range              : real    := 0.6;
--   -- constant eta_mult               : real    := 2.0**eta_width/eta_range;
--   constant SLC_PT_THRES_WIDTH       : integer := 4;
--   -- barrel
--   constant SLC_B_COIN_WIDTH         : integer := 4;
--   constant SLC_B_RESERVED           : integer := 8;
--   constant SLC_B_ZRPC_WIDTH           : integer := 10;
--   -- constant z_roi_width            : integer := 19;
--   -- constant r_roi_width            : integer := 19;
--   -- constant chamber_id_width       : integer := 3;
--   --endcap

--   -- segment finders
--   constant MDT_R_WIIDTH             : integer := 9;
--   -- CSF
--   constant SLC_MBAR_WIDTH           : integer := 12;
--   constant CSF_X_WIDTH              : integer := 14;
--   constant CSF_Z_WIDTH              : integer := 14;

--   -- LE
--   constant le_x_width    : integer := 14;
--   constant le_y_width    : integer := 14;
--   -- constant le_r_width    : integer := 9;


-- --------------------------------------------------------------------------------
-- --  sub types
-- --------------------------------------------------------------------------------
-- -- Sector Logic candidates
--     subtype SLc_BCID_st is unsigned(11 downto 0);
--     constant null_SLc_BCID_st : SLc_BCID_st := (others => '0');

--     subtype SLc_zpos_st is signed(9 downto 0); 
--     subtype SLc_phi_st is std_logic_vector(8 downto 0);

-- -- MDT hits
--     subtype mdt_time_le_st is unsigned(MDT_LE_TIME -1 downto 0);   -- 0.78 ns resolution
--     subtype mdt_time_pw_st is unsigned(7 downto 0);      -- 0.78 ns resolution
--     -- subtype mdt_time_full is unsigned(21 downto 0);     -- 0.78 ns resolution


-- --------------------------------------------------------------------------------
-- --  LOGIC PORTS TYPES
-- --------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------
-- -- -- data from muon candidate
-- -- -- header 32 bits
-- --   type SLc_header_rt is record
-- --     BCID        : SLc_BCID_st;
-- --     num_TCs     : integer range 0 to 7;
-- --     num_mTCs    : integer range 0 to 7;
-- --     reserved    : std_logic_vector(13 downto 0);
-- --   end record;
-- -- -- trailer 32 bits
-- --   type SLc_trailer_rt is record
-- --     Comma        : std_logic_vector(7 downto 0);
-- --     Board_ID     : integer range 0 to ((2**6)-1);
-- --     Fiber_ID     : integer range 0 to ((2**4)-1);
-- --     CRC          : std_logic_vector(7 downto 0);
-- --     reserved     : std_logic_vector(5 downto 0);
-- --   end record;

-- --   -- SLc barrel
-- --   type SLc_b_data_rt is record
-- --     ID              : std_logic_vector(SLC_TCID_WIDTH - 1 downto 0);
-- --     tc_2_mdttp      : std_logic;
-- --     pos_etha        : unsigned(SLC_ETA_WIDTH -1 downto 0);
-- --     pos_phi         : unsigned(SLC_PHI_WIDTH -1 downto 0);
-- --     pt_threshold    : std_logic_vector(SLC_PT_THRES_WIDTH - 1 downto 0);
-- --     charge          : std_logic;
-- --     coin_type       : std_logic_vector(SLC_B_COIN_WIDTH - 1 downto 0);
-- --     Z_rpc0          : unsigned(SLC_B_ZRPC_WIDTH - 1 downto 0);
-- --     Z_rpc1          : unsigned(SLC_B_ZRPC_WIDTH - 1 downto 0);
-- --     Z_rpc2          : unsigned(SLC_B_ZRPC_WIDTH - 1 downto 0);
-- --     Z_rpc3          : unsigned(SLC_B_ZRPC_WIDTH - 1 downto 0);
-- --     reserved        : std_logic_vector(SLC_B_RESERVED - 1 downto 0);
-- --   end record;


-- -- -- full packet record
-- --   type SLc_b_packet_rt is record
-- --     header_r    : SLc_header_rt;
-- --     data_r      : SLc_b_data_rt;
-- --     tail_r      : SLc_trailer_rt;
-- --   end record;

-- --   subtype st_muoncandidate_data is std_logic_vector(191 downto 0);

-- -- -- useful muon candidate data
-- --   type muCand_data_rt is record
-- --     data : std_logic_vector(31 downto 0);
-- --   end record;

--   --------------------------------------------------------------------------------
--   --  SL_PREPRO
--   --------------------------------------------------------------------------------
--   constant SLC_SLCID_WIDTH              : integer    := 2;
--   constant SLC_SLID_WIDTH               : integer    := 6;
--   constant BCID_WIDTH                   : integer    := 12;
--   constant SLC_MUID_WIDTH               : integer    := 20;

--   type slc_muid_rt is record
--     slcid                               : std_logic_vector(SLC_SLCID_WIDTH-1 downto 0);
--     slid                                : std_logic_vector(SLC_SLID_WIDTH-1 downto 0);
--     bcid                                : std_logic_vector(BCID_WIDTH-1 downto 0);
--   end record;

--   subtype slc_muid_vt is std_logic_vector(SLC_MUID_WIDTH-1 downto 0);

--   function vectorify(d: slc_muid_rt) return slc_muid_vt;
--   function recordify(v: slc_muid_vt) return slc_muid_rt;

--   constant SLC_TCID_WIDTH               : integer    := 2;
--   constant SLC_TCSENT_WIDTH             : integer    := 1;
--   constant SLC_POS_ETA_WIDTH            : integer    := 15;
--   constant SLC_POS_ETA_MULT             : real       := 0.0;
--   constant SLC_POS_PHI_WIDTH            : integer    := 9;
--   constant SLC_POS_PHI_MULT             : real       := 0.0;
--   constant SLC_PT_TH_WIDTH              : integer    := 4;
--   constant SLC_CHARGE_WIDTH             : integer    := 1;
--   constant SLC_COMMON_WIDTH             : integer    := 32;

--   type slc_common_rt is record
--     tcid                                : std_logic_vector(SLC_TCID_WIDTH-1 downto 0);
--     tcsent                              : std_logic_vector(SLC_TCSENT_WIDTH-1 downto 0);
--     pos_eta                             : signed(SLC_POS_ETA_WIDTH-1 downto 0);
--     pos_phi                             : unsigned(SLC_POS_PHI_WIDTH-1 downto 0);
--     pt_th                               : std_logic_vector(SLC_PT_TH_WIDTH-1 downto 0);
--     charge                              : std_logic_vector(SLC_CHARGE_WIDTH-1 downto 0);
--   end record;

--   subtype slc_common_vt is std_logic_vector(SLC_COMMON_WIDTH-1 downto 0);

--   function vectorify(d: slc_common_rt) return slc_common_vt;
--   function recordify(v: slc_common_vt) return slc_common_rt;
--   --------------------------------------------------------------------------------
--   constant PL_DESTSL_WIDTH              : integer    := 2;
--   constant PL_PHIMOD_WIDTH              : integer    := 8;
--   constant PL_MDTID_WIDTH               : integer    := 6;
--   constant PL_COMMON_WIDTH              : integer    := 34;

--   type pl_common_rt is record
--     destsl                              : std_logic_vector(PL_DESTSL_WIDTH-1 downto 0);
--     phi_mod                             : signed(PL_PHIMOD_WIDTH-1 downto 0);
--     mdtid_inn                           : std_logic_vector(PL_MDTID_WIDTH-1 downto 0);
--     mdtid_mid                           : std_logic_vector(PL_MDTID_WIDTH-1 downto 0);
--     mdtid_out                           : std_logic_vector(PL_MDTID_WIDTH-1 downto 0);
--     mdtid_ext                           : std_logic_vector(PL_MDTID_WIDTH-1 downto 0);
--   end record;

--   subtype pl_common_vt is std_logic_vector(PL_COMMON_WIDTH-1 downto 0);

--   function vectorify(d: pl_common_rt) return pl_common_vt;
--   function recordify(v: pl_common_vt) return pl_common_rt;
--   --------------------------------------------------------------------------------
--   constant SLC_SPARE_WIDTH              : integer    := 8;
--   constant SLC_COIN_TYPE_WIDTH          : integer    := 3;
--   constant SLC_Z_RPC_WIDTH              : integer    := 10;
--   -- constant SLC_Z_RPC_MULT               : real       := 0;
--   constant SLC_BARREL_WIDTH             : integer    := SLC_COIN_TYPE_WIDTH + 4 * SLC_Z_RPC_WIDTH;

--   type slc_barrel_rt is record
--     spare_bits                          : std_logic_vector(SLC_SPARE_WIDTH-1 downto 0);
--     coin_type                           : std_logic_vector(SLC_COIN_TYPE_WIDTH-1 downto 0);
--     z_rpc0                              : signed(SLC_Z_RPC_WIDTH-1 downto 0);
--     z_rpc1                              : signed(SLC_Z_RPC_WIDTH-1 downto 0);
--     z_rpc2                              : signed(SLC_Z_RPC_WIDTH-1 downto 0);
--     z_rpc3                              : signed(SLC_Z_RPC_WIDTH-1 downto 0);
--   end record;

--   constant SLC_SPECIFIC_WIDTH           : integer    := 51;
--   subtype slc_barrel_vt is std_logic_vector(SLC_SPECIFIC_WIDTH-1 downto 0);

--   -- function vectorify(d: slc_barrel_rt) return slc_barrel_vt;
--   -- function recordify(v: slc_barrel_vt) return slc_barrel_rt;

--   -- type slc_prepro_rt is record
--   --   muid                                : slc_muid_rt;
--   --   common                              : slc_common_rt;
--   --   pl_common                           : pl_common_rt;
--   --   specific                            : std_logic_vector(SLC_SPECIFIC_WIDTH-1 downto 0);
--   --   data_valid                          : std_logic;
--   -- end record;
--   -- constant SLC_PREPRO_LEN : integer := SLC_MUID_WIDTH + SLC_COMMON_WIDTH + PL_COMMON_WIDTH + SLC_SPECIFIC_WIDTH + 1;
--   -- subtype slc_prepro_vt is std_logic_vector(SLC_PREPRO_LEN-1 downto 0);
--   -- type slc_prepro_art is array (integer range <>) of slc_prepro_rt;
--   -- type slc_prepro_avt is array (integer range <>) of slc_prepro_vt;

--   -- function slc_prepro_vectorify(d: slc_prepro_rt) return slc_prepro_vt;
--   function recordify(v: slc_prepro_vt) return slc_prepro_rt;

-- --------------------------------------------------------------------------------

--   type pipeline_rt is record
--     muid                                : slc_muid_rt;
--     common                              : slc_common_rt;
--     pl_common                           : pl_common_rt;
--     specific                            : std_logic_vector(SLC_SPECIFIC_WIDTH-1 downto 0);
--     process_ch                          : std_logic_vector(3 downto 0);
--     processed                           : std_logic;
--     data_valid                          : std_logic;
--   end record;
--   constant PIPELINE_WIDTH : integer := SLC_PREPRO_LEN + 5;
--   subtype pipeline_vt is std_logic_vector(PIPELINE_WIDTH-1 downto 0);
--   type pipeline_art is array (integer range <>) of pipeline_rt;
--   type pipeline_avt is array (integer range <>) of pipeline_vt;
--   function vectorify(d: pipeline_rt) return pipeline_vt;
--   -- function pipeline_recordify(v: pipeline_vt) return pipeline_rt;
-- --------------------------------------------------------------------------------
-- -- data from TAR to hit extraction input fifo
--     -- type tar2hec_data_rt is record
--     --     multilayer  : integer;
--     --     layer       : integer;
--     --     tube        : integer;
--     --     lead_edge   : std_logic_vector(16 downto 0);
--     --     pulse_width : std_logic_vector(7 downto 0); 
--     -- end record;

-- -- data types and records for hit processing block
    
--   -- muon candidate procesor to tube range LUT
--   type tube_range_config_rt is record
--     data_valid  : std_logic;
--   end record;

--   type muon_candidate_info_rt is record
--     mc_time : integer;
--     mc_origin : std_logic_vector(13 downto 0);
--   end record;

-- --------------------------------------------------------------------------------
-- --  LOGIC INTERBLOCK TYPES
-- --------------------------------------------------------------------------------
--   -- ucm pam 2 hps
  
--   type ucm2heg_pam_rt is record
--     addr    : std_logic_vector(3 downto 0);
--     sel     : std_logic;
--   end record;
--   type ucm2heg_pam_art is array(integer range <>) of ucm2heg_pam_rt;
--   --------------------------------------------------------------------------------
--   -- ucm slc 2 hps
--   type ucm2heg_barrel_rt is record --from TAR & PC
--     z           : signed(SLC_B_ZRPC_WIDTH - 1 downto 0);          -- 10 bits
--     z_0         : signed(SLC_B_ZRPC_WIDTH - 1 downto 0);          -- 10 bits
--     phi         : signed(SLC_PHI_WIDTH - 1 downto 0); 
--     mbar        : signed(SLC_MBAR_WIDTH - 1 downto 0);
--   end record;
--   constant null_ucm_slc_barrel_rt : ucm2heg_barrel_rt := ((others => '0'),(others => '0'),(others => '0'),(others => '0'));
--   constant UCM2HE_BARREL_STDST_WIDTH : integer := 2*SLC_B_ZRPC_WIDTH + SLC_PHI_WIDTH + SLC_MBAR_WIDTH;
--   subtype ucm2heg_barrel_stdst is std_logic_vector(UCM2HE_BARREL_STDST_WIDTH-1 downto 0);
--   function ucm2heg_barrel_f_r2std(inputrecord : in ucm2heg_barrel_rt	) return ucm2heg_barrel_stdst;
--   function ucm2heg_barrel_f_std2rt(inputvector : in ucm2heg_barrel_stdst  ) return ucm2heg_barrel_rt;
--   --
--   type ucm2heg_slc_rt is record
--     BCID        : unsigned(BCID_WIDTH -1 downto 0);          -- 12 bits
--     barrel      : ucm2heg_barrel_rt; --barrel_ucm_t(ST_nBARREL_ENDCAP downto 0);
--     -- endcap      : hp_SLc_endcap_rt; --endcap_ucm_t(ST_nBARREL_ENDCAP downto 1);
--     data_valid  : std_logic;
--   end record;
--   constant null_ucm2heg_slc_rt : ucm2heg_slc_rt := (null_SLc_BCID_st,null_ucm_slc_barrel_rt,'0');
--   type ucm2heg_slc_art is array (integer range <>) of ucm2heg_slc_rt;

--   constant UCM2HEG_SLC_STDST_WIDTH : integer := UCM2HE_BARREL_STDST_WIDTH + BCID_WIDTH + 1;
--   subtype ucm2heg_slc_stdst is std_logic_vector(UCM2HEG_SLC_STDST_WIDTH downto 0);
--   type ucm2heg_slc_astdst is array(integer range <>) of ucm2heg_slc_stdst;
--   function ucm2heg_slc_f_r2std(	inputrecord : in ucm2heg_slc_rt	) return ucm2heg_slc_stdst;
--   function ucm2heg_slc_f_std2rt(inputvector : in ucm2heg_slc_stdst  ) return ucm2heg_slc_rt;
--   --------------------------------------------------------------------------------
--   -- SLC data to hps
--   -- subtype ucm2heg_data_stdst is std_logic_vector(100 downto 0);
--   -- type ucm2heg_slc_astdst is array (integer range <>) of ucm2heg_data_stdst;
--   type ucm2hps_slc_avt is array (integer range <>) of ucm2heg_slc_astdst(MAX_NUM_HEG -1 downto 0);
--   --------------------------------------------------------------------------------
--   -- SLC data to pipeline
--   type slcproc_pipe_barrel_astdst is array (integer range <>) of SLCPROC_PIPE_BARREL_at;
--   --------------------------------------------------------------------------------
--   -- mdt from tar
--   type tar2heg_mdt_rt is record
--     layer           : unsigned(MDT_LAYER_WIDTH -1 downto 0);
--     tube            : unsigned(MDT_TUBE_WIDTH - 1 downto 0);
--     time_le         : unsigned(MDT_LE_TIME -1 downto 0);
--   end record;
--   type tar2heg_mdt_art is array(integer range <>) of tar2heg_mdt_rt;
--   subtype tar2heg_mdt_stdst is std_logic_vector((MDT_LAYER_WIDTH + MDT_TUBE_WIDTH + MDT_LE_TIME -1) downto 0 );
--   type tar2heg_mdt_astdt is array(integer range <>) of tar2heg_mdt_stdst;
--   function tar2heg_mdt_f_r2std(	inputrecord : in tar2heg_mdt_rt	) return tar2heg_mdt_stdst;
--   function tar2heg_mdt_f_std2rt(inputvector : in tar2heg_mdt_stdst  ) return tar2heg_mdt_rt;
  
--   -- sf 2 pt
--   type hps2pt_sf_rt is record

--     data_valid : std_logic;
--   end record;
--   type hps2pt_sf_art is array(integer range <>) of hps2pt_sf_rt;
--   subtype hps2pt_sf_stdst is std_logic_vector(1 downto 0 );
--   type hps2pt_sf_astdst is array(integer range <>) of hps2pt_sf_stdst;



-- end package common_pkg;

-- package body common_pkg is
--   --------------------------------------------------------------------------------
--   -- muid
--   function vectorify(d: slc_muid_rt) return slc_muid_vt is
--     variable v: slc_muid_vt;
--   begin
--     v :=  d.slcid &  d.slid &  d.bcid;
--     return v;
--   end function;
--   function recordify(v: slc_muid_vt) return slc_muid_rt is
--     variable d: slc_muid_rt;
--   begin
--     d.slcid := v(SLC_SLCID_WIDTH + SLC_SLID_WIDTH + BCID_WIDTH - 1 downto SLC_SLID_WIDTH + BCID_WIDTH);
--     d.slid := v(SLC_SLID_WIDTH + BCID_WIDTH-1 downto BCID_WIDTH);
--     d.bcid := v(BCID_WIDTH-1 downto 0);
--     return d;
--   end function;
--   --------------------------------------------------------------------------------
--   -- slc_common
--   function vectorify(d: slc_common_rt) return slc_common_vt is
--     variable v: slc_common_vt;
--   begin
--     v :=  d.tcid & d.tcsent &  std_logic_vector(d.pos_eta) & std_logic_vector(d.pos_phi) &  d.pt_th &  d.charge;
--     return v;
--   end function;
--   function recordify(v: slc_common_vt) return slc_common_rt is
--     variable d: slc_common_rt;
--   begin
--     d.tcid    := v( SLC_TCID_WIDTH + SLC_TCSENT_WIDTH + SLC_POS_ETA_WIDTH + SLC_POS_PHI_WIDTH + SLC_PT_TH_WIDTH + SLC_CHARGE_WIDTH -1 downto SLC_TCSENT_WIDTH + SLC_POS_ETA_WIDTH + SLC_POS_PHI_WIDTH + SLC_PT_TH_WIDTH + SLC_CHARGE_WIDTH);
--     d.tcsent  := v( SLC_TCSENT_WIDTH + SLC_POS_ETA_WIDTH + SLC_POS_PHI_WIDTH + SLC_PT_TH_WIDTH + SLC_CHARGE_WIDTH -1 downto SLC_POS_ETA_WIDTH + SLC_POS_PHI_WIDTH + SLC_PT_TH_WIDTH + SLC_CHARGE_WIDTH);
--     d.pos_eta := signed(v( SLC_POS_ETA_WIDTH + SLC_POS_PHI_WIDTH + SLC_PT_TH_WIDTH + SLC_CHARGE_WIDTH -1 downto SLC_POS_PHI_WIDTH + SLC_PT_TH_WIDTH + SLC_CHARGE_WIDTH));
--     d.pos_phi := unsigned(v( SLC_POS_PHI_WIDTH + SLC_PT_TH_WIDTH + SLC_CHARGE_WIDTH -1 downto SLC_PT_TH_WIDTH + SLC_CHARGE_WIDTH));
--     d.pt_th   := v( SLC_PT_TH_WIDTH + SLC_CHARGE_WIDTH -1 downto SLC_CHARGE_WIDTH);
--     d.charge  := v(SLC_CHARGE_WIDTH -1 downto 0);
--     return d;
--   end function;
--   --------------------------------------------------------------------------------
--   -- pl_common
--   function vectorify(d: pl_common_rt) return pl_common_vt is
--     variable v: pl_common_vt;
--   begin
--     v :=  d.destsl &  std_logic_vector(d.phi_mod) & d.mdtid_inn  & d.mdtid_mid &  d.mdtid_out &  d.mdtid_ext;
--     return v;
--   end function;
--   --
--   function recordify(v: pl_common_vt) return pl_common_rt is
--     variable d: pl_common_rt;
--   begin
--     d.destsl    := v(PL_DESTSL_WIDTH + PL_PHIMOD_WIDTH + 4*PL_MDTID_WIDTH -1 downto PL_PHIMOD_WIDTH + 4*PL_MDTID_WIDTH);
--     d.phi_mod   := signed( v( PL_PHIMOD_WIDTH + 4*PL_MDTID_WIDTH -1 downto 4*PL_MDTID_WIDTH));
--     d.mdtid_inn := v(4*PL_MDTID_WIDTH -1 downto 3*PL_MDTID_WIDTH);
--     d.mdtid_mid := v(3*PL_MDTID_WIDTH -1 downto 2*PL_MDTID_WIDTH);
--     d.mdtid_out := v(2*PL_MDTID_WIDTH -1 downto PL_MDTID_WIDTH);
--     d.mdtid_ext := v(PL_MDTID_WIDTH -1 downto 0);
--     return d;
--   end function;
--   --------------------------------------------------------------------------------
--   -- slc_prepro
--   function recordify(v: slc_prepro_vt) return slc_prepro_rt is
--     variable d: slc_prepro_rt;
--   begin
--     d.muid := recordify(slc_muid_vt(v(SLC_SPECIFIC_WIDTH + SLC_COMMON_WIDTH + PL_COMMON_WIDTH + SLC_MUID_WIDTH downto SLC_SPECIFIC_WIDTH + SLC_COMMON_WIDTH + PL_COMMON_WIDTH + 1)));
--     d.common := recordify(v(SLC_SPECIFIC_WIDTH + SLC_COMMON_WIDTH + PL_COMMON_WIDTH downto PL_COMMON_WIDTH + SLC_SPECIFIC_WIDTH + 1));
--     d.pl_common := recordify(v(SLC_SPECIFIC_WIDTH + PL_COMMON_WIDTH downto SLC_SPECIFIC_WIDTH + 1));
--     d.specific := v(SLC_SPECIFIC_WIDTH downto 1);
--     d.data_Valid := v(0);
--     return d;
--   end function;
--   -- pipeline
--   function vectorify(d: pipeline_rt) return pipeline_vt is
--     variable v: pipeline_vt;
--   begin
--     if not ST_nBARREL_ENDCAP then
--       -- d := (others => '0');
--     else
      
--     end if;
--     v(SLC_MUID_WIDTH + SLC_COMMON_WIDTH + PL_COMMON_WIDTH + SLC_SPECIFIC_WIDTH + 4 + 2 - 1 downto SLC_COMMON_WIDTH + PL_COMMON_WIDTH + SLC_SPECIFIC_WIDTH + 4 + 2) := vectorify(d.muid);
--     v(SLC_COMMON_WIDTH + PL_COMMON_WIDTH + SLC_SPECIFIC_WIDTH + 4 + 2 - 1 downto PL_COMMON_WIDTH + SLC_SPECIFIC_WIDTH + 4 + 2) := vectorify(d.common); --
--     v(PL_COMMON_WIDTH + SLC_SPECIFIC_WIDTH + 4 + 2 - 1 downto SLC_SPECIFIC_WIDTH + 4 + 2) := vectorify(d.pl_common); -- 85..57
--     v(SLC_SPECIFIC_WIDTH + 4 + 2 - 1 downto 4 + 2) := d.specific; -- 56..6
--     v(4 + 2 -1 downto 2) := d.process_ch; -- 5..2
--     v(1) := d.processed; -- 1
--     v(0) := d.data_Valid; -- 0
--     return v;
--   end function;


--   -- slc from ucm
--   function ucm2heg_barrel_f_r2std(	i_rec : in ucm2heg_barrel_rt	) return ucm2heg_barrel_stdst is
--     variable o_vec : ucm2heg_barrel_stdst;
--   begin
--     o_vec := std_logic_vector(i_rec.z) & std_logic_vector(i_rec.z_0) & 
--     std_logic_vector(i_rec.phi) & std_logic_vector(i_rec.mbar); 
--     return o_vec;
--   end function;

--   function ucm2heg_barrel_f_std2rt(i_vec : in ucm2heg_barrel_stdst  ) return ucm2heg_barrel_rt is
--     variable o_rec : ucm2heg_barrel_rt;
--   begin
--     o_rec.z     := signed(i_vec(2*SLC_B_ZRPC_WIDTH + SLC_PHI_WIDTH -1 downto SLC_B_ZRPC_WIDTH + SLC_PHI_WIDTH + SLC_MBAR_WIDTH));
--     o_rec.z_0   := signed(i_vec(SLC_B_ZRPC_WIDTH + SLC_PHI_WIDTH - 1 downto SLC_PHI_WIDTH + SLC_MBAR_WIDTH));
--     o_rec.phi   := signed(i_vec(SLC_PHI_WIDTH - 1 downto SLC_MBAR_WIDTH));
--     o_rec.mbar  := signed(i_vec(SLC_MBAR_WIDTH - 1 downto 0));
--     return o_rec;
--   end function;
--   --
--   function ucm2heg_slc_f_r2std(	i_rec : in ucm2heg_slc_rt	) return ucm2heg_slc_stdst is
--     variable o_vec : ucm2heg_slc_stdst;
--   begin
--     o_vec := std_logic_vector(i_rec.BCID) & ucm2heg_barrel_f_r2std(i_rec.barrel) & i_rec.data_valid;
--     return o_vec;
--   end function;
--   function ucm2heg_slc_f_std2rt(i_vec : in ucm2heg_slc_stdst  ) return ucm2heg_slc_rt is
--     variable o_rec : ucm2heg_slc_rt;
--   begin
--     o_rec.BCID := UNSIGNED(i_vec(UCM2HEG_SLC_STDST_WIDTH -1 downto UCM2HE_BARREL_STDST_WIDTH + 1 ));
--     o_rec.barrel := ucm2heg_barrel_f_std2rt(i_vec(UCM2HE_BARREL_STDST_WIDTH downto 1));
--     o_rec.data_valid := i_vec(0);
--     return o_rec;
--   end function;
--   -- mdt from tar
--   function tar2heg_mdt_f_r2std(	i_rec : in tar2heg_mdt_rt	) return tar2heg_mdt_stdst is
--     variable o_vec : tar2heg_mdt_stdst;
--   begin
--     o_vec := std_logic_vector(i_rec.layer) & std_logic_vector(i_rec.tube) & std_logic_vector(i_rec.time_le);
--     return o_vec;
--   end function;
--   function tar2heg_mdt_f_std2rt(i_vec : in tar2heg_mdt_stdst  ) return tar2heg_mdt_rt is
--     variable o_rec : tar2heg_mdt_rt;
--   begin
--     o_rec.layer   := unsigned(i_vec(MDT_LAYER_WIDTH + MDT_TUBE_WIDTH + MDT_LE_TIME -1 downto MDT_TUBE_WIDTH + MDT_LE_TIME )); 
--     o_rec.tube    := unsigned(i_vec(MDT_TUBE_WIDTH + MDT_LE_TIME -1 downto MDT_LE_TIME));
--     o_rec.time_le := unsigned(i_vec(MDT_LE_TIME -1 downto 0));
--     return o_rec;
--   end function;


-- end package body common_pkg;
