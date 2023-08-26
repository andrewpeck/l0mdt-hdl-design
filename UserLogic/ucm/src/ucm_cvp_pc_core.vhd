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
    g_NUM_RPC_LAYERS      : integer := 4;
    g_NUM_MDT_LAYERS      : integer := 3;
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
    i_rpc_Z_a     : in rpc_pos_array_t(g_NUM_RPC_LAYERS -1 downto 0);
    i_data_valid  : in std_logic;
    --
    i_rpc_R_a     : in ucm_rpc_r_alt(g_NUM_RPC_LAYERS -1 downto 0);
    i_rpc_R_dv    : in std_logic;
    i_mdt_R_a     : in ucm_mdt_r_alt(g_NUM_MDT_LAYERS-1 downto 0);
    i_mdt_R_dv    : in std_logic;

    o_offset      : out signed(31 downto 0);--signed(126 -1 downto 0);
    o_slope       : out signed(31 downto 0);--signed((SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);
    o_vector_dv  : out std_logic;

    o_vec_z_pos     : out vec_pos_array_t(g_NUM_MDT_LAYERS-1 downto 0);
    o_vec_z_pos_dv  : out std_logic
    
  );
end entity ucm_cvp_pc_core;

architecture beh of ucm_cvp_pc_core is
  
  signal num_h_i : integer;
  signal rpc_Z_a : rpc_pos_art;
  signal rpc_R_a : rpc_rad_art;
  signal set_data_dv : std_logic;

  type mult_zy_art is array ( 0 to 3) of std_logic_vector((SLC_Z_RPC_LEN * 2) - 1 downto 0);
  signal mult_zy    : mult_zy_art;
  signal mult_zy_dv : std_logic_vector(3 downto 0);
  signal mult_zz    : mult_zy_art;
  signal mult_zz_dv : std_logic_vector(3 downto 0);

  signal sum_z      : std_logic_vector(SLC_Z_RPC_LEN + 4 -1 downto 0);
  signal sum_z_dv   : std_logic;
  signal sum_z_pl   : std_logic_vector(SLC_Z_RPC_LEN + 4 -1 downto 0);
  signal sum_z_pl_dv : std_logic;
  signal sum_y      : std_logic_vector(SLC_Z_RPC_LEN + 4 -1 downto 0);
  signal sum_y_sc   : std_logic_vector(27 -1 downto 0);--(4 + sum_y'length -1 downto 0);
  signal sum_y_dv   : std_logic;
  signal sum_zy     : std_logic_vector(SLC_Z_RPC_LEN*2 + 4 -1 downto 0);
  signal sum_zy_dv  : std_logic;
  signal sum_zz     : std_logic_vector(SLC_Z_RPC_LEN*2 + 4 -1 downto 0);
  signal sum_zz_dv  : std_logic;

  signal sqr_zz         : std_logic_vector(sum_z'length*2 -1 downto 0);
  signal sqr_zz_dv      : std_logic;
  signal mult_n_szz     : std_logic_vector(4 + sum_zy'length -1 downto 0);
  signal mult_n_szz_dv  : std_logic;
  signal param_c        : std_logic_vector(max(sqr_zz'length,mult_n_szz'length) -1 downto 0);
  signal param_c_dv     : std_logic;

  signal mult_sy_szz    : std_logic_vector(sum_zz'length + sum_y'length -1 downto 0);
  signal mult_sy_szz_dv : std_logic;
  signal mult_sz_szy    : std_logic_vector(sum_z'length + sum_zy'length -1 downto 0);
  signal mult_sz_szy_dv : std_logic;
  signal param_b        : std_logic_vector(max(mult_sy_szz'length,mult_sz_szy'length) -1 downto 0);
  signal param_b_dv     : std_logic;

  signal mult_n_szy     : std_logic_vector(4 + sum_zy'length -1 downto 0);
  signal mult_n_szy_dv  : std_logic;
  signal mult_sz_sy     : std_logic_vector(sum_z'length + sum_y'length -1 downto 0);
  signal mult_sz_sy_dv  : std_logic;
  signal param_a        : std_logic_vector(max(mult_sz_sy'length,mult_n_szy'length) -1 downto 0);
  signal param_a_dv     : std_logic;

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
        i_cointype  => i_cointype,
        i_rpc_Z_a   => i_rpc_Z_a,
        i_cand_dv   => i_data_valid,

        --
        i_rpc_R_a       => i_rpc_R_a ,
        i_rpc_R_dv      => i_rpc_R_dv,
        -- i_mdt_R_a   => i_mdt_R_a ,
        -- i_mdt_R_dv  => i_mdt_R_dv,
        --
        o_num_h_i       => num_h_i,
        o_rpc_a         => rpc_Z_a,
        o_rad_a         => rpc_R_a,
        o_set_data_dv   => set_data_dv 
      );
  
 end generate;

  SQR_LOOP: for hit_i in 3 downto 0 generate
    MULT_ZY_ENT : entity shared_lib.VU_generic_pipelined_MATH
      generic map(
        g_OPERATION => "*1",
        g_IN_PIPE_STAGES  => 0,
        g_OUT_PIPE_STAGES => 0,
        g_in_A_WIDTH => rpc_Z_a(hit_i)'length,
        g_in_B_WIDTH => rpc_R_a(hit_i)'length,
        g_OUT_WIDTH => 0
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => std_logic_vector(rpc_Z_a(hit_i)),
        i_in_B      => std_logic_vector(rpc_R_a(hit_i)),
        -- i_in_C      => "0",
        -- i_in_D      => "0",
        i_dv        => set_data_dv,
        --
        o_result    => mult_zy(hit_i),
        o_dv        => mult_zy_dv(hit_i)
      );
    MULT_ZZ_ENT : entity shared_lib.VU_generic_pipelined_MATH
      generic map(
        g_OPERATION => "*2",
        g_IN_PIPE_STAGES  => 0,
        g_OUT_PIPE_STAGES => 0,
        g_in_A_WIDTH => rpc_Z_a(hit_i)'length,
        g_in_B_WIDTH => rpc_Z_a(hit_i)'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => std_logic_vector(rpc_Z_a(hit_i)),
        i_in_B      => std_logic_vector(rpc_Z_a(hit_i)),
        -- i_in_C      => "0",
        -- i_in_D      => "0",
        i_dv        => set_data_dv,
        --
        o_result    => mult_zz(hit_i),
        o_dv        => mult_zz_dv(hit_i)
      );
  end generate SQR_LOOP;
    SUM_Z_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "+++",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => rpc_Z_a(0)'length,
      g_in_B_WIDTH => rpc_Z_a(1)'length,
      g_in_C_WIDTH => rpc_Z_a(2)'length,
      g_in_D_WIDTH => rpc_Z_a(3)'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => std_logic_vector(rpc_Z_a(0)),
      i_in_B      => std_logic_vector(rpc_Z_a(1)),
      i_in_C      => std_logic_vector(rpc_Z_a(2)),
      i_in_D      => std_logic_vector(rpc_Z_a(3)),
      i_dv        => set_data_dv,
      --
      o_result    => sum_z,
      o_dv        => sum_z_dv
    );
  SUM_Y_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "+++",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => rpc_R_a(0)'length,
      g_in_B_WIDTH => rpc_R_a(1)'length,
      g_in_C_WIDTH => rpc_R_a(2)'length,
      g_in_D_WIDTH => rpc_R_a(3)'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => std_logic_vector(rpc_R_a(0)),
      i_in_B      => std_logic_vector(rpc_R_a(1)),
      i_in_C      => std_logic_vector(rpc_R_a(2)),
      i_in_D      => std_logic_vector(rpc_R_a(3)),
      i_dv        => set_data_dv,
      --
      o_result    => sum_y,
      o_dv        => sum_y_dv
    );

  SUM_ZY_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "+++",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 0,
      g_in_A_WIDTH => mult_zy(0)'length,
      g_in_B_WIDTH => mult_zy(1)'length,
      g_in_C_WIDTH => mult_zy(2)'length,
      g_in_D_WIDTH => mult_zy(3)'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => mult_zy(0),
      i_in_B      => mult_zy(1),
      i_in_C      => mult_zy(2),
      i_in_D      => mult_zy(3),
      i_dv        => or_reduce(mult_zy_dv),
      --
      o_result    => sum_zy,
      o_dv        => sum_zy_dv
    );
  SUM_ZZ_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "+++",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 2,
      g_in_A_WIDTH => mult_zz(0)'length,
      g_in_B_WIDTH => mult_zz(1)'length,
      g_in_C_WIDTH => mult_zz(2)'length,
      g_in_D_WIDTH => mult_zz(3)'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => mult_zz(0),
      i_in_B      => mult_zz(1),
      i_in_C      => mult_zz(2),
      i_in_D      => mult_zz(3),
      i_dv        => or_reduce(mult_zz_dv),
      --
      o_result    => sum_zz,
      o_dv        => sum_zz_dv
    );

  --------------------------------------------------
  MULT_N_SUM_ZZ_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "*4",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => 4,
      g_in_B_WIDTH => sum_zz'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => std_logic_vector(to_unsigned(num_h_i,4)),
      i_in_B      => sum_zz,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => sum_zz_dv,
      --
      o_result    => mult_n_szz,
      o_dv        => mult_n_szz_dv
    );

  SQR_ZZ_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "*3",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => sum_z'length,
      g_in_B_WIDTH => sum_z'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => sum_z,
      i_in_B      => sum_z,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => sum_z_dv,
      --
      o_result    => sqr_zz,
      o_dv        => sqr_zz_dv
    );

  SUBPARAM_C_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "-",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 0,
      g_in_A_WIDTH => mult_n_szz'length,
      g_in_B_WIDTH => sqr_zz'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => mult_n_szz,
      i_in_B      => sqr_zz,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => mult_n_szz_dv,
      --
      o_result    => param_c,
      o_dv        => param_c_dv
    );

  --------------------------------

  MULT_SZZ_SY_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "*",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => sum_y'length,
      g_in_B_WIDTH => sum_zz'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => sum_y,
      i_in_B      => sum_zz,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => sum_zz_dv,
      --
      o_result    => mult_sy_szz,
      o_dv        => mult_sy_szz_dv
    );

  MULT_SZ_SZY_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "*",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => sum_z'length,
      g_in_B_WIDTH => sum_zy'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => sum_z,
      i_in_B      => sum_zy,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => sum_z_dv,
      --
      o_result    => mult_sz_szy,
      o_dv        => mult_sz_szy_dv
    );

  SUBPARAM_B_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "-",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 0,
      g_in_A_WIDTH => mult_sy_szz'length,
      g_in_B_WIDTH => mult_sz_szy'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => mult_sy_szz,
      i_in_B      => mult_sz_szy,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => mult_sy_szz_dv,
      --
      o_result    => param_b,
      o_dv        => param_b_dv
    );

  --------------------------------

  MULT_N_SUM_ZY : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "*4",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => 4,
      g_in_B_WIDTH => sum_zy'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => std_logic_vector(to_unsigned(num_h_i,4)),
      i_in_B      => sum_zy,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => sum_zy_dv,
      --
      o_result    => mult_n_szy,
      o_dv        => mult_n_szy_dv
    );

  MULT_SZ_SY_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "*",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => sum_z'length,
      g_in_B_WIDTH => sum_y'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => sum_z,
      i_in_B      => sum_y,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => sum_z_dv,
      --
      o_result    => mult_sz_sy,
      o_dv        => mult_sz_sy_dv
    );

  SUBPARAM_A : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "-",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 0,
      g_in_A_WIDTH => mult_n_szy'length,
      g_in_B_WIDTH => mult_sz_sy'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => mult_n_szy,
      i_in_B      => mult_sz_sy,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => mult_n_szy_dv,
      --
      o_result    => param_a,
      o_dv        => param_a_dv
    );

end architecture beh;

