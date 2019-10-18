----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2018 09:19:30 AM
-- Design Name: 
-- Module Name: chi2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE, csf_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use csf_lib.csf_pkg.all;

entity csf_chi2 is
  port (
	clk            : in std_logic;
	i_hit1         : in t_histo_hit;
	i_hit2         : in t_histo_hit;
	i_mfit         : in signed(mfit_width-1 downto 0);
  	i_bfit         : in signed(bfit_width-1 downto 0);
    i_nhits        : in unsigned(3 downto 0);
  	i_fit_valid    : in std_logic;
    i_rst          : in std_logic;
  	o_seg          : out t_locseg
  );
end csf_chi2; -- csf_chi2

architecture Behavioral of csf_chi2 is
    -- Hit Buffer signals
	signal w_addr1, w_addr2                : std_logic_vector(max_hits_per_ml_width-1 downto 0) 
                                                := (others => '0');
	signal r_addr1, r_addr2                : std_logic_vector(max_hits_per_ml_width-1 downto 0) 
                                                := (others => '1');
	signal hit_vec1, hit_vec2              : std_logic_vector(histo_hit_width-1 downto 0) 
                                                := (others => '0');
    signal outhit1, outhit2                : t_histo_hit := null_histo_hit;

    -- MDT hit coordinate uncertainty
    constant sigma : real := 2.0;
    constant sigma_width : integer := integer(log2(sigma)); 

    -- Fit parameter signals
    signal mfit_s                          : signed(mfit_width-1 downto 0) := (others => '0');
    signal bfit_s                          : signed(bfit_width-1 downto 0) := (others => '0');

    -- Residual widths
    constant b_over_z_multi_width          : integer := integer(log2(bfit_mult/z_mult));
    constant b_red_width                   : integer := bfit_width-b_over_z_multi_width;
    constant mx_width                      : integer := mfit_width + x_width - mfit_multi_width + 1;
    constant res_width                     : integer := mx_width - sigma_width + chi2_mult_width/2;

    -- Residual signals
    signal b_red                           : signed(b_red_width-1 downto 0 ) := (others => '0');
    signal dsp_mx1, dsp_mx2                : signed(mx_width-1 downto 0) := (others => '0');
    signal dsp_b_z_1, dsp_b_z_2            : signed(z_width-1 downto 0  ) := (others => '0');
    signal dsp_res_1, dsp_res_2            : signed(res_width-1 downto 0 ) := (others => '0');
    signal dsp_res2_1, dsp_res2_2          : unsigned(chi2_width*2-1 downto 0 ) := (others => '0');

    -- other DSP signals
    signal dv0_1, dv0_2, dv1_1, dv1_2, dv2_1, dv2_2 : std_logic := '0';
    signal start_read                      : std_logic := '0';
    signal nhits_s                         : unsigned(num_hits_width-1 downto 0) 
                                                := (others => '0');
    signal dsp_chi                         : unsigned(chi2_width*2 - 1 downto 0) := (others => '0');
    signal counter                         : integer := 0;
    signal startCounter                    : std_logic := '0';
   
