-- ==============================================================
-- Joakim Olsson, UC Irvine
-- joakim.olsson@cern.ch
-- created: 2020-04-12
-- last update: 2020-12-10
-- ===========================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
--use shared_lib.common_constants_pkg.all;
--use shared_lib.common_types_pkg.all;

entity top_upt is
    generic (
        flavour : integer := 0; -- barrel
        sector  : integer := 3
    );
    port (
        clk : in std_logic;
        i_rst : in std_logic;
        i_slc: in pl2ptcalc_rvt;
        i_segment_i : in sf2ptcalc_rvt;
        i_segment_m : in sf2ptcalc_rvt;
        i_segment_o : in sf2ptcalc_rvt;
        o_mtc : out ptcalc2mtc_rvt -- TODO [check with Kostas/Davide/etc.] change name to pt2mtc_rvt in data format?
    );
end top_upt;

architecture behav of top_upt is

    constant const_ap_start : std_logic := '1';
    constant const_ap_idle  : std_logic := '0';
    constant ptcalc_hls_ii  : unsigned := X"4";
    signal ptcalc2mtc_data  : std_logic_vector(PTCALC2MTC_LEN-1 downto 0) := (others => '0');
    signal ptcalc2mtc_valid : std_logic;
    signal ptcalc2mtc_done  : std_logic;
    signal ptcalc_ap_start  : std_logic;
    signal ptcalc_ap_ready  : std_logic;
    signal ptcalc_cnt       : std_logic_vector(2 downto 0):= (others => '0');
    signal ptcalc_slc     : pl2ptcalc_rvt;
    signal ptcalc_segment_i : sf2ptcalc_rvt;
    signal ptcalc_segment_m : sf2ptcalc_rvt;
    signal ptcalc_segment_o : sf2ptcalc_rvt;

    component ptcalc_top
        port (
            ap_clk : in std_logic;
            ap_rst : in std_logic;
            ap_start : in std_logic;
            ap_done : out std_logic;
            ap_idle : out std_logic;
            ap_ready : out std_logic;
            pl2ptcalc_v : in pl2ptcalc_rvt;
            sf2ptcalc_inn_v : in sf2ptcalc_rvt;
            sf2ptcalc_mid_v : in sf2ptcalc_rvt;
            sf2ptcalc_out_v : in sf2ptcalc_rvt;
            ptcalc2mtc_v : out ptcalc2mtc_rvt;
            ptcalc2mtc_v_ap_vld : out std_logic
            );
    end component;

begin
    o_mtc           <= ptcalc2mtc_done & ptcalc2mtc_data(PTCALC2MTC_LEN-2 downto 0);
    --ptcalc_ap_start <= ptcalc_ap_ready and i_slc(PL2PTCALC_LEN-1);

    ptcalc_top_inst : ptcalc_top port map (
        ap_clk => clk,
        ap_rst => i_rst,
        ap_start        => ptcalc_ap_start, --i_slc(PL2PTCALC_LEN-1), -- hls control signal: goes high 1 clk after rst goes low
        ap_done         => ptcalc2mtc_done, -- hls control signal: probably not needed?
        --ap_idle => const_ap_idle, -- hls control signal: inverted ap_start
        ap_ready        => ptcalc_ap_ready, -- hls control signal: probably not needed?
        pl2ptcalc_v     => ptcalc_slc,
        sf2ptcalc_inn_v => ptcalc_segment_i,
        sf2ptcalc_mid_v => ptcalc_segment_m,
        sf2ptcalc_out_v => ptcalc_segment_o,
        ptcalc2mtc_v    => ptcalc2mtc_data,
        ptcalc2mtc_v_ap_vld => ptcalc2mtc_valid -- hls control signal: probably not needed?
        );

    hls_ap_ready: process(clk)
    begin
      if rising_edge (clk) then
        if i_rst = '1' then
          ptcalc_ap_start <= '0';
          ptcalc_slc      <= (others =>'0');
          ptcalc_segment_i<= (others =>'0');
          ptcalc_segment_m<= (others =>'0');
          ptcalc_segment_o<= (others =>'0');
        elsif i_slc(PL2PTCALC_LEN-1) = '1' then
          ptcalc_ap_start   <= '1';
          ptcalc_slc        <= i_slc;
          ptcalc_segment_i  <= i_segment_i;
          ptcalc_segment_m  <= i_segment_m;
          ptcalc_segment_o  <= i_segment_o;
        elsif unsigned(ptcalc_cnt) = unsigned(ptcalc_hls_ii) or ptcalc_ap_ready = '1' then
          ptcalc_ap_start <= '0';
        end if;
      end if;

    end process;

    ptcalc_cnt_process: process(clk,i_rst)
      begin
        if i_slc(PL2PTCALC_LEN-1) = '1' or i_rst = '1' or ptcalc_ap_start = '0' then
          ptcalc_cnt <= (others => '0');
        elsif unsigned(ptcalc_cnt) < unsigned(ptcalc_hls_ii) then
          ptcalc_cnt <= std_logic_vector(unsigned (ptcalc_cnt) + 1);
        else
          ptcalc_cnt <= (others => '0');
        end if;
    end process;

end behav;
