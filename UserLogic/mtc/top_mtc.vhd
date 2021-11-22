--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
--Date        : Fri Nov  5 11:06:18 2021
--Host        : uclhc-2.ps.uci.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
--Command     : generate_target top_mtc.bd
--Design      : top_mtc
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_mtc is
  port (
    FIFO_READ_empty : out STD_LOGIC;
    FIFO_READ_rd_data : out STD_LOGIC_VECTOR ( 127 downto 0 );
    FIFO_READ_rd_en : in STD_LOGIC;
    FIFO_WRITE_full : out STD_LOGIC;
    FIFO_WRITE_wr_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    FIFO_WRITE_wr_en : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end top_mtc;

architecture STRUCTURE of top_mtc is
  component mtc_impl is
  port (
    rst : in STD_LOGIC_VECTOR ( 7 downto 0 );
    FIFO_READ_empty : out STD_LOGIC;
    FIFO_READ_rd_data : out STD_LOGIC_VECTOR ( 127 downto 0 );
    FIFO_READ_rd_en : in STD_LOGIC;
    FIFO_WRITE_full : out STD_LOGIC;
    FIFO_WRITE_wr_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    FIFO_WRITE_wr_en : in STD_LOGIC;
    clk : in STD_LOGIC
  );
  end component mtc_impl;
begin
mtc_impl_i: component mtc_impl
     port map (
      FIFO_READ_empty => FIFO_READ_empty,
      FIFO_READ_rd_data(127 downto 0) => FIFO_READ_rd_data(127 downto 0),
      FIFO_READ_rd_en => FIFO_READ_rd_en,
      FIFO_WRITE_full => FIFO_WRITE_full,
      FIFO_WRITE_wr_data(63 downto 0) => FIFO_WRITE_wr_data(63 downto 0),
      FIFO_WRITE_wr_en => FIFO_WRITE_wr_en,
      clk => clk,
      rst(7 downto 0) => rst(7 downto 0)
    );
end STRUCTURE;
