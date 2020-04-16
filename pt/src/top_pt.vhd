--------------------------------------------------------------------------------
-- Title       : top_pt.vhd
-- Project     : MDTTP
--------------------------------------------------------------------------------
-- File        : top_pt.vhd
-- Author      : Davide Cieri davide.cieri@cern.ch
-- Company     : Max-Planck-Institute For Physics, Munich
-- Created     : Tue Feb 11 13:50:27 2020
-- Last update : Thu Apr 16 11:40:47 2020
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Max-Planck-Institute For Physics, Munich
-------------------------------------------------------------------------------
-- Description:  pT calculator top module
--------------------------------------------------------------------------------
-- Revisions:  Revisions and documentation are controlled by
-- the revision control system (RCS).  The RCS should be consulted
-- on revision history.
-------------------------------------------------------------------------------

-- Doxygen-compatible comments
--! @file top_pt.vhd
--! @brief top_pt
--! @details 
--! pT calculator top module
--! @author Davide Cieri


library IEEE, pt_lib, dataformats;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use pt_lib.pt_pkg.all;
use pt_lib.pt_params_pkg.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use dataformats.mdttp_types_pkg.all;
use dataformats.mdttp_functions_pkg.all;

entity top_pt is
  Port ( 
    clk : in std_logic;
    i_segment_BI : in t_globalseg;
    i_segment_BM : in t_globalseg;
    i_segment_BO : in t_globalseg;
    i_dv_SLC     : in std_logic;
    i_SLC        : in SLC_COMMON_rt;
    i_rst        : in std_logic;
    o_mtc        : out MTC_rt;
    o_mtc_dv     : out std_logic
    --o_pt_online  : out unsigned(pt_width-1 downto 0);
    --o_pt_valid   : out std_logic
    );
end top_pt;

architecture Behavioral of top_pt is
    -- Online segments in global coordinates
    signal segment_BI, segment_BM, segment_BO : t_globalseg := null_globalseg;
    -- SLC candidate
    signal slc : SLC_COMMON_rt := null_slc;
    -- Chamber combo id
    signal comboid_s, comboid_phi, comboid_phi_s, comboid_eta : 
           unsigned(chamber_id_width*3 + 4 -1 downto 0) := (others => '0'); 
    --signal ram_index : integer := 0;
    -- Sagitta/Dbeta calculator signals
    signal dv_s, dv_combo_s, dv_combo_s_s : std_logic := '0';
    signal inv_s, inv_s_s : unsigned(inv_s_width-1 downto 0) 
           := (others => '0');

    -- Data Valid signals
    signal dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9, dv10, dv11 
                                                             : std_logic := '0';
    signal dv_a : std_logic := '0';
    -- Phi/Eta coordinate
    signal nsegments : unsigned(PTCALC_mtc_nsegments_width-1 downto 0) := (others => '0');
    signal dv_eta : std_logic := '0';
    signal phi : signed(phi_width-1 downto 0) := (others => '0');
    signal eta : signed(eta_width-1 downto 0) := (others => '0');

    signal dv_dbeta_01, dv_dbeta_02, dv_dbeta_12 : std_logic := '0';
    signal dbeta_01, dbeta_02, dbeta_12 : unsigned(dbeta_width-1 downto 0) 
                                        := (others => '0');

    -- Signal for pT calculation
    -- Sagitta/Dbeta-dependent part
    signal a0, a0_s : std_logic_vector(a0_width-1 downto 0) := (others =>'0');
    signal a1 : std_logic_vector(a1_width-1 downto 0) := (others =>'0');
    signal a1_invs : signed(a1_width+inv_s_width downto 0) 
           := (others => '0');
    signal pt_s, pt_s0, pt_s1, pt_s2, pt_s3, pt_s4, pt_s5 
           : signed(a1_width+inv_s_width downto 0) := (others => '0');
    signal bin_s : unsigned(3 downto 0) := (others => '0');

    -- Phi-dependent part
    signal b0, b0_s : std_logic_vector(b0_width-1 downto 0) := (others => '0');
    signal b1 : std_logic_vector(b1_width-1 downto 0) := (others => '0');
    signal b1_phi, pt_phi_01 : signed(b1_width+phi_width-1 downto 0) 
           := (others => '0');
    signal b2 : std_logic_vector(b2_width-1 downto 0) := (others => '0');
    signal b2_phi : signed(b2_width+phi_width-1 downto 0) := (others => '0');
    signal b2_phi2 : signed(b2_width+phi_width*2 -1  downto 0) 
           := (others => '0');
    signal pt_p : signed(b2_width+phi_width*2 -1  downto 0) := (others => '0');
    signal pt_sp, pt_sp_s, pt_sp_ss, pt_sp_sss  
           : signed(a1_width+inv_s_width downto 0) := (others => '0');
    signal bin_sp : unsigned(3 downto 0) := (others => '0');


    -- Eta dependent part
    signal c0, c0_s : std_logic_vector(c0_width-1 downto 0) := (others => '0');
    signal c1 : std_logic_vector(c1_width-1 downto 0) := (others =>'0');
    signal c1_eta : signed(c1_width+eta_width-1 downto 0) := (others => '0');

    -- Final pt signals
    
    signal pt_online  :  signed(a1_width+inv_s_width downto 0) := (others => '0');
    signal pt_valid   :  std_logic := '0';

    signal pt : unsigned(pt_width-1 downto 0) := (others => '0');
    signal mtc_valid : std_logic := '0';
    
    COMPONENT a0_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(a0_width-1 DOWNTO 0)
    );
    END COMPONENT;

    COMPONENT a1_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(a1_width-1 DOWNTO 0)
    );
    END COMPONENT;

    COMPONENT b0_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(b0_width-1 DOWNTO 0)
    );
    END COMPONENT;

    COMPONENT b1_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(b1_width-1 DOWNTO 0)
    );
    END COMPONENT;

    COMPONENT b2_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(b2_width-1 DOWNTO 0)
    );
    END COMPONENT;

    COMPONENT c0_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(c0_width-1 DOWNTO 0)
    );
    END COMPONENT;

    COMPONENT c1_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(c1_width-1 DOWNTO 0)
    );
    END COMPONENT;


