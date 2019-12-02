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


library IEEE, csf_lib;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.math_real.all;
use std.standard.all;
use csf_lib.csf_pkg.all;

package pt_pkg is

    constant z_ref : integer := integer(bfit_mult)*120;
    constant x_ref : integer := -40*integer(bfit_mult);

    constant theta_loc_width       : integer := mfit_width;
    constant theta_loc_mult        : real    := mfit_mult;
    constant theta_loc_multi_width : integer := mfit_multi_width;

    constant z_loc_width  : integer := bfit_width;
    constant roi_x_width  : integer := 15;
    constant z_glob_width : integer := 19;
    constant r_glob_width : integer := 20;

    constant sagitta_width : integer := 15;

    constant sagitta_mult        : real    := bfit_mult;
    constant sagitta_multi_width : integer := integer(log2(sagitta_mult));

    constant inv_tantheta_width : integer := 13;
    constant shift_m_den        : integer := 6;
    constant m_width            : integer := 16;


    constant shift_m_num      : integer := 14;
    constant divider_width    : integer := 25;
    constant theta_glob_width : integer := 15;
    constant halfpi           : integer := integer(floor(MATH_PI*theta_loc_mult));
    constant inv_sqrt_width   : integer := 22;
    constant dbeta_width      : integer := 12;
    constant pt_width         : integer := 14;
    constant pt_mult          : real    := 100.0;

    constant m_sagitta_width       : integer := 16;
    constant m_sagitta_range       : real    := 4.0;
    constant m_sagitta_multi       : real    := (2.0**m_sagitta_width/m_sagitta_range);
    constant m_sagitta_multi_width : integer := integer(log2(m_sagitta_multi));

    -- Root Chambers BIL2A01 BML1A01 BOL1A01 
    -- BIL2A01_BML1A01_BOL1A01  0   2.01613 435.824 -641.298    0   0   0   0.479175    -3.54889
    --BIL2A01_BML1A01_BOL1A01 1   2.01613 435.824 -641.298    0.469571    0.218046    -26.5705    0.479175    -3.54889
    --BIL2A01_BML1A01_BOL1A01 2   2.01613 435.824 -641.298    1.1976  -0.0936068  -49.9881    0.479175    -3.54889
    --BIL2A01_BML1A01_BOL1A01 3   2.01613 435.824 -641.298    1.91852 0.432545    -75.1609    0.479175    -3.54889
    --BIL2A01_BML1A01_BOL1A01 4   2.01613 435.824 -641.298    2.26763 0.350128    -95.3223    0.479175    -3.54889
    --BIL2A01_BML1A01_BOL1A01 5   2.01613 435.824 -641.298    2.4796  0.0784288   -121.482    0.479175    -3.54889
    --BIL2A01_BML1A01_BOL1A01 6   2.01613 435.824 -641.298    2.68737 -0.632937   -153.002    0.479175    -3.54889
    --BIL2A01_BML1A01_BOL1A01 7   2.01613 435.824 -641.298    2.40655 -0.651312   -179.273    0.479175    -3.54889
    --BIL2A01_BML1A01_BOL1A01 8   2.01613 435.824 -641.298    1.64225 -0.174712   -180.857    0.479175    -3.54889
    --BIL2A01_BML1A01_BOL1A01 9   2.01613 435.824 -641.298    1.10873 -1.87826    -147.191    0.479175    -3.54889
    --s_digi -1785 a0 64.51616 a1 892567.552 a2 -84056211.46 pt_sagitta 16.8125
    --phi_digi -3 b0 61.39264 b1 0.1297635 b2 -0.2113900312 pt_phi 1.846901226
    --eta_digi 204 c0 15.3336 c1 -0.0665416875 pt_eta 0.05497174219
    -- Sagitta params constants


    constant a0   : real := 2.01613*pt_mult;
    constant a1   : real := 435.824*pt_mult*sagitta_mult;
    constant a2   : real := -641.298*pt_mult*sagitta_mult*sagitta_mult;
    -- Phi params constants
    constant b0_0 : real := 0.0*pt_mult;
    constant b1_0 : real := 0.0*pt_mult/phi_mult;
    constant b2_0 : real := 0.0*pt_mult/(phi_mult**2);
    constant b0_1 : real := 0.469571*pt_mult;
    constant b1_1 : real := 0.218046*pt_mult/phi_mult;
    constant b2_1 : real := -26.5705*pt_mult/(phi_mult**2);

    constant b0_2 : real := 1.1976*pt_mult;
    constant b1_2 : real := -0.0936068*pt_mult/phi_mult;
    constant b2_2 : real := -49.9881*pt_mult/(phi_mult**2);
    constant b0_3 : real := 1.91852*pt_mult;
    constant b1_3 : real := 0.432545*pt_mult/phi_mult;
    constant b2_3 : real := -75.1609*pt_mult/(phi_mult**2);
    constant b0_4 : real := 2.26763*pt_mult;
    constant b1_4 : real := 0.350128*pt_mult/phi_mult;
    constant b2_4 : real := -95.3223*pt_mult/(phi_mult**2);
    constant b0_5 : real := 2.4796*pt_mult;
    constant b1_5 : real := 0.0784288*pt_mult/phi_mult;
    constant b2_5 : real := -121.482*pt_mult/(phi_mult**2);
    constant b0_6 : real := 2.68737*pt_mult;
    constant b1_6 : real := -0.632937*pt_mult/phi_mult;
    constant b2_6 : real := -153.002*pt_mult/(phi_mult**2);
    constant b0_7 : real := 2.40655*pt_mult;
    constant b1_7 : real := -0.651312*pt_mult/phi_mult;
    constant b2_7 : real := -179.273*pt_mult/(phi_mult**2);
    constant b0_8 : real := 1.64225*pt_mult;
    constant b1_8 : real := -0.174712*pt_mult/phi_mult;
    constant b2_8 : real := -180.857*pt_mult/(phi_mult**2);
    constant b0_9 : real := 1.10873*pt_mult;
    constant b1_9 : real := -1.87826*pt_mult/phi_mult;
    constant b2_9 : real := -147.191*pt_mult/(phi_mult**2);
    -- Eta params constants
    constant c0   : real := 0.479175*pt_mult;
    constant c1   : real := -3.54889*pt_mult/eta_mult;


    type t_roi is
    record
        valid      : std_logic;
        x_loc      : signed(roi_x_width-1 downto 0);
        z_glob     : signed(z_glob_width-1 downto 0);
        r_glob     : unsigned(r_glob_width-1 downto 0);
        chamber_id : unsigned(1 downto 0);
    end record;

    type t_globalseg is
    record
        valid      : std_logic;
        z_glob     : signed(z_glob_width-1 downto 0);
        r_glob     : unsigned(r_glob_width-1 downto 0);
        theta_glob : signed(theta_glob_width-1 downto 0);
        phi_glob   : signed(phi_width-1 downto 0);
        eta_glob   : signed(eta_width-1 downto 0);
    end record;

    constant null_roi       : t_roi       := ('0', (others => '0'), (others => '0'), (others => '0'), (others => '0'));
    constant null_globalseg : t_globalseg := ('0', (others => '0'), (others => '0'), (others => '0'), (others => '0'), (others => '0'));

    function vec_to_roi(vec : std_logic_vector) return t_roi;


    type t_m_to_theta is array(natural range <>) of signed(theta_loc_width-1 downto 0);
    function m_to_theta return t_m_to_theta;

    type t_inv_tantheta is array(natural range <>) of signed(inv_tantheta_width-1 downto 0);
    function inv_tantheta return t_inv_tantheta;

    type t_reciprocalROM is array (natural range <>) of unsigned(divider_width-1 downto 0);
    function reciprocalROM return t_reciprocalROM;

    type t_invsqrt_ROM is array (natural range <>) of unsigned(inv_sqrt_width-1 downto 0);
    function invsqrt_ROM return t_invsqrt_ROM;

    type t_pt_sagitta is array (natural range <>) of signed(pt_width downto 0);
    function pt_sagitta return t_pt_sagitta;

    type t_pt_phi_0 is array (natural range <>) of signed(pt_width downto 0);
    function pt_phi_0 return t_pt_phi_0;
    type t_pt_phi_1 is array (natural range <>) of signed(pt_width downto 0);
    function pt_phi_1 return t_pt_phi_1;
    type t_pt_phi_2 is array (natural range <>) of signed(pt_width downto 0);
    function pt_phi_2 return t_pt_phi_2;
    type t_pt_phi_3 is array (natural range <>) of signed(pt_width downto 0);
    function pt_phi_3 return t_pt_phi_3;
    type t_pt_phi_4 is array (natural range <>) of signed(pt_width downto 0);
    function pt_phi_4 return t_pt_phi_4;
    type t_pt_phi_5 is array (natural range <>) of signed(pt_width downto 0);
    function pt_phi_5 return t_pt_phi_5;
    type t_pt_phi_6 is array (natural range <>) of signed(pt_width downto 0);
    function pt_phi_6 return t_pt_phi_6;
    type t_pt_phi_7 is array (natural range <>) of signed(pt_width downto 0);
    function pt_phi_7 return t_pt_phi_7;
    type t_pt_phi_8 is array (natural range <>) of signed(pt_width downto 0);
    function pt_phi_8 return t_pt_phi_8;
    type t_pt_phi_9 is array (natural range <>) of signed(pt_width downto 0);
    function pt_phi_9 return t_pt_phi_9;

    type t_pt_eta is array (natural range <>) of signed(pt_width downto 0);
    function pt_eta return t_pt_eta;

    function pt_bin(pt : signed) return integer;

