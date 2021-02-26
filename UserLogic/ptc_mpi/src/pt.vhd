--------------------------------------------------------------------------------
-- Title       : pt.vhd
-- Project     : MDTTP
--------------------------------------------------------------------------------
-- File        : pt.vhd
-- Author      : Davide Cieri davide.cieri@cern.ch
-- Company     : Max-Planck-Institute For Physics, Munich
-- Created     : Tue Feb 11 13:50:27 2020
-- Last update : Fri May 29 15:12:46 2020
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Max-Planck-Institute For Physics, Munich
-------------------------------------------------------------------------------
-- Description:  pT calculator top module
--------------------------------------------------------------------------------
-- Revisions:  Revisions and documentation are controlled by
-- the revision control system (RCS).  The RCS should be consulted
-- on revision history.
-------------------------------------------------------------------------------

-- Doxygen-compatible comments
--! @file pt.vhd
--! @brief pt
--! @details
--! pT calculator top module
--! @author Davide Cieri
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
use shared_lib.config_pkg.all;

library ptc_lib;
use ptc_lib.pt_pkg.all;
use ptc_lib.pt_params_pkg.all;

entity pt is
    generic(
        FLAVOUR : integer := 0; -- Barrel
        SECTOR  : integer := 3;
        SIDE    : integer := 0 -- 0 positive eta, 1 negative eta
    );
    Port (
        clk : in std_logic;
        i_segment_I  : in sf2ptcalc_rvt;
        i_segment_M  : in sf2ptcalc_rvt;
        i_segment_O  : in sf2ptcalc_rvt;
        i_SLC        : in pl2ptcalc_rvt;
        i_rst        : in std_logic;
        o_mtc        : out ptcalc2mtc_rvt
    );
end pt;

