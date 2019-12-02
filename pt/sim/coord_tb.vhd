----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2019 01:23:38 PM
-- Design Name: 
-- Module Name: sagitta_tb - Behavioral
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.csf_pkg.all;
use work.pt_pkg.all;


entity coord_tb is
--  Port ( );
end coord_tb;

architecture Behavioral of coord_tb is
    signal clk     : std_logic   := '0';
    signal seg     : t_locseg    := null_locseg;
    signal roi     : t_roi       := null_roi;
    signal globseg : t_globalseg := null_globalseg;

begin

    seg_coord_transform : entity work.seg_coord_transform
        port map(
            clk     => clk,
            seg     => seg,
            roi     => roi,
            globseg => globseg
            );

    CLK_process : process
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
        roi <= ('1', to_signed(11496, x_loc_width), to_signed(28927, z_glob_width), to_unsigned(315875, r_glob_width), to_signed(-3, phi_width), to_signed(204, eta_width));
        wait for clk_period;
        roi <= null_roi;
        seg <= ('1', to_signed(321, z_loc_width), to_signed(531, mfit_width));
        --seg1 <= ('1', to_signed(55024, z_glob_width), to_unsigned(455239, r_glob_width), (others => '0'), (others => '0'), (others => '0'));
        --seg2 <= ('1', to_signed(69986, z_glob_width), to_unsigned(615130, r_glob_width), (others => '0'), (others => '0'), (others => '0'));
        wait for clk_period;
        seg <= null_locseg;
        wait;

    end process;


end Behavioral;
