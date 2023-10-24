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
    g_DATA_SET_VERSION    : string := "v1";
    g_SLOPE_DIV_IPR2_ENABLE : std_logic := '1'
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

  signal sum_z      : std_logic_vector(SLC_Z_RPC_LEN + 4 -1 downto 0); --16
  signal sum_z_dv   : std_logic;
  signal sum_z_pl   : std_logic_vector(SLC_Z_RPC_LEN + 4 -1 downto 0); --16
  signal sum_z_pl_dv : std_logic;
  signal sum_y      : std_logic_vector(SLC_Z_RPC_LEN + 4 -1 downto 0); --16
  -- signal sum_y_sc   : std_logic_vector(27 -1 downto 0);--(4 + sum_y'length -1 downto 0);
  signal sum_y_dv   : std_logic;
  signal sum_zy     : std_logic_vector(SLC_Z_RPC_LEN*2 + 4 -1 downto 0); --28
  signal sum_zy_dv  : std_logic;
  signal sum_zz     : std_logic_vector(SLC_Z_RPC_LEN*2 + 4 -1 downto 0); --28
  signal sum_zz_dv  : std_logic;

  signal sqr_zz         : std_logic_vector(sum_z'length*2 -1 downto 0); --32
  signal sqr_zz_dv      : std_logic;
  signal mult_n_szz     : std_logic_vector(4 + sum_zy'length -1 downto 0); --32
  signal mult_n_szz_dv  : std_logic;
  signal param_c        : std_logic_vector(max(sqr_zz'length,mult_n_szz'length) -1 downto 0); --32
  signal param_c_dv     : std_logic;

  signal mult_sy_szz    : std_logic_vector(sum_zz'length + sum_y'length -1 downto 0); --28
  signal mult_sy_szz_dv : std_logic;
  signal mult_sz_szy    : std_logic_vector(sum_z'length + sum_zy'length -1 downto 0); --28
  signal mult_sz_szy_dv : std_logic;
  signal param_b        : std_logic_vector(max(mult_sy_szz'length,mult_sz_szy'length) -1 downto 0); --28
  signal param_b_dv     : std_logic;

  signal mult_n_szy     : std_logic_vector(4 + sum_zy'length -1 downto 0); --32
  signal mult_n_szy_dv  : std_logic;
  signal mult_sz_sy     : std_logic_vector(sum_z'length + sum_y'length -1 downto 0); --32
  signal mult_sz_sy_dv  : std_logic;
  signal param_a        : std_logic_vector(max(mult_sz_sy'length,mult_n_szy'length) -1 downto 0); --32
  signal param_a_dv     : std_logic;

  constant scale_nom : integer := 0;

  signal slope_bnom_sc    : std_logic_vector(param_a'length + scale_nom -1 downto 0);
  signal slope_bden_sc : std_logic_vector(24 -1 downto 0);
  signal slope_div_dout_tvalid : STD_LOGIC;
  signal slope_div_dout_tdata : STD_LOGIC_VECTOR(55 DOWNTO 0);
  signal slope_div_dout_tdata_q : std_logic_vector(31 downto 0);-- := (others => '0');
  signal slope_div_dout_tdata_r : std_logic_vector(20 downto 0);-- := (others => '0');
  signal slope_bdiv_ipr2    : std_logic_vector(32-1 downto 0);--(max(bden'length,bnom_sc'length) -1 downto 0);
  signal slope_bdiv_ipr2_dv : std_logic;
  -- signal slope_bdiv_vu      : std_logic_vector(max(bden'length,bnom_sc'length) -1 downto 0);
  -- signal slope_bdiv_vu_dv   : std_logic;
  -- signal slope_bdiv_lut      : std_logic_vector(max(bden'length,bnom_sc'length) -1 downto 0);
  -- signal slope_bdiv_lut_dv   : std_logic;
  signal slope_bdiv         : std_logic_vector(max(param_c'length,slope_bnom_sc'length) -1 downto 0);
  signal slope_bdiv_dv      : std_logic;



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
  --------------------------------
  -- prep
  --------------------------------
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

  --------------------------------
  -- C
  --------------------------------
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
  -- B
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
  -- A
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

  --------------------------------
  -- S
  --------------------------------
  -- slope_bnom_sc <= param_a ;--& "00000000000"; --11:2048
  param_a_sc : if (slope_bnom_sc'length - param_a'length) = 0 generate
    slope_bnom_sc <= param_a;
  else generate
    slope_bnom_sc <= param_a & ((slope_bnom_sc'length - param_a'length - 1) downto 0 => '0');
  end generate;
  -- slope_bnom_sc <= param_a & ((slope_bnom_sc'length - param_a'length - 1) downto 0 => '0');
  slope_bden_sc <= std_logic_vector(resize(signed(param_c),slope_bden_sc'length));
  MAIN_DIV_IPR2: if g_SLOPE_DIV_IPR2_ENABLE generate
    COMPONENT div_gen_r2s_v1
      PORT (
        aclk : IN STD_LOGIC;
        aclken : IN STD_LOGIC;
        aresetn : IN STD_LOGIC;
        s_axis_divisor_tvalid : IN STD_LOGIC;
        s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
        s_axis_dividend_tvalid : IN STD_LOGIC;
        s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        m_axis_dout_tvalid : OUT STD_LOGIC;
        m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(55 DOWNTO 0)
      );
    END COMPONENT;
  begin
    DIV_b_IP : div_gen_r2s_v1
      PORT MAP (
        aclk => clk,
        aclken => ena,
        aresetn => not rst,
        s_axis_divisor_tvalid => param_c_dv,
        s_axis_divisor_tdata => slope_bden_sc,
        s_axis_dividend_tvalid => param_a_dv,
        s_axis_dividend_tdata => slope_bnom_sc,
        m_axis_dout_tvalid => slope_div_dout_tvalid,
        -- m_axis_dout_tuser => m_axis_dout_tuser,
        m_axis_dout_tdata => slope_div_dout_tdata
      );
    -- signal slope_div_dout_tdata_q : std_logic_vector(43 downto 0);-- := (others => '0');
    -- signal div_dout_tdata_r : std_logic_vector(31 downto 0);-- := (others => '0');
    slope_div_dout_tdata_q <= slope_div_dout_tdata(55 downto 24);
    slope_div_dout_tdata_r <= slope_div_dout_tdata(20 downto 0);
    slope_bdiv_ipr2 <= slope_div_dout_tdata_q  when slope_div_dout_tvalid = '1' else (others => '0') ;
    slope_bdiv_ipr2_dv <= slope_div_dout_tvalid;
  end generate MAIN_DIV_IPR2;
  
  -- MAIN_DIV_SEL: if g_MAIN_DIV_SEL = "IPR2" generate
    slope_bdiv <= slope_bdiv_ipr2;
    slope_bdiv_dv <= slope_bdiv_ipr2_dv;
  -- elsif g_MAIN_DIV_SEL = "LUT" generate
  --   -- slope_bdiv <= bdiv_lut;
  --   -- slope_bdiv_dv <= bdiv_lut_dv;
  -- end generate MAIN_DIV_SEL;
  --------------------------------
  -- O
  --------------------------------

  --------------------------------
  -- Zs 
  --------------------------------

  Y_EVAL : for i_mdt in g_NUM_MDT_LAYERS -1 downto 0 generate
    signal mult_rc     : std_logic_vector(i_mdt_R_a(i_mdt)'length + param_c'length -1 downto 0);
    signal mult_rc_dv  : std_logic;
    signal sub_rc_b     : std_logic_vector(max(param_b'length,mult_rc'length) -1 downto 0);
    signal sub_rc_b_dv  : std_logic;
    signal div_out : std_logic_vector(79 downto 0);
    signal div_quo : std_logic_vector(45 downto 0);
    signal div_fra : std_logic_vector(31 downto 0);
    signal div_out_dv  : std_logic;

    signal sub_rc_b_scale : std_logic_vector(1 + sub_rc_b'length downto 0);

    COMPONENT cvp_pc_y_hr_div
      PORT (
        aclk : IN STD_LOGIC;
        s_axis_divisor_tvalid : IN STD_LOGIC;
        s_axis_divisor_tready : OUT STD_LOGIC;
        s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        s_axis_dividend_tvalid : IN STD_LOGIC;
        s_axis_dividend_tready : OUT STD_LOGIC;
        s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
        m_axis_dout_tvalid : OUT STD_LOGIC;
        m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(79 DOWNTO 0)
      );
      END COMPONENT;

    begin
    
    MULT_R_C_ENT : entity shared_lib.VU_generic_pipelined_MATH
      generic map(
        g_OPERATION => "*",
        g_IN_PIPE_STAGES  => 1,
        g_OUT_PIPE_STAGES => 1,
        g_in_A_WIDTH => i_mdt_R_a(i_mdt)'length,
        g_in_B_WIDTH => param_c'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => std_logic_vector(i_mdt_R_a(i_mdt)),
        i_in_B      => param_c,
        -- i_in_C      => "0",
        -- i_in_D      => "0",
        i_dv        => i_rpc_R_dv,
        --
        o_result    => mult_rc,
        o_dv        => mult_rc_dv
      );

    SUB_RC_B_ENT : entity shared_lib.VU_generic_pipelined_MATH
      generic map(
        g_OPERATION => "-",
        g_IN_PIPE_STAGES  => 0,
        g_OUT_PIPE_STAGES => 0,
        g_in_A_WIDTH => mult_rc'length,
        g_in_B_WIDTH => param_b'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => mult_rc,
        i_in_B      => param_b,
        -- i_in_C      => "0",
        -- i_in_D      => "0",
        i_dv        => mult_rc_dv,
        --
        o_result    => sub_rc_b,
        o_dv        => sub_rc_b_dv
      );

      sub_rc_b_scale <= std_logic_vector(resize(signed(sub_rc_b),sub_rc_b_scale'length));
    DIV_Z_CALC : cvp_pc_y_hr_div
      PORT MAP (
        aclk => clk,
        s_axis_divisor_tvalid => param_a_dv,
        -- s_axis_divisor_tready => s_axis_divisor_tready,
        s_axis_divisor_tdata => param_a,
        s_axis_dividend_tvalid => sub_rc_b_dv,
        -- s_axis_dividend_tready => s_axis_dividend_tready,
        s_axis_dividend_tdata => sub_rc_b_scale,
        m_axis_dout_tvalid => div_out_dv,
        -- m_axis_dout_tuser => m_axis_dout_tuser,
        m_axis_dout_tdata => div_out
      );

      div_quo <= div_out(77 downto 32);
      div_fra <= div_out(31 downto 0);

      o_vec_z_pos(i_mdt) <= unsigned(div_quo(UCM2HPS_VEC_POS_LEN -1 downto 0));
      vec_z_pos_dv_a(i_mdt) <= div_out_dv;

    end generate;

  --------------------------------

  --------------------------------  
  o_vec_z_pos_dv <= or_reduce(vec_z_pos_dv_a);
  -- o_offset <= offset
  o_slope <= signed(slope_bdiv);


end architecture beh;

