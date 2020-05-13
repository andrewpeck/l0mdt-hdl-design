--------------------------------------------------------------------------------
-- Title       : eta_calculator.vhd
-- Project     : MDTTP
--------------------------------------------------------------------------------
-- File        : eta_calculator.vhd
-- Author      : Davide Cieri davide.cieri@cern.ch
-- Company     : Max-Planck-Institute For Physics, Munich
-- Created     : Tue Feb 11 13:50:27 2020
-- Last update : Wed Apr 15 09:47:55 2020
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2020 Max-Planck-Institute For Physics, Munich
-------------------------------------------------------------------------------
-- Description:  Module that calculates the pseudo-rapidity of an MDT muon 
--               candidate out of the reconstructed MDT segment coordinates
--------------------------------------------------------------------------------
-- Revisions:  Revisions and documentation are controlled by
-- the revision control system (RCS).  The RCS should be consulted
-- on revision history.
-------------------------------------------------------------------------------

-- Doxygen-compatible comments
--! @file eta_calculator.vhd
--! @brief eta_calculator
--! @details 
--! Module that calculates the pseudo-rapidity of an MDT muon 
--! candidate out of the reconstructed MDT segment coordinates
--! pipeline
--! @author Davide cieri


library IEEE, pt_lib, shared_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use pt_lib.pt_pkg.all;
use shared_lib.custom_types_davide_pkg.all;

entity eta_calculator is
    port (
        clk               : in std_logic;
        i_seg             : in sf_seg_data_barrel_rt;
        o_eta             : out signed(MTC_ETA_LEN-1 downto 0);
        o_dv_eta          : out std_logic
    );
end eta_calculator; -- sagitta_calculator

 architecture Behavioral of eta_calculator is
    -- Valid signals for pseudo-rapidity calculation
    signal dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9, dv10, dv11 : std_logic := '0';
    -- square of r and z signals 
    -- signal r2 : unsigned(SF_SEG_POS_WIDTH*2-1 downto 0) := (others => '0');
    signal z2 : unsigned(SF_SEG_POS_WIDTH*2-1 downto 0) := (others => '0');
    -- square of vector magnitude
    constant shift_mag2  : integer := 28;
    constant mag2_width : integer := SF_SEG_POS_WIDTH*2 - shift_mag2;
    signal mag2 : unsigned(SF_SEG_POS_WIDTH*2-shift_mag2-1 downto 0) := (others => '0');

    -- vector magnitude
    constant shift_mag : integer := shift_mag2/4;
    signal mag : std_logic_vector(SF_SEG_POS_WIDTH-shift_mag-1 downto 0) := (others => '0');
    signal z_red, z_red_s, z_red_ss : signed(SF_SEG_POS_WIDTH-shift_mag-1 downto 0) := (others => '0');
    signal m_plus_z, m_minus_z : signed(SF_SEG_POS_WIDTH-shift_mag downto 0) := (others => '0');

    -- logarithm signals
    signal log_plus, log_minus : std_logic_vector(MTC_ETA_LEN-1 downto 0) := (others => '0');

    COMPONENT mag_ROM
    PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
    END COMPONENT;
    
    COMPONENT half_log_rom
    PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(14 DOWNTO 0);
        clkb : IN STD_LOGIC;
        addrb : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
        doutb : OUT STD_LOGIC_VECTOR(14 DOWNTO 0)
      );
    END COMPONENT;
    
begin
    magnitude_rom : mag_ROM
    PORT MAP (
        clka => clk,
        addra => std_logic_vector(mag2),
        douta => mag
    );
    
    logarithm_rom : half_log_rom
    PORT MAP (
        clka => clk,
        addra => std_logic_vector(m_plus_z),
        douta => log_plus,
        clkb => clk,
        addrb => std_logic_vector(m_minus_z),
        doutb => log_minus
    );
    
        EtaProc : process( clk )
        begin
        if rising_edge(clk) then
            -- Clock 0
            dv0 <= i_seg.data_valid;
            z2  <= unsigned(i_seg.pos*i_seg.pos);
            z_red <= resize(shift_right(i_seg.pos, shift_mag), SF_SEG_POS_WIDTH-shift_mag);
            
            -- Clock 1
            dv1 <= dv0;
            mag2 <= resize(shift_right(BIL_SEC3_RHO2_s+z2, shift_mag2),mag2_width);
            z_red_s <= z_red;

            -- Clock 2
            dv2 <= dv1;
            z_red_ss <= z_red_s;

            -- Clock 3 (mag available)
            dv3 <= dv2;
            m_plus_z <= resize(signed(mag) + z_red_ss, SF_SEG_POS_WIDTH-shift_mag+1);
            m_minus_z <= resize(signed(mag) - z_red_ss, SF_SEG_POS_WIDTH-shift_mag+1);

            -- Clock 4
            dv4 <= dv3;

            -- Clock 5 (log available)
            o_dv_eta <= dv5;
            o_eta <= signed(log_plus) - signed(log_minus);

        end if ;
    end process ; -- SagittaProc



end Behavioral;