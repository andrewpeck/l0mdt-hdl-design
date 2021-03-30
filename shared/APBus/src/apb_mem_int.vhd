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


entity apbus_mem_int is
  generic(
    g_INTERNAL_CLK      : std_logic := '1';
    g_ADDR_WIDTH        : integer := 1;
    g_DATA_WIDTH        : integer := 1
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic := '1';
    --
    i_axi_clk     : in std_logic := '0';
    i_axi_rst     : in std_logic := '0';
    --
    rd_rdy        : out std_logic;
    rd_data       : out std_logic_vector(g_DATA_WIDTH -1 downto 0);
    --
    wr_req        : in std_logic;
    rd_ack        : in std_logic;
    wr_addr       : in std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    rd_addr       : in std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    wr_data       : in std_logic_vector(g_DATA_WIDTH-1 downto 0);
    --
    o_addr_b      : out  std_logic_vector(g_ADDR_WIDTH-1 downto 0):= (others => '0');
    o_din_b       : out  std_logic_vector(g_DATA_WIDTH - 1 downto 0) := (others => '0');
    o_dv_in_b     : out  std_logic := '1';
    i_dout_b      : in  std_logic_vector(g_DATA_WIDTH - 1 downto 0);
    i_dv_out_b    : in  std_logic := '1'

  );
end entity apbus_mem_int;

architecture beh of apbus_mem_int is
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









  

  
end architecture beh;