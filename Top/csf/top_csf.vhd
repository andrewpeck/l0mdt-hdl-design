----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18/10/2019 9:31:09 AM
-- Design Name: 
-- Module Name: top_csf - Behavioral
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
library csf_lib;
use csf_lib.csf_pkg.all;

entity top_csf is
  Generic(
    DataWidth : integer := 64
  );
  Port ( 
    clk     : in std_logic;
    we      : in std_logic;
    d       : in std_logic_vector(DataWidth-1 downto 0);
    q       : out std_logic_vector(DataWidth-1 downto 0);
    en      : out std_logic;
    addr    : out std_logic_vector(3 downto 0)
  );
end top_csf;

architecture Behavioral of top_csf is
    signal eof : std_logic                   := '0';
    signal mdt_hit : t_mdt_hit               := null_mdt_hit;
    signal seed : t_seed                     := null_seed;
    signal en_s : std_logic := '0';
    signal addr_s : std_logic_vector(3 downto 0) := (others => '1');
    signal out_seg : t_locseg := null_locseg;
    signal fill_q : std_logic_vector(DataWidth - num_hits_width - mfit_width - bfit_width - chi2_width - 1 -1 downto 0) := (others => '0');
    signal rst_csf : std_logic := '0';

begin
    
    CSF: entity csf_lib.csf
    port map(
        clk => clk,
        i_seed => seed,
        i_mdt_hit => mdt_hit,
        o_seg => out_seg,
        i_rst => rst_csf

    );

    addr <= addr_s;
    en   <= en_s;
    
    TopProc : process(clk)
    begin
        if rising_edge(clk) then

            -- Input
            mdt_hit <= null_mdt_hit;
            seed    <= null_seed;

            if d(61) = '1' and we = '1' then
                seed <= vec_to_seed(d);
            elsif we = '1' then
                mdt_hit <= vec_to_mdthit(d);
            end if;

            rst_csf <= '0';

            -- Output
            if unsigned(addr_s) < 15 and unsigned(addr_s) >= 0 then
                addr_s <= std_logic_vector(unsigned(addr_s) + 1);
            elsif unsigned(addr_s) = 15 then
                addr_s <= (others => '1');
                en_s <= '0'; 
                q <= (others => '0');               
            end if;

            if out_seg.valid = '1' then
                q <= out_seg.valid & fill_q & std_logic_vector(out_seg.ndof) & std_logic_vector(out_seg.chi2) & std_logic_vector(out_seg.m) & std_logic_vector(out_seg.b);
                rst_csf <= '1';
                en_s <= '1';
                addr_s <= (others => '0');
            end if;

        end if;
    end process;

end Behavioral;
