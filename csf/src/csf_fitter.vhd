----------------------------------------------------------------------------------
-- Company: Max Planck Institut For Physics Munich
-- Engineer: Davide Cieri
-- 
-- Create Date: 02/12/2019 12:09:26 PM
-- Design Name: Compact Segment Finder  
-- Module Name: csf_fitter - Behavioral
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


library IEEE, csf_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use csf_lib.csf_pkg.all;

entity csf_fitter is
  Port ( 
  	clk 			: in std_logic;
  	i_hit1 			: in t_histo_hit;
  	i_hit2 			: in t_histo_hit;
  	o_mfit      	: out signed(mfit_width-1 downto 0);
    o_bfit      	: out signed(bfit_width-1 downto 0);
    o_fit_valid 	: out std_logic;
    o_nhits     	: out unsigned(num_hits_width-1 downto 0)
  	);
end csf_fitter;

architecture Behavioral of csf_fitter is
	

	-- Hits signals shifted
	signal hit1_s, hit2_s 			: t_histo_hit := null_histo_hit;
	-- Signal declaring last hits from Histograms
	signal finalhit : std_logic := '0';

	-- Summation signal widths
	constant SumXZ_width 			: integer := num_hits_width+x_width+z_width;
	constant SumZ_width  			: integer := num_hits_width+z_width;
	constant SumX_width 			: integer := num_hits_width+x_width;
	constant SumX2_width 			: integer := num_hits_width+x_width+x_width;

	-- Summation signals
	signal dsp_SumXZ,dsp_SumXZ_s 	: signed(SumXZ_width-1 downto 0) := (others => '0');
	signal dsp_SumZ ,dsp_SumZ_s 	: signed(SumZ_width-1 downto 0 ) := (others => '0');
	signal dsp_SumX ,dsp_SumX_s 	: unsigned(SumX_width-1 downto 0 ) := (others => '0');
	signal dsp_SumX2 ,dsp_SumX2_s 	: unsigned(SumX2_width-1 downto 0 ) := (others => '0');
	signal dsp_nhits,dsp_nhits_s 	: unsigned(num_hits_width-1 downto 0) := (others => '0');

	-- Numerator/Denominator widths
	constant NSumXZ_width 			: integer := SumXZ_width + num_hits_width + 1;
	constant SumZSumX_width 		: integer := SumZ_width  + SumX_width + 1;
	constant SumZSumX2_width		: integer := SumZ_width  + SumX2_width + 1;
	constant SumXZSumX_width        : integer := SumXZ_width + SumX_width + 1;
	constant SumXSumX_width         : integer := SumX_width*2;
	constant NSumX2_width 			: integer := num_hits_width + SumX2_width;
	constant num_m_width            : integer := NSumXZ_width;
	constant num_b_width			: integer := SumZSumX2_width;
	constant den_width 				: integer := NSumX2_width;

	-- Numerator/Denominator constants
	constant shift_num_m 			: integer := 15;
    constant shift_num_b 			: integer := 28;
    constant shift_den 				: integer := 22;
    constant reciprocal_width 		: integer := 22;
    constant b_over_z_multi_width : integer := integer(log2(bfit_mult/z_mult));

	-- Numerator/Denominator signals
<<<<<<< HEAD
	signal dsp_NSumXZ 	, dsp_NSumXZ_s, dsp_NSumXZ_ss		: signed(NSumXZ_width-1 downto 0) := (others => '0');
	signal dsp_SumZSumX , dsp_SumZSumX_s, dsp_SumZSumX_ss	: signed(SumZSumX_width-1 downto 0) := (others => '0');
	signal dsp_SumZSumX2, dsp_SumZSumX2_s,
		   dsp_SumZSumX2_ss 	: signed(SumZSumX2_width-1 downto 0 ) := (others => '0');
	signal dsp_SumXZSumX, dsp_SumXZSumX_s,
		   dsp_SumXZSumX_ss 	: signed(SumXZSumX_width-1 downto 0 ) := (others => '0');
	signal dsp_NSumX2 	, dsp_NSumX2_s, dsp_NSumX2_ss		: unsigned(NSumX2_width-1 downto 0 ) := (others => '0');
	signal dsp_SumXSumX , dsp_SumXSumX_s, dsp_SumXSumX_ss	: unsigned(SumXSumX_width-1 downto 0 ) := (others => '0');
=======
	signal dsp_NSumXZ 	, dsp_NSumXZ_s		: signed(NSumXZ_width-1 downto 0) := (others => '0');
	signal dsp_SumZSumX , dsp_SumZSumX_s	: signed(SumZSumX_width-1 downto 0) := (others => '0');
	signal dsp_SumZSumX2, dsp_SumZSumX2_s 	: signed(SumZSumX2_width-1 downto 0 ) := (others => '0');
	signal dsp_SumXZSumX, dsp_SumXZSumX_s 	: signed(SumXZSumX_width-1 downto 0 ) := (others => '0');
	signal dsp_NSumX2 	, dsp_NSumX2_s		: unsigned(NSumX2_width-1 downto 0 ) := (others => '0');
	signal dsp_SumXSumX , dsp_SumXSumX_s	: unsigned(SumXSumX_width-1 downto 0 ) := (others => '0');
