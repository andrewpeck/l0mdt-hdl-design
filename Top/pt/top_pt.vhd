----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18/10/2019 9:31:09 AM
-- Design Name: 
-- Module Name: top_pt - Behavioral
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
use ieee.math_real.all;
library pt_lib, csf_lib;
use csf_lib.csf_pkg.all;
use pt_lib.pt_pkg.all;

entity top_pt is
  Generic(
    DataWidth : integer := 64
  );
  Port ( 
    clk     : in std_logic;
    we      : in std_logic;
    d   	: in std_logic_vector(DataWidth-1 downto 0);
    q    	: out std_logic_vector(DataWidth-1 downto 0);
    en      : out std_logic;
    addr 	: out std_logic_vector(3 downto 0)
  );
end top_pt;

architecture Behavioral of top_pt is
	
    signal seg_BI, seg_BM, seg_BO : t_locseg := null_locseg;
    signal roi_BI, roi_BM, roi_BO : t_roi := null_roi;
    signal pt_online :  unsigned(pt_width-1 downto 0) := (others => '0');
    signal dv_pt : std_logic := '0';
    signal cmb : unsigned(1 downto 0) := (others => '0');
    signal fill_pt : std_logic_vector(DataWidth - pt_width - 1 -1 downto 0) := (others => '0');
    signal en_s : std_logic := '0';
    signal addr_s : std_logic_vector(3 downto 0) := (others => '1');
begin
    
    Pt: entity pt_lib.pt_calculator_top
    port map(
        clk => clk,
        i_segment_BI => seg_BI,
        i_segment_BM => seg_BM,
        i_segment_BO => seg_BO,
        i_roi_BI     => roi_BI,
        i_roi_BM     => roi_BM,
        i_roi_BO     => roi_BO,
        o_pt_online  => pt_online,
        o_pt_valid   => dv_pt
    );

    addr <= addr_s;
    en   <= en_s;
    cmb  <= unsigned(d(61 downto 60));

	TopProc : process(clk)
    begin
        if rising_edge(clk) then

            -- Input
            if d(62) = '1' and we = '1' then
		        if cmb = 0 then
                    roi_BI <= vec_to_roi(d);
                elsif cmb = 1 then
                    roi_BM <= vec_to_roi(d);
                elsif cmb = 2 then
                    roi_BO <= vec_to_roi(d);
                end if;
            elsif d(63) = '1' and we = '1' then
                 if cmb = 0 then
                    seg_BI <= vec_to_locseg(d);
                elsif cmb = 1 then
                    seg_BM <= vec_to_locseg(d);
                elsif cmb = 2 then
                    seg_BO <= vec_to_locseg(d);
                end if;
		    end if;

            if roi_BI.valid = '1' and roi_BM.valid = '1' and roi_BO.valid = '1' and seg_BI.valid = '1' and seg_BM.valid = '1' and seg_BO.valid = '1' then
                seg_BI <= null_locseg;
                seg_BM <= null_locseg;
                seg_BO <= null_locseg;
                roi_BI <= null_roi;
                roi_BM <= null_roi;
                roi_BO <= null_roi;
            end if; 

            -- Output
            if unsigned(addr_s) < 15 and unsigned(addr_s) >= 0 then
            	addr_s <= std_logic_vector(unsigned(addr_s) + 1);
            elsif unsigned(addr_s) = 15 then
				addr_s <= (others => '1');
				en_s <= '0'; 
				q <= (others => '0');           	
            end if;

            if dv_pt = '1' then
                q <= dv_pt & fill_pt & std_logic_vector(pt_online);
                en_s <= '1';
                addr_s <= (others => '0');
            end if;

        end if;
    end process;

end Behavioral;
