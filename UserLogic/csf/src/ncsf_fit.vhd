----------------------------------------------------------------------------------
-- Company: Max Planck Institut For Physics Munich
-- Engineer: Davide Cieri
--
-- Create Date: 02/12/2019 12:09:26 PM
-- Design Name: Compact Segment Finder
-- Module Name: ncsf_fit - Behavioral
-- Project Name: ATLAS L0MDT Trigger
-- Target Devices: xcvu5p-flvb2104-2-e
-- Tool Versions: Vivado 2018.2
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

LIBRARY shared_lib;
USE shared_lib.common_ieee_pkg.ALL;
USE shared_lib.l0mdt_constants_pkg.ALL;
USE shared_lib.l0mdt_dataformats_pkg.ALL;
USE shared_lib.common_constants_pkg.ALL;
USE shared_lib.common_types_pkg.ALL;

LIBRARY csf_lib;
USE csf_lib.csf_pkg.ALL;
USE csf_lib.csf_custom_pkg.ALL;

ENTITY ncsf_fit IS
  PORT (
    clk        : IN STD_LOGIC;
    i_rst      : in STD_LOGIC;
    i_sums_ml0 : in csf_sums_avt(CSF_MAX_CLUSTERS - 1 DOWNTO 0);
    i_sums_ml1 : in csf_sums_avt(CSF_MAX_CLUSTERS - 1 DOWNTO 0);
    o_seg      : OUT csf_locseg_vt
  );
END ncsf_fit;

