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
-- use ieee.math_real.all;

library shared_lib;

entity std_pipeline is
  generic(
    g_MEMORY_TYPE       : string := "distributed" ;-- auto, ultra, block, distributed
    g_PIPELINE_TYPE     : string := "shift_reg";-- shift_reg , ring_buffer , mpcvmem 
    g_DELAY_CYCLES      : integer; 
    g_DELAY_EQUAL_WIDTH : integer := 0;
    g_PIPELINE_WIDTH    : integer
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_freeze            : in std_logic := '0';
    --
    i_data              : in std_logic_vector(g_PIPELINE_WIDTH -1 downto 0);
    i_dv                : in std_logic := '0';
    o_data              : out std_logic_vector(g_PIPELINE_WIDTH -1 downto 0);
    o_dv                : out std_logic
  );
end entity std_pipeline;

architecture beh of std_pipeline is

  -- type data_pl_at is array (g_DELAY_CYCLES -1 downto 0) of std_logic_vector(g_PIPELINE_WIDTH -1 downto 0);
  -- signal data_pl : data_pl_at;
  -- attribute ram_style : string;
  -- attribute ram_style of data_pl : signal is g_MEMORY_TYPE;
  -- "ultra" for ultra ram
  -- "distributed" for normal logic cells

begin
  
  

  SHIFT_GEN : if g_PIPELINE_TYPE = "shift_reg" generate
    type data_pl_at is array (g_DELAY_CYCLES -1 downto 0) of std_logic_vector(g_PIPELINE_WIDTH -1 downto 0);
    signal data_pl : data_pl_at;
    signal dv_pl : std_logic_vector(g_DELAY_CYCLES -1 downto 0);
    attribute ram_style : string;
    attribute ram_style of data_pl : signal is g_MEMORY_TYPE;
  begin

    o_data <= data_pl(0);
    o_dv <= dv_pl(0);

    valid_pipe : process(rst,clk) begin
      if rising_edge(clk)then
        if rst= '1' then
          -- data_pl <= (others => (others => '0'));
          dv_pl <= (others => '0');
        else
          if glob_en = '1' then
            for delay_i in g_DELAY_CYCLES - 1 downto 1 loop
              data_pl(delay_i - 1) <= data_pl(delay_i);
              dv_pl(delay_i - 1) <= dv_pl(delay_i);
            end loop;
            data_pl(g_DELAY_CYCLES - 1) <= i_data;
            dv_pl(g_DELAY_CYCLES - 1) <= i_dv;
          end if;
        end if;
      end if;
    end process;

  end generate;

  RING_GEN : if g_PIPELINE_TYPE = "ring_buffer" generate
    ring_mem : entity shared_lib.ring_buffer_v2
      generic map (
        -- pragma translate_off
        g_SIMULATION => '1',
        -- pragma translate_on

        g_LOGIC_TYPE    => "pipeline",
        g_MEMORY_TYPE   => g_MEMORY_TYPE,--"block",
        -- g_PIPELINE_IN_REGS => 1,
        g_PIPELINE_OUT_REGS => 4,
        g_RAM_WIDTH     => g_PIPELINE_WIDTH,
        g_RAM_DEPTH     => g_DELAY_CYCLES + 1 
      )
      port map (
        clk           => clk,
        rst           => rst,
        --
        i_delay         => g_DELAY_CYCLES,
        --
        i_wr          => '1',
        i_wr_data     => i_data,
        --
        i_rd          => '1',
        o_rd_dv       => open,
        o_rd_data     => o_data,
        --
        o_empty       => open,
        o_empty_next  => open,
        o_full        => open,
        o_full_next   => open,
        o_used        => open
      );
  end generate;

  MPCVMEM_GEN: if g_PIPELINE_TYPE = "mpcvmem" generate
    -- DC4_GEN: if condition generate
      
    -- end generate DC4_GEN;
    -- constant OUT_PIPELINE
    constant TOTAL_DELAY_CYCLES : integer := g_DELAY_CYCLES;

  begin
    
    
    mpcvmem : entity shared_lib.mpcvmem
    generic map(
      g_LOGIC_TYPE    => "pipeline",
      g_MEMORY_TYPE   => g_MEMORY_TYPE,

      g_PL_DELAY_CYCLES => TOTAL_DELAY_CYCLES,
      g_MEM_WIDTH     => g_PIPELINE_WIDTH,
      g_MEM_DEPTH     => TOTAL_DELAY_CYCLES
    )
    port map(
      clk           => clk,
      rst           => rst,
      ena           => glob_en,
      --
      i_din_a       => i_data,
      i_dv_in_a     => i_dv,
      o_dout_b      => o_data,
      o_dv_out_b    => o_dv    
    );
  end generate MPCVMEM_GEN;

end beh;