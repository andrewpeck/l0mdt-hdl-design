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

Library xpm;
use xpm.vcomponents.all;

entity vamc_top is
  generic(
    g_FREEZE_ENABLED    : std_logic := '0';
    g_PARALLEL_MEM      : integer := 0;
    g_CONTROLLER_MODE   : string := "simple"; -- simple, interleaved
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
end entity vamc_top;

architecture beh of vamc_top is

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

  --
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

  VAMC_CTRL_EXT : entity vamc_lib.vamc_ctrl_ext
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

  APB_EN: if g_APBUS_ENABLED generate

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
    
  end generate;

  o_data <= mem_data_o_b(mem_run_sel);
  o_dv <= mem_dv_o_b(mem_run_sel);

  SIG_SEL : for sel_i in g_PARALLEL_MEM downto 0 generate
    -- signals
    mem_data_i_a(sel_i) <= apb_data_o           when int_apb_sel(sel_i) = '1' else i_data;
    mem_dv_i_a(sel_i)   <= apb_dv_o             when int_apb_sel(sel_i) = '1' else i_dv;
    mem_addr_i_a(sel_i) <= apb_wr_addr_o        when int_apb_sel(sel_i) = '1' else (others => '0');
    mem_addr_i_b(sel_i) <= apb_rd_addr_o        when int_apb_sel(sel_i) = '1' else (others => '0');
    apb_data_i          <= mem_data_o_b(sel_i)  when int_apb_sel(sel_i) = '1' else (others => '0');
    apb_dv_i            <= mem_dv_o_b(sel_i)    when int_apb_sel(sel_i) = '1' else '0';
    -- mem controller
    VAMC_CTRL_PL : entity vamc_lib.vamc_ctrl_pl
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
    -- mem
    xpm_memory_sdpram_inst : xpm_memory_sdpram
    generic map (
       ADDR_WIDTH_A => ADDR_WIDTH,               -- DECIMAL
       ADDR_WIDTH_B => ADDR_WIDTH,               -- DECIMAL
       AUTO_SLEEP_TIME => 0,            -- DECIMAL
       BYTE_WRITE_WIDTH_A => DATA_WIDTH,--32,        -- DECIMAL
       CASCADE_HEIGHT => 0,             -- DECIMAL
       CLOCKING_MODE => "common_clock", -- String
       ECC_MODE => "no_ecc",            -- String
       MEMORY_INIT_FILE => "none",      -- String
       MEMORY_INIT_PARAM => "0",        -- String
       MEMORY_OPTIMIZATION => "true",   -- String
       MEMORY_PRIMITIVE => "ultra",      -- String
       MEMORY_SIZE => DATA_WIDTH * DATA_DEPTH,             -- DECIMAL
       MESSAGE_CONTROL => 0,            -- DECIMAL
       READ_DATA_WIDTH_B => DATA_WIDTH,--32,         -- DECIMAL
       READ_LATENCY_B => 2,             -- DECIMAL
       READ_RESET_VALUE_B => "0",       -- String
       RST_MODE_A => "SYNC",            -- String
       RST_MODE_B => "SYNC",            -- String
       SIM_ASSERT_CHK => 0,             -- DECIMAL; 0=disable simulation messages, 1=enable simulation messages
       USE_EMBEDDED_CONSTRAINT => 0,    -- DECIMAL
       USE_MEM_INIT => 1,               -- DECIMAL
       WAKEUP_TIME => "disable_sleep",  -- String
       WRITE_DATA_WIDTH_A => DATA_WIDTH,--32,        -- DECIMAL
       WRITE_MODE_B => "read_first"      -- String
    )
    port map (
      --  dbiterrb => dbiterrb,             -- 1-bit output: Status signal to indicate double bit error occurrence
                                         -- on the data output of port B.
 
       doutb => mem_out_b,--doutb,                   -- READ_DATA_WIDTH_B-bit output: Data output for port B read operations.
      --  sbiterrb => sbiterrb,             -- 1-bit output: Status signal to indicate single bit error occurrence
                                         -- on the data output of port B.
 
       addra => mem_addr_a,                   -- ADDR_WIDTH_A-bit input: Address for port A write operations.
       addrb => mem_addr_b,                   -- ADDR_WIDTH_B-bit input: Address for port B read operations.
       clka => clk,                     -- 1-bit input: Clock signal for port A. Also clocks port B when
                                         -- parameter CLOCKING_MODE is "common_clock".
 
       clkb => clk,                     -- 1-bit input: Clock signal for port B when parameter CLOCKING_MODE is
                                         -- "independent_clock". Unused when parameter CLOCKING_MODE is
                                         -- "common_clock".
 
       dina => mem_in_a,--dina,                     -- WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
       ena => ena,                       -- 1-bit input: Memory enable signal for port A. Must be high on clock
                                         -- cycles when write operations are initiated. Pipelined internally.
 
       enb => ena,                       -- 1-bit input: Memory enable signal for port B. Must be high on clock
                                         -- cycles when read operations are initiated. Pipelined internally.
 
       injectdbiterra => '0',--injectdbiterra, -- 1-bit input: Controls double bit error injection on input data when
                                         -- ECC enabled (Error injection capability is not available in
                                         -- "decode_only" mode).
 
       injectsbiterra => '0',--injectsbiterra, -- 1-bit input: Controls single bit error injection on input data when
                                         -- ECC enabled (Error injection capability is not available in
                                         -- "decode_only" mode).
 
       regceb => '1',--regceb,                 -- 1-bit input: Clock Enable for the last register stage on the output
                                         -- data path.
 
       rstb => rst,                     -- 1-bit input: Reset signal for the final port B output register
                                         -- stage. Synchronously resets output port doutb to the value specified
                                         -- by parameter READ_RESET_VALUE_B.
 
       sleep => '0',--sleep,                   -- 1-bit input: sleep signal to enable the dynamic power saving feature.
       wea => b"1" --wea                        -- WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A-bit input: Write enable vector
                                         -- for port A input data port dina. 1 bit wide when word-wide writes
                                         -- are used. In byte-wide write configurations, each bit controls the
                                         -- writing one byte of dina to address addra. For example, to
                                         -- synchronously write only bits [15-8] of dina when WRITE_DATA_WIDTH_A
                                         -- is 32, wea would be 4'b0010.
 
    );
  end generate SIG_SEL;


  



end architecture beh;