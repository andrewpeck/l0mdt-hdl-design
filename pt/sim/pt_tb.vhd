----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2019 01:23:38 PM
-- Design Name: 
-- Module Name: pt_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.csf_pkg.all;
use work.pt_pkg.all;


entity pt_tb is
--  Port ( );
end pt_tb;

architecture Behavioral of pt_tb is
	signal clk : std_logic := '0';
    signal seg0, seg1, seg2 : t_locseg := null_locseg;
    signal roi0, roi1, roi2 : t_roi := null_roi;
    signal pt : unsigned(pt_width-1 downto 0) := (others => '0');
    signal pt_valid : std_logic := '0';
    
begin

	pt_calculator_top : entity work.pt_calculator_top
	Port map(
		clk  => clk,
		segment_BI    => seg0,
		segment_BM 	  => seg1,
		segment_BO    => seg2,
        roi_BI        => roi0,
        roi_BM        => roi1,
        roi_BO        => roi2,
        pt_online     => pt,
        pt_valid      => pt_valid
	);

	CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    --    Z[0] 38629 Z[1] 55024 Z[2] 69986
    --    R[0] 315875 R[1] 455239 R[2] 615130

    Pulse : process
    begin
    	wait for clk_period*5;
        roi0 <= ('1', to_signed(11496, x_loc_width), to_signed(28927, z_glob_width), to_unsigned(315875, r_glob_width), to_signed(-3,phi_width), to_signed(204, eta_width));
        roi1 <= ('1', to_signed(13738, x_loc_width), to_signed(45615, z_glob_width), to_unsigned(455239, r_glob_width), to_signed(-3,phi_width), to_signed(204, eta_width));
        roi2 <= ('1', to_signed(22525, x_loc_width), to_signed(60931, z_glob_width), to_unsigned(615130, r_glob_width), to_signed(-3,phi_width), to_signed(204, eta_width));
        wait for clk_period;
        roi0 <= null_roi;
        roi1 <= null_roi;
        roi2 <= null_roi;
        seg0 <= ('1', to_signed(321, z_loc_width), to_signed(531, mfit_width));
        seg1 <= ('1', to_signed(124, z_loc_width), to_signed(428, mfit_width));
        seg2 <= ('1', to_signed(-704, z_loc_width), to_signed(352, mfit_width));

        wait for clk_period;
        seg0 <= null_locseg;
        seg1 <= null_locseg;
        seg2 <= null_locseg;
        
    	wait;

    end process;


end Behavioral;
