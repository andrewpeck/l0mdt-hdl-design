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

entity seg_coord_transform is
  generic (
    -- Project flavour (0: Barrel, 1: Endcap)
    FLAVOUR     : integer := 0
  );
  port (
    clk         : in  std_logic;
    i_locseg    : in  csf_locseg_rvt;
    i_seed      : in  heg2sfslc_rvt;
    o_globseg   : out sf2ptcalc_rvt
  );
end seg_coord_transform; -- seg_coord_transform

architecture Behavioral of seg_coord_transform is

    -- Pos HE Window shift
    constant HE_POS_SHIFT : integer := integer(log2(SF2PTCALC_SEGPOS_MULT/HEG2SFSLC_HEWINDOW_POS_MULT ));
    -- Local Pos shift
    constant LOC_POS_SHIFT : integer := integer(log2(CSF_SEG_B_MULT/SF2PTCALC_SEGPOS_MULT));
    -- HE window pos in global segment format
    signal he_window_pos : unsigned(SF2PTCALC_SEGPOS_LEN-1 downto 0) := (others => '0');
    -- Absolute local segment pos in global segment format
    signal abs_loc_pos : unsigned(SF2PTCALC_SEGPOS_LEN-1 downto 0) := (others => '0');
    -- local segment position sign 
    signal loc_pos_sign : std_logic := '0';

    -- Store roi information
    signal seed, seed_i : heg2sfslc_rt;
    -- Store seg information
    signal locseg, locseg_i : csf_locseg_rt;
    -- Extrapolated coordinate (z_ext = z_fit + z_ref - x_ref*m_fit)
    signal z_ext, z_ext_s, z_ext_ss, z_loc, mx : signed(CSF_SEG_B_LEN-1 downto 0) := (others => '0');
    -- Theta angle
    signal theta, theta_s, theta_ss : std_logic_vector(SF_SEG_ANG_LEN-1 downto 0) := (others => '0');
    -- chamber_ieta
    signal chamber_ieta : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0) := (others => '0');
    -- Chamber pos
    signal chamber_pos : std_logic_vector(SF2PTCALC_SEGPOS_LEN-1 downto 0) := (others => '0');
    -- Global seg
    signal globseg : sf2ptcalc_rt;

    signal addr : std_logic_vector(CSF_SEG_M_LEN downto 0) := (others => '0');

    -- Valid signals
    signal dv0, dv1, dv2, dv3 : std_logic := '0';

    -------------------------------------------------------------------------------- COMPONENTS --------
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

    seed_i <= structify(i_seed);
    locseg_i <= structify(i_locseg);
    o_globseg <= vectorify(globseg);

    ARCTAN : rom
    GENERIC MAP(
        MXADRB => CSF_SEG_M_LEN+1,
        MXDATB => SF2PTCALC_SEGANGLE_LEN,
        ROM_FILE => "m_to_theta.mem",
        ROM_STYLE => "distributed"
    )
    PORT MAP(
        clka => clk,
        ena  => '1',
        --addra => std_logic_vector(to_unsigned(to_integer(locseg_i.m) + 2**(CSF_SEG_M_LEN-1), CSF_SEG_M_LEN+1)),
        addra => addr,
        douta => theta
    );

    addr <= std_logic_vector(to_unsigned(to_integer(locseg_i.m) + 2**(CSF_SEG_M_LEN-1), CSF_SEG_M_LEN+1)); 

    CoordProc : process( clk )
    begin
        if rising_edge(clk) then
            -- Clock 0
            dv0 <= locseg_i.valid;
            if seed_i.data_valid = '1' and locseg_i.valid = '1' then
                seed <= seed_i;
                locseg <= locseg_i;
                chamber_ieta <= std_logic_vector(seed_i.mdtid.chamber_ieta);
                he_window_pos <= shift_left(resize(seed_i.hewindow_pos, SF2PTCALC_SEGPOS_LEN), HE_POS_SHIFT);
            end if;

            -- Clock 1
            dv1 <= dv0;
            abs_loc_pos <= resize(shift_right(unsigned(abs(locseg.b)), LOC_POS_SHIFT), SF2PTCALC_SEGPOS_LEN);
            loc_pos_sign <= locseg.b(CSF_SEG_B_LEN-1);

            -- Clock 2
            globseg.data_valid <= dv1;
            if loc_pos_sign = '1' then
                globseg.segpos <= he_window_pos - abs_loc_pos;
            else
                globseg.segpos <= he_window_pos + abs_loc_pos;
            end if;

            globseg.segangle <= resize(unsigned(theta), SF_SEG_ANG_LEN);-- + to_signed(halfpi,SF_SEG_ANG_LEN);
            globseg.muid <= seed.muid;
            globseg.segquality <= '1';
            globseg.mdtid <= seed.mdtid;

        end if ;
    end process ; -- CoordProc



end Behavioral;
