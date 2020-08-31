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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library tf_lib;
-- use pt_lib.pt_pkg.all;
-- use pt_lib.pt_params_pkg.all;

-- library IEEE, pt_lib, shared_lib;
-- use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;
-- use ieee.math_real.all;
-- use std.standard.all;
-- use shared_lib.custom_types_davide_pkg.all;

package pt_pkg is

    -- Segment parameters in global coordinates
    constant BIL_SEC3_RHO_s :  unsigned(SF_SEG_POS_LEN-1 downto 0)
        := to_unsigned(integer(floor(BIL_SEC3_RHO*SF_SEG_POS_MULTI)), SF_SEG_POS_LEN);
    constant BML_SEC3_RHO_s :  unsigned(SF_SEG_POS_LEN-1 downto 0)
        := to_unsigned(integer(floor(BIL_SEC3_RHO*SF_SEG_POS_MULTI)), SF_SEG_POS_LEN);
    constant BOL_SEC3_RHO_s :  unsigned(SF_SEG_POS_LEN-1 downto 0)
        := to_unsigned(integer(floor(BIL_SEC3_RHO*SF_SEG_POS_MULTI)), SF_SEG_POS_LEN);
    constant BIL_SEC3_RHO2_s : unsigned(SF_SEG_POS_LEN*2-1 downto 0)
        := BIL_SEC3_RHO_s*BIL_SEC3_RHO_s;


    -- Sagitta calculation parameter
    constant INV_S_LEN           : integer := 15;
    constant SAGITTA_MULT        : real := 64.0;
    constant SAGITTA_MULTI_LEN   : integer := integer(log2(sagitta_mult));
    constant M_SAGITTA_LEN       : integer := 16;
    constant M_SAGITTA_RANGE     : real := 4.0;
    constant M_SAGITTA_MULTI     : real := (2.0**m_sagitta_len/m_sagitta_range);
    constant M_SAGITTA_MULTI_LEN : integer := integer(log2(m_sagitta_multi));
    constant INV_TANTHETA_LEN    : integer := 15;
    constant SHIFT_M_DEN         : integer := 6;
    constant M_LEN               : integer := 16;
    constant SHIFT_M_NUM         : integer := 14;
    constant DIVIDER_LEN         : integer := 21;

    --constant halfpi : integer := integer(floor(MATH_PI*theta_glob_mult));
    constant INV_SQRT_LEN : integer := 22;
    constant DBETA_LEN : integer := 16;

    -- Functions
    type t_reciprocalROM is array ( natural range <> )
        of unsigned( divider_len-1 downto 0 );
    function reciprocalROM return t_reciprocalROM;

    type t_sqrt_m_io_ROM is array(natural range <> )
        of unsigned(m_sagitta_len -1 downto 0);
    function sqrt_m_io_ROM return t_sqrt_m_io_ROM;

    type t_invsqrt_ROM is array ( natural range <> )
        of unsigned(inv_sqrt_len-1 downto 0);
    function invsqrt_ROM return t_invsqrt_ROM;

    function pt_bin(pt : signed) return unsigned;
--    function calc_phi_mod(phi : std_logic_vector) return signed;
    function pt_threshold(pt : unsigned) return std_logic_vector;
    function stdlogic_integer( s : std_logic ) return integer ;

    -- Arrays
    type a_pt is array(natural range <> ) of unsigned(MTC_PT_LEN-1 downto 0);

end;