>>>>>>> origin/master
	signal numerator_m      				: signed(num_m_width-1 downto 0) := (others => '0');
	signal numerator_b 						: signed(num_b_width-1 downto 0 ) := (others => '0');
	signal denominator      				: unsigned(den_width-1 downto 0 ) := (others => '0');
	signal numerator_m_red,numerator_m_red_s, numerator_m_red_ss: 
			signed(num_m_width-shift_num_m-1 downto 0):= (others => '0');
	signal numerator_b_red,numerator_b_red_s, numerator_b_red_ss: 
			signed(num_b_width-shift_num_b-1 downto 0 ) := (others => '0');
	signal denominator_red      			: unsigned(den_width-shift_den-1 downto 0 ) 
												:= (others => '0');
	signal reciprocal_addr                  : std_logic_vector(den_width-shift_den-1 downto 0 ) 
												:= (others => '0');
	signal reciprocal_den, reciprocal_den_s : signed(reciprocal_width downto 0) := (others => '0');

	-- Function storing all possible values of 1/den
	type t_reciprocalROM is array ( natural range <> ) of 
			std_logic_vector( reciprocal_width-1 downto 0 );
    function reciprocalROM return t_reciprocalROM is 
    	variable temp: t_reciprocalROM(2**16-1 downto 0) := (others => (others => '0'));
    begin
	    for k in 2 ** 16 - 1 downto 0 loop
	        temp( k ) := std_logic_vector( to_unsigned( integer( floor((( 2.0 ** reciprocal_width ))
	        / ( real( k ) + 0.5 ))), reciprocal_width ));
	    end loop;
    return temp;
    end function;

	-- Fit result widths
	constant mfit_full_width : integer := num_m_width-shift_num_m+reciprocal_width+1;
	constant bfit_full_width : integer := num_b_width-shift_num_b+reciprocal_width+1;

	-- Fit result signals
	signal mfit_full, mfit_full_s : signed(mfit_full_width-1 downto 0) := (others => '0');
	signal bfit_full, bfit_full_s : signed(bfit_full_width-1 downto 0) := (others => '0');

	-- DSP valid signals
	signal dsp_start, dsp_start_s 			: std_logic := '0';
    signal counter : integer := 0;
    signal startCounter : std_logic := '0';
<<<<<<< HEAD
	signal dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8, dv9 : std_logic := '0';
=======
	signal dv0, dv1, dv2, dv3, dv4, dv5, dv6, dv7, dv8 : std_logic := '0';
>>>>>>> origin/master
    signal event_valid : std_logic := '0';

begin

	Fitter : process( clk )
	begin
		if rising_edge(clk) then
			hit1_s <= i_hit1;
			hit2_s <= i_hit2;
            dsp_start <= '0';
            finalhit <= i_hit1.valid or i_hit2.valid;

            if i_hit1.valid = '1' and i_hit2.valid = '1' then
                event_valid <= '1';
            end if;
            
			if (hit1_s.valid = '1' or hit2_s.valid = '1') and event_valid = '1' then
				dsp_SumXZ <= dsp_SumXZ + signed('0' & hit1_s.x)*hit1_s.z +
							 signed('0' & hit2_s.x)*hit2_s.z;
				dsp_SumZ  <= dsp_SumZ + hit1_s.z + hit2_s.z;
				dsp_SumX  <= dsp_SumX + hit1_s.x + hit2_s.x;
				dsp_SumX2 <= dsp_SumX2 + hit1_s.x*hit1_s.x + hit2_s.x*hit2_s.x;
				dsp_nhits <= dsp_nhits + stdlogic_integer(hit1_s.valid) + 
							 stdlogic_integer(hit2_s.valid);
				startCounter <= '1';
			end if;
			
			if startCounter = '1' then
			   	counter <= counter + 1; 
				if counter = 8 or finalhit = '0' then
					dsp_start 	 <= '1';
					startCounter <= '0';
					counter 	 <= 0;
				end if;
			end if;

			-- Clock 0
			dv0 <= dsp_start;
			dsp_NSumXZ 		<= signed('0'& dsp_nhits)*dsp_SumXZ;
			dsp_SumZSumX 	<= dsp_SumZ*signed('0' & dsp_SumX);
			dsp_SumZSumX2 	<= dsp_SumZ*signed('0' & dsp_SumX2);
			dsp_SumXZSumX 	<= dsp_SumXZ*signed('0' & dsp_SumX);
			dsp_NSumX2 		<= dsp_nhits*dsp_SumX2;
			dsp_SumXSumX 	<= dsp_SumX*dsp_SumX;
			--end if;

			-- Clock 1
			dv1 <= dv0;
			dsp_NSumXZ_s 		<= dsp_NSumXZ 	;
			dsp_SumZSumX_s 		<= dsp_SumZSumX ;
			dsp_SumZSumX2_s 	<= dsp_SumZSumX2;
			dsp_SumXZSumX_s 	<= dsp_SumXZSumX;
			dsp_NSumX2_s 		<= dsp_NSumX2 	;
			dsp_SumXSumX_s 		<= dsp_SumXSumX ;

			-- Clock 2
			dv2 <= dv1;
