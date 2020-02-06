----------------------------------------------------------------------------------
-- Company: Max Planck Institut For Physics Munich
-- Engineer: Davide Cieri
-- 
-- Create Date: 04/26/2019 15:57 AM
-- Design Name: L0 MDT Trigger  
-- Module Name: pt_calculator_top - Behavioral
-- Project Name: ATLAS L0MDT Trigger 
-- Target Devices: xcvu5p-flvb2104-2-e
-- Tool Versions: Vivado 2018.2
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
use pt_lib.pt_params_pkg.all;
use std.textio.all;
use ieee.std_logic_textio.all;

entity pt_calculator_top is
  Port ( 
    clk : in std_logic;
    i_segment_BI : in t_globalseg;
    i_segment_BM : in t_globalseg;
    i_segment_BO : in t_globalseg;
    i_rst        : in std_logic;
    o_pt_online  : out unsigned(pt_width-1 downto 0);
    o_pt_valid   : out std_logic
    );
end pt_calculator_top;

architecture Behavioral of pt_calculator_top is
    -- Online segments in global coordinates
    signal segment_BI, segment_BM, segment_BO : t_globalseg := null_globalseg;
    -- Chamber combo id
    signal comboid : unsigned(chamber_id_width*3 + 4 -1 downto 0) := (others => '0'); 
    --signal ram_index : integer := 0;
    -- Sagitta calculator signals
    signal dv_sagitta : std_logic := '0';
    signal inv_sagitta, inv_sagitta_s : unsigned(inv_sagitta_width-1 downto 0) := (others => '0');

    -- Data Valid signals
    signal dv_s, dv_phi, dv_eta : std_logic := '0';
    signal dv_s_s, dv_phi_s, dv_eta_s : std_logic := '0';
    -- Phi/Eta coordinate
    signal phi : signed(phi_width-1 downto 0) := (others => '0');
    signal eta : signed(eta_width-1 downto 0) := (others => '0');

    signal dbeta : signed(theta_glob_width-1 downto 0) := (others => '0');
    -- Signal for pT calculation
    signal pt_s, pt_s0, pt_s1, pt_s2, pt_s3 : signed(params_width+inv_sagitta_width downto 0) := (others => '0');
    signal pt_p, pt_p0, pt_p1 : signed(params_width+phi_width*2 -1  downto 0) := (others => '0');
    signal pt_e : signed(params_width+eta_width-1 downto 0) := (others => '0');
    --signal pt_b   : signed(pt_width-1 downto 0) := (others => '0');
    signal pt_online  :  signed(params_width+inv_sagitta_width downto 0) := (others => '0');
    signal pt_valid   :  std_logic := '0';



begin


    SagittaCalculator : entity pt_lib.sagitta_calculator
    port map(
        clk => clk,
        seg0 => segment_BI,
        seg1 => segment_BM, 
        seg2 => segment_BO,
        inv_sagitta => inv_sagitta,
        dv_sagitta => dv_sagitta
    );  

    pt_top_proc : process( clk )
    begin
        if rising_edge(clk) then

--            pt_s <= (others => '0');
--            pt_p <= (others => '0');
--            pt_e <= (others => '0');
            segment_BI <= null_globalseg;
            segment_BM <= null_globalseg;
            segment_BO <= null_globalseg;

            if i_segment_BI.valid = '1' and i_segment_BM.valid = '1' and i_segment_BO.valid = '1' then
               segment_BI <= i_segment_BI;
               segment_BM <= i_segment_BM;
               segment_BO <= i_segment_BO;
               comboid    <= "0000" & i_segment_BO.chamber_id & i_segment_BM.chamber_id & i_segment_BI.chamber_id;
            end if;

            if segment_BI.valid = '1' then
                phi  <= segment_BI.phi_glob;
                eta  <= segment_BI.eta_glob;
            end if;

            dv_s <= dv_sagitta;
            pt_s <= pt_parameter(comboid_to_index_ram(comboid)).a0 + pt_parameter(comboid_to_index_ram(comboid)).a1*signed('0' & inv_sagitta);
            
            dv_s_s <= dv_s;
            if dv_s = '1' then
                comboid <= to_unsigned(pt_bin(pt_s),4) & segment_BO.chamber_id & segment_BM.chamber_id & segment_BI.chamber_id;
            end if;
            pt_s0 <= pt_s;

            dv_phi <= dv_s_s;
            pt_p <= pt_parameter(comboid_to_index_ram(comboid)).b0 + pt_parameter(comboid_to_index_ram(comboid)).b1*phi +  pt_parameter(comboid_to_index_ram(comboid)).b2*phi*phi;
            pt_s1 <= pt_s0;
            
            dv_phi_s <= dv_phi;
            if dv_phi = '1' then
                comboid <= to_unsigned(pt_bin(pt_p),4) & segment_BO.chamber_id & segment_BM.chamber_id & segment_BI.chamber_id;
            end if;
            pt_p0 <= pt_p;
            pt_s2 <= pt_s1;
                       
            
            dv_eta <= dv_phi_s;
            pt_e <= pt_parameter(comboid_to_index_ram(comboid)).c0 + pt_parameter(comboid_to_index_ram(comboid)).c1*eta;
            pt_p1 <= pt_p1;
            pt_s3 <= pt_s2;

            pt_valid <= dv_eta;
            pt_online <= pt_s3 - pt_p1 - pt_e;
            
            o_pt_valid <= pt_valid;
            o_pt_online <= resize(unsigned(pt_online), pt_width);
        end if ;
    end process ; -- identifier

end Behavioral;

