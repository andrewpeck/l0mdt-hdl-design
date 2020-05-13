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


library IEEE, shared_lib, csf_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use shared_lib.custom_types_davide_pkg.all;
use csf_lib.csf_pkg.all;

entity seg_coord_transform is
    generic (
        -- Project flavour (0: Barrel, 1: Endcap)
        FLAVOUR     : integer := 0
    );
    port (
        clk         : in  std_logic;
        i_locseg    : in  t_locseg;
        i_seed      : in  ucm_csf_seed_rt;
        o_globseg   : out sf_seg_data_endcap_rvt    
    );
end seg_coord_transform; -- seg_coord_transform

architecture Behavioral of seg_coord_transform is
    -- Store roi information
    signal seed : ucm_csf_seed_rt;
    -- Store seg information
    signal locseg : t_locseg := null_locseg;
    -- Extrapolated coordinate (z_ext = z_fit + z_ref - x_ref*m_fit)
    signal z_ext, z_ext_s, z_ext_ss, z_loc, mx : signed(bfit_width-1 downto 0) := (others => '0');
    -- Theta angle
    signal theta, theta_s, theta_ss : std_logic_vector(SF_SEG_ANG_WIDTH-1 downto 0) := (others => '0');
    -- Chamber_id
    signal chamber_id : std_logic_vector(UCM_CHAMBER_ID_LEN-1 downto 0) := (others => '0');
    -- Chamber pos
    signal chamber_pos : std_logic_vector(SF_SEG_POS_WIDTH-1 downto 0) := (others => '0');
    -- Global seg barrel
    signal globseg_brl : sf_seg_data_barrel_rt;
    -- Global seg endcap
    signal globseg_edc : sf_seg_data_endcap_rt;

    -- Valid signals
    signal dv0, dv1, dv2, dv3 : std_logic := '0';

    COMPONENT arctan_rom
    PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(14 DOWNTO 0)
    );
    END COMPONENT;
    
    COMPONENT Chamber_pos_ROM_1
    PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(18 DOWNTO 0)
    );
    END COMPONENT;

begin
  
    arctan : arctan_rom
    PORT MAP (
        clka => clk,
        addra => std_logic_vector(to_unsigned(to_integer(i_locseg.m) + 2**(SF_SEG_ANG_WIDTH-1), mfit_width+1)),
        douta => theta
    );
    
    chamb_pos : Chamber_pos_ROM_1
    PORT MAP (
        clka => clk,
        addra => chamber_id,
        douta => chamber_pos
    );

    CoordProc : process( clk )
    begin
        if rising_edge(clk) then
            if i_seed.data_valid = '1' and i_locseg.valid = '1' then
                seed <= i_seed;
                locseg <= i_locseg;
                chamber_id <= i_seed.chamber_id;
            end if;

            -- Clock 0
            dv0 <= i_locseg.valid;
            z_ext <= i_locseg.b + to_signed(z_ref, bfit_width);
            mx <= resize(shift_right(i_locseg.m*to_signed(x_ref, bfit_width),SF_SEG_ANG_MULTI_WIDTH), bfit_width);

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
                globseg_brl.angle <= resize(signed(theta), SF_SEG_ANG_WIDTH);-- + to_signed(halfpi,SF_SEG_ANG_WIDTH);
                globseg_brl.muid <= seed.muid;
                globseg_brl.quality <= '1';
                globseg_brl.chamber_id <= seed.chamber_id;

            elsif FLAVOUR = 1 then -- Endcap
                globseg_edc.data_valid <= dv1;
                globseg_edc.pos <= unsigned(chamber_pos) + unsigned(z_loc);
                globseg_edc.angle <= resize(signed(theta), SF_SEG_ANG_WIDTH);-- + to_signed(halfpi,SF_SEG_ANG_WIDTH);
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
