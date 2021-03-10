--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: BUBus signal main signals generator 
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bubus_mem_int is
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic := '1';
    --
    o_axi_clk             : out std_logic;
    o_axi_rst             : out std_logic
  );
end entity bubus_mem_int;

architecture beh of bubus_mem_int is
  signal axi_rst      : std_logic;
  signal clk_axi      : std_logic;
  signal clk_axi_cnt  : integer;
begin

  o_axi_clk <= clk_axi;
  o_axi_rst <= axi_rst; 
  
  AXI_PROC : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        clk_axi <= '0';
        clk_axi_cnt <= 0;
        axi_rst <= '1';
      else
        -- com sincronitzar-ho amb el rellotge master?
        if clk_axi_cnt < c_CLK_AXI_MULT then
          clk_axi_cnt <= clk_axi_cnt + 1;
        else
          clk_axi_cnt <= 0;
          clk_axi <= not clk_axi;
          axi_rst <= rst;
        end if;
      end if;
    end if;
  end process;
  
end architecture beh;