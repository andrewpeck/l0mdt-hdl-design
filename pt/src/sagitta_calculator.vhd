----------------------------------------------------------------------------------
-- Company: Max Planck Institut fuer Physik, Munich 
-- Engineer: Davide Cieri (davide.cieri@cern.ch)
-- 
-- Create Date: 30/04/2019 
-- Design Name: L0MDT Trigger
-- Module Name: Sagitta Calculator - Behavioral
-- Project Name: L0MDT Trigger
-- Target Devices: xcvu5p-flvb2104-2-e
-- Tool Versions: Vivado 2018.3
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE, pt_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use pt_lib.pt_pkg.all;

entity sagitta_calculator is
  port (
    clk : in std_logic;
    seg0 : in t_globalseg;
    seg1 : in t_globalseg;
    seg2 : in t_globalseg;
    inv_sagitta : out unsigned(inv_sagitta_width-1 downto 0);
    dv_sagitta : out std_logic
  );
end sagitta_calculator; -- sagitta_calculator

architecture Behavioral of sagitta_calculator is
    -- Valid signals
    signal dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9, dv10 : std_logic := '0';
    
    -- Constants for distance calculations
    constant delta_r_red_width : integer := r_glob_width- shift_m_den;
    
    -- Signals for distance calculation
    signal delta_z_20, delta_z_20_s, delta_z_20_ss, delta_z_10, delta_z_10_s, delta_z_10_ss, delta_z_10_sss : signed(z_glob_width-1 downto 0) := (others => '0');
    signal delta_r_10, delta_r_10_s, delta_r_10_ss, delta_r_10_sss, delta_r_10_ssss, delta_r_10_sssss : unsigned(r_glob_width-1 downto 0) := (others => '0');
    signal delta_r_20 : unsigned(delta_r_red_width-1 downto 0 ) := (others => '0');
    
    -- Constants for m_sagitta=deltaZ_20/deltaR_20 calculation
    constant m_sagitta_full_width : integer := divider_width+z_glob_width+m_sagitta_multi_width+3;
    
    -- Signals for m_sagitta=deltaZ_20/deltaR_20 calculation
    signal rec_den_m, rec_den_m_s : unsigned(divider_width-1 downto 0) := (others => '0');
    signal m_sagitta_full, m_sagitta_full_s : signed(m_sagitta_full_width-1 downto 0);
    signal m_sagitta : signed(m_sagitta_width-1 downto 0) := (others => '0');
    
    -- sqrt(1+m_sagitta^2)
    signal sqrt_m_io, sqrt_m_io_s, sqrt_m_io_ss, sqrt_m_io_sss : 
           unsigned(m_sagitta_width-1 downto 0) := (others => '0');
    
    -- m_sagitta*DeltaR_10 constants/signals
    constant den_sagitta_width : integer := m_sagitta_width + r_glob_width + 1;
    signal m_delta_r_10, den_sagitta : signed(den_sagitta_width-1 downto 0) := (others => '0');
    
    -- den_sagitta_red constants/signals
    constant shift_den_sagitta : integer := 17;
    constant den_sagitta_red_width : integer := den_sagitta_width - shift_den_sagitta;
    signal den_sagitta_red : signed(den_sagitta_red_width-1 downto 0) := (others => '0');
    signal rec_den_sagitta : unsigned(divider_width-1 downto 0) := (others => '0');


    -- m_mult*DeltaZ_10 constants/signals
    constant m_mult_delta_z_10_width : integer := m_sagitta_multi_width+2+z_glob_width;
    signal m_mult_delta_z_10, m_mult_delta_z_10_s, m_mult_delta_z_10_ss : 
           signed(m_mult_delta_z_10_width-1 downto 0) := (others => '0');

    -- inv sagitta full constants/signals
    constant inv_sagitta_full_width : integer := divider_width+ m_sagitta_width;
    constant shift_num_sagitta : integer := 20;
    signal inv_sagitta_full : unsigned(inv_sagitta_full_width-1 downto 0) := (others => '0');

