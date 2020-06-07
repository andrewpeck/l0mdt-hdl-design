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

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library pt_lib;
use pt_lib.pt_pkg.all;
use pt_lib.pt_params_pkg.all;

-- library IEEE, pt_lib, shared_lib;
-- use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;
-- use ieee.math_real.all;
-- use pt_lib.pt_pkg.all;
-- use shared_lib.custom_types_davide_pkg.all;

entity sagitta_calculator is
  port (
    clk               : in std_logic;
    i_seg0            : in sf_seg_data_barrel_rvt;
    i_seg1            : in sf_seg_data_barrel_rvt;
    i_seg2            : in sf_seg_data_barrel_rvt;
    o_inv_s           : out unsigned(INV_S_LEN-1 downto 0);
    o_dv_s            : out std_logic
  );
end sagitta_calculator; -- sagitta_calculator

architecture Behavioral of sagitta_calculator is
    -- Inputs
    signal seg0, seg1, seg2 : sf_seg_data_barrel_rt;
    -- Valid signals for sagitta
    signal dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9, dv10, dv11
        : std_logic := '0';
    -- Valid signals for dbeta
    signal dvb_01, dvb_02, dvb_12       : std_logic := '0';
    signal dvb_01_1, dvb_02_1, dvb_12_1 : std_logic := '0';
    signal dvb_01_2, dvb_02_2, dvb_12_2 : std_logic := '0';
    signal dvb_01_3, dvb_02_3, dvb_12_3 : std_logic := '0';

    -- Dbeta signals
    signal dbeta_01, dbeta_02, dbeta_03 : unsigned(DBETA_LEN-1 downto 0)
        := (others => '0');

    -- Constants for distance calculations
    constant DELTA_R_RED_LEN : integer := 16;

    -- Signals for distance calculation
    signal delta_z_20, delta_z_20_s, delta_z_20_ss,
           delta_z_10, delta_z_10_s, delta_z_10_ss,
           delta_z_10_sss : signed(SF_SEG_POS_LEN-1 downto 0) := (others => '0');
    signal delta_r_10, delta_r_10_s, delta_r_10_ss,
           delta_r_10_sss, delta_r_10_ssss,
           delta_r_10_sssss : unsigned(SF_SEG_POS_LEN-1 downto 0) := (others => '0');
    signal delta_r_20 : unsigned(DELTA_R_RED_LEN-1 downto 0 ) := (others => '0');

    -- Constants for m_sagitta=deltaZ_20/deltaR_20 calculation
    constant M_SAGITTA_FULL_LEN : integer
        := DIVIDER_LEN+SF_SEG_POS_LEN+M_SAGITTA_MULTI_LEN+3;

    -- Signals for m_sagitta=deltaZ_20/deltaR_20 calculation
    signal rec_den_m, rec_den_m_s : std_logic_vector(DIVIDER_LEN-1 downto 0)
        := (others => '0');
    signal m_sagitta_full, m_sagitta_full_s : signed(M_SAGITTA_FULL_LEN-1 downto 0)
        := (others => '0');
    signal m_sagitta : signed(M_SAGITTA_LEN-1 downto 0) := (others => '0');
    signal abs_m_sagitta : unsigned(M_SAGITTA_LEN-1 downto 0) := (others => '0');
    signal rec_delta_beta : unsigned(DIVIDER_LEN-1 downto 0 ) := (others => '0');
    -- sqrt(1+m_sagitta^2)
    signal sqrt_m_io, sqrt_m_io_s, sqrt_m_io_ss, sqrt_m_io_sss, sqrt_m_io_ssss :
           std_logic_vector(M_SAGITTA_LEN downto 0) := (others => '0');

    -- m_sagitta*DeltaR_10 constants/signals
    constant DEN_SAGITTA_LEN : integer := M_SAGITTA_LEN + SF_SEG_POS_LEN + 1;
    signal m_delta_r_10, den_sagitta : signed(DEN_SAGITTA_LEN-1 downto 0)
        := (others => '0');

    -- den_sagitta_red constants/signals
    constant SHIFT_DEN_SAGITTA : integer := 17;