architecture Behavioral of pt is
    -- Online segments in global coordinates
    signal segment_I, segment_M, segment_O : sf2ptcalc_rt;
    signal segment_I_s, segment_M_s, segment_O_s : sf2ptcalc_rt;
    signal segment_eta, segment_I_v, segment_M_v, segment_O_v : sf2ptcalc_rvt;


    signal segment_EI, segment_EM, segment_EO : sf2ptcalc_rvt;

    -- SLC candidate
    signal slc, slc_s : pl2ptcalc_rt;
    -- Chamber combo id
    signal comboid_s : unsigned(VEC_MDTID_CHAMBER_IETA_LEN*3 -1 downto 0) := (others => '0');
    signal comboid_phi, comboid_phi_s, comboid_eta :
           unsigned(VEC_MDTID_CHAMBER_IETA_LEN*3 + 4 -1 downto 0) := (others => '0');
    --signal ram_index : integer := 0;
    -- Sagitta/Dbeta calculator signals
    signal dv_s, dv_combo_s, dv_combo_s_s : std_logic := '0';
    signal inv_s, inv_s_s : unsigned(INV_S_LEN-1 downto 0)
           := (others => '0');

    -- Data Valid signals
    signal dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9, dv10, dv11
                                                             : std_logic := '0';
    signal dv_a : std_logic := '0';
    -- Phi/Eta coordinate
    signal nsegments : unsigned(MTC_NSEG_LEN-1 downto 0) := (others => '0');
    signal dv_eta : std_logic := '0';
    signal phi : signed(UCM_PT_PHIMOD_LEN-1 downto 0) := (others => '0');
    signal eta : unsigned(PTCALC2MTC_MDT_ETA_LEN-1 downto 0) := (others => '0');
    signal im : std_logic := '0'; -- 0: Inner, 1: Middle
    signal dv_dbeta_01, dv_dbeta_02, dv_dbeta_12 : std_logic := '0';
    signal dbeta_01, dbeta_02, dbeta_12 : unsigned(DBETA_LEN-1 downto 0)
                                        := (others => '0');

    -- Signal for pT calculation
    -- Sagitta/Dbeta-dependent part
    signal a0, a0_s : std_logic_vector(A0_LEN-1 downto 0) := (others =>'0');
    signal a1 : std_logic_vector(A1_LEN-1 downto 0) := (others =>'0');
    signal a1_invs : unsigned(A0_LEN-1 downto 0)
           := (others => '0');
    signal pt_s, pt_s0, pt_s1 : unsigned(A0_LEN-1 downto 0) := (others => '0');
    signal bin_s : unsigned(3 downto 0) := (others => '0');

    -- Phi-dependent part
    constant B1_PHI_LEN : integer := B1_LEN+UCM2PL_PHIMOD_LEN - PHIMOD_MULTI_LEN;
    constant B2_PHI_LEN : integer := B2_LEN+UCM2PL_PHIMOD_LEN - PHIMOD_MULTI_LEN;
    constant B2_PHI2_LEN : integer := B2_PHI_LEN+UCM2PL_PHIMOD_LEN - PHIMOD_MULTI_LEN;
    

    signal b0,b0_s : std_logic_vector(B0_LEN-1 downto 0) := (others => '0');
    signal b1 : std_logic_vector(B1_LEN-1 downto 0) := (others => '0');
    signal b1_phi, pt_phi_01, b0_b1_phi : signed(B1_PHI_LEN-1 downto 0)
           := (others => '0');
    signal b2 : std_logic_vector(B2_LEN-1 downto 0) := (others => '0');
    signal b2_phi : signed(B2_PHI_LEN-1 downto 0) := (others => '0');
    signal b2_phi2 : signed(B2_PHI2_LEN-1  downto 0)
           := (others => '0');
    signal pt_s2, pt_s3, pt_s4 : signed(A0_LEN downto 0) := (others => '0');
    signal pt_sp, pt_sp_s, pt_sp_ss, pt_sp_sss, pt_sp_ssss
           : signed(B2_PHI_LEN -1  downto 0) := (others => '0');
    signal bin_sp : unsigned(3 downto 0) := (others => '0');


    -- Eta dependent part
    constant C1_ETA_LEN : integer := C1_LEN + PTCALC2MTC_MDT_ETA_LEN - ETA_MULTI_LEN;
    signal c0, c0_s : std_logic_vector(C0_LEN-1 downto 0) := (others => '0');
    signal c1 : std_logic_vector(C1_LEN-1 downto 0) := (others =>'0');
    signal c1_eta : signed(C1_ETA_LEN-1 downto 0) := (others => '0');

    -- Final pt signals
    signal pt_online  :  signed(C1_ETA_LEN-1 downto 0) := (others => '0');
    signal pt_valid   :  std_logic := '0';
    -- Mtc output parameters
    signal pt : unsigned(PTCALC2MTC_MDT_PT_LEN-1 downto 0) := (others => '0');
    signal mtc_valid : std_logic := '0';
    signal mtc : ptcalc2mtc_rt;
    signal quality : std_logic_vector(MTC_QUALITY_LEN-1 downto 0) := (others => '0');

    signal index_a : std_logic_vector(A_PARAMS_DEPTH_LEN-1 downto 0) := (others => '0');
    signal index_b : std_logic_vector(PARAMS_DEPTH_LEN-1 downto 0) := (others => '0');
    signal index_c : std_logic_vector(PARAMS_DEPTH_LEN-1 downto 0) := (others => '0');


    ----------------------------------------------------------------------------
    -- COMPONENTS --------------------------------------------------------------


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

    EtaCalculator : entity ptc_lib.eta_calculator
    port map (
        clk            => clk,
        i_seg          => segment_eta,
        i_layer        => im,
        o_eta          => eta,
        o_dv_eta       => dv_eta
    );

    SagittaCalculator : entity ptc_lib.sagitta_calculator
    port map(
        clk => clk,
        i_seg0 => segment_I_v,
        i_seg1 => segment_M_v,
        i_seg2 => segment_O_v,
        o_inv_s => inv_s,
        o_dv_s => dv_s
    );

    getA0 : rom
    GENERIC MAP(
        MXADRB => A_PARAMS_DEPTH_LEN,
        MXDATB => A0_LEN,
        ROM_FILE => "a0.mem",
        ROM_STYLE => "block"
    )
    PORT MAP (
        clka => clk,
        ena => dv_combo_s,
        addra => index_a,
        douta => a0
    );

    getA1 : rom
    GENERIC MAP(
        MXADRB => A_PARAMS_DEPTH_LEN,
        MXDATB => A1_LEN,
        ROM_FILE => "a1.mem",
        ROM_STYLE => "block"
    )
    PORT MAP (
        clka => clk,
        ena => dv_combo_s,
        addra => index_a,
        douta => a1
    );

    getB0 : rom
    GENERIC MAP(
        MXADRB => PARAMS_DEPTH_LEN,
        MXDATB => B0_LEN,
        ROM_FILE => "b0.mem",
        ROM_STYLE => "block"
    )
    PORT MAP (
        clka => clk,
        ena => dv2,
        addra => index_b,
        douta => b0
    );

    getB1 : rom
    GENERIC MAP(
        MXADRB => PARAMS_DEPTH_LEN,
        MXDATB => B1_LEN,
        ROM_FILE => "b1.mem",
        ROM_STYLE => "block"
    )
    PORT MAP (
        clka => clk,
        ena => dv2,
        addra => index_b,
        douta => b1
    );

    getB2 : rom
    GENERIC MAP(
        MXADRB => PARAMS_DEPTH_LEN,
        MXDATB => B2_LEN,
        ROM_FILE => "b2.mem",
        ROM_STYLE => "block"
    )
    PORT MAP (
        clka => clk,
        ena => dv2,
        addra => index_b,
        douta => b2
    );

    getC0 : rom
    GENERIC MAP(
        MXADRB => PARAMS_DEPTH_LEN,
        MXDATB => C0_LEN,
        ROM_FILE => "c0.mem",
        ROM_STYLE => "block"
    )
    PORT MAP (
        clka => clk,
        ena => dv8,
        addra => index_c,
        douta => c0
    );

    getC1 : rom
    GENERIC MAP(
        MXADRB => PARAMS_DEPTH_LEN,
        MXDATB => C1_LEN,
        ROM_FILE => "c1.mem",
        ROM_STYLE => "block"
    )
    PORT MAP (
        clka => clk,
        ena => dv8,
        addra => index_c,
        douta => c1
    );

    segment_I <= structify(i_segment_I);
    segment_M <= structify(i_segment_M);
    segment_O <= structify(i_segment_O);
    

    index_a <= acomboid_to_index_ram(comboid_s);
    index_b <= comboid_to_index_ram(comboid_phi);
    index_c <= comboid_to_index_ram(comboid_eta);

    slc <= structify(i_SLC);
    o_mtc <= vectorify(mtc);


    pt_top_proc : process( clk )
    begin
        if rising_edge(clk) then


            segment_I_v <= i_segment_I;
            segment_M_v <= i_segment_M;
            segment_O_v <= i_segment_O;

            if segment_I.data_valid = '1' or segment_M.data_valid = '1' or segment_O.data_valid = '1' then
                dv_combo_s     <= '1';
                if segment_I.data_valid = '1' then
                    segment_eta <= i_segment_I;
                    im <= '0';
                else
                    segment_eta <= i_segment_M;
                    im <= '1';
                end if;

                comboid_s  <= unsigned(segment_O.mdtid.chamber_ieta) &
                              unsigned(segment_M.mdtid.chamber_ieta) &
                              unsigned(segment_I.mdtid.chamber_ieta);
                nsegments <= to_unsigned(stdlogic_integer(segment_I.data_valid)
                    + stdlogic_integer(segment_M.data_valid)
                    + stdlogic_integer(segment_O.data_valid),
                    MTC_NSEG_LEN);
                quality <= segment_O.data_valid &
                           segment_M.data_valid &
                           segment_I.data_valid;
               segment_I_s <= segment_I;
               segment_M_s <= segment_M;
               segment_O_s <= segment_O;
            end if;
            -- save the slc
            if slc.data_valid = '1' then
                slc_s  <= SLC;
            end if;

            dv_combo_s_s <= dv_combo_s;
            -- <a> parameters are now valid
            dv_a <= dv_combo_s_s;
            dv0 <= dv_s and dv_a;
            a1_invs <= resize(shift_right( unsigned(a1)*inv_s*integer(SF2PTCALC_SEGPOS_MULT), SHIFT_NUM_SAGITTA), A0_LEN);

            a0_s <= a0;

            dv1  <= dv0;
            pt_s <= unsigned(a0_s) + a1_invs;

            dv2 <= dv1;
            comboid_phi <= pt_bin(pt_s) &
                           unsigned(segment_O_s.mdtid.chamber_ieta) &
                           unsigned(segment_M_s.mdtid.chamber_ieta) &
                           unsigned(segment_I_s.mdtid.chamber_ieta);
            pt_s0 <= pt_s;

            dv3 <= dv2;
            pt_s1 <= pt_s0;

            dv4 <= dv3;
            pt_s2  <= signed('0' & pt_s1);

            -- <b> parameters now valid
            dv5 <= dv4;
            b0_s <= b0;
            b1_phi <= resize(shift_right(signed(b1)*slc_s.phimod, PHIMOD_MULTI_LEN), B1_PHI_LEN);
            b2_phi <= resize(shift_right(signed(b2)*slc_s.phimod, PHIMOD_MULTI_LEN), B2_PHI_LEN);
            pt_s3  <= pt_s2;

            dv6 <= dv5;
            b0_b1_phi <= signed(b0_s) + b1_phi;
            b2_phi2 <= resize(shift_right(b2_phi*slc_s.phimod, PHIMOD_MULTI_LEN), B2_PHI2_LEN);
            pt_s4 <= pt_s3;

            dv7 <= dv6;
            pt_sp <= pt_s4 - shift_right((b0_b1_phi + b2_phi2), B_MULT_LEN);

            dv8 <= dv7;
            comboid_eta <= pt_bin(unsigned(pt_sp)) &
                           unsigned(segment_O_s.mdtid.chamber_ieta) &
                           unsigned(segment_M_s.mdtid.chamber_ieta) &
                           unsigned(segment_I_s.mdtid.chamber_ieta);
            pt_sp_s <= pt_sp;

            dv9 <= dv8;
            pt_sp_ss <= pt_sp_s;

            ---- <c> parameters now valid
            dv10 <= dv9;
            pt_sp_sss <= pt_sp_ss;

            dv11 <= dv10;
            pt_sp_ssss <= pt_sp_sss;
            c1_eta <= resize(shift_right(signed(c1)*signed(eta), ETA_MULTI_LEN), C1_ETA_LEN);
            c0_s <= c0;

            pt_valid <= dv11;
            pt_online <= pt_sp_ssss - shift_right(signed(c0_s) + c1_eta, C_MULT_LEN);

            -- Assembling the MTC candidate
            mtc_valid <= pt_valid;
            pt <= resize(unsigned(pt_online), PTCALC2MTC_MDT_PT_LEN);

            mtc.data_valid <= mtc_valid;
            mtc.muid <= slc_s.muid;
            if SIDE = 0 then
                mtc.mdt_eta <= signed(eta);
            else 
                mtc.mdt_eta <= -signed(eta);
            end if;
            mtc.mdt_pt  <= pt;
            mtc.mdt_ptthresh <= pt_threshold(pt);
            mtc.mdt_charge <= slc.sl_charge; -- temporary
            -- Still to add other cases
            mtc.mdt_nsegments <= nsegments;
            mtc.mdt_quality <= quality;
            --reset
            if mtc_valid = '1' or i_rst = '1' then
                comboid_s <= (others => '0');
                dv_combo_s <= '0';
                slc_s <= nullify(slc_s);
                segment_I_s <= nullify(segment_I_s);
                segment_M_s <= nullify(segment_M_s);
                segment_O_s <= nullify(segment_O_s);
                segment_eta <= nullify(segment_eta);
                nsegments <= (others => '0');
                quality   <= (others => '0');
            end if;

        end if ;
    end process ; -- identifier

end Behavioral;

