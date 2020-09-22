----------------------------------------------------------------------------------
-- Company: Max Planck Institut fuer Physik, Munich
-- Engineer: Davide Cieri (davide.cieri@cern.ch)
--
-- Create Date: 30/04/2019
-- Design Name: L0MDT Trigger
-- Module Name: Sagitta Calculator - Behavioral
-- Project Name: L0MDT Trigger
-- Target Devices: xcvu5p-flvb2104-2-e
-- Tool Versions: Vivado 2018.3
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

-- library shared_lib;
-- use shared_lib.config_pkg.all;
-- use shared_lib.common_types_pkg.all;
-- use shared_lib.common_constants_pkg.all;
library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library ptc_lib;
use ptc_lib.pt_pkg.all;
use ptc_lib.pt_params_pkg.all;

entity sagitta_calculator is
  port (
    clk               : in std_logic;
    i_seg0            : in sf2ptcalc_rvt;
    i_seg1            : in sf2ptcalc_rvt;
    i_seg2            : in sf2ptcalc_rvt;
    o_charge          : out std_logic;
    o_inv_s           : out unsigned(INV_S_LEN-1 downto 0);
    o_dv_s            : out std_logic
  );
end sagitta_calculator; -- sagitta_calculator

architecture Behavioral of sagitta_calculator is
    
    -- Constants
    constant DIVIDER_DELTA_R : integer := 23;
    constant DELTA_R_10_LEN : integer := 15;
    constant DELTA_R_10 : unsigned(DELTA_R_10_LEN-1 downto 0) := to_unsigned( integer(floor(BML_SEC3_RHO-BIL_SEC3_RHO)*SF2PTCALC_SEGPOS_MULT), DELTA_R_10_LEN );
    constant REC_DELTA_R_20_INT : integer := 2**DIVIDER_DELTA_R/integer(floor(BOL_SEC3_RHO-BIL_SEC3_RHO)*SF2PTCALC_SEGPOS_MULT);
    constant REC_DELTA_R_20 : unsigned(4 downto 0) := to_unsigned(REC_DELTA_R_20_INT, 5) ;

    -- Inputs
    signal seg0, seg1, seg2 : sf2ptcalc_rt;
    -- Valid signals for sagitta
    signal dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9, dv10, dv11
        : std_logic := '0';
    -- Valid signals for dbeta
    signal dvb_01, dvb_02, dvb_12       : std_logic := '0';
    signal dvb_01_1, dvb_02_1, dvb_12_1 : std_logic := '0';
    signal dvb_01_2, dvb_02_2, dvb_12_2 : std_logic := '0';
    signal dvb_01_3, dvb_02_3, dvb_12_3 : std_logic := '0';

    -- Dbeta signals
    signal delta_beta : unsigned(DBETA_LEN-1 downto 0)
        := (others => '0');

    -- Constants for distance calculations
    constant DELTA_R_RED_LEN : integer := 16;

    -- Signals for distance calculation
    signal delta_z_20, delta_z_20_s, delta_z_20_ss,
           delta_z_10, delta_z_10_s, delta_z_10_ss,
           delta_z_10_sss : unsigned(SF2PTCALC_SEGPOS_LEN-1 downto 0) := (others => '0');

    -- Constants for m_sagitta=deltaZ_20/deltaR_20 calculation
    constant M_SAGITTA_FULL_LEN : integer
        := 5+SF2PTCALC_SEGPOS_LEN+M_SAGITTA_MULTI_LEN+1; -- 34
    constant M_SAGITTA_LEN : integer := M_SAGITTA_FULL_LEN-DIVIDER_DELTA_R; -- 11
    -- Signals for m_sagitta=deltaZ_20/deltaR_20 calculation
    signal m_sagitta_full, m_sagitta_full_s : unsigned(M_SAGITTA_FULL_LEN-1 downto 0)
        := (others => '0');
    signal m_sagitta : unsigned(M_SAGITTA_LEN-1 downto 0) := (others => '0');
    
    constant DIVIDER_LEN_BETA : integer := 17;
    signal rec_delta_beta : std_logic_vector(DIVIDER_LEN_BETA-1 downto 0 ) := (others => '0');
    -- sqrt(1+m_sagitta^2)
    signal sqrt_m_io, sqrt_m_io_s, sqrt_m_io_ss, sqrt_m_io_sss, sqrt_m_io_ssss :
           std_logic_vector(M_SAGITTA_LEN downto 0) := (others => '0');

    -- m_sagitta*DeltaR_10 constants/signals
    constant DEN_SAGITTA_LEN : integer := M_SAGITTA_LEN + DELTA_R_10_LEN + 2; -- 30
    signal m_delta_r_10 : signed(DEN_SAGITTA_LEN-1 downto 0)
        := (others => '0');

    -- den_sagitta_red constants/signals
    constant SHIFT_DEN_SAGITTA : integer := 10;
    constant DEN_SAGITTA_RED_LEN : integer := 10; -- 20
    constant DIVIDER_LEN_SAGITTA : integer := 12;
    signal den_sagitta_red : signed(DEN_SAGITTA_RED_LEN-1 downto 0)
        := (others => '0');
    signal rec_den_sagitta : std_logic_vector(DIVIDER_LEN_SAGITTA-1 downto 0)
        := (others => '0');


    -- m_mult*DeltaZ_10 constants/signals
    constant M_MULT_DELTA_Z_10_LEN : integer
        := M_SAGITTA_MULTI_LEN+2+SF2PTCALC_SEGPOS_LEN+1;
    signal m_mult_delta_z_10, m_mult_delta_z_10_s, m_mult_delta_z_10_ss, den_sagitta :
           signed(M_MULT_DELTA_Z_10_LEN-1 downto 0) := (others => '0');

    -- inv sagitta full constants/signals
    constant INV_SAGITTA_FULL_LEN : integer := DIVIDER_LEN_SAGITTA + M_SAGITTA_LEN +1; -- 
    constant SHIFT_NUM_SAGITTA : integer := 13;
    signal inv_sagitta_full : unsigned(INV_SAGITTA_FULL_LEN-1 downto 0)
        := (others => '0');

    -- Segment parameters in global coordinates
    constant BIL_SEC3_RHO_s :  unsigned(SF_SEG_POS_LEN-1 downto 0)
        := to_unsigned(integer(floor(BIL_SEC3_RHO*SF2PTCALC_SEGPOS_MULT)), SF_SEG_POS_LEN);
    constant BML_SEC3_RHO_s :  unsigned(SF_SEG_POS_LEN-1 downto 0)
        := to_unsigned(integer(floor(BML_SEC3_RHO*SF2PTCALC_SEGPOS_MULT)), SF_SEG_POS_LEN);
    constant BOL_SEC3_RHO_s :  unsigned(SF_SEG_POS_LEN-1 downto 0)
        := to_unsigned(integer(floor(BOL_SEC3_RHO*SF2PTCALC_SEGPOS_MULT)), SF_SEG_POS_LEN);
    constant BIL_SEC3_RHO2_s : unsigned(SF_SEG_POS_LEN*2-1 downto 0)
        := BIL_SEC3_RHO_s*BIL_SEC3_RHO_s;

    -- charge signals 
    signal q0, q1, q2, q3, q4 : std_logic := '0';


    ----------------------------------------------------------------------------
    -- COMPONENTS --------------------------------------------------------------
    ----------------------------------------------------------------------------

    COMPONENT rom
    GENERIC (
        MXADRB   : integer;
        MXDATB   : integer;
        ROM_FILE : string;
        ROM_STYLE : string
    );
    PORT (
        clka  : in std_logic;
        ena   : in std_logic;
        addra : in std_logic_vector;
        douta : out std_logic_vector
    );
    END COMPONENT;

