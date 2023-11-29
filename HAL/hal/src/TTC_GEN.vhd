----------------------------------------------------------------------------------
-- Company: U of M
-- Engineer: Xueye Hu
-- 
-- Create Date: 03/11/2021 03:31:11 PM
-- Design Name: 
-- Module Name: TTC_GEN - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- txFrameClk_from_txPll 40MHz
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- mode 00 Trig
--      01 BCR
--      10 ECR
--      11 GR
----------------------------------------------------------------------------------

--! Include the IEEE VHDL standard library
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--! Include the LpGBT-FPGA specific package
--use work.lpgbtfpga_package.all;

--! Xilinx devices library:
library unisim;
use unisim.vcomponents.all;



entity TTC_GEN is
  Port (
        txFrameClk_from_txPll           : in std_logic;
        enc_mode                        : in std_logic_vector(1 downto 0);
        rst                             : in std_logic;
        encode_ctrl_en                  : in std_logic;
        
        ttc                             : out std_logic_vector(1 downto 0)
        );
end TTC_GEN;

architecture Behavioral of TTC_GEN is

signal clk_40MHz    : std_logic;
type encode_ctrl_type is (IDLE, st0, st1, st2);
signal encode_ctrl_state :  encode_ctrl_type;

signal encode_ctrl_en_r     : std_logic := '0';
signal encode_ctrl_en_r1    : std_logic := '0';
signal encode_ctrl_en_r2    : std_logic := '0';
signal encode_ctrl_en_sync  : std_logic := '0';

begin

clk_40MHz   <= txFrameClk_from_txPll;

sync_encode_ctrl_en: process (clk_40MHz, rst)
                    begin
                        if rst = '1' then
                            encode_ctrl_en_r            <= '0';
                            encode_ctrl_en_r1            <= '0';
                            
                        elsif rising_edge(clk_40MHz) then
                            encode_ctrl_en_r    <= encode_ctrl_en;
                            encode_ctrl_en_r1   <= encode_ctrl_en_r;
                            encode_ctrl_en_r2   <= encode_ctrl_en_r1;
                            
                        end if;
                     end process;
                        
encode_ctrl_en_sync <= encode_ctrl_en_r and (not encode_ctrl_en_r2);

enc_ctrl_proc:  process (clk_40MHz, rst)
                    begin
                        if rst = '1' then
                            encode_ctrl_state       <= IDLE;
                            ttc            <= "00";
                            
                        elsif rising_edge(clk_40MHz) then
                            case (encode_ctrl_state) is
                                when IDLE   =>
                                     encode_ctrl_state       <= st0;   
                                     ttc            <= "00";
                                     
                                when st0   =>
                                     if encode_ctrl_en_sync  = '1' then
                                         encode_ctrl_state       <= st1; 
                                         ttc            <= "11";
                                     end if;
                                            
                                when st1   =>
                                          encode_ctrl_state       <= st2; 
                                            if enc_mode = "00" or  enc_mode = "10" then
                                                ttc            <= "00";
                                            else
                                                ttc            <= "11";
                                            end if;

                                when st2   =>
                                          encode_ctrl_state       <= IDLE; 
                                            if enc_mode = "00" or  enc_mode = "01" then
                                                ttc            <= "00";
                                            else
                                                ttc            <= "11";
                                            end if;  
                                when others =>
                                             encode_ctrl_state       <= IDLE; 
                                             ttc            <= "00";
                                end case;
                          end if;
                     end process;        
                     

end Behavioral;
