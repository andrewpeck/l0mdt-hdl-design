--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Tube Address Remap
--  Description: link information to tube mapper 
--
--------------------------------------------------------------------------------
--  Revisions: 
--    v0  - 2020.11.30 creation
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

use shared_lib.detector_param_pkg.all;

package detector_mapping_pkg is

  constant MAX_NUM_ELEMENTS : integer := 3;
  constant MAX_CH_TDC : integer := 24;
  constant MAX_TDC_CSM : integer := 18;
  
  -- type geodata_t is array(MAX_NUM_ELEMENTS -1 downto 0) of integer; --(chamber,layer,tube)
  -- type tdc_map_t is array(MAX_CH_TDC - 1 downto 0) of integer;
  -- type csm_map_t is array(MAX_TDC_POLMUX - 1 downto 0) of tdc_map_t;
  -- type polmux_map_t is array(MAX_TDC_POLMUX -1 downto 0) of csm_map_t;
  -- type mapping_tar_t is array(range integer <>) of polmux_map_t;

  -- constant sec3b_inn : mapping_tar_t() :=(
  --   X"000" => (0,0,0),
  -- );



end package detector_mapping_pkg;

