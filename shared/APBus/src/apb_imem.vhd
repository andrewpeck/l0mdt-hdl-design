--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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
-- use apbus_lib.apb_pkg.all;

library ctrl_lib;
use ctrl_lib.APB_MEM_SIG_CTRL.all;
use ctrl_lib.MEM_INT_10A148D_CTRL.all;
use ctrl_lib.MEM_INT_12A42D_CTRL.all;
use ctrl_lib.MEM_INT_12A148D_CTRL.all;
use ctrl_lib.MEM_INT_9A19D_CTRL.all;
use ctrl_lib.MEM_INT_10A38D_CTRL.all;
use ctrl_lib.MEM_INT_4A17D_CTRL.all;


entity apb_imem is
  generic(
    g_XML_NODE_NAME     : string; -- := "MEM_INT_10A148D";
    g_MEMORY_TYPE       : string := "ultra" ;
    g_INTERNAL_CLK      : std_logic := '1';
    g_ADDR_WIDTH        : integer := 0;
    g_DATA_WIDTH        : integer := 0;
    g_MEM_LATENCY       : integer := 0;    
    g_APBUS_CTRL_WIDTH  : integer := 0;
    g_APBUS_MON_WIDTH   : integer := 0
  );
  port (
    clk           : in std_logic;
    rst           : in std_logic;
    ena           : in std_logic := '1';
    --
    ctrl          : in std_logic_vector(g_APBUS_CTRL_WIDTH - 1 downto 0);
    mon           : out std_logic_vector(g_APBUS_MON_WIDTH - 1 downto 0);
    --
    -- i_axi_clk     : in std_logic := '0';
    -- i_axi_rst     : in std_logic := '0';
    --
    -- i_freeze      : in std_logic_vector(1 downto 0) := (others => '0');
    o_freeze      : out std_logic; --_vector(1 downto 0);
    -- o_out_sel     : out std_logic_vector(1 downto 0);
    -- o_freeze_1    : in std_logic := '0';
    --
    o_rd_addr     : out std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    o_wr_addr     : out std_logic_vector(g_ADDR_WIDTH-1 downto 0);
    o_data        : out std_logic_vector(g_DATA_WIDTH - 1 downto 0);
    o_dv          : out std_logic;
    i_data        : in  std_logic_vector(g_DATA_WIDTH - 1 downto 0);
    i_dv          : in  std_logic

  );
end entity apb_imem;

architecture beh of apb_imem is
  signal axi_rst      : std_logic;
  signal axi_clk      : std_logic;

  signal int_rd_addr     : std_logic_vector(g_ADDR_WIDTH-1 downto 0);
  signal int_wr_addr     : std_logic_vector(g_ADDR_WIDTH-1 downto 0);
  signal int_wr_data     : std_logic_vector(g_DATA_WIDTH - 1 downto 0);
  signal int_wr_dv       : std_logic;
  signal int_rd_data     : std_logic_vector(g_DATA_WIDTH - 1 downto 0);
  signal int_rd_dv       : std_logic;

  -- signal apb_wr_status : std_logic_vector(3 downto 0);
  -- signal apb_rd_status : std_logic_vector(3 downto 0);
  signal int_wr_status : unsigned(3 downto 0);
  signal int_rd_status : unsigned(3 downto 0);

  signal new_apb_wr_req : std_logic;
  signal new_apb_rd_req : std_logic;

  constant apb_clk_latency : integer := 5;

  ----------------------------
  signal mem_ctrl       : APB_MEM_SIG_CTRL_t;
  signal mem_mon       : APB_MEM_SIG_MON_t;

  signal ctrl_10A38D_r  : MEM_INT_10A38D_CTRL_t;
  signal mon_10A38D_r   : MEM_INT_10A38D_MON_t;
  signal ctrl_9A19D_r   : MEM_INT_9A19D_CTRL_t;
  signal mon_9A19D_r    : MEM_INT_9A19D_MON_t;

begin

  model_mem: if g_XML_NODE_NAME = "MEM_INT_10A38D" generate
    ctrl_10A38D_r <= structify(ctrl,ctrl_10A38D_r);
    mem_ctrl <= ctrl_10A38D_r.
    mon <= vectorify(mon_10A38D_r,mon);
  elsif g_XML_NODE_NAME = "MEM_INT_9A19D" generate
    -- ctrl_9A19D_r <= structify(ctrl,ctrl_9A19D_r);
    -- mon <= vectorify(mon_9A19D_r,mon);
  end generate model_mem;

  MEM_INT: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        mon <= (others =>'0');
        o_rd_addr <= (others =>'0');
        o_rd_addr <= (others =>'0');
        o_rd_addr <= (others =>'0');
        o_dv <= '0';
        o_freeze <= '0';
      else
        
      end if;
    end if;
  end process MEM_INT;


end architecture beh;

