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
use shared_lib.interfaces_types_pkg.all;

package hp_pkg is

--------------------------------------------------------------------------------
--  slc window
--------------------------------------------------------------------------------

type SLc_window_layer is array (1 downto 0) of unsigned(MDT_TUBE_WIDTH -1 downto 0);
-- type SLc_window_at is array (integer range <>) of SLc_window_layer;
type SLc_window_at is array (7 downto 0) of SLc_window_layer;
subtype SLc_window_std is std_logic_vector((MDT_TUBE_WIDTH*16)-1 downto 0);

constant null_SLc_window_at : SLc_window_at := (others => (others => (others => '0'))); --to_unsigned(MDT_TUBE_WIDTH,0))
constant null_SLc_window_std : SLc_window_std := (others => '0');

function window_f_a2std(inputrecord : in SLc_window_at) return SLc_window_std;
function window_f_std2a(	inputvector : in SLc_window_std ) return SLc_window_at;
--------------------------------------------------------------------------------
--  slc port
--------------------------------------------------------------------------------

type hp_SLc_barrel_rt is record --from TAR & PC
  z         : SLc_zpos_st;          -- 10 bits
  -- z_0       : SLc_zpos_st;          -- 10 bits
  dummy : std_logic;
end record;
constant null_hp_SLc_barrel_rt : hp_SLc_barrel_rt := ((others => '0'),'0');

type hp_SLc_endcap_rt is record
  -- b_phi       : SLc_phi_st;           -- 9 bits
  -- phi_0     : SLc_phi_st;           -- 9 bits
  data_valid  : std_logic;
end record;

-- type barrel_ucm_t is array (integer range <>) of hp_SLc_barrel_rt;
-- type endcap_ucm_t is array (integer range <>) of hp_SLc_endcap_rt;

type hp_slc_rt is record
  BCID        : SLc_BCID_st;          -- 12 bits
  barrel      : hp_SLc_barrel_rt; --barrel_ucm_t(ST_nBARREL_ENDCAP downto 0);
  -- endcap      : hp_SLc_endcap_rt; --endcap_ucm_t(ST_nBARREL_ENDCAP downto 1);
  data_valid  : std_logic;
end record;
constant null_hp_slc_rt : hp_slc_rt := (null_SLc_BCID_st,null_hp_SLc_barrel_rt,'0');

--------------------------------------------------------------------------------
--  mdt input port
--------------------------------------------------------------------------------
-- data from TAR to hit extraction input fifo
type hp_hit_data_rt is record
  layer           : unsigned(MDT_LAYER_WIDTH -1 downto 0);
  tube            : unsigned(MDT_TUBE_WIDTH - 1 downto 0);
  z               : signed(MDT_Z_WIDTH -1 downto 0);
  time_le_t0s     : unsigned(MDT_LE_TIME -1 downto 0);
  --
  data_valid      : std_logic;
