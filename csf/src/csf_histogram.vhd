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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.config_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.common_constants_pkg.all;

library csf_lib;
use csf_lib.csf_pkg.all;
use csf_lib.custom_types_csf_pkg.all;
-- library ieee, csf_lib, shared_lib;
-- use ieee.STD_LOGIC_1164.ALL;
-- use ieee.NUMERIC_STD.ALL;
-- use ieee.math_real.all;
-- use csf_lib.csf_pkg.all;
-- use shared_lib.custom_types_davide_pkg.all;
-- use csf_lib.custom_types_csf_pkg.all;

entity csf_histogram is
    Port (
        clk             : in std_logic;
        i_mdthit        : in hp_hit_data_rvt;
        i_seed          : in ucm_csf_seed_rvt;
        i_eof           : in std_logic;
        o_histo_hit0    : out csf_hit_rvt;
        o_histo_hit1    : out csf_hit_rvt
    );
end csf_histogram;

architecture Behavioral of csf_histogram is
    -- Histogram parameters
    constant HISTO_FULL_LEN  : integer := 21;
    constant HISTO_LEN       : integer := 6;
    constant MAX_HITS_PER_BIN  : real    := 8.0;
    constant BIN_DEPTH         : integer := integer(log2(max_hits_per_bin));
    constant INV_SQRT_M_LEN  : integer := 18;
    constant SQU_M_LEN       : integer := UCM_MBAR_LEN;

    -- Signals for seed information
    signal seed      : ucm_csf_seed_rt;
    signal mbar      : unsigned(UCM_MBAR_LEN-1 downto 0) := (others => '0');
    signal squ_m     : std_logic_vector(SQU_M_LEN-1 downto 0)
        := (others => '0');
    signal invsqu_m  : std_logic_vector(INV_SQRT_M_LEN-1 downto 0)
        := (others => '0');

    -- MDT hit signals
    signal mdt_hit, mdt_hit_s, mdt_hit_ss, mdt_hit_sss, mdt_hit_ssss : hp_hit_data_rt;
    -- Constants for b+/- calculation
    constant SQU_M_R_LEN  : integer := SQU_M_LEN + MDT_RADIUS_LEN;
    constant M_X_LEN      : integer := UCM_MBAR_LEN + MDT_LOCAL_X_LEN;
    constant Y_M_LEN      : integer := MDT_LOCAL_Y_LEN + UCM_MBAR_LEN + 1;
    constant M_X_Y_M_LEN  : integer := Y_M_LEN + 1;

    -- DSP signals for b+/- calculation
    signal dsp_squ_m_r, dsp_squ_m_r_s  : unsigned(SQU_M_R_LEN-1 downto 0)
        := (others => '0');
    signal dsp_m_x                     : unsigned(M_X_LEN-1 downto 0)
        := (others => '0');
    signal dsp_y_m_multi               : unsigned(Y_M_LEN-1 downto 0)
        := (others => '0');
    signal dsp_m_x_y_multi             : signed(M_X_Y_M_LEN-1 downto 0)
        := (others =>'0');
    signal bplus_full, bminus_full     : signed(M_X_Y_M_LEN-1 downto 0 )
        := (others => '0');
    signal bplus, bminus               : signed(HISTO_LEN+1 downto 0)
        := (others => '0');
    signal bplus_s, bminus_s,
           bplus_ss, bminus_ss,
           bplus_sss, bminus_sss       : unsigned(HISTO_LEN-1 downto 0)
        := (others => '0');

    -- Data Valid signals
    signal dv0, dv1, dv2, dv3, dv4, dv5, dv6           : std_logic := '0';
    signal eof0, eof1, eof2,
           eof3, eof4, eof5,
           eof6, eof7, eof8                            : std_logic := '0';

    -- Signals for histogram bins
    type t_address_histo is array (natural range <>)
        of std_logic_vector(BIN_DEPTH-1 downto 0);
    signal w_addr     : t_address_histo(2**HISTO_LEN-1 downto 0)
        := (others => (others => '0'));
    signal r_addr     : t_address_histo(2**HISTO_LEN-1 downto 0)
        := (others => (others => '1'));
    signal w_en       : std_logic_vector(2**HISTO_LEN-1 downto 0)
        := (others => '0');

    -- Histogram hit signals
    type t_hit_vectors is array (natural range <>)
        of std_logic_vector(CSF_HIT_LEN-1 downto 0);

    signal hit_plus, hit_minus      : csf_hit_rt;
    signal hit_plus_s, hit_minus_s  : csf_hit_rt;

    signal w_hit_vec, r_hit_vec  : t_hit_vectors(2**HISTO_LEN-1 downto 0)
        := (others => (others => '0'));

    -- Delta_x, Delta_y constants
    constant M_INV_SQU_M_LEN         : integer
        := UCM_MBAR_LEN + INV_SQRT_M_LEN;
    constant M_MULTI_INV_SQU_M_LEN   : integer := M_INV_SQU_M_LEN + 1;
    constant DELTA_Y_FULL_LEN        : integer
        := M_MULTI_INV_SQU_M_LEN + MDT_RADIUS_LEN;
    constant DELTA_X_FULL_LEN      : integer
        := UCM_MBAR_LEN + INV_SQRT_M_LEN + MDT_RADIUS_LEN;

    -- Signals for Delta_x, Delta_y to calculate exact hit coordinate
    signal dsp_m_inv_squ_m, dsp_m_inv_squ_m_s
        : unsigned(M_INV_SQU_M_LEN-1 downto 0) := (others => '0');
    signal dsp_m_multi_inv_squ_m
        : unsigned(M_MULTI_INV_SQU_M_LEN-1 downto 0) := (others => '0');
    signal delta_y_full, delta_y_full_s
        : unsigned(DELTA_Y_FULL_LEN-1 downto 0) := (others => '0');
    signal delta_x_full, delta_x_full_s
        : unsigned(DELTA_X_FULL_LEN-1 downto 0) := (others => '0');
    signal delta_x, delta_x_s, delta_x_ss
        : unsigned(MDT_LOCAL_X_LEN-1 downto 0) := (others => '0');
    signal delta_y, delta_y_s, delta_y_ss
        : unsigned(MDT_LOCAL_Y_LEN-1 downto 0) := (others => '0');

    -- Signals for maximum identification
    signal max_counter_1, max_counter_2,
           counter_plus, counter_minus
       : std_logic_vector(BIN_DEPTH-1 downto 0) := (others => '0');
    signal max_bin1, max_bin2, max_bin1_s, max_bin2_s
        : unsigned(HISTO_LEN-1 downto 0)  := (others => '0');
    signal has_max  : std_logic := '0';

    -- Signals to extract hits in maxima
    signal start_read, start_read0, start_read1 : std_logic := '0';

    signal addr : std_logic_vector(11 downto 0)
        := std_logic_vector(to_unsigned(50,12));

    ---- ROM storing all possible values of 1/sqrt(1+m^2)
    --COMPONENT invsqrt_mbar_rom
    --PORT (
    --    clka : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
    --);
    --END COMPONENT;

    ---- ROM storing all possible values of sqrt(1+m^2)
    --COMPONENT sqrt_mbar_rom
    --PORT (
    --    clka : IN STD_LOGIC;
    --    addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    --    douta : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    --);
    --END COMPONENT;

    ---COMPONENTS --------
    COMPONENT rom
    GENERIC (
        MXADRB   : integer;
        MXDATB   : integer;
        ROM_FILE : string
    );
    PORT (
        clka  : in std_logic;
        ena   : in std_logic;
        addra : in std_logic_vector;
        douta : out std_logic_vector
    );
    END COMPONENT;

