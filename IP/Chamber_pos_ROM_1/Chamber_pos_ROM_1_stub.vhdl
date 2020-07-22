-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
-- Date        : Sat Jun  6 23:12:42 2020
-- Host        : GLdL950 running 64-bit Ubuntu 18.04.4 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /mnt/d/L0MDT/dev/hdl/l0mdt-fpga-design/IP/Chamber_pos_ROM_1/Chamber_pos_ROM_1_stub.vhdl
-- Design      : Chamber_pos_ROM_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Chamber_pos_ROM_1 is
  Port ( 
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 2 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 18 downto 0 )
  );

end Chamber_pos_ROM_1;

architecture stub of Chamber_pos_ROM_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,addra[2:0],douta[18:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_4,Vivado 2019.2";
begin
end;