end;

package body pt_pkg is

    function vec_to_roi (vec : std_logic_vector) return t_roi is
        variable roi : t_roi := null_roi;
    begin
        roi.valid      := vec(60);
        roi.x_loc      := signed(vec(roi_x_width-1 downto 0));
        roi.r_glob     := unsigned(vec(roi_x_width+r_glob_width-1 downto roi_x_width));
        roi.z_glob     := signed(vec(roi_x_width+z_glob_width+r_glob_width-1 downto roi_x_width+r_glob_width));
        roi.chamber_id := unsigned(vec(roi_x_width+z_glob_width+r_glob_width+1 downto roi_x_width+z_glob_width+r_glob_width));
        return roi;
    end function vec_to_roi;

    function m_to_theta return t_m_to_theta is
        variable temp : t_m_to_theta(2**(mfit_width)-1 downto 0) := (others => (others => '0'));
        variable m    : real                                     := real(-2.0**(mfit_width-1));
    begin
        for k in 2**(mfit_width)-1 downto 0 loop
            m       := real(-2**(mfit_width-1)) + real(k);
            temp(k) := to_signed(integer(floor(ARCTAN(mfit_mult/(m+0.5))*theta_loc_mult)), theta_loc_width);
        end loop;
        return temp;
    end function;

    function inv_tantheta return t_inv_tantheta is
        variable temp  : t_inv_tantheta(2**(theta_loc_width)-1 downto 0) := (others => (others => '0'));
        variable theta : real                                            := real(-2**(theta_loc_width-1));
    begin
        for k in 2**(theta_loc_width)-1 downto 0 loop
            theta   := real(-2**(theta_loc_width-1) + k);
            temp(k) := to_signed(integer(floor((2.0**inv_tantheta_width)/(tan(theta/theta_loc_mult)+0.0001))), inv_tantheta_width);
        end loop;
        return temp;
    end function;

    function reciprocalROM return t_reciprocalROM is
        variable temp : t_reciprocalROM(2**(r_glob_width-shift_m_den)-1 downto 0) := (others => (others => '0'));

    begin
        for k in 2 ** (r_glob_width-shift_m_den) - 1 downto 0 loop
            temp(k) := to_unsigned(integer(floor(((2.0 ** divider_width)) / (real(k) + 0.5))), divider_width);
        end loop;

        return temp;
    end function;

    function invsqrt_ROM return t_invsqrt_ROM is
        variable temp : t_invsqrt_ROM(2**(16)-1 downto 0) := (others => (others => '0'));
    begin
        for k in 2**(16) -1 downto 0 loop
            temp(k) := to_unsigned(integer(floor(((2.0 ** inv_sqrt_width))/ sqrt(m_sagitta_multi**2 + real(k*k)))), inv_sqrt_width);
        end loop;
        return temp;
    end function;

    function pt_sagitta return t_pt_sagitta is
        variable temp : t_pt_sagitta(2**(sagitta_width-1)-1 downto 0) := (others => (others => '0'));
    begin
        for k in 2**(sagitta_width-1) -1 downto 0 loop
            temp(k) := to_signed(integer(floor(a0 + a1/(real(k)+0.5) + a2/((real(k)+0.5)*(real(k)+0.5)))), pt_width + 1);

        end loop;
        return temp;
    end function;

    function pt_phi_0 return t_pt_phi_0 is
        variable temp : t_pt_phi_0(2**(phi_width)-1 downto 0) := (others => (others => '0'));

        variable phi : real := 0.0;
    begin
        for k in 2**(phi_width) -1 downto 0 loop
            phi     := real(k) - 2.0**(phi_width-1);
            temp(k) := to_signed(integer(floor(b0_0 + b1_0*(phi) + b2_0*((phi)*(phi)))), pt_width + 1);

        end loop;
        return temp;
    end function;

    function pt_phi_1 return t_pt_phi_1 is
        variable temp : t_pt_phi_1(2**(phi_width)-1 downto 0) := (others => (others => '0'));
        variable phi  : real                                  := 0.0;
    begin
        for k in 2**(phi_width) -1 downto 0 loop
            phi     := real(k) - 2.0**(phi_width-1);
            temp(k) := to_signed(integer(floor(b0_1 + b1_1*(phi) + b2_1*((phi)*(phi)))), pt_width + 1);

        end loop;
        return temp;
    end function;

    function pt_phi_2 return t_pt_phi_2 is
        variable temp : t_pt_phi_2(2**(phi_width)-1 downto 0) := (others => (others => '0'));
        variable phi  : real                                  := 0.0;
    begin
        for k in 2**(phi_width) -1 downto 0 loop
            phi     := real(k) - 2.0**(phi_width-1);
            temp(k) := to_signed(integer(floor(b0_2 + b1_2*(phi) + b2_2*((phi)*(phi)))), pt_width + 1);

        end loop;
        return temp;
    end function;

    function pt_phi_3 return t_pt_phi_3 is
        variable temp : t_pt_phi_3(2**(phi_width)-1 downto 0) := (others => (others => '0'));
        variable phi  : real                                  := 0.0;
    begin
        for k in 2**(phi_width) -1 downto 0 loop
            phi     := real(k) - 2.0**(phi_width-1);
            temp(k) := to_signed(integer(floor(b0_3 + b1_3*(phi) + b2_3*((phi)*(phi)))), pt_width + 1);

        end loop;
        return temp;
    end function;

    function pt_phi_4 return t_pt_phi_4 is
        variable temp : t_pt_phi_4(2**(phi_width)-1 downto 0) := (others => (others => '0'));
        variable phi  : real                                  := 0.0;
    begin
        for k in 2**(phi_width) -1 downto 0 loop
            phi     := real(k) - 2.0**(phi_width-1);
            temp(k) := to_signed(integer(floor(b0_4 + b1_4*(phi) + b2_4*((phi)*(phi)))), pt_width + 1);

        end loop;
        return temp;
    end function;

    function pt_phi_5 return t_pt_phi_5 is
        variable temp : t_pt_phi_5(2**(phi_width)-1 downto 0) := (others => (others => '0'));
        variable phi  : real                                  := 0.0;
    begin
        for k in 2**(phi_width) -1 downto 0 loop
            phi     := real(k) - 2.0**(phi_width-1);
            temp(k) := to_signed(integer(floor(b0_5 + b1_5*(phi) + b2_5*((phi)*(phi)))), pt_width + 1);

        end loop;
        return temp;
    end function;

    function pt_phi_6 return t_pt_phi_6 is
        variable temp : t_pt_phi_6(2**(phi_width)-1 downto 0) := (others => (others => '0'));
        variable phi  : real                                  := 0.0;
    begin
        for k in 2**(phi_width) -1 downto 0 loop
            phi     := real(k) - 2.0**(phi_width-1);
            temp(k) := to_signed(integer(floor(b0_6 + b1_6*(phi) + b2_6*((phi)*(phi)))), pt_width + 1);

        end loop;
        return temp;
    end function;

    function pt_phi_7 return t_pt_phi_7 is
        variable temp : t_pt_phi_7(2**(phi_width)-1 downto 0) := (others => (others => '0'));
        variable phi  : real                                  := 0.0;
    begin
        for k in 2**(phi_width) -1 downto 0 loop
            phi     := real(k) - 2.0**(phi_width-1);
            temp(k) := to_signed(integer(floor(b0_7 + b1_7*(phi) + b2_7*((phi)*(phi)))), pt_width + 1);

        end loop;
        return temp;
    end function;

    function pt_phi_8 return t_pt_phi_8 is
        variable temp : t_pt_phi_8(2**(phi_width)-1 downto 0) := (others => (others => '0'));
        variable phi  : real                                  := 0.0;
    begin
        for k in 2**(phi_width) -1 downto 0 loop
            phi     := real(k) - 2.0**(phi_width-1);
            temp(k) := to_signed(integer(floor(b0_8 + b1_8*(phi) + b2_8*((phi)*(phi)))), pt_width + 1);

        end loop;
        return temp;
    end function;

    function pt_phi_9 return t_pt_phi_9 is
        variable temp : t_pt_phi_9(2**(phi_width)-1 downto 0) := (others => (others => '0'));
        variable phi  : real                                  := 0.0;
    begin
        for k in 2**(phi_width) -1 downto 0 loop
            phi     := real(k) - 2.0**(phi_width-1);
            temp(k) := to_signed(integer(floor(b0_9 + b1_9*(phi) + b2_9*((phi)*(phi)))), pt_width + 1);

        end loop;
        return temp;
    end function;

    function pt_eta return t_pt_eta is
        variable temp : t_pt_eta(2**(eta_width)-1 downto 0) := (others => (others => '0'));
        variable eta  : real                                := 0.0;
    begin
        for k in 2**(eta_width) -1 downto 0 loop
            eta     := real(k) - 2.0**(eta_width-1);
            temp(k) := to_signed(integer(floor(c0 + c1*real(eta))), pt_width + 1);

        end loop;
        return temp;
    end function;

    --function pt_dbeta_IO return t_pt_dbeta_IO is
    --    variable temp: t_pt_dbeta_IO(2**(dbeta_width)-1 downto 0) := (others => (others => '0'));
    --begin
    --    for k in 2**(dbeta_width-1) -1 downto 0 loop
    --        temp(k) := to_unsigned( integer( a0_IO + a1_IO/real(k) - a2_IO/(real(k)*real(k)) ), pt_width );

    --    end loop;
    --    return temp;
    --end function;

    --function pt_phi_IO return t_pt_phi_IO is
    --    variable temp: t_pt_phi_IO(2**(phi_width)-1 downto 0) := (others => (others => '0'));
    --begin
    --    for k in 2**(phi_width-1) -1 downto 0 loop
    --        temp(k) := to_unsigned( integer( b0_IO + b1_IO*real(k) - b2_IO*(real(k)*real(k)) ), pt_width );

    --    end loop;
    --    return temp;
    --end function;

    --function pt_eta_IO return t_pt_eta_IO is
    --    variable temp: t_pt_eta_IO(2**(eta_width)-1 downto 0) := (others => (others => '0'));
    --begin
    --    for k in 2**(eta_width-1) -1 downto 0 loop
    --        temp(k) := to_unsigned( integer( c0_IO + c1_IO*real(k) ), pt_width );
    --    end loop;
    --    return temp;
    --end function;


    --function pt_dbeta_IM return t_pt_dbeta_IM is
    --    variable temp: t_pt_dbeta_IM(2**(dbeta_width)-1 downto 0) := (others => (others => '0'));
    --begin
    --    for k in 2**(dbeta_width-1) -1 downto 0 loop
    --        temp(k) := to_unsigned( integer( a0_IM + a1_IM/real(k) - a2_IM/(real(k)*real(k)) ), pt_width );

    --    end loop;
    --    return temp;
    --end function;

    --function pt_phi_IM return t_pt_phi_IM is
    --    variable temp: t_pt_phi_IM(2**(phi_width)-1 downto 0) := (others => (others => '0'));
    --begin
    --    for k in 2**(phi_width-1) -1 downto 0 loop
    --        temp(k) := to_unsigned( integer( b0_IM + b1_IM*real(k) - b2_IM*(real(k)*real(k)) ), pt_width );

    --    end loop;
    --    return temp;
    --end function;

    --function pt_eta_IM return t_pt_eta_IM is
    --    variable temp: t_pt_eta_IM(2**(eta_width)-1 downto 0) := (others => (others => '0'));
    --begin
    --    for k in 2**(eta_width-1) -1 downto 0 loop
    --        temp(k) := to_unsigned( integer( c0_IM + c1_IM*real(k) ), pt_width );
    --    end loop;
    --    return temp;
    --end function;


    --function pt_dbeta_MO return t_pt_dbeta_MO is
    --    variable temp: t_pt_dbeta_MO(2**(dbeta_width)-1 downto 0) := (others => (others => '0'));
    --begin
    --    for k in 2**(dbeta_width-1) -1 downto 0 loop
    --        temp(k) := to_unsigned( integer( a0_MO + a1_MO/real(k)  + a2_MO/(real(k) *real(k) ) ), pt_width );
    --    end loop;
    --    return temp;
    --end function;

    --function pt_phi_MO return t_pt_phi_MO is
    --    variable temp: t_pt_phi_MO(2**(phi_width)-1 downto 0) := (others => (others => '0'));
    --begin
    --    for k in 2**(phi_width-1) -1 downto 0 loop
    --        temp(k) := to_unsigned( integer( b0_MO + b1_MO*real(k) - b2_MO*(real(k)*real(k)) ), pt_width );

    --    end loop;
    --    return temp;
    --end function;

    --function pt_eta_MO return t_pt_eta_MO is
    --    variable temp: t_pt_eta_MO(2**(eta_width)-1 downto 0) := (others => (others => '0'));
    --begin
    --    for k in 2**(eta_width-1) -1 downto 0 loop
    --        temp(k) := to_unsigned( integer( c0_MO + c1_MO*real(k) ), pt_width );
    --    end loop;
    --    return temp;
    --end function;

    function pt_bin(pt : signed) return integer is
        variable bin : integer := 0;
    begin
        if pt < 500 then
            bin := 0;
        elsif pt < 1000 then
            bin := 1;
        elsif pt < 1500 then
            bin := 2;
        elsif pt < 2000 then
            bin := 3;
        elsif pt < 2500 then
            bin := 4;
        elsif pt < 3000 then
            bin := 5;
        elsif pt < 3500 then
            bin := 6;
        elsif pt < 4000 then
            bin := 7;
        elsif pt < 4500 then
            bin := 8;
        else
            bin := 9;
        end if;
        return bin;
    end function;


end package body;
