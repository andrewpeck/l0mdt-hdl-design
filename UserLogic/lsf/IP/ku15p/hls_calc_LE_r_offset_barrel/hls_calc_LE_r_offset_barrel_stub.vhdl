-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Mon Mar 29 15:39:10 2021
-- Host        : atlas126a running 64-bit openSUSE Tumbleweed
-- Command     : write_vhdl -force -mode synth_stub
--               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_calc_LE_r_offset_barrel/hls_calc_LE_r_offset_barrel_stub.vhdl
-- Design      : hls_calc_LE_r_offset_barrel
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hls_calc_LE_r_offset_barrel is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    hw_sin_val_V : in STD_LOGIC_VECTOR ( 17 downto 0 );
    hw_cos_val_V : in STD_LOGIC_VECTOR ( 17 downto 0 );
    roi_seed_r_V : out STD_LOGIC_VECTOR ( 21 downto 0 );
    hewindow_pos_ref_V : in STD_LOGIC_VECTOR ( 17 downto 0 );
    hewindow_pos_V : in STD_LOGIC_VECTOR ( 13 downto 0 );
    slcvec_pos_V : in STD_LOGIC_VECTOR ( 13 downto 0 );
    slcvec_pos_ref_V : in STD_LOGIC_VECTOR ( 17 downto 0 )
  );

end hls_calc_LE_r_offset_barrel;

architecture stub of hls_calc_LE_r_offset_barrel is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,hw_sin_val_V[17:0],hw_cos_val_V[17:0],roi_seed_r_V[21:0],hewindow_pos_ref_V[17:0],hewindow_pos_V[13:0],slcvec_pos_V[13:0],slcvec_pos_ref_V[17:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "calc_LE_r_offset_barrel,Vivado 2019.2.1";
begin
end;
