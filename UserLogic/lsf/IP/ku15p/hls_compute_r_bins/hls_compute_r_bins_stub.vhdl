-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
-- Date        : Mon Mar 29 15:39:12 2021
-- Host        : atlas126a running 64-bit openSUSE Tumbleweed
-- Command     : write_vhdl -force -mode synth_stub
--               /mnt/atlas126a/scratch/dcieri/Firmware/l0mdt-hdl-design/UserLogic/lsf/IP/ku15p/hls_compute_r_bins/hls_compute_r_bins_stub.vhdl
-- Design      : hls_compute_r_bins
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku15p-ffva1760-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hls_compute_r_bins is
  Port ( 
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    mdt_r_offset_V_TVALID : in STD_LOGIC;
    mdt_r_offset_V_TREADY : out STD_LOGIC;
    mdt_r_offset_V_TDATA : in STD_LOGIC_VECTOR ( 23 downto 0 );
    r_bin_V_TVALID : out STD_LOGIC;
    r_bin_V_TREADY : in STD_LOGIC;
    r_bin_V_TDATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    mdt_localx_V : in STD_LOGIC_VECTOR ( 14 downto 0 );
    mdt_localy_V : in STD_LOGIC_VECTOR ( 14 downto 0 );
    hw_sin_val_V : in STD_LOGIC_VECTOR ( 17 downto 0 );
    hw_cos_val_V : in STD_LOGIC_VECTOR ( 17 downto 0 )
  );

end hls_compute_r_bins;

architecture stub of hls_compute_r_bins is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,mdt_r_offset_V_TVALID,mdt_r_offset_V_TREADY,mdt_r_offset_V_TDATA[23:0],r_bin_V_TVALID,r_bin_V_TREADY,r_bin_V_TDATA[7:0],mdt_localx_V[14:0],mdt_localy_V[14:0],hw_sin_val_V[17:0],hw_cos_val_V[17:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "compute_r_bins,Vivado 2019.2.1";
begin
end;
