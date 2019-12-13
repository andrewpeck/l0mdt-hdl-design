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

entity pt_calculator_top is
  Port ( 
    clk : in std_logic;
    i_segment_BI : in t_locseg;
    i_segment_BM : in t_locseg;
    i_segment_BO : in t_locseg;
    i_roi_BI     : in t_roi;
    i_roi_BM     : in t_roi;
    i_roi_BO     : in t_roi;
    i_rst        : in std_logic;
    o_pt_online  : out unsigned(pt_width-1 downto 0);
    o_pt_valid   : out std_logic
    );
end pt_calculator_top;

architecture Behavioral of pt_calculator_top is
    -- Online segments in local coordinates
    signal segment_BI, segment_BM, segment_BO : t_locseg := null_locseg;
    -- ROI segments in local coordinates
    signal roi_BI, roi_BM, roi_BO : t_roi := null_roi;
    -- Online segments in global coordinates
    signal seg0, seg1, seg2 : t_globalseg := null_globalseg;
    -- Sagitta calculator signals
    signal dv_sagitta : std_logic := '0';
    signal sagitta, sagitta_s : signed(sagitta_width-1 downto 0) := (others => '0');

    -- Data Valid signals
    signal dv_s, dv_phi, dv_eta : std_logic := '0';
    -- Phi/Eta coordinate
    signal phi : signed(phi_width-1 downto 0) := (others => '0');
    signal eta : signed(eta_width-1 downto 0) := (others => '0');

    signal dbeta : signed(theta_glob_width-1 downto 0) := (others => '0');
    -- Signal for pT calculation
    signal pt_s, pt_s_s : signed(pt_width downto 0) := (others => '0');
    signal pt_p : signed(pt_width downto 0) := (others => '0');
    signal pt_e : signed(pt_width downto 0) := (others => '0');
    --signal pt_b   : signed(pt_width-1 downto 0) := (others => '0');
    signal pt_online  :  unsigned(pt_width-1 downto 0) := (others => '0');
    signal pt_valid   :  std_logic := '0';

begin

    o_pt_online <= pt_online;
    o_pt_valid <= pt_valid;

    CoordTransfBI : entity work.seg_coord_transform 
    port map(
        clk => clk,
        seg => segment_BI,
        roi => roi_BI,
        globseg => seg0
    );

    CoordTransfBM : entity work.seg_coord_transform 
    port map(
        clk => clk,
        seg => segment_BM,
        roi => roi_BM,
        globseg => seg1
    );

    CoordTransfBO : entity work.seg_coord_transform 
    port map(
        clk => clk,
        seg => segment_BO,
        roi => roi_BO,
        globseg => seg2
    );

    SagittaCalculator : entity work.sagitta_calculator
    port map(
        clk => clk,
        seg0 => seg0,
        seg1 => seg1, 
        seg2 => seg2,
        sagitta => sagitta,
        dv_sagitta => dv_sagitta
    );  

    pt_top_proc : process( clk )
    begin
        if rising_edge(clk) then

            pt_s <= (others => '0');
            pt_p <= (others => '0');
            pt_e <= (others => '0');
            segment_BI <= null_locseg;
            segment_BM <= null_locseg;
            segment_BO <= null_locseg;
            roi_BI <= null_roi;
            roi_BM <= null_roi;
            roi_BO <= null_roi;

            if i_segment_BI.valid = '1' and i_segment_BM.valid = '1' and i_segment_BO.valid = '1' and 
               i_roi_BI.valid = '1' and i_roi_BM.valid = '1' and i_roi_BO.valid = '1' then
               segment_BI <= i_segment_BI;
               segment_BM <= i_segment_BM;
               segment_BO <= i_segment_BO;
               roi_BI <= i_roi_BI;
               roi_BM <= i_roi_BM;
               roi_BO <= i_roi_BO;
            end if;


            if seg0.valid = '1' then
                phi  <= seg0.phi_glob;
                eta  <= seg0.eta_glob;
            end if;

            --if dv_sagitta = '1' then

            dv_s <= dv_sagitta;
            if sagitta >= 0 then
                pt_s <= pt_sagitta(to_integer(sagitta));
                sagitta_s <= sagitta;
            else
                pt_s <= pt_sagitta(to_integer(-sagitta));
                sagitta_s <= -sagitta;
            end if;