ARCHITECTURE Behavioral OF ncsf_fit IS
  -- Input sums
  SIGNAL sums_ml0, sums_ml1           : csf_sums_art(CSF_MAX_CLUSTERS - 1 DOWNTO 0);
  SIGNAL sums_ml0_s, sums_ml1_s, sums : csf_sums_rt;
  -- Numerator/Denominator widths
  CONSTANT NSUM_XY_LEN      : INTEGER := SUM_XY_LEN + CSF_MAXHITS_SEG_LEN;
  CONSTANT SUM_Y_SUM_X_LEN  : INTEGER := SUM_Y_LEN + SUM_X_LEN;
  CONSTANT SUM_Y_SUM_X2_LEN : INTEGER := SUM_Y_LEN + SUM_X2_LEN;
  CONSTANT SUM_XY_SUM_X_LEN : INTEGER := SUM_XY_LEN + SUM_X_LEN;
  CONSTANT SUM_X_SUM_X_LEN  : INTEGER := SUM_X_LEN * 2;
  CONSTANT NSUM_X2_LEN      : INTEGER := CSF_MAXHITS_SEG_LEN + SUM_X2_LEN;
  CONSTANT NUM_M_LEN        : INTEGER := NSUM_XY_LEN + 1;
  CONSTANT NUM_B_LEN        : INTEGER := SUM_Y_SUM_X2_LEN + 1;
  CONSTANT DEN_LEN          : INTEGER := NSUM_X2_LEN;

  -- Numerator/Denominator constants
  CONSTANT SHIFT_NUM_M        : INTEGER := 15;
  CONSTANT SHIFT_NUM_B        : INTEGER := 25;
  CONSTANT SHIFT_DEN          : INTEGER := 18;
  CONSTANT RECIPROCAL_LEN     : INTEGER := 22;
  CONSTANT B_OVER_Z_MULTI_LEN : INTEGER
  := INTEGER(log2(CSF_SEG_B_MULT/HEG2SFHIT_LOCALX_MULT));

  -- Numerator/Denominator signals
  SIGNAL dsp_NSumXY, dsp_NSumXY_s, dsp_NSumXY_ss
  : unsigned(NSUM_XY_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL dsp_SumYSumX, dsp_SumYSumX_s, dsp_SumYSumX_ss
  : unsigned(SUM_Y_SUM_X_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL dsp_SumYSumX2, dsp_SumYSumX2_s, dsp_SumYSumX2_ss
  : unsigned(SUM_Y_SUM_X2_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL dsp_SumXYSumX, dsp_SumXYSumX_s, dsp_SumXYSumX_ss
  : unsigned(SUM_XY_SUM_X_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL dsp_NSumX2, dsp_NSumX2_s, dsp_NSumX2_ss
  : unsigned(NSUM_X2_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL dsp_SumXSumX, dsp_SumXSumX_s, dsp_SumXSumX_ss
  : unsigned(SUM_X_SUM_X_LEN - 1 DOWNTO 0) := (OTHERS => '0');

  SIGNAL numerator_m : signed(NUM_M_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL numerator_b : signed(NUM_B_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL denominator : unsigned(DEN_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL numerator_m_red, numerator_m_red_s,
  numerator_m_red_ss, numerator_m_red_sss, numerator_m_red_ssss :
  signed(NUM_M_LEN - SHIFT_NUM_M - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL numerator_b_red, numerator_b_red_s,
  numerator_b_red_ss, numerator_b_red_sss, numerator_b_red_ssss :
  signed(NUM_B_LEN - SHIFT_NUM_B - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL denominator_red : unsigned(DEN_LEN - SHIFT_DEN - 1 DOWNTO 0)
  := (OTHERS => '0');
  SIGNAL reciprocal_addr : STD_LOGIC_VECTOR(DEN_LEN - SHIFT_DEN - 1 DOWNTO 0)
  := (OTHERS => '0');
  SIGNAL reciprocal_den   : STD_LOGIC_VECTOR(RECIPROCAL_LEN - 1 DOWNTO 0);
  SIGNAL reciprocal_den_s : signed(RECIPROCAL_LEN DOWNTO 0)
  := (OTHERS => '0');

  -- Fit result widths
  CONSTANT MFIT_FULL_LEN : INTEGER := NUM_M_LEN - SHIFT_NUM_M + RECIPROCAL_LEN + 1;
  CONSTANT BFIT_FULL_LEN : INTEGER := NUM_B_LEN - SHIFT_NUM_B + RECIPROCAL_LEN + 1;

  -- Fit result signals
  signal dv_slope, dv_intercept : STD_LOGIC;
  SIGNAL mfit : std_logic_vector(CSF_SEG_M_LEN - 1 DOWNTO 0)
  := (OTHERS => '0');
  SIGNAL bfit : std_logic_vector(CSF_SEG_B_LEN - 1 DOWNTO 0)
  := (OTHERS => '0');

  -- DSP valid signals
  SIGNAL dsp_start, dsp_start_s                                 : STD_LOGIC := '0';
  SIGNAL counter                                                : INTEGER   := 0;
  SIGNAL startCounter                                           : STD_LOGIC := '0';
  SIGNAL dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9, dv10 : STD_LOGIC := '0';
  SIGNAL event_valid                                            : STD_LOGIC := '0';
  -- Output segment
  SIGNAL output_seg : csf_locseg_rt;

  -----COMPONENTS --------
  --COMPONENT rom
  --  GENERIC (
  --    MXADRB    : INTEGER;
  --    MXDATB    : INTEGER;
  --    ROM_FILE  : STRING;
  --    ROM_STYLE : STRING
  --  );
  --  PORT (
  --    clka  : IN STD_LOGIC;
  --    ena   : IN STD_LOGIC;
  --    addra : IN STD_LOGIC_VECTOR;
  --    douta : OUT STD_LOGIC_VECTOR
  --  );
  --END COMPONENT;

BEGIN

  --reciprocal_rom : rom
  --GENERIC MAP(
  --  MXADRB    => DEN_LEN - SHIFT_DEN,
  --  MXDATB    => RECIPROCAL_LEN,
  --  ROM_FILE  => "fitter_reciprocal.mem",
  --  ROM_STYLE => "distributed"
  --)
  --PORT MAP(
  --  ena   => '1',
  --  clka  => clk,
  --  addra => reciprocal_addr,
  --  douta => reciprocal_den
  --);

  divider_m : entity shared_lib.divider
  GENERIC MAP(
    g_NUMERATOR_LEN => NUM_M_LEN - SHIFT_NUM_M,
    g_DENOMINATOR_LEN => DEN_LEN - SHIFT_DEN,
    g_DIVIDER_LEN => RECIPROCAL_LEN,
    g_QUOTIENT_LEN => CSF_SEG_M_LEN,
    g_MULTIPLIER_LEN => MFIT_MULTI_LEN + SHIFT_NUM_M - SHIFT_DEN,
    g_IS_SIGNED => '1',
    g_ROM_FILE => "fitter_reciprocal.mem"
  )
  PORT MAP(
    i_clk => clk,
    i_rst => i_rst,
    i_enable => dv5,
    i_numerator => std_logic_vector(numerator_m_red_s),
    i_denominator => reciprocal_addr,
    o_valid => dv_slope,
    o_quotient => mfit
  );

  divider_b : entity shared_lib.divider
  GENERIC MAP(
    g_NUMERATOR_LEN => NUM_B_LEN - SHIFT_NUM_B,
    g_DENOMINATOR_LEN => DEN_LEN - SHIFT_DEN,
    g_DIVIDER_LEN => RECIPROCAL_LEN,
    g_QUOTIENT_LEN => CSF_SEG_B_LEN,
    g_MULTIPLIER_LEN => SHIFT_NUM_B - SHIFT_DEN + B_OVER_Z_MULTI_LEN,
    g_IS_SIGNED => '1',
    g_ROM_FILE => "fitter_reciprocal.mem"
  )
  PORT MAP(
    i_clk => clk,
    i_rst => i_rst,
    i_enable => dv5,
    i_numerator => std_logic_vector(numerator_b_red_s),
    i_denominator => reciprocal_addr,
    o_valid => dv_intercept,
    o_quotient => bfit
  );

  clust_loop_gen : FOR i_c IN CSF_MAX_CLUSTERS - 1 DOWNTO 0 GENERATE
    sums_ml0(i_c) <= convert(i_sums_ml0(i_c), sums_ml0(i_c));
    sums_ml1(i_c) <= convert(i_sums_ml1(i_c), sums_ml1(i_c));
  END GENERATE; -- clust_loop_gen

  o_seg <= convert(output_seg, o_seg) WHEN output_seg.valid = '1' ELSE
    (OTHERS => '0') WHEN output_seg.valid = '0';

  Fitter : PROCESS (clk)
  BEGIN
    IF rising_edge(clk) THEN

      -- Clock 0        
      dsp_start <= '0';
      sums      <= zero(sums);
      sum_loop : FOR i IN 0 TO CSF_MAX_CLUSTERS - 1 LOOP
        IF sums_ml0(i).valid = '1' THEN
          dsp_start  <= sums_ml0(i).valid;
          sums_ml0_s <= sums_ml0(i);
        END IF;
        IF sums_ml1(i).valid = '1' THEN
          dsp_start  <= sums_ml1(i).valid;
          sums_ml1_s <= sums_ml1(i);
        END IF;
      END LOOP;

      IF dsp_start = '1' THEN
        dsp_start <= '0';
      END IF;

      sums.valid <= dsp_start;
      sums.n     <= sums_ml0_s.n + sums_ml1_s.n;
      sums.xy    <= sums_ml0_s.xy + sums_ml1_s.xy;
      sums.x     <= sums_ml0_s.x + sums_ml1_s.x;
      sums.y     <= sums_ml0_s.y + sums_ml1_s.y;
      sums.x2    <= sums_ml0_s.x2 + sums_ml1_s.x2;

      dv0           <= sums.valid;
      dsp_NSumXY    <= sums.n * sums.xy;
      dsp_SumYSumX  <= sums.y * sums.x;
      dsp_SumYSumX2 <= sums.y * sums.x2;
      dsp_SumXYSumX <= sums.xy * sums.x;
      dsp_NSumX2    <= sums.n * sums.x2;
      dsp_SumXSumX  <= sums.x * sums.x;

      -- Clock 1
      dv1             <= dv0;
      dsp_NSumXY_s    <= dsp_NSumXY;
      dsp_SumYSumX_s  <= dsp_SumYSumX;
      dsp_SumYSumX2_s <= dsp_SumYSumX2;
      dsp_SumXYSumX_s <= dsp_SumXYSumX;
      dsp_NSumX2_s    <= dsp_NSumX2;
      dsp_SumXSumX_s  <= dsp_SumXSumX;

      -- Clock 2
      dv2              <= dv1;
      dsp_NSumXY_ss    <= dsp_NSumXY_s;
      dsp_SumYSumX_ss  <= dsp_SumYSumX_s;
      dsp_SumYSumX2_ss <= dsp_SumYSumX2_s;
      dsp_SumXYSumX_ss <= dsp_SumXYSumX_s;
      dsp_NSumX2_ss    <= dsp_NSumX2_s;
      dsp_SumXSumX_ss  <= dsp_SumXSumX_s;

      -- Clock 3
      dv3         <= dv2;
      numerator_m <= signed('0' & dsp_NSumXY_ss) - signed('0' & dsp_SumYSumX_ss);
      numerator_b <= signed('0' & dsp_SumYSumX2_ss) - signed('0' & dsp_SumXYSumX_ss);
      denominator <= dsp_NSumX2_ss - dsp_SumXSumX_ss;

      -- Clock 4
      dv4             <= dv3;
      numerator_m_red <= resize(shift_right(numerator_m, SHIFT_NUM_M),
        NUM_M_LEN - SHIFT_NUM_M);
      numerator_b_red <= resize(shift_right(numerator_b, SHIFT_NUM_B),
        NUM_B_LEN - SHIFT_NUM_B);
      denominator_red <= resize(shift_right(denominator, SHIFT_DEN),
        DEN_LEN - SHIFT_DEN);
      -- Clock 5
      dv5               <= dv4;
      reciprocal_addr   <= STD_LOGIC_VECTOR(denominator_red);
      numerator_b_red_s <= numerator_b_red;
      numerator_m_red_s <= numerator_m_red;

      -- Clock 11 

      ---- Clock 6
      --dv6                <= dv5;
      --numerator_b_red_ss <= numerator_b_red_s;
      --numerator_m_red_ss <= numerator_m_red_s;

      ----Clock 7
      --dv7                 <= dv6;
      --numerator_b_red_sss <= numerator_b_red_ss;
      --numerator_m_red_sss <= numerator_m_red_ss;
      ---- Clock 8
      --dv8                  <= dv7;
      --numerator_b_red_ssss <= numerator_b_red_sss;
      --numerator_m_red_ssss <= numerator_m_red_sss;
      --reciprocal_den_s     <= signed('0' & reciprocal_den);

      ---- Clock 9
      --dv9       <= dv8;
      --mfit_full <= numerator_m_red_sss * reciprocal_den_s;
      --bfit_full <= numerator_b_red_sss * reciprocal_den_s;

      ---- Clock 10
      --dv10        <= dv9;
      --mfit_full_s <= mfit_full;
      --bfit_full_s <= bfit_full;

      -- Clock 11
      output_seg.valid <= dv_slope and dv_intercept;
      output_seg.m     <= signed(mfit);
      output_seg.b <= signed(bfit);

    END IF;
  END PROCESS; -- Fitter
END Behavioral;