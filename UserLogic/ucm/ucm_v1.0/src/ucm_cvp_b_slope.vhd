--------------------------------------------------------------------------------
-- UMass , Physics Department
-- Project: ATLAS L0MDT Trigger
-- File: ucm_cvp_b_slope.vhd
-- Module: ucm_cvp_b_slope
-- File PATH: /UserLogic/ucm/ucm_v1.1/src/ucm_cvp_b_slope.vhd
-- -----
-- File Created: Friday, 8th July 2022 9:42:07 pm
-- Author: Guillermo Loustau de Linares (guillermo.ldl@cern.ch)
-- -----
-- Last Modified: Wednesday, 13th July 2022 10:51:38 am
-- Modified By: Guillermo Loustau de Linares (guillermo.ldl@cern.ch>)
-- -----
-- HISTORY:
-- 2022-07-13	GLdL add IPs for divisions
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

library UNISIM; 
use UNISIM.VCOMPONENTS.ALL; 

library ucm_lib;
use ucm_lib.ucm_pkg.all;

library  vamc_lib;

entity ucm_cvp_b_slope is
  generic(
    g_NUM_RPC_LAYERS : integer := 4;
    g_DEBUG_TYPE : string := "old";
    g_MAIN_DIV_VU_ENABLE : std_logic := '1';
    g_MAIN_DIV_IPR2_ENABLE : std_logic := '1';
    g_MAIN_DIV_LUT_ENABLE : std_logic := '1';
    g_MAIN_DIV_SEL : string := "IPR2";
    g_EYN_DIV_VU_ENABLE : std_logic := '1';
    g_EYN_DIV_IPR2_ENABLE : std_logic := '0';
    g_EYN_DIV_LUT_ENABLE : std_logic := '0';
    g_EYN_DIV_SEL : string := "VU";
    g_EZN_DIV_VU_ENABLE : std_logic := '1';
    g_EZN_DIV_IPR2_ENABLE : std_logic := '0';
    g_EZN_DIV_LUT_ENABLE : std_logic := '0';
    g_EZN_DIV_SEL : string := "VU"
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic;
    --
    i_rpc_rad_a   : in ucm_rpc_r_alt(g_NUM_RPC_LAYERS -1 downto 0);
    i_cointype    : in std_logic_vector(SLC_COMMON_COINTYPE_LEN-1 downto 0);
    i_data_v      : in std_logic_vector(SLC_SPECIFIC_LEN-1 downto 0);
    i_data_valid  : in std_logic;
    --
    o_offset      : out signed(31 downto 0);--signed(126 -1 downto 0);
    o_slope       : out signed(31 downto 0);--signed((SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);
    o_data_valid  : out std_logic
    
  );
end entity ucm_cvp_b_slope;

architecture beh of ucm_cvp_b_slope is
  
  signal barrel_r   : slc_barrel_rt;
  signal coin : integer;

  -- type num_art is array ( 0 to 16) of integer;
  signal num_h_i : integer := 0;--num_art;
  -- signal num_h_std : std_logic_vector(2 downto 0);

  type rpc_art is array ( 0 to 3) of signed(SLC_Z_RPC_LEN - 1 downto 0);
  signal rpc_a : rpc_art;
  type rad_art is array ( 0 to 3) of signed(SLC_Z_RPC_LEN - 1 downto 0);
  signal rad_a : rad_art;
  -- signal rad_comp_a : rad_art;
  -- signal rad_comp_dv : std_logic;

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

  signal sqr_zz     : std_logic_vector(sum_z'length*2 -1 downto 0);
  signal sqr_zz_dv  : std_logic;

  signal bnom_1     : std_logic_vector(4 + sum_zy'length -1 downto 0);
  signal bnom_1_dv  : std_logic;
  signal bnom_2     : std_logic_vector(sum_z'length + sum_y'length -1 downto 0);
  signal bnom_2_dv  : std_logic;
  signal bnom       : std_logic_vector(21 -1 downto 0);
  signal bnom_sc    : std_logic_vector(32 -1 downto 0);--(11 + bnom'length -1 downto 0);
  signal bnom_dv    : std_logic;
  -- signal bden_aux       : std_logic_vector(4 + sum_zz'length-1 downto 0);
  -- signal bden_dv    : std_logic;
  signal bden       : std_logic_vector(24-1 downto 0);--(4 + sum_zz'length-1 downto 0);
  signal bden_dv    : std_logic;

  signal bdiv_sim     : std_logic_vector(max(bden'length,bnom_sc'length) -1 downto 0);
  signal bdiv_sim_dv  : std_logic;
  signal bdiv_ipr2    : std_logic_vector(32-1 downto 0);--(max(bden'length,bnom_sc'length) -1 downto 0);
  signal bdiv_ipr2_dv : std_logic;
  signal bdiv_vu      : std_logic_vector(max(bden'length,bnom_sc'length) -1 downto 0);
  signal bdiv_vu_dv   : std_logic;
  signal bdiv_lut      : std_logic_vector(max(bden'length,bnom_sc'length) -1 downto 0);
  signal bdiv_lut_dv   : std_logic;
  signal bdiv         : std_logic_vector(max(bden'length,bnom_sc'length) -1 downto 0);
  signal bdiv_dv      : std_logic;
  -- signal bden_inv_res : std_logic_vector(50 -1 downto 0);
  -- signal bden_inv_dv  : std_logic;

  -- signal bdiv_vu_res_descale  : std_logic_vector(39 -1 downto 0);
  
  -- signal bdiv_vu_res          : std_logic_vector(83 -1 downto 0);
  -- signal bdiv_vu_dv           : std_logic;


  signal e_y_aux    : std_logic_vector(max(4,sum_y_sc'length) -1 downto 0);
  signal e_y_aux_dv : std_logic;
  signal e_y        : std_logic_vector(max(4,sum_y_sc'length) -1 downto 0);
  signal e_y_dv     : std_logic;
  signal e_y_pl     : std_logic_vector(max(4,sum_y_sc'length) -1 downto 0);
  signal e_y_pl_dv  : std_logic;

  signal e_z_aux    : std_logic_vector(max(4,sum_z'length) -1 downto 0);
  signal e_z_aux_dv : std_logic;
  signal e_z        : std_logic_vector(max(4,sum_z'length) -1 downto 0);
  signal e_z_dv     : std_logic;
  signal e_z_pl     : std_logic_vector(max(4,sum_z'length) -1 downto 0);
  signal e_z_pl_dv  : std_logic;

  signal s_e_z      : std_logic_vector(bdiv'length + e_z'length -1 downto 0);
  signal s_e_z_dv   : std_logic;

  signal int_off      : std_logic_vector(max(e_y'length,s_e_z'length) -1 downto 0);
  signal int_off_dv   : std_logic;

  signal int_slope      : std_logic_vector(32 -1 downto 0);
  signal int_slope_dv   : std_logic;

  -- signal e_z                  : signed(SLC_Z_RPC_LEN + 2 -1 downto 0);
  -- signal e_y , e_y_2          : signed(2*(SLC_Z_RPC_LEN + 2) -1 downto 0);
  -- signal int_offset           : signed(126 -1 downto 0);
  -- type sum_pl_st is array (0 to 1) of signed(SLC_Z_RPC_LEN   + 2 -1 downto 0);
  -- signal sum_y                : sum_pl_st;
  -- signal sum_z                : sum_pl_st;
  -- 
  -- signal sum_zz               : signed(SLC_Z_RPC_LEN*2 + 4 -1 downto 0);
  -- signal sqr_sum_z            : signed(SLC_Z_RPC_LEN*2 + 4 -1 downto 0);
  -- -- signal b_nom                : signed(SLC_Z_RPC_LEN*4 + 8 -1 downto 0);

  -- constant c_B_DEN_NOM : integer := 5;
  -- type b_nom_t is array  (0 to c_B_DEN_NOM - 1) of signed(SLC_Z_RPC_LEN*4 + 8 -1 downto 0);
  -- signal b_nom : b_nom_t; -- : signed(SLC_Z_RPC_LEN*4 + 8 -1 downto 0);

  -- type b_den_t is array  (0 to c_B_DEN_NOM - 1) of signed(SLC_Z_RPC_LEN*4 + 8 -1 downto 0);
  -- signal b_den : b_den_t; -- : signed(SLC_Z_RPC_LEN*4 + 8 -1 downto 0);

  -- signal int_slope, int_slope_2 : signed((SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);

  -- signal s_e_z : signed(126 -1 downto 0);

  -- signal dv_chain   : std_logic_vector(16 downto 0);

  signal div_dout_tvalid : STD_LOGIC;
  -- signal div_dout_tuser : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal div_dout_tdata : STD_LOGIC_VECTOR(55 DOWNTO 0);
  signal div_dout_tdata_q : std_logic_vector(31 downto 0);-- := (others => '0');
  signal div_dout_tdata_r : std_logic_vector(20 downto 0);-- := (others => '0');

  signal e_z_dout_tvalid : STD_LOGIC;
  -- signal e_z_dout_tuser : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal e_z_dout_tdata : STD_LOGIC_VECTOR(23 DOWNTO 0);
  signal e_z_dout_tdata_q : std_logic_vector(15 downto 0);-- := (others => '0');
  signal e_z_dout_tdata_r : std_logic_vector(3 downto 0);-- := (others => '0');
  signal e_y_dout_tvalid : STD_LOGIC;
  -- signal e_y_dout_tuser : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal e_y_dout_tdata : STD_LOGIC_VECTOR(39 DOWNTO 0);
  signal e_y_dout_tdata_q : std_logic_vector(26 downto 0);-- := (others => '0');
  signal e_y_dout_tdata_r : std_logic_vector(3 downto 0);-- := (others => '0');

--   COMPONENT div_gen_r2s_v1
--   PORT (
--     aclk : IN STD_LOGIC;
--     aclken : IN STD_LOGIC;
--     aresetn : IN STD_LOGIC;
--     s_axis_divisor_tvalid : IN STD_LOGIC;
--     s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
--     s_axis_dividend_tvalid : IN STD_LOGIC;
--     s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--     m_axis_dout_tvalid : OUT STD_LOGIC;
--     m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(55 DOWNTO 0)
--   );
-- END COMPONENT;

  -- COMPONENT e_z_div
  --   PORT (
  --     aclk : IN STD_LOGIC;
  --     aclken : IN STD_LOGIC;
  --     aresetn : IN STD_LOGIC;
  --     s_axis_divisor_tvalid : IN STD_LOGIC;
  --     s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  --     s_axis_dividend_tvalid : IN STD_LOGIC;
  --     s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  --     m_axis_dout_tvalid : OUT STD_LOGIC;
  --     m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
  --   );
  -- END COMPONENT;

  -- COMPONENT e_y_div
  --   PORT (
  --     aclk : IN STD_LOGIC;
  --     aclken : IN STD_LOGIC;
  --     aresetn : IN STD_LOGIC;
  --     s_axis_divisor_tvalid : IN STD_LOGIC;
  --     s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  --     s_axis_dividend_tvalid : IN STD_LOGIC;
  --     s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
  --     m_axis_dout_tvalid : OUT STD_LOGIC;
  --     m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(39 DOWNTO 0)
  --   );
  -- END COMPONENT;

  COMPONENT rom
    GENERIC (
      MXADRB : INTEGER;
      MXDATB : INTEGER;
      ROM_FILE : STRING;
      ROM_STYLE : STRING
    );
    PORT (
      clka : IN STD_LOGIC;
      ena : IN STD_LOGIC;
      addra : IN STD_LOGIC_VECTOR;
      douta : OUT STD_LOGIC_VECTOR
    );
    END COMPONENT;

begin

  barrel_r <= convert(i_data_v,barrel_r);

  coin <= to_integer(unsigned(i_cointype));
  
  set_data: process(clk) begin
    if rising_edge(clk) then
      if rst= '1' then
        rad_a <= (others => (others => '0'));
        rpc_a <= (others => (others => '0'));
        num_h_i <= 0;
      else
        if ena =  '1' then

          if i_data_valid = '1' then
            if or_reduce(std_logic_vector(barrel_r.rpc0_posz)) = '0' then
              rad_a(0) <= (others => '0');
            else
              rad_a(0) <= signed(i_rpc_rad_a(0));
            end if;
            if or_reduce(std_logic_vector(barrel_r.rpc1_posz)) = '0' then
              rad_a(1) <= (others => '0');
            else
              rad_a(1) <= signed(i_rpc_rad_a(1));
            end if;
            if or_reduce(std_logic_vector(barrel_r.rpc2_posz)) = '0' then
              rad_a(2) <= (others => '0');
            else
              rad_a(2) <= signed(i_rpc_rad_a(2));
            end if;
            if or_reduce(std_logic_vector(barrel_r.rpc3_posz)) = '0' then
              rad_a(3) <= (others => '0');
            else
              rad_a(3) <= signed(i_rpc_rad_a(3));
            end if;
            -- rad_a(1) <= signed(i_rpc_rad_a(1));
            -- rad_a(2) <= signed(i_rpc_rad_a(2));
            -- rad_a(3) <= signed(i_rpc_rad_a(3));

            rpc_a(0) <= barrel_r.rpc0_posz;
            rpc_a(1) <= barrel_r.rpc1_posz;
            rpc_a(2) <= barrel_r.rpc2_posz;
            rpc_a(3) <= barrel_r.rpc3_posz;

            -- coin type
            case coin is
              when 0 => num_h_i <=  2;
              when 1 => num_h_i <=  3;
              when 2 => num_h_i <=  3;
              when 3 => num_h_i <=  3;
              when 4 => num_h_i <=  3;
              when 5 => num_h_i <=  4;
              when others =>
            end case;

            set_data_dv  <= '1';
          else
            set_data_dv  <= '0';
          end if;
        end if;
      end if;
    end if;
  end process set_data;

  SQR_LOOP: for hit_i in 3 downto 0 generate
    MULT_ZY_ENT : entity shared_lib.VU_generic_pipelined_MATH
      generic map(
        g_OPERATION => "*1",
        g_IN_PIPE_STAGES  => 0,
        g_OUT_PIPE_STAGES => 0,
        g_in_A_WIDTH => rpc_a(hit_i)'length,
        g_in_B_WIDTH => rad_a(hit_i)'length,
        g_OUT_WIDTH => 0
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => std_logic_vector(rpc_a(hit_i)),
        i_in_B      => std_logic_vector(rad_a(hit_i)),
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
        g_in_A_WIDTH => rpc_a(hit_i)'length,
        g_in_B_WIDTH => rpc_a(hit_i)'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => std_logic_vector(rpc_a(hit_i)),
        i_in_B      => std_logic_vector(rpc_a(hit_i)),
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
      g_in_A_WIDTH => rpc_a(0)'length,
      g_in_B_WIDTH => rpc_a(1)'length,
      g_in_C_WIDTH => rpc_a(2)'length,
      g_in_D_WIDTH => rpc_a(3)'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => std_logic_vector(rpc_a(0)),
      i_in_B      => std_logic_vector(rpc_a(1)),
      i_in_C      => std_logic_vector(rpc_a(2)),
      i_in_D      => std_logic_vector(rpc_a(3)),
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
      g_in_A_WIDTH => rad_a(0)'length,
      g_in_B_WIDTH => rad_a(1)'length,
      g_in_C_WIDTH => rad_a(2)'length,
      g_in_D_WIDTH => rad_a(3)'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => std_logic_vector(rad_a(0)),
      i_in_B      => std_logic_vector(rad_a(1)),
      i_in_C      => std_logic_vector(rad_a(2)),
      i_in_D      => std_logic_vector(rad_a(3)),
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
  --------------------------------------------------

  MULT_b_nom1_ent : entity shared_lib.VU_generic_pipelined_MATH
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
      o_result    => bnom_1,
      o_dv        => bnom_1_dv
    );
  -- PL_sum_z : entity vamc_lib.vamc_spl
  --   generic map(
  --     g_DELAY_CYCLES  => 48,
  --     g_PIPELINE_WIDTH    => sum_Z'length
  --   )
  --   port map(
  --     clk         => clk,
  --     rst         => rst,
  --     ena         => ena,
  --     --
  --     i_data      => sum_z,
  --     i_dv        => sum_z_dv,
  --     o_data      => sum_z_pl,
  --     o_dv        => sum_z_pl_dv
  --   );
  MULT_b_nom2_ent : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "*5",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 2,
      g_in_A_WIDTH => sum_y'length,
      g_in_B_WIDTH => sum_z'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => sum_y,
      i_in_B      => sum_z,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => sum_z_dv,
      --
      o_result    => bnom_2,
      o_dv        => bnom_2_dv
    );
  SUB_b_nom_ent : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "-",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 5,
      g_in_A_WIDTH => bnom_1'length + 1,
      g_in_B_WIDTH => bnom_2'length + 1,
      g_OUT_WIDTH => 21
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => '0' & bnom_1,
      i_in_B      => '0' & bnom_2,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => bnom_2_dv or bnom_1_dv,
      --
      o_result    => bnom,
      o_dv        => bnom_dv
    );
  --   b_den(0) <= (num_h_i(1) * sum_zz) - sqr_sum_z;
  MULTSUB_b_den_ent : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "*-",
      g_IN_PIPE_STAGES  => 2,
      g_OUT_PIPE_STAGES => 3,
      g_in_A_WIDTH => 4,
      g_in_B_WIDTH => sum_zz'length,
      g_in_C_WIDTH => sqr_zz'length,
      g_OUT_WIDTH => 24

    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => std_logic_vector(to_unsigned(num_h_i,4)),
      i_in_B      => sum_zz,
      i_in_C      => sqr_zz,
      -- i_in_D      => "0",
      i_dv        => sum_zz_dv,
      --
      o_result    => bden,
      o_dv        => bden_dv
    );
  -----------------------------------------------------------------------------------------------
  -----------------------------------------------------------------------------------------------
  -- int_slope <= (b_nom(c_B_DEN_NOM - 1) * 2048)/b_den(c_B_DEN_NOM -1);
  bnom_sc <= bnom & "00000000000"; --11:2048
  MAIN_DIV_SIM: if g_MAIN_DIV_VU_ENABLE generate
    DIV_b_ent : entity shared_lib.VU_generic_pipelined_MATH
      generic map(
        g_OPERATION => "/",
        g_IN_PIPE_STAGES  => 0,
        g_OUT_PIPE_STAGES => 1,
        g_in_A_WIDTH => bnom_sc'length,
        g_in_B_WIDTH => bden'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => bnom_sc,
        i_in_B      => bden,
        -- i_in_C      => "0",
        -- i_in_D      => "0",
        i_dv        => bden_dv,
        --
        o_result    => bdiv_sim,
        o_dv        => bdiv_sim_dv
      );
  end generate MAIN_DIV_SIM;
  MAIN_DIV_IPR2: if g_MAIN_DIV_IPR2_ENABLE generate
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
        s_axis_divisor_tvalid => bden_dv,
        s_axis_divisor_tdata => bden,
        s_axis_dividend_tvalid => bnom_dv,
        s_axis_dividend_tdata => bnom_sc,
        m_axis_dout_tvalid => div_dout_tvalid,
        -- m_axis_dout_tuser => m_axis_dout_tuser,
        m_axis_dout_tdata => div_dout_tdata
      );
    -- signal div_dout_tdata_q : std_logic_vector(43 downto 0);-- := (others => '0');
    -- signal div_dout_tdata_r : std_logic_vector(31 downto 0);-- := (others => '0');
    div_dout_tdata_q <= div_dout_tdata(55 downto 24);
    div_dout_tdata_r <= div_dout_tdata(20 downto 0);
    bdiv_ipr2 <= div_dout_tdata_q  when div_dout_tvalid = '1' else (others => '0') ;
    bdiv_ipr2_dv <= div_dout_tvalid;
  end generate MAIN_DIV_IPR2;
  
  MAIN_DIV_LUT: if g_MAIN_DIV_LUT_ENABLE generate
    bdiv_lut <= (others => '0');
    -- DIV_b_VU : entity shared_lib.VU_custom_div
    --   generic map(
    --     g_NUMERATOR_LEN   => bnom'length,
    --     g_DENOMINATOR_LEN => bden'length,
    --     g_QUOTIENT_LEN    => bdiv_vu'length,
    --     -- g_MEM_WIDTH       => 2097152,
    --     -- g_SCALAR          => x"200000",
    --     -- g_SCALAR_10X      => x"800"
    --     g_MEMORY_FILE => "main_div.mem",
    --     g_ROM_STYLE => "auto",
    --     g_IN_PIPE_STAGES  => 5,
    --     g_OUT_PIPE_STAGES => 5
    --   )
    --   port map(
    --     clk         => clk,
    --     rst         => rst,
    --     ena         => ena,
    --     --
    --     i_num       => bnom,
    --     i_num_dv    => bnom_dv,
    --     i_den       => bden,
    --     i_den_dv        => bden_dv,
    --     o_res       => bdiv_vu,
    --     o_dv        => bdiv_vu_dv
    -- );

    -- div_main_den_gen : rom
    --   GENERIC MAP(
    --       MXADRB => bden'length,
    --       MXDATB => bden_inv_res'length,
    --       ROM_FILE => "main_div.mem",
    --       ROM_STYLE => "auto"
    --   )
    --   PORT MAP(
    --       ena => '1',
    --       clka => clk,
    --       addra => bden,
    --       douta => bden_inv_res
    --   );

    --   div_main_den_gen : VU_rom
    --     GENERIC MAP(
    --         MXADRB => bden'length,
    --         MXDATB => bden_inv_res'length,
    --         ROM_FILE => "main_div.mem",
    --         ROM_STYLE => "auto"
    --     )
    --     PORT MAP(
    --         ena => '1',
    --         clka => clk,
    --         addra => bden,
    --         dvin => bden_dv,
    --         douta => bden_inv_res,
    --         dvout => bden_inv_dv
    --     );
        

    --   DIV_b_VUX : entity shared_lib.VU_generic_pipelined_MATH
    --   generic map(
    --     g_OPERATION => "*",
    --     g_IN_PIPE_STAGES  => 5,
    --     g_OUT_PIPE_STAGES => 5
    --   )
    --   port map(
    --     clk         => clk,
    --     rst         => rst,
    --     --
    --     i_in_A      => bnom,
    --     i_in_B      => bden_inv_res,
    --     i_in_C      => "0",
    --     i_in_D      => "0",
    --     i_dv        => bden_inv_dv,
    --     --
    --     o_result    => bdiv_vu_res,
    --     o_dv        => bdiv_vu_dv 
    -- );
    --   bdiv_vu_res_descale <= bdiv_vu_res(60 -1 downto 21);
  end generate MAIN_DIV_LUT;


  MAIN_DIV_SEL: if g_MAIN_DIV_SEL = "IPR2" generate
    bdiv <= bdiv_ipr2;
    bdiv_dv <= bdiv_ipr2_dv;
  elsif g_MAIN_DIV_SEL = "LUT" generate
    bdiv <= bdiv_lut;
    bdiv_dv <= bdiv_lut_dv;
  end generate MAIN_DIV_SEL;
  -----------------------------------------------------------------------------------------------

  -----------------------------------------------------------------------------------------------
  -- O
  -----------------------------------------------------------------------------------------------
  
  --   e_y <= (sum_y(1) * 2048) / num_h_i(6);
  sum_y_sc <= sum_y & "00000000000";
  EYN_DIV_SIM: if g_EYN_DIV_VU_ENABLE generate
    DIV_e_y_ent : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "/",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 0,
      g_in_A_WIDTH => sum_y_sc'length,
      g_in_B_WIDTH => 4,
      g_MAIN_MATH_MODE => "div4"
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => sum_y_sc,
      i_in_B      => std_logic_vector(to_unsigned(num_h_i,4)),
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => sum_y_dv,
      --
      o_result    => e_y_aux,
      o_dv        => e_y_aux_dv
    );
  end generate EYN_DIV_SIM;
  -- EYN_DIV_IPR2: if g_EYN_DIV_IPR2_ENABLE generate
  --     COMPONENT e_y_div
  --       PORT (
  --         aclk : IN STD_LOGIC;
  --         aclken : IN STD_LOGIC;
  --         aresetn : IN STD_LOGIC;
  --         s_axis_divisor_tvalid : IN STD_LOGIC;
  --         s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  --         s_axis_dividend_tvalid : IN STD_LOGIC;
  --         s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
  --         m_axis_dout_tvalid : OUT STD_LOGIC;
  --         m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(39 DOWNTO 0)
  --       );
  --     END COMPONENT;
  --   begin
  --     DIV_e_y_IP : e_y_div
  --     PORT MAP (
  --       aclk                    => clk,
  --       aclken                  => ena,
  --       aresetn                 => not rst,
  --       s_axis_divisor_tvalid   => sum_y_dv,
  --       s_axis_divisor_tdata    => "0000" & std_logic_vector(to_unsigned(num_h_i,4)),
  --       s_axis_dividend_tvalid  => sum_y_dv,
  --       s_axis_dividend_tdata   => std_logic_vector(resize(signed(sum_y_sc),32)),
  --       m_axis_dout_tvalid      => e_y_dout_tvalid,
  --       m_axis_dout_tdata       => e_y_dout_tdata
  --     );
  --     -- signal e_y_dout_tdata : STD_LOGIC_VECTOR(39 DOWNTO 0);
  --     -- signal e_y_dout_tdata_q : std_logic_vector(26 downto 0);-- := (others => '0');
  --     -- signal e_y_dout_tdata_r : std_logic_vector(3 downto 0);-- := (others => '0');
  --     e_y_dout_tdata_q <= e_y_dout_tdata(34 downto 8);
  --     e_y_dout_tdata_r <= e_y_dout_tdata(3 downto 0);
  --     --   e_z <= sum_Z(1) / num_h_i(6);
  --     -- e_y <= e_y_dout_tdata_q  when e_y_dout_tvalid = '1' else (others => '0');
  --     -- e_y_dv <= e_y_dout_tvalid;
  --   end generate EYN_DIV_IPR2;
  
  -- EYN_DIV_LUT: if g_EYN_DIV_LUT_ENABLE generate

    -- end generate EYN_DIV_LUT;


  EYN_DIV_SEL: if g_EYN_DIV_SEL = "IPR2" generate
    e_y <= e_y_dout_tdata_q  when e_y_dout_tvalid = '1' else (others => '0');
    e_y_dv <= e_y_dout_tvalid;
    -- elsif g_EYN_DIV_SEL = "LUT" generate

    elsif g_EYN_DIV_SEL = "VU" generate
      e_y <= e_y_aux;
      e_y_dv <= e_y_aux_dv;
    end generate EYN_DIV_SEL;

  -----------------------------------------------------------------------------------------------
  -- sum_y_sc <= sum_y & "0000";
  EZN_DIV_SIM: if g_EZN_DIV_VU_ENABLE generate
    DIV_e_z_ent : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "/",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 0,
      g_in_A_WIDTH => sum_z'length,
      g_in_B_WIDTH => 4,
      g_MAIN_MATH_MODE => "div4"
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => sum_z,
      i_in_B      => std_logic_vector(to_unsigned(num_h_i,4)),
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => sum_z_dv,
      --
      o_result    => e_z_aux,
      o_dv        => e_z_aux_dv
    );
  end generate;
  -- EZN_DIV_IPR2: if g_EZN_DIV_IPR2_ENABLE generate
  --   COMPONENT e_z_div
  --     PORT (
  --       aclk : IN STD_LOGIC;
  --       aclken : IN STD_LOGIC;
  --       aresetn : IN STD_LOGIC;
  --       s_axis_divisor_tvalid : IN STD_LOGIC;
  --       s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  --       s_axis_dividend_tvalid : IN STD_LOGIC;
  --       s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  --       m_axis_dout_tvalid : OUT STD_LOGIC;
  --       m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
  --     );
  --     END COMPONENT;
  -- begin
  --   DIV_e_z_IP : e_z_div
  --     PORT MAP (
  --       aclk => clk,
  --       aclken => ena,
  --       aresetn => not rst,
  --       s_axis_divisor_tvalid => sum_z_dv,
  --       s_axis_divisor_tdata => "0000" & std_logic_vector(to_unsigned(num_h_i,4)),
  --       s_axis_dividend_tvalid => sum_z_dv,
  --       s_axis_dividend_tdata => sum_z,
  --       m_axis_dout_tvalid => e_z_dout_tvalid,
  --       m_axis_dout_tdata => e_z_dout_tdata
  --     );
  --   -- signal e_y_dout_tdata : STD_LOGIC_VECTOR(39 DOWNTO 0);
  --   -- signal e_y_dout_tdata_q : std_logic_vector(26 downto 0);-- := (others => '0');
  --   -- signal e_y_dout_tdata_r : std_logic_vector(3 downto 0);-- := (others => '0');
  --   e_z_dout_tdata_q <= e_z_dout_tdata(23 downto 8);
  --   e_z_dout_tdata_r <= e_z_dout_tdata(3 downto 0);
  --   --   e_z <= sum_Z(1) / num_h_i(6);
  --   -- e_y <= e_y_dout_tdata_q  when e_y_dout_tvalid = '1' else (others => '0');
  --   -- e_y_dv <= e_y_dout_tvalid;
  -- end generate EZN_DIV_IPR2;
  
  -- EZN_DIV_LUT: if g_EZN_DIV_LUT_ENABLE generate

  -- end generate EZN_DIV_LUT;


  EZN_DIV_SEL: if g_EZN_DIV_SEL = "IPR2" generate
    e_z <= e_z_dout_tdata_q  when e_z_dout_tvalid = '1' else (others => '0');
    e_z_dv <= e_z_dout_tvalid;
  -- elsif g_EZN_DIV_SEL = "LUT" generate

  elsif g_EZN_DIV_SEL = "VU" generate
    e_z <= e_z_aux;
    e_z_dv <= e_z_aux_dv;
  end generate EZN_DIV_SEL;

  -----------------------------------------------------------------------------------------------
    -- DIV_e_z_ent : entity shared_lib.VU_generic_pipelined_MATH
    --   generic map(
    --     g_OPERATION => "/",
    --     g_IN_PIPE_STAGES  => 11,
    --     g_OUT_PIPE_STAGES => 50,
    --     g_in_A_WIDTH => sum_z'length,
    --     g_in_B_WIDTH => 4
    --   )
    --   port map(

    --   );
    -- DIV_e_z_IP : e_z_div
    --   PORT MAP (
    --     aclk => clk,
    --     aclken => ena,
    --     aresetn => not rst,
    --     s_axis_divisor_tvalid => sum_z_dv,
    --     s_axis_divisor_tdata => "0000" & std_logic_vector(to_unsigned(num_h_i,4)),
    --     s_axis_dividend_tvalid => sum_z_dv,
    --     s_axis_dividend_tdata => sum_z,
    --     m_axis_dout_tvalid => e_z_dout_tvalid,
    --     m_axis_dout_tdata => e_z_dout_tdata
    --   );
    -- -- signal e_z_dout_tdata : STD_LOGIC_VECTOR(23 DOWNTO 0);
    -- -- signal e_z_dout_tdata_q : std_logic_vector(15 downto 0);-- := (others => '0');
    -- -- signal e_z_dout_tdata_r : std_logic_vector(3 downto 0);-- := (others => '0');
    -- e_z_dout_tdata_q <= e_z_dout_tdata(23 downto 8);
    -- e_z_dout_tdata_r <= e_z_dout_tdata(3 downto 0);
    -- e_z <= e_z_dout_tdata_q  when e_z_dout_tvalid = '1' else (others => '0');
    -- e_z_dv <= e_z_dout_tvalid;
  -----------------------------------------------------------------------------------------------
  PL_e_z : entity vamc_lib.vamc_spl
    generic map(
      g_MEMORY_TYPE => "test",
      -- g_PIPELINE_Tgit YPE => "ring_buffer",
      g_PIPELINE_TYPE   => "shift_reg", 
      g_RB_TYPE => "simple",
      g_DELAY_CYCLES  => 44,
      g_PIPELINE_WIDTH    => e_z'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      --
      i_data      => e_z,
      i_dv        => e_z_dv,--bdiv_dv,,
      o_data      => e_z_pl,
      o_dv        => e_z_pl_dv
    );
  -- s_e_z <= (int_slope * e_z);
  s_e_z_ent : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "*6",
      g_IN_PIPE_STAGES  => 4,
      g_OUT_PIPE_STAGES => 4,
      g_in_A_WIDTH => bdiv'length,
      g_in_B_WIDTH => e_z_pl'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => bdiv,
      i_in_B      => e_z_pl,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => bdiv_dv and e_z_pl_dv,
      --
      o_result    => s_e_z,
      o_dv        => s_e_z_dv
    );
  --   
  PL_e_y : entity vamc_lib.vamc_spl
    generic map(
      g_PIPELINE_TYPE   => "shift_reg", 
      g_DELAY_CYCLES  => 53,
      g_PIPELINE_WIDTH    => e_y'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      --
      i_data      => e_y,
      i_dv        => e_y_dv,--bdiv_dv,,
      o_data      => e_y_pl,
      o_dv        => e_y_pl_dv
    );
  --   o_offset <= resize((e_y_2) - s_e_z,32);
  off_ent : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "--",
      g_IN_PIPE_STAGES  => 0,
      g_OUT_PIPE_STAGES => 0,
      g_in_A_WIDTH => e_y_pl'length,
      g_in_B_WIDTH => s_e_z'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => e_y_pl,
      i_in_B      => s_e_z,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => s_e_z_dv and e_y_pl_dv,
      --
      o_result    => int_off,
      o_dv        => int_off_dv
    );

  PL_slope : entity vamc_lib.vamc_spl
    generic map(
    g_PIPELINE_TYPE   => "shift_reg", 
      g_DELAY_CYCLES  => 10,
      g_PIPELINE_WIDTH    => 32
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      --
      i_data      => std_logic_vector(resize(signed(bdiv),32)),
      i_dv        => bdiv_dv,
      o_data      => int_slope,
      o_dv        => int_slope_dv
    );
  o_slope <= signed(int_slope);
  o_offset <= resize(signed(int_off),32);
  o_data_valid <= int_slope_dv;
  
end architecture beh;