--              pt_type <= 0;
                --pt_s <= pt_sagitta(to_integer(abs(sagitta)));
                --pt_p <= pt_phi(to_integer(abs(global_BI.phi_glob)));
                --pt_e <= pt_eta(to_integer(abs(global_BI.eta_glob)));
            --elsif dv_dbeta_BIBO = '1' then
            --  dv_s <= '1';
            --  pt_s <= pt_dbeta_IO(to_integer(abs(dbeta)));
            --  pt_type <= 1;
            --  --pt_p <= pt_phi_IO(to_integer(abs(global_BI.phi_glob)));
            --  --pt_e <= pt_eta_IO(to_integer(abs(global_BI.eta_glob)));
            --elsif dv_dbeta_BIBM = '1' then
            --  dv_s <= '1';
            --  pt_s <= pt_dbeta_IM(to_integer(abs(dbeta)));
            --  pt_type <= 2;

            --  --pt_p <= pt_phi_IM(to_integer(abs(global_BI.phi_glob)));
            --  --pt_e <= pt_eta_IM(to_integer(abs(global_BI.eta_glob)));
            --elsif dv_dbeta_BMBO = '1' then
            --  dv_s <= '1';
            --  pt_s <= pt_dbeta_MO(to_integer(abs(dbeta)));
            --  pt_type <= 3;

                --pt_p <= pt_phi_MO(to_integer(abs(global_BM.phi_glob)));
                --pt_e <= pt_eta_MO(to_integer(abs(global_BM.eta_glob)));
            -- end if;

            dv_phi <= dv_s;
            pt_e <= pt_eta(to_integer(eta) + 2**(eta_width-1));
            pt_s_s <= pt_s;
            
            if pt_bin(pt_s) = 0 then
                pt_p <= (others => '0');
            elsif pt_bin(pt_s) = 1 then
                pt_p <= pt_phi_1(to_integer(phi) + 2**(phi_width-1));
            elsif pt_bin(pt_s) = 2 then
                pt_p <= pt_phi_2(to_integer(phi) + 2**(phi_width-1));
            elsif pt_bin(pt_s) = 3 then
                pt_p <= pt_phi_3(to_integer(phi) + 2**(phi_width-1));
            elsif pt_bin(pt_s) = 4 then
                pt_p <= pt_phi_4(to_integer(phi) + 2**(phi_width-1));
            elsif pt_bin(pt_s) = 5 then
                pt_p <= pt_phi_5(to_integer(phi) + 2**(phi_width-1));
            elsif pt_bin(pt_s) = 6 then
                pt_p <= pt_phi_6(to_integer(phi) + 2**(phi_width-1));
            elsif pt_bin(pt_s) = 7 then
                pt_p <= pt_phi_7(to_integer(phi) + 2**(phi_width-1));
            elsif pt_bin(pt_s) = 8 then
                pt_p <= pt_phi_8(to_integer(phi) + 2**(phi_width-1));
            elsif pt_bin(pt_s) = 9 then
                pt_p <= pt_phi_9(to_integer(phi) + 2**(phi_width-1));
            end if;

            if dv_phi = '1' then
                pt_valid <= dv_phi;
                pt_online <= unsigned(resize(pt_s_s - pt_p - pt_e, pt_width));
            end if;

            if i_rst = '1' then
                pt_valid <= '0';
                pt_online <= (others => '0');
            end if;

        end if ;
    end process ; -- identifier

end Behavioral;

