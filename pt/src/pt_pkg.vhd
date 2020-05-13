----------------------------------------------------------------------------------
-- Company: Max Planck Institute For Physics Munich
-- Engineer: Davide Cieri
-- 
-- Create Date: Create Date: 04/26/2019 15:57 AM
-- Design Name: L0 MDT Trigger
-- Module Name: pt_pkg - Behavioral
-- Project Name: ATLAS L0 MDT Trigger 
-- Target Devices: xcvu5p-flvb2104-2-e
-- Tool Versions: Vivado 2018.2
-- Description: Common package for pt calculator modules
-- Constants for 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: See https://docs.google.com/spreadsheets/d/1lwfviXgj2JlggAJh3dn6TrzF5_XYFP99MgL8t05_VWc/edit?usp=sharing
-- 
----------------------------------------------------------------------------------

library IEEE, pt_lib, shared_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use std.standard.all;
use shared_lib.custom_types_davide_pkg.all;

package pt_pkg is

    -- Segment parameters in global coordinates
    constant BIL_SEC3_RHO_s :  unsigned(SF_SEG_POS_WIDTH-1 downto 0) := to_unsigned(integer(floor(BIL_SEC3_RHO*SF_SEG_POS_MULTI)), SF_SEG_POS_WIDTH);
    constant BML_SEC3_RHO_s :  unsigned(SF_SEG_POS_WIDTH-1 downto 0) := to_unsigned(integer(floor(BIL_SEC3_RHO*SF_SEG_POS_MULTI)), SF_SEG_POS_WIDTH);
    constant BOL_SEC3_RHO_s :  unsigned(SF_SEG_POS_WIDTH-1 downto 0) := to_unsigned(integer(floor(BIL_SEC3_RHO*SF_SEG_POS_MULTI)), SF_SEG_POS_WIDTH);

    constant BIL_SEC3_RHO2_s : unsigned(SF_SEG_POS_WIDTH*2-1 downto 0) := BIL_SEC3_RHO_s*BIL_SEC3_RHO_s;

    constant z_glob_width           : integer := 19;
    constant r_glob_width           : integer := 19;
    constant chamber_id_width       : integer := 3;
    constant phimod_width           : integer := 8;
    constant phimod_range           : real    := 0.8; 
    constant phimod_mult            : real    := real(2**phimod_width)/phimod_range;
    constant phi_range              : real    := 6.28;
    --constant phi_mult               : real    := 2.0**SLC_COMMON_POSPHI_LEN/phi_range;
    constant eta_width              : integer := 15;
    constant eta_range              : real    := 5.4;
    constant eta_mult               : real    := 2.0**eta_width/eta_range;
    -- Phi Sector Centre (for sector 3)
    constant MDT_SECTOR_PHI         : real    := 0.785398;
    constant PHI_SECTOR_CENTRE      : signed(phimod_width-1 downto 0) := 
                         to_signed(integer(MDT_SECTOR_PHI*phimod_mult), phimod_width);
    
    -- Sagitta calculation parameter
    constant inv_s_width      : integer := 15;
    constant sagitta_mult           : real := 64.0;
    constant sagitta_multi_width    : integer := integer(log2(sagitta_mult)); 
    constant m_sagitta_width : integer := 16;
    constant m_sagitta_range : real := 4.0;
    constant m_sagitta_multi : real := (2.0**m_sagitta_width/m_sagitta_range); 
    constant m_sagitta_multi_width : integer := integer(log2(m_sagitta_multi));

    constant inv_tantheta_width     : integer := 15;

    constant shift_m_den            : integer := 6;
    constant m_width                : integer := 16;
    

    constant shift_m_num : integer := 14;
    constant divider_width : integer := 21;

    --constant halfpi : integer := integer(floor(MATH_PI*theta_glob_mult));
    constant inv_sqrt_width : integer := 22;
    constant dbeta_width : integer := 16;
    constant pt_width : integer := 9;
    constant pt_mult  : real := 4.0;
   
    -- Functions 
    type t_reciprocalROM is array ( natural range <> ) of unsigned( divider_width-1 downto 0 );
    function reciprocalROM return t_reciprocalROM;

    type t_sqrt_m_io_ROM is array(natural range <> ) of unsigned(m_sagitta_width -1 downto 0);
    function sqrt_m_io_ROM return t_sqrt_m_io_ROM;

    type t_invsqrt_ROM is array ( natural range <> ) of unsigned(inv_sqrt_width-1 downto 0);
    function invsqrt_ROM return t_invsqrt_ROM;

    function pt_bin(pt : signed) return unsigned;
