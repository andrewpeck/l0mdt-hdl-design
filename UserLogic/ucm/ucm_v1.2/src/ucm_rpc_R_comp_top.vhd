--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;

library ctrl_lib;
use ctrl_lib.UCM_CTRL.all;

entity ucm_rpc_R_comp_top is
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
    i_phimod      : in std_logic_vector(UCM_CDE2CVP_PHIMOD_LEN - 1 downto 0); -- 5
    i_dv          : in std_logic;
    --
    o_radius      : out ucm_rpc_r_alt(4 - 1 downto 0);
    o_dv          : out std_logic
  );
end entity ucm_rpc_R_comp_top;

architecture beh of ucm_rpc_R_comp_top is

  signal ctrl_r : UCM_R_PHI_COMP_RPC_CTRL_t;
  signal mon_r  : UCM_R_PHI_COMP_RPC_MON_t;

  signal dv : std_logic_vector(3 downto 0) := (others => '0');

  type mon_avt is array (0 to 3)of std_logic_vector(UCM_R_PHI_COMP_RPC_MON_t'w -1 downto 0);
  signal mon_av  : mon_avt;
  signal mon_null : std_logic_vector(UCM_R_PHI_COMP_RPC_MON_t'w -1 downto 0)  := (others => '0');
 
begin

  -- mon_v <= convert(mon_r,mon_v);
  ctrl_r <= convert(ctrl_v,ctrl_r);

  mon_v <=  mon_av(0) when ctrl_r.ext_ctrl =  '1' and to_integer(unsigned(ctrl_r.sel_station)) = 0 and to_integer(unsigned(ctrl_r.sel_layer)) = 0 else
            mon_av(1) when ctrl_r.ext_ctrl =  '1' and to_integer(unsigned(ctrl_r.sel_station)) = 1 and to_integer(unsigned(ctrl_r.sel_layer)) = 0 else
            mon_av(2) when ctrl_r.ext_ctrl =  '1' and to_integer(unsigned(ctrl_r.sel_station)) = 1 and to_integer(unsigned(ctrl_r.sel_layer)) = 1 else
            mon_av(3) when ctrl_r.ext_ctrl =  '1' and to_integer(unsigned(ctrl_r.sel_station)) = 2 and to_integer(unsigned(ctrl_r.sel_layer)) = 0 else 
            mon_null;

  INN0 : entity ucm_lib.ucm_rpc_R_comp
    generic map(
      g_STATION_RADIUS =>  0,
      g_STATION_LAYER  =>  0,
      g_OUTPUT_WIDTH   => SLC_Z_RPC_LEN
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      --
      ctrl_v      => ctrl_v,
      mon_v       => mon_av(0),
      --
      i_phimod    => i_phimod,
      i_dv        => i_dv,
      --
      o_radius    => o_radius(0),
      o_dv        => dv(0)
  );

  MID0 : entity ucm_lib.ucm_rpc_R_comp
    generic map(
      g_STATION_RADIUS =>  1,
      g_STATION_LAYER  =>  0,
      g_OUTPUT_WIDTH   => SLC_Z_RPC_LEN
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      --
      ctrl_v      => ctrl_v,
      mon_v       => mon_av(1),
      --
      i_phimod    => i_phimod,
      i_dv        => i_dv,
      --
      o_radius    => o_radius(1),
      o_dv        => dv(1)
  );

  MID1 : entity ucm_lib.ucm_rpc_R_comp
    generic map(
      g_STATION_RADIUS =>  1,
      g_STATION_LAYER  =>  1,
      g_OUTPUT_WIDTH   => SLC_Z_RPC_LEN
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      --
      ctrl_v      => ctrl_v,
      mon_v       => mon_av(2),
      --
      i_phimod    => i_phimod,
      i_dv        => i_dv,
      --
      o_radius    => o_radius(2),
      o_dv        => dv(2)
  );

  OUT0 : entity ucm_lib.ucm_rpc_R_comp
    generic map(
      g_STATION_RADIUS =>  2,
      g_STATION_LAYER  =>  0,
      g_OUTPUT_WIDTH   => SLC_Z_RPC_LEN
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      --
      ctrl_v      => ctrl_v,
      mon_v       => mon_av(3),
      --
      i_phimod    => i_phimod,
      i_dv        => i_dv,
      --
      o_radius    => o_radius(3),
      o_dv        => dv(3)
  );

  o_dv <= and_reduce(dv);

end architecture beh;