-------------------------------------------------------------------------------
-- Copyright (C) 2009 OutputLogic.com
-- This source file may be used and distributed without restriction
-- provided that this copyright statement is not removed from the file
-- and that any derivative work contains the original copyright notice
-- and the associated disclaimer.
-- 
-- THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS
-- OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
-- WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
-------------------------------------------------------------------------------
-- CRC module for data(31:0)
--   lfsr(15:0)=1+x^2+x^15+x^16;
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity crc16_lti is
  port ( data_in : in std_logic_vector (31 downto 0);
    crc_en , rst, clk : in std_logic;
    crc_out : out std_logic_vector (15 downto 0));
end crc16_lti;

architecture imp_crc of crc16_lti is
  signal lfsr_q: std_logic_vector (15 downto 0);
  signal lfsr_c: std_logic_vector (15 downto 0);
  signal data_in_rev: std_logic_vector(31 downto 0);
begin
	g_rev_in: for i in 0 to 31 generate
		data_in_rev(i) <= data_in(31-i);
	end generate;
	
	g_rev_out: for i in 0 to 15 generate
		crc_out(i) <= lfsr_q(15-i);
	end generate;

    lfsr_c(0) <= lfsr_q(0) xor lfsr_q(1) xor lfsr_q(2) xor lfsr_q(3) xor lfsr_q(4) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(14) xor lfsr_q(15) xor data_in_rev(0) xor data_in_rev(1) xor data_in_rev(2) xor data_in_rev(3) xor data_in_rev(4) xor data_in_rev(5) xor data_in_rev(6) xor data_in_rev(7) xor data_in_rev(8) xor data_in_rev(9) xor data_in_rev(10) xor data_in_rev(11) xor data_in_rev(12) xor data_in_rev(13) xor data_in_rev(15) xor data_in_rev(16) xor data_in_rev(17) xor data_in_rev(18) xor data_in_rev(19) xor data_in_rev(20) xor data_in_rev(21) xor data_in_rev(22) xor data_in_rev(23) xor data_in_rev(24) xor data_in_rev(25) xor data_in_rev(26) xor data_in_rev(27) xor data_in_rev(30) xor data_in_rev(31);
    lfsr_c(1) <= lfsr_q(0) xor lfsr_q(1) xor lfsr_q(2) xor lfsr_q(3) xor lfsr_q(4) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(11) xor lfsr_q(12) xor lfsr_q(15) xor data_in_rev(1) xor data_in_rev(2) xor data_in_rev(3) xor data_in_rev(4) xor data_in_rev(5) xor data_in_rev(6) xor data_in_rev(7) xor data_in_rev(8) xor data_in_rev(9) xor data_in_rev(10) xor data_in_rev(11) xor data_in_rev(12) xor data_in_rev(13) xor data_in_rev(14) xor data_in_rev(16) xor data_in_rev(17) xor data_in_rev(18) xor data_in_rev(19) xor data_in_rev(20) xor data_in_rev(21) xor data_in_rev(22) xor data_in_rev(23) xor data_in_rev(24) xor data_in_rev(25) xor data_in_rev(26) xor data_in_rev(27) xor data_in_rev(28) xor data_in_rev(31);
    lfsr_c(2) <= lfsr_q(0) xor lfsr_q(12) xor lfsr_q(13) xor lfsr_q(14) xor lfsr_q(15) xor data_in_rev(0) xor data_in_rev(1) xor data_in_rev(14) xor data_in_rev(16) xor data_in_rev(28) xor data_in_rev(29) xor data_in_rev(30) xor data_in_rev(31);
    lfsr_c(3) <= lfsr_q(1) xor lfsr_q(13) xor lfsr_q(14) xor lfsr_q(15) xor data_in_rev(1) xor data_in_rev(2) xor data_in_rev(15) xor data_in_rev(17) xor data_in_rev(29) xor data_in_rev(30) xor data_in_rev(31);
    lfsr_c(4) <= lfsr_q(0) xor lfsr_q(2) xor lfsr_q(14) xor lfsr_q(15) xor data_in_rev(2) xor data_in_rev(3) xor data_in_rev(16) xor data_in_rev(18) xor data_in_rev(30) xor data_in_rev(31);
    lfsr_c(5) <= lfsr_q(1) xor lfsr_q(3) xor lfsr_q(15) xor data_in_rev(3) xor data_in_rev(4) xor data_in_rev(17) xor data_in_rev(19) xor data_in_rev(31);
    lfsr_c(6) <= lfsr_q(2) xor lfsr_q(4) xor data_in_rev(4) xor data_in_rev(5) xor data_in_rev(18) xor data_in_rev(20);
    lfsr_c(7) <= lfsr_q(3) xor lfsr_q(5) xor data_in_rev(5) xor data_in_rev(6) xor data_in_rev(19) xor data_in_rev(21);
    lfsr_c(8) <= lfsr_q(4) xor lfsr_q(6) xor data_in_rev(6) xor data_in_rev(7) xor data_in_rev(20) xor data_in_rev(22);
    lfsr_c(9) <= lfsr_q(5) xor lfsr_q(7) xor data_in_rev(7) xor data_in_rev(8) xor data_in_rev(21) xor data_in_rev(23);
    lfsr_c(10) <= lfsr_q(6) xor lfsr_q(8) xor data_in_rev(8) xor data_in_rev(9) xor data_in_rev(22) xor data_in_rev(24);
    lfsr_c(11) <= lfsr_q(7) xor lfsr_q(9) xor data_in_rev(9) xor data_in_rev(10) xor data_in_rev(23) xor data_in_rev(25);
    lfsr_c(12) <= lfsr_q(8) xor lfsr_q(10) xor data_in_rev(10) xor data_in_rev(11) xor data_in_rev(24) xor data_in_rev(26);
    lfsr_c(13) <= lfsr_q(9) xor lfsr_q(11) xor data_in_rev(11) xor data_in_rev(12) xor data_in_rev(25) xor data_in_rev(27);
    lfsr_c(14) <= lfsr_q(10) xor lfsr_q(12) xor data_in_rev(12) xor data_in_rev(13) xor data_in_rev(26) xor data_in_rev(28);
    lfsr_c(15) <= lfsr_q(0) xor lfsr_q(1) xor lfsr_q(2) xor lfsr_q(3) xor lfsr_q(4) xor lfsr_q(5) xor lfsr_q(6) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(13) xor lfsr_q(14) xor lfsr_q(15) xor data_in_rev(0) xor data_in_rev(1) xor data_in_rev(2) xor data_in_rev(3) xor data_in_rev(4) xor data_in_rev(5) xor data_in_rev(6) xor data_in_rev(7) xor data_in_rev(8) xor data_in_rev(9) xor data_in_rev(10) xor data_in_rev(11) xor data_in_rev(12) xor data_in_rev(14) xor data_in_rev(15) xor data_in_rev(16) xor data_in_rev(17) xor data_in_rev(18) xor data_in_rev(19) xor data_in_rev(20) xor data_in_rev(21) xor data_in_rev(22) xor data_in_rev(23) xor data_in_rev(24) xor data_in_rev(25) xor data_in_rev(26) xor data_in_rev(29) xor data_in_rev(30) xor data_in_rev(31);

    process (clk) begin
      if rising_edge(clk) then
        if (rst = '1') then
            lfsr_q <= (others => '0');
        else
            if (crc_en = '1') then
              lfsr_q <= lfsr_c;
            end if;
        end if;
      end if;
    end process;
end architecture imp_crc; 
