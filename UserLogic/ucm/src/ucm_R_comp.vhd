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

use shared_lib.barrel_R_rpc_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity ucm_R_comp is
  generic(
    g_STATION_RADIUS      : integer := 0; 
    g_STATION_LAYER       : integer := 0; -- only for RPC
    g_OUTPUT_WIDTH        : integer := SLC_Z_RPC_LEN
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic;
    --
    ctrl_v        : in std_logic_vector;
    mon_v         : out std_logic_vector;
    --
    i_phimod      : in std_logic_vector(5 - 1 downto 0);
    --
    o_radius      : out std_logic_vector(g_OUTPUT_WIDTH - 1 downto 0);
    o_data_valid  : out std_logic
  );
end entity ucm_R_comp;

architecture beh of ucm_R_comp is

  signal ctrl_r : UCM_R_COMP_CTRL_t;
  signal mon_r  : UCM_R_COMP_MON_t;
 
  
  signal rad_mem : barrel_R_rpc_avt  := get_barrel_R_rpc(c_SECTOR_ID,c_SECTOR_SIDE,g_STATION_RADIUS,g_STATION_LAYER,SLC_Z_RPC_MULT,32);

begin

  mon_v <= vectorify(mon_r,mon_v);
  ctrl_r <= structify(ctrl_v,ctrl_r);

  process(clk) begin
    if rising_edge(clk) then
      if rst = '1' then
        mon_r  <= nullify(mon_r);
      else
        
      end if;
    end if;
  end process;

end architecture beh;