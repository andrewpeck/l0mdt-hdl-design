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

-- type sl2ucm_data_rt is record

--   data_valid : std_logic;
-- end record;
-- type sl2ucm_data_art is array(integer range <>) of sl2ucm_data_rt;
constant UCM_VP_DATA_WIDTH : integer := 1;
subtype ucm_vp_data_stdst is std_logic_vector(SLC_PREPRO_WIDTH downto 0);
type ucm_vp_data_astdst is array (integer range <>) of ucm_vp_data_stdst;
type ucm_vp_data_aastdst is array (integer range <>) of ucm_vp_data_astdst(MAX_NUM_HPS-1 downto 0);

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
  ch                          : std_logic_vector(3 downto 0);
  processed                           : std_logic;
end record;

type ucm_proc_info_art is array(integer range <>) of ucm_proc_info_rt;



type ch_count_avt is array(integer range <>) of std_logic_vector(11 downto 0);

-- type ucm_csw_control_rt is record
--   data_present                        : std_logic;
--   addr_orig                           : ucm_csw_dest(integer(log2(real(MAX_NUM_SL))) downto 0 );
-- end record;
-- type ucm_csw_control_art is array(integer range <>) of ucm_csw_control_rt;

-- type ucm_pam_control_rt is record
--   data_present                        : std_logic;
--   addr_orig                           : ucm_csw_dest(3 downto 0 );
-- end record;
-- type ucm_pam_control_art is array(integer range <>) of ucm_pam_control_rt;

-- type ucm_proc_info_rt is record
--   process_ch                          : std_logic_vector(3 downto 0);
--   processed                           : std_logic;
-- end record;

-- type ucm_proc_info_art is array(integer range <>) of ucm_proc_info_rt;

-- 

end package ucm_pkg;

package body ucm_pkg is
--------------------------------------------------------------------------------
-- FUNCTIONS IMPLEMENTATION
--------------------------------------------------------------------------------
 
end package body ucm_pkg;