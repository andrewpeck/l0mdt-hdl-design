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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

library csf_lib;
use csf_lib.csf_pkg.all;
use csf_lib.csf_custom_pkg.all;

-- library ieee, csf_lib, shared_lib;
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use ieee.math_real.all;
-- use csf_lib.csf_pkg.all;
-- use csf_lib.custom_types_csf_pkg.all;
-- use shared_lib.custom_types_davide_pkg.all;

entity csf_chi2 is
  port (
    clk            : in std_logic;
    i_hit1         : in csf_hit_rvt;
    i_hit2         : in csf_hit_rvt;
    i_mfit         : in signed(CSF_SEG_M_LEN-1 downto 0);
    i_bfit         : in signed(CSF_SEG_B_LEN-1 downto 0);
    i_nhits        : in unsigned(CSF_MAXHITS_SEG_LEN-1 downto 0);
    i_fit_valid    : in std_logic;
    o_seg          : out csf_locseg_rvt
  );
end csf_chi2; -- csf_chi2

architecture Behavioral of csf_chi2 is
    -- Reset
    signal rst : std_logic := '0';
    -- Hit Buffer signals
    signal w_addr1, w_addr2   : std_logic_vector(CSF_MAXHITS_ML_LEN-1 downto 0)
                                                := (others => '0');
    signal r_addr1, r_addr2   : std_logic_vector(CSF_MAXHITS_ML_LEN-1 downto 0)
                                                := (others => '1');
    signal hit_vec1, hit_vec2 : csf_hit_rvt
                                                := (others => '0');
    signal hit1, hit2         : csf_hit_rt;
    signal outhit1, outhit2   : csf_hit_rt;

    -- MDT hit coordinate uncertainty
    constant SIGMA : real := 1.0/8.0;
    constant SIGMA_LEN : integer := integer(log2(SIGMA*HEG2SFHIT_LOCALX_MULT));

    -- Fit parameter signals
    signal mfit_s  : signed(CSF_SEG_M_LEN-1 downto 0) := (others => '0');
    signal bfit_s  : signed(CSF_SEG_B_LEN-1 downto 0) := (others => '0');

    -- Residual widths
    constant B_OVER_Z_MULTI_LEN     : integer
        := integer(log2(CSF_SEG_B_MULT/HEG2SFHIT_LOCALX_MULT));

    constant B_RED_LEN           : integer := CSF_SEG_B_LEN-B_OVER_Z_MULTI_LEN;
    constant MX_LEN  : integer
        := CSF_SEG_M_LEN + MDT_LOCAL_X_LEN + 1 - MFIT_MULTI_LEN + 1;
    constant RES_LEN : integer := MX_LEN - SIGMA_LEN + CHI2_MULT_LEN/2;

    -- Residual signals
    signal b_red                : signed(B_RED_LEN-1 downto 0 )
        := (others => '0');
    signal dsp_mx1, dsp_mx2     : signed(MX_LEN-1 downto 0) := (others => '0');
    signal dsp_b_y_1, dsp_b_y_2 : signed(MDT_LOCAL_Y_LEN downto 0  )
        := (others => '0');
    signal dsp_res_1, dsp_res_2 : signed(RES_LEN-1 downto 0 )
        := (others => '0');
    signal dsp_res2_1, dsp_res2_1_s, dsp_res2_2, dsp_res2_2_s
        : unsigned(CSF_SEG_CHI2_LEN*2-1 downto 0 ) := (others => '0');

    -- other DSP signals
    signal dv0_1, dv0_2, dv1_1, dv1_2, dv2_1, dv2_2, dv3_1, dv3_2
        : std_logic := '0';
    signal start_read  : std_logic := '0';
    signal nhits_s     : unsigned(CSF_MAXHITS_SEG_LEN-1 downto 0)
        := (others => '0');
    signal dsp_chi     : unsigned(CSF_SEG_CHI2_LEN*2 - 1 downto 0)
        := (others => '0');
    signal counter     : integer := 0;
    signal startCounter : std_logic := '0';

    -- Output segment
    signal output_seg : csf_locseg_rt;