begin
  


    SagittaProc : process( clk )
    begin
        if rising_edge(clk) then
            -- Clock 0
            dv0 <= (seg0.valid and seg1.valid and seg2.valid);
            delta_z_20 <= seg2.z_glob - seg0.z_glob;
            delta_z_10 <= seg1.z_glob - seg0.z_glob;
            delta_r_20 <= resize(shift_right(seg2.r_glob - seg0.r_glob, shift_m_den), delta_r_red_width);
            delta_r_10 <= seg1.r_glob - seg0.r_glob;

            -- Clock 1
            dv1 <= dv0;
            delta_z_20_s <= delta_z_20;
            delta_z_10_s <= delta_z_10;
            delta_r_10_s <= delta_r_10;
            rec_den_m <= reciprocalROM(to_integer(delta_r_20));

            -- Clock 2
            dv2 <= dv1;
            delta_z_10_ss <= delta_z_10_s;            
            delta_r_10_ss <= delta_r_10_s;
            rec_den_m_s <= rec_den_m;
            delta_z_20_ss <= delta_z_20_s;

            -- Clock 3
            dv3 <= dv2;  
            m_sagitta_full <= delta_z_20_ss*signed('0' & rec_den_m_s)*to_signed(integer(m_sagitta_multi),m_sagitta_multi_width+2);
            delta_z_10_sss <= delta_z_10_ss;            
            delta_r_10_sss <= delta_r_10_ss;

            -- Clock 4
            dv4 <= dv3;
            m_sagitta_full_s <= m_sagitta_full;
            m_mult_delta_z_10 <= to_signed(integer(m_sagitta_multi),m_sagitta_multi_width+2)*delta_z_10_sss;
            delta_r_10_ssss <= delta_r_10_sss;

            -- Clock 5
            dv5 <= dv4;
            m_sagitta <= resize(shift_right(m_sagitta_full_s, divider_width+shift_m_den), m_sagitta_width);
            delta_r_10_sssss <= delta_r_10_ssss;
            m_mult_delta_z_10_s <= m_mult_delta_z_10;


            -- Clock 6
            dv6 <= dv5;
            sqrt_m_io <= sqrt_m_io_ROM(to_integer(abs(m_sagitta)));
            --inv_m <= invsqrt_ROM(to_integer(abs(m_sagitta)));
            m_delta_r_10 <= signed('0' & delta_r_10_sssss)*m_sagitta;
            m_mult_delta_z_10_ss <= m_mult_delta_z_10_s;

            -- Clock 7
            dv7 <= dv6;
            sqrt_m_io_s <= sqrt_m_io;
            den_sagitta <= m_delta_r_10 - m_mult_delta_z_10_ss;

            -- Clock 8
            dv8 <= dv7;
            sqrt_m_io_ss <= sqrt_m_io_s;      
            den_sagitta_red <= resize(shift_right(den_sagitta, shift_den_sagitta),den_sagitta_red_width);  

            -- Clock 9
            dv9 <= dv8;
            sqrt_m_io_sss <= sqrt_m_io_ss;
            if to_integer(abs(den_sagitta_red)) < 2**16 then
                rec_den_sagitta <= reciprocalROM(to_integer(abs(den_sagitta_red)));
            else 
                rec_den_sagitta <= reciprocalROM(2**16 -1);
            end if;
            
            -- Clock 10
            dv10 <= dv9;
            inv_sagitta_full <= sqrt_m_io_sss*rec_den_sagitta;

            -- Clock 10
            dv_sagitta <= dv10;
            inv_sagitta <= resize(shift_right(inv_sagitta_full,divider_width+shift_den_sagitta-shift_num_sagitta), inv_sagitta_width);


        end if ;
    end process ; -- SagittaProc



end Behavioral;