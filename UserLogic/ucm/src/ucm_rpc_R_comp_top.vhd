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

entity ucm_rpc_R_comp is
  generic(
    g_MODE                : string := "RPC";
    -- g_STATION_RADIUS      : integer := 0; 
    -- g_STATION_LAYER       : integer := 0; -- only for RPC
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
    i_dv          : in std_logic;
    --
    o_radius      : out ucm_rpc_r_bus_at(4 - 1 downto 0);
    o_dv          : out std_logic
  );
end entity ucm_rpc_R_comp;

architecture beh of ucm_rpc_R_comp is

  signal ctrl_r : UCM_R_COMP_CTRL_t;
  signal mon_r  : UCM_R_COMP_MON_t;

  signal dv : std_logic_vector(3 downto 0) := (others => '0');

  type mon_avt is array (0 to 3)of std_logic_vector(len(mon_r) -1 downto 0);
  signal mon_av  : mon_avt;
 
begin

  mon_v <= vectorify(mon_r,mon_v);
  ctrl_r <= structify(ctrl_v,ctrl_r);

  -- mon_v <= mon_av(0) when ctrl_r.ext_ctrl =  '1' and ctrl

  RPC_R : entity ucm_lib.ucm_rpc_R_comp_top
    generic map(
      g_MODE =>  "RPC",
      g_OUTPUT_WIDTH => SLC_Z_RPC_LEN
    )
    port map(
      clk         => clk,
      rst         => local_rst,
      ena         => ena,
      --
      ctrl_v      => ctrl_v,
      mon_v       => mon_av(0),
      --
      i_phimod    => i_phimod,
      i_dv        => i_dv,
      --
      o_radius    => o_radius(0),
      o_dv        => dv(0);
  );

  o_dv <= and_reduce(dv);

end architecture beh;