----------------------------------------------------------------------------------
-- Company: Max Planck Institut For Physics Munich
-- Engineer: Davide Cieri
-- 
-- Create Date: 02/08/2019 11:35:01 AM
-- Design Name: Compact Segment Finder
-- Module Name: csf_histogram - Behavioral
-- Project Name: ATLAS L0MDT Trigger 
-- Target Devices: xcvu5p-flvb2104-2-e
-- Tool Versions: Vivado 2018.2
-- Description: Histogramming method of the compact segment finder
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE, csf_lib, shared_lib;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.math_real.all;
use csf_lib.csf_pkg.all;

entity csf_histogram is
  Port (
    clk             : in std_logic;
    i_mdthit        : in t_mdt_hit;
    i_seed          : in t_seed;
    i_eof           : in std_logic;
    o_histo_hit0    : out t_histo_hit;
    o_histo_hit1    : out t_histo_hit
  );
end csf_histogram;

architecture Behavioral of csf_histogram is
    -- Histogram parameters
    constant histo_full_width                       : integer := 21;
    constant histo_width                            : integer := 6;
    constant max_hits_per_bin                       : real    := 8.0;
    constant bin_depth                              : integer := integer(log2(max_hits_per_bin));
    constant inv_sqrt_m_width                       : integer := 18;
    constant squ_m_width                            : integer := mbar_width;

    -- Signals for seed information 
    signal mbar                                     : signed(mbar_width-1 downto 0) 
        := (others => '0');
    signal squ_m                                    : std_logic_vector(squ_m_width-1 downto 0) 
        := (others => '0');
    signal invsqu_m                                 : std_logic_vector(inv_sqrt_m_width-1 downto 0) 
        := (others => '0');
    signal rom_en : std_logic := '0';

    -- ROM storing all possible values of 1/sqrt(1+m^2)
    COMPONENT invsqrt_mbar_rom
    PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
    );
    END COMPONENT;
    
    
--    type t_invsqrt_ROM is array ( natural range <> ) of unsigned(inv_sqrt_m_width-1 downto 0);
--    function invsqrt_ROM return t_invsqrt_ROM is 
--        variable temp : t_invsqrt_ROM(2**(mbar_width)-1 downto 0) := (others => (others => '0'));
--    begin
--        for k in 2**(mbar_width) -1 downto 0 loop
--            temp(k) := to_unsigned(integer(floor( (( 2.0 ** inv_sqrt_m_width  ) ) / 
--                sqrt( mbar_multi*mbar_multi + real(k*k) ) )), inv_sqrt_m_width);
--        end loop;
--        return temp;
--    end function;

    -- ROM storing all possible values of sqrt(1+m^2)
    COMPONENT sqrt_mbar_rom
    PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
    END COMPONENT;
    
