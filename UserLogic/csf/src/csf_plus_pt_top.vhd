----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18/10/2019 9:31:09 AM
-- Design Name: 
-- Module Name: csf_plus_pt_top - Behavioral
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
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE ieee.math_real.ALL;

LIBRARY csf_lib;
USE csf_lib.csf_pkg.ALL;
USE csf_lib.csf_custom_pkg.ALL;

LIBRARY pt_lib;
USE pt_lib.pt_pkg.ALL;

ENTITY csf_plus_pt_top IS
    GENERIC (
        DataWidth : INTEGER := 64
    );
    PORT (
        clk : IN STD_LOGIC;
        we : IN STD_LOGIC;
        d : IN STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        q : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        en : OUT STD_LOGIC;
        addr : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
END csf_plus_pt_top;

ARCHITECTURE Behavioral OF csf_plus_pt_top IS
    SIGNAL eof : STD_LOGIC := '0';
    TYPE a_mdt_hits IS ARRAY(NATURAL RANGE <>) OF t_mdt_hit;
    SIGNAL mdt_hits : a_mdt_hits(2 DOWNTO 0) := (OTHERS => null_mdt_hit);
    TYPE a_seeds IS ARRAY(NATURAL RANGE <>) OF t_seed;
    SIGNAL seeds : a_seeds(2 DOWNTO 0) := (OTHERS => null_seed);

    SIGNAL en_s : STD_LOGIC := '0';
    SIGNAL addr_s : STD_LOGIC_VECTOR(6 DOWNTO 0) := (OTHERS => '1');
    -- ROI segments in local coordinates
    TYPE a_rois IS ARRAY(NATURAL RANGE <>) OF t_roi;
    SIGNAL rois : a_rois(2 DOWNTO 0) := (OTHERS => null_roi);
    SIGNAL out_segs : t_locsegs(2 DOWNTO 0) := (OTHERS => null_locseg);
    SIGNAL pt_online : unsigned(pt_width - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dv_pt : STD_LOGIC := '0';
    SIGNAL csf_rst : STD_LOGIC := '0';
    SIGNAL rst_pt : STD_LOGIC := '0';
    SIGNAL fill_pt : STD_LOGIC_VECTOR(DataWidth - pt_width - 1 - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL fill_seg : STD_LOGIC_VECTOR(DataWidth - 3 * mfit_width - 1 - 3 - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL q_s : STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0) := (OTHERS => '0');
BEGIN

    -- Compact Segment Finders (1 per MDT station)
    Finders : FOR k IN 2 DOWNTO 0 GENERATE
    BEGIN
        CSF : ENTITY csf_lib.csf
            PORT MAP(
                clk => clk,
                i_seed => seeds(k),
                i_mdt_hit => mdt_hits(k),
                o_seg => out_segs(k),
                i_rst => csf_rst
            );
    END GENERATE;

    -- Track Fitting
    Pt : ENTITY pt_lib.pt_calculator_top
        PORT MAP(
            clk => clk,
            i_segment_BI => out_segs(0),
            i_segment_BM => out_segs(1),
            i_segment_BO => out_segs(2),
            i_roi_BI => rois(0),
            i_roi_BM => rois(1),
            i_roi_BO => rois(2),
            i_rst => rst_pt,
            o_pt_online => pt_online,
            o_pt_valid => dv_pt
        );

    addr <= addr_s;
    en <= en_s;
    q <= q_s;

    TopProc : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN

            -- Input
            mdt_hits <= (OTHERS => null_mdt_hit);
            seeds <= (OTHERS => null_seed);

            IF d(61) = '1' AND we = '1' THEN
                seeds(to_integer(vec_to_seed(d).chamber_ieta)) <= vec_to_seed(d);
            ELSIF d(63) = '1' AND we = '1' THEN
                mdt_hits(to_integer(vec_to_mdthit(d).chamber_ieta)) <= vec_to_mdthit(d);
            ELSIF d(60) = '1' AND we = '1' THEN
                rois(to_integer(vec_to_roi(d).chamber_ieta)) <= vec_to_roi(d);
            END IF;

            csf_rst <= '0';
            --if rois(0).valid = '1' and rois(1).valid = '1' and rois(2).valid = '1' and out_segs(0).valid = '1' and out_segs(1).valid = '1' and out_segs(2).valid = '1' then
            --    rois <= (others => null_roi);
            --    --csf_rst <= '1';
            --end if; 

            -- Output
            IF unsigned(addr_s) < 127 AND unsigned(addr_s) >= 0 THEN
                addr_s <= STD_LOGIC_VECTOR(unsigned(addr_s) + 1);
            ELSIF unsigned(addr_s) = 127 THEN
                addr_s <= (OTHERS => '1');
                en_s <= '0';
                q_s <= (OTHERS => '0');
                rst_pt <= '0';
            END IF;

            IF rois(0).valid = '1' AND rois(1).valid = '1' AND rois(2).valid = '1' AND out_segs(0).valid = '1' AND out_segs(1).valid = '1' AND out_segs(2).valid = '1' THEN
                --rois <= (others => null_roi);
                --q_s <= '1' & fill_seg & out_segs(2).valid & out_segs(1).valid & out_segs(0).valid & std_logic_vector(out_segs(2).m) & std_logic_vector(out_segs(1).m) & std_logic_vector(out_segs(0).m);
                csf_rst <= '1';
                --en_s <= '1';
                --addr_s <= (others => '0');
                --rois <= (others => null_roi);
            END IF;
            IF dv_pt = '1' THEN
                q_s <= dv_pt & fill_pt & STD_LOGIC_VECTOR(pt_online);
                rst_pt <= '1';
                en_s <= '1';
                addr_s <= (OTHERS => '0');
                rois <= (OTHERS => null_roi);
            END IF;
        END IF;
    END PROCESS;

END Behavioral;