--    constant DEN_SAGITTA_RED_LEN : integer := DEN_SAGITTA_LEN - SHIFT_DEN_SAGITTA;
    constant DEN_SAGITTA_RED_LEN : integer := 16;
    signal den_sagitta_red : signed(DEN_SAGITTA_RED_LEN-1 downto 0)
        := (others => '0');
    signal rec_den_sagitta : std_logic_vector(DIVIDER_LEN-1 downto 0)
        := (others => '0');


    -- m_mult*DeltaZ_10 constants/signals
    constant m_mult_delta_z_10_width : integer
        := M_SAGITTA_MULTI_LEN+2+SF_SEG_POS_LEN;
    signal m_mult_delta_z_10, m_mult_delta_z_10_s, m_mult_delta_z_10_ss :
           signed(m_mult_delta_z_10_width-1 downto 0) := (others => '0');

    -- inv sagitta full constants/signals
    constant INV_SAGITTA_FULL_LEN : integer := DIVIDER_LEN+ M_SAGITTA_LEN +1;
    constant SHIFT_NUM_SAGITTA : integer := 15;
    signal inv_sagitta_full : unsigned(INV_SAGITTA_FULL_LEN-1 downto 0)
        := (others => '0');

    --COMPONENT sqrt_m_io_ROM
    --PORT (
    --    clka : IN STD_LOGIC;
    --    ena : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(16 DOWNTO 0)
    --);
    --END COMPONENT;

    --COMPONENT reciprocalROM
    --PORT (
    --    clka : IN STD_LOGIC;
    --    ena : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(20 DOWNTO 0)
    --);
    --END COMPONENT;

    ----------------------------------------------------------------------------
    -- COMPONENTS --------------------------------------------------------------
    ----------------------------------------------------------------------------

    COMPONENT rom
    GENERIC (
        MXADRB   : integer;
        MXDATB   : integer;
        ROM_FILE : string
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
        MXADRB => DELTA_R_RED_LEN,
        MXDATB => DIVIDER_LEN,
        ROM_FILE => "../data/reciprocalROM.mem"
    )
    PORT MAP (
        clka => clk,
        ena => '1',
        addra => std_logic_vector(delta_r_20),
        douta => rec_den_m
    );

    recROM1 : rom
    GENERIC MAP (
        MXADRB => DEN_SAGITTA_RED_LEN,
        MXDATB => DIVIDER_LEN,
        ROM_FILE => "../data/reciprocalROM.mem"
    )
    PORT MAP (
        clka => clk,
        ena => '1',
        addra => std_logic_vector(den_sagitta_red),
        douta => rec_den_sagitta
    );

    sqrtROM : rom
    GENERIC MAP (
        MXADRB => M_SAGITTA_LEN,
        MXDATB => M_SAGITTA_LEN+1,
        ROM_FILE => "../data/reciprocalROM.mem"
    )
    PORT MAP (
        clka => clk,
        ena => '1',
        addra => std_logic_vector(abs_m_sagitta),
        douta => sqrt_m_io
    );

    abs_m_sagitta <= unsigned(abs(m_sagitta));
    seg0 <= structify(i_seg0);
    seg1 <= structify(i_seg1);
    seg2 <= structify(i_seg2);

    SagittaProc : process( clk )
    begin
        if rising_edge(clk) then
            -- Clock 0
            dv0 <= (seg0.data_valid and seg1.data_valid and seg2.data_valid);

            delta_z_20 <= seg2.pos - seg0.pos;
            delta_z_10 <= seg1.pos - seg0.pos;
            delta_r_20 <= resize(
                    shift_right(BOL_SEC3_RHO_s - BIL_SEC3_RHO_s, shift_m_den),
                    DELTA_R_RED_LEN);
            delta_r_10 <= BML_SEC3_RHO_s - BIL_SEC3_RHO_s;

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
                delta_r_20 <= resize(
                    unsigned(abs(seg0.angle - seg1.angle)), DELTA_R_RED_LEN);
            elsif (seg0.data_valid and
                not seg1.data_valid and
                seg2.data_valid) = '1' then
                delta_r_20 <= resize(
                    unsigned(abs(seg0.angle - seg2.angle)), DELTA_R_RED_LEN);
            elsif (not seg0.data_valid and
                seg1.data_valid and
                seg2.data_valid) = '1' then
                delta_r_20 <= resize(
                    unsigned(abs(seg1.angle - seg2.angle)), DELTA_R_RED_LEN);
            end if;

            -- Clock 1
            dv1 <= dv0;
            delta_z_20_s <= delta_z_20;
            delta_z_10_s <= delta_z_10;
            delta_r_10_s <= delta_r_10;
            dvb_01_1 <= dvb_01;
            dvb_02_1 <= dvb_02;
            dvb_12_1 <= dvb_12;

            -- Clock 2
            dv2 <= dv1;
            delta_z_10_ss <= delta_z_10_s;
            delta_r_10_ss <= delta_r_10_s;
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
                signed('0' & rec_den_m)*
                to_signed(integer(m_sagitta_multi),M_SAGITTA_MULTI_LEN+2);
            delta_z_10_sss <= delta_z_10_ss;
            delta_r_10_sss <= delta_r_10_ss;
            rec_delta_beta <= unsigned(rec_den_m);

            -- Clock 4
            dv4 <= dv3;
            m_sagitta_full_s <= m_sagitta_full;
            m_mult_delta_z_10 <=
                to_signed(integer(m_sagitta_multi),
                    M_SAGITTA_MULTI_LEN+2)*delta_z_10_sss;
            delta_r_10_ssss <= delta_r_10_sss;

            -- Clock 5
            dv5 <= dv4;
            m_sagitta <= resize(
                (shift_right(m_sagitta_full_s, DIVIDER_LEN+shift_m_den)),
                M_SAGITTA_LEN);
            delta_r_10_sssss <= delta_r_10_ssss;
            m_mult_delta_z_10_s <= m_mult_delta_z_10;


            -- Clock 6
            dv6 <= dv5;
