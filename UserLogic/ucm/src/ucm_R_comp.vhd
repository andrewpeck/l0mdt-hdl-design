--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Phi radius extractor
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

entity ucm_R_comp is
  generic(
    g_STATION_RADIUS      : integer := 0; 
    g_OUTPUT_WIDTH        : integer := SLC_Z_RPC_LEN
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic;
    --
    i_phimod      : in std_logic_vector(UCM_PHIMOD_LEN -1 downto 0);
    --
    o_radius      : out std_logic_vector(g_OUTPUT_WIDTH - 1 downto 0);
    o_data_valid  : out std_logic
  );
end entity ucm_R_comp;

architecture beh of ucm_R_comp is
  
begin
  
  
  
end architecture beh;