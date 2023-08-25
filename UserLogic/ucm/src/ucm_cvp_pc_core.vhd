--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: src
-- File: ucm_cvp_pc_core.vhd
-- Module: <<moduleName>>
-- File PATH: /ucm_cvp_pc_core.vhd
-- -----
-- File Created: Thursday, 17th August 2023 9:14:01 am
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Thursday, 17th August 2023 9:14:36 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_misc.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
use shared_lib.detector_param_pkg.all;
use shared_lib.vhdl2008_functions_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;
use ucm_lib.ucm_vhdl_pkg.all;


entity ucm_cvp_pc_core is
  generic(
    g_STATION_RADIUS      : integer := 0;  --station 
    g_NUM_RPC_LAYERS      : integer := 4;
    g_INPUT_RESOLUTION    : real := 1.0;
    g_OUTPUT_RESOLUTION   : real := 1.0;
    g_OUTPUT_WIDTH        : integer := 10;
    g_DIV_IP_R2_EN        : std_logic := '1';
    g_DIV_VU_EN           : std_logic := '1';
    g_DIV_SEL             : string := "IPR2";
    g_DATA_SET_VERSION    : string := "v1"
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic;
    --
    i_cointype    : in std_logic_vector(SLC_COMMON_COINTYPE_LEN-1 downto 0);
    i_data_v      : in std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
    i_data_valid  : in std_logic;
    --
    i_rpc_R_a     : in ucm_rpc_r_alt(g_NUM_RPC_LAYERS -1 downto 0);
    i_rpc_R_dv    : in std_logic;
    i_mdt_R_a     : in std_logic_vector(UCM_Z_ROI_LEN-1 downto 0);
    i_mdt_R_dv    : in std_logic;

    o_offset      : out signed(31 downto 0);--signed(126 -1 downto 0);
    o_slope       : out signed(31 downto 0);--signed((SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);
    o_data_valid  : out std_logic;

    o_vec_z_pos     : out unsigned(UCM2HPS_VEC_POS_LEN-1 downto 0);
    o_vec_z_pos_dv  : out std_logic
    
  );
end entity ucm_cvp_pc_core;

architecture beh of ucm_cvp_pc_core is

  signal rpc_a : rpc_art;
  signal rad_a : rad_art;

  signal set_data_dv : std_logic;
  
begin

  data_set : if g_DATA_SET_VERSION = "v1" generate
    DATA_SET_ENT : entity ucm_lib.ucm_cvp_pc_setdata
      generic map(
        g_NUM_RPC_LAYERS => g_NUM_RPC_LAYERS
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => ena,
        --
        i_rpc_R_a   => i_rpc_R_a ,
        i_rpc_R_dv  => i_rpc_R_dv,
        i_mdt_R_a   => i_mdt_R_a ,
        i_mdt_R_dv  => i_mdt_R_dv,
        --
        o_rpc_a       => rpc_a,
        o_rad_a         => rad_a,
        o_set_data_dv   => set_data_dv 
      );
  
 end generate;


end architecture beh;

