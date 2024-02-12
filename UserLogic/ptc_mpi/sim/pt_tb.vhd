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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

LIBRARY shared_lib;
USE shared_lib.common_ieee_pkg.ALL;
USE shared_lib.l0mdt_constants_pkg.ALL;
USE shared_lib.l0mdt_dataformats_pkg.ALL;
USE shared_lib.common_constants_pkg.ALL;
USE shared_lib.common_types_pkg.ALL;
USE shared_lib.config_pkg.ALL;
-- use shared_lib.detector_param_pkg.all;

LIBRARY ptc_lib;
USE ptc_lib.pt_pkg.ALL;
USE ptc_lib.pt_params_pkg.ALL;

LIBRARY project_lib;
ENTITY pt_tb IS
  --  Port ( );
END pt_tb;

ARCHITECTURE Behavioral OF pt_tb IS
  SIGNAL clk                                   : STD_LOGIC := '0';
  SIGNAL seg_I, seg_M, seg_O                   : sf2ptcalc_rt;
  SIGNAL i_segment_I, i_segment_M, i_segment_O : sf2ptcalc_vt := (OTHERS => '0');
  SIGNAL i_SLC                                 : pl2ptcalc_vt := (OTHERS => '0');
  SIGNAL slc                                   : pl2ptcalc_rt;
  SIGNAL o_mtc                                 : ptcalc2mtc_vt := (OTHERS => '0');
  SIGNAL mtc                                   : ptcalc2mtc_rt;
  SIGNAL rst                                   : STD_LOGIC := '0';
  SIGNAL enable                                : STD_LOGIC := '1';
  SIGNAL done                                  : STD_LOGIC;
  CONSTANT CLK_period                          : TIME := 4.0 ns;

BEGIN

  seg_I_read : ENTITY project_lib.pt_tb_seg_reader
    GENERIC MAP(
      IN_HIT_FILE => "pt_in0.csv"
    )
    PORT MAP(
      clk       => clk,
      rst       => rst,
      enable    => enable,
      o_segment => seg_I
    );

  seg_M_read : ENTITY project_lib.pt_tb_seg_reader
    GENERIC MAP(
      IN_HIT_FILE => "pt_in1.csv"
    )
    PORT MAP(
      clk       => clk,
      rst       => rst,
      enable    => enable,
      o_segment => seg_M
    );
  seg_O_read : ENTITY project_lib.pt_tb_seg_reader
    GENERIC MAP(
      IN_HIT_FILE => "pt_in2.csv"
    )
    PORT MAP(
      clk       => clk,
      rst       => rst,
      enable    => enable,
      o_segment => seg_O
    );

  slc_read : ENTITY project_lib.pt_tb_slc_reader
    GENERIC MAP(
      IN_HIT_FILE => "pt_in_slc.csv"
    )
    PORT MAP(
      clk    => clk,
      rst    => rst,
      enable => enable,
      o_slc  => slc
    );
  pt : ENTITY ptc_lib.pt
    PORT MAP(
      clk         => clk,
      i_segment_I => i_segment_I,
      i_segment_M => i_segment_M,
      i_segment_O => i_segment_O,
      i_SLC       => i_SLC,
      i_rst       => rst,
      o_mtc       => o_mtc
    );

  pt_write : ENTITY project_lib.pt_tb_writer
    GENERIC MAP(
      OUT_FILE => "out_pt_fw.csv"
    )
    PORT MAP(
      clk    => clk,
      rst    => rst,
      enable => 1,
      mtc    => mtc
    );

  CLK_process : PROCESS

  BEGIN
    CLK <= '0';
    WAIT FOR CLK_period/2;
    CLK <= '1';
    WAIT FOR CLK_period/2;
  END PROCESS;

  i_segment_I <= convert(seg_I, i_segment_I);
  i_segment_M <= convert(seg_M, i_segment_M);
  i_segment_O <= convert(seg_O, i_segment_O);
  i_SLC       <= convert(slc, i_SLC);
  mtc         <= convert(o_mtc, mtc);

  tb_proc : PROCESS (CLK)
    VARIABLE first_read : STD_LOGIC := '1';
  BEGIN
    IF (rising_edge(CLK)) THEN

      IF mtc.data_valid = '1' THEN
        enable <= '1';
      END IF;

      IF enable = '1' THEN
        IF first_read = '1' THEN
          first_read := '0';
        ELSE
          enable <= '0';
        END IF;
      END IF;

    END IF;
  END PROCESS tb_proc;

END Behavioral;