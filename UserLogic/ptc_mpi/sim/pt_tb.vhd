----------------------------------------------------------------------------------
-- Company: Max-Planck-Institut fuer Physik, Munich
-- Engineer: Davide Cieri
-- 
-- Create Date: 02/11/2019 01:23:38 PM
-- Design Name: 
-- Module Name: pt_tb - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;

library ptc_lib;
use ptc_lib.pt_pkg.all;
use ptc_lib.pt_params_pkg.all;

library project_lib;


entity pt_tb is
--  Port ( );
end pt_tb;

architecture Behavioral of pt_tb is
    signal clk : std_logic := '0';
    signal seg_I, seg_M, seg_O : sf2ptcalc_rt;
    signal i_segment_I, i_segment_M, i_segment_O : sf2ptcalc_rvt := (others => '0');
    signal i_SLC : pl2ptcalc_rvt := (others => '0');
    signal slc : pl2ptcalc_rt;
    signal o_mtc : ptcalc2mtc_rvt := (others => '0');
    signal mtc : ptcalc2mtc_rt;
    signal rst : std_logic := '0';
    signal enable : std_logic := '1';
    signal done : std_logic;
    constant CLK_period : time := 4.0 ns;

begin
    
    seg_I_read : ENTITY project_lib.pt_tb_seg_reader
    generic map (
        IN_HIT_FILE => "pt_in0.csv"
    )
    port map(
        clk => clk,
        rst => rst,
        enable => enable,
        o_segment => seg_I
    );

    seg_M_read : ENTITY project_lib.pt_tb_seg_reader
    generic map (
        IN_HIT_FILE => "pt_in1.csv"
    )
    port map(
        clk => clk,
        rst => rst,
        enable => enable,
        o_segment => seg_M
    );


    seg_O_read : ENTITY project_lib.pt_tb_seg_reader
    generic map (
        IN_HIT_FILE => "pt_in2.csv"
    )
    port map(
        clk => clk,
        rst => rst,
        enable => enable,
        o_segment => seg_O
    );

    slc_read : ENTITY project_lib.pt_tb_slc_reader
    generic map (
        IN_HIT_FILE => "pt_in2.csv"
    )
    port map(
        clk => clk,
        rst => rst,
        enable => enable,
        o_slc => slc
    );


    pt : entity ptc_lib.pt
    Port map(
        clk  => clk,
        i_segment_I => i_segment_I,
        i_segment_M => i_segment_M,
        i_segment_O => i_segment_O,
        i_SLC       => i_SLC,
        i_rst       => rst,
        o_mtc       => o_mtc
    );

    CLK_process : process

    begin
        CLK <= '0';
        wait for CLK_period/2;
        CLK <= '1';
        wait for CLK_period/2;
    end process;

    i_segment_I <= vectorify(seg_I);
    i_segment_M <= vectorify(seg_M);
    i_segment_O <= vectorify(seg_O);
    i_SLC <= vectorify(slc);
    mtc <= structify(o_mtc);

    tb_proc : process (CLK)
        variable first_read           : std_logic := '1';
    begin
      if (rising_edge(CLK)) then

        if mtc.data_valid = '1' then
            enable <= '1';
        end if;

        if enable = '1' then
            if first_read = '1' then 
                first_read := '0';
            else
                enable <= '0';
            end if;
        end if;
 
      end if;
    end process tb_proc;

end Behavioral;