<<<<<<< HEAD
			dsp_NSumXZ_ss 		<= dsp_NSumXZ_s 	;
			dsp_SumZSumX_ss 	<= dsp_SumZSumX_s ;
			dsp_SumZSumX2_ss 	<= dsp_SumZSumX2_s;
			dsp_SumXZSumX_ss 	<= dsp_SumXZSumX_s;
			dsp_NSumX2_ss 		<= dsp_NSumX2_s 	;
			dsp_SumXSumX_ss 	<= dsp_SumXSumX_s ;

			-- Clock 3
			dv3 <= dv2;
			numerator_m 		<= dsp_NSumXZ_ss - dsp_SumZSumX_ss;
			numerator_b 		<= dsp_SumZSumX2_ss - dsp_SumXZSumX_ss;
			denominator 		<= dsp_NSumX2_ss - dsp_SumXSumX_ss;

			-- Clock 4
			dv4 <= dv3;
=======
			numerator_m 		<= dsp_NSumXZ_s - dsp_SumZSumX_s;
			numerator_b 		<= dsp_SumZSumX2_s - dsp_SumXZSumX_s;
			denominator 		<= dsp_NSumX2_s - dsp_SumXSumX_s;

			-- Clock 3
			dv3 <= dv2;
>>>>>>> origin/master
			numerator_m_red 	<= resize(shift_right(numerator_m, shift_num_m),
									 num_m_width-shift_num_m);
			numerator_b_red 	<= resize(shift_right(numerator_b, shift_num_b), 
									 num_b_width-shift_num_b);
			denominator_red 	<= resize(shift_right(denominator, shift_den),   
									 den_width-shift_den);
<<<<<<< HEAD
			-- Clock 5
			dv5 <= dv4;
=======
			-- Clock 4
			dv4 <= dv3;
>>>>>>> origin/master
			reciprocal_addr	 	<= std_logic_vector(denominator_red);
			numerator_b_red_s 	<= numerator_b_red;
			numerator_m_red_s 	<= numerator_m_red;

<<<<<<< HEAD
			-- Clock 6
			dv6 <= dv5;
=======
			-- Clock 5
			dv5 <= dv4;
>>>>>>> origin/master
			reciprocal_den 		<= signed('0'&reciprocalROM(to_integer(unsigned(reciprocal_addr))));
			numerator_b_red_ss 	<= numerator_b_red_s;
			numerator_m_red_ss 	<= numerator_m_red_s;

<<<<<<< HEAD
			--Clock 7
			dv7 <= dv6;
			mfit_full 			<= numerator_m_red_ss*reciprocal_den;
			bfit_full 			<= numerator_b_red_ss*reciprocal_den;
			--Clock 8
			dv8 <= dv7;
			mfit_full_s 		<= mfit_full;
            bfit_full_s 		<= bfit_full;
            
			--Clock 9
			o_fit_valid <= dv8;
			dv9 	  <= dv8;
=======
			--Clock 6
			dv6 <= dv5;
			mfit_full 			<= numerator_m_red_ss*reciprocal_den;
			bfit_full 			<= numerator_b_red_ss*reciprocal_den;
			--Clock 7
			dv7 <= dv6;
			mfit_full_s 		<= mfit_full;
            bfit_full_s 		<= bfit_full;
            
			--Clock 8
			o_fit_valid <= dv7;
			dv8 	  <= dv7;
>>>>>>> origin/master
			o_mfit 				<= resize(shift_right(mfit_full_s, reciprocal_width + shift_den - 
												  shift_num_m - mfit_multi_width ), mfit_width);
			o_bfit 				<= resize(shift_right(bfit_full_s, reciprocal_width + shift_den - 
												  shift_num_b - b_over_z_multi_width ), bfit_width);
			o_nhits 				<= dsp_nhits;

			-- Reset
<<<<<<< HEAD
			if dv9 = '1' then
=======
			if dv8 = '1' then
>>>>>>> origin/master
				dsp_SumXZ <= (others => '0'); 
				dsp_SumZ  <= (others => '0'); 
				dsp_SumX  <= (others => '0'); 
				dsp_SumX2 <= (others => '0');
				dsp_nhits <= (others => '0');
				event_valid <= '0';
			end if;

		end if ;
	end process ; -- Fitter


end Behavioral;
