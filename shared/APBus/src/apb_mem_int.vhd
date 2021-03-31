--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: apbus memory interface 
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library apbus_lib;
use apbus_lib.apb_pkg.all;


entity apb_mem_int is
  generic(
    g_XML_NODE_NAME     : string := "MEM_INT_10A148D";
    g_INTERNAL_CLK      : std_logic := '1';
    g_ADDR_WIDTH        : integer := 1;
    g_DATA_WIDTH        : integer := 1;
    g_APBUS_CTRL_WIDTH  : integer := 8;
    g_APBUS_MON_WIDTH   : integer := 4
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic := '1';
    --
    ctrl                : in std_logic_vector(g_APBUS_CTRL_WIDTH - 1 downto 0);
    mon                 : out std_logic_vector(g_APBUS_MON_WIDTH - 1 downto 0);
    --
    i_axi_clk     : in std_logic := '0';
    i_axi_rst     : in std_logic := '0';
    -- --
    -- rd_rdy        : out std_logic;
    -- rd_data       : out std_logic_vector(g_DATA_WIDTH -1 downto 0);
    -- --
    -- wr_req        : in std_logic;
    -- rd_ack        : in std_logic;
    -- wr_addr       : in std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    -- rd_addr       : in std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    -- wr_data       : in std_logic_vector(g_DATA_WIDTH-1 downto 0);
    --

    o_addr      : out std_logic_vector(g_ADDR_WIDTH-1 downto 0):= (others => '0');
    o_din       : out std_logic_vector(g_DATA_WIDTH - 1 downto 0) := (others => '0');
    o_dv_in     : out std_logic := '1';
    i_dout      : in  std_logic_vector(g_DATA_WIDTH - 1 downto 0);
    i_dv_out    : in  std_logic := '1'

  );
end entity apb_mem_int;

architecture beh of apb_mem_int is
  signal axi_rst      : std_logic;
  signal clk_axi      : std_logic;

begin

  INT_CLK_EN: if g_INTERNAL_CLK generate

    PL : entity apbus_lib.apbus_main_sig
    port map(
      clk           => clk,
      rst           => rst,
      ena           => ena,
      --
      o_axi_clk     => clk_axi,
      o_axi_rst     => axi_rst
    );
    
  end generate INT_CLK_EN;

  INT_CLK_DIS: if not g_INTERNAL_CLK generate

    axi_rst <= i_axi_rst;
    clk_axi <= i_axi_clk;

  end generate INT_CLK_DIS;

  MEM_INT_10A148D: if g_XML_NODE_NAME = "MEM_INT_10A148D" generate

    MEM_CTRL_INT: process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          
        else
          
        end if;
      end if;
    end process MEM_CTRL_INT;







    
  end generate MEM_INT_10A148D;








  

  
end architecture beh;