----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2019 01:23:38 PM
-- Design Name: 
-- Module Name: csf_histogram_tb - Behavioral
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


entity csf_histogram_tb is
--  Port ( );
end csf_histogram_tb;

architecture Behavioral of csf_histogram_tb is
    signal clk : std_logic := '0';
    signal inputHit : t_inputhit := null_inputhit;
    signal header_valid : std_logic := '0';
    signal mbar      : unsigned(mbar_width-1 downto 0) := (others => '0');
    signal eof      :  std_logic := '0';
    signal outputHit1 : t_outhit := null_outhit;
    signal outputHit2 : t_outhit := null_outhit;

begin

    csf_histogram : entity work.csf_histogram
    Port map(
        clk  => clk,
        inputHit  => inputHit,
        header_valid  => header_valid,
        mbar      => mbar,
        eof       => eof,
        outputHit1  => outputHit1,
        outputHit2  => outputHit2
    );

    CLK_process :process
    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

--    layerId 0 relativeTubeId 0 driftRadius 12.21921359(3340) bplus 35 bminus 28 y 0(0) z 0(0)
--layerId 0 relativeTubeId 3 driftRadius 11.60093601(3171) bplus 59 bminus 52 y 90.09130859(3070) z 0(0) 
--layerId 0 relativeTubeId 4 driftRadius 1.840198932(503) bplus 0 bminus 63 y 120.1413086(4094) z 0(0)
--layerId 1 relativeTubeId -3 driftRadius 11.06314428(3024) bplus 13 bminus 7 y -75.0956543(-2559) z 26.00029297(886) 
--layerId 1 relativeTubeId 0 driftRadius 8.033950011(2196) bplus 37 bminus 32 y 15.025(512) z 26.00029297(886) 
--layerId 1 relativeTubeId 1 driftRadius 14.08502165(3850) bplus 46 bminus 39 y 45.0456543(1535) z 26.00029297(886) 
--layerId 1 relativeTubeId 2 driftRadius 7.185190265(1964) bplus 52 bminus 49 y 75.0956543(2559) z 26.00029297(886) 
--layerId 2 relativeTubeId 3 driftRadius 4.068193266(1112) bplus 54 bminus 52 y 90.09130859(3070) z 52.02993164(1773) 
--layerId 4 relativeTubeId 0 driftRadius 13.92770842(3807) bplus 35 bminus 28 y 0(0) z 0(0)
--layerId 5 relativeTubeId 0 driftRadius 3.753566809(1026) bplus 35 bminus 33 y 15.025(512) z 26.00029297(886) 
--layerId 6 relativeTubeId 1 driftRadius 7.792492497(2130) bplus 39 bminus 35 y 30.0206543(1023) z 52.02993164(1773) 
--layerId 7 relativeTubeId 0 driftRadius 11.24606664(3074) bplus 35 bminus 29 y 15.025(512) z 78.03022461(2659)  

--type t_inputhit is  
--    record 
--        valid : std_logic;
--        layerId : unsigned(layerId_width-1 downto 0);
--        tubeId  : signed(tubeId_width-1 downto 0);
--        multilayer : std_logic;
--        r       : unsigned(r_width-1 downto 0);
--    end record;


    Pulse : process
    begin
        wait for clk_period*5;
        header_valid <= '1';
        mbar <= to_unsigned(78,mbar_width);
        wait for clk_period;
        header_valid <= '0';
        mbar <= (others => '0');
        wait for clk_period*5;
        inputHit <= ('1', to_unsigned(0,layerId_width), to_signed(0,tubeId_width), '0', to_unsigned(518, r_width));
        wait for clk_period;
        inputHit <= ('1', to_unsigned(0,layerId_width), to_signed(3,tubeId_width), '0', to_unsigned(492, r_width));
        wait for clk_period;
        inputHit <= ('1', to_unsigned(0,layerId_width), to_signed(4,tubeId_width), '0', to_unsigned(78, r_width));
        wait for clk_period;
        inputHit <= ('1', to_unsigned(1,layerId_width), to_signed(-3,tubeId_width), '0', to_unsigned(469, r_width));
        wait for clk_period;
        inputHit <= ('1', to_unsigned(1,layerId_width), to_signed(0,tubeId_width), '0', to_unsigned(341, r_width));
        wait for clk_period;
        inputHit <= ('1', to_unsigned(1,layerId_width), to_signed(1,tubeId_width), '0', to_unsigned(598, r_width));
        wait for clk_period;
        inputHit <= ('1', to_unsigned(1,layerId_width), to_signed(2,tubeId_width), '0', to_unsigned(305, r_width));
        wait for clk_period;
        inputHit <= ('1', to_unsigned(2,layerId_width), to_signed(3,tubeId_width), '0', to_unsigned(173, r_width));
        eof <= '1';
        wait for clk_period;
        inputHit <= null_inputhit;
        eof <= '0';
        wait;

    end process;


end Behavioral;
