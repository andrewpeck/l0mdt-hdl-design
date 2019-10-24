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
            mx <= resize(shift_right(seg.m*to_signed(x_ref, roi_x_width),theta_loc_multi_width), z_loc_width);
            x_proj  <= resize(shift_right(roi.x_loc*seg.m,theta_loc_multi_width), z_loc_width);
            theta <= m_to_theta(to_integer(seg.m) + 2**(theta_loc_width-1));

            -- Clock 1
            dv1 <= dv0;
            z_loc <= z_ext - mx + x_proj;
            theta_s <= theta;

            -- Clock 2
            globseg.valid <= dv1;  
            globseg.z_glob <= roi_s.z_glob + z_loc;
            if roi_s.x_loc > 0 then
                globseg.r_glob <= roi_s.r_glob + unsigned(abs(roi_s.x_loc));
            else
                globseg.r_glob <= roi_s.r_glob - unsigned(abs(roi_s.x_loc));
            end if;
            globseg.theta_glob <= resize(theta_ss, theta_glob_width);-- + to_signed(halfpi,theta_glob_width);
            globseg.phi_glob <= seg_s.phi;
            globseg.eta_glob <= seg_s.eta;

    	end if ;
    end process ; -- CoordProc



end Behavioral;