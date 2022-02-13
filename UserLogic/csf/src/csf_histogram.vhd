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

ENTITY csf_histogram IS
    GENERIC (
        MAX_HITS_PER_BIN : real := 8.0
    );
    PORT (
        clk : IN STD_LOGIC;
        i_mdthit : IN heg2sfhit_rvt;
        i_seed : IN heg2sfslc_rvt;
        i_eof : IN STD_LOGIC;
        o_histo_hit0 : OUT csf_hit_rvt;
        o_histo_hit1 : OUT csf_hit_rvt
    );
END csf_histogram;

ARCHITECTURE Behavioral OF csf_histogram IS
    -- Histogram parameters
    CONSTANT HISTO_FULL_MULTI : real := real(HEG2SFHIT_LOCALX_MULT * UCM_MBAR_MULT);
    CONSTANT HISTO_LEN : INTEGER := 6;
    CONSTANT HISTO_RANGE : real := 256.0;
    CONSTANT HISTO_FULL_LEN : INTEGER := INTEGER(log2(HISTO_FULL_MULTI * HISTO_RANGE));
    CONSTANT BIN_DEPTH : INTEGER := INTEGER(log2(MAX_HITS_PER_BIN));
    CONSTANT INV_SQRT_M_LEN : INTEGER := 18;
    CONSTANT SQU_M_LEN : INTEGER := UCM_MBAR_LEN;

    -- Signals for seed information
    SIGNAL seed : heg2sfslc_rt;
    SIGNAL mbar : unsigned(UCM_MBAR_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL squ_m : STD_LOGIC_VECTOR(SQU_M_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL invsqu_m : STD_LOGIC_VECTOR(INV_SQRT_M_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');

    -- MDT hit signals
    SIGNAL mdt_hit, mdt_hit_s, mdt_hit_ss, mdt_hit_sss, mdt_hit_ssss : heg2sfhit_rt;
    -- Constants for b+/- calculation
    CONSTANT SQU_M_R_LEN : INTEGER := SQU_M_LEN + MDT_RADIUS_LEN;
    CONSTANT M_X_LEN : INTEGER := UCM_MBAR_LEN + MDT_LOCAL_X_LEN;
    CONSTANT Y_M_LEN : INTEGER := MDT_LOCAL_Y_LEN + UCM_MBAR_LEN + 1;
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
    SIGNAL bplus, bminus : signed(HISTO_LEN + 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL bplus_s, bminus_s,
    bplus_ss, bminus_ss,
    bplus_sss, bminus_sss, bplus_ssss, bminus_ssss : unsigned(HISTO_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');

    -- Data Valid signals
    SIGNAL dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7 : STD_LOGIC := '0';
    SIGNAL fill_minus, fill_plus : STD_LOGIC := '0';
    SIGNAL fill_minus_s, fill_plus_s : STD_LOGIC := '0';

    SIGNAL eof0, eof1, eof2,
    eof3, eof4, eof5,
    eof6, eof7, eof8, eof9 : STD_LOGIC := '0';

    -- Signals for histogram bins
    TYPE t_address_histo IS ARRAY (NATURAL RANGE <>)
    OF STD_LOGIC_VECTOR(BIN_DEPTH - 1 DOWNTO 0);
    SIGNAL w_addr : t_address_histo(2 ** HISTO_LEN - 1 DOWNTO 0)
    := (OTHERS => (OTHERS => '0'));
    SIGNAL r_addr : t_address_histo(2 ** HISTO_LEN - 1 DOWNTO 0)
    := (OTHERS => (OTHERS => '1'));
    SIGNAL w_en : STD_LOGIC_VECTOR(2 ** HISTO_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');

    -- Histogram hit signals
    TYPE t_hit_vectors IS ARRAY (NATURAL RANGE <>)
    OF STD_LOGIC_VECTOR(CSF_HIT_LEN - 1 DOWNTO 0);

    SIGNAL hit_plus, hit_minus : csf_hit_rt;
    SIGNAL hit_plus_s, hit_minus_s : csf_hit_rt;

    SIGNAL w_hit_vec, r_hit_vec : t_hit_vectors(2 ** HISTO_LEN - 1 DOWNTO 0)
    := (OTHERS => (OTHERS => '0'));

    -- Delta_x, Delta_y constants
    CONSTANT M_INV_SQU_M_LEN : INTEGER
    := UCM_MBAR_LEN + INV_SQRT_M_LEN;
    CONSTANT M_MULTI_INV_SQU_M_LEN : INTEGER := M_INV_SQU_M_LEN + 1;
    CONSTANT DELTA_Y_FULL_LEN : INTEGER
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

    -- Signals for maximum identification
    SIGNAL max_counter_1, max_counter_2,
    counter_plus, counter_minus
    : STD_LOGIC_VECTOR(BIN_DEPTH - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL max_bin1, max_bin2, max_bin1_s, max_bin2_s
    : unsigned(HISTO_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL has_max : STD_LOGIC := '0';

    -- Signals to extract hits in maxima
    SIGNAL start_read, start_read0, start_read1 : STD_LOGIC := '0';

    SIGNAL addr : STD_LOGIC_VECTOR(11 DOWNTO 0)
    := STD_LOGIC_VECTOR(to_unsigned(50, 12));

    ---- ROM storing all possible values of 1/sqrt(1+m^2)
    --COMPONENT invsqrt_mbar_rom
    --PORT (
    --    clka : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
    --);
    --END COMPONENT;

    ---- ROM storing all possible values of sqrt(1+m^2)
    --COMPONENT sqrt_mbar_rom
    --PORT (
    --    clka : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    --);
    --END COMPONENT;

    ---COMPONENTS --------
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

BEGIN


    seed <= structify(i_seed);
    --invsqrt_mbar : invsqrt_mbar_rom
    --PORT MAP (
    --    clka => clk,
    --    addra => std_logic_vector(abs(mbar)),
    --    douta => invsqu_m
    --);

    --sqrt_mbar : sqrt_mbar_rom
    --PORT MAP (
    --    clka => clk,
    --    addra => std_logic_vector(abs(mbar)),
    --    douta => squ_m
    --);

    invsqrt_mbar : rom
    GENERIC MAP(
        MXADRB => UCM_MBAR_LEN,
        MXDATB => INV_SQRT_M_LEN,
        ROM_FILE => "invsqrt_mbar.mem",
        ROM_STYLE => "block"
    )
    PORT MAP(
        ena => '1',
        clka => clk,
        addra => STD_LOGIC_VECTOR(mbar),
        douta => invsqu_m
    );

    sqrt_mbar : rom
    GENERIC MAP(
        MXADRB => UCM_MBAR_LEN,
        MXDATB => SQU_M_LEN,
        ROM_FILE => "sqrt_mbar.mem",
        ROM_STYLE => "block"
    )
    PORT MAP(
        ena => '1',
        clka => clk,
        addra => STD_LOGIC_VECTOR(mbar),
        douta => squ_m
    );

    BinRAMs : FOR k IN 2 ** HISTO_LEN - 1 DOWNTO 0 GENERATE
    BEGIN
        Bin : ENTITY shared_lib.bram_tdp
            GENERIC MAP(
                ADDR => BIN_DEPTH,
                DATA => CSF_HIT_LEN,
                ram_type => "distributed"
            )
            PORT MAP(
                clk => clk,
                a_wr => w_en(k),
                a_addr => w_addr(k),
                a_din => w_hit_vec(k),
                b_addr => r_addr(k),
                b_dout => r_hit_vec(k)
            );
    END GENERATE;

    processor : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            o_histo_hit0 <= (OTHERS => '0');
            o_histo_hit1 <= (OTHERS => '0');

            IF seed.data_valid = '1' THEN
                mbar <= seed.vec_ang;
            END IF;

            -- Delay the hits of two clocks for 
            mdt_hit <= structify(i_mdthit);

            -- Clock 0
            dv0 <= mdt_hit.data_valid;
            dsp_squ_m_r <= shift_right(
                unsigned(squ_m) * mdt_hit.radius,
                R_OVER_Z_MULTI_LEN);
            dsp_m_x <= mbar * mdt_hit.localx;
            dsp_y_m_multi <= resize(mdt_hit.localy * INTEGER(UCM_MBAR_MULT),
                Y_M_LEN);
            dsp_m_inv_squ_m <= mbar * unsigned(invsqu_m);
            dsp_m_multi_inv_squ_m <= resize(
                unsigned(invsqu_m) * INTEGER(UCM_MBAR_MULT),
                M_MULTI_INV_SQU_M_LEN);
            mdt_hit_s <= mdt_hit;
            eof0 <= i_eof;

            -- Clock 1
            dv1 <= dv0;
            dsp_m_x_y_multi <= signed('0' & dsp_m_x) - signed('0' & dsp_y_m_multi);
            dsp_squ_m_r_s <= dsp_squ_m_r;
            mdt_hit_ss <= mdt_hit_s;
            dsp_m_inv_squ_m_s <= dsp_m_inv_squ_m;
            delta_y_full <= dsp_m_multi_inv_squ_m * mdt_hit_s.radius;
            eof1 <= eof0;

            -- Clock 2
            dv2 <= dv1;
            bplus_full <= signed('0' & dsp_squ_m_r_s) - dsp_m_x_y_multi;
            bminus_full <= - signed('0' & dsp_squ_m_r_s) - dsp_m_x_y_multi;
            delta_x_full_s <= dsp_m_inv_squ_m_s * mdt_hit_ss.radius;
            delta_y_full_s <= delta_y_full;
            eof2 <= eof1;
            mdt_hit_sss <= mdt_hit_ss;

            -- Clock 3
            dv3 <= dv2;
            bplus <= resize(shift_right(bplus_full, HISTO_FULL_LEN - HISTO_LEN),
                HISTO_LEN + 2);
            bminus <= resize(shift_right(bminus_full, HISTO_FULL_LEN - HISTO_LEN),
                HISTO_LEN + 2);
            delta_x <= resize(shift_right(
                delta_x_full_s,
                R_OVER_Z_MULTI_LEN + INV_SQRT_M_LEN),
                MDT_LOCAL_X_LEN);
            delta_y <= resize(shift_right(delta_y_full_s,
                R_OVER_Z_MULTI_LEN + INV_SQRT_M_LEN),
                MDT_LOCAL_Y_LEN);
            mdt_hit_ssss <= mdt_hit_sss;
            eof3 <= eof2;

            -- Clock 4
            dv4 <= dv3;
            fill_plus <= '0';
            IF bplus > -1 AND bplus < 2**HISTO_LEN -1 and dv3 = '1' THEN
                fill_plus <= '1';
            END IF;

            fill_minus <= '0';
            IF bminus > -1 AND bminus < 2**HISTO_LEN -1 and dv3 = '1' THEN
                fill_minus <= '1';
            END IF;

            bplus_s <= unsigned(bplus(HISTO_LEN - 1 DOWNTO 0));
            bminus_s <= unsigned(bminus(HISTO_LEN - 1 DOWNTO 0));

            hit_plus.valid <= dv3;
            hit_minus.valid <= dv3;

            hit_plus.x <= mdt_hit_ssss.localx - delta_x;
            hit_minus.x <= mdt_hit_ssss.localx + delta_x;
            hit_plus.y <= mdt_hit_ssss.localy + delta_y;
            hit_minus.y <= mdt_hit_ssss.localy - delta_y;
            eof4 <= eof3;

            -- Clock 5
            dv5 <= dv4;
            eof5 <= eof4;
            hit_minus_s <= hit_minus;
            hit_plus_s <= hit_plus;
            bplus_ss <= bplus_s;
            bminus_ss <= bminus_s;
            fill_minus_s <= fill_minus;
            fill_plus_s <= fill_plus;

            -- Clock 6
            dv6 <= dv5;
            w_en <= (OTHERS => '0');
            w_en(to_integer(bminus_ss)) <= fill_minus_s;
            w_hit_vec(to_integer(bminus_ss)) <= vectorify(hit_minus_s);
            w_en(to_integer(bplus_ss)) <= fill_plus_s;
            w_hit_vec(to_integer(bplus_ss)) <= vectorify(hit_plus_s);
            bplus_sss <= bplus_ss;
            bminus_sss <= bminus_ss;
            eof6 <= eof5;

            -- Clock 7
            IF dv6 = '1' THEN
                if w_en(to_integer(bplus_sss)) = '1' then
                    w_addr(to_integer(bplus_sss)) <=  STD_LOGIC_VECTOR(unsigned(w_addr(to_integer(bplus_sss))) + 1);
                    counter_plus <= STD_LOGIC_VECTOR(unsigned(w_addr(to_integer(bplus_sss))) + 1);
                end if;

                if w_en(to_integer(bminus_sss)) = '1' then
                    w_addr(to_integer(bminus_sss)) <= STD_LOGIC_VECTOR(unsigned(w_addr(to_integer(bminus_sss))) + 1);
                    counter_minus <= STD_LOGIC_VECTOR(unsigned(w_addr(to_integer(bminus_sss))) + 1);
                end if;
            END IF;
            dv7 <= dv6;
            eof7 <= eof6;

            bplus_ssss <= bplus_sss;
            bminus_ssss <= bminus_sss;

            -- Clock 8
            IF dv7 = '1' THEN
                IF unsigned(counter_plus) > unsigned(max_counter_1) THEN
                    max_counter_1 <= counter_plus;
                    max_bin1 <= bplus_ssss;
                    IF max_bin1 /= bplus_ssss THEN
                        max_counter_2 <= max_counter_1;
                        max_bin2 <= max_bin1;
                    END IF;
                ELSIF unsigned(counter_plus) > unsigned(max_counter_2) THEN
                    max_counter_2 <= counter_plus;
                    max_bin2 <= bplus_ssss;
                END IF;

                IF bplus_ssss /= bminus_ssss THEN
                    IF unsigned(counter_minus) > unsigned(max_counter_1) THEN
                        IF unsigned(counter_plus) >= unsigned(counter_minus) THEN
                            max_counter_2 <= counter_minus;
                            max_bin2 <= bminus_ssss;
                        ELSE
                            max_counter_1 <= counter_minus;
                            max_bin1 <= bminus_ssss;
                            IF unsigned(counter_plus) > unsigned(max_counter_1) THEN
                                max_counter_2 <= counter_plus;
                                max_bin2 <= bplus_ssss;
                            ELSIF max_bin1 /= bminus_ssss THEN
                                max_counter_2 <= max_counter_1;
                                max_bin2 <= max_bin1;
                            END IF;
                        END IF;
                    ELSIF unsigned(counter_minus) > unsigned(max_counter_2) THEN
                        IF unsigned(counter_plus) < unsigned(counter_minus) THEN
                            max_counter_2 <= counter_minus;
                            max_bin2 <= bminus_ssss;
                        END IF;
                    END IF;
                END IF;
            END IF;

            if eof7 = '1' then
                w_addr <= (OTHERS => (OTHERS => '0'));
                counter_minus <= (others => '0');
                counter_plus <= (others => '0');
            end if;

            eof8 <= eof7;

            -- Clock 9
            eof9 <= eof8;
            max_bin1_s <= max_bin1;
            max_bin2_s <= max_bin2;

            -- Reading out hits in maxima Clock 10
            IF eof9 = '1' THEN
                start_read <= '1';
                has_max <= '0';

                IF unsigned(max_counter_1) > 1 THEN
                    r_addr(to_integer(max_bin1_s)) <= (OTHERS => '0');
                    has_max <= '1';
                END IF;
                IF max_counter_2 = max_counter_1 and unsigned(max_counter_2) > 1 THEN
                    r_addr(to_integer(max_bin2_s)) <= (OTHERS => '0');
                END IF;
            END IF;

            start_read0 <= start_read;
            start_read1 <= start_read0;

            IF start_read0 = '1' AND has_max = '1' THEN
                IF unsigned(r_addr(to_integer(max_bin1))) < unsigned(max_counter_1) - 1
                    AND unsigned(max_counter_1) > 1 THEN
                    r_addr(to_integer(max_bin1)) <=
                    STD_LOGIC_VECTOR(unsigned(r_addr(to_integer(max_bin1))) + 1);
                ELSE
                    r_addr(to_integer(max_bin2)) <= (OTHERS => '1');
                    start_read <= '0';
                    r_addr(to_integer(max_bin1)) <= (OTHERS => '1');

                    max_counter_1 <= (OTHERS => '0');
                    max_counter_2 <= (OTHERS => '0');
                END IF;

                IF unsigned(r_addr(to_integer(max_bin2))) < unsigned(max_counter_2) - 1
                    AND unsigned(max_counter_2) > 1 THEN
                    r_addr(to_integer(max_bin2)) <=
                    STD_LOGIC_VECTOR(unsigned(r_addr(to_integer(max_bin2))) + 1);
                ELSE
                    r_addr(to_integer(max_bin2)) <= (OTHERS => '1');
                END IF;
            ELSIF start_read0 = '1' THEN
                start_read <= '0';
                max_counter_1 <= (OTHERS => '0');
                max_counter_2 <= (OTHERS => '0');
            END IF;

            IF start_read1 = '1' AND has_max = '1' THEN
                o_histo_hit0 <= r_hit_vec(to_integer(max_bin1));
                o_histo_hit1 <= r_hit_vec(to_integer(max_bin2));
            ELSIF start_read1 = '1' THEN
                o_histo_hit0 <= (OTHERS => '0');
                o_histo_hit1 <= (OTHERS => '0');
            END IF;

        END IF;
    END PROCESS;
END Behavioral;