package body pt_pkg is

    function reciprocalROM return t_reciprocalROM is
    variable temp: t_reciprocalROM(2**16 downto 0) := (others => (others => '0'));

    begin
    for k in 2 ** 16 downto 0 loop
        temp( k ) := to_unsigned( integer( floor( (( 2.0 ** DIVIDER_LEN )) / ( real( k ) + 0.5 ) ) ), DIVIDER_LEN ) ;
    end loop;

    return temp;
    end function;

    function sqrt_m_io_ROM return t_sqrt_m_io_ROM is
        variable temp : t_sqrt_m_io_ROM(2**(m_sagitta_len)-1 downto 0) := (others => (others => '0'));
    begin
        for k in 2**(m_sagitta_len) -1 downto 0 loop
            temp(k) := to_unsigned(integer(floor( sqrt( M_SAGITTA_MULTI**2 + real(k*k) ) )), M_SAGITTA_LEN);
        end loop;
        return temp;
    end function;


    function invsqrt_ROM return t_invsqrt_ROM is
        variable temp : t_invsqrt_ROM(2**(16)-1 downto 0) := (others => (others => '0'));
    begin
        for k in 2**(16) -1 downto 0 loop
            temp(k) := to_unsigned(integer(floor( (( 2.0 ** inv_sqrt_len  ))/ sqrt( M_SAGITTA_MULTI**2 + real(k*k) ) )), INV_SQRT_LEN);
        end loop;
        return temp;
    end function;

    function pt_bin( pt : signed ) return unsigned is
        variable bin : unsigned(3 downto 0) := (others => '0');
    begin
        if pt < 5*integer(MTC_PT_MULT) then
            bin := to_unsigned(0,4);
        elsif pt < 10*integer(MTC_PT_MULT) then
            bin := to_unsigned(1,4);
        elsif pt < 15*integer(MTC_PT_MULT)  then
            bin := to_unsigned(2,4);
        elsif pt < 20*integer(MTC_PT_MULT)  then
            bin := to_unsigned(3,4);
        elsif pt < 25*integer(MTC_PT_MULT)  then
            bin := to_unsigned(4,4);
        elsif pt < 30*integer(MTC_PT_MULT)  then
            bin := to_unsigned(5,4);
        elsif pt < 35*integer(MTC_PT_MULT)  then
            bin := to_unsigned(6,4);
        elsif pt < 40*integer(MTC_PT_MULT)  then
            bin := to_unsigned(7,4);
        elsif pt < 45*integer(MTC_PT_MULT)  then
            bin := to_unsigned(8,4);
        else
            bin := to_unsigned(9,4);
        end if;
        return bin;
    end function;

--    function calc_phi_mod( phi : std_logic_vector ) return signed is
--        variable phi_m : signed(phimod_len-1 downto 0) := (others => '0');
--        variable phi_real : real := 0.0;
--    begin
--        phi_real := real(to_integer(unsigned(phi_m)))/phi_mult;
--        phi_m := to_signed(integer((phi_real-MDT_SECTOR_PHI-MATH_PI)*phimod_mult), phimod_len);
--        return phi_m;
--    end function;

    function pt_threshold(pt : unsigned) return std_logic_vector is
        variable thr : integer := 0;
    begin
        if pt > 80*integer(MTC_PT_MULT) then
            thr := 15;
        elsif pt < 40*integer(MTC_PT_MULT) then
            thr := 14;
        elsif pt < 30*integer(MTC_PT_MULT) then
            thr := 13;
        elsif pt < 25*integer(MTC_PT_MULT) then
            thr := 12;
        elsif pt < 20*integer(MTC_PT_MULT) then
            thr := 11;
        elsif pt < 18*integer(MTC_PT_MULT) then
            thr := 10;
        elsif pt < 15*integer(MTC_PT_MULT) then
            thr := 9;
        elsif pt < 12*integer(MTC_PT_MULT) then
            thr := 8;
        elsif pt < 10*integer(MTC_PT_MULT) then
            thr := 7;
        elsif pt < 9*integer(MTC_PT_MULT) then
            thr := 6;
        elsif pt < 8*integer(MTC_PT_MULT) then
            thr := 5;
        elsif pt < 7*integer(MTC_PT_MULT) then
            thr := 4;
        elsif pt < 6*integer(MTC_PT_MULT) then
            thr := 3;
        elsif pt < 5*integer(MTC_PT_MULT) then
            thr := 2;
        elsif pt < 4*integer(MTC_PT_MULT) then
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
