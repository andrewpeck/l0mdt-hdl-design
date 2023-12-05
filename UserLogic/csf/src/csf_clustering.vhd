----------------------------------------------------------------------------------
-- Company: Max Planck Institut For Physics Munich
-- Engineer: Davide Cieri
--
-- Create Date: 02/08/2019 11:35:01 AM
-- Design Name: Compact Segment Finder
-- Module Name: csf_histogram - Behavioral
-- Project Name: ATLAS L0MDT Trigger
-- Target Devices: xcvu5p-flvb2104-2-e
-- Tool Versions: Vivado 2018.2
-- Description: Histogramming method of the compact segment finder
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

ENTITY csf_clustering IS
  GENERIC (
    MAX_HITS_PER_CLUSTER : real    := 16.0;
    MAX_CLUSTERS         : INTEGER := 6
  );
  PORT (
    clk            : IN STD_LOGIC;
    i_en           : IN STD_LOGIC;
    i_rst          : IN STD_LOGIC;
    i_mdthit       : IN heg2sfhit_vt;
    i_seed         : IN heg2sfslc_vt;
    i_eof          : IN STD_LOGIC;
    o_cluster_hits : OUT csf_hit_avt(MAX_CLUSTERS - 1 DOWNTO 0);
    o_fitter_en    : OUT STD_LOGIC_VECTOR(MAX_CLUSTERS - 1 DOWNTO 0)
  );
END csf_clustering;

