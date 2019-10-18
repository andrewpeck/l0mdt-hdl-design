----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2019 10:45:43 AM
-- Design Name: 
-- Module Name: csf_fitter_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use work.csf_pkg.all;


entity csf_fitter_tb is
--  Port ( );
end csf_fitter_tb;

architecture Behavioral of csf_fitter_tb is
	signal clk : std_logic := '0';
	signal hit1, hit2 : t_outhit := null_outhit;
	signal mfit : signed(mfit_width-1 downto 0) := (others => '0');
	signal bfit : signed(bfit_width-1 downto 0) := (others => '0');
	signal fit_valid : std_logic := '0';
begin

	csf_fitter : entity work.csf_fitter
	Port map( 
		clk 	  => clk 	  ,
		hit1 	  => hit1 	  ,
		hit2 	  => hit2 	  ,
		mfit      => mfit      ,
		bfit      => bfit      ,
		fit_valid => fit_valid 
	);

	CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;


    Pulse : process
    begin
    	wait for clk_period*5;
    	hit1 <= ('1', to_signed(1344, y_width), to_signed(29, z_width));
    	hit2 <= ('1', to_signed(2020,y_width), to_signed(4703,z_width));
    	wait for clk_period;
    	hit1 <= ('1', to_signed(1397, y_width), to_signed(425, z_width));
    	hit2 <= ('1', to_signed(2108,y_width), to_signed(5172,z_width));
    	wait for clk_period;
    	hit1 <= ('1', to_signed(1468, y_width), to_signed(896, z_width));
    	hit2 <= ('1', to_signed(2175,y_width), to_signed(5643, z_width));
    	wait for clk_period;
    	hit1 <= null_outhit;
    	hit2 <= ('1', to_signed(2232,y_width), to_signed(6040,z_width));
    	wait for clk_period;
    	hit2 <= null_outhit;

    	wait;

    end process;

end Behavioral;
