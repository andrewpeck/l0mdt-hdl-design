-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
-- Date        : Tue Jun 30 02:20:57 2020
-- Host        : GLdL950 running 64-bit Ubuntu 18.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub /mnt/d/L0MDT/dev/hdl/l0mdt-fpga-design/IP/vio_ult/vio_ult_stub.vhdl
-- Design      : vio_ult
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_ult is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 60 downto 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 60 downto 0 );
    probe_in2 : in STD_LOGIC_VECTOR ( 58 downto 0 );
    probe_in3 : in STD_LOGIC_VECTOR ( 58 downto 0 );
    probe_in4 : in STD_LOGIC_VECTOR ( 40 downto 0 );
    probe_in5 : in STD_LOGIC_VECTOR ( 40 downto 0 );
    probe_in6 : in STD_LOGIC_VECTOR ( 40 downto 0 );
    probe_in7 : in STD_LOGIC_VECTOR ( 40 downto 0 );
    probe_in8 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out5 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out6 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out7 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out8 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out9 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out10 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out11 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out12 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out13 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out14 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out15 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out16 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out17 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out18 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out19 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out20 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out21 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out22 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out23 : out STD_LOGIC_VECTOR ( 35 downto 0 );
    probe_out24 : out STD_LOGIC_VECTOR ( 123 downto 0 );
    probe_out25 : out STD_LOGIC_VECTOR ( 123 downto 0 );
    probe_out26 : out STD_LOGIC_VECTOR ( 123 downto 0 );
    probe_out27 : out STD_LOGIC_VECTOR ( 123 downto 0 );
    probe_out28 : out STD_LOGIC_VECTOR ( 123 downto 0 );
    probe_out29 : out STD_LOGIC_VECTOR ( 123 downto 0 );
    probe_out30 : out STD_LOGIC_VECTOR ( 123 downto 0 );
    probe_out31 : out STD_LOGIC_VECTOR ( 123 downto 0 );
    probe_out32 : out STD_LOGIC_VECTOR ( 60 downto 0 );
    probe_out33 : out STD_LOGIC_VECTOR ( 58 downto 0 );
    probe_out34 : out STD_LOGIC_VECTOR ( 58 downto 0 );
    probe_out35 : out STD_LOGIC_VECTOR ( 58 downto 0 );
    probe_out36 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out37 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end vio_ult;

architecture stub of vio_ult is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[60:0],probe_in1[60:0],probe_in2[58:0],probe_in3[58:0],probe_in4[40:0],probe_in5[40:0],probe_in6[40:0],probe_in7[40:0],probe_in8[0:0],probe_out0[35:0],probe_out1[35:0],probe_out2[35:0],probe_out3[35:0],probe_out4[35:0],probe_out5[35:0],probe_out6[35:0],probe_out7[35:0],probe_out8[35:0],probe_out9[35:0],probe_out10[35:0],probe_out11[35:0],probe_out12[35:0],probe_out13[35:0],probe_out14[35:0],probe_out15[35:0],probe_out16[35:0],probe_out17[35:0],probe_out18[35:0],probe_out19[35:0],probe_out20[35:0],probe_out21[35:0],probe_out22[35:0],probe_out23[35:0],probe_out24[123:0],probe_out25[123:0],probe_out26[123:0],probe_out27[123:0],probe_out28[123:0],probe_out29[123:0],probe_out30[123:0],probe_out31[123:0],probe_out32[60:0],probe_out33[58:0],probe_out34[58:0],probe_out35[58:0],probe_out36[0:0],probe_out37[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2019.2";
begin
end;