--    function calc_phi_mod(phi : std_logic_vector) return signed;
    function pt_threshold(pt : unsigned) return std_logic_vector;
    function stdlogic_integer( s : std_logic ) return integer ;

    -- Arrays
    type a_slc is array(natural range <> ) of SLC_COMMON_rt;
    type a_pt is array(natural range <> ) of unsigned(pt_width-1 downto 0);

end;

package body pt_pkg is

    function reciprocalROM return t_reciprocalROM is 
    variable temp: t_reciprocalROM(2**16 downto 0) := (others => (others => '0'));

    begin
    for k in 2 ** 16 downto 0 loop
        temp( k ) := to_unsigned( integer( floor( (( 2.0 ** divider_width )) / ( real( k ) + 0.5 ) ) ), divider_width ) ;
    end loop;

    return temp;
    end function;

    function sqrt_m_io_ROM return t_sqrt_m_io_ROM is
        variable temp : t_sqrt_m_io_ROM(2**(m_sagitta_width)-1 downto 0) := (others => (others => '0'));
    begin
        for k in 2**(m_sagitta_width) -1 downto 0 loop
            temp(k) := to_unsigned(integer(floor( sqrt( m_sagitta_multi**2 + real(k*k) ) )), m_sagitta_width);
        end loop;
        return temp;
    end function;


    function invsqrt_ROM return t_invsqrt_ROM is 
        variable temp : t_invsqrt_ROM(2**(16)-1 downto 0) := (others => (others => '0'));
    begin
        for k in 2**(16) -1 downto 0 loop
            temp(k) := to_unsigned(integer(floor( (( 2.0 ** inv_sqrt_width  ))/ sqrt( m_sagitta_multi**2 + real(k*k) ) )), inv_sqrt_width);
        end loop;
        return temp;
    end function;

    function pt_bin( pt : signed ) return unsigned is
        variable bin : unsigned(3 downto 0) := (others => '0');
    begin
        if pt < 50 then
            bin := to_unsigned(0,4);
        elsif pt < 100 then
            bin := to_unsigned(1,4);
        elsif pt < 150 then
            bin := to_unsigned(2,4);
        elsif pt < 200 then
            bin := to_unsigned(3,4);
        elsif pt < 250 then
            bin := to_unsigned(4,4);
        elsif pt < 300 then
            bin := to_unsigned(5,4);
        elsif pt < 350 then
            bin := to_unsigned(6,4);
        elsif pt < 400 then
            bin := to_unsigned(7,4);
        elsif pt < 450 then
            bin := to_unsigned(8,4);
        else
            bin := to_unsigned(9,4);
        end if;
        return bin;
    end function;

--    function calc_phi_mod( phi : std_logic_vector ) return signed is
--        variable phi_m : signed(phimod_width-1 downto 0) := (others => '0');
--        variable phi_real : real := 0.0;
--    begin
--        phi_real := real(to_integer(unsigned(phi_m)))/phi_mult;
--        phi_m := to_signed(integer((phi_real-MDT_SECTOR_PHI-MATH_PI)*phimod_mult), phimod_width);
--        return phi_m;
--    end function;

    function pt_threshold(pt : unsigned) return std_logic_vector is
        variable thr : integer := 0;
    begin
        if pt > 80*integer(pt_mult) then
            thr := 15;
        elsif pt < 40*integer(pt_mult) then
            thr := 14;
        elsif pt < 30*integer(pt_mult) then
            thr := 13;
        elsif pt < 25*integer(pt_mult) then
            thr := 12;
        elsif pt < 20*integer(pt_mult) then
            thr := 11;
        elsif pt < 18*integer(pt_mult) then
            thr := 10;
        elsif pt < 15*integer(pt_mult) then
            thr := 9;
        elsif pt < 12*integer(pt_mult) then
            thr := 8;
        elsif pt < 10*integer(pt_mult) then
            thr := 7;
        elsif pt < 9*integer(pt_mult) then
            thr := 6;
        elsif pt < 8*integer(pt_mult) then
            thr := 5;
        elsif pt < 7*integer(pt_mult) then
            thr := 4;
        elsif pt < 6*integer(pt_mult) then
            thr := 3;
        elsif pt < 5*integer(pt_mult) then
            thr := 2;
        elsif pt < 4*integer(pt_mult) then
            thr := 1;
        end if;
        return std_logic_vector(to_unsigned(thr,MTC_PTTHR_LEN));
    end function;
    

    function stdlogic_integer( s : std_logic ) return integer is
    begin
        if s = '1' then
            return 1;
        else
            return 0;
        end if;
    end function;

end package body;
