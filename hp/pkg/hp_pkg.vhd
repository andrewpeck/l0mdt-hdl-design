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
--   26/11/2019     0.1     File created
--    05/02/2020    0.11    HP matching parameters added
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all;

package hp_pkg is

  constant HP_DRIFT_TIME_LEN : integer := MDT_TIME_LEN;

  --------------------------------------------------------------------------------
  --  slc window
  --------------------------------------------------------------------------------

  -- type SLc_window_layer is array (1 downto 0) of unsigned(MDT_TUBE_LEN -1 downto 0);
  -- -- type SLc_window_at is array (integer range <>) of SLc_window_layer;
  -- type SLc_window_at is array (7 downto 0) of SLc_window_layer;
  -- subtype SLc_window_std is std_logic_vector((MDT_TUBE_LEN*16)-1 downto 0);

  -- constant null_SLc_window_at : SLc_window_at := (others => (others => (others => '0'))); --to_unsigned(MDT_TUBE_LEN,0))
  -- constant null_SLc_window_std : SLc_window_std := (others => '0');

  -- function window_f_a2std(inputrecord : in SLc_window_at) return SLc_window_std;
  -- function window_f_std2a(	inputvector : in SLc_window_std ) return SLc_window_at;
  type hp_heg2hp_win_layer_st is array(2-1 downto 0) of std_logic_vector(MDT_TUBE_LEN-1 downto 0);
  constant HP_HEG2HP_WIN_LAYER_LEN : integer := 10;
  subtype hp_heg2hp_win_layer_vt is std_logic_vector(HP_HEG2HP_WIN_LAYER_LEN-1 downto 0);
  function vectorify(x: hp_heg2hp_win_layer_st) return hp_heg2hp_win_layer_vt;
  function structify (x: hp_heg2hp_win_layer_vt) return hp_heg2hp_win_layer_st;
  function nullify (x: hp_heg2hp_win_layer_st) return hp_heg2hp_win_layer_st;

  type hp_heg2hp_window_st is array(8-1 downto 0) of hp_heg2hp_win_layer_st;
  constant HP_HEG2HP_WINDOW_LEN : integer := 80;
  subtype hp_heg2hp_window_vt is std_logic_vector(HP_HEG2HP_WINDOW_LEN-1 downto 0);
  function vectorify(x: hp_heg2hp_window_st) return hp_heg2hp_window_vt;
  function structify (x: hp_heg2hp_window_vt) return hp_heg2hp_window_st;
  function nullify (x: hp_heg2hp_window_st) return hp_heg2hp_window_st;
  --------------------------------------------------------------------------------
  --  slc port
  --------------------------------------------------------------------------------
  type hp_heg2hp_slc_b_rt is record
    z_0                        : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    y_0                        : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
  end record hp_heg2hp_slc_b_rt;
  constant HP_HEG2HP_SLC_B_LEN : integer := 38;
  subtype hp_heg2hp_slc_b_vt is std_logic_vector(HP_HEG2HP_SLC_B_LEN-1 downto 0);
  function vectorify(x: hp_heg2hp_slc_b_rt) return hp_heg2hp_slc_b_vt;
  function structify(x: hp_heg2hp_slc_b_vt) return hp_heg2hp_slc_b_rt;
  function nullify (x: hp_heg2hp_slc_b_rt) return hp_heg2hp_slc_b_rt;

  constant HP_HEG2HP_SPECIFIC_LEN : integer := 38;

  type hp_heg2hp_slc_rt is record
    bcid                       : std_logic_vector(BCID_LEN-1 downto 0);
    specific                   : std_logic_vector(HP_HEG2HP_SPECIFIC_LEN-1 downto 0);
    data_valid                 : std_logic;
  end record hp_heg2hp_slc_rt;
  constant HP_HEG2HP_SLC_LEN : integer := 51;
  subtype hp_heg2hp_slc_vt is std_logic_vector(HP_HEG2HP_SLC_LEN-1 downto 0);
  function vectorify(x: hp_heg2hp_slc_rt) return hp_heg2hp_slc_vt;
  function structify(x: hp_heg2hp_slc_vt) return hp_heg2hp_slc_rt;
  function nullify (x: hp_heg2hp_slc_rt) return hp_heg2hp_slc_rt;
  -- type hp_SLc_barrel_rt is record --from TAR & PC
  --   z         : unsigned(SLC_Z_RPC_LEN-1 downto 0);          -- 10 bits
  --   -- z_0       : SLc_zpos_st;          -- 10 bits
  --   dummy : std_logic;
  -- end record;
  -- constant null_hp_SLc_barrel_rt : hp_SLc_barrel_rt := ((others => '0'),'0');

  -- type hp_SLc_endcap_rt is record
  --   -- b_phi       : SLc_phi_st;           -- 9 bits
  --   -- phi_0     : SLc_phi_st;           -- 9 bits
  --   dummy  : std_logic;
  -- end record;

  -- -- type barrel_ucm_t is array (integer range <>) of hp_SLc_barrel_rt;
  -- -- type endcap_ucm_t is array (integer range <>) of hp_SLc_endcap_rt;

  -- type hp_slc_rt is record
  --   BCID        : std_logic_vector(BCID_LEN-1 downto 0);          -- 12 bits
  --   barrel      : hp_SLc_barrel_rt; --barrel_ucm_t(ST_nBARREL_ENDCAP downto 0);
  --   -- endcap      : hp_SLc_endcap_rt; --endcap_ucm_t(ST_nBARREL_ENDCAP downto 1);
  --   data_valid  : std_logic;
  -- end record;
  -- constant null_hp_slc_rt : hp_slc_rt := (null_SLc_BCID_st,null_hp_SLc_barrel_rt,'0');

  --------------------------------------------------------------------------------
  --  mdt input port
  --------------------------------------------------------------------------------
  type hp_hpsPc2hp_rt is record
    tube                       : unsigned(MDT_TUBE_LEN-1 downto 0);
    layer                      : unsigned(MDT_LAYER_LEN-1 downto 0);
    time_t0                    : unsigned(MDT_TIME_LEN-1 downto 0);
    global_z                   : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    global_y                   : unsigned(MDT_GLOBAL_AXI_LEN-1 downto 0);
    data_valid                 : std_logic;
  end record hp_hpsPc2hp_rt;
  constant HP_HPSPC2HP_LEN : integer := 71;
  subtype hp_hpsPc2hp_vt is std_logic_vector(HP_HPSPC2HP_LEN-1 downto 0);
  function vectorify(x: hp_hpsPc2hp_rt) return hp_hpsPc2hp_vt;
  function structify(x: hp_hpsPc2hp_vt) return hp_hpsPc2hp_rt;
  function nullify (x: hp_hpsPc2hp_rt) return hp_hpsPc2hp_rt;
  -- data from TAR to hit extraction input fifo
  -- type hp_hit_data_rt is record
  --   layer           : unsigned(MDT_LAYER_LEN -1 downto 0);
  --   tube            : unsigned(MDT_TUBE_LEN - 1 downto 0);
  --   z               : signed(MDT_Z_LEN -1 downto 0);
  --   time_le_t0s     : unsigned(MDT_LE_TIME -1 downto 0);
  --   --
  --   data_valid      : std_logic;
  -- end record;
  -- type hp_hit_data_art is array ( integer range <>) of hp_hit_data_rt;
  -- subtype hp_hit_data_vt is std_logic_vector((hp_hit_data_rt.layer'length + hp_hit_data_rt.tube'length + hp_hit_data_rt.time_le_t0s'length + 1 ) -1 downto 0);
  -- type hp_hit_data_avt is array (integer range <>) of hp_hit_data_vt;
  -- function hp_hit_data_f_r2std(	inputrecord : in hp_hit_data_rt	) return hp_hit_data_vt;
  -- function hp_hit_data_f_std2rt(inputvector : in hp_hit_data_vt  ) return hp_hit_data_rt;

  --------------------------------------------------------------------------------
  --  mdtoutput port
  --------------------------------------------------------------------------------
  type hp_hp2sf_data_rt is record
    local_z                    : unsigned(MDT_LOCAL_AXI_LEN-1 downto 0);
    local_y                    : signed(MDT_LOCAL_AXI_LEN-1 downto 0);
    radius                     : unsigned(MDT_RADIUS_LEN-1 downto 0);
    layer                      : std_logic_vector(MDT_LAYER_LEN-1 downto 0);
  end record hp_hp2sf_data_rt;
  constant HP_HP2SF_DATA_LEN : integer := 48;
  subtype hp_hp2sf_data_vt is std_logic_vector(HP_HP2SF_DATA_LEN-1 downto 0);
  function vectorify(x: hp_hp2sf_data_rt) return hp_hp2sf_data_vt;
  function structify(x: hp_hp2sf_data_vt) return hp_hp2sf_data_rt;
  function nullify (x: hp_hp2sf_data_rt) return hp_hp2sf_data_rt;

  type hp_hp2bm_rt is record
    data                       : hp_hp2sf_data_rt;
    mdt_valid                  : std_logic;
    data_valid                 : std_logic;
  end record hp_hp2bm_rt;
  constant HP_HP2BM_LEN : integer := 50;
  subtype hp_hp2bm_vt is std_logic_vector(HP_HP2BM_LEN-1 downto 0);
  function vectorify(x: hp_hp2bm_rt) return hp_hp2bm_vt;
  function structify(x: hp_hp2bm_vt) return hp_hp2bm_rt;
  function nullify (x: hp_hp2bm_rt) return hp_hp2bm_rt;
  -- type hp2sf_csf_rt is record
  --     x : unsigned(CSF_X_LEN-1 downto 0);
  --     z : signed(CSF_Z_LEN-1 downto 0);
  --     -- r : unsigned(csf_r_LEN-1 downto 0);
  -- end record;
  -- constant null_hp2sf_csf_rt  : hp2sf_csf_rt := ((others => '0'),(others => '0'));
  -- constant HP2SF_CSF_LEN    : integer := CSF_X_LEN + CSF_Z_LEN;
  -- -- type hp_2_sf_lsf_rt is record
  -- --     x : unsigned(le_x_LEN-1 downto 0);
  -- --     y : unsigned(le_y_LEN-1 downto 0);
  -- --     -- r : unsigned(le_r_LEN-1 downto 0);
  -- -- end record;

  -- -- type hp_2_sf_rt is record
  -- --     hit_valid       : std_logic;
  -- --     -- parameters
  -- --     csf             : hp2sf_csf_rt;
  -- --     le              : hp_2_sf_lsf_rt;
  -- -- end record;

  -- -- output to buffer mux
  -- -- type hp2bm_csf_t is array (integer range <>) of hp2sf_csf_rt;
  -- -- type hp2bm_lsf_t is array (integer range <>) of hp_2_sf_lsf_rt;

  -- type hp2bm_sf_rt is record
  --   r           : unsigned(MDT_R_WIIDTH-1 downto 0);
  --   csf         : hp2sf_csf_rt; --hp2bm_csf_t(SF_type downto 0);
  --   -- lsf         : hp_2_sf_lsf_rt; --hp2bm_lsf_t(SF_type downto 1);
  -- end record;
  -- constant null_hp2bm_sf_rt : hp2bm_sf_rt := ((others => '0'),null_hp2sf_csf_rt);

  -- constant HP2BM_SF_LEN : integer := MDT_R_WIIDTH + HP2SF_CSF_LEN;

  -- type hp2bm_rt is record
  --   sf_data     : hp2bm_sf_rt; --hp2bm_csf_t(SF_type downto 0);
  --   -- lsf         : hp2bm_lsf_t(SF_type downto 1);
  --   mdt_valid   : std_logic;
  --   data_valid  : std_logic;
  -- end record;
  -- type hp2bm_art is array (integer range <>) of hp2bm_rt;
  -- subtype hp2bm_vt is std_logic_vector((2 + MDT_R_WIIDTH + CSF_X_LEN + CSF_Z_LEN) -1  downto 0 );
  -- type hp2bm_avt is array (integer range <>) of hp2bm_vt;
  -- function hp2bm_rt_f_r2std(	inputrecord : in hp2bm_rt	) return hp2bm_vt;
  -- function hp2bm_rt_f_std2rt(inputvector : in hp2bm_vt  ) return hp2bm_rt;


end package hp_pkg;

package body hp_pkg is
  --------------------------------------------------------------------------------
  -- RoI window functions
  --------------------------------------------------------------------------------
  function vectorify(x: hp_heg2hp_win_layer_st) return hp_heg2hp_win_layer_vt is
    variable y : std_logic_vector(x'range);
    variable msb, lsb : integer;
  begin
    l: for i in x'range loop
      msb := i * vectorify(x(i))'length + vectorify(x(i))'left;
      lsb := i * vectorify(x(i))'length;
      y(msb downto lsb) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function structify (x: hp_heg2hp_win_layer_vt) return hp_heg2hp_win_layer_st is
    variable y : hp_heg2hp_win_layer_st;
    variable msb, lsb : integer;
  begin
    l: for i in y'range loop
      msb := i * vectorify(y(i))'length + vectorify(y(i))'left;
      lsb := i * vectorify(y(i))'length;
      y(i) := structify(x(msb downto lsb));
    end loop l;
    return y;
  end function structify;
  function nullify (x: hp_heg2hp_win_layer_st) return hp_heg2hp_win_layer_st is
    variable y : hp_heg2hp_win_layer_st;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: hp_heg2hp_window_st) return hp_heg2hp_window_vt is
    variable y : std_logic_vector(x'range);
    variable msb, lsb : integer;
  begin
    l: for i in x'range loop
      msb := i * vectorify(x(i))'length + vectorify(x(i))'left;
      lsb := i * vectorify(x(i))'length;
      y(msb downto lsb) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function structify (x: hp_heg2hp_window_vt) return hp_heg2hp_window_st is
    variable y : hp_heg2hp_window_st;
    variable msb, lsb : integer;
  begin
    l: for i in y'range loop
      msb := i * vectorify(y(i))'length + vectorify(y(i))'left;
      lsb := i * vectorify(y(i))'length;
      y(i) := structify(x(msb downto lsb));
    end loop l;
    return y;
  end function structify;
  function nullify (x: hp_heg2hp_window_st) return hp_heg2hp_window_st is
    variable y : hp_heg2hp_window_st;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  -- function window_f_a2std(inputrecord : in SLc_window_at ) return SLc_window_std is
  --   variable vectorOuput : SLc_window_std;
  -- begin
  --   for i in 7 downto 0 loop
  --     for j in 1 downto 0 loop
  --       vectorOuput((MDT_TUBE_LEN*((i*2) + (j+1)) -1) downto MDT_TUBE_LEN*((i*2) + (j)) ) := std_logic_vector(inputrecord(i)(j));
  --       -- ((MDT_TUBE_LEN * (i + 1)*(j + 1)) -1 downto MDT_TUBE_LEN * (i +j))
  --     end loop;
  --   end loop;
  --   return vectorOuput;
  -- end function;

  -- function window_f_std2a(inputvector : in SLc_window_std ) return SLc_window_at is
  --   variable outputarray : SLc_window_at;
  -- begin
  --   for i in 7 downto 0 loop
  --     for j in 1 downto 0 loop
  --       outputarray(i)(j) := unsigned(inputvector((MDT_TUBE_LEN * (i + 1)*(j + 1)) -1 downto MDT_TUBE_LEN * (i +j)));
  --     end loop;
  --   end loop;
  --   return outputarray;
  -- end function;
  --------------------------------------------------------------------------------
  -- SLC data functions
  --------------------------------------------------------------------------------
  function vectorify(x: hp_heg2hp_slc_b_rt) return hp_heg2hp_slc_b_vt is
    variable y : hp_heg2hp_slc_b_vt;
  begin
    y(37 downto 19)            := vectorify(x.z_0);
    y(18 downto 0)             := vectorify(x.y_0);
    return y;
  end function vectorify;
  function structify(x: hp_heg2hp_slc_b_vt) return hp_heg2hp_slc_b_rt is
    variable y : hp_heg2hp_slc_b_rt;
  begin
    y.z_0                      := structify(x(37 downto 19));
    y.y_0                      := structify(x(18 downto 0));
    return y;
  end function structify;
  function nullify (x: hp_heg2hp_slc_b_rt) return hp_heg2hp_slc_b_rt is
    variable y : hp_heg2hp_slc_b_rt;
  begin
    y.z_0                      := nullify(x.z_0);
    y.y_0                      := nullify(x.y_0);
    return y;
  end function nullify;


  function vectorify(x: hp_heg2hp_slc_rt) return hp_heg2hp_slc_vt is
    variable y : hp_heg2hp_slc_vt;
  begin
    y(50 downto 39)            := x.bcid;
    y(38 downto 1)             := x.specific;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: hp_heg2hp_slc_vt) return hp_heg2hp_slc_rt is
    variable y : hp_heg2hp_slc_rt;
  begin
    y.bcid                     := x(50 downto 39);
    y.specific                 := x(38 downto 1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: hp_heg2hp_slc_rt) return hp_heg2hp_slc_rt is
    variable y : hp_heg2hp_slc_rt;
  begin
    y.bcid                     := nullify(x.bcid);
    y.specific                 := nullify(x.specific);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  
  --------------------------------------------------------------------------------
  -- MDT hits functions
  --------------------------------------------------------------------------------
  function vectorify(x: hp_hpsPc2hp_rt) return hp_hpsPc2hp_vt is
    variable y : hp_hpsPc2hp_vt;
  begin
    y(70 downto 66)            := vectorify(x.tube);
    y(65 downto 57)            := vectorify(x.layer);
    y(56 downto 39)            := vectorify(x.time_t0);
    y(38 downto 20)            := vectorify(x.global_z);
    y(19 downto 1)             := vectorify(x.global_y);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: hp_hpsPc2hp_vt) return hp_hpsPc2hp_rt is
    variable y : hp_hpsPc2hp_rt;
  begin
    y.tube                     := structify(x(70 downto 66));
    y.layer                    := structify(x(65 downto 57));
    y.time_t0                  := structify(x(56 downto 39));
    y.global_z                 := structify(x(38 downto 20));
    y.global_y                 := structify(x(19 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: hp_hpsPc2hp_rt) return hp_hpsPc2hp_rt is
    variable y : hp_hpsPc2hp_rt;
  begin
    y.tube                     := nullify(x.tube);
    y.layer                    := nullify(x.layer);
    y.time_t0                  := nullify(x.time_t0);
    y.global_z                 := nullify(x.global_z);
    y.global_y                 := nullify(x.global_y);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;
  -- function hp_hit_data_f_r2std(	inputrecord : in hp_hit_data_rt ) return hp_hit_data_vt is
  --   variable vectorOuput : hp_hit_data_vt;
  -- begin
  --   vectorOuput := std_logic_vector(inputrecord.layer) & 
  --   std_logic_vector(inputrecord.tube) &
  --   std_logic_vector(inputrecord.time_le_t0s) &
  --   inputrecord.data_valid;
  --   return vectorOuput;
  -- end function;

	-- function hp_hit_data_f_std2rt( inputvector : in hp_hit_data_vt ) return hp_hit_data_rt is
  --   variable recordOutput : hp_hit_data_rt;
  -- begin
  --   recordOutput.layer        := unsigned(inputvector(MDT_LE_TIME + MDT_TUBE_LEN + MDT_LAYER_LEN downto MDT_LE_TIME + MDT_TUBE_LEN + 1));
  --   recordOutput.tube         := unsigned(inputvector(MDT_LE_TIME + MDT_TUBE_LEN downto MDT_LE_TIME + 1));
  --   recordOutput.time_le_t0s  := unsigned(inputvector(MDT_LE_TIME downto 1));
  --   recordOutput.data_valid   := inputvector(0);
  --   return recordOutput;
  -- end function;


  --------------------------------------------------------------------------------
  -- MDT output functions
  --------------------------------------------------------------------------------
  function vectorify(x: hp_hp2sf_data_rt) return hp_hp2sf_data_vt is
    variable y : hp_hp2sf_data_vt;
  begin
    y(47 downto 33)            := vectorify(x.local_z);
    y(32 downto 18)            := vectorify(x.local_y);
    y(17 downto 9)             := vectorify(x.radius);
    y(8 downto 0)              := x.layer;
    return y;
  end function vectorify;
  function structify(x: hp_hp2sf_data_vt) return hp_hp2sf_data_rt is
    variable y : hp_hp2sf_data_rt;
  begin
    y.local_z                  := structify(x(47 downto 33));
    y.local_y                  := structify(x(32 downto 18));
    y.radius                   := structify(x(17 downto 9));
    y.layer                    := x(8 downto 0);
    return y;
  end function structify;
  function nullify (x: hp_hp2sf_data_rt) return hp_hp2sf_data_rt is
    variable y : hp_hp2sf_data_rt;
  begin
    y.local_z                  := nullify(x.local_z);
    y.local_y                  := nullify(x.local_y);
    y.radius                   := nullify(x.radius);
    y.layer                    := nullify(x.layer);
    return y;
  end function nullify;

  function vectorify(x: hp_hp2bm_rt) return hp_hp2bm_vt is
    variable y : hp_hp2bm_vt;
  begin
    y(49 downto 2)             := vectorify(x.data);
    y(1)                       := x.mdt_valid;
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: hp_hp2bm_vt) return hp_hp2bm_rt is
    variable y : hp_hp2bm_rt;
  begin
    y.data                     := structify(x(49 downto 2));
    y.mdt_valid                := x(1);
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: hp_hp2bm_rt) return hp_hp2bm_rt is
    variable y : hp_hp2bm_rt;
  begin
    y.data                     := nullify(x.data);
    y.mdt_valid                := nullify(x.mdt_valid);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;
  -- function hp2bm_rt_f_r2std(i_record : in hp2bm_rt) return hp2bm_vt is
  --   variable o_vector : hp2bm_vt;
  -- begin
  --   o_vector := std_logic_vector(i_record.sf_data.r) & 
  --   std_logic_vector(i_record.sf_data.csf.x) & 
  --   std_logic_vector(i_record.sf_data.csf.z) & 
  --   i_record.mdt_valid & i_record.data_valid;
  --   return o_vector;
  -- end function;

  -- function hp2bm_rt_f_std2rt(i_vector : in hp2bm_vt) return hp2bm_rt is
  --   variable o_record : hp2bm_rt;
  -- begin
  --   o_record.sf_data.r      := unsigned(i_vector(MDT_R_WIIDTH+CSF_X_LEN+CSF_Z_LEN+2-1 downto CSF_X_LEN+CSF_Z_LEN+2));
  --   o_record.sf_data.csf.x  := unsigned(i_vector(CSF_X_LEN+CSF_Z_LEN+2-1 downto CSF_Z_LEN+ 2));
  --   o_record.sf_data.csf.z  := signed(i_vector(CSF_Z_LEN+2-1 downto 2));
  --   o_record.mdt_valid      := i_vector(1);
  --   o_record.data_valid     := i_vector(0);
  --   return o_record;
  -- end function;

end package body hp_pkg;
