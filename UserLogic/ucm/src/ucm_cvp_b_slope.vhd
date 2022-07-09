--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc vector processor slope calculator
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
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

library  vamc_lib;

entity ucm_cvp_b_slope is
  generic(
    g_NUM_RPC_LAYERS : integer := 4
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
  signal sum_y_sc   : std_logic_vector(11 + sum_y'length -1 downto 0);
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
  signal bnom       : std_logic_vector(1 + bnom_2'length -1 downto 0);
  signal bnom_sc    : std_logic_vector(11 + bnom'length -1 downto 0);
  signal bnom_dv    : std_logic;
  signal bden       : std_logic_vector(4 + sum_zz'length-1 downto 0);
  signal bden_dv    : std_logic;

  signal bdiv       : std_logic_vector(max(bden'length,bnom_sc'length) -1 downto 0);
  signal bdiv_dv    : std_logic;

  signal e_y        : std_logic_vector(max(4,sum_y_sc'length) -1 downto 0);
  signal e_y_dv     : std_logic;

  signal e_z        : std_logic_vector(max(4,sum_z'length) -1 downto 0);
  signal e_z_dv     : std_logic;

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

  signal m_axis_dout_tvalid : STD_LOGIC;
  signal m_axis_dout_tuser : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal m_axis_dout_tdata : STD_LOGIC_VECTOR(79 DOWNTO 0);
  signal e_z_dout_tvalid : STD_LOGIC;
  signal e_z_dout_tuser : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal e_z_dout_tdata : STD_LOGIC_VECTOR(23 DOWNTO 0);
  signal e_y_dout_tvalid : STD_LOGIC;
  signal e_y_dout_tuser : STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal e_y_dout_tdata : STD_LOGIC_VECTOR(39 DOWNTO 0);

  COMPONENT div_gen_r2s_v1
    PORT (
      aclk : IN STD_LOGIC;
      aclken : IN STD_LOGIC;
      aresetn : IN STD_LOGIC;
      s_axis_divisor_tvalid : IN STD_LOGIC;
      s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axis_dividend_tvalid : IN STD_LOGIC;
      s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
      m_axis_dout_tvalid : OUT STD_LOGIC;
      m_axis_dout_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(79 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT e_z_div
    PORT (
      aclk : IN STD_LOGIC;
      aclken : IN STD_LOGIC;
      aresetn : IN STD_LOGIC;
      s_axis_divisor_tvalid : IN STD_LOGIC;
      s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axis_dividend_tvalid : IN STD_LOGIC;
      s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      m_axis_dout_tvalid : OUT STD_LOGIC;
      m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT e_y_div
    PORT (
      aclk : IN STD_LOGIC;
      aclken : IN STD_LOGIC;
      aresetn : IN STD_LOGIC;
      s_axis_divisor_tvalid : IN STD_LOGIC;
      s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axis_dividend_tvalid : IN STD_LOGIC;
      s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axis_dout_tvalid : OUT STD_LOGIC;
      m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(39 DOWNTO 0)
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
    MULT_ZY_ENT : entity shared_lib.generic_pipelined_MATH
      generic map(
        g_OPERATION => "*",
        g_IN_PIPE_STAGES  => 2,
        g_OUT_PIPE_STAGES => 2
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => std_logic_vector(rpc_a(hit_i)),
        i_in_B      => std_logic_vector(rad_a(hit_i)),
        i_in_C      => "0",
        i_in_D      => "0",
        i_dv        => set_data_dv,
        --
        o_result    => mult_zy(hit_i),
        o_dv        => mult_zy_dv(hit_i)
    );
    -- MULT_ZY_ENT : entity shared_lib.VUGPPMATH
    --   generic map(
    --     g_OPERATION => "*",
    --     g_IN_PIPE_STAGES  => 2,
    --     g_OUT_PIPE_STAGES => 2,
    --     g_length_in_A => SLC_Z_RPC_LEN, 
    --     g_length_in_B => SLC_Z_RPC_LEN
    --   )
    --   port map(
    --     clk         => clk,
    --     rst         => rst,
    --     --
    --     i_in_A      => rpc_a(hit_i),
    --     i_in_B      => rad_a(hit_i),
    --     -- i_in_C      => 0,
    --     -- i_in_D      => 0,
    --     i_dv        => set_data_dv,
    --     --
    --     o_result    => mult_zy(hit_i),
    --     o_dv        => mult_zy_dv(hit_i)
    -- );
    MULT_ZZ_ENT : entity shared_lib.generic_pipelined_MATH
      generic map(
        g_OPERATION => "*",
        g_IN_PIPE_STAGES  => 2,
        g_OUT_PIPE_STAGES => 2
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => std_logic_vector(rpc_a(hit_i)),
        i_in_B      => std_logic_vector(rpc_a(hit_i)),
        i_in_C      => "0",
        i_in_D      => "0",
        i_dv        => set_data_dv,
        --
        o_result    => mult_zz(hit_i),
        o_dv        => mult_zz_dv(hit_i)
    );
  end generate SQR_LOOP;
  SUM_Z_ENT : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "+++",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1
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
  SUM_Y_ENT : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "+++",
      g_IN_PIPE_STAGES  => 2,
      g_OUT_PIPE_STAGES => 3
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

  -- dv_chain(1) <= or_reduce(mult_zy_dv);

  SUM_ZY_ENT : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "+++",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1
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
  SUM_ZZ_ENT : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "+++",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1
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
  SQR_ZZ_ENT : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "*",
      g_IN_PIPE_STAGES  => 2,
      g_OUT_PIPE_STAGES => 2
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => sum_z,
      i_in_B      => sum_z,
      i_in_C      => "0",
      i_in_D      => "0",
      i_dv        => sum_z_dv,
      --
      o_result    => sqr_zz,
      o_dv        => sqr_zz_dv
  );
  --------------------------------------------------
  --   b_nom(0) <= (num_h_i(1) * sum_zy) - (sum_y(0) * sum_Z(0));
  b_nom1_ent : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "*",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 2
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => std_logic_vector(to_unsigned(num_h_i,4)),
      i_in_B      => sum_zy,
      i_in_C      => "0",
      i_in_D      => "0",
      i_dv        => sum_zy_dv,
      --
      o_result    => bnom_1,
      o_dv        => bnom_1_dv
  );
  PL_sum_z : entity vamc_lib.vamc_spl
    generic map(
      g_DELAY_CYCLES  => 3,
      g_PIPELINE_WIDTH    => sum_Z'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      ena         => ena,
      --
      i_data      => sum_z,
      i_dv        => sum_z_dv,
      o_data      => sum_z_pl,
      o_dv        => sum_z_pl_dv
  );
  b_nom2_ent : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "*",
      g_IN_PIPE_STAGES  => 2,
      g_OUT_PIPE_STAGES => 3
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => sum_y,
      i_in_B      => sum_z_pl,
      i_in_C      => "0",
      i_in_D      => "0",
      i_dv        => sum_z_pl_dv,
      --
      o_result    => bnom_2,
      o_dv        => bnom_2_dv
  );
  b_nom_ent : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "-",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 3
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => '0' & bnom_1,
      i_in_B      => '0' & bnom_2,
      i_in_C      => "0",
      i_in_D      => "0",
      i_dv        => bnom_2_dv,
      --
      o_result    => bnom,
      o_dv        => bnom_dv
  );
  --   b_den(0) <= (num_h_i(1) * sum_zz) - sqr_sum_z;
  b_den_ent : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "*-",
      g_IN_PIPE_STAGES  => 3,
      g_OUT_PIPE_STAGES => 5
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => std_logic_vector(to_unsigned(num_h_i,4)),
      i_in_B      => sum_zz,
      i_in_C      => sqr_zz,
      i_in_D      => "0",
      i_dv        => sum_zz_dv,
      --
      o_result    => bden,
      o_dv        => bden_dv
  );

  -- int_slope <= (b_nom(c_B_DEN_NOM - 1) * 2048)/b_den(c_B_DEN_NOM -1);
  bnom_sc <= bnom & "00000000000";
  b_div_ent : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "/",
      g_IN_PIPE_STAGES  => 5,
      g_OUT_PIPE_STAGES => 5
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => bnom_sc,
      i_in_B      => bden,
      i_in_C      => "0",
      i_in_D      => "0",
      i_dv        => bden_dv,
      --
      o_result    => bdiv,
      o_dv        => bdiv_dv
  );
  IP_R2S : div_gen_r2s_v1
  PORT MAP (
    aclk => clk,
    aclken => ena,
    aresetn => not rst,
    s_axis_divisor_tvalid => bden_dv,
    s_axis_divisor_tdata => bden,
    s_axis_dividend_tvalid => bnom_dv,
    s_axis_dividend_tdata => "0000" & bnom_sc,
    m_axis_dout_tvalid => m_axis_dout_tvalid,
    -- m_axis_dout_tuser => m_axis_dout_tuser,
    m_axis_dout_tdata => m_axis_dout_tdata
  );

  --   e_y <= (sum_y(1) * 2048) / num_h_i(6);
  sum_y_sc <= sum_y & "00000000000";
  e_y_ent : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "/",
      g_IN_PIPE_STAGES  => 11,
      g_OUT_PIPE_STAGES => 11
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => sum_y_sc,
      i_in_B      => std_logic_vector(to_unsigned(num_h_i,4)),
      i_in_C      => "0",
      i_in_D      => "0",
      i_dv        => sum_y_dv,
      --
      o_result    => e_y,
      o_dv        => e_y_dv
  );
  your_instance_name : e_y_div
  PORT MAP (
    aclk => clk,
    aclken => ena,
    aresetn => not rst,
    s_axis_divisor_tvalid => sum_y_dv,
    s_axis_divisor_tdata => "0000" & std_logic_vector(to_unsigned(num_h_i,4)),
    s_axis_dividend_tvalid => sum_y_dv,
    s_axis_dividend_tdata => sum_y_sc,
    m_axis_dout_tvalid => e_y_axis_dout_tvalid,
    m_axis_dout_tdata => e_y_axis_dout_tdata
  );
  --   e_z <= sum_Z(1) / num_h_i(6);
  e_z_ent : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "/",
      g_IN_PIPE_STAGES  => 11,
      g_OUT_PIPE_STAGES => 51
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => sum_z,
      i_in_B      => std_logic_vector(to_unsigned(num_h_i,4)),
      i_in_C      => "0",
      i_in_D      => "0",
      i_dv        => sum_z_dv,
      --
      o_result    => e_z,
      o_dv        => e_z_dv
  );
  IP_e_z_ent : e_z_div
  PORT MAP (
    aclk => clk,
    aclken => ena,
    aresetn => not rst,
    s_axis_divisor_tvalid => sum_z_dv,
    s_axis_divisor_tdata => "0000" & std_logic_vector(to_unsigned(num_h_i,4)),
    s_axis_dividend_tvalid => sum_z_dv,
    s_axis_dividend_tdata => sum_z,
    m_axis_dout_tvalid => e_z_dout_tvalid,
    m_axis_dout_tdata => e_z_dout_tdata
  );
  -- s_e_z <= (int_slope * e_z);
  s_e_z_ent : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "*",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => bdiv,
      i_in_B      => e_z,
      i_in_C      => "0",
      i_in_D      => "0",
      i_dv        => bdiv_dv,
      --
      o_result    => s_e_z,
      o_dv        => s_e_z_dv
  );
  --   

  --   o_offset <= resize((e_y_2) - s_e_z,32);
  off_ent : entity shared_lib.generic_pipelined_MATH
    generic map(
      g_OPERATION => "--",
      g_IN_PIPE_STAGES  => 4,
      g_OUT_PIPE_STAGES => 4
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => e_y,
      i_in_B      => s_e_z,
      i_in_C      => "0",
      i_in_D      => "0",
      i_dv        => s_e_z_dv,
      --
      o_result    => int_off,
      o_dv        => int_off_dv
  );

  PL_slope : entity vamc_lib.vamc_spl
    generic map(
      g_DELAY_CYCLES  => 6,
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

-- set_data: process(clk) begin
--   if rising_edge(clk) then
--     if rst= '1' then
--       rad_a <= (others => (others => '0'));
--       rpc_a <= (others => (others => '0'));
--       -- dv_chain <= (others => '0');
--       -- int_slope <= (others => '0');
--       -- o_slope <= (others => '0');
--       -- int_offset <= (others => '0');
--       -- o_offset <= (others => '0');
--       -- e_z <= (others => '0');
--       -- e_y <= (others => '0');
--       -- sum_zy <= (others => '0');
--       -- sum_y <= (others => (others => '0'));
--       -- sum_z <= (others => (others => '0'));
--       -- sum_zz <= (others => '0');
--       -- sqr_sum_z <= (others => '0');
--       -- b_nom <= (others => (others => '0'));
--       -- b_den <= (others => (others => '0'));
--       num_h_i <= 0;
--     else
--       if ena =  '1' then

--         -- dv_chain(7 downto 0) <= dv_chain(6 downto 0) & i_data_valid;

--         -- set_data_dv  <= i_data_valid;
--         -- for i in 0 to 15 loop
--         --   num_h_i(i+1) <= num_h_i(i);
--         -- end loop;
        
--         -- sum_y(1) <= sum_y(0);
--         -- sum_z(1) <= sum_z(0);

--         if i_data_valid = '1' then
--           rad_a(0) <= signed(i_rpc_rad_a(0));
--           rad_a(1) <= signed(i_rpc_rad_a(1));
--           rad_a(2) <= signed(i_rpc_rad_a(2));
--           rad_a(3) <= signed(i_rpc_rad_a(3));

--           rpc_a(0) <= barrel_r.rpc0_posz;
--           rpc_a(1) <= barrel_r.rpc1_posz;
--           rpc_a(2) <= barrel_r.rpc2_posz;
--           rpc_a(3) <= barrel_r.rpc3_posz;

--           -- coin type
--           case coin is
--             when 0 => num_h_i <=  2;
--             when 1 => num_h_i <=  3;
--             when 2 => num_h_i <=  3;
--             when 3 => num_h_i <=  3;
--             when 4 => num_h_i <=  3;
--             when 5 => num_h_i <=  4;
--             when others =>
--           end case;
--           -- -- set r
--           -- case coin is
--           --   when 0 =>
--           --     rad_a(0) <= signed(i_rpc_rad_a(0));
--           --     rad_a(1) <= signed(i_rpc_rad_a(3));
--           --     rad_a(2) <= (others => '0');
--           --     rad_a(3) <= (others => '0');
--           --   when 1 =>
--           --     rad_a(0) <= signed(i_rpc_rad_a(0));
--           --     rad_a(1) <= signed(i_rpc_rad_a(1));
--           --     rad_a(2) <= signed(i_rpc_rad_a(2));
--           --     rad_a(3) <= (others => '0');
--           --   when 2 =>
--           --     rad_a(0) <= signed(i_rpc_rad_a(0));
--           --     rad_a(1) <= signed(i_rpc_rad_a(1));
--           --     rad_a(2) <= (others => '0');
--           --     rad_a(3) <= (others => '0');
--           --   when 3 =>
--           --     rad_a(0) <= signed(i_rpc_rad_a(0));
--           --     rad_a(1) <= signed(i_rpc_rad_a(0));
--           --     rad_a(2) <= signed(i_rpc_rad_a(3));
--           --     rad_a(3) <= (others => '0');
--           --   when 4 =>
--           --     rad_a(0) <= signed(i_rpc_rad_a(1));
--           --     rad_a(1) <= signed(i_rpc_rad_a(2));
--           --     rad_a(2) <= signed(i_rpc_rad_a(3));
--           --     rad_a(3) <= (others => '0');
--           --   when 5 =>  
--           --     rad_a(0) <= signed(i_rpc_rad_a(0));
--           --     rad_a(1) <= signed(i_rpc_rad_a(1));
--           --     rad_a(2) <= signed(i_rpc_rad_a(2));
--           --     rad_a(3) <= signed(i_rpc_rad_a(3));
          
--           --   when others => 
--           -- end case;
--           -- -- set_Z
--           -- case coin is
--           --   when 0 =>
--           --     rpc_a(0) <= barrel_r.rpc0_posz;
--           --     rpc_a(1) <= barrel_r.rpc3_posz;
--           --     rpc_a(2) <= (others => '0');
--           --     rpc_a(3) <= (others => '0');
--           --   when 1 =>
--           --     rpc_a(0) <= barrel_r.rpc0_posz;
--           --     rpc_a(1) <= barrel_r.rpc1_posz;
--           --     rpc_a(2) <= barrel_r.rpc2_posz;
--           --     rpc_a(3) <= (others => '0');
--           --   when 2 =>
--           --     rpc_a(0) <= barrel_r.rpc0_posz;
--           --     rpc_a(1) <= barrel_r.rpc1_posz;
--           --     rpc_a(2) <= (others => '0');
--           --     rpc_a(3) <= (others => '0');
--           --   when 3 =>
--           --     rpc_a(0) <= barrel_r.rpc0_posz;
--           --     rpc_a(1) <= barrel_r.rpc2_posz;
--           --     rpc_a(2) <= barrel_r.rpc3_posz;
--           --     rpc_a(3) <= (others => '0');
--           --   when 4 =>
--           --     rpc_a(0) <= barrel_r.rpc1_posz;
--           --     rpc_a(1) <= barrel_r.rpc2_posz;
--           --     rpc_a(2) <= barrel_r.rpc3_posz;
--           --     rpc_a(3) <= (others => '0');
--           --   when 5 =>  
--           --     rpc_a(0) <= barrel_r.rpc0_posz;
--           --     rpc_a(1) <= barrel_r.rpc1_posz;
--           --     rpc_a(2) <= barrel_r.rpc2_posz;
--           --     rpc_a(3) <= barrel_r.rpc3_posz;
          
--           --   when others => 
--           -- end case;
--           set_data_dv  <= '1';
--         else
--           -- rad_a <= (others => (others => '0'));
--           -- rpc_a <= (others => (others => '0'));
--           -- num_h_i <= 0;
--           set_data_dv  <= '0';
--         end if;
--       end if;
--     end if;
--   end if;
-- end process set_data;

-- if set_data_dv = '1' then
--   if num_h_i(0) = 2 then
--     sum_zy <=     (resize(rpc_a(0),SLC_Z_RPC_LEN +2) * resize(rad_a(0),SLC_Z_RPC_LEN +2)) + 
--                   (resize(rpc_a(1),SLC_Z_RPC_LEN +2) * resize(rad_a(1),SLC_Z_RPC_LEN +2));
--     sum_y(0) <=   resize(rad_a(0),SLC_Z_RPC_LEN +2) + resize(rad_a(1),SLC_Z_RPC_LEN +2);
--     sum_z(0) <=   resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2);
--     sum_zz <=     (resize(rpc_a(0),SLC_Z_RPC_LEN +2) * resize(rpc_a(0),SLC_Z_RPC_LEN +2)) + 
--                   (resize(rpc_a(1),SLC_Z_RPC_LEN +2) * resize(rpc_a(1),SLC_Z_RPC_LEN +2));
--     sqr_sum_z <=  (resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2)) * 
--                   (resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2));
--   elsif num_h_i(0) = 3 then
--     sum_zy <=     (resize(rpc_a(0),SLC_Z_RPC_LEN +2) * resize(rad_a(0),SLC_Z_RPC_LEN +2)) + 
--                   (resize(rpc_a(1),SLC_Z_RPC_LEN +2) * resize(rad_a(1),SLC_Z_RPC_LEN +2)) + 
--                   (resize(rpc_a(2),SLC_Z_RPC_LEN +2) * resize(rad_a(2),SLC_Z_RPC_LEN +2));
--     sum_y(0) <=   resize(rad_a(0),SLC_Z_RPC_LEN +2) + resize(rad_a(1),SLC_Z_RPC_LEN +2) + 
--                   resize(rad_a(2),SLC_Z_RPC_LEN +2);
--     sum_z(0) <=   resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2) + 
--                   resize(rpc_a(2),SLC_Z_RPC_LEN +2);
--     sum_zz <=     (resize(rpc_a(0),SLC_Z_RPC_LEN +2) * resize(rpc_a(0),SLC_Z_RPC_LEN +2)) + 
--                   (resize(rpc_a(1),SLC_Z_RPC_LEN +2) * resize(rpc_a(1),SLC_Z_RPC_LEN +2)) + 
--                   (resize(rpc_a(2),SLC_Z_RPC_LEN +2) * resize(rpc_a(2),SLC_Z_RPC_LEN +2));
--     sqr_sum_z <=  (resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2) + resize(rpc_a(2),SLC_Z_RPC_LEN +2)) * 
--                   (resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2) + resize(rpc_a(2),SLC_Z_RPC_LEN +2));
--   elsif num_h_i(0) = 4 then
--     sum_zy <=     (resize(rpc_a(0),SLC_Z_RPC_LEN +2) * resize(rad_a(0),SLC_Z_RPC_LEN +2)) + 
--                   (resize(rpc_a(1),SLC_Z_RPC_LEN +2) * resize(rad_a(1),SLC_Z_RPC_LEN +2)) + 
--                   (resize(rpc_a(2),SLC_Z_RPC_LEN +2) * resize(rad_a(2),SLC_Z_RPC_LEN +2)) + 
--                   (resize(rpc_a(3),SLC_Z_RPC_LEN +2) * resize(rad_a(3),SLC_Z_RPC_LEN +2));
--     sum_y(0) <=   resize(rad_a(0),SLC_Z_RPC_LEN +2) + resize(rad_a(1),SLC_Z_RPC_LEN +2) + 
--                   resize(rad_a(2),SLC_Z_RPC_LEN +2) + resize(rad_a(3),SLC_Z_RPC_LEN +2);
--     sum_z(0) <=   resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2) + 
--                   resize(rpc_a(2),SLC_Z_RPC_LEN +2) + resize(rpc_a(3),SLC_Z_RPC_LEN +2);
--     sum_zz <=     (resize(rpc_a(0),SLC_Z_RPC_LEN +2) * resize(rpc_a(0),SLC_Z_RPC_LEN +2)) + 
--                   (resize(rpc_a(1),SLC_Z_RPC_LEN +2) * resize(rpc_a(1),SLC_Z_RPC_LEN +2)) + 
--                   (resize(rpc_a(2),SLC_Z_RPC_LEN +2) * resize(rpc_a(2),SLC_Z_RPC_LEN +2)) +
--                   (resize(rpc_a(3),SLC_Z_RPC_LEN +2) * resize(rpc_a(3),SLC_Z_RPC_LEN +2));
--     sqr_sum_z <=  (resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2) + resize(rpc_a(2),SLC_Z_RPC_LEN +2) + resize(rpc_a(3),SLC_Z_RPC_LEN +2)) * 
--                   (resize(rpc_a(0),SLC_Z_RPC_LEN +2) + resize(rpc_a(1),SLC_Z_RPC_LEN +2) + resize(rpc_a(2),SLC_Z_RPC_LEN +2) + resize(rpc_a(3),SLC_Z_RPC_LEN +2));
--   else
--     sum_zy <= (others => '0');
--     sum_y(0) <= (others => '0');
--     sum_z(0) <= (others => '0');
--     sum_zz <= (others => '0');
--     sqr_sum_z <= (others => '0');
--   end if;
--   dv_chain(1)  <= '1';
-- else
--   dv_chain(1)  <= '0';
-- end if;