--            sqrt_m_io <= sqrt_m_io_ROM(to_integer(abs(m_sagitta)));
            --inv_m <= invsqrt_ROM(to_integer(abs(m_sagitta)));
            m_delta_r_10 <= signed('0' & delta_r_10_sssss)*m_sagitta;
            m_mult_delta_z_10_ss <= m_mult_delta_z_10_s;

            -- Clock 7 (sqrt_m_io now available)
            dv7 <= dv6;
            -- sqrt_m_io_s <= sqrt_m_io;
            den_sagitta <= m_delta_r_10 - m_mult_delta_z_10_ss;

            -- Clock 8
            dv8 <= dv7;
            sqrt_m_io_ss <= sqrt_m_io;
            den_sagitta_red <=
                resize(shift_right(den_sagitta, SHIFT_DEN_SAGITTA),
                    DEN_SAGITTA_RED_LEN);

            -- Clock 9
            dv9 <= dv8;
            sqrt_m_io_sss <= sqrt_m_io_ss;
--            if to_integer(abs(den_sagitta_red)) < 2**16 then
--                rec_den_sagitta <= reciprocalROM(to_integer(abs(den_sagitta_red)));
--            else
--                rec_den_sagitta <= reciprocalROM(2**16 -1);
--            end if;

            -- Clock 10 (rec_den_sagitta now available)
            dv10 <= dv9;
            sqrt_m_io_ssss <= sqrt_m_io_sss;

            -- Clock 11
            dv11 <= dv10;
            inv_sagitta_full <=
                unsigned(sqrt_m_io_ssss)*unsigned(rec_den_sagitta);

            -- Clock 12
            o_dv_s <= dv11;
            o_inv_s <= resize(
                shift_right(inv_sagitta_full,
                    DIVIDER_LEN+SHIFT_DEN_SAGITTA-SHIFT_NUM_SAGITTA),
                INV_S_LEN);

            if dvb_01_3 = '1' or dvb_02_3 = '1' or dvb_12_3 = '1' then
                o_dv_s <= '1';
                o_inv_s <= resize(
                    shift_right(rec_delta_beta,DIVIDER_LEN), INV_S_LEN);
            end if;

        end if ;
    end process ; -- SagittaProc



end Behavioral;