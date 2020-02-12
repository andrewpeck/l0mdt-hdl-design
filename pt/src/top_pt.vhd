----------------------------------------------------------------------------------
-- Company: Max Planck Institut For Physics Munich
-- Engineer: Davide Cieri
-- 
-- Create Date: 04/26/2019 15:57 AM
-- Design Name: L0 MDT Trigger  
-- Module Name: top_pt - Behavioral
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

entity top_pt is
  Port ( 
    clk : in std_logic;
    i_segment_BI : in t_globalseg;
    i_segment_BM : in t_globalseg;
    i_segment_BO : in t_globalseg;
    i_rst        : in std_logic;
    o_pt_online  : out unsigned(pt_width-1 downto 0);
    o_pt_valid   : out std_logic
    );
end top_pt;

architecture Behavioral of top_pt is
    -- Online segments in global coordinates
    signal segment_BI, segment_BM, segment_BO : t_globalseg := null_globalseg;
    -- Chamber combo id
    signal comboid_s, comboid_phi, comboid_eta : unsigned(chamber_id_width*3 + 4 -1 downto 0) := (others => '0'); 
    --signal ram_index : integer := 0;
    -- Sagitta calculator signals
    signal dv_sagitta, dv_combo_s, dv_combo_s_s : std_logic := '0';
    signal inv_sagitta, inv_sagitta_s : unsigned(inv_sagitta_width-1 downto 0) := (others => '0');

    -- Data Valid signals
    signal dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9, dv10, dv11 : std_logic := '0';
    signal dv_a : std_logic := '0';
    -- Phi/Eta coordinate
    signal phi : signed(phi_width-1 downto 0) := (others => '0');
    signal eta : signed(eta_width-1 downto 0) := (others => '0');

    signal dbeta : signed(theta_glob_width-1 downto 0) := (others => '0');

    -- Signal for pT calculation
    -- Sagitta-dependent part
    signal a0, a0_s : std_logic_vector(a0_width-1 downto 0) := (others =>'0');
    signal a1 : std_logic_vector(a1_width-1 downto 0) := (others =>'0');
    signal a1_invsagitta : signed(a1_width+inv_sagitta_width downto 0) := (others => '0');
    signal pt_s, pt_s0, pt_s1, pt_s2, pt_s3, pt_s4 : signed(a1_width+inv_sagitta_width downto 0) := (others => '0');

    -- Phi-dependent part
    signal b0, b0_s : std_logic_vector(b0_width-1 downto 0) := (others => '0');
    signal b1 : std_logic_vector(b1_width-1 downto 0) := (others => '0');
    signal b1_phi, pt_phi_01 : signed(b1_width+phi_width-1 downto 0) := (others => '0');
    signal b2 : std_logic_vector(b2_width-1 downto 0) := (others => '0');
    signal b2_phi : signed(b2_width+phi_width-1 downto 0) := (others => '0');
    signal b2_phi2 : signed(b2_width+phi_width*2 -1  downto 0) := (others => '0');
    signal pt_p : signed(b2_width+phi_width*2 -1  downto 0) := (others => '0');
    signal pt_sp, pt_sp_s, pt_sp_ss, pt_sp_sss  : signed(a1_width+inv_sagitta_width downto 0) := (others => '0');

    -- Eta dependent part
    signal c0, c0_s : std_logic_vector(c0_width-1 downto 0) := (others => '0');
    signal c1 : std_logic_vector(c1_width-1 downto 0) := (others =>'0');
    signal c1_eta : signed(c1_width+eta_width-1 downto 0) := (others => '0');

    -- Final pt signals
    
    signal pt_online  :  signed(a1_width+inv_sagitta_width downto 0) := (others => '0');
    signal pt_valid   :  std_logic := '0';
    
    COMPONENT a0_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(a0_width-1 DOWNTO 0)
    );
    END COMPONENT;

    COMPONENT a1_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(a1_width-1 DOWNTO 0)
    );
    END COMPONENT;

    COMPONENT b0_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(b0_width-1 DOWNTO 0)
    );
    END COMPONENT;

    COMPONENT b1_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(b1_width-1 DOWNTO 0)
    );
    END COMPONENT;

    COMPONENT b2_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(b2_width-1 DOWNTO 0)
    );
    END COMPONENT;

    COMPONENT c0_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(c0_width-1 DOWNTO 0)
    );
    END COMPONENT;

    COMPONENT c1_ROM
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(params_depth_width-1 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(c1_width-1 DOWNTO 0)
    );
    END COMPONENT;


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
    
    getA0 : a0_ROM
    PORT MAP (
        clka => clk,
        ena => dv_combo_s,
        addra => comboid_to_index_ram(comboid_s),
        douta => a0
    );

    getA1 : a1_ROM
    PORT MAP (
        clka => clk,
        ena => dv_combo_s,
        addra => comboid_to_index_ram(comboid_s),
        douta => a1
    );

    getB0 : b0_ROM
    PORT MAP (
        clka => clk,
        ena => dv2,
        addra => comboid_to_index_ram(comboid_phi),
        douta => b0
    );

    getB1 : b1_ROM
    PORT MAP (
        clka => clk,
        ena => dv2,
        addra => comboid_to_index_ram(comboid_phi),
        douta => b1
    );

    getB2 : b2_ROM
    PORT MAP (
        clka => clk,
        ena => dv2,
        addra => comboid_to_index_ram(comboid_phi),
        douta => b2
    );

    getC0 : c0_ROM
    PORT MAP (
        clka => clk,
        ena => dv7,
        addra => comboid_to_index_ram(comboid_eta),
        douta => c0
    );

    getC1 : c1_ROM
    PORT MAP (
        clka => clk,
        ena => dv7,
        addra => comboid_to_index_ram(comboid_eta),
        douta => c1
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
               comboid_s    <= "0000" & i_segment_BO.chamber_id & i_segment_BM.chamber_id & i_segment_BI.chamber_id;
               dv_combo_s     <= '1';
            end if;

            if segment_BI.valid = '1' then
                phi  <= segment_BI.phi_glob;
                eta  <= segment_BI.eta_glob;
            end if;

            dv_combo_s_s <= dv_combo_s;
            -- <a> parameters are now valid
            dv_a <= dv_combo_s_s;

            dv0 <= dv_sagitta and dv_a;
            a0_s <= a0;
            a1_invsagitta <= signed(a1)*signed('0' & inv_sagitta);

            dv1  <= dv0;
            pt_s <= signed(a0_s) + a1_invsagitta;

            dv2 <= dv1;
            comboid_phi <= to_unsigned(pt_bin(pt_s),4) & segment_BO.chamber_id & segment_BM.chamber_id & segment_BI.chamber_id;
            pt_s0 <= pt_s;

            dv3 <= dv2;
            pt_s1 <= pt_s;

            -- <b> parameters now valid
            dv4 <= dv3;
            b1_phi <= signed(b1)*phi;
            b2_phi <= signed(b2)*phi;
            pt_s2 <= pt_s1 - signed(b0);

            dv5 <= dv4;
            b2_phi2 <= b2_phi*phi;
            pt_s3 <= pt_s2 - b1_phi;

            dv6 <= dv5;
            pt_sp <= pt_s3 - b2_phi2;

            dv7 <= dv6;
            comboid_eta <= to_unsigned(pt_bin(pt_sp),4) & segment_BO.chamber_id & segment_BM.chamber_id & segment_BI.chamber_id;
            pt_sp_s <= pt_sp;

            dv8 <= dv7;
            pt_sp_ss <= pt_sp_s;

            -- <c> parameters now valid
            dv9 <= dv8;
            pt_sp_sss <= pt_sp_s - signed(c0);
            c1_eta <= signed(c1)*eta;

            pt_valid <= dv9;
            pt_online <= pt_sp_sss - c1_eta;
            
            o_pt_valid <= pt_valid;
            o_pt_online <= resize(unsigned(pt_online), pt_width);
        end if ;
    end process ; -- identifier

end Behavioral;

