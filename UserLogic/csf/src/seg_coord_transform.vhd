----------------------------------------------------------------------------------
-- Company: Max Planck Institut fuer Physik, Munich
-- Engineer: Davide Cieri (davide.cieri@cern.ch)
--
-- Create Date: 30/04/2019
-- Design Name: L0MDT Trigger
-- Module Name: SegCoordinateTransform Calculator - Behavioral
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
---------------------------------------------------------------------------------
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

ENTITY seg_coord_transform IS
    GENERIC (
        IS_ENDCAP : INTEGER := 0
    );
    PORT (
        clk : IN STD_LOGIC;
        i_locseg : IN csf_locseg_rvt;
        i_seed : IN heg2sfslc_rvt;
        o_globseg : OUT sf2ptcalc_rvt
    );
END seg_coord_transform; -- seg_coord_transform

ARCHITECTURE Behavioral OF seg_coord_transform IS

    -- Pos HE Window shift
    CONSTANT HE_POS_SHIFT : INTEGER := INTEGER(log2(SF2PTCALC_SEGPOS_MULT));
    -- Local Pos shift
    CONSTANT LOC_POS_SHIFT : INTEGER := INTEGER(log2(CSF_SEG_B_MULT/SF2PTCALC_SEGPOS_MULT));
    -- Reference position - Corner Position
    CONSTANT DeltaR_BIL : INTEGER := INTEGER((BIL_SEC3_RHO-BIL_SEC3_RHO_CORNER)*SF2PTCALC_SEGPOS_MULT); 
    -- Reference position - Corner Position
    CONSTANT DeltaR_BML : INTEGER := INTEGER((BML_SEC3_RHO-BML_SEC3_RHO_CORNER)*SF2PTCALC_SEGPOS_MULT); 
    -- Reference position - Corner Position
    CONSTANT DeltaR_BOL : INTEGER := INTEGER((BOL_SEC3_RHO-BOL_SEC3_RHO_CORNER)*SF2PTCALC_SEGPOS_MULT); 

    -- SLC vector position in global segment format
    SIGNAL vec_pos : unsigned(SF2PTCALC_SEGPOS_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    -- Absolute local segment pos in global segment format
    SIGNAL abs_loc_pos : unsigned(SF2PTCALC_SEGPOS_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    -- local segment position sign 
    SIGNAL loc_pos_sign : STD_LOGIC := '0';

    CONSTANT CSF_SEG_M_MULT_LEN : INTEGER := INTEGER(log2(CSF_SEG_M_MULT));
    CONSTANT DELTA_R_LEN : INTEGER := 12;

    SIGNAL delta_r_mbar : unsigned(SF2PTCALC_SEGPOS_LEN-1 DOWNTO 0);

    -- Store roi information
    SIGNAL seed, seed_i : heg2sfslc_rt;
    -- Store seg information
    SIGNAL locseg, locseg_i : csf_locseg_rt;
    -- Extrapolated coordinate (z_ext = z_fit + z_ref - x_ref*m_fit)
    SIGNAL z_ext, z_ext_s, z_ext_ss, z_loc, mx : signed(CSF_SEG_B_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    -- Theta angle
    SIGNAL theta, theta_s, theta_ss : STD_LOGIC_VECTOR(SF_SEG_ANG_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    -- chamber_ieta
    SIGNAL chamber_ieta : STD_LOGIC_VECTOR(SLC_CHAMBER_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    -- Chamber pos
    SIGNAL chamber_pos : STD_LOGIC_VECTOR(SF2PTCALC_SEGPOS_LEN - 1 DOWNTO 0) := (OTHERS => '0');
    -- Global seg
    SIGNAL globseg : sf2ptcalc_rt;

    SIGNAL addr : STD_LOGIC_VECTOR(CSF_SEG_M_LEN DOWNTO 0) := (OTHERS => '0');

    -- Valid signals
    SIGNAL dv0, dv1, dv2, dv3 : STD_LOGIC := '0';

    -------------------------------------------------------------------------------- COMPONENTS --------
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

    seed_i <= structify(i_seed);
    locseg_i <= structify(i_locseg);
    o_globseg <= vectorify(globseg);

    ARCTAN : rom
    GENERIC MAP(
        MXADRB => CSF_SEG_M_LEN + 1,
        MXDATB => SF2PTCALC_SEGANGLE_LEN,
        ROM_FILE => "m_to_theta.mem",
        ROM_STYLE => "distributed"
    )
    PORT MAP(
        clka => clk,
        ena => '1',
        --addra => std_logic_vector(to_unsigned(to_integer(locseg_i.m) + 2**(CSF_SEG_M_LEN-1), CSF_SEG_M_LEN+1)),
        addra => addr,
        douta => theta
    );

    addr <= STD_LOGIC_VECTOR(to_unsigned(to_integer(locseg_i.m) + 2 ** (CSF_SEG_M_LEN - 1), CSF_SEG_M_LEN + 1));

    CoordProc : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            -- Clock 0
            dv0 <= locseg_i.valid;
            IF seed_i.data_valid = '1' AND locseg_i.valid = '1' THEN
                seed <= seed_i;
                locseg <= locseg_i;
                chamber_ieta <= STD_LOGIC_VECTOR(seed_i.mdtid.chamber_ieta);
                vec_pos <= shift_left(resize(seed_i.vec_pos, SF2PTCALC_SEGPOS_LEN), HE_POS_SHIFT) ;
                if seed_i.mdtid.chamber_id = 0 then
                    delta_r_mbar <= resize(shift_right(to_unsigned(DeltaR_BIL,DELTA_R_LEN)*unsigned(abs(locseg_i.m)),CSF_SEG_M_MULT_LEN),SF2PTCALC_SEGPOS_LEN);
                elsif seed_i.mdtid.chamber_id = 1 then
                    delta_r_mbar <= resize(shift_right(to_unsigned(DeltaR_BML,DELTA_R_LEN)*unsigned(abs(locseg_i.m)),CSF_SEG_M_MULT_LEN),SF2PTCALC_SEGPOS_LEN);
                elsif seed_i.mdtid.chamber_id = 2 then
                    delta_r_mbar <= resize(shift_right(to_unsigned(DeltaR_BOL,DELTA_R_LEN)*unsigned(abs(locseg_i.m)),CSF_SEG_M_MULT_LEN),SF2PTCALC_SEGPOS_LEN);
                end if;

                --he_window_pos <= shift_right(resize(seed_i.hewindow_pos, SF2PTCALC_SEGPOS_LEN), HE_POS_SHIFT);
            END IF;

            -- Clock 1
            dv1 <= dv0;
            abs_loc_pos <= resize(shift_right(unsigned(ABS(locseg.b)), LOC_POS_SHIFT), SF2PTCALC_SEGPOS_LEN);
            loc_pos_sign <= locseg.b(CSF_SEG_B_LEN - 1);

            -- Clock 2
            globseg.data_valid <= dv1;
            IF loc_pos_sign = '1' THEN
                globseg.segpos <= vec_pos + abs_loc_pos - delta_r_mbar;
            ELSE
                globseg.segpos <= vec_pos + abs_loc_pos + delta_r_mbar;
            END IF;

            globseg.segangle <= resize(unsigned(theta), SF_SEG_ANG_LEN);-- + to_signed(halfpi,SF_SEG_ANG_LEN);
            globseg.muid <= seed.muid;
            if locseg.nhits > 1 then
                globseg.segquality <= '1';
            else
                globseg.segquality <= '0';
            end if;
            globseg.mdtid <= seed.mdtid;

        END IF;
    END PROCESS; -- CoordProc

END Behavioral;