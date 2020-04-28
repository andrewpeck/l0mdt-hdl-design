--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: 
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.cfg_pkg.all;
use shared_lib.common_pkg.all; 

package ucm_pkg is

constant UCM_INPUT_PL_LATENCY : integer := 3;


type ucm_prepro_rt is record
  dummy                           : std_logic;
  muid                            : slc_muid_rt;
  chambers                        : slc_chid_rt;
  common                          : slc_common_rt;
  specific                        : std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);       -- can be either slc_barrel_vt or slc_endcap_vt
  data_valid                      : std_logic;
end record ucm_prepro_rt;

constant SLC_PREPRO_WIDTH : integer := 129;
subtype ucm_prepro_vt is std_logic_vector(SLC_PREPRO_WIDTH-1 downto 0);

function vectorify(d: ucm_prepro_rt) return ucm_prepro_vt;
function recordify(v: ucm_prepro_vt) return ucm_prepro_rt;
function nullify return ucm_prepro_rt;

type ucm_prepro_art is array (integer range <>) of ucm_prepro_rt;
type ucm_prepro_avt is array (integer range <>) of ucm_prepro_vt;

-- type sl2ucm_data_art is array(integer range <>) of sl2ucm_data_rt;
-- constant UCM_CVP_DATA_WIDTH : integer := 1;
-- subtype ucm_cvp_vt is std_logic_vector(UCM_CVP_DATA_WIDTH downto 0);
-- type ucm_cvp_avt is array (integer range <>) of ucm_cvp_vt;
-- type ucm_cvp_aavt is array (integer range <>) of ucm_cvp_avt(MAX_NUM_HPS-1 downto 0);

type ucm_csw_dest is array (integer range <>) of std_logic_Vector(3 downto 0);

type ucm_csw_control_rt is record
  data_present    : std_logic_vector(MAX_NUM_SL -1 downto 0 );
  addr_orig       : ucm_csw_dest(MAX_NUM_SL -1 downto 0 );
end record;

type ucm_pam_control_rt is record
  data_present    : std_logic_vector(MAX_NUM_HEG -1 downto 0 );
  addr_orig       : ucm_csw_dest(MAX_NUM_HEG -1 downto 0 );
end record;

type ucm_proc_info_rt is record
  ch               : std_logic_vector(3 downto 0);
  processed        : std_logic;
end record;

type ucm_proc_info_art is array(integer range <>) of ucm_proc_info_rt;
type ch_count_avt is array(integer range <>) of std_logic_vector(11 downto 0);

end package ucm_pkg;

package body ucm_pkg is
--------------------------------------------------------------------------------
-- FUNCTIONS IMPLEMENTATION
--------------------------------------------------------------------------------
  --------------------------------------------------------------------------------
  -- ucm_prepro_rt
  function nullify return ucm_prepro_rt is
  begin
    return ('0'
            , nullify
            , nullify
            , nullify
            , (others => '0')
            , '0');
  end function nullify;

  function vectorify(d: ucm_prepro_rt) return ucm_prepro_vt is
    variable v : ucm_prepro_vt;
  begin
    v := d.dummy
         & vectorify(d.muid)
         & vectorify(d.chambers)
         & vectorify(d.common)
         & d.specific
         & d.data_valid;
    return v;
  end function vectorify;

  function recordify(v: ucm_prepro_vt) return ucm_prepro_rt is
    variable b : ucm_prepro_rt;
  begin
    b.dummy                := v(128);
    b.muid                 := recordify(v(127 downto 108));
    b.chambers             := recordify(v(107 downto 84));
    b.common               := recordify(v(83 downto 52));
    b.specific             := v(51 downto 1);
    b.data_valid           := v(0);
    return b;
  end function recordify;
  --------------------------------------------------------------------------------
 
end package body ucm_pkg;