--    type t_sqrt_ROM is array ( natural range <> ) of unsigned(mbar_width downto 0);
--    function sqrt_ROM return t_sqrt_ROM is
--        variable temp : t_sqrt_ROM(2**(mbar_width) -1 downto 0) := (others => (others => '0'));
--    begin   
--        for k in 2**(mbar_width) -1 downto 0 loop
--            temp(k) := to_unsigned(integer(floor(sqrt(mbar_multi*mbar_multi + real(k*k))))
--                , mbar_width);
--        end loop;
--        return temp;
--    end function;


    -- MDT hit signals
    signal mdt_hit_s, mdt_hit_ss, mdt_hit_sss, mdt_hit_ssss : t_mdt_hit := null_mdt_hit;
    -- Constants for b+/- calculation
    constant squ_m_r_width                             : integer := squ_m_width + r_width;
    constant m_x_width                                 : integer := mbar_width + x_width + 1;

    constant z_m_width                                 : integer := z_width     + mbar_width + 1;
    constant m_x_z_m_width                             : integer := z_m_width;


    -- DSP signals for b+/- calculation
    signal dsp_squ_m_r, dsp_squ_m_r_s                  : unsigned(squ_m_r_width-1 downto 0) 
        := (others => '0');
    signal dsp_m_x                                     : signed(m_x_width-1 downto 0) 
        := (others => '0');
    signal dsp_z_m_multi                               : signed(z_m_width-1 downto 0) 
        := (others => '0');
    signal dsp_m_x_z_multi                             : signed(m_x_z_m_width-1 downto 0) 
        := (others =>'0');
    signal bplus_full, bminus_full                     : signed(z_m_width-1 downto 0 ) 
        := (others => '0');
    signal bplus, bminus                               : signed(histo_width+1 downto 0)       
        := (others => '0');
    signal bplus_s, bminus_s, 
           bplus_ss, bminus_ss, 
           bplus_sss, bminus_sss                       : unsigned(histo_width-1 downto 0) 
        := (others => '0');

    -- Data Valid signals
    signal dv0, dv1, dv2, dv3, dv4, dv5, dv6           : std_logic := '0';
    signal eof0, eof1, eof2, eof3, eof4, eof5, eof6, eof7, eof8 : std_logic := '0';

    -- Signals for histogram bins
    type t_address_histo is array (natural range <>) of std_logic_vector(bin_depth-1 downto 0);
    signal w_addr                                     : t_address_histo(2**histo_width-1 downto 0) 
        := (others => (others => '0'));
    signal r_addr                                     : t_address_histo(2**histo_width-1 downto 0) 
        := (others => (others => '1'));
    signal w_en                                       : std_logic_vector(2**histo_width-1 downto 0) 
        := (others => '0');

    -- Histogram hit signals
    type t_hit_vectors is array (natural range <>) of std_logic_vector(histo_hit_width-1 downto 0);
    signal hit_plus, hit_minus                        : t_histo_hit := null_histo_hit;
    signal hit_plus_s, hit_minus_s                    : t_histo_hit := null_histo_hit;
    
    signal w_hit_vec, r_hit_vec                       : t_hit_vectors(2**histo_width-1 downto 0) 
        := (others => (others => '0'));

    -- Delta_x, Delta_y constants
    constant m_inv_squ_m_width                          : integer := mbar_width + inv_sqrt_m_width +1;
    constant m_multi_inv_squ_m_width                    : integer := m_inv_squ_m_width + 1;
    constant delta_z_full_width                         : integer 
        := m_multi_inv_squ_m_width + r_width + 1;
    constant delta_x_full_width                         : integer 
        := mbar_width + inv_sqrt_m_width + r_width + 2;

    -- Signals for Delta_x, Delta_z to calculate exact hit coordinate
    signal dsp_m_inv_squ_m, dsp_m_inv_squ_m_s         : signed(m_inv_squ_m_width-1 downto 0) 
        := (others => '0');
    signal dsp_m_multi_inv_squ_m                      : unsigned(m_multi_inv_squ_m_width-1 downto 0) 
        := (others => '0');
    signal delta_z_full, delta_z_full_s               : signed(delta_z_full_width-1 downto 0) 
        := (others => '0');
    signal delta_x_full, delta_x_full_s               : signed(delta_x_full_width-1 downto 0) 
        := (others => '0');
    signal delta_x, delta_x_s, delta_x_ss             : unsigned(x_width-1 downto 0) 
        := (others => '0');
    signal delta_z, delta_z_s, delta_z_ss             : signed(z_width-1 downto 0) 
        := (others => '0');
  
    -- Signals for maximum identification
    signal max_counter_1, max_counter_2, 
           counter_plus, counter_minus                : std_logic_vector(bin_depth-1 downto 0) 
        := (others => '0');
    signal max_bin1, max_bin2, max_bin1_s, max_bin2_s : unsigned(histo_width-1 downto 0) 
        := (others => '0');
    signal has_max                                    : std_logic := '0';

    -- Signals to extract hits in maxima
    signal start_read, start_read0, start_read1       : std_logic := '0';
    
    signal addr : std_logic_vector(11 downto 0) := std_logic_vector(to_unsigned(50,12));
    
