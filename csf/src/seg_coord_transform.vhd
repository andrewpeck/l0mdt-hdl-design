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

-- library IEEE, shared_lib, csf_lib;
-- use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;
-- use ieee.math_real.all;
-- use shared_lib.custom_types_davide_pkg.all;
-- use csf_lib.csf_pkg.all;
-- use csf_lib.custom_types_csf_pkg.all;

entity seg_coord_transform is
  generic (
    -- Project flavour (0: Barrel, 1: Endcap)
    FLAVOUR     : integer := 0
  );
  port (
    clk         : in  std_logic;
    i_locseg    : in  csf_locseg_rvt;
    i_seed      : in  csf_seed_rvt;
    o_globseg   : out std_logic_vector(SF_SEG_DATA_LEN-1 downto 0)
  );
end seg_coord_transform; -- seg_coord_transform

architecture Behavioral of seg_coord_transform is
    -- Store roi information
    signal seed, seed_i : csf_seed_rt;
    -- Store seg information
    signal locseg, locseg_i : csf_locseg_rt;
    -- Extrapolated coordinate (z_ext = z_fit + z_ref - x_ref*m_fit)
    signal z_ext, z_ext_s, z_ext_ss, z_loc, mx : signed(CSF_SEG_B_LEN-1 downto 0) := (others => '0');
    -- Theta angle
    signal theta, theta_s, theta_ss : std_logic_vector(SF_SEG_ANG_LEN-1 downto 0) := (others => '0');
    -- chamber_id
    signal chamber_id : std_logic_vector(SLC_CHAMBER_LEN-1 downto 0) := (others => '0');
    -- Chamber pos
    signal chamber_pos : std_logic_vector(SF_SEG_POS_LEN-1 downto 0) := (others => '0');
    -- Global seg barrel
    signal globseg_brl : sf_seg_data_barrel_rt;
    -- Global seg endcap
    signal globseg_edc : sf_seg_data_endcap_rt;

    -- Valid signals
    signal dv0, dv1, dv2, dv3 : std_logic := '0';

    --COMPONENT arctan_rom
    --PORT (
    --    clka : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(14 DOWNTO 0)
    --);
    --END COMPONENT;

    COMPONENT Chamber_pos_ROM_1
    PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(18 DOWNTO 0)
    );
    END COMPONENT;

    -------------------------------------------------------------------------------- COMPONENTS --------
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

    seed_i <= structify(i_seed);
    locseg_i <= structify(i_locseg);

    ARCTAN : rom
    GENERIC MAP(
        MXADRB => CSF_SEG_M_LEN+1,
        MXDATB => SF_SEG_ANG_LEN,
        ROM_FILE => "../data/m_to_theta.mem"
    )
    PORT MAP(
        clka => clk,
        ena  => '1',
        addra => std_logic_vector(to_unsigned(to_integer(locseg_i.m) + 2**(SF_SEG_ANG_LEN-1), CSF_SEG_M_LEN+1)),
        douta => theta
    );

    --arctan : arctan_rom
    --PORT MAP (
    --    clka => clk,
    --    addra => std_logic_vector(to_unsigned(to_integer(i_locseg.m) + 2**(SF_SEG_ANG_LEN-1), CSF_SEG_M_LEN+1)),
    --    douta => theta
    --);

    chamb_pos : Chamber_pos_ROM_1
    PORT MAP (
        clka => clk,
        addra => chamber_id,
        douta => chamber_pos
    );

    CoordProc : process( clk )
    begin
        if rising_edge(clk) then
            if seed_i.data_valid = '1' and locseg_i.valid = '1' then
                seed <= seed_i;
                locseg <= locseg_i;
                chamber_id <= std_logic_vector(seed_i.chamber_id);
            end if;

            -- Clock 0
            dv0 <= locseg_i.valid;
            z_ext <= locseg_i.b + to_signed(CSF_Y_OFFSET, CSF_SEG_B_LEN);
            mx <= resize(shift_right(locseg_i.m*to_signed(CSF_X_OFFSET, CSF_SEG_B_LEN),SF_SEG_ANG_MULTI_LEN), CSF_SEG_B_LEN);

            -- Clock 1
            dv1 <= dv0;
            z_loc <= z_ext - mx;

            -- Clock 2

            if FLAVOUR = 0 then -- Barrel
                globseg_brl.data_valid <= dv1;
                globseg_brl.pos <= signed(chamber_pos) + z_loc;
                if signed(chamber_pos) < 0 then
                    globseg_brl.pos <= signed(chamber_pos) - z_loc;
                end if;
                globseg_brl.angle <= resize(signed(theta), SF_SEG_ANG_LEN);-- + to_signed(halfpi,SF_SEG_ANG_LEN);
                globseg_brl.muid <= seed.muid;
                globseg_brl.quality <= '1';
                globseg_brl.chamber_id <= seed.chamber_id;

            elsif FLAVOUR = 1 then -- Endcap
                globseg_edc.data_valid <= dv1;
                globseg_edc.pos <= unsigned(chamber_pos) + unsigned(z_loc);
                globseg_edc.angle <= resize(signed(theta), SF_SEG_ANG_LEN);-- + to_signed(halfpi,SF_SEG_ANG_LEN);
                globseg_edc.muid <= seed.muid;
                globseg_edc.chamber_id <= seed.chamber_id;
                globseg_edc.quality <= '1';
            end if;

            -- Clock 3
            if FLAVOUR = 0 then -- Barrel
                o_globseg <= vectorify(globseg_brl);
            elsif FLAVOUR = 1 then -- Endcap
                o_globseg <= vectorify(globseg_edc);
            else
                o_globseg <= (others => '0');
            end if;

        end if ;
    end process ; -- CoordProc



end Behavioral;