begin

    recROM0 : rom
    GENERIC MAP (
        MXADRB => DBETA_LEN,
        MXDATB => DIVIDER_LEN_BETA,
        ROM_FILE => "rec_dbeta.mem",
        ROM_STYLE => "distributed"
    )
    PORT MAP (
        clka => clk,
        ena => '1',
        addra => std_logic_vector(delta_beta),
        douta => rec_delta_beta
    );

    recROM1 : rom
    GENERIC MAP (
        MXADRB => DEN_SAGITTA_RED_LEN,
        MXDATB => DIVIDER_LEN_SAGITTA,
        ROM_FILE => "rec_sagitta.mem",
        ROM_STYLE => "distributed"
    )
    PORT MAP (
        clka => clk,
        ena => '1',
        addra => std_logic_vector(abs(den_sagitta_red)),
        douta => rec_den_sagitta
    );

    sqrtROM : rom
    GENERIC MAP (
        MXADRB => M_SAGITTA_LEN,
        MXDATB => M_SAGITTA_LEN+1,
        ROM_FILE => "sqrt_m_io_ROM.mem",
        ROM_STYLE => "distributed"
    )
    PORT MAP (
        clka => clk,
        ena => '1',
        addra => std_logic_vector(m_sagitta),
        douta => sqrt_m_io
    );

    seg0 <= structify(i_seg0);
    seg1 <= structify(i_seg1);
    seg2 <= structify(i_seg2);


    SagittaProc : process( clk )
    begin
        if rising_edge(clk) then
            -- Clock 0
            dv0 <= (seg0.data_valid and seg1.data_valid and seg2.data_valid);

            delta_z_20 <= seg2.segpos - seg0.segpos;
            delta_z_10 <= seg1.segpos - seg0.segpos;

            -- Delta Beta calculations
            dvb_01 <= (seg0.data_valid and
                       seg1.data_valid and
                       not seg2.data_valid);
            dvb_02 <= (seg0.data_valid and
                       not seg1.data_valid and
                       seg2.data_valid);
            dvb_12 <= (not seg0.data_valid and
                       seg1.data_valid and
                       seg2.data_valid);

            if (seg0.data_valid and
                seg1.data_valid and
                not seg2.data_valid) = '1' then
                delta_beta <= resize(
                    unsigned(abs(signed(seg0.segangle) - signed(seg1.segangle))), DBETA_LEN);
            elsif (seg0.data_valid and
                not seg1.data_valid and
                seg2.data_valid) = '1' then
                delta_beta <= resize(
                    unsigned(abs(signed(seg0.segangle) - signed(seg2.segangle))), DBETA_LEN);
            elsif (not seg0.data_valid and
                seg1.data_valid and
                seg2.data_valid) = '1' then
                delta_beta <= resize(
                    unsigned(abs(signed(seg1.segangle) - signed(seg2.segangle))), DBETA_LEN);
            end if;

            -- Clock 1
            dv1 <= dv0;
            delta_z_20_s <= delta_z_20;
            delta_z_10_s <= delta_z_10;
            dvb_01_1 <= dvb_01;
            dvb_02_1 <= dvb_02;
            dvb_12_1 <= dvb_12;

            -- Clock 2
            dv2 <= dv1;
            delta_z_10_ss <= delta_z_10_s;
            delta_z_20_ss <= delta_z_20_s;
            dvb_01_2 <= dvb_01_1;
            dvb_02_2 <= dvb_02_1;
            dvb_12_2 <= dvb_12_1;

            -- Clock 3 (rec_den_m now available)
            dv3 <= dv2;
            dvb_01_3 <= dvb_01_2;
            dvb_02_3 <= dvb_02_2;
            dvb_12_3 <= dvb_12_2;
            m_sagitta_full <= delta_z_20_ss*
                REC_DELTA_R_20*
                to_unsigned(integer(M_SAGITTA_MULTI),M_SAGITTA_MULTI_LEN+1);
            delta_z_10_sss <= delta_z_10_ss;

            -- Clock 4
            dv4 <= dv3;
            m_sagitta_full_s <= m_sagitta_full;
            m_mult_delta_z_10 <=
                to_signed(integer(M_SAGITTA_MULTI),
                    M_SAGITTA_MULTI_LEN+2)*signed('0' & delta_z_10_sss);

            -- Clock 5
            dv5 <= dv4;
            m_sagitta <= resize(
                (shift_right(m_sagitta_full_s, DIVIDER_DELTA_R)),
                M_SAGITTA_LEN);
            m_mult_delta_z_10_s <= m_mult_delta_z_10;


            -- Clock 6
            dv6 <= dv5;
            m_delta_r_10 <= signed('0' & DELTA_R_10)*signed('0' & m_sagitta);
            m_mult_delta_z_10_ss <= m_mult_delta_z_10_s;

            -- Clock 7 (sqrt_m_io now available)
            dv7 <= dv6;
            den_sagitta <= m_delta_r_10 - m_mult_delta_z_10_ss;

            -- Clock 8
            dv8 <= dv7;
            sqrt_m_io_ss <= sqrt_m_io;
            if den_sagitta < 0 then
                den_sagitta_red <=
                resize(shift_right(den_sagitta, SHIFT_DEN_SAGITTA) + 1 ,
                    DEN_SAGITTA_RED_LEN);
                q0 <= '0';
            else
                den_sagitta_red <= resize(shift_right(den_sagitta, SHIFT_DEN_SAGITTA) + 1 ,
                    DEN_SAGITTA_RED_LEN);
                q0 <= '1';
            end if;
            -- Clock 9
            dv9 <= dv8;
            q1 <= q0;
            sqrt_m_io_sss <= sqrt_m_io_ss;
