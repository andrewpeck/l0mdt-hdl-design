----------------------------------------------------------------------------------
-- Company: Max Planck Institute For Physics Munich
-- Engineer: Davide Cieri
-- 
-- Create Date: 02/08/2019 11:40:56 AM
-- Design Name: Compact Segment Finder - BIL chamber
-- Module Name: csf_pkg - Behavioral
-- Project Name: MDTL0 Trigger 
-- Target Devices: xcvu5p-flvb2104-2-e
-- Tool Versions: Vivado 2018.3
-- Description: Common package for CSF modules
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

package csf_pkg is
    ----------------------------------------------------------------------------
    -- Constants --

    -- MDT hit coordinates constants
    constant x_width                : integer := 16;
    constant x_mult                 : real    := 64.0;
    constant z_width                : integer := 18;
    constant z_mult                 : real    := 64.0;
    constant r_width                : integer := 10;
    constant r_mult                 : real    := 64.0;
    constant r_over_z_multi_width   : integer := integer(log2(r_mult/z_mult)); 
    -- RoI constants
    constant mbar_width             : integer := 11;
    constant mbar_multi             : real    := 1024.0;
    constant mbar_multi_width       : integer := integer(log2(mbar_multi));
    constant phi_width              : integer := 6;
    constant phi_range              : real    := 0.6; 
    constant phi_mult               : real    := real(2**phi_width)/phi_range;
    constant eta_width              : integer := 10;
    constant eta_range              : real    := 0.6;
    constant eta_mult               : real    := 2.0**eta_width/eta_range;
    -- CSF Histogram constants
    constant histo_hit_width        : integer := 1 + z_width + x_width;
    -- Output Segment constants
    constant mfit_width             : integer := 15;
    constant mfit_mult              : real    := 4096.0;
    constant mfit_multi_width       : integer := integer(log2(mfit_mult)); 
    constant bfit_width             : integer := 15;
    constant bfit_mult              : real    := 64.0;
    constant chi2_width             : integer := 15;
    constant chi2_mult              : real    := 4.0;
    constant chi2_mult_width        : integer := integer(log2(chi2_mult)); 

    -- Number of fitter module to instantiate
    constant num_fitters            : integer := 4;
    -- Generic constants
    constant max_hits_per_segment   : real    := 16.0;
    constant num_hits_width         : integer := integer(log2(max_hits_per_segment));
    constant max_hits_per_ml_width  : integer := num_hits_width-1;

    ----------------------------------------------------------------------------
    -- Records --
    
    -- CSF Input Seed from SL
    type t_seed is
    record
        valid                       : std_logic;
        mbar                        : unsigned(mbar_width-1 downto 0);
        chamber_id                  : unsigned(1 downto 0);
    end record;

    -- MDT hit record    
    type t_mdt_hit is  
    record 
        valid                       : std_logic;
        z                           : signed(z_width-1 downto 0);
        x                           : unsigned(x_width-1 downto 0);
        multilayer                  : std_logic;
        r                           : unsigned(r_width-1 downto 0);
        chamber_id                  : unsigned(1 downto 0);
        eof                         : std_logic;
    end record;

    -- MDT hit in histogram maxima record
    type t_histo_hit is  
    record 
        valid                       : std_logic;
        z                           : signed(z_width-1 downto 0);
        x                           : unsigned(x_width-1 downto 0);
    end record;

    -- Output Segment in local coordinates
    type t_locseg is  
    record 
        valid                       : std_logic;
        b                           : signed(bfit_width-1 downto 0);
        m                           : signed(mfit_width-1 downto 0);
        chi2                        : unsigned(chi2_width-1 downto 0);
        ndof                        : unsigned(num_hits_width-1 downto 0);
        phi                         : signed(phi_width-1 downto 0);
        eta                         : signed(eta_width-1 downto 0);
    end record;

    constant null_locseg            : t_locseg    := ('0', (others => '0'), (others => '0'), 
        (others => '0'), (others => '0'), (others => '0'), (others => '0'));
    constant null_seed               : t_seed       := ('0', (others => '0'), (others => '0'));
    constant null_mdt_hit           : t_mdt_hit   := ('0', (others => '0'), (others => '0'), '0', 
        (others => '0'), (others => '0'), '0');
    constant null_histo_hit         : t_histo_hit := ('0', (others => '0'), (others => '0'));

    type t_locsegs is array(natural range <> ) of t_locseg;

    ----------------------------------------------------------------------------
    -- Functions --   
    -- Convert a std_logic_vector to MDT hit type
    function vec_to_mdthit ( vec : std_logic_vector )    return t_mdt_hit;
    -- Convert a histo hit type to a std_logic_vector
    function histo_hit_to_vec ( hit : t_histo_hit)       return std_logic_vector;
    -- Convert a std_logic_vector to a histo hit type
    function vec_to_histo_hit ( vec : std_logic_vector ) return t_histo_hit;
    -- Convert a std_logic_vector to a CSF Input seed type
    function vec_to_seed  ( vec : std_logic_vector )     return t_seed;
    -- Convert vec to localseg
    function vec_to_locseg(vec : std_logic_vector) return t_locseg;
    -- Convert std_logic to integer
    function stdlogic_integer( s : std_logic ) return integer ;



