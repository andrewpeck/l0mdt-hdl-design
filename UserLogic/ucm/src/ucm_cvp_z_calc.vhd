--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: slc vector processor center window z calculator
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


entity ucm_cvp_z_calc is
  generic(
    g_STATION_RADIUS      : integer := 0;  --station 
    g_INPUT_RESOLUTION    : real := 1.0;
    g_OUTPUT_RESOLUTION   : real := 1.0;
    g_OUTPUT_WIDTH        : integer := 10;
    g_DIV_IP_R2_EN        : std_logic := '1';
    g_DIV_VU_EN           : std_logic := '1';
    g_DIV_SEL             : string := "IPR2"
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic;
    --
    i_mdt_R       : in std_logic_vector(UCM_Z_ROI_LEN-1 downto 0);
    i_mdt_R_dv    : in std_logic;
    -- i_chamb_ieta  : in unsigned(VEC_MDTID_CHAMBER_IETA_LEN-1 downto 0);
    i_offset      : in signed(31 downto 0);--signed(126 -1 downto 0);
    i_slope       : in signed(31 downto 0);--signed((SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);
    i_data_valid  : in std_logic;
    --
    o_vec_z_pos     : out unsigned(UCM2HPS_VEC_POS_LEN-1 downto 0);
    o_vec_z_pos_dv  : out std_logic
    
  );
end entity ucm_cvp_z_calc;

architecture beh of ucm_cvp_z_calc is

  constant mult : std_logic_vector := std_logic_vector(to_unsigned(integer(UCM_Z_ROI_MULT/SLC_Z_RPC_MULT),5));
  -- constant int_size : integer := 32;
  signal mdt_R    : std_logic_vector(1 + UCM_Z_ROI_LEN-1 downto 0);
  signal mdt_R_sc : std_logic_vector(11 + mdt_R'length -1 downto 0);
  
  signal slope    : signed(i_slope'length  -1 downto 0);--signed((SLC_Z_RPC_LEN*4 + 8)*2 -1 downto 0);

  -- signal off_sc     : std_logic_vector(5 + i_offset'length -1 downto 0);
  -- signal off_sc_dv  : std_logic;

  signal bnom     : std_logic_vector(max(1 + i_offset'length,1 + mdt_R_sc'length)  -1 downto 0);
  signal bnom_dv  : std_logic;

  -- signal chamber_center_Y : b_chamber_center_radius_unsigned_aut(open)(g_OUTPUT_WIDTH -1 downto 0) := 
  --       get_b_chamber_center_radius(c_SECTOR_ID,g_STATION_RADIUS,g_OUTPUT_WIDTH,g_OUTPUT_RESOLUTION);
  -- signal chamb_h : unsigned  (g_OUTPUT_WIDTH -1 downto 0);
  -- signal vec_z_pos : signed(UCM_Z_ROI_LEN-1 downto 0);
  -- constant resolution_change : integer := integer( (real(scaler) * UCM_Z_ROI_MULT ) /  SLC_Z_RPC_MULT);

  signal vec_pos    : std_logic_vector(max(bnom'length,1 +slope'length)-1 downto 0);
  signal vec_pos_dv : std_logic;
  signal vec_pos_vu    : std_logic_vector(max(bnom'length,1 +slope'length)-1 downto 0);
  signal vec_pos_vu_dv : std_logic;
  signal vec_pos_ip_dv : std_logic;
  signal vec_pos_mult    : std_logic_vector( (mult'length + vec_pos'length)-1 downto 0);
  signal vec_pos_mult_dv : std_logic;

  COMPONENT zcalc_vec_pos_div
    PORT (
      aclk : IN STD_LOGIC;
      aclken : IN STD_LOGIC;
      aresetn : IN STD_LOGIC;
      s_axis_divisor_tvalid : IN STD_LOGIC;
      s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
      s_axis_dividend_tvalid : IN STD_LOGIC;
      s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
      m_axis_dout_tvalid : OUT STD_LOGIC;
      m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(79 DOWNTO 0)
    );
  END COMPONENT;
  signal div_dout_tvalid : std_logic := '0';  -- TVALID for channel DOUT
  signal div_dout_tdata  : std_logic_vector(79 downto 0) := (others => '0');  -- TDATA for channel DOUT
  signal div_q : std_logic_vector(32 downto 0) := (others => '0');
  signal div_r : std_logic_vector(32 downto 0) := (others => '0');
  
begin


  -- chamb_h <= signed(resize(chamber_center_Y(to_integer(unsigned(i_chamb_ieta))),SLC_Z_RPC_LEN +1));
  -- chamb_h <= signed(chamber_center_Y(to_integer(unsigned(i_chamb_ieta))) * scaler);

  -- offset <= resize(i_offset * to_signed(integer(1.0/g_INPUT_RESOLUTION), int_size),int_size);

  storage: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        mdt_R <= (others => '0');
        slope <= (others => '0');
      else
        if i_mdt_R_dv = '1' then
          mdt_R <= '0' & i_mdt_R;
        end if;
        if i_data_valid = '1' then
          slope <= i_slope;
        end if;
      end if;
    end if;
  end process storage;

--   off_res : entity shared_lib.generic_pipelined_MATH
--   generic map(
--     g_OPERATION => "*",
--     g_IN_PIPE_STAGES  => 1,
--     g_OUT_PIPE_STAGES => 1
--   )
--   port map(
--     clk         => clk,
--     rst         => rst,
--     --
--     i_in_A      => '0' & std_logic_vector(i_offset),
--     i_in_B      => mult,
--     i_in_C      => "0",
--     i_in_D      => "0",
--     i_dv        => i_data_valid,
--     --
--     o_result    => off_sc,
--     o_dv        => off_sc_dv
-- );
              
  mdt_R_sc <= mdt_R & "00000000000";
  mult_int : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "-",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => mdt_R_sc'length + 1,
      g_in_B_WIDTH => 1 + i_offset'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => '0' & mdt_R_sc,
      i_in_B      => std_logic_vector(resize(i_offset,1 +i_offset'length)),--off_sc,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => i_data_valid,--off_sc_dv,
      --
      o_result    => bnom,
      o_dv        => bnom_dv
  );

  DIV_IPR2: if g_DIV_IP_R2_EN = '1' generate
    div : entity shared_lib.VU_generic_pipelined_MATH
      generic map(
        g_OPERATION => "/",
        g_IN_PIPE_STAGES  => 1,
        g_OUT_PIPE_STAGES => 1,
        g_in_A_WIDTH => bnom'length,
        g_in_B_WIDTH => 1 + slope'length
      )
      port map(
        clk         => clk,
        rst         => rst,
        --
        i_in_A      => bnom,
        i_in_B      => std_logic_vector(resize(signed(slope),1 +slope'length)),
        -- i_in_C      => "0",
        -- i_in_D      => "0",
        i_dv        => bnom_dv,
        --
        o_result    => vec_pos_vu,
        o_dv        => vec_pos_vu_dv
      );
  end generate;
  DIV_VU : if g_DIV_VU_EN = '1' generate
    div_IP : zcalc_vec_pos_div
      PORT MAP (
        aclk => clk,
        aclken => ena,
        aresetn => not rst,
        s_axis_divisor_tvalid => bnom_dv,
        s_axis_divisor_tdata => std_logic_vector(resize(signed(slope),40)),
        s_axis_dividend_tvalid => bnom_dv,
        s_axis_dividend_tdata =>  std_logic_vector(resize(signed(bnom),40)),
        m_axis_dout_tvalid => vec_pos_ip_dv,
        m_axis_dout_tdata => div_dout_tdata
      );
    div_r <= div_dout_tdata(32 downto 0);
    div_q  <= div_dout_tdata(72 downto 40);
  end generate;

  DIV_SEL : if g_DIV_SEL = "IPR2" generate
    vec_pos <= div_q;
    vec_pos_dv <= vec_pos_ip_dv;
  elsif g_DIV_SEL = "VU" generate
    vec_pos <= vec_pos_vu;
    vec_pos_dv <= vec_pos_vu_dv;
  end generate;

  
  res : entity shared_lib.VU_generic_pipelined_MATH
    generic map(
      g_OPERATION => "*",
      g_IN_PIPE_STAGES  => 1,
      g_OUT_PIPE_STAGES => 1,
      g_in_A_WIDTH => vec_pos'length,
      g_in_B_WIDTH => mult'length
    )
    port map(
      clk         => clk,
      rst         => rst,
      --
      i_in_A      => vec_pos,
      i_in_B      => mult,
      -- i_in_C      => "0",
      -- i_in_D      => "0",
      i_dv        => vec_pos_dv,
      --
      o_result    => vec_pos_mult,
      o_dv        => vec_pos_mult_dv
  );

  o_vec_z_pos <= resize(unsigned(vec_pos_mult),UCM2HPS_VEC_POS_LEN);
  o_vec_z_pos_dv <= vec_pos_mult_dv;

  -- /*
  -- Z_CALC: process(clk)
  -- begin
  --   if rising_edge(clk) then
  --     if rst = '1' then
  --       vec_pos <= (others => '0');
        
  --     else
        
  --       o_vec_z_pos_dv <= i_data_valid;

  --       if i_data_valid = '1' then

  --         -- offset <= resize(i_offset * to_signed(integer(1.0/g_INPUT_RESOLUTION), int_size),int_size);

  --         chamb_h <= chamber_center_Y(to_integer(unsigned(i_chamb_ieta)));

  --         vec_pos <= (signed(scaler * chamber_center_Y(to_integer(unsigned(i_chamb_ieta)))) - offset) / i_slope;
  --         -- vec_pos <= ((signed(chamber_center_Y(to_integer(unsigned(i_chamb_ieta))) * scaler) - i_offset) * to_signed(resolution_change,15)) / i_slope;
  --       else
  --         vec_pos <= (others => '0');
  --       end if;





  --     end if;
  --   end if;
  -- end process Z_CALC;
  -- */
  
  
end architecture beh;