begin

    HitBuffer1 : entity csf_lib.bram_tdp
    generic map(
        ADDR => max_hits_per_ml_width,
        DATA => histo_hit_width,
        ram_type => "block"
        )
    port map(
        a_clk  => clk,
        a_wr   => i_hit1.valid,
        a_addr => w_addr1,
        a_din  => histo_hit_to_vec(i_hit1),
        b_clk  => clk,
        b_addr => r_addr1,
        b_dout => hit_vec1
    );

    HitBuffer2 : entity csf_lib.bram_tdp
    generic map(
        ADDR => max_hits_per_ml_width,
        DATA => histo_hit_width,
        ram_type => "block"
        )
    port map(
        a_clk  => clk,
        a_wr   => i_hit2.valid,
        a_addr => w_addr2,
        a_din  => histo_hit_to_vec(i_hit2),
        b_clk  => clk,
        b_addr => r_addr2,
        b_dout => hit_vec2
    );

    outhit1 <= vec_to_histo_hit(hit_vec1);
    outhit2 <= vec_to_histo_hit(hit_vec2);


    Chi2Proc : process( clk )
    begin
    	if rising_edge(clk) then
    		o_seg <= null_locseg;

            -- Store Hits into a RAM, waiting for the fit result
            if i_hit1.valid = '1' then
                w_addr1 <= std_logic_vector(unsigned(w_addr1) + 1);
            end if ;

            if i_hit2.valid = '1' then
                w_addr2 <= std_logic_vector(unsigned(w_addr2) + 1);
            end if;

            if i_fit_valid = '1' then
                mfit_s <= i_mfit;
                bfit_s <= i_bfit;
                nhits_s <= i_nhits;
                b_red <= resize(shift_right(i_bfit, b_over_z_multi_width), b_red_width);
                r_addr1 <= (others => '0');
                r_addr2 <= (others => '0');
                start_read <= '1';
            end if ;
    		
            if start_read = '1' then
                if unsigned(r_addr1) < unsigned(w_addr1) -1 then
                    r_addr1 <= std_logic_vector(unsigned(r_addr1) + 1);
                else
                    r_addr1 <= (others => '1');
                end if ;
                if unsigned(r_addr2) < unsigned(w_addr2) -1 then
                    r_addr2 <= std_logic_vector(unsigned(r_addr2) + 1);
                else
                    r_addr2 <= (others => '1');
                end if ;
            end if ;

            -- Clock 0
            dv0_1 <= outhit1.valid;
            dv0_2 <= outhit2.valid;  
            dsp_mx1 <= resize(shift_right(mfit_s*signed('0' & outhit1.x), mfit_multi_width), mx_width);
            dsp_mx2 <= resize(shift_right(mfit_s*signed('0' & outhit2.x), mfit_multi_width), mx_width);
            dsp_b_z_1  <= outhit1.z - b_red;
            dsp_b_z_2  <= outhit2.z - b_red;

            -- Clock 1
            dv1_1 <= dv0_1;
            dv1_2 <= dv0_2; 
            
            dsp_res_1  <= resize(shift_left(dsp_b_z_1 - dsp_mx1, chi2_mult_width/2-sigma_width), 
                                    res_width);
            dsp_res_2  <= resize(shift_left(dsp_b_z_2 - dsp_mx2, chi2_mult_width/2-sigma_width), 
                                    res_width);
            
            -- Clock 2
            dv2_1 <= dv1_1;
            dv2_2 <= dv1_2;
            dsp_res2_1 <= resize(unsigned(dsp_res_1*dsp_res_1), chi2_width*2);
            dsp_res2_2 <= resize(unsigned(dsp_res_2*dsp_res_2), chi2_width*2);

            -- Clock 3
            if dv2_1 = '1' and dv2_2 = '1' then
                dsp_chi <= dsp_chi + dsp_res2_1 + dsp_res2_2;
                startCounter <= '1';
            elsif dv2_1 = '1' then
                dsp_chi <= dsp_chi + dsp_res2_1;
                startCounter <= '1';
            elsif dv2_2 = '1' then
                dsp_chi <= dsp_chi + dsp_res2_2;
                startCounter <= '1';
            end if;
            
            if startCounter = '1' then
                counter <= counter+1;
            end if;

            if counter = 8 then
                counter <= 0;
                startCounter <= '0';
                o_seg.valid <= '1';
                o_seg.chi2 <= dsp_chi(chi2_width-1 downto 0);
                
                if dsp_chi > 2**chi2_width-1 then
                    o_seg.chi2 <= (others => '1');
                end if;
                o_seg.ndof <= nhits_s -2 ;
                o_seg.m <= mfit_s;
                o_seg.b <= bfit_s;
                
            end if;

            if i_rst = '1' then
                dsp_chi <= (others => '0');
                w_addr1 <= (others => '0');
                w_addr2 <= (others => '0');
                start_read <= '0';
            end if;
            
    	end if ;
    end process ; -- Chi2Proc



end Behavioral;