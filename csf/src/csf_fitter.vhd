----------------------------------------------------------------------------------
-- Company: Max Planck Institut For Physics Munich
-- Engineer: Davide Cieri
--
-- Create Date: 02/12/2019 12:09:26 PM
-- Design Name: Compact Segment Finder
-- Module Name: csf_fitter - Behavioral
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

entity csf_fitter is
Port (
    clk             : in std_logic;
    i_hit1          : in csf_hit_rvt;
    i_hit2          : in csf_hit_rvt;
    o_mfit          : out signed(CSF_SEG_M_LEN-1 downto 0);
    o_bfit          : out signed(CSF_SEG_B_LEN-1 downto 0);
    o_fit_valid     : out std_logic;
    o_nhits         : out unsigned(CSF_MAXHITS_SEG_LEN-1 downto 0)
);
end csf_fitter;

architecture Behavioral of csf_fitter is


    -- Hits signals shifted
    signal hit1, hit2       : csf_hit_rt;
    signal hit1_s, hit2_s   : csf_hit_rt;

    -- Signal declaring last hits from Histograms
    signal finalhit : std_logic := '0';

    -- Summation signal widths
    constant SUM_YZ_LEN  : integer := CSF_MAXHITS_SEG_LEN+MDT_LOCAL_Y_LEN*2;
    constant SUM_Y_LEN   : integer := CSF_MAXHITS_SEG_LEN+MDT_LOCAL_Y_LEN;
    constant SUM_X_LEN   : integer := CSF_MAXHITS_SEG_LEN+MDT_LOCAL_X_LEN;
    constant SUM_X2_LEN  : integer := CSF_MAXHITS_SEG_LEN+MDT_LOCAL_X_LEN*2;

    -- Summation signals
    signal dsp_SumXY,dsp_SumXY_s    : unsigned(SUM_YZ_LEN-1 downto 0)
        := (others => '0');
    signal dsp_SumY ,dsp_SumY_s     : unsigned(SUM_Y_LEN-1 downto 0 )
        := (others => '0');
    signal dsp_SumX ,dsp_SumX_s     : unsigned(SUM_X_LEN-1 downto 0 )
        := (others => '0');
    signal dsp_SumX2 ,dsp_SumX2_s   : unsigned(SUM_X2_LEN-1 downto 0 )
        := (others => '0');
    signal dsp_nhits,dsp_nhits_s    : unsigned(CSF_MAXHITS_SEG_LEN-1 downto 0)
        := (others => '0');

    -- Numerator/Denominator widths
    constant NSUM_YZ_LEN      : integer := SUM_YZ_LEN + CSF_MAXHITS_SEG_LEN;
    constant SUM_Y_SUM_X_LEN  : integer := SUM_Y_LEN  + SUM_X_LEN;
    constant SUM_Y_SUM_X2_LEN : integer := SUM_Y_LEN  + SUM_X2_LEN;
    constant SUM_XZ_SUM_X_LEN : integer := SUM_YZ_LEN + SUM_X_LEN;
    constant SUM_X_SUM_X_LEN  : integer := SUM_X_LEN*2;
    constant NSUM_X2_LEN      : integer := CSF_MAXHITS_SEG_LEN + SUM_X2_LEN;
    constant NUM_M_LEN        : integer := NSUM_YZ_LEN + 1;
    constant NUM_B_LEN        : integer := SUM_Y_SUM_X2_LEN + 1;
    constant DEN_LEN          : integer := NSUM_X2_LEN;

    -- Numerator/Denominator constants
    constant SHIFT_NUM_M            : integer := 15;
    constant SHIFT_NUM_B            : integer := 28;
    constant SHIFT_DEN              : integer := 20;
    constant RECIPROCAL_LEN         : integer := 22;
    constant B_OVER_Z_MULTI_LEN     : integer
        := integer(log2(CSF_SEG_B_MULT/MDT_LOCAL_AXI_MULT));

    -- Numerator/Denominator signals
    signal dsp_NSumXY, dsp_NSumXY_s, dsp_NSumXY_ss
        : unsigned(NSUM_YZ_LEN-1 downto 0) := (others => '0');
    signal dsp_SumYSumX , dsp_SumYSumX_s, dsp_SumYSumX_ss
        : unsigned(SUM_Y_SUM_X_LEN-1 downto 0) := (others => '0');
    signal dsp_SumYSumX2, dsp_SumYSumX2_s, dsp_SumYSumX2_ss
        : unsigned(SUM_Y_SUM_X2_LEN-1 downto 0 ) := (others => '0');
    signal dsp_SumXYSumX, dsp_SumXYSumX_s, dsp_SumXYSumX_ss
        : unsigned(SUM_XZ_SUM_X_LEN-1 downto 0 ) := (others => '0');
    signal dsp_NSumX2   , dsp_NSumX2_s, dsp_NSumX2_ss
        : unsigned(NSUM_X2_LEN-1 downto 0 ) := (others => '0');
    signal dsp_SumXSumX , dsp_SumXSumX_s, dsp_SumXSumX_ss
        : unsigned(SUM_X_SUM_X_LEN-1 downto 0 ) := (others => '0');

    signal numerator_m  : signed(NUM_M_LEN-1 downto 0) := (others => '0');
    signal numerator_b  : signed(NUM_B_LEN-1 downto 0 ) := (others => '0');
    signal denominator  : unsigned(DEN_LEN-1 downto 0 ) := (others => '0');
    signal numerator_m_red, numerator_m_red_s,
           numerator_m_red_ss, numerator_m_red_sss:
            signed(NUM_M_LEN-SHIFT_NUM_M-1 downto 0):= (others => '0');
    signal numerator_b_red, numerator_b_red_s,
           numerator_b_red_ss, numerator_b_red_sss:
            signed(NUM_B_LEN-SHIFT_NUM_B-1 downto 0 ) := (others => '0');
    signal denominator_red  : unsigned(DEN_LEN-SHIFT_DEN-1 downto 0 )
        := (others => '0');
    signal reciprocal_addr  : std_logic_vector(DEN_LEN-SHIFT_DEN-1 downto 0 )
        := (others => '0');
    signal reciprocal_den, reciprocal_den_s : signed(RECIPROCAL_LEN downto 0)
        := (others => '0');


    type t_reciprocalROM is array ( natural range <> ) of
            std_logic_vector( RECIPROCAL_LEN-1 downto 0 );
    function reciprocalROM return t_reciprocalROM is
        variable temp: t_reciprocalROM(2**16-1 downto 0)
            := (others => (others => '0'));
    begin
        for k in 2 ** 16 - 1 downto 0 loop
            temp( k ) := std_logic_vector( to_unsigned(
                integer( floor(
                    (( 2.0 ** RECIPROCAL_LEN )) / ( real( k ) + 0.5 )
                )), RECIPROCAL_LEN ));
        end loop;
    return temp;
    end function;

    -- Fit result widths
    constant MFIT_FULL_LEN : integer := NUM_M_LEN-SHIFT_NUM_M+RECIPROCAL_LEN+1;
    constant BFIT_FULL_LEN : integer := NUM_B_LEN-SHIFT_NUM_B+RECIPROCAL_LEN+1;

    -- Fit result signals
    signal mfit_full, mfit_full_s : signed(MFIT_FULL_LEN-1 downto 0)
        := (others => '0');
    signal bfit_full, bfit_full_s : signed(BFIT_FULL_LEN-1 downto 0)
        := (others => '0');

    -- DSP valid signals
    signal dsp_start, dsp_start_s : std_logic := '0';
    signal counter : integer := 0;
    signal startCounter : std_logic := '0';
    signal dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9 : std_logic := '0';
    signal event_valid : std_logic := '0';