begin

    invsqrt_mbar : invsqrt_mbar_rom
    PORT MAP (
        clka => clk,
        addra => std_logic_vector(abs(mbar)),
        douta => invsqu_m
    );
    
    sqrt_mbar : sqrt_mbar_rom
    PORT MAP (
        clka => clk,
        addra => std_logic_vector(abs(mbar)),
        douta => squ_m
    );

    BinRAMs: for k in 2**histo_width-1 downto 0 generate 
    begin
    Bin : entity shared_lib.bram_tdp
    generic map(
        ADDR => bin_depth,
        DATA => histo_hit_width,
        ram_type => "distributed"
        )
    port map(
        a_clk  => clk,
        a_wr   => w_en(k),
        a_addr => w_addr(k),
        a_din  => w_hit_vec(k),
        b_clk  => clk,
        b_addr => r_addr(k),
        b_dout => r_hit_vec(k)
    );
    end generate;

    processor : process(clk)
    begin
        if rising_edge(clk) then
            o_histo_hit0 <= null_histo_hit;
            o_histo_hit1 <= null_histo_hit;
                    
            if i_seed.valid = '1' then
                mbar <= i_seed.mbar;
                rom_en <= i_seed.valid;
            end if;
    
            -- Clock 0
            dv0   <= i_mdthit.valid;
            dsp_squ_m_r <= shift_right(unsigned(squ_m)*i_mdthit.r,r_over_z_multi_width); 
            dsp_m_x <= mbar*signed('0' & i_mdthit.x); 
            dsp_z_m_multi <= resize(i_mdthit.z*integer(mbar_multi), z_m_width );
            dsp_m_inv_squ_m <= mbar*signed('0' & invsqu_m);
            dsp_m_multi_inv_squ_m <= resize(unsigned(invsqu_m)*integer(mbar_multi),
                                     m_multi_inv_squ_m_width);
            mdt_hit_s <= i_mdthit;
            eof0 <= i_eof;

            -- Clock 1
            dv1 <= dv0;
            dsp_m_x_z_multi <= dsp_m_x - dsp_z_m_multi;
            dsp_squ_m_r_s <= dsp_squ_m_r;
            mdt_hit_ss <= mdt_hit_s;
            dsp_m_inv_squ_m_s <= dsp_m_inv_squ_m;
            delta_z_full <= signed('0' & (dsp_m_multi_inv_squ_m * mdt_hit_s.r));
            eof1 <= eof0;

            -- Clock 2
            dv2 <= dv1;
            bplus_full <= signed('0' & dsp_squ_m_r_s) - dsp_m_x_z_multi;
            bminus_full <= -signed('0' & dsp_squ_m_r_s) - dsp_m_x_z_multi;
            delta_x_full_s <= dsp_m_inv_squ_m_s*signed('0' & mdt_hit_ss.r);
            delta_z_full_s <= delta_z_full;
            eof2 <= eof1;
            mdt_hit_sss <= mdt_hit_ss;

            -- Clock 3
            dv3 <= dv2;
            bplus <= resize(shift_right(bplus_full, histo_full_width - histo_width ), 
                histo_width+2 );
            bminus <= resize(shift_right(bminus_full, histo_full_width - histo_width ), 
                histo_width+2 );
            delta_x <= resize(shift_right(unsigned(abs(delta_x_full_s)), r_over_z_multi_width + inv_sqrt_m_width), x_width);
            delta_z <= resize(shift_right(delta_z_full_s, r_over_z_multi_width + inv_sqrt_m_width), z_width);
            mdt_hit_ssss <= mdt_hit_sss;
            eof3 <= eof2;

            -- Clock 4
            dv4 <= dv3;
            bplus_s <= unsigned(bplus(histo_width-1 downto 0));
            bminus_s <= unsigned(bminus(histo_width-1 downto 0));

            hit_plus.valid <= dv3;
            hit_minus.valid <= dv3;
                
            hit_plus.x <= mdt_hit_ssss.x - delta_x;
            hit_minus.x <= mdt_hit_ssss.x + delta_x;
            hit_plus.z <= mdt_hit_ssss.z + delta_z;
            hit_minus.z <= mdt_hit_ssss.z - delta_z;
            eof4 <= eof3;     

            -- Clock 5
            dv5 <= dv4;
            w_en <= (others => '0');
            w_en(to_integer(bminus_s)) <= dv4;                    
            w_hit_vec(to_integer(bminus_s)) <= histo_hit_to_vec(hit_minus);
            w_en(to_integer(bplus_s)) <= dv4;
            w_hit_vec(to_integer(bplus_s)) <= histo_hit_to_vec(hit_plus);
            bplus_ss <= bplus_s;
            bminus_ss <= bminus_s;
            eof5 <= eof4;
            
            -- Clock 6
            if dv5 = '1' then
                w_addr(to_integer(bplus_ss)) <= 
                    std_logic_vector(unsigned(w_addr(to_integer(bplus_ss))) + 1);
                w_addr(to_integer(bminus_ss)) <= 
                    std_logic_vector(unsigned(w_addr(to_integer(bminus_ss))) + 1);
                counter_plus <= std_logic_vector(unsigned(w_addr(to_integer(bplus_ss))) + 1);
                counter_minus <= std_logic_vector(unsigned(w_addr(to_integer(bminus_ss))) + 1);                              
            end if;
            dv6 <= dv5;
            eof6 <= eof5;

            bplus_sss <= bplus_ss;
            bminus_sss <= bminus_ss;

            -- Clock 7 
            if dv6 = '1' then
                if unsigned(counter_plus) > unsigned(max_counter_1) then
                    max_counter_1 <= counter_plus;
                    max_bin1 <= bplus_sss;
                    if max_bin1 /= bplus_sss then
                        max_counter_2 <= max_counter_1;
                        max_bin2 <= max_bin1;
                    end if;
                elsif unsigned(counter_plus) > unsigned(max_counter_2) then
                    max_counter_2 <= counter_plus;
                    max_bin2 <= bplus_sss;
                end if; 
        
                if bplus_sss /= bminus_sss then
                    if unsigned(counter_minus) > unsigned(max_counter_1) then
                        if unsigned(counter_plus) >= unsigned(counter_minus) then
                            max_counter_2 <= counter_minus;
                            max_bin2 <= bminus_sss;
                        else
                            max_counter_1 <= counter_minus;
                            max_bin1 <= bminus_sss;
                            if unsigned(counter_plus) > unsigned(max_counter_1) then
                                max_counter_2 <= counter_plus;
                                max_bin2 <= bplus_sss;
                            elsif max_bin1 /= bminus_sss then
                                max_counter_2 <= max_counter_1;
                                max_bin2 <= max_bin1;
                            end if;
                        end if;
                    elsif unsigned(counter_minus) > unsigned(max_counter_2) then
                        if unsigned(counter_plus) < unsigned(counter_minus) then
                            max_counter_2 <= counter_minus;
                            max_bin2 <= bminus_sss;
                        end if;
                    end if; 
                end if;
            end if;
            eof7 <= eof6;

            -- Clock 8
            eof8 <= eof7;
            max_bin1_s <= max_bin1;
            max_bin2_s <= max_bin2;

            -- Reading out hits in maxima
            if eof8 = '1' then
                rom_en <= '0';
                start_read <= '1';
                has_max <= '0';
                if unsigned(max_counter_1) > 1 then
                    r_addr(to_integer(max_bin1_s)) <= (others => '0');
                    has_max <= '1';
                end if;
                if unsigned(max_counter_2) > 1 and max_counter_1 = max_counter_2 then
                    r_addr(to_integer(max_bin2_s)) <= (others => '0');
                end if;
                mbar <= (others => '0');
            end if;
            
            start_read0 <= start_read;
            start_read1 <= start_read0;
            
            if start_read0 = '1' and has_max = '1' then 
                if unsigned(r_addr(to_integer(max_bin1))) < unsigned(max_counter_1) - 1 
                    and unsigned(max_counter_1) > 1 then
                    r_addr(to_integer(max_bin1)) <= 
                        std_logic_vector(unsigned(r_addr(to_integer(max_bin1))) + 1);
                else 
                    r_addr(to_integer(max_bin2)) <= (others => '1');
                    start_read <= '0';
                    r_addr(to_integer(max_bin1)) <= (others => '1');
                    w_addr <= (others => (others => '0'));
    
                    max_counter_1 <= (others => '0');
                    max_counter_2 <= (others => '0');
                end if;

                if unsigned(r_addr(to_integer(max_bin2))) < unsigned(max_counter_2) - 1 
                    and unsigned(max_counter_2) > 1 and max_counter_2 = max_counter_1 then
                    r_addr(to_integer(max_bin2)) <= 
                        std_logic_vector(unsigned(r_addr(to_integer(max_bin2))) + 1);
                else
                    r_addr(to_integer(max_bin2)) <= (others => '1');
                end if;
            elsif start_read0 = '1' then
                start_read <= '0';
                w_addr <= (others => (others => '0'));
                max_counter_1 <= (others => '0');
                max_counter_2 <= (others => '0');
            end if;

            if start_read1 = '1' and has_max = '1' then
                o_histo_hit0 <= vec_to_histo_hit(r_hit_vec(to_integer(max_bin1)));
                o_histo_hit1 <= vec_to_histo_hit(r_hit_vec(to_integer(max_bin2)));
            elsif start_read1 = '1' then
                o_histo_hit0 <= null_histo_hit;
                o_histo_hit1 <= null_histo_hit;
            end if;
               

    
        end if;
    end process;


end Behavioral;
