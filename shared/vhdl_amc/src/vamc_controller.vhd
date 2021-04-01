--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Configurable delay pipeline
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee.all;

library vamc_lib;
library apbus_lib;

library ctrl_lib;
use ctrl_lib.MPL_CTRL.all;

entity vamc_controller is
  generic(
    g_MEMORY_MODE       : string := "pipeline";
    g_MEMORY_TYPE       : string := "distributed" ;-- auto, ultra, block, distributed
    g_ADDR_WIDTH        : integer := 0;
    g_DATA_WIDTH        : integer := 0;
    -- pipeline
    g_PIPELINE_TYPE     : string := "shift_reg";-- shift_reg , ring_buffer , mpcvmem 
    g_DELAY_CYCLES      : integer; 
    g_DELAY_EQUAL_WIDTH : integer := 0;
    g_PIPELINE_WIDTH    : integer;
    -- INT CTRL
    g_FREEZE_ENABLED    : std_logic := '0';
    g_DUAL_MEM          : std_logic := '0';
    -- BU bus
    g_APBUS_ENABLED     : std_logic := '0';
    g_APBUS_CTRL_WIDTH  : integer := 8;
    g_APBUS_MON_WIDTH   : integer := 4
  
 
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    -- Ctrl/Mon
    ctrl                : in std_logic_vector(g_APBUS_CTRL_WIDTH - 1 downto 0);
    mon                 : out std_logic_vector(g_APBUS_MON_WIDTH - 1 downto 0);
    i_freeze            : in std_logic := '0';
    --
    i_data              : in std_logic_vector(g_PIPELINE_WIDTH -1 downto 0);
    i_dv                : in std_logic := '0';
    o_data              : out std_logic_vector(g_PIPELINE_WIDTH -1 downto 0);
    o_dv                : out std_logic
  );
end entity vamc_controller;

architecture beh of vamc_controller is

  function init_ADDR_WIDTH(m : integer; x : integer) return integer is
    variable y : integer;
   begin
    if m /= 0 then
      y := m;
    else
      y := integer(ceil(log2(real(x))));
    end if;
    return y;
  end function;

  constant FREEZE_EN : std_logic := g_FREEZE_ENABLED OR g_APBUS_ENABLED;

  constant ADDR_WIDTH : integer := init_ADDR_WIDTH(g_ADDR_WIDTH,g_DELAY_CYCLES);--integer(ceil(log2(real(g_MEM_DEPTH))));
  constant DATA_WIDTH : integer := g_DATA_WIDTH;

  signal mem_empty               : std_logic;
  signal mem_empty_next          : std_logic;
  signal mem_full                : std_logic;
  signal mem_full_next           : std_logic;
  signal mem_used                : integer ;--range integer(log2(real(g_PIPELINE_WIDTH) - 1 downto 0));

  signal apb_addr_b              : std_logic_vector(ADDR_WIDTH - 1 downto 0):= (others => '0');
  signal apb_din_b               : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
  signal apb_dv_in_b             : std_logic := '1';
  signal apb_dout_b              : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal apb_dv_out_b            : std_logic := '1';

  signal freeze_0, freeze_1      : std_logic;


begin

  -----------------------------------------------
  -- SINGLE MEMORY WITH MONITORING
  -----------------------------------------------

  APB_INT_EN: if g_APBUS_ENABLED generate

    apb_interface : entity apbus_lib.apb_mem_int
      generic map(
        g_XML_NODE_NAME         => "MEM_INT_10A148D",
        g_INTERNAL_CLK          => '1',
        g_ADDR_WIDTH            => ADDR_WIDTH,
        g_DATA_WIDTH            => DATA_WIDTH,
        g_APBUS_CTRL_WIDTH      => g_APBUS_CTRL_WIDTH,
        g_APBUS_MON_WIDTH       => g_APBUS_MON_WIDTH
      )
      port map (
        clk           => clk,
        rst           => rst,
        ena           => ena,
        --
        ctrl          => ctrl,
        mon           => mon,
        --
        -- i_axi_clk     => ,
        -- i_axi_rst     => ,
        --
        i_freeze      => i_freeze,
        o_freeze_0    => freeze_0,
        o_freeze_1    => freeze_1,
        --
        o_addr        => apb_addr_b,  
        o_din         => apb_din_b,   
        o_dv_in       => apb_dv_in_b, 
        i_dout        => apb_dout_b,  
        i_dv_out      => apb_dv_out_b


      );  
    
      MODE_MEM: if g_MEMORY_MODE = "pipeline" generate

        MPCVMEM_GEN: if g_PIPELINE_TYPE = "mpcvmem" generate
          -- DC4_GEN: if condition generate
            
          -- end generate DC4_GEN;
          -- constant OUT_PIPELINE
          constant TOTAL_DELAY_CYCLES : integer := g_DELAY_CYCLES;
  
        begin
          
          
          mpcvmem : entity vamc_lib.mpcvmem
          generic map(
            g_LOGIC_TYPE    => "pipeline",
            g_MEMORY_TYPE   => g_MEMORY_TYPE,
  
            g_PL_DELAY_CYCLES => TOTAL_DELAY_CYCLES,
            g_MEM_WIDTH     => DATA_WIDTH,
            g_MEM_DEPTH     => TOTAL_DELAY_CYCLES
          )
          port map(
            clk           => clk,
            rst           => rst,
            ena           => ena,
            --
            i_freeze      => freeze_0,
            -- Port A
            i_din_a       => i_data,
            i_dv_in_a     => i_dv,
            o_dout_a      => o_data,
            o_dv_out_a    => o_dv,
            -- Port B
            i_addr_b      => apb_addr_b,  
            i_din_b       => apb_din_b,   
            i_dv_in_b     => apb_dv_in_b, 
            o_dout_b      => apb_dout_b,  
            o_dv_out_b    => apb_dv_out_b,
            -- Flags
            o_empty       => mem_empty,
            o_empty_next  => mem_empty_next,
            o_full        => mem_full,
            o_full_next   => mem_full_next ,
            -- used counter
            o_used        => mem_used
            
            
            
          );
        end generate MPCVMEM_GEN;
  
      end generate MODE_MEM;
   
  end generate APB_INT_EN;


  -----------------------------------------------
  -- SINGLE MEMORY NO MONITORING
  -----------------------------------------------




  APB_INT_DIS: if not g_APBUS_ENABLED generate

    MODE_MEM: if g_MEMORY_MODE = "pipeline" generate

      MPCVMEM_GEN: if g_PIPELINE_TYPE = "mpcvmem" generate
        -- DC4_GEN: if condition generate
          
        -- end generate DC4_GEN;
        -- constant OUT_PIPELINE
        constant TOTAL_DELAY_CYCLES : integer := g_DELAY_CYCLES;

      begin
        
        
        mpcvmem : entity vamc_lib.mpcvmem
        generic map(
          g_LOGIC_TYPE    => "pipeline",
          g_MEMORY_TYPE   => g_MEMORY_TYPE,

          g_PL_DELAY_CYCLES => TOTAL_DELAY_CYCLES,
          g_MEM_WIDTH     => DATA_WIDTH,
          g_MEM_DEPTH     => TOTAL_DELAY_CYCLES
        )
        port map(
          clk           => clk,
          rst           => rst,
          ena           => ena,
          --
          i_din_a       => i_data,
          i_dv_in_a     => i_dv,
          o_dout_b      => o_data,
          o_dv_out_b    => o_dv    
        );
      end generate MPCVMEM_GEN;

    end generate MODE_MEM;
    
   
  end generate APB_INT_DIS;
  



end architecture beh;