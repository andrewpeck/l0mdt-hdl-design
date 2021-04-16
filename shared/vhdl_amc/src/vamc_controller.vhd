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
    g_FREEZE_ENABLED    : std_logic := '0';
    g_PARALLEL_MEM      : integer := 0;
    g_CONTROLLER_MODE   : string := "simple"; -- interleaved
    -- memory config
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
  -- signal mem_empty               : std_logic;
  -- signal mem_empty_next          : std_logic;
  -- signal mem_full                : std_logic;
  -- signal mem_full_next           : std_logic;
  -- signal mem_used                : integer ;--range integer(log2(real(g_PIPELINE_WIDTH) - 1 downto 0));
begin

  -----------------------------------------------
  -- MEMORY WITH MONITORING
  -----------------------------------------------

  APB_INT_EN: if g_APBUS_ENABLED generate

    signal mem_run_sel  : integer := 0;
    signal mem_apb_sel  : integer := 0;

    signal apb_addr_o              : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    signal apb_data_o               : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal apb_dv_o             : std_logic;
    signal apb_data_i              : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal apb_dv_i            : std_logic;
  
    signal int_freeze       : std_logic_vector(1 downto 0);
    signal sel_out_mem      : std_logic_vector(1 downto 0);
    signal sel_apb_mem      : std_logic_vector(1 downto 0);

    -- arrays

    type data_array is array (g_PARALLEL_MEM downto 0) of std_logic_vector(DATA_WIDTH -1 downto 0);
    type addr_array is array (g_PARALLEL_MEM downto 0) of std_logic_vector(ADDR_WIDTH -1 downto 0);
    type used_array is array (g_PARALLEL_MEM downto 0) of integer; -- add the range

    -- a
    signal mem_addr_i_a   : addr_array;
    signal mem_data_i_a   : data_array; 
    signal mem_data_o_a   : data_array;
    -- b
    signal mem_addr_i_b   : addr_array;
    signal mem_data_i_b   : data_array; 
    signal mem_data_o_b   : data_array;

    signal mem_dv_i_a     : std_logic_vector(g_PARALLEL_MEM downto 0);
    signal mem_dv_o_a     : std_logic_vector(g_PARALLEL_MEM downto 0);
    signal mem_dv_i_b     : std_logic_vector(g_PARALLEL_MEM downto 0);
    signal mem_dv_o_b     : std_logic_vector(g_PARALLEL_MEM downto 0);
    signal mem_empty      : std_logic_vector(g_PARALLEL_MEM downto 0);
    signal mem_empty_next : std_logic_vector(g_PARALLEL_MEM downto 0);
    signal mem_full       : std_logic_vector(g_PARALLEL_MEM downto 0);
    signal mem_full_next  : std_logic_vector(g_PARALLEL_MEM downto 0);

    signal mem_used       : used_array;

    -- signal mem_i_din_a    , mem1_i_din_a    : std_logic_vector(DATA_WIDTH -1 downto 0); 
    -- signal mem_i_dv_in_a  , mem1_i_dv_in_a  : std_logic;
    -- signal mem_o_dout_a   , mem1_o_dout_a   : std_logic_vector(DATA_WIDTH -1 downto 0);
    -- signal mem_o_dv_out_a , mem1_o_dv_out_a : std_logic;
    -- signal mem_i_addr_b   , mem1_i_addr_b   : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    -- signal mem_i_din_b    , mem1_i_din_b    : std_logic_vector(DATA_WIDTH - 1 downto 0);
    -- signal mem_i_dv_in_b  , mem1_i_dv_in_b  : std_logic;
    -- signal mem_o_dout_b   , mem1_o_dout_b   : std_logic_vector(DATA_WIDTH - 1 downto 0);
    -- signal mem_o_dv_out_b , mem1_o_dv_out_b : std_logic;
    -- signal mem_empty      , mem1_empty      : std_logic;
    -- signal mem_empty_next , mem1_empty_next : std_logic;
    -- signal mem_full       , mem1_full       : std_logic;
    -- signal mem_full_next  , mem1_full_next  : std_logic;
    -- signal mem_used       , mem1_used       : integer;

  begin

    apb_mem_interface : entity apbus_lib.apb_mem_int
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
        o_freeze      => int_freeze,
        o_out_sel     => sel_out_mem,
        -- o_freeze_1    => int_freeze(1),
        --
        o_addr        => apb_addr_o,  
        o_data        => apb_data_o,   
        o_dv          => apb_dv_o, 
        i_data        => apb_data_i,  
        i_dv          => apb_dv_i
      );  
    
      MODE_MEM: if g_MEMORY_MODE = "pipeline" generate

        sig_assig: process(all)
        begin
          -- general input
          for sig_i in g_PARALLEL_MEM downto 0 loop
            mem_data_i_a(sig_i) <= i_data;
            mem_dv_i_a(sig_i) <= i_dv;
          end loop;
          -- general output
          o_data <= mem_data_o_a(mem_run_sel);
          o_dv <= mem_dv_o_a(mem_run_sel);
          -- apb
          -- mem_addr_i_b(mem_apb_sel) <= apb_addr_o;
          -- mem_data_i_b(mem_apb_sel) <= apb_data_o;
          -- mem_dv_i_b(mem_apb_sel) <= apb_dv_o;
          -- apb_data_i <= mem_data_o_b(mem_apb_sel);
          -- apb_dv_i <= mem_dv_o_b(mem_apb_sel);
        end process sig_assig;

        -- mem0_i_din_a   <= i_data;
        -- mem0_i_dv_in_a <= i_dv;
        -- mem1_i_din_a   <= i_data;
        -- mem1_i_dv_in_a <= i_dv;

        -- mem0_i_addr_b   <= apb_addr_o  when sel_apb_mem(0) = '1' else (others => '0') ;
        -- mem0_i_din_b    <= apb_data_o   when sel_apb_mem(0) = '1' else (others => '0') ;
        -- mem0_i_dv_in_b  <= apb_dv_o when sel_apb_mem(0) = '1' else '0' ;
        -- mem1_i_addr_b   <= apb_addr_o  when sel_apb_mem(1) = '1' else (others => '0') ;
        -- mem1_i_din_b    <= apb_data_o   when sel_apb_mem(1) = '1' else (others => '0') ;
        -- mem1_i_dv_in_b  <= apb_dv_o when sel_apb_mem(1) = '1' else '0';

        -- apb_data_i <=   mem0_o_dout_b when sel_apb_mem = b"01" else
        --               mem1_o_dout_b when sel_apb_mem = b"10" else (others => '0') ;
        -- apb_dv_i <= mem0_o_dv_out_a when sel_apb_mem = b"01" else
        --               mem1_o_dv_out_a when sel_apb_mem = b"10" else '0' ;  

        -- o_data <= mem0_o_dout_a when sel_out_mem = b"01" else
        --           mem1_o_dout_a when sel_out_mem = b"10" else (others => '0') ;
        -- o_dv  <=  mem0_o_dv_out_a when sel_out_mem = b"01" else
        --           mem1_o_dv_out_a when sel_out_mem = b"10" else '0' ;  

        -----------------------------------------------------------------------------------------
        -- apb_data_i   <= mem0_o_dout_b  when sel_apb_mem(0) = '0' else 
        --               mem1_o_dout_b when sel_apb_mem(0) = '0' else (others => '0');
        -- apb_dv_i <= mem0_o_dv_out_b when sel_apb_mem(0) = '0' else mem1_o_dv_out_b;
        -- mem0_i_din_b    <= apb_data_o   when sel_apb_mem = b"01" else (others => '0') ;
        -- mem0_i_dv_in_b  <= apb_dv_o when sel_apb_mem = b"01" else '0' ;
        -- mem1_i_addr_b   <= apb_addr_o  when sel_apb_mem = b"10" else (others => '0') ;
        -- mem1_i_din_b    <= apb_data_o   when sel_apb_mem = b"10" else (others => '0') ;
        -- mem1_i_dv_in_b  <= apb_dv_o when sel_apb_mem = b"10" else '0';

        MPCVMEM_GEN: if g_PIPELINE_TYPE = "mpcvmem" generate
          -- DC4_GEN: if condition generate
          -- end generate DC4_GEN;
          -- constant OUT_PIPELINE
          constant TOTAL_DELAY_CYCLES : integer := g_DELAY_CYCLES - 2;
  
        begin

          -- signal_ctrl: process(clk)
          -- begin
          --   if rising_edge(clk) then
          --     if rst = '1' then

          --     else

          --     end if;
          --   end if;
          -- end process signal_ctrl;

          MEMS_GEN: for mem_i in g_PARALLEL_MEM downto 0 generate
            mpcv_mem : entity vamc_lib.mpcvmem
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
              i_freeze      => int_freeze(mem_i),
              -- Port A
              i_din_a       => mem_data_i_a(mem_i), -- i_data,
              i_dv_in_a     => mem_dv_i_a(mem_i),   -- i_dv,
              o_dout_a      => mem_data_o_a(mem_i), -- o_data,
              o_dv_out_a    => mem_dv_o_a(mem_i),   -- o_dv,
              -- Port B
              i_addr_b      => mem_addr_i_b(mem_i), -- apb_addr_o,  
              i_din_b       => mem_data_i_b(mem_i), -- apb_data_o,   
              i_dv_in_b     => mem_dv_i_b(mem_i),   -- apb_dv_o, 
              o_dout_b      => mem_data_o_b(mem_i), -- apb_data_i,  
              o_dv_out_b    => mem_dv_o_b(mem_i),   -- apb_dv_i,
              -- Flags
              o_empty       => mem_empty(mem_i),
              o_empty_next  => mem_empty_next(mem_i),
              o_full        => mem_full(mem_i),
              o_full_next   => mem_full_next(mem_i),
              -- used counter
              o_used        => mem_used(mem_i)
            );
          end generate MEMS_GEN;
          
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