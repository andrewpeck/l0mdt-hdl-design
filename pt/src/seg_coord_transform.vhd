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
	clk        : in std_logic;
    seg        : in t_locseg;
    roi        : in t_roi;
    globseg    : out t_globalseg    
  );
end seg_coord_transform; -- seg_coord_transform

architecture Behavioral of seg_coord_transform is
    -- Store roi information
    signal roi_s : t_roi := null_roi;
    -- Store seg information
    signal seg_s : t_locseg := null_locseg;
    -- Extrapolated coordinate (z_ext = z_fit + z_ref - x_ref*m_fit)
    signal z_ext, z_ext_s, z_ext_ss, z_loc, mx : signed(z_loc_width-1 downto 0) := (others => '0');
    -- Theta angle
    signal theta, theta_s, theta_ss : signed(theta_loc_width-1 downto 0) := (others => '0');
    signal invtan : signed(inv_tantheta_width-1 downto 0) := (others => '0');
    -- X_roi proj on Z axis
    signal x_proj : signed(z_loc_width-1 downto 0) := (others => '0');
    -- Valid signals
    signal dv0, dv1, dv2, dv3 : std_logic := '0';

begin
  


    CoordProc : process( clk )
    begin
    	if rising_edge(clk) then
            if roi.valid = '1' and seg.valid = '1' then
                roi_s <= roi;
                seg_s <= seg;
            end if;

            -- Clock 0
            dv0 <= seg.valid;
            z_ext <= seg.b + to_signed(z_ref, z_loc_width);
            mx <= - resize(shift_right(seg.m*to_signed(x_ref,theta_loc_width),theta_loc_multi_width), z_loc_width);
            theta <= m_to_theta(to_integer(seg.m) + 2**(theta_loc_width-1));

            -- Clock 1
            dv1 <= dv0;
            z_ext_s <= z_ext + mx;
            theta_s <= theta;
            invtan <= inv_tantheta(to_integer(theta)+2**(theta_loc_width-1) );

            -- Clock 2
            dv2 <= dv1;
            z_ext_ss <= z_ext_s;
            x_proj  <= resize(shift_right(roi_s.x_loc*invtan,inv_tantheta_width), z_loc_width);
            theta_ss <= theta_s;

            -- Clock 3
            dv3 <= dv2;
            z_loc <= z_ext_ss + x_proj;

            -- Clock 4
            globseg.valid <= dv3;  
            globseg.z_glob <= roi_s.z_glob + z_loc;
            globseg.r_glob <= roi_s.r_glob;
            globseg.theta_glob <= resize(theta_ss, theta_glob_width) + to_signed(halfpi,theta_glob_width);
            globseg.phi_glob <= seg_s.phi;
            globseg.eta_glob <= seg_s.eta;

    	end if ;
    end process ; -- CoordProc



end Behavioral;