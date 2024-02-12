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
-- use shared_lib.detector_param_pkg.all;
use shared_lib.vhdl2008_functions_pkg.all;
 
library ucm_lib;
use ucm_lib.ucm_pkg.all;
use ucm_lib.ucm_vhdl_pkg.all;

library  vamc_lib;

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
    g_DATA_SET_VERSION    : string := "v1";
    g_SLOPE_DIV_IPR2_ENABLE : std_logic := '1';
    g_off_DIV_IPR2_ENABLE : std_logic := '1'

  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic;
    --
    i_cointype    : in std_logic_vector(SLC_COMMON_COINTYPE_LEN-1 downto 0);
    i_rpc_Z_a     : in rpc_pos_oast(g_NUM_RPC_LAYERS -1 downto 0);
    i_data_valid  : in std_logic;
    --
    i_rpc_R_a     : in ucm_rpc_r_alt(g_NUM_RPC_LAYERS -1 downto 0);
    i_rpc_R_dv    : in std_logic;
    i_mdt_R_a     : in ucm_mdt_r_alt(g_NUM_MDT_LAYERS-1 downto 0);
    i_mdt_R_dv    : in std_logic;

    o_offset        : out signed(31 downto 0);--signed(126 -1 downto 0);
    o_offset_dv     : out std_logic;
    o_slope         : out signed(31 downto 0);--signed((sig_SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);
    o_slope_dv      : out std_logic;

    o_vec_z_pos     : out vec_pos_array_ut(g_NUM_MDT_LAYERS-1 downto 0);
    o_vec_z_pos_dv  : out std_logic
    
  );
end entity ucm_cvp_pc_core;