begin

    hit1 <= structify(i_hit1);
    hit2 <= structify(i_hit2);

    Fitter : process( clk )
    begin
        if rising_edge(clk) then
            hit1_s <= hit1;
            hit2_s <= hit2;
            dsp_start <= '0';
            finalhit <= hit1.valid or hit2.valid;

            if hit1.valid = '1' and hit2.valid = '1' then
                event_valid <= '1';
            end if;

            if (hit1_s.valid = '1' or hit2_s.valid = '1')
                and event_valid = '1' then
                dsp_SumXY <= dsp_SumXY + hit1_s.x*hit1_s.y +
                             hit2_s.x*hit2_s.y;
                dsp_SumY  <= dsp_SumY + hit1_s.y + hit2_s.y;
                dsp_SumX  <= dsp_SumX + hit1_s.x + hit2_s.x;
                dsp_SumX2 <= dsp_SumX2 + hit1_s.x*hit1_s.x + hit2_s.x*hit2_s.x;
                dsp_nhits <= dsp_nhits + stdlogic_integer(hit1_s.valid) +
                             stdlogic_integer(hit2_s.valid);
                startCounter <= '1';
            end if;

            if startCounter = '1' then
                counter <= counter + 1;
                if counter = 8 or finalhit = '0' then
                    dsp_start    <= '1';
                    startCounter <= '0';
                    counter      <= 0;
                end if;
            end if;

            -- Clock 0
            --dv0 <= dsp_start;
            dsp_NSumXY      <= dsp_nhits*dsp_SumXY;
            dsp_SumYSumX    <= dsp_SumY*dsp_SumX;
            dsp_SumYSumX2   <= dsp_SumY*dsp_SumX2;
            dsp_SumXYSumX   <= dsp_SumXY*dsp_SumX;
            dsp_NSumX2      <= dsp_nhits*dsp_SumX2;
            dsp_SumXSumX    <= dsp_SumX*dsp_SumX;
            --end if;

            -- Clock 1
            dv1 <= dsp_start;
            dsp_NSumXY_s        <= dsp_NSumXY   ;
            dsp_SumYSumX_s      <= dsp_SumYSumX ;
            dsp_SumYSumX2_s     <= dsp_SumYSumX2;
            dsp_SumXYSumX_s     <= dsp_SumXYSumX;
            dsp_NSumX2_s        <= dsp_NSumX2   ;
            dsp_SumXSumX_s      <= dsp_SumXSumX ;

            -- Clock 2
            dv2 <= dv1;
            dsp_NSumXY_ss       <= dsp_NSumXY_s     ;
            dsp_SumYSumX_ss     <= dsp_SumYSumX_s ;
            dsp_SumYSumX2_ss    <= dsp_SumYSumX2_s;
            dsp_SumXYSumX_ss    <= dsp_SumXYSumX_s;
            dsp_NSumX2_ss       <= dsp_NSumX2_s     ;
            dsp_SumXSumX_ss     <= dsp_SumXSumX_s ;

            -- Clock 3
            dv3 <= dv2;
            numerator_m         <= signed('0' & dsp_NSumXY_ss) - signed('0' & dsp_SumYSumX_ss);
            numerator_b         <= signed('0' & dsp_SumYSumX2_ss) - signed('0' & dsp_SumXYSumX_ss);
            denominator         <= dsp_NSumX2_ss - dsp_SumXSumX_ss;

            -- Clock 4
            dv4 <= dv3;
            numerator_m_red     <= resize(shift_right(numerator_m, SHIFT_NUM_M),
                                     NUM_M_LEN-SHIFT_NUM_M);
            numerator_b_red     <= resize(shift_right(numerator_b, SHIFT_NUM_B),
                                     NUM_B_LEN-SHIFT_NUM_B);
            denominator_red     <= resize(shift_right(denominator, SHIFT_DEN),
                                     DEN_LEN-SHIFT_DEN);
            -- Clock 5
            dv5 <= dv4;
            reciprocal_addr     <= std_logic_vector(denominator_red);
            numerator_b_red_s   <= numerator_b_red;
            numerator_m_red_s   <= numerator_m_red;

            -- Clock 6
            dv6 <= dv5;
            reciprocal_den      <= signed('0' &
                reciprocalROM(to_integer(unsigned(reciprocal_addr))));
            numerator_b_red_ss  <= numerator_b_red_s;
            numerator_m_red_ss  <= numerator_m_red_s;

            --Clock 7
            dv7 <= dv6;
            numerator_b_red_sss  <= numerator_b_red_ss;
            numerator_m_red_sss  <= numerator_m_red_ss;
            reciprocal_den_s     <= reciprocal_den;

            --Clock 8
            dv8 <= dv7;
            mfit_full           <= numerator_m_red_sss*signed(reciprocal_den_s);
            bfit_full           <= numerator_b_red_sss*signed(reciprocal_den_s);

            --Clock 9
            dv9       <= dv8;
            mfit_full_s         <= mfit_full;
            bfit_full_s         <= bfit_full;

            o_fit_valid <= dv9;
            o_mfit  <=
            resize(
                shift_right(
                mfit_full_s,
                RECIPROCAL_LEN + SHIFT_DEN - SHIFT_NUM_M - MFIT_MULTI_LEN
                ),
            CSF_SEG_M_LEN);

            o_bfit <=
            resize(
                shift_right(
                bfit_full_s,
                RECIPROCAL_LEN + SHIFT_DEN - SHIFT_NUM_B - B_OVER_Z_MULTI_LEN
                ),
            CSF_SEG_B_LEN);
            o_nhits <= dsp_nhits;

            -- Reset
            if dv9 = '1' then
                dsp_SumXY <= (others => '0');
                dsp_SumY  <= (others => '0');
                dsp_SumX  <= (others => '0');
                dsp_SumX2 <= (others => '0');
                dsp_nhits <= (others => '0');
                event_valid <= '0';
            end if;

        end if ;
    end process ; -- Fitter


end Behavioral;