begin
    
    EtaCalculator : entity pt_lib.eta_calculator
    port map (
        clk            => clk,
        i_seg          => segment_BI,
        o_eta          => eta,
        o_dv_eta       => dv_eta
    );

    SagittaCalculator : entity pt_lib.sagitta_calculator
    port map(
        clk => clk,
        i_seg0 => segment_BI,
        i_seg1 => segment_BM, 
        i_seg2 => segment_BO,
        o_inv_s => inv_s,
        o_dv_s => dv_s
    );
    
    getA0 : a0_ROM
    PORT MAP (
        clka => clk,
        ena => dv_combo_s,
        addra => comboid_to_index_ram(comboid_s),
        douta => a0
    );

    getA1 : a1_ROM
    PORT MAP (
        clka => clk,
        ena => dv_combo_s,
        addra => comboid_to_index_ram(comboid_s),
        douta => a1
    );

    getB0 : b0_ROM
    PORT MAP (
        clka => clk,
        ena => dv2,
        addra => comboid_to_index_ram(comboid_phi),
        douta => b0
    );

    getB1 : b1_ROM
    PORT MAP (
        clka => clk,
        ena => dv2,
        addra => comboid_to_index_ram(comboid_phi),
        douta => b1
    );

    getB2 : b2_ROM
    PORT MAP (
        clka => clk,
        ena => dv2,
        addra => comboid_to_index_ram(comboid_phi),
        douta => b2
    );

    getC0 : c0_ROM
    PORT MAP (
        clka => clk,
        ena => dv7,
        addra => comboid_to_index_ram(comboid_eta),
        douta => c0
    );

    getC1 : c1_ROM
    PORT MAP (
        clka => clk,
        ena => dv7,
        addra => comboid_to_index_ram(comboid_eta),
        douta => c1
    );

    pt_top_proc : process( clk )
    begin
        if rising_edge(clk) then
            segment_BI <= null_globalseg;
            segment_BM <= null_globalseg;
            segment_BO <= null_globalseg;

            if i_segment_BI.valid = '1' or 
                i_segment_BM.valid = '1' or 
                i_segment_BO.valid = '1' then
                segment_BI <= i_segment_BI;
                segment_BM <= i_segment_BM;
                segment_BO <= i_segment_BO;
                comboid_s  <= "0000" &
                              i_segment_BO.chamber_id & 
                              i_segment_BM.chamber_id & 
                              i_segment_BI.chamber_id;
                nsegments <= to_unsigned(stdlogic_integer(i_segment_BI.valid) + stdlogic_integer(i_segment_BM.valid) + stdlogic_integer(i_segment_BO.valid), PTCALC_mtc_nsegments_width) ;
                dv_combo_s     <= '1';
            end if;

            -- save the slc
            if i_dv_SLC = '1' then
                slc  <= i_SLC;
                phi  <= calc_phi_mod(i_SLC.posphi);
            end if;

            dv_combo_s_s <= dv_combo_s;
            -- <a> parameters are now valid
            dv_a <= dv_combo_s_s;
            dv0 <= dv_s and dv_a;
            a1_invs <= signed(a1)*signed('0' & inv_s);

            a0_s <= a0;
                
            dv1  <= dv0;
            pt_s <= signed(a0_s) + a1_invs;

            dv2 <= dv1;
            comboid_phi <= pt_bin(pt_s) & 
                           segment_BO.chamber_id & 
                           segment_BM.chamber_id & 
                           segment_BI.chamber_id;            
            pt_s0 <= pt_s;

            dv3 <= dv2;
            pt_s1 <= pt_s0;
            
            -- <b> parameters now valid
            dv4 <= dv3;
            b1_phi <= signed(b1)*phi;
            b2_phi <= signed(b2)*phi;
            pt_s2  <= pt_s1 - signed(b0);
            
            
            dv5 <= dv4;
            pt_s3 <= pt_s2 - b1_phi;
            b2_phi2 <= b2_phi*phi;

            dv6 <= dv5;
            pt_sp <= pt_s3 - b2_phi2;

            dv7 <= dv6;
            comboid_eta <= pt_bin(pt_sp) & 
                           segment_BO.chamber_id & 
                           segment_BM.chamber_id & 
                           segment_BI.chamber_id;
            pt_sp_s <= pt_sp;

            dv8 <= dv7;
            pt_sp_ss <= pt_sp_s;

            -- <c> parameters now valid
            dv9 <= dv8;
            pt_sp_sss <= pt_sp_ss - signed(c0);
            c1_eta <= signed(c1)*eta;

            pt_valid <= dv9;
            pt_online <= pt_sp_sss - c1_eta;
            
            -- Assembling the MTC candidate
            mtc_valid <= pt_valid;
            pt <= resize(unsigned(pt_online), pt_width);
            
            o_mtc_dv <= mtc_valid;
            o_mtc.SLC_COMMON <= slc;
            o_mtc.mtc_eta <= eta;
            o_mtc.mtc_pt  <= pt;
            o_mtc.mtc_ptthresh <= pt_threshold(pt);
            o_mtc.mtc_charge <= slc.charge; -- temporary
            -- Still to add other cases
            if slc.ptthresh /= pt_threshold(pt) then
                o_mtc.mtc_procflags <= std_logic_vector(to_unsigned(2, MTC_mtc_procflags_width));
            else
                o_mtc.mtc_procflags <= std_logic_vector(to_unsigned(1, MTC_mtc_procflags_width));
            end if;
            o_mtc.mtc_nsegments <= std_logic_vector(nsegments);
            o_mtc.mtc_quality <= std_logic_vector(nsegments);
            --reset
            if pt_valid = '1' or i_rst = '1' then
                phi <= (others => '0');
                comboid_s <= (others => '0');
                dv_combo_s <= '0';
            end if;
            
        end if ;
    end process ; -- identifier

end Behavioral;