end;

package body csf_pkg is

    function histo_hit_to_vec ( hit : t_histo_hit) return std_logic_vector is
        variable vec : std_logic_vector(histo_hit_width-1 downto 0) := (others => '0');
    begin
        vec := hit.valid & std_logic_vector(hit.z) & std_logic_vector(hit.x);
        return vec;
    end function;

    function vec_to_histo_hit ( vec : std_logic_vector ) return t_histo_hit is
        variable hit : t_histo_hit := null_histo_hit;
    begin
        hit.valid := vec(histo_hit_width-1);
        hit.x := unsigned(vec(x_width-1 downto 0));
        hit.z := signed(vec(x_width+z_width-1 downto x_width));
        return hit;
    end function;

    function vec_to_mdthit ( vec : std_logic_vector ) return t_mdt_hit is
        variable hit : t_mdt_hit := null_mdt_hit;
    begin
        hit.valid := vec(63);
        hit.eof   := vec(62);
        hit.x := unsigned(vec(x_width-1 downto 0));
        hit.z := signed(vec(x_width+z_width-1 downto x_width));
        hit.r := unsigned(vec(r_width+x_width+z_width-1 downto x_width+z_width));
        hit.multilayer := vec(r_width+x_width+z_width);
        hit.chamber_id := unsigned(vec(r_width+x_width+z_width+2 downto r_width+x_width+z_width+1));
        return hit;
    end function;

    function vec_to_seed (vec : std_logic_vector) return t_seed is
        variable seed : t_seed := null_seed;
    begin
        seed.valid := vec(61);
        seed.mbar := unsigned(vec(mbar_width-1 downto 0));
        return seed;
    end function vec_to_seed ;

    function vec_to_locseg (vec : std_logic_vector) return t_locseg is
        variable seg : t_locseg := null_locseg;
    begin
        seg.valid := vec(63);
        seg.b := signed(vec(bfit_width-1 downto 0));
        seg.m := signed(vec(mfit_width+bfit_width-1 downto bfit_width));
        seg.phi := signed(vec(phi_width+mfit_width+bfit_width-1 downto bfit_width+mfit_width));
        seg.eta := signed(vec(eta_width+phi_width+mfit_width+bfit_width-1 downto phi_width+bfit_width+mfit_width));
        return seg;
    end function vec_to_locseg;

    function stdlogic_integer( s : std_logic ) return integer is
    begin
        if s = '1' then
            return 1;
        else
            return 0;
        end if;
    end function;

end package body;
