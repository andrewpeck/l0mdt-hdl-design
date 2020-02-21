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


library IEEE, pt_lib, csf_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use pt_lib.pt_pkg.all;
use csf_lib.csf_pkg.all;

entity seg_coord_transform is
    port (
        clk         : in  std_logic;
        i_locseg    : in  t_locseg;
        i_seed      : in  t_seed;
        o_globseg   : out t_globalseg    
    );
end seg_coord_transform; -- seg_coord_transform

architecture Behavioral of seg_coord_transform is
    -- Store roi information
    signal roi_s : t_seed := null_seed;
    -- Store seg information
    signal seg_s : t_locseg := null_locseg;
    -- Extrapolated coordinate (z_ext = z_fit + z_ref - x_ref*m_fit)
    signal z_ext, z_ext_s, z_ext_ss, z_loc, mx : signed(bfit_width-1 downto 0) := (others => '0');
    -- Theta angle
    signal theta, theta_s, theta_ss : std_logic_vector(theta_glob_width-1 downto 0) := (others => '0');
    
    -- Valid signals
    signal dv0, dv1, dv2, dv3 : std_logic := '0';

    COMPONENT arctan_rom
    PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(14 DOWNTO 0)
    );
    END COMPONENT;

begin
  
    arctan : arctan_rom
  PORT MAP (
    clka => clk,
    addra => std_logic_vector(to_unsigned(to_integer(i_locseg.m) + 2**(theta_glob_width-1), mfit_width+1)),
    douta => theta
  );

    CoordProc : process( clk )
    begin
        if rising_edge(clk) then
            if i_seed.valid = '1' and i_locseg.valid = '1' then
                roi_s <= i_seed;
                seg_s <= i_locseg;
            end if;

            -- Clock 0
            dv0 <= i_locseg.valid;
            z_ext <= i_locseg.b + to_signed(z_ref, bfit_width);
            mx <= resize(shift_right(i_locseg.m*to_signed(x_ref, bfit_width),theta_glob_multi_width), bfit_width);
--            theta <= m_to_theta(to_integer(seg.m) + 2**(theta_loc_width-1));

            -- Clock 1
            dv1 <= dv0;
            z_loc <= z_ext - mx;
--            theta_s <= theta;

            -- Clock 2
            o_globseg.valid <= dv1;  
            o_globseg.z_glob <= roi_s.z + z_loc;
            o_globseg.r_glob <= roi_s.r;
            o_globseg.theta_glob <= resize(signed(theta), theta_glob_width);-- + to_signed(halfpi,theta_glob_width);
            o_globseg.phi_glob <= roi_s.phi;
            o_globseg.eta_glob <= roi_s.eta;
            o_globseg.chamber_id <= roi_s.chamber_id;

        end if ;
    end process ; -- CoordProc



end Behavioral;