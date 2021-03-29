-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Mon Mar 29 15:39:03 2021
-- Host        : atlas126a running 64-bit openSUSE Tumbleweed
-- Command     : write_vhdl -force -mode synth_stub
--               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_get_trig_vals/hls_get_trig_vals_stub.vhdl
-- Design      : hls_get_trig_vals
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hls_get_trig_vals is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    hw_trig_vals_0_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_1_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_2_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_3_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_4_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_5_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_6_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_7_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_8_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_9_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_10_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_11_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_12_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_13_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_14_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    hw_trig_vals_15_V : out STD_LOGIC_VECTOR ( 35 downto 0 );
    rom_idx_V : in STD_LOGIC_VECTOR ( 2 downto 0 );
    lut_start_addr_V : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );

end hls_get_trig_vals;

architecture stub of hls_get_trig_vals is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,hw_trig_vals_0_V[35:0],hw_trig_vals_1_V[35:0],hw_trig_vals_2_V[35:0],hw_trig_vals_3_V[35:0],hw_trig_vals_4_V[35:0],hw_trig_vals_5_V[35:0],hw_trig_vals_6_V[35:0],hw_trig_vals_7_V[35:0],hw_trig_vals_8_V[35:0],hw_trig_vals_9_V[35:0],hw_trig_vals_10_V[35:0],hw_trig_vals_11_V[35:0],hw_trig_vals_12_V[35:0],hw_trig_vals_13_V[35:0],hw_trig_vals_14_V[35:0],hw_trig_vals_15_V[35:0],rom_idx_V[2:0],lut_start_addr_V[11:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "get_trig_vals,Vivado 2019.2.1";
begin
end;
