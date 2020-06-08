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
-- use pt_lib.pt_params_pkg.all;
-- use ieee.std_logic_textio.all;
-- use shared_lib.custom_types_davide_pkg.all;

entity pt is
    generic(
        FLAVOUR : integer := 0; -- Barrel
        SECTOR  : integer := 3
    );
    Port (
        clk : in std_logic;
        i_segment_I  : in sf_seg_data_barrel_rvt;
        i_segment_M  : in sf_seg_data_barrel_rvt;
        i_segment_O  : in sf_seg_data_barrel_rvt;
        i_SLC        : in slc_pt_rvt;
        i_rst        : in std_logic;
        o_mtc        : out mtc_tf_rvt
    );
end pt;

architecture Behavioral of pt is
    -- Online segments in global coordinates
    signal segment_BI, segment_BM, segment_BO : sf_seg_data_barrel_rt;
    signal segment_BI_s, segment_BM_s, segment_BO_s : sf_seg_data_barrel_rt;
    signal segment_BI_v, segment_BM_v, segment_BO_v : sf_seg_data_barrel_rvt;


    signal segment_EI, segment_EM, segment_EO : sf_seg_data_endcap_rt;

    -- SLC candidate
    signal slc, slc_s : slc_pt_rt;
    -- Chamber combo id
    signal comboid_s, comboid_phi, comboid_phi_s, comboid_eta :
           unsigned(SLC_CHAMBER_LEN*3 + 4 -1 downto 0) := (others => '0');
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
    signal phi : signed(SLC_PT_PHIMOD_LEN-1 downto 0) := (others => '0');
    signal eta : signed(MTC_ETA_LEN-1 downto 0) := (others => '0');

    signal dv_dbeta_01, dv_dbeta_02, dv_dbeta_12 : std_logic := '0';
    signal dbeta_01, dbeta_02, dbeta_12 : unsigned(DBETA_LEN-1 downto 0)
                                        := (others => '0');

    -- Signal for pT calculation
    -- Sagitta/Dbeta-dependent part
    signal a0, a0_s : std_logic_vector(A0_LEN-1 downto 0) := (others =>'0');
    signal a1 : std_logic_vector(A1_LEN-1 downto 0) := (others =>'0');
    signal a1_invs : signed(A1_LEN+inv_s_len downto 0)
           := (others => '0');
    signal pt_s, pt_s0, pt_s1, pt_s2, pt_s3, pt_s4, pt_s5
           : signed(a1_len+inv_s_len downto 0) := (others => '0');
    signal bin_s : unsigned(3 downto 0) := (others => '0');

    -- Phi-dependent part
    signal b0, b0_s : std_logic_vector(b0_len-1 downto 0) := (others => '0');
    signal b1 : std_logic_vector(b1_len-1 downto 0) := (others => '0');
    signal b1_phi, pt_phi_01 : signed(b1_len+SLC_PT_PHIMOD_LEN-1 downto 0)
           := (others => '0');
    signal b2 : std_logic_vector(b2_len-1 downto 0) := (others => '0');
    signal b2_phi : signed(b2_len+SLC_PT_PHIMOD_LEN-1 downto 0) := (others => '0');
    signal b2_phi2 : signed(b2_len+SLC_PT_PHIMOD_LEN*2 -1  downto 0)
           := (others => '0');
    signal pt_p : signed(b2_len+SLC_PT_PHIMOD_LEN*2 -1  downto 0) := (others => '0');
    signal pt_sp, pt_sp_s, pt_sp_ss, pt_sp_sss
           : signed(a1_len+inv_s_len downto 0) := (others => '0');
    signal bin_sp : unsigned(3 downto 0) := (others => '0');


    -- Eta dependent part
    signal c0, c0_s : std_logic_vector(c0_len-1 downto 0) := (others => '0');
    signal c1 : std_logic_vector(c1_len-1 downto 0) := (others =>'0');
    signal c1_eta : signed(c1_len+MTC_ETA_LEN-1 downto 0) := (others => '0');

    -- Final pt signals

    signal pt_online  :  signed(a1_len+inv_s_len downto 0) := (others => '0');
    signal pt_valid   :  std_logic := '0';
    -- Mtc output parameters
    signal pt : unsigned(MTC_PT_LEN-1 downto 0) := (others => '0');
    signal mtc_valid : std_logic := '0';
    signal mtc : mtc_tf_rt;
    signal quality : std_logic_vector(MTC_QUALITY_LEN-1 downto 0) := (others => '0');

    signal index_a : std_logic_vector(PARAMS_DEPTH_LEN-1 downto 0) := (others => '0');
    signal index_b : std_logic_vector(PARAMS_DEPTH_LEN-1 downto 0) := (others => '0');
    signal index_c : std_logic_vector(PARAMS_DEPTH_LEN-1 downto 0) := (others => '0');

    --COMPONENT a0_ROM
    --PORT (
    --    clka : IN STD_LOGIC;
    --    ena : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(params_depth_len-1 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(a0_len-1 DOWNTO 0)
    --);
    --END COMPONENT;

    --COMPONENT a1_ROM
    --PORT (
    --    clka : IN STD_LOGIC;
    --    ena : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(params_depth_len-1 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(a1_len-1 DOWNTO 0)
    --);
    --END COMPONENT;

    --COMPONENT b0_ROM
    --PORT (
    --    clka : IN STD_LOGIC;
    --    ena : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(params_depth_len-1 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(b0_len-1 DOWNTO 0)
    --);
    --END COMPONENT;

    --COMPONENT b1_ROM
    --PORT (
    --    clka : IN STD_LOGIC;
    --    ena : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(params_depth_len-1 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(b1_len-1 DOWNTO 0)
    --);
    --END COMPONENT;

    --COMPONENT b2_ROM
    --PORT (
    --    clka : IN STD_LOGIC;
    --    ena : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(params_depth_len-1 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(b2_len-1 DOWNTO 0)
    --);
    --END COMPONENT;

    --COMPONENT c0_ROM
    --PORT (
    --    clka : IN STD_LOGIC;
    --    ena : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(params_depth_len-1 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(c0_len-1 DOWNTO 0)
    --);
    --END COMPONENT;

    --COMPONENT c1_ROM
    --PORT (
    --    clka : IN STD_LOGIC;
    --    ena : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(params_depth_len-1 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(c1_len-1 DOWNTO 0)
    --);
    --END COMPONENT;

    ----------------------------------------------------------------------------
    -- COMPONENTS --------------------------------------------------------------


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

    EtaCalculator : entity pt_lib.eta_calculator
    port map (
        clk            => clk,
        i_seg          => segment_BI_v,
        o_eta          => eta,
        o_dv_eta       => dv_eta
    );

    SagittaCalculator : entity pt_lib.sagitta_calculator
    port map(
        clk => clk,
        i_seg0 => segment_BI_v,
        i_seg1 => segment_BM_v,
        i_seg2 => segment_BO_v,
        o_inv_s => inv_s,
        o_dv_s => dv_s
    );

    getA0 : rom
    GENERIC MAP(
        MXADRB => PARAMS_DEPTH_LEN,
        MXDATB => A0_LEN,
        ROM_FILE => "../data/a0.mem"
    )
    PORT MAP (
        clka => clk,
        ena => dv_combo_s,
        addra => index_a,
        douta => a0
    );

    getA1 : rom
    GENERIC MAP(
        MXADRB => PARAMS_DEPTH_LEN,
        MXDATB => A1_LEN,
        ROM_FILE => "../data/a1.mem"
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
        ROM_FILE => "../data/b0.mem"
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
        ROM_FILE => "../data/b1.mem"
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
        ROM_FILE => "../data/b2.mem"
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
        ROM_FILE => "../data/c0.mem"
    )
    PORT MAP (
        clka => clk,
        ena => dv7,
        addra => index_c,
        douta => c0
    );

    getC1 : rom
    GENERIC MAP(
        MXADRB => PARAMS_DEPTH_LEN,
        MXDATB => C1_LEN,
        ROM_FILE => "../data/c1.mem"
    )
    PORT MAP (
        clka => clk,
        ena => dv7,
        addra => index_c,
        douta => c1
    );

    SEG_GEN  : if FLAVOUR = 0 generate
        segment_BI <= structify(i_segment_I);
        segment_BM <= structify(i_segment_M);
        segment_BO <= structify(i_segment_O);
    else generate
        segment_EI <= structify(i_segment_I);
        segment_EM <= structify(i_segment_M);
        segment_EO <= structify(i_segment_O);
    end generate SEG_GEN;

    index_a <= comboid_to_index_ram(comboid_s);
    index_b <= comboid_to_index_ram(comboid_phi);
    index_c <= comboid_to_index_ram(comboid_eta);

    slc <= structify(i_SLC);
    o_mtc <= vectorify(mtc);


    pt_top_proc : process( clk )
    begin
        if rising_edge(clk) then

            if  FLAVOUR = 0 and (
                segment_BI.data_valid = '1' or
                segment_BM.data_valid = '1' or
                segment_BO.data_valid = '1' ) then
                segment_BI_s <= segment_BI;
                segment_BM_s <= segment_BM;
                segment_BO_s <= segment_BO;
                comboid_s  <= "0000" &
                              unsigned(segment_BO.chamber_id) &
                              unsigned(segment_BM.chamber_id) &
                              unsigned(segment_BI.chamber_id);
                nsegments <= to_unsigned(stdlogic_integer(segment_BI.data_valid)
                    + stdlogic_integer(segment_BM.data_valid)
                    + stdlogic_integer(segment_BO.data_valid),
                    MTC_NSEG_LEN);
                quality <= segment_BO.data_valid &
                           segment_BM.data_valid &
                           segment_BI.data_valid;
                dv_combo_s     <= '1';
            -- TODO: ADD ENDCAP
            end if;

            -- save the slc
            if slc.data_valid = '1' then
                slc_s  <= SLC;
            end if;

            dv_combo_s_s <= dv_combo_s;
            -- <a> parameters are now valid
            dv_a <= dv_combo_s_s;
            dv0 <= dv_s and dv_a;
            a1_invs <= signed(a1)*signed('0' & inv_s);

            a0_s <= a0;

            dv1  <= dv0;
            pt_s <= signed(a0_s) + a1_invs;

            dv2 <= dv1;
            comboid_phi <= pt_bin(pt_s) &
                           unsigned(segment_BO_s.chamber_id) &
                           unsigned(segment_BM_s.chamber_id) &
                           unsigned(segment_BI_s.chamber_id);
            pt_s0 <= pt_s;

            dv3 <= dv2;
            pt_s1 <= pt_s0;

            -- <b> parameters now valid
            dv4 <= dv3;
            b1_phi <= signed(b1)*slc_s.phimod;
            b2_phi <= signed(b2)*slc_s.phimod;
            pt_s2  <= pt_s1 - signed(b0);


            dv5 <= dv4;
            pt_s3 <= pt_s2 - b1_phi;
            b2_phi2 <= b2_phi*slc_s.phimod;

            dv6 <= dv5;
            pt_sp <= pt_s3 - b2_phi2;

            dv7 <= dv6;
            comboid_eta <= pt_bin(pt_sp) &
                           unsigned(segment_BO_s.chamber_id) &
                           unsigned(segment_BM_s.chamber_id) &
                           unsigned(segment_BI_s.chamber_id);
            pt_sp_s <= pt_sp;

            dv8 <= dv7;
            pt_sp_ss <= pt_sp_s;

            -- <c> parameters now valid
            dv9 <= dv8;
            pt_sp_sss <= pt_sp_ss - signed(c0);
            c1_eta <= signed(c1)*eta;

            pt_valid <= dv9;
            pt_online <= pt_sp_sss - c1_eta;

            -- Assembling the MTC candidate
            mtc_valid <= pt_valid;
            pt <= resize(unsigned(pt_online), MTC_PT_LEN);

            mtc.data_valid <= mtc_valid;
            mtc.muid <= slc_s.muid;
            mtc.eta <= eta;
            mtc.pt  <= pt;
            mtc.pt_thr <= pt_threshold(pt);
            mtc.charge <= slc.charge; -- temporary
            -- Still to add other cases
            mtc.nseg <= nsegments;
            mtc.quality <= quality;
            --reset
            if pt_valid = '1' or i_rst = '1' then
                comboid_s <= (others => '0');
                dv_combo_s <= '0';
                slc_s <= nullify(slc_s);
                segment_BI_s <= nullify(segment_BI_s);
                segment_BM_s <= nullify(segment_BM_s);
                segment_BO_s <= nullify(segment_BO_s);
            end if;

        end if ;
    end process ; -- identifier

end Behavioral;