-- if dv_chain(1) = '1' then
--   b_nom(0) <= (num_h_i(1) * sum_zy) - (sum_y(0) * sum_Z(0));
--   b_den(0) <= (num_h_i(1) * sum_zz) - sqr_sum_z;
--   dv_chain(2)  <= '1';
-- else
--   dv_chain(2)  <= '0';
-- end if;

-- for i in 0 to c_B_DEN_NOM - 2 loop
--   b_nom(i + 1) <= b_nom(i);
--   b_den(i + 1) <= b_den(i);
-- end loop;

-- for i in 2 to c_B_DEN_NOM loop
--   dv_chain(i + 1) <= dv_chain(i);
-- end loop;

-- if dv_chain(6) = '1' then
--   int_slope <= (b_nom(c_B_DEN_NOM - 1) * 2048)/b_den(c_B_DEN_NOM -1);
--   --
--   e_y <= (sum_y(1) * 2048) / num_h_i(6);
--   e_z <= sum_Z(1) / num_h_i(6);
--   dv_chain(7)  <= '1';
-- else
--   int_slope <= (others => '0');
--   e_y <= (others => '0');
--   e_z <= (others => '0');
--   dv_chain(7)  <= '0';
-- end if;

-- if dv_chain(7) = '1' then
--   int_slope_2 <= int_slope;
--   s_e_z <= (int_slope * e_z);
--   e_y_2 <= e_y;
--   dv_chain(8)  <= '1';
-- else
--   dv_chain(8)  <= '0';
--   int_slope_2 <= (others => '0');
--   s_e_z <= (others => '0');
--   e_y_2 <=  (others => '0');
-- end if;

