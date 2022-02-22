--------------------------------------------------------------------------------
-- Title       : eta_calculator.vhd
-- Project     : MDTTP
--------------------------------------------------------------------------------
-- File        : eta_calculator.vhd
-- Author      : Davide Cieri davide.cieri@cern.ch
-- Company     : Max-Planck-Institute For Physics, Munich
-- Created     : Tue Feb 11 13:50:27 2020
-- Last update : Fri May 15 12:09:23 2020
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- library shared_lib;
-- use shared_lib.config_pkg.all;
-- use shared_lib.common_types_pkg.all;
-- use shared_lib.common_constants_pkg.all;
library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library ptc_lib;
use ptc_lib.pt_pkg.all;
use ptc_lib.pt_params_pkg.all;

-- library IEEE, pt_lib, shared_lib;
-- use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;
-- use ieee.math_real.all;
-- use pt_lib.pt_pkg.all;
-- use shared_lib.custom_types_davide_pkg.all;

entity eta_calculator is
    generic(
        FLAVOUR : integer := 0 -- Barrel
    );
    port (
        clk               : in std_logic;
        i_seg             : in sf2ptcalc_vt;
        i_layer           : in std_logic;
        o_eta             : out unsigned(PTCALC2MTC_MDT_ETA_LEN-1 downto 0);
        o_dv_eta          : out std_logic
    );
end eta_calculator; -- sagitta_calculator

architecture Behavioral of eta_calculator is
    signal seg : sf2ptcalc_rt;
    -- Valid signals for pseudo-rapidity calculation
    signal dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9, dv10, dv11
        : std_logic := '0';
    signal en_BI, en_BM : std_logic := '0';
    signal layer, layer_s : std_logic := '0';

    constant SHIFT_ETA  : integer := 10;
    signal z_red : unsigned(SF_SEG_POS_LEN-SHIFT_ETA-1 downto 0)
        := (others => '0');
    signal eta_BI, eta_BM : std_logic_vector(PTCALC2MTC_MDT_ETA_LEN-1 downto 0) := (others => '0');

    COMPONENT rom
    GENERIC (
        MXADRB   : integer;
        MXDATB   : integer;
        ROM_FILE : string;
        ROM_STYLE : string
    );
    PORT (
        clka  : in std_logic;
        ena   : in std_logic;
        addra : in std_logic_vector;
        douta : out std_logic_vector
    );
    END COMPONENT;

begin

    eta_BI_rom : rom
    GENERIC MAP (
        MXADRB => SF_SEG_POS_LEN-SHIFT_ETA,
        MXDATB => PTCALC2MTC_MDT_ETA_LEN,
        ROM_FILE  => "eta_BI.mem",
        ROM_STYLE => "auto"
    )
    PORT MAP (
        clka => clk,
        ena  => en_BI,
        addra => std_logic_vector(z_red),
        douta => eta_BI
    );

    eta_BM_rom : rom
    GENERIC MAP (
        MXADRB => SF_SEG_POS_LEN-SHIFT_ETA,
        MXDATB => PTCALC2MTC_MDT_ETA_LEN,
        ROM_FILE  => "eta_BM.mem",
        ROM_STYLE => "auto"
    )
    PORT MAP (
        clka => clk,
        ena  => en_BM,
        addra => std_logic_vector(z_red),
        douta => eta_BM
    );

    seg <= structify(i_seg,seg);

    EtaProc : process( clk )
    begin
        if rising_edge(clk) then
            -- Clock 0
            dv0 <= seg.data_valid;
            z_red <= resize(shift_right(unsigned(seg.segpos), SHIFT_ETA), SF_SEG_POS_LEN - SHIFT_ETA);
            en_BM <= '0';
            en_BI <= '0';
            if i_layer = '0' then
                en_BI <= '1';
            else
                en_BM <= '1';
            end if;
            layer <= i_layer;

            -- Clock 1
            dv1 <= dv0;
            layer_s <= layer;
            
            -- Clock 2
            o_dv_eta <= dv1;
            if layer_s = '0' then
                o_eta <= unsigned(eta_BI);
            else
                o_eta <= unsigned(eta_BM);
            end if;

        end if ;
    end process ; -- SagittaProc



end Behavioral;