ARCHITECTURE Behavioral OF csf_clustering IS
  -- Histogram parameters
  CONSTANT B_FULL_MULTI     : real    := real(HEG2SFHIT_LOCALX_MULT * UCM_MBAR_MULT);
  CONSTANT B_MULTI          : real    := HEG2SFHIT_LOCALX_MULT;
  CONSTANT B_RANGE          : real    := 512.0;
  CONSTANT MBAR_MULTI_LEN   : INTEGER := INTEGER(log2(UCM_MBAR_MULT));
  CONSTANT B_MULTI_LEN      : INTEGER := INTEGER(LOG2(B_MULTI));
  CONSTANT B_LEN            : INTEGER := INTEGER(LOG2(B_MULTI * B_RANGE));
  CONSTANT B_FULL_LEN       : INTEGER := INTEGER(log2(B_FULL_MULTI * B_RANGE));
  CONSTANT B_TOLERANCE      : INTEGER := INTEGER(B_MULTI * 2.0);
  CONSTANT BIN_DEPTH        : INTEGER := INTEGER(log2(MAX_HITS_PER_CLUSTER));
  CONSTANT INV_SQRT_M_LEN   : INTEGER := 18;
  CONSTANT SQU_M_LEN        : INTEGER := UCM_MBAR_LEN;
  CONSTANT MAX_CLUSTERS_LEN : INTEGER := INTEGER(LOG2(REAL(MAX_CLUSTERS)));

  -- Signals for seed information
  SIGNAL seed  : heg2sfslc_rt;
  SIGNAL mbar  : unsigned(UCM_MBAR_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL squ_m : STD_LOGIC_VECTOR(SQU_M_LEN - 1 DOWNTO 0)
  := (OTHERS => '0');
  SIGNAL invsqu_m : STD_LOGIC_VECTOR(INV_SQRT_M_LEN - 1 DOWNTO 0)
  := (OTHERS => '0');

  -- MDT hit signals
  SIGNAL mdt_hit, mdt_hit_s, mdt_hit_ss, mdt_hit_sss, mdt_hit_ssss : heg2sfhit_rt;
  -- Constants for b+/- calculation
  CONSTANT SQU_M_R_LEN : INTEGER := SQU_M_LEN + MDT_RADIUS_LEN;
  CONSTANT M_X_LEN     : INTEGER := UCM_MBAR_LEN + MDT_LOCAL_X_LEN;
  CONSTANT Y_M_LEN     : INTEGER := MDT_LOCAL_Y_LEN + UCM_MBAR_LEN + 1;
  CONSTANT M_X_Y_M_LEN : INTEGER := Y_M_LEN + 1;

  -- DSP signals for b+/- calculation
  SIGNAL dsp_squ_m_r, dsp_squ_m_r_s : unsigned(SQU_M_R_LEN - 1 DOWNTO 0)
  := (OTHERS => '0');
  SIGNAL dsp_m_x : unsigned(M_X_LEN - 1 DOWNTO 0)
  := (OTHERS => '0');
  SIGNAL dsp_y_m_multi : unsigned(Y_M_LEN - 1 DOWNTO 0)
  := (OTHERS => '0');
  SIGNAL dsp_m_x_y_multi : signed(M_X_Y_M_LEN - 1 DOWNTO 0)
  := (OTHERS => '0');
  SIGNAL bplus_full, bminus_full : signed(M_X_Y_M_LEN - 1 DOWNTO 0)
  := (OTHERS => '0');
  SIGNAL bplus, bminus, bplus_s, bminus_s : signed(B_LEN - 1 DOWNTO 0)
  := (OTHERS => '0');

  TYPE b_av IS ARRAY (NATURAL RANGE <>) OF signed(B_LEN - 1 DOWNTO 0);
  SIGNAL a_bplus, a_bminus   : b_av(MAX_CLUSTERS DOWNTO 0);
  ATTRIBUTE keep             : BOOLEAN;
  ATTRIBUTE keep OF a_bplus  : SIGNAL IS true;
  ATTRIBUTE keep OF a_bminus : SIGNAL IS true;

  -- Data Valid signals
  SIGNAL dv0, dv1, dv2, dv3, dv4 : STD_LOGIC := '0';
  SIGNAL on_cluster              : STD_LOGIC_VECTOR(MAX_CLUSTERS/2 - 1 DOWNTO 0);
  SIGNAL eof0, eof1, eof2,
  eof3, eof4, eof5,
  eof6, eof7, eof8, eof9 : STD_LOGIC := '0';

  -- Signals for clustering bins
  TYPE t_address_cluster IS ARRAY (NATURAL RANGE <>)
  OF unsigned(BIN_DEPTH - 1 DOWNTO 0);
  SIGNAL counters : t_address_cluster(MAX_CLUSTERS - 1 DOWNTO 0)
  := (OTHERS => (OTHERS => '0'));
  TYPE t_reference_b IS ARRAY (NATURAL RANGE <>) OF signed(B_LEN - 1 DOWNTO 0);
  SIGNAL reference_b    : t_reference_b(MAX_CLUSTERS - 1 DOWNTO 0);
  SIGNAL cluster_active : STD_LOGIC_VECTOR(MAX_CLUSTERS - 1 DOWNTO 0) := (OTHERS => '0');

  SIGNAL hit_p, hit_m : csf_hit_rt;
  -- Clustering hit signals
  TYPE t_hit_vectors IS ARRAY (NATURAL RANGE <>) OF STD_LOGIC_VECTOR(csf_hit_rt'w - 1 DOWNTO 0);

  SIGNAL hit_plus, hit_minus : csf_hit_art(MAX_CLUSTERS/2-1 DOWNTO 0);
  SIGNAL eof_v, dv_v         : STD_LOGIC_VECTOR(MAX_CLUSTERS/2 DOWNTO 0);

  -- Delta_x, Delta_y constants
  CONSTANT M_INV_SQU_M_LEN : INTEGER
  := UCM_MBAR_LEN + INV_SQRT_M_LEN;
  CONSTANT M_MULTI_INV_SQU_M_LEN : INTEGER := M_INV_SQU_M_LEN + 1;
  CONSTANT DELTA_Y_FULL_LEN      : INTEGER
  := M_MULTI_INV_SQU_M_LEN + MDT_RADIUS_LEN;
  CONSTANT DELTA_X_FULL_LEN : INTEGER
  := UCM_MBAR_LEN + INV_SQRT_M_LEN + MDT_RADIUS_LEN;

  -- Signals for Delta_x, Delta_y to calculate exact hit coordinate
  SIGNAL dsp_m_inv_squ_m, dsp_m_inv_squ_m_s
  : unsigned(M_INV_SQU_M_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL dsp_m_multi_inv_squ_m
  : unsigned(M_MULTI_INV_SQU_M_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL delta_y_full, delta_y_full_s
  : unsigned(DELTA_Y_FULL_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL delta_x_full, delta_x_full_s
  : unsigned(DELTA_X_FULL_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL delta_x, delta_x_s, delta_x_ss
  : unsigned(MDT_LOCAL_X_LEN - 1 DOWNTO 0) := (OTHERS => '0');
  SIGNAL delta_y, delta_y_s, delta_y_ss
  : unsigned(MDT_LOCAL_Y_LEN - 1 DOWNTO 0) := (OTHERS => '0');

  -- Counter signals
  SIGNAL max_counter : UNSIGNED(BIN_DEPTH - 1 DOWNTO 0)        := (OTHERS => '0');
  SIGNAL out_cluster : UNSIGNED(MAX_CLUSTERS_LEN - 1 DOWNTO 0) := (OTHERS => '0');

  ---COMPONENTS --------
  COMPONENT rom
    GENERIC (
      MXADRB    : INTEGER;
      MXDATB    : INTEGER;
      ROM_FILE  : STRING;
      ROM_STYLE : STRING
    );
    PORT (
      clka  : IN STD_LOGIC;
      ena   : IN STD_LOGIC;
      addra : IN STD_LOGIC_VECTOR;
      douta : OUT STD_LOGIC_VECTOR
    );
  END COMPONENT;

BEGIN
  seed <= convert(i_seed, seed);

  invsqrt_mbar : rom
  GENERIC MAP(
    MXADRB    => UCM_MBAR_LEN,
    MXDATB    => INV_SQRT_M_LEN,
    ROM_FILE  => "invsqrt_mbar.mem",
    ROM_STYLE => "block"
  )
  PORT MAP(
    ena   => '1',
    clka  => clk,
    addra => STD_LOGIC_VECTOR(mbar),
    douta => invsqu_m
  );

  sqrt_mbar : rom
  GENERIC MAP(
    MXADRB    => UCM_MBAR_LEN,
    MXDATB    => SQU_M_LEN,
    ROM_FILE  => "sqrt_mbar.mem",
    ROM_STYLE => "block"
  )
  PORT MAP(
    ena   => '1',
    clka  => clk,
    addra => STD_LOGIC_VECTOR(mbar),
    douta => squ_m
  );

  processor : PROCESS (clk)
  BEGIN
    IF rising_edge(clk) THEN

      IF seed.data_valid = '1' THEN
        mbar <= seed.vec_ang;
      END IF;

      -- Delay the hits of two clocks for 
      mdt_hit <= convert(i_mdthit, mdt_hit);

      -- Clock 0
      dv0         <= mdt_hit.data_valid;
      dsp_squ_m_r <= shift_right(
        unsigned(squ_m) * mdt_hit.radius,
        R_OVER_Z_MULTI_LEN);
      dsp_m_x       <= mbar * mdt_hit.localx;
      dsp_y_m_multi <= resize(mdt_hit.localy * INTEGER(UCM_MBAR_MULT),
        Y_M_LEN);
      dsp_m_inv_squ_m       <= mbar * unsigned(invsqu_m);
      dsp_m_multi_inv_squ_m <= resize(
        unsigned(invsqu_m) * INTEGER(UCM_MBAR_MULT),
        M_MULTI_INV_SQU_M_LEN);
      mdt_hit_s <= mdt_hit;
      eof0      <= i_eof;

      -- Clock 1
      dv1               <= dv0;
      dsp_m_x_y_multi   <= signed('0' & dsp_m_x) - signed('0' & dsp_y_m_multi);
      dsp_squ_m_r_s     <= dsp_squ_m_r;
      mdt_hit_ss        <= mdt_hit_s;
      dsp_m_inv_squ_m_s <= dsp_m_inv_squ_m;
      delta_y_full      <= dsp_m_multi_inv_squ_m * mdt_hit_s.radius;
      eof1              <= eof0;

      -- Clock 2
      dv2            <= dv1;
      bplus_full     <= signed('0' & dsp_squ_m_r_s) - dsp_m_x_y_multi;
      bminus_full    <= - signed('0' & dsp_squ_m_r_s) - dsp_m_x_y_multi;
      delta_x_full_s <= dsp_m_inv_squ_m_s * mdt_hit_ss.radius;
      delta_y_full_s <= delta_y_full;
      eof2           <= eof1;
      mdt_hit_sss    <= mdt_hit_ss;

      -- Clock 3
      dv3   <= dv2;
      bplus <= resize(shift_right(bplus_full, MBAR_MULTI_LEN),
        B_LEN);
      bminus <= resize(shift_right(bminus_full, MBAR_MULTI_LEN),
        B_LEN);
      delta_x <= resize(shift_right(
        delta_x_full_s,
        R_OVER_Z_MULTI_LEN + INV_SQRT_M_LEN),
        MDT_LOCAL_X_LEN);
      delta_y <= resize(shift_right(delta_y_full_s,
        R_OVER_Z_MULTI_LEN + INV_SQRT_M_LEN),
        MDT_LOCAL_Y_LEN);
      mdt_hit_ssss <= mdt_hit_sss;
      eof3         <= eof2;

      -- Clock 4
      dv4         <= dv3;
      bplus_s     <= bplus;
      bminus_s    <= bminus;
      hit_p.valid <= dv3;
      hit_m.valid <= dv3;
      hit_p.x     <= mdt_hit_ssss.localx - delta_x;
      hit_m.x     <= mdt_hit_ssss.localx + delta_x;
      hit_p.y     <= mdt_hit_ssss.localy + delta_y;
      hit_m.y     <= mdt_hit_ssss.localy - delta_y;
      eof4        <= eof3;

      -- Clock 5
      --      b_mux : FOR i IN 0 TO MAX_CLUSTERS - 1 LOOP
      a_bplus(0)  <= bplus_s;
      a_bminus(0) <= bminus_s;
      --      END LOOP b_mux;
      hit_minus(0) <= hit_m;
      hit_plus(0)  <= hit_p;
      eof_v(0)     <= eof4;
      dv_v(0)      <= dv4;
      -- Clock 6 - 8 
      o_cluster_hits <= (OTHERS => (OTHERS => '0'));
      on_cluster     <= (OTHERS => '1');

      counter_loop : FOR i IN 0 TO MAX_CLUSTERS/2 - 1 LOOP
        hit_plus(i + 1)  <= hit_plus(i);
        hit_minus(i + 1) <= hit_minus(i);
        a_bplus(i + 1)   <= a_bplus(i);
        a_bminus(i + 1)  <= a_bminus(i);
        eof_v(i + 1)     <= eof_v(i);
        dv_v(i + 1)      <= dv_v(i);

        IF dv_v(i) = '1' THEN
          IF counters(i * 2) = 0 AND counters(i * 2 + 1) = 0 AND (i = 0 OR on_cluster(i - 1) = '0') THEN
            reference_b(i * 2)        <= a_bplus(i);
            reference_b(i * 2 + 1)    <= a_bminus(i);
            o_cluster_hits(i * 2)     <= convert(hit_plus(i), o_cluster_hits(i * 2));
            o_cluster_hits(i * 2 + 1) <= convert(hit_minus(i), o_cluster_hits(i * 2 + 1));
            counters(i * 2)           <= counters(i * 2) + 1;
            counters(i * 2 + 1)       <= counters(i * 2 + 1) + 1;
            IF counters(i * 2) > max_counter THEN
              max_counter               <= counters(i * 2) + 1;
              out_cluster               <= to_unsigned(i, MAX_CLUSTERS_LEN);
            end if;
          ELSE
            -- Check Cluster i*2
            IF i = 0 OR on_cluster(i - 1) = '0' THEN
              IF a_bplus(i) - reference_b(i * 2) < ABS(a_bminus(i * 2) - reference_b(i * 2)) AND ABS(a_bplus(i) - reference_b(i * 2)) < B_TOLERANCE THEN
                o_cluster_hits(i * 2) <= convert(hit_plus(i), o_cluster_hits(i * 2));
                counters(i * 2)       <= counters(i * 2) + 1;
                IF counters(i * 2) + 1 > max_counter THEN
                  max_counter <= counters(i * 2) + 1;
                  out_cluster <= to_unsigned(i * 2, MAX_CLUSTERS_LEN);
                END IF;
              ELSIF ABS(a_bminus(i) - reference_b(i * 2)) < B_TOLERANCE THEN
                o_cluster_hits(i * 2) <= convert(hit_minus(i), o_cluster_hits(i * 2));
                counters(i * 2)       <= counters(i * 2) + 1;
                IF counters(i * 2) + 1 > max_counter THEN
                  max_counter <= counters(i * 2) + 1;
                  out_cluster <= to_unsigned(i * 2, MAX_CLUSTERS_LEN);
                END IF;
              ELSE
                -- Check Cluster i*2+1
                IF ABS(a_bplus(i) - reference_b(i * 2 + 1)) < ABS(a_bminus(i) - reference_b(i * 2 + 1))
                  AND ABS(a_bplus(i) - reference_b(i * 2 + 1)) < B_TOLERANCE THEN
                  o_cluster_hits(i * 2 + 1) <= convert(hit_plus(i), o_cluster_hits(i * 2 + 1));
                  counters(i * 2 + 1)       <= counters(i * 2 + 1) + 1;
                  IF counters(i * 2 + 1) + 1 > max_counter THEN
                    max_counter <= counters(i * 2 + 1) + 1;
                    out_cluster <= to_unsigned(i * 2 + 1, MAX_CLUSTERS_LEN);

                  END IF;
                ELSIF ABS(a_bminus(i) - reference_b(i * 2 + 1)) < B_TOLERANCE THEN
                  o_cluster_hits(i * 2 + 1) <= convert(hit_minus(i), o_cluster_hits(i * 2 + 1));
                  counters(i * 2 + 1)       <= counters(i * 2 + 1) + 1;
                  IF counters(i * 2 + 1) + 1 > max_counter THEN
                    max_counter <= counters(i * 2 + 1) + 1;
                    out_cluster <= to_unsigned(i * 2 + 1, MAX_CLUSTERS_LEN);
                  END IF;
                ELSE
                  on_cluster(i) <= '0';
                END IF;
              END IF;
            ELSE
              on_cluster(i) <= '1';
            END IF;
          END IF;
        END IF;
      END LOOP counter_loop;

      -- Clock 9
      o_fitter_en <= (OTHERS => '0');
      IF eof_v(MAX_CLUSTERS/2) = '1' THEN
        o_fitter_en(to_integer(out_cluster)) <= '1';
        reference_b                          <= (OTHERS => (OTHERS => '0'));
        counters                             <= (OTHERS => (OTHERS => '0'));
        max_counter <= (others => '0');
      END IF;

      IF i_rst = '1' THEN
        reference_b                          <= (OTHERS => (OTHERS => '0'));
        counters                             <= (OTHERS => (OTHERS => '0'));
        max_counter <= (others => '0');
      END IF;


    END IF;
  END PROCESS;
END Behavioral;