-- if dv_chain(8) = '1' then
--   o_slope <= resize(int_slope_2,32);
--   o_offset <= resize((e_y_2) - s_e_z,32);
--   -- o_offset <= (e_y * 1000) - resize((int_slope * e_z * 1000),126);
--   dv_chain(9)  <= '1';
-- else
--   o_slope <= (others => '0');
--   o_offset <= (others => '0');
--   dv_chain(9) <= '0';
-- end if;






-- set coin type
    -- num_h_i <=  2 when coin = 0 else
    --           3 when coin = 1 else
    --           3 when coin = 2 else
    --           3 when coin = 3 else
    --           3 when coin = 4 else
    --           4 when coin = 5 else
    --           0;
    -- set z
    -- rpc_a(0) <= barrel_r.rpc0_posz when coin = 0 else
    --             barrel_r.rpc0_posz when coin = 1 else
    --             barrel_r.rpc0_posz when coin = 2 else
    --             barrel_r.rpc0_posz when coin = 3 else
    --             barrel_r.rpc1_posz when coin = 4 else
    --             barrel_r.rpc0_posz when coin = 5 else
    --             (others => '0');
    -- rpc_a(1) <= barrel_r.rpc3_posz when coin = 0 else
    --             barrel_r.rpc1_posz when coin = 1 else
    --             barrel_r.rpc1_posz when coin = 2 else
    --             barrel_r.rpc2_posz when coin = 3 else
    --             barrel_r.rpc2_posz when coin = 4 else
    --             barrel_r.rpc1_posz when coin = 5 else
    --               (others => '0');
    -- rpc_a(2) <= (others => '0') when coin = 0 else
    --             barrel_r.rpc2_posz when coin = 1 else
    --             barrel_r.rpc3_posz when coin = 2 else
    --             barrel_r.rpc3_posz when coin = 3 else
    --             barrel_r.rpc2_posz when coin = 4 else
    --             barrel_r.rpc2_posz when coin = 5 else
    --             (others => '0');
    -- rpc_a(3) <= barrel_r.rpc3_posz when coin = 5 else
    --             (others => '0');
    -- set r
    -- rad_a(0) <= PHY_BARREL_R0 when coin = 0 else
    --             PHY_BARREL_R0 when coin = 1 else
    --             PHY_BARREL_R0 when coin = 2 else
    --             PHY_BARREL_R0 when coin = 3 else
    --             PHY_BARREL_R1 when coin = 4 else
    --             PHY_BARREL_R0 when coin = 5 else
    --             (others => '0');
    -- rad_a(1) <= PHY_BARREL_R3 when coin = 0 else
    --             PHY_BARREL_R1 when coin = 1 else
    --             PHY_BARREL_R1 when coin = 2 else
    --             PHY_BARREL_R2 when coin = 3 else
    --             PHY_BARREL_R2 when coin = 4 else
    --             PHY_BARREL_R1 when coin = 5 else
    --             (others => '0');
    -- rad_a(2) <= (others => '0') when coin = 0 else
    --             PHY_BARREL_R2 when coin = 1 else
    --             PHY_BARREL_R3 when coin = 2 else
    --             PHY_BARREL_R3 when coin = 3 else
    --             PHY_BARREL_R2 when coin = 4 else
    --             PHY_BARREL_R2 when coin = 5 else
    --             (others => '0');
    -- rad_a(3) <= PHY_BARREL_R3 when coin = 5 else
    --             (others => '0');
    
