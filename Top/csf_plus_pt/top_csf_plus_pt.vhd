----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18/10/2019 9:31:09 AM
-- Design Name: 
-- Module Name: top_csf_plus_pt - Behavioral
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
use IEEE.NUMERIC_STD.all;
use ieee.math_real.all;
library csf_lib, pt_lib;
use csf_lib.csf_pkg.all;
use pt_lib.pt_pkg.all;

entity top_csf_plus_pt is
    generic(
        DataWidth : integer := 64
        );
    port (
        clk  : in  std_logic;
        we   : in  std_logic;
        d    : in  std_logic_vector(DataWidth-1 downto 0);
        q    : out std_logic_vector(DataWidth-1 downto 0);
        en   : out std_logic;
        addr : out std_logic_vector(6 downto 0)
        );
end top_csf_plus_pt;

architecture Behavioral of top_csf_plus_pt is
    signal eof      : std_logic              := '0';
    type a_mdt_hits is array(natural range <>) of t_mdt_hit;
    signal mdt_hits : a_mdt_hits(2 downto 0) := (others => null_mdt_hit);
    type a_seeds is array(natural range <>) of t_seed;
    signal seeds    : a_seeds(2 downto 0)    := (others => null_seed);

    signal en_s      : std_logic                                                    := '0';
    signal addr_s    : std_logic_vector(6 downto 0)                                 := (others => '1');
    -- ROI segments in local coordinates
    type a_rois is array(natural range <>) of t_roi;
    signal rois      : a_rois(2 downto 0)                                           := (others => null_roi);
    signal out_segs  : t_locsegs(2 downto 0)                                        := (others => null_locseg);
    signal pt_online : unsigned(pt_width-1 downto 0)                                := (others => '0');
    signal dv_pt     : std_logic                                                    := '0';
    signal csf_rst   : std_logic                                                    := '0';
    signal rst_pt    : std_logic                                                    := '0';
    signal fill_pt   : std_logic_vector(DataWidth - pt_width - 1 -1 downto 0)       := (others => '0');
    signal fill_seg  : std_logic_vector(DataWidth - 3*mfit_width -1 -3 -1 downto 0) := (others => '0');
    signal q_s       : std_logic_vector(DataWidth-1 downto 0)                       := (others => '0');


begin

    -- Compact Segment Finders (1 per MDT station)
    Finders : for k in 2 downto 0 generate
    begin
        CSF : entity csf_lib.csf
            port map(
                clk       => clk,
                i_seed    => seeds(k),
                i_mdt_hit => mdt_hits(k),
                o_seg     => out_segs(k),
                i_rst     => csf_rst
                );
    end generate;

    -- Track Fitting
    Pt : entity pt_lib.pt_calculator_top
        port map(
            clk          => clk,
            i_segment_BI => out_segs(0),
            i_segment_BM => out_segs(1),
            i_segment_BO => out_segs(2),
            i_roi_BI     => rois(0),
            i_roi_BM     => rois(1),
            i_roi_BO     => rois(2),
            i_rst        => rst_pt,
            o_pt_online  => pt_online,
            o_pt_valid   => dv_pt
            );

    addr <= addr_s;
    en   <= en_s;
    q    <= q_s;

    TopProc : process(clk)
    begin
        if rising_edge(clk) then

            -- Input
            mdt_hits <= (others => null_mdt_hit);
            seeds    <= (others => null_seed);

            if d(61) = '1' and we = '1' then
                seeds(to_integer(vec_to_seed(d).chamber_id)) <= vec_to_seed(d);
            elsif d(63) = '1' and we = '1' then
                mdt_hits(to_integer(vec_to_mdthit(d).chamber_id)) <= vec_to_mdthit(d);
            elsif d(60) = '1' and we = '1' then
                rois(to_integer(vec_to_roi(d).chamber_id)) <= vec_to_roi(d);
            end if;

            csf_rst <= '0';
            --if rois(0).valid = '1' and rois(1).valid = '1' and rois(2).valid = '1' and out_segs(0).valid = '1' and out_segs(1).valid = '1' and out_segs(2).valid = '1' then
            --    rois <= (others => null_roi);
            --    --csf_rst <= '1';
            --end if; 

            -- Output
            if unsigned(addr_s) < 127 and unsigned(addr_s) >= 0 then
                addr_s <= std_logic_vector(unsigned(addr_s) + 1);
            elsif unsigned(addr_s) = 127 then
                addr_s <= (others => '1');
                en_s   <= '0';
                q_s    <= (others => '0');
                rst_pt <= '0';
            end if;

            if rois(0).valid = '1' and rois(1).valid = '1' and rois(2).valid = '1' and out_segs(0).valid = '1' and out_segs(1).valid = '1' and out_segs(2).valid = '1' then
                --rois <= (others => null_roi);
                --q_s <= '1' & fill_seg & out_segs(2).valid & out_segs(1).valid & out_segs(0).valid & std_logic_vector(out_segs(2).m) & std_logic_vector(out_segs(1).m) & std_logic_vector(out_segs(0).m);
                csf_rst <= '1';
            --en_s <= '1';
            --addr_s <= (others => '0');
            --rois <= (others => null_roi);
            end if;


            if dv_pt = '1' then
                q_s    <= dv_pt & fill_pt & std_logic_vector(pt_online);
                rst_pt <= '1';
                en_s   <= '1';
                addr_s <= (others => '0');
                rois   <= (others => null_roi);
            end if;


        end if;
    end process;

end Behavioral;
