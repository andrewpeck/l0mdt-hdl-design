----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/13/2018 09:19:30 AM
-- Design Name:
-- Module Name: chi2 - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
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

-- library ieee, csf_lib, shared_lib;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use ieee.math_real.all;
-- use csf_lib.csf_pkg.all;
-- use csf_lib.custom_types_csf_pkg.all;
-- use shared_lib.custom_types_davide_pkg.all;

ENTITY csf_chi2 IS
    PORT (
        clk : IN STD_LOGIC;
        i_hit1 : IN csf_hit_rvt;
        i_hit2 : IN csf_hit_rvt;
        i_mfit : IN signed(CSF_SEG_M_LEN - 1 DOWNTO 0);
        i_bfit : IN signed(CSF_SEG_B_LEN - 1 DOWNTO 0);
        i_nhits : IN unsigned(CSF_MAXHITS_SEG_LEN - 1 DOWNTO 0);
        i_fit_valid : IN STD_LOGIC;
        o_seg : OUT csf_locseg_rvt
    );
END csf_chi2; -- csf_chi2

ARCHITECTURE Behavioral OF csf_chi2 IS
    -- Reset
    SIGNAL rst : STD_LOGIC := '0';
    -- Hit Buffer signals
    SIGNAL w_addr1, w_addr2 : STD_LOGIC_VECTOR(CSF_MAXHITS_ML_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL r_addr1, r_addr2 : STD_LOGIC_VECTOR(CSF_MAXHITS_ML_LEN - 1 DOWNTO 0)
    := (OTHERS => '1');
    SIGNAL hit_vec1, hit_vec2 : csf_hit_rvt
    := (OTHERS => '0');
    SIGNAL hit1, hit2 : csf_hit_rt;
    SIGNAL outhit1, outhit2 : csf_hit_rt;

    -- MDT hit coordinate uncertainty
    CONSTANT SIGMA : real := 1.0/8.0;
    CONSTANT SIGMA_LEN : INTEGER := INTEGER(log2(SIGMA * HEG2SFHIT_LOCALX_MULT));

    -- Fit parameter signals
    SIGNAL mfit_s : signed(CSF_SEG_M_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL bfit_s : signed(CSF_SEG_B_LEN - 1 DOWNTO 0) := (OTHERS => '0');

    -- Residual widths
    CONSTANT B_OVER_Z_MULTI_LEN : INTEGER
    := INTEGER(log2(CSF_SEG_B_MULT/HEG2SFHIT_LOCALX_MULT));

    CONSTANT B_RED_LEN : INTEGER := CSF_SEG_B_LEN - B_OVER_Z_MULTI_LEN;
    CONSTANT MX_LEN : INTEGER
    := CSF_SEG_M_LEN + MDT_LOCAL_X_LEN + 1 - MFIT_MULTI_LEN + 1;
    CONSTANT RES_LEN : INTEGER := MX_LEN - SIGMA_LEN + CHI2_MULT_LEN/2;

    -- Residual signals
    SIGNAL b_red : signed(B_RED_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL dsp_mx1, dsp_mx2 : signed(MX_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dsp_b_y_1, dsp_b_y_2 : signed(MDT_LOCAL_Y_LEN DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL dsp_res_1, dsp_res_2 : signed(RES_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL dsp_res2_1, dsp_res2_1_s, dsp_res2_2, dsp_res2_2_s
    : unsigned(CSF_SEG_CHI2_LEN * 2 - 1 DOWNTO 0) := (OTHERS => '0');

    -- other DSP signals
    SIGNAL dv0_1, dv0_2, dv1_1, dv1_2, dv2_1, dv2_2, dv3_1, dv3_2
    : STD_LOGIC := '0';
    SIGNAL start_read : STD_LOGIC := '0';
    SIGNAL nhits_s : unsigned(CSF_MAXHITS_SEG_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL dsp_chi : unsigned(RES_LEN - 1 DOWNTO 0)
    := (OTHERS => '0');
    SIGNAL counter : INTEGER := 0;
    SIGNAL startCounter : STD_LOGIC := '0';

    -- Output segment
    SIGNAL output_seg : csf_locseg_rt;

BEGIN

    hit1 <= structify(i_hit1);
    hit2 <= structify(i_hit2);

    HitBuffer1 : ENTITY shared_lib.bram_tdp
        GENERIC MAP(
            ADDR => CSF_MAXHITS_ML_LEN,
            DATA => CSF_HIT_LEN,
            ram_type => "distributed"
        )
        PORT MAP(
            clk => clk,
            a_wr => hit1.valid,
            a_addr => w_addr1,
            a_din => i_hit1,
            b_addr => r_addr1,
            b_dout => hit_vec1
        );

    HitBuffer2 : ENTITY shared_lib.bram_tdp
        GENERIC MAP(
            ADDR => CSF_MAXHITS_ML_LEN,
            DATA => CSF_HIT_LEN,
            ram_type => "distributed"
        )
        PORT MAP(
            clk => clk,
            a_wr => hit2.valid,
            a_addr => w_addr2,
            a_din => i_hit2,
            b_addr => r_addr2,
            b_dout => hit_vec2
        );

    outhit1 <= structify(hit_vec1);
    outhit2 <= structify(hit_vec2);

    o_seg <= vectorify(output_seg);

    Chi2Proc : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            output_seg <= nullify(output_seg);

            -- Store Hits into a RAM, waiting for the fit result
            IF hit1.valid = '1' THEN
                w_addr1 <= STD_LOGIC_VECTOR(unsigned(w_addr1) + 1);
            END IF;

            IF hit2.valid = '1' THEN
                w_addr2 <= STD_LOGIC_VECTOR(unsigned(w_addr2) + 1);
            END IF;

            IF i_fit_valid = '1' THEN
                mfit_s <= i_mfit;
                bfit_s <= i_bfit;
                nhits_s <= i_nhits;
                IF B_OVER_Z_MULTI_LEN < 0 THEN
                    b_red <= shift_left(resize(i_bfit, B_RED_LEN), ABS(B_OVER_Z_MULTI_LEN));
                ELSE
                    b_red <= shift_right(resize(i_bfit, B_RED_LEN), B_OVER_Z_MULTI_LEN);
                END IF;
                r_addr1 <= (OTHERS => '0');
                r_addr2 <= (OTHERS => '0');
                start_read <= '1';
            END IF;

            IF start_read = '1' THEN
                IF unsigned(r_addr1) < unsigned(w_addr1) - 1 THEN
                    r_addr1 <= STD_LOGIC_VECTOR(unsigned(r_addr1) + 1);
                ELSE
                    r_addr1 <= (OTHERS => '1');
                END IF;
                IF unsigned(r_addr2) < unsigned(w_addr2) - 1 THEN
                    r_addr2 <= STD_LOGIC_VECTOR(unsigned(r_addr2) + 1);
                ELSE
                    r_addr2 <= (OTHERS => '1');
                END IF;
            END IF;

            -- Clock 0
            dv0_1 <= outhit1.valid;
            dv0_2 <= outhit2.valid;
            dsp_mx1 <= resize(
                shift_right(mfit_s * signed('0' & outhit1.x), MFIT_MULTI_LEN),
                MX_LEN);
            dsp_mx2 <= resize(
                shift_right(mfit_s * signed('0' & outhit2.x), MFIT_MULTI_LEN),
                MX_LEN);
            dsp_b_y_1 <= signed('0' & outhit1.y) - b_red;
            dsp_b_y_2 <= signed('0' & outhit2.y) - b_red;

            -- Clock 1
            dv1_1 <= dv0_1;
            dv1_2 <= dv0_2;

            dsp_res_1 <= resize(
                shift_right(dsp_b_y_1 - dsp_mx1, SIGMA_LEN - CHI2_MULT_LEN/2),
                RES_LEN);
            dsp_res_2 <= resize(
                shift_right(dsp_b_y_2 - dsp_mx2, SIGMA_LEN - CHI2_MULT_LEN/2),
                RES_LEN);

            ---- Clock 2
            --dv2_1 <= dv1_1;
            --dv2_2 <= dv1_2;
            --dsp_res2_1 <= resize(unsigned(dsp_res_1 * dsp_res_1),
            --    CSF_SEG_CHI2_LEN * 2);
            --dsp_res2_2 <= resize(unsigned(dsp_res_2 * dsp_res_2),
            --    CSF_SEG_CHI2_LEN * 2);

            ---- Clock 3
            --dv3_1 <= dv2_1;
            --dv3_2 <= dv2_2;
            --dsp_res2_1_s <= dsp_res2_1;
            --dsp_res2_2_s <= dsp_res2_2;

            -- Clock 2
            IF dv1_1 = '1' AND dv1_2 = '1' THEN
                dsp_chi <= dsp_chi + unsigned(abs(dsp_res_1)) + unsigned(abs(dsp_res_2));
                startCounter <= '1';
            ELSIF dv1_1 = '1' THEN
                dsp_chi <= dsp_chi + unsigned(abs(dsp_res_1));
                startCounter <= '1';
            ELSIF dv1_2 = '1' THEN
                dsp_chi <= dsp_chi + unsigned(abs(dsp_res_2));
                startCounter <= '1';
            END IF;

            IF startCounter = '1' THEN
                counter <= counter + 1;
            END IF;
            IF counter = 8 THEN
                counter <= 0;
                startCounter <= '0';
                output_seg.valid <= '1';
                rst <= '1';
                output_seg.chi2 <= dsp_chi(CSF_SEG_CHI2_LEN - 1 DOWNTO 0);

                IF dsp_chi > 2 ** CSF_SEG_CHI2_LEN - 1 THEN
                    output_seg.chi2 <= (OTHERS => '1');
                END IF;
                output_seg.nhits <= nhits_s;
                output_seg.m <= mfit_s;
                output_seg.b <= bfit_s;

            END IF;

            IF rst = '1' THEN
                dsp_chi <= (OTHERS => '0');
                w_addr1 <= (OTHERS => '0');
                w_addr2 <= (OTHERS => '0');
                start_read <= '0';
                rst <= '0';
            END IF;

        END IF;
    END PROCESS; -- Chi2Proc

END Behavioral;