-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Sun Nov 12 20:13:08 2023
-- Host        : VBU2204-1 running 64-bit Ubuntu 22.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/guille/ATLAS/l0mdt-hdl-design/UserLogic/ucm/IPs/vu13/zcalc_vec_pos_div/zcalc_vec_pos_div_stub.vhdl
-- Design      : zcalc_vec_pos_div
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu13p-flga2577-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zcalc_vec_pos_div is
  Port ( 
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_divisor_tvalid : in STD_LOGIC;
    s_axis_divisor_tdata : in STD_LOGIC_VECTOR ( 39 downto 0 );
    s_axis_dividend_tvalid : in STD_LOGIC;
    s_axis_dividend_tdata : in STD_LOGIC_VECTOR ( 55 downto 0 );
    m_axis_dout_tvalid : out STD_LOGIC;
    m_axis_dout_tdata : out STD_LOGIC_VECTOR ( 95 downto 0 )
  );

end zcalc_vec_pos_div;

architecture stub of zcalc_vec_pos_div is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,aclken,aresetn,s_axis_divisor_tvalid,s_axis_divisor_tdata[39:0],s_axis_dividend_tvalid,s_axis_dividend_tdata[55:0],m_axis_dout_tvalid,m_axis_dout_tdata[95:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "div_gen_v5_1_19,Vivado 2022.2";
begin
end;
