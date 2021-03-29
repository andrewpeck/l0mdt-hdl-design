-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Mon Mar 29 15:39:10 2021
-- Host        : atlas126a running 64-bit openSUSE Tumbleweed
-- Command     : write_vhdl -force -mode synth_stub
--               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_get_rom_addr/hls_get_rom_addr_stub.vhdl
-- Design      : hls_get_rom_addr
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hls_get_rom_addr is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    theta_for_lut_V : in STD_LOGIC_VECTOR ( 13 downto 0 );
    rom_index_V : out STD_LOGIC_VECTOR ( 2 downto 0 );
    lut_start_addr_V : out STD_LOGIC_VECTOR ( 11 downto 0 );
    lbins0_gbl1_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    slcvec_offset_angle_int_V : in STD_LOGIC_VECTOR ( 10 downto 0 );
    slcvec_angle_polar_offset_mrad_V : out STD_LOGIC_VECTOR ( 13 downto 0 )
  );

end hls_get_rom_addr;

architecture stub of hls_get_rom_addr is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,theta_for_lut_V[13:0],rom_index_V[2:0],lut_start_addr_V[11:0],lbins0_gbl1_V[0:0],slcvec_offset_angle_int_V[10:0],slcvec_angle_polar_offset_mrad_V[13:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "get_rom_addr,Vivado 2019.2.1";
begin
end;