begin

    mdt_hit <= structify(i_mdthit);
    seed <= structify(i_seed);
    --invsqrt_mbar : invsqrt_mbar_rom
    --PORT MAP (
    --    clka => clk,
    --    addra => std_logic_vector(abs(mbar)),
    --    douta => invsqu_m
    --);

    --sqrt_mbar : sqrt_mbar_rom
    --PORT MAP (
    --    clka => clk,
    --    addra => std_logic_vector(abs(mbar)),
    --    douta => squ_m
    --);

    invsqrt_mbar : rom
    generic map(
        MXADRB => UCM_MBAR_LEN,
        MXDATB => INV_SQRT_M_LEN,
        ROM_FILE => "../data/invsqrt_mbar.mem"
    )
    PORT MAP (
        ena    => '1',
        clka  => clk,
        addra => std_logic_vector(mbar),
        douta => invsqu_m
    );

    sqrt_mbar : rom
    generic map(
        MXADRB => UCM_MBAR_LEN,
        MXDATB => SQU_M_LEN,
        ROM_FILE => "../data/sqrt_mbar.mem"
    )
    port map(
        ena    => '1',
        clka  => clk,
        addra => std_logic_vector(mbar),
        douta => squ_m
    );

    BinRAMs: for k in 2**HISTO_LEN-1 downto 0 generate
    begin
    Bin : entity shared_lib.bram_tdp
    generic map(
        ADDR => BIN_DEPTH,
        DATA => CSF_HIT_LEN,
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
            o_histo_hit0 <= (others => '0');
            o_histo_hit1 <= (others => '0');

            if seed.data_valid = '1' then
                mbar <= seed.mbar;
            end if;

            -- Clock 0
            dv0   <= mdt_hit.data_valid;
            dsp_squ_m_r <= shift_right(
                           unsigned(squ_m)*mdt_hit.radius,
                           R_OVER_Z_MULTI_LEN );
            dsp_m_x <= mbar * mdt_hit.local_x;
            dsp_y_m_multi <= resize(mdt_hit.local_y * integer(UCM_MBAR_MULT),
                             Y_M_LEN );
            dsp_m_inv_squ_m <= mbar*unsigned(invsqu_m);
            dsp_m_multi_inv_squ_m <= resize(
                                     unsigned(invsqu_m)*integer(UCM_MBAR_MULT),
                                     M_MULTI_INV_SQU_M_LEN);
            mdt_hit_s <= mdt_hit;
            eof0 <= i_eof;

            -- Clock 1
            dv1 <= dv0;
            dsp_m_x_y_multi <= signed('0' & dsp_m_x) - signed('0' & dsp_y_m_multi);
            dsp_squ_m_r_s <= dsp_squ_m_r;
            mdt_hit_ss <= mdt_hit_s;
            dsp_m_inv_squ_m_s <= dsp_m_inv_squ_m;
            delta_y_full <= dsp_m_multi_inv_squ_m * mdt_hit_s.radius;
            eof1 <= eof0;

            -- Clock 2
            dv2 <= dv1;
            bplus_full <= signed('0' & dsp_squ_m_r_s) - dsp_m_x_y_multi;
            bminus_full <= -signed('0' & dsp_squ_m_r_s) - dsp_m_x_y_multi;
            delta_x_full_s <= dsp_m_inv_squ_m_s*mdt_hit_ss.radius;
            delta_y_full_s <= delta_y_full;
            eof2 <= eof1;
            mdt_hit_sss <= mdt_hit_ss;

            -- Clock 3
            dv3 <= dv2;
            bplus <= resize(shift_right(bplus_full, HISTO_FULL_LEN - HISTO_LEN ),
                HISTO_LEN+2 );
            bminus <= resize(shift_right(bminus_full, HISTO_FULL_LEN - HISTO_LEN ),
                HISTO_LEN+2 );
            delta_x <= resize(shift_right(
                              delta_x_full_s,
                              R_OVER_Z_MULTI_LEN + INV_SQRT_M_LEN),
                              MDT_LOCAL_X_LEN);
            delta_y <= resize(shift_right(delta_y_full_s,
                             R_OVER_Z_MULTI_LEN + INV_SQRT_M_LEN),
                             MDT_LOCAL_Y_LEN);
            mdt_hit_ssss <= mdt_hit_sss;
            eof3 <= eof2;

            -- Clock 4
            dv4 <= dv3;
            bplus_s <= unsigned(bplus(HISTO_LEN-1 downto 0));
            bminus_s <= unsigned(bminus(HISTO_LEN-1 downto 0));

            hit_plus.valid <= dv3;
            hit_minus.valid <= dv3;

            hit_plus.x <= mdt_hit_ssss.local_x - delta_x;
            hit_minus.x <= mdt_hit_ssss.local_x + delta_x;
            hit_plus.y <= mdt_hit_ssss.local_y + delta_y;
            hit_minus.y <= mdt_hit_ssss.local_y - delta_y;
            eof4 <= eof3;

            -- Clock 5
            dv5 <= dv4;
            w_en <= (others => '0');
            w_en(to_integer(bminus_s)) <= dv4;
            w_hit_vec(to_integer(bminus_s)) <= vectorify(hit_minus);
            w_en(to_integer(bplus_s)) <= dv4;
            w_hit_vec(to_integer(bplus_s)) <= vectorify(hit_plus);
            bplus_ss <= bplus_s;
            bminus_ss <= bminus_s;
            eof5 <= eof4;

            -- Clock 6
            if dv5 = '1' then
                w_addr(to_integer(bplus_ss)) <=
                    std_logic_vector(
                        unsigned(w_addr(to_integer(bplus_ss))) + 1);
                w_addr(to_integer(bminus_ss)) <=
                    std_logic_vector(
                        unsigned(w_addr(to_integer(bminus_ss))) + 1);
                counter_plus <= std_logic_vector(
                    unsigned(w_addr(to_integer(bplus_ss))) + 1);
                counter_minus <= std_logic_vector(
                    unsigned(w_addr(to_integer(bminus_ss))) + 1);
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
                o_histo_hit0 <= r_hit_vec(to_integer(max_bin1));
                o_histo_hit1 <= r_hit_vec(to_integer(max_bin2));
            elsif start_read1 = '1' then
                o_histo_hit0 <= (others => '0');
                o_histo_hit1 <= (others => '0');
            end if;

        end if;
    end process;


end Behavioral;
