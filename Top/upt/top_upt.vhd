-- ==============================================================
-- Joakim Olsson, UC Irvine 
-- joakim.olsson@cern.ch
-- created: 2020-04-12
-- last update: 2020-09-14
-- ===========================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;

entity top_upt is
    generic (
        flavour : integer := 0; -- barrel
        sector  : integer := 3
    );
    port (
        clk : in std_logic;
        i_rst : in std_logic;
        i_slc: in pl2pt_rvt;
        i_segment_i : in sf_seg_data_barrel_rvt;
        i_segment_m : in sf_seg_data_barrel_rvt;
        i_segment_o : in sf_seg_data_barrel_rvt;
        o_mtc : out tf2mtc_rvt -- TODO [check with Kostas/Davide/etc.] change name to pt2mtc_rvt in data format?
    );
end top_upt;

architecture behav of top_upt is

    constant const_ap_start : std_logic := '1';
    constant const_ap_idle : std_logic := '0';

    component hls_ptcalc_top
        port (
            ap_clk : in std_logic;
            ap_rst : in std_logic;
            --ap_start : in std_logic;
            --ap_done : out std_logic;
            --ap_idle : out std_logic;
            --ap_ready : out std_logic;
            pl2ptcalc_v : in pl2pt_rvt;
            sf2ptcalc_inn_v : in sf_seg_data_barrel_rvt;
            sf2ptcalc_mid_v : in sf_seg_data_barrel_rvt;
            sf2ptcalc_out_v : in sf_seg_data_barrel_rvt;
            ptcalc2mtc_v : out tf2mtc_rvt;
            ptcalc2mtc_v_ap_vld : out std_logic
            );
    end component;

begin 
    ptcalc_top_inst : ptcalc_top port map (
        ap_clk => clk,
        ap_rst => i_rst,
        --ap_start => const_ap_start, -- hls control signal: goes high 1 clk after rst goes low
        --ap_done => open, -- hls control signal: probably not needed?
        --ap_idle => const_ap_idle, -- hls control signal: inverted ap_start
        --ap_ready => open, -- hls control signal: probably not needed?
        pl2ptcalc_v => i_slc,
        sf2ptcalc_inn_v => i_segment_i,
        sf2ptcalc_mid_v => i_segment_m,
        sf2ptcalc_out_v => i_segment_o,
        ptcalc2mtc_v => o_mtc,
        ptcalc2mtc_v_ap_vld => open -- hls control signal: probably not needed?
        );

end behav;   