--            if to_integer(abs(den_sagitta_red)) < 2**16 then
--                rec_den_sagitta <= reciprocalROM(to_integer(abs(den_sagitta_red)));
--            else
--                rec_den_sagitta <= reciprocalROM(2**16 -1);
--            end if;

            -- Clock 10 (rec_den_sagitta now available)
            dv10 <= dv9;
            q2 <= q1;
            sqrt_m_io_ssss <= sqrt_m_io_sss;

            -- Clock 11
            dv11 <= dv10;
            q3 <= q2;
            inv_sagitta_full <=
                unsigned(sqrt_m_io_ssss)*unsigned(rec_den_sagitta);

            -- Clock 12
            o_dv_s <= dv11;
            o_charge <= q3;
            o_inv_s <= resize(
                shift_right(inv_sagitta_full,
                    DIVIDER_LEN_SAGITTA+SHIFT_DEN_SAGITTA-SHIFT_NUM_SAGITTA),
                INV_S_LEN);

            if dvb_01_3 = '1' or dvb_02_3 = '1' or dvb_12_3 = '1' then
                o_dv_s <= '1';
                o_inv_s <= resize(
                    shift_right(unsigned(rec_delta_beta),DIVIDER_LEN_BETA), INV_S_LEN);
            end if;

        end if ;
    end process ; -- SagittaProc



end Behavioral;