architecture beh of ucm_cvp_pc_core is

  constant sig_SLC_Z_RPC_LEN : integer := SLC_Z_RPC_LEN +1;
  
  signal num_h_i : integer;
  signal rpc_Z_a : rpc_pos_ast;
  signal rpc_R_a : rpc_rad_ast;
  signal set_data_dv : std_logic;

  type mult_zy_art is array ( 0 to 3) of std_logic_vector((sig_SLC_Z_RPC_LEN * 2) - 1 downto 0);
  signal mult_xy    : mult_zy_art;
  signal mult_xy_dv : std_logic_vector(3 downto 0);
  signal mult_xx    : mult_zy_art;
  signal mult_xx_dv : std_logic_vector(3 downto 0);

  signal sum_x      : std_logic_vector(sig_SLC_Z_RPC_LEN + 4 -1 downto 0); --16
  signal sum_x_dv   : std_logic;
  signal sum_y      : std_logic_vector(sig_SLC_Z_RPC_LEN + 4 -1 downto 0);
  signal sum_y_dv   : std_logic;
  signal sum_x_pl1      : std_logic_vector(sig_SLC_Z_RPC_LEN + 4 -1 downto 0); --16
  signal sum_x_pl1_dv   : std_logic;
  signal sum_y_pl1      : std_logic_vector(sig_SLC_Z_RPC_LEN + 4 -1 downto 0);
  signal sum_y_pl1_dv   : std_logic;

  signal sum_xy     : std_logic_vector(sig_SLC_Z_RPC_LEN*2 + 4 -1 downto 0); --28
  signal sum_xy_dv  : std_logic;
  signal sum_xx     : std_logic_vector(sig_SLC_Z_RPC_LEN*2 + 4 -1 downto 0); --28
  signal sum_xx_dv  : std_logic;

  signal SxSx           : std_logic_vector(sum_x'length*2 -1 downto 0); --32
  signal SxSx_dv        : std_logic;
  signal nSxx           : std_logic_vector(4 + sum_xy'length -1 downto 0); --32
  signal nSxx_dv        : std_logic;
  signal param_c        : std_logic_vector(max(SxSx'length,nSxx'length) -1 downto 0); --32
  signal param_c_red    : std_logic_vector(22 -1 downto 0);
  signal param_c_dv     : std_logic;
  signal pl_param_c_red : std_logic_vector(22 -1 downto 0);
  signal pl_param_c_dv  : std_logic;

  signal SxxSy          : std_logic_vector(sum_xx'length + sum_x'length -1 downto 0); --28
  signal SxxSy_dv       : std_logic;
  signal SxSxy          : std_logic_vector(sum_x'length + sum_xy'length -1 downto 0); --28
  signal SxSxy_dv       : std_logic;
  signal param_b        : std_logic_vector(max(SxxSy'length,SxSxy'length) -1 downto 0); --28
  signal param_b_red    : std_logic_vector(31 -1 downto 0);
  signal param_b_dv     : std_logic;
  signal plz_param_b    : std_logic_vector(param_b'length - 1 downto 0);
  signal plz_param_b_dv : std_logic;

  signal nSxy             : std_logic_vector(4 + sum_xy'length -1 downto 0); --32
  signal nSxy_dv          : std_logic;
  signal SxSy             : std_logic_vector(sum_x'length + sum_x'length -1 downto 0); --32
  signal SxSy_dv          : std_logic;
  signal param_a          : std_logic_vector(max(SxSy'length,nSxy'length) -1 downto 0);
  signal param_a_red      : std_logic_vector(23 -1 downto 0);
  signal param_a_dv       : std_logic;
  signal param_a_red_pl1  : std_logic_vector(param_a_red'length -1 downto 0);
  signal param_a_pl_dv    : std_logic;

  constant scale_slope_nom : integer := 10;

  signal param_a_sc    : std_logic_vector(param_a_red'length + scale_slope_nom -1 downto 0);
  signal slope_den_sc : std_logic_vector(24 -1 downto 0);
  signal slope_div_sc : std_logic_vector(39 downto 0);
  signal slope_div_dout_tvalid : STD_LOGIC;
  signal slope_div_dout_tdata : STD_LOGIC_VECTOR(63 DOWNTO 0);
  signal slope_div_dout_tdata_q : std_logic_vector(33 downto 0);-- := (others => '0');
  signal slope_div_dout_tdata_r : std_logic_vector(20 downto 0);-- := (others => '0');
  -- signal slope_div_ipr2    : std_logic_vector(34-1 downto 0);--(max(bden'length,bnom_sc'length) -1 downto 0);
  -- signal slope_div_ipr2_dv : std_logic;

  COMPONENT cvp_slope_r2s_v1
    PORT (
      aclk : IN STD_LOGIC;
      aclken : IN STD_LOGIC;
      aresetn : IN STD_LOGIC;
      s_axis_divisor_tvalid : IN STD_LOGIC;
      s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      s_axis_dividend_tvalid : IN STD_LOGIC;
      s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
      m_axis_dout_tvalid : OUT STD_LOGIC;
      m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0) 
    );
  END COMPONENT;

  signal slope_div         : std_logic_vector(max(param_c_red'length,param_a_sc'length) -1 downto 0);
  signal slope_div_dv      : std_logic;

  constant scale_off_nom : integer := 10;

  signal param_b_sc           : std_logic_vector(param_b_red'length + scale_off_nom -1 downto 0);
  -- signal plz_param_b_sc        : std_logic_vector(param_b_red'length + scale_off_nom -1 downto 0);
  -- signal plz_param_b_dv        : std_logic;
  signal off_den_sc           : std_logic_vector(23 downto 0);
  signal off_div_sc           : std_logic_vector(47 downto 0);
  signal off_div_dout_tvalid  : STD_LOGIC;
  signal off_div_dout_tdata   : STD_LOGIC_VECTOR(71 DOWNTO 0);
  signal off_div_dout_tdata_q : std_logic_vector(33 downto 0);-- := (others => '0');
  signal off_div_dout_tdata_r : std_logic_vector(20 downto 0);-- := (others => '0');
  -- signal off_div_ipr2    : std_logic_vector(34-1 downto 0);--(max(bden'length,bnom_sc'length) -1 downto 0);
  -- signal off_div_ipr2_dv : std_logic;

  COMPONENT cvp_offset_r2s_v1
    PORT (
      aclk : IN STD_LOGIC;
      aclken : IN STD_LOGIC;
      aresetn : IN STD_LOGIC;
      s_axis_divisor_tvalid : IN STD_LOGIC;
      s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
      s_axis_dividend_tvalid : IN STD_LOGIC;
      s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
      m_axis_dout_tvalid : OUT STD_LOGIC;
      m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(71 DOWNTO 0) 
    );
  END COMPONENT;

  signal off_div         : std_logic_vector(max(param_c'length,param_a_sc'length) -1 downto 0);
  signal off_div_dv      : std_logic;

  constant scale_Z_nom : integer := 10;

  signal pl_mdt_R_a     : ucm_mdt_r_alt(g_NUM_MDT_LAYERS-1 downto 0);
  -- signal pl_mdt_R_dv    : std_logic;

  signal vec_z_pos_dv_a : std_logic_vector(g_NUM_MDT_LAYERS -1 downto 0);

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
    MULT_XY_ENT : entity shared_lib.VU_generic_pipelined_MATH
      generic map(
        g_NAME => "XY",
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
        i_dv        => set_data_dv,
        --
        o_result    => mult_xy(hit_i),
        o_dv        => mult_xy_dv(hit_i)
      );
    --xx
    MULT_XX_ENT : entity shared_lib.VU_generic_pipelined_MATH
      generic map(
        g_NAME => "XX",
        g_OPERATION => "*2",
        g_IN_PIPE_STAGES  => 0,
        g_OUT_PIPE_STAGES => 0,
        g_in_A_WIDTH => rpc_R_a(hit_i)'length,
        g_in_B_WIDTH => rpc_R_a(hit_i)'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => std_logic_vector(rpc_R_a(hit_i)),
        i_in_B      => std_logic_vector(rpc_R_a(hit_i)),
        i_dv        => set_data_dv,
        --
        o_result    => mult_xx(hit_i),
        o_dv        => mult_xx_dv(hit_i)
      );
      end generate SQR_LOOP;
    --Sy
    SUM_X_ENT : entity shared_lib.VU_generic_pipelined_MATH
      generic map(
        g_NAME => "SX",
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
        o_result    => sum_x,
        o_dv        => sum_x_dv
      );
    SUM_Y_ENT : entity shared_lib.VU_generic_pipelined_MATH
      generic map(
        g_NAME => "SY",
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
        o_result    => sum_y,
        o_dv        => sum_y_dv
      );
  --------------------------------
  -- prep
  --------------------------------
  SUM_XX_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_NAME => "SXX",
      g_OPERATION => "+++",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => mult_xx(0)'length,
      g_in_B_WIDTH => mult_xx(1)'length,
      g_in_C_WIDTH => mult_xx(2)'length,
      g_in_D_WIDTH => mult_xx(3)'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => mult_xx(0),
      i_in_B      => mult_xx(1),
      i_in_C      => mult_xx(2),
      i_in_D      => mult_xx(3),
      i_dv        => or_reduce(mult_xx_dv),
      --
      o_result    => sum_xx,
      o_dv        => sum_xx_dv
    );
  SUM_XY_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_NAME => "SXY",
      g_OPERATION => "+++",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => mult_xy(0)'length,
      g_in_B_WIDTH => mult_xy(1)'length,
      g_in_C_WIDTH => mult_xy(2)'length,
      g_in_D_WIDTH => mult_xy(3)'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => mult_xy(0),
      i_in_B      => mult_xy(1),
      i_in_C      => mult_xy(2),
      i_in_D      => mult_xy(3),
      i_dv        => or_reduce(mult_xy_dv),
      --
      o_result    => sum_xy,
      o_dv        => sum_xy_dv
    );
  --------------------------------
  -- C
  --------------------------------
  MULT_N_SUM_xx_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_NAME => "nSxx",
      g_OPERATION => "*4",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => 4,
      g_in_B_WIDTH => sum_xx'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => std_logic_vector(to_unsigned(num_h_i,4)),
      i_in_B      => sum_xx,
      i_dv        => sum_xx_dv,
      --
      o_result    => nSxx,
      o_dv        => nSxx_dv
    );

  SYSY_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_NAME => "SxSx",
      g_OPERATION => "*3",
      g_IN_PIPE_STAGES  => 2,
      g_OUT_PIPE_STAGES => 2,
      g_in_A_WIDTH => sum_x'length,
      g_in_B_WIDTH => sum_x'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => sum_x,
      i_in_B      => sum_x,
      i_dv        => sum_x_dv,
      --
      o_result    => SxSx,
      o_dv        => SxSx_dv
    );

  SUBPARAM_C_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_NAME => "param_c",
      g_OPERATION => "-",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 0,
      g_in_A_WIDTH => nSxx'length,
      g_in_B_WIDTH => SxSx'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => nSxx,
      i_in_B      => SxSx,
      i_dv        => nSxx_dv,
      --
      o_result    => param_c,
      o_dv        => param_c_dv
    );
  param_c_red <= std_logic_vector(resize(signed(param_c),param_c_red'length));

  --------------------------------
  -- B
  --------------------------------
  Sy_PL_1 : entity vamc_lib.vamc_spl
    generic map(
      g_DELAY_CYCLES  => 2,
      g_PIPELINE_WIDTH    => sum_y'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      i_data      => sum_y,
      i_dv        => sum_y_dv,
      o_data      => sum_y_pl1,
      o_dv        => sum_y_pl1_dv
    );
  MULT_SXX_SY_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_NAME => "SySxx",
      g_OPERATION => "*",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => sum_y'length,
      g_in_B_WIDTH => sum_xx'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      i_in_A      => sum_y_pl1,
      i_in_B      => sum_xx,
      i_dv        => sum_xx_dv,
      --
      o_result    => SxxSy,
      o_dv        => SxxSy_dv
    );
  Sx_PL_1 : entity vamc_lib.vamc_spl
    generic map(
      g_DELAY_CYCLES  => 2,
      g_PIPELINE_WIDTH    => sum_x'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      i_data      => sum_x,
      i_dv        => sum_x_dv,
      o_data      => sum_x_pl1,
      o_dv        => sum_x_pl1_dv
    );
  MULT_SZ_SZY_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_NAME => "SxSxy",
      g_OPERATION => "*",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => sum_x'length,
      g_in_B_WIDTH => sum_xy'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      i_in_A      => sum_x_pl1,
      i_in_B      => sum_xy,
      i_dv        => sum_x_pl1_dv,
      o_result    => SxSxy,
      o_dv        => SxSxy_dv
    );

  SUBPARAM_B_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_NAME => "param_b",
      g_OPERATION => "-",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 0,
      g_in_A_WIDTH => SxxSy'length,
      g_in_B_WIDTH => SxSxy'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      i_in_A      => SxxSy,
      i_in_B      => SxSxy,
      i_dv        => SxxSy_dv,
      o_result    => param_b,
      o_dv        => param_b_dv
    );
  param_b_red <= std_logic_vector(resize(signed(param_b),param_b_red'length));

  --------------------------------
  -- A
  --------------------------------
  MULT_N_SUM_xY : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_NAME => "nSxy",
      g_OPERATION => "*4",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => 4,
      g_in_B_WIDTH => sum_xy'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => std_logic_vector(to_unsigned(num_h_i,4)),
      i_in_B      => sum_xy,
      i_dv        => sum_xy_dv,
      --
      o_result    => nSxy,
      o_dv        => nSxy_dv
    );

  SXSY_ENT : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_NAME => "SxSy",
      g_OPERATION => "*",
      g_IN_PIPE_STAGES  => 2,
      g_OUT_PIPE_STAGES => 2,
      g_in_A_WIDTH => sum_x'length,
      g_in_B_WIDTH => sum_y'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => sum_x,
      i_in_B      => sum_y,
      i_dv        => sum_x_dv,
      --
      o_result    => SxSy,
      o_dv        => SxSy_dv
    );

  SUBPARAM_A : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_NAME => "param_a",
      g_OPERATION => "-",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 0,
      g_in_A_WIDTH => nSxy'length,
      g_in_B_WIDTH => SxSy'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => nSxy,
      i_in_B      => SxSy,
      i_dv        => nSxy_dv,
      --
      o_result    => param_a,
      o_dv        => param_a_dv
    );
  param_a_red <= std_logic_vector(resize(signed(param_a),param_a_red'length));
    
  --------------------------------
  -- S
  --------------------------------
  -- param_a_sc <= param_a ;--& "00000000000"; --11:2048
  gen_a_sc : if param_a_sc'length = param_a_red'length generate
    param_a_sc <= param_a_red;
  else generate
    -- param_a_sc <= param_a_red & ((param_a_sc'length - param_a_red'length - 1) downto 0 => '0');
    param_a_sc <= param_a_red & (0 to (param_a_sc'length - param_a_red'length - 1) => '0');
  end generate;

  -- assert slope_den_sc'length < param_c'length report "Error: slope_den_sc'length " & integer'image(slope_den_sc'length) & "< param_c'length " & integer'image(param_c'length) & " report" severity error;
  -- assert slope_div_sc'length < param_a_sc'length report "Error: slope_div_sc'length " & integer'image(slope_div_sc'length) & " < param_a_sc'length " & integer'image(param_a_sc'length) & " report" severity error;
  -- param_a_sc <= param_a & ((param_a_sc'length - param_a'length - 1) downto 0 => '0');
  slope_den_sc <= std_logic_vector(resize(signed(param_c_red),slope_den_sc'length));
  slope_div_sc <= std_logic_vector(resize(signed(param_a_sc),slope_div_sc'length));

  SLOPE_DIV_IP : cvp_slope_r2s_v1
    PORT MAP (
      aclk => clk,
      aclken => ena,
      aresetn => not rst,
      s_axis_divisor_tvalid => param_c_dv,
      s_axis_divisor_tdata => slope_den_sc,
      s_axis_dividend_tvalid => param_a_dv,
      s_axis_dividend_tdata => slope_div_sc,
      m_axis_dout_tvalid => slope_div_dout_tvalid,
      -- m_axis_dout_tuser => m_axis_dout_tuser,
      m_axis_dout_tdata => slope_div_dout_tdata
    );
    -- signal slope_div_dout_tdata_q : std_logic_vector(43 downto 0);-- := (others => '0');
    -- signal div_dout_tdata_r : std_logic_vector(31 downto 0);-- := (others => '0');
  slope_div_dout_tdata_q <= slope_div_dout_tdata(57 downto 24);
  slope_div_dout_tdata_r <= slope_div_dout_tdata(20 downto 0);
    -- slope_div_ipr2 <= slope_div_dout_tdata_q;--  when slope_div_dout_tvalid = '1' else (others => '0') ;
    -- slope_div_ipr2_dv <= slope_div_dout_tvalid;
  -- slope_div <= std_logic_vector(resize(signed(slope_div_dout_tdata_q(slope_div_dout_tdata_q'length -1 downto scale_slope_nom )),slope_div'length));
  slope_div <= std_logic_vector(resize(signed(slope_div_dout_tdata_q),slope_div'length));
  slope_div_dv <= slope_div_dout_tvalid;
  -- end generate MAIN_DIV_IPR2;
  
  -- MAIN_DIV_SEL: if g_MAIN_DIV_SEL = "IPR2" generate
    -- slope_div <= slope_div_ipr2;
    -- slope_div_dv <= slope_div_ipr2_dv;
  -- elsif g_MAIN_DIV_SEL = "LUT" generate
  
  --   -- slope_div <= bdiv_lut;
  --   -- slope_div_dv <= bdiv_lut_dv;
  -- end generate MAIN_DIV_SEL;
  --------------------------------
  -- O
  --------------------------------
  -- param_b_sc <= param_b ;--& "00000000000"; --11:2048
  gen_b_sc : if param_b_sc'length = param_b_red'length generate
    param_b_sc <= param_b_red;
  else generate
    -- param_b_sc <= param_b_red & ((param_b_sc'length - param_b_red'length - 1) downto 0 => '0');
    param_b_sc <= param_b_red & (0 to (param_b_sc'length - param_b_red'length - 1) => '0');
  end generate;
  -- assert off_den_sc'length < param_c'length report "Error: off_den_sc'length " & integer'image(off_den_sc'length) & " < param_c'length " & integer'image(param_c'length) & " report" severity error;
  -- assert off_div_sc'length < param_b_sc'length report "Error: off_div_sc'length " & integer'image(off_div_sc'length) & "< param_b_sc'length " & integer'image(param_b_sc'length) & " report" severity error;
  -- param_b_sc <= param_a & ((param_b_sc'length - param_a'length - 1) downto 0 => '0');
  off_den_sc <= std_logic_vector(resize(signed(param_c_red),off_den_sc'length));
  off_div_sc <= std_logic_vector(resize(signed(param_b_sc),off_div_sc'length));

  OFF_DIV_IP : cvp_offset_r2s_v1
    PORT MAP (
      aclk => clk,
      aclken => ena,
      aresetn => not rst,
      s_axis_divisor_tvalid => param_c_dv,
      s_axis_divisor_tdata => off_den_sc,
      s_axis_dividend_tvalid => param_a_dv,
      s_axis_dividend_tdata => off_div_sc,
      m_axis_dout_tvalid => off_div_dout_tvalid,
      -- m_axis_dout_tuser => m_axis_dout_tuser,
      m_axis_dout_tdata => off_div_dout_tdata
    );
  -- signal off_div_dout_tdata_q : std_logic_vector(43 downto 0);-- := (others => '0');
  -- signal div_dout_tdata_r : std_logic_vector(31 downto 0);-- := (others => '0');
  off_div_dout_tdata_q <= off_div_dout_tdata(57 downto 24);
  off_div_dout_tdata_r <= off_div_dout_tdata(20 downto 0);
  -- off_div_ipr2 <= off_div_dout_tdata_q;--  when off_div_dout_tvalid = '1' else (others => '0') ;
  -- off_div_ipr2_dv <= off_div_dout_tvalid;
  -- off_div <= off_div_dout_tdata_q;
  off_div <= std_logic_vector(resize(signed(off_div_dout_tdata_q(off_div_dout_tdata_q'length -1 downto scale_off_nom )),off_div'length));
  off_div_dv <= off_div_dout_tvalid;
  -- end generate;
  
  -- MAIN_DIV_SEL: if g_MAIN_DIV_SEL = "IPR2" generate
    -- off_div <= off_div_ipr2;
    -- off_div_dv <= off_div_ipr2_dv;
  -- elsif g_MAIN_DIV_SEL = "LUT" generate
  --   -- off_div <= bdiv_lut;
  --   -- off_div_dv <= bdiv_lut_dv;
  -- end generate MAIN_DIV_SEL;
  --------------------------------
  -- Zs 
  --------------------------------
  B_PL_1 : entity vamc_lib.vamc_spl
    generic map(
      g_DELAY_CYCLES  => 3,
      g_PIPELINE_WIDTH    => param_b'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      i_data      => param_b,
      i_dv        => param_b_dv,
      o_data      => plz_param_b,  
      o_dv        => plz_param_b_dv 
    );
  C_PL_1 : entity vamc_lib.vamc_spl
    generic map(
      g_DELAY_CYCLES  => 6,
      g_PIPELINE_WIDTH    => param_c_red'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      i_data      => param_c_red,
      i_dv        => param_c_dv,
      o_data      => pl_param_c_red,  
      o_dv        => pl_param_c_dv 
    );

  Y_EVAL : for i_mdt in g_NUM_MDT_LAYERS -1 downto 0 generate
    signal pl_mdt_R_dv    : std_logic;
    -- signal pl_mdt_R_a_sc  : std_logic_vector(pl_mdt_R_a(i_mdt)'length + scale_Z_nom -1 downto 0);
    signal mult_ra        : std_logic_vector(i_mdt_R_a(i_mdt)'length + param_a'length -1 downto 0);
    signal mult_ra_dv     : std_logic;
    signal sum_ax_b       : std_logic_vector(max(param_b_sc'length,mult_ra'length) downto 0);
    signal sum_ax_b_sc    : std_logic_vector(sum_ax_b'length + scale_Z_nom - 1 downto 0);
    signal sum_ax_b_dv    : std_logic;
    signal zc_div_num     : std_logic_vector(55 downto 0);
    signal zc_div_den     : std_logic_vector(39 downto 0);
    signal div_out        : std_logic_vector(95 downto 0);
    signal div_quo        : std_logic_vector(50 downto 0);
    signal div_fra        : std_logic_vector(33 downto 0);
    signal div_out_dv     : std_logic;

    -- signal sum_ax_b_scale : std_logic_vector(1 + sum_ax_b'length downto 0);

    COMPONENT zcalc_vec_pos_div
      PORT (
        aclk : IN STD_LOGIC;
        aclken : IN STD_LOGIC;
        aresetn : IN STD_LOGIC;
        s_axis_divisor_tvalid : IN STD_LOGIC;
        s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
        s_axis_dividend_tvalid : IN STD_LOGIC;
        s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(55 DOWNTO 0);
        m_axis_dout_tvalid : OUT STD_LOGIC;
        m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(95 DOWNTO 0) 
      );
    END COMPONENT;

    begin

    MDT_PL_1 : entity vamc_lib.vamc_spl
      generic map(
        g_DELAY_CYCLES  => 9,
        g_PIPELINE_WIDTH    => i_mdt_R_a(i_mdt)'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        ena         => ena,
        i_data      => i_mdt_R_a(i_mdt),
        i_dv        => i_mdt_R_dv,
        o_data      => pl_mdt_R_a(i_mdt),  
        o_dv        => pl_mdt_R_dv 
      );
    
    -- gen_b_sc : if (pl_mdt_R_a_sc'length - pl_mdt_R_a(i_mdt)'length) = 0 generate
    --     pl_mdt_R_a_sc <= pl_mdt_R_a(i_mdt);
    --   else generate
    --     pl_mdt_R_a_sc <= pl_mdt_R_a(i_mdt) & ((pl_mdt_R_a_sc'length - pl_mdt_R_a(i_mdt)'length - 1) downto 0 => '0');
    --   end generate;

    MULT_R_C_ENT : entity shared_lib.VU_generic_pipelined_MATH
      generic map(
        g_NAME => "a*x",
        g_OPERATION => "*",
        g_IN_PIPE_STAGES  => 1,
        g_OUT_PIPE_STAGES => 1,
        g_in_A_WIDTH => pl_mdt_R_a(i_mdt)'length,
        g_in_B_WIDTH => param_a'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => pl_mdt_R_a(i_mdt),
        i_in_B      => param_a,
        i_dv        => param_a_dv,
        --
        o_result    => mult_ra,
        o_dv        => mult_ra_dv
      );

    

    sum_ax_b_ENT : entity shared_lib.VU_generic_pipelined_MATH
      generic map(
        g_NAME => "ax+b",
        g_OPERATION => "+",
        g_IN_PIPE_STAGES  => 1,
        g_OUT_PIPE_STAGES => 1,
        g_in_A_WIDTH => mult_ra'length,
        g_in_B_WIDTH => plz_param_b'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => mult_ra,
        i_in_B      => plz_param_b,
        i_dv        => mult_ra_dv,
        --
        o_result    => sum_ax_b,
        o_dv        => sum_ax_b_dv
      );

      -- sum_ax_b_scale <= std_logic_vector(resize(signed(sum_ax_b),sum_ax_b_scale'length));

    
      
    param_z_sc : if (sum_ax_b_sc'length - sum_ax_b'length) = 0 generate
      sum_ax_b_sc <= sum_ax_b;
    else generate
      sum_ax_b_sc <= sum_ax_b & ((sum_ax_b_sc'length - sum_ax_b'length - 1) downto 0 => '0');
    end generate;
    -- assert zc_div_num'length < sum_ax_b_sc'length report "Error: zc_div_num'length " & integer'image(zc_div_num'length ) & " < sum_ax_b_sc'length " & integer'image(sum_ax_b_sc'length) & " report" severity error;
    -- assert zc_div_den'length < param_c'length report "Error: zc_div_denv'length " & integer'image(zc_div_den'length) & " < param_c'length " & integer'image(param_c'length) & " report" severity error;
    zc_div_num <= std_logic_vector(resize(signed(sum_ax_b_sc),zc_div_num'length));
    zc_div_den <= std_logic_vector(resize(signed(pl_param_c_red),zc_div_den'length));

    DIV_Z_CALC : zcalc_vec_pos_div
      PORT MAP (
        aclk => clk,
        aclken => ena,
        aresetn => not rst,
        s_axis_divisor_tvalid => pl_param_c_dv,
        -- s_axis_divisor_tready => s_axis_divisor_tready,
        s_axis_divisor_tdata => zc_div_den,--param_a,
        s_axis_dividend_tvalid => sum_ax_b_dv,
        -- s_axis_dividend_tready => s_axis_dividend_tready,
        s_axis_dividend_tdata => zc_div_num,--sum_ax_b_scale,
        m_axis_dout_tvalid => div_out_dv,
        -- m_axis_dout_tuser => m_axis_dout_tuser,
        m_axis_dout_tdata => div_out
      );

      div_quo <= div_out(90 downto 40);
      div_fra <= div_out(33 downto 0);

      -- o_vec_z_pos(i_mdt) <= unsigned(div_quo(UCM2HPS_VEC_POS_LEN -1 downto 0));

      o_vec_z_pos(i_mdt) <= resize(unsigned(div_quo(div_quo'length -1 downto scale_Z_nom )),o_vec_z_pos(i_mdt)'length);


      vec_z_pos_dv_a(i_mdt) <= div_out_dv;

    end generate;

  --------------------------------

  --------------------------------  
  o_vec_z_pos_dv <= or_reduce(vec_z_pos_dv_a);
  o_offset <= resize(signed(off_div),32);
  o_slope <= resize(signed(slope_div),32);
  o_slope_dv <= slope_div_dv;
  o_offset_dv <= off_div_dv;


end architecture beh;