begin

    hit1 <= structify(i_hit1);
    hit2 <= structify(i_hit2);

    HitBuffer1 : entity shared_lib.bram_tdp
    generic map(
        ADDR => CSF_MAXHITS_ML_LEN,
        DATA => CSF_HIT_LEN,
        ram_type => "distributed"
        )
    port map(
        a_clk  => clk,
        a_wr   => hit1.valid,
        a_addr => w_addr1,
        a_din  => i_hit1,
        b_clk  => clk,
        b_addr => r_addr1,
        b_dout => hit_vec1
    );

    HitBuffer2 : entity shared_lib.bram_tdp
    generic map(
        ADDR => CSF_MAXHITS_ML_LEN,
        DATA => CSF_HIT_LEN,
        ram_type => "distributed"
        )
    port map(
        a_clk  => clk,
        a_wr   => hit2.valid,
        a_addr => w_addr2,
        a_din  => i_hit2,
        b_clk  => clk,
        b_addr => r_addr2,
        b_dout => hit_vec2
    );

    outhit1 <= structify(hit_vec1);
    outhit2 <= structify(hit_vec2);

    o_seg <= vectorify(output_seg);

    Chi2Proc : process( clk )
    begin
        if rising_edge(clk) then
            output_seg <= nullify(output_seg);

            -- Store Hits into a RAM, waiting for the fit result
            if hit1.valid = '1' then
                w_addr1 <= std_logic_vector(unsigned(w_addr1) + 1);
            end if ;

            if hit2.valid = '1' then
                w_addr2 <= std_logic_vector(unsigned(w_addr2) + 1);
            end if;

            if i_fit_valid = '1' then
                mfit_s <= i_mfit;
                bfit_s <= i_bfit;
                nhits_s <= i_nhits;
                if B_OVER_Z_MULTI_LEN < 0 then
                    b_red <= resize(
                             shift_left(i_bfit, abs(B_OVER_Z_MULTI_LEN)),
                             B_RED_LEN);
                else
                    b_red <= resize(
                             shift_right(i_bfit, B_OVER_Z_MULTI_LEN),
                             B_RED_LEN);
                end if;
                r_addr1 <= (others => '0');
                r_addr2 <= (others => '0');
                start_read <= '1';
            end if ;

            if start_read = '1' then
                if unsigned(r_addr1) < unsigned(w_addr1) -1 then
                    r_addr1 <= std_logic_vector(unsigned(r_addr1) + 1);
                else
                    r_addr1 <= (others => '1');
                end if ;
                if unsigned(r_addr2) < unsigned(w_addr2) -1 then
                    r_addr2 <= std_logic_vector(unsigned(r_addr2) + 1);
                else
                    r_addr2 <= (others => '1');
                end if ;
            end if ;

            -- Clock 0
            dv0_1 <= outhit1.valid;
            dv0_2 <= outhit2.valid;
            dsp_mx1 <= resize(
                    shift_right(mfit_s*signed('0' & outhit1.x), MFIT_MULTI_LEN),
                    MX_LEN);
            dsp_mx2 <= resize(
                    shift_right(mfit_s*signed('0' & outhit2.x), MFIT_MULTI_LEN),
                     MX_LEN);
            dsp_b_y_1  <= signed('0' & outhit1.y) - b_red;
            dsp_b_y_2  <= signed('0' & outhit2.y) - b_red;

            -- Clock 1
            dv1_1 <= dv0_1;
            dv1_2 <= dv0_2;

            dsp_res_1  <= resize(
                shift_right(dsp_b_y_1 - dsp_mx1, SIGMA_LEN-CHI2_MULT_LEN/2),
                                    RES_LEN);
            dsp_res_2  <= resize(
                shift_right(dsp_b_y_2 - dsp_mx2, SIGMA_LEN-CHI2_MULT_LEN/2),
                                    RES_LEN);

            -- Clock 2
            dv2_1 <= dv1_1;
            dv2_2 <= dv1_2;
            dsp_res2_1 <= resize(unsigned(dsp_res_1*dsp_res_1),
                         CSF_SEG_CHI2_LEN*2);
            dsp_res2_2 <= resize(unsigned(dsp_res_2*dsp_res_2),
                         CSF_SEG_CHI2_LEN*2);

            -- Clock 3
            dv3_1 <= dv2_1;
            dv3_2 <= dv2_2;
            dsp_res2_1_s <= dsp_res2_1;
            dsp_res2_2_s <= dsp_res2_2;

            -- Clock 4
            if dv3_1 = '1' and dv3_2 = '1' then
                dsp_chi <= dsp_chi + dsp_res2_1_s + dsp_res2_2_s;
                startCounter <= '1';
            elsif dv3_1 = '1' then
                dsp_chi <= dsp_chi + dsp_res2_1_s;
                startCounter <= '1';
            elsif dv3_2 = '1' then
                dsp_chi <= dsp_chi + dsp_res2_2_s;
                startCounter <= '1';
            end if;

            if startCounter = '1' then
                counter <= counter+1;
            end if;

            
            if counter = 8 then
                counter <= 0;
                startCounter <= '0';
                output_seg.valid <= '1';
                rst <= '1';
                output_seg.chi2 <= dsp_chi(CSF_SEG_CHI2_LEN-1 downto 0);

                if dsp_chi > 2**CSF_SEG_CHI2_LEN-1 then
                    output_seg.chi2 <= (others => '1');
                end if;
                output_seg.ndof <= nhits_s -2 ;
                output_seg.m <= mfit_s;
                output_seg.b <= bfit_s;

            end if;

            if rst = '1' then
                dsp_chi <= (others => '0');
                w_addr1 <= (others => '0');
                w_addr2 <= (others => '0');
                start_read <= '0';
                rst <= '0';
            end if;

        end if ;
    end process ; -- Chi2Proc



end Behavioral;