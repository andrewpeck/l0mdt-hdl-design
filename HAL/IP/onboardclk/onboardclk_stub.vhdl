-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
-- Date        : Mon Feb 27 19:15:33 2023
-- Host        : VBU2204-1 running 64-bit Ubuntu 22.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/guille/ATLAS/l0mdt-hdl-design/HAL/IP/onboardclk/onboardclk_stub.vhdl
-- Design      : onboardclk
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity onboardclk is
  Port ( 
    clk_200MHz : out STD_LOGIC;
    clk_50MHz : out STD_LOGIC;
    clk_100MHz : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );

end onboardclk;

architecture stub of onboardclk is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_200MHz,clk_50MHz,clk_100MHz,reset,locked,clk_in1_p,clk_in1_n";
begin
end;
