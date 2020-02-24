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

library IEEE, pt_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use std.standard.all;
use std.textio.all;

package pt_pkg is

    -- Segment parameters in global coordinates
    constant theta_glob_width       : integer := 15;
    constant theta_glob_mult        : real := 4096.0;
    constant theta_glob_multi_width : integer := integer(log2(theta_glob_mult));
    constant z_glob_width           : integer := 19;
    constant r_glob_width           : integer := 19;
    constant chamber_id_width       : integer := 3;
    constant phi_width              : integer := 6;
    constant phi_range              : real    := 0.6; 
    constant phi_mult               : real    := real(2**phi_width)/phi_range;
    constant eta_width              : integer := 10;
    constant eta_range              : real    := 0.6;
    constant eta_mult               : real    := 2.0**eta_width/eta_range;
    
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

    constant halfpi : integer := integer(floor(MATH_PI*theta_glob_mult));
    constant inv_sqrt_width : integer := 22;
    constant dbeta_width : integer := 16;
    constant pt_width : integer := 14;
    constant pt_mult : real := 100.0;
   
    type t_globalseg is
    record
        valid      : std_logic;
        z_glob     : signed(z_glob_width-1 downto 0);
        r_glob     : unsigned(r_glob_width-1 downto 0);
        theta_glob : signed(theta_glob_width-1 downto 0);
        phi_glob   : signed(phi_width-1 downto 0);
        eta_glob   : signed(eta_width-1 downto 0);
        chamber_id : unsigned(chamber_id_width-1 downto 0);
    end record;

    constant null_globalseg : t_globalseg := ('0', (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'));

    type t_reciprocalROM is array ( natural range <> ) of unsigned( divider_width-1 downto 0 );
    function reciprocalROM return t_reciprocalROM;

    type t_sqrt_m_io_ROM is array(natural range <> ) of unsigned(m_sagitta_width -1 downto 0);
    function sqrt_m_io_ROM return t_sqrt_m_io_ROM;

    type t_invsqrt_ROM is array ( natural range <> ) of unsigned(inv_sqrt_width-1 downto 0);
    function invsqrt_ROM return t_invsqrt_ROM;


    function pt_bin(pt : signed) return unsigned;

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

    
    
    



end package body;