end record;
type hp_hit_data_art is array ( integer range <>) of hp_hit_data_rt;
subtype hp_hit_data_stdst is std_logic_vector((hp_hit_data_rt.layer'length + hp_hit_data_rt.tube'length + hp_hit_data_rt.time_le_t0s'length + 1 ) -1 downto 0);
type hp_hit_data_astdst is array (integer range <>) of hp_hit_data_stdst;
function hp_hit_data_f_r2std(	inputrecord : in hp_hit_data_rt	) return hp_hit_data_stdst;
function hp_hit_data_f_std2rt(inputvector : in hp_hit_data_stdst  ) return hp_hit_data_rt;

--------------------------------------------------------------------------------
--  mdtoutput port
--------------------------------------------------------------------------------

type hp2sf_csf_rt is record
    x : unsigned(CSF_X_WIDTH-1 downto 0);
    z : signed(CSF_Z_WIDTH-1 downto 0);
    -- r : unsigned(csf_r_width-1 downto 0);
end record;
constant null_hp2sf_csf_rt  : hp2sf_csf_rt := ((others => '0'),(others => '0'));
constant HP2SF_CSF_WIDTH    : integer := CSF_X_WIDTH + CSF_Z_WIDTH;
-- type hp_2_sf_lsf_rt is record
--     x : unsigned(le_x_width-1 downto 0);
--     y : unsigned(le_y_width-1 downto 0);
--     -- r : unsigned(le_r_width-1 downto 0);
-- end record;

-- type hp_2_sf_rt is record
--     hit_valid       : std_logic;
--     -- parameters
--     csf             : hp2sf_csf_rt;
--     le              : hp_2_sf_lsf_rt;
-- end record;

-- output to buffer mux
-- type hp2bm_csf_t is array (integer range <>) of hp2sf_csf_rt;
-- type hp2bm_lsf_t is array (integer range <>) of hp_2_sf_lsf_rt;

type hp2bm_sf_rt is record
  r           : unsigned(MDT_R_WIIDTH-1 downto 0);
  csf         : hp2sf_csf_rt; --hp2bm_csf_t(SF_type downto 0);
  -- lsf         : hp_2_sf_lsf_rt; --hp2bm_lsf_t(SF_type downto 1);
end record;
constant null_hp2bm_sf_rt : hp2bm_sf_rt := ((others => '0'),null_hp2sf_csf_rt);

constant HP2BM_SF_WIDTH : integer := MDT_R_WIIDTH + HP2SF_CSF_WIDTH;

type hp2bm_rt is record
  sf_data     : hp2bm_sf_rt; --hp2bm_csf_t(SF_type downto 0);
  -- lsf         : hp2bm_lsf_t(SF_type downto 1);
  mdt_valid   : std_logic;
  data_valid  : std_logic;
end record;
type hp2bm_art is array (integer range <>) of hp2bm_rt;
subtype hp2bm_stdst is std_logic_vector((2 + MDT_R_WIIDTH + CSF_X_WIDTH + CSF_Z_WIDTH) -1  downto 0 );
type hp2bm_astdst is array (integer range <>) of hp2bm_stdst;
function hp2bm_rt_f_r2std(	inputrecord : in hp2bm_rt	) return hp2bm_stdst;
function hp2bm_rt_f_std2rt(inputvector : in hp2bm_stdst  ) return hp2bm_rt;


end package hp_pkg;

package body hp_pkg is
  --------------------------------------------------------------------------------
  -- RoI window functions
  --------------------------------------------------------------------------------
  function window_f_a2std(inputrecord : in SLc_window_at ) return SLc_window_std is
    variable vectorOuput : SLc_window_std;
  begin
    for i in 7 downto 0 loop
      for j in 1 downto 0 loop
        vectorOuput((MDT_TUBE_WIDTH*((i*2) + (j+1)) -1) downto MDT_TUBE_WIDTH*((i*2) + (j)) ) := std_logic_vector(inputrecord(i)(j));
        -- ((MDT_TUBE_WIDTH * (i + 1)*(j + 1)) -1 downto MDT_TUBE_WIDTH * (i +j))
      end loop;
    end loop;
    return vectorOuput;
  end function;

  function window_f_std2a(inputvector : in SLc_window_std ) return SLc_window_at is
    variable outputarray : SLc_window_at;
  begin
    for i in 7 downto 0 loop
      for j in 1 downto 0 loop
        outputarray(i)(j) := unsigned(inputvector((MDT_TUBE_WIDTH * (i + 1)*(j + 1)) -1 downto MDT_TUBE_WIDTH * (i +j)));
      end loop;
    end loop;
    return outputarray;
  end function;
  --------------------------------------------------------------------------------
  -- MDT hits functions
  --------------------------------------------------------------------------------

  function hp_hit_data_f_r2std(	inputrecord : in hp_hit_data_rt ) return hp_hit_data_stdst is
    variable vectorOuput : hp_hit_data_stdst;
  begin
    vectorOuput := std_logic_vector(inputrecord.layer) & 
    std_logic_vector(inputrecord.tube) &
    std_logic_vector(inputrecord.time_le_t0s) &
    inputrecord.data_valid;
    return vectorOuput;
  end function;

	function hp_hit_data_f_std2rt( inputvector : in hp_hit_data_stdst ) return hp_hit_data_rt is
    variable recordOutput : hp_hit_data_rt;
  begin
    recordOutput.layer        := unsigned(inputvector(MDT_LE_TIME + MDT_TUBE_WIDTH + MDT_LAYER_WIDTH downto MDT_LE_TIME + MDT_TUBE_WIDTH + 1));
    recordOutput.tube         := unsigned(inputvector(MDT_LE_TIME + MDT_TUBE_WIDTH downto MDT_LE_TIME + 1));
    recordOutput.time_le_t0s  := unsigned(inputvector(MDT_LE_TIME downto 1));
    recordOutput.data_valid   := inputvector(0);
    return recordOutput;
  end function;


  --------------------------------------------------------------------------------
  -- MDT output functions
  --------------------------------------------------------------------------------

  function hp2bm_rt_f_r2std(i_record : in hp2bm_rt) return hp2bm_stdst is
    variable o_vector : hp2bm_stdst;
  begin
    o_vector := std_logic_vector(i_record.sf_data.r) & 
    std_logic_vector(i_record.sf_data.csf.x) & 
    std_logic_vector(i_record.sf_data.csf.z) & 
    i_record.mdt_valid & i_record.data_valid;
    return o_vector;
  end function;

  function hp2bm_rt_f_std2rt(i_vector : in hp2bm_stdst) return hp2bm_rt is
    variable o_record : hp2bm_rt;
  begin
    o_record.sf_data.r      := unsigned(i_vector(MDT_R_WIIDTH+CSF_X_WIDTH+CSF_Z_WIDTH+2-1 downto CSF_X_WIDTH+CSF_Z_WIDTH+2));
    o_record.sf_data.csf.x  := unsigned(i_vector(CSF_X_WIDTH+CSF_Z_WIDTH+2-1 downto CSF_Z_WIDTH+ 2));
    o_record.sf_data.csf.z  := signed(i_vector(CSF_Z_WIDTH+2-1 downto 2));
    o_record.mdt_valid      := i_vector(1);
    o_record.data_valid     := i_vector(0);
    return o_record;
  end function;

end package body hp_pkg;
