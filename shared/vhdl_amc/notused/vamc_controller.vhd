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
--      simple with no apb controller : done , seems to work ok
--      simple with apb controller : not done
--      parallel mems with apb controller : doing
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee.all;

library vamc_lib;
library apbus_lib;
library mpcvmem_lib;

-- library ctrl_lib;
--   use ctrl_lib.MPL_CTRL.all;
  -- use ctrl_lib.MEM_INT_10A148D_PKG.all;
  -- use ctrl_lib.MEM_INT_12A148D_PKG.all;

entity vamc_controller is
  generic(
    g_FREEZE_ENABLED    : std_logic := '0';
    g_PARALLEL_MEM      : integer := 1;
    g_CONTROLLER_MODE   : string := "interleaved"; -- simple, interleaved
    -- memory config
    g_MEMORY_MODE       : string := "pipeline";
    g_MEMORY_TYPE       : string := "distributed" ;-- auto, ultra, block, distributed
    g_ADDR_WIDTH        : integer := 0;
    g_DATA_WIDTH        : integer := 0;
    g_DATA_DEPTH        : integer := 0;
    -- pipeline
    g_PIPELINE_TYPE     : string := "shift_reg";-- shift_reg , ring_buffer , mpcvmem 
    g_MEMORY_STRUCTURE  : string := "SDP";
    g_DELAY_CYCLES      : integer; 
    g_DELAY_EQUAL_WIDTH : integer := 0;
    g_PIPELINE_WIDTH    : integer;
    -- INT CTRL

    -- BU bus
    g_APBUS_ENABLED     : std_logic := '0';
    g_XML_NODE_NAME     : string := "none";
    g_APBUS_CTRL_WIDTH  : integer := 8;
    g_APBUS_MON_WIDTH   : integer := 4
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    ena                 : in std_logic;
    -- Ctrl/Mon
    ctrl                : in std_logic_vector(g_APBUS_CTRL_WIDTH - 1 downto 0) := (others => '0');
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

  function init_ADDR_WIDTH(m : integer; d:integer; x : integer) return integer is
    variable y : integer;
   begin
    if m /= 0 then
      y := m;
    elsif d/= 0 then
      y := integer(ceil(log2(real(d))));
    else
      y := integer(ceil(log2(real(x))));
    end if;
    return y;
  end function;
  
  function init_DATA_DEPTH(m : integer; d:integer; x : integer) return integer is
    variable y : integer;
   begin
    if m /= 0 then
      y := 2**m;
    elsif d/= 0 then
      y := d;
    else
      y := x;
    end if;
    return y;
  end function;

  constant FREEZE_EN : std_logic := g_FREEZE_ENABLED OR g_APBUS_ENABLED;
  constant ADDR_WIDTH : integer := init_ADDR_WIDTH(g_ADDR_WIDTH,g_DATA_DEPTH,g_DELAY_CYCLES);--integer(ceil(log2(real(g_MEM_DEPTH))));
  constant DATA_DEPTH : integer := init_DATA_DEPTH(g_ADDR_WIDTH,g_DATA_DEPTH,g_DELAY_CYCLES);--integer(ceil(log2(real(g_MEM_DEPTH))));
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

  APB_EN: if g_APBUS_ENABLED generate

    signal mem_run_sel  : integer range 0 to g_PARALLEL_MEM;
    signal mem_apb_sel  : integer range 0 to g_PARALLEL_MEM;

    signal apb_rd_addr_o       : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    signal apb_wr_addr_o       : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    signal apb_data_o       : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal apb_dv_o         : std_logic;
    signal apb_data_i       : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal apb_dv_i         : std_logic;
  
    signal int_apb_freeze       : std_logic; --_vector(g_PARALLEL_MEM downto 0);
    signal int_ker_freeze       : std_logic_vector(g_PARALLEL_MEM downto 0);
    signal int_apb_sel          : std_logic_vector(g_PARALLEL_MEM downto 0);
    -- signal sel_out_mem      : std_logic_vector(1 downto 0);
    -- signal sel_apb_mem      : std_logic_vector(1 downto 0);

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

  begin

    vam_kernel : entity vamc_lib.vamc_kernel
    generic map(
      g_PARALLEL_MEM => g_PARALLEL_MEM
    )
    port map(
      clk           => clk,
      rst           => rst,
      ena           => ena,
      -- std_l
      i_freeze      => i_freeze,
      i_apb_freeze  => int_apb_freeze,
      -- vectors
      o_freeze      => int_ker_freeze,
      o_apb_sel_v   => int_apb_sel,
      -- integers
      o_sel_run     => mem_run_sel,
      o_sel_apb     => mem_apb_sel
    );

    apb_mem_interface : entity apbus_lib.apb_mem_int
      generic map(
        g_XML_NODE_NAME         => g_XML_NODE_NAME,
        g_INTERNAL_CLK          => '1',
        g_ADDR_WIDTH            => ADDR_WIDTH,
        g_DATA_WIDTH            => DATA_WIDTH,
        -- g_CTRL_TYPE             => MEM_INT_12A148D_CTRL_t; 
        -- g_MON_TYPE              => MEM_INT_12A148D_MON_t;   
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
        -- i_freeze      => i_freeze,
        o_freeze      => int_apb_freeze,
        -- o_out_sel     => sel_out_mem,
        -- o_freeze_1    => int_freeze(1),
        --
        o_rd_addr     => apb_rd_addr_o,  
        o_wr_addr     => apb_wr_addr_o,  
        o_data        => apb_data_o,   
        o_dv          => apb_dv_o, 
        i_data        => apb_data_i,  
        i_dv          => apb_dv_i
    );  
    
      MODE_PL: if g_MEMORY_MODE = "pipeline" generate
        -- general output
        o_data <= mem_data_o_b(mem_run_sel);
        o_dv <= mem_dv_o_b(mem_run_sel);

        SIG_SEL : for sel_i in g_PARALLEL_MEM downto 0 generate
          mem_data_i_a(sel_i) <= apb_data_o           when int_apb_sel(sel_i) = '1' else i_data;
          mem_dv_i_a(sel_i)   <= apb_dv_o             when int_apb_sel(sel_i) = '1' else i_dv;
          mem_addr_i_a(sel_i) <= apb_wr_addr_o        when int_apb_sel(sel_i) = '1' else (others => '0');
          mem_addr_i_b(sel_i) <= apb_rd_addr_o        when int_apb_sel(sel_i) = '1' else (others => '0');
          apb_data_i          <= mem_data_o_b(sel_i)  when int_apb_sel(sel_i) = '1' else (others => '0');
          apb_dv_i            <= mem_dv_o_b(sel_i)    when int_apb_sel(sel_i) = '1' else '0';
        end generate SIG_SEL;

        MPCVMEM_GEN: if g_PIPELINE_TYPE = "mpcvmem" generate
          -- DC4_GEN: if condition generate
          -- end generate DC4_GEN;
          -- constant OUT_PIPELINE
          constant TOTAL_DELAY_CYCLES : integer := g_DELAY_CYCLES - 2;
  
          begin

          MEMS_GEN: for mem_i in g_PARALLEL_MEM downto 0 generate
            mpcv_mem : entity mpcvmem_lib.mpcvm_top
            generic map(
              g_LOGIC_TYPE    => "pipeline",
              g_MEMORY_TYPE   => g_MEMORY_TYPE,
              g_MEMORY_STRUCTURE => g_MEMORY_STRUCTURE,
              g_SECOND_PORT => "monitor",
    
              g_PL_DELAY_CYCLES => TOTAL_DELAY_CYCLES,
              g_OUT_PIPELINE    => 2,
              g_MEM_WIDTH     => DATA_WIDTH,
              g_MEM_DEPTH     => DATA_DEPTH
            )
            port map(
              clk           => clk,
              rst           => rst,
              ena           => ena,
              --
              i_freeze      => int_ker_freeze(mem_i),
              i_ext_ctrl    => int_apb_sel(mem_i),
              -- Port A
              i_addr_a      => mem_addr_i_a(mem_i),
              i_din_a       => mem_data_i_a(mem_i), -- i_data,
              i_dv_in_a     => mem_dv_i_a(mem_i),   -- i_dv,
              o_dout_a      => open,--mem_data_o_a(mem_i), -- o_data,
              -- o_dv_out_a    => mem_dv_o_a(mem_i),   -- o_dv,
              -- Port B
              i_addr_b      => mem_addr_i_b(mem_i), -- apb_rd_addr_o,  
              -- i_din_b       => mem_data_i_b(mem_i), -- apb_data_o,   
              -- i_dv_in_b     => mem_dv_i_b(mem_i),   -- apb_dv_o, 
              o_dout_b      => mem_data_o_b(mem_i), -- apb_data_i,  
              o_dv_out_b    => mem_dv_o_b(mem_i)   -- apb_dv_i,
              -- Flags
              -- o_empty       => mem_empty(mem_i),
              -- o_empty_next  => mem_empty_next(mem_i),
              -- o_full        => mem_full(mem_i),
              -- o_full_next   => mem_full_next(mem_i),
              -- -- used counter
              -- o_used        => mem_used(mem_i)
            );
          end generate MEMS_GEN;
          
        end generate MPCVMEM_GEN;

      end generate MODE_PL;
  -- end generate APB_INT_EN;

  else generate
  -----------------------------------------------
  -- SINGLE MEMORY NO MONITORING
  -----------------------------------------------
  -- APB_INT_DIS: if not g_APBUS_ENABLED generate

    MODE_MEM: if g_MEMORY_MODE = "pipeline" generate
      MPCVMEM_GEN: if g_PIPELINE_TYPE = "mpcvmem" generate
        -- DC4_GEN: if condition generate   
        -- end generate DC4_GEN;
        -- constant OUT_PIPELINE
        constant TOTAL_DELAY_CYCLES : integer := g_DELAY_CYCLES;
      begin        
        mpcvmem : entity mpcvmem_lib.mpcvm_top
        generic map(
          g_LOGIC_TYPE    => "pipeline",
          g_MEMORY_TYPE   => g_MEMORY_TYPE,

          g_PL_DELAY_CYCLES => TOTAL_DELAY_CYCLES,
          g_OUT_PIPELINE    => 2,
          g_MEM_WIDTH       => DATA_WIDTH,
          g_MEM_DEPTH       => DATA_DEPTH
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
      SDPM_GEN: if g_PIPELINE_TYPE = "SDPM" generate
          constant TOTAL_DELAY_CYCLES : integer := g_DELAY_CYCLES;
        begin  
        mpcvmem : entity mpcvmem_lib.mpcvm_top
        generic map(
          g_LOGIC_TYPE    => "pipeline",
          g_MEMORY_TYPE   => g_MEMORY_TYPE,
          g_MEMORY_STRUCTURE => "SDP_2",
          g_PL_DELAY_CYCLES => TOTAL_DELAY_CYCLES,
          g_OUT_PIPELINE    => 2,
          g_MEM_WIDTH       => DATA_WIDTH,
          g_MEM_DEPTH       => DATA_DEPTH
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
      end generate SDPM_GEN;
      XPM_GEN: if g_PIPELINE_TYPE = "XPM" generate
          constant TOTAL_DELAY_CYCLES : integer := g_DELAY_CYCLES;
        begin  
        mpcvmem : entity mpcvmem_lib.mpcvm_top
        generic map(
          g_LOGIC_TYPE    => "pipeline",
          g_MEMORY_TYPE   => g_MEMORY_TYPE,
          g_MEMORY_STRUCTURE => "XPM",
          g_PL_DELAY_CYCLES => TOTAL_DELAY_CYCLES,
          g_OUT_PIPELINE    => 2,
          g_MEM_WIDTH       => DATA_WIDTH,
          g_MEM_DEPTH       => DATA_DEPTH
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
      end generate XPM_GEN;
    end generate MODE_MEM;




  end generate;
  



end architecture beh;