--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger
--  Module: some stand alone simulations
--  Description:
--
--------------------------------------------------------------------------------
--  Revisions:
--
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;
-- use ieee.math_real.all;

entity gldl_tests_top is
  port (
    clk               : in std_logic;
    rst               : in std_logic;
    --
    i_test_signal     : in std_logic_vector(31 downto 0)
  );
end entity gldl_tests_top;

architecture beh of gldl_tests_top is
  
begin
  
  RING : if logic_type = "ring_buffer" generate
    ring_mem : entity shared_lib.ring_buffer_v2
      generic map (
        LOGIC_TYPE    => "pipeline",
        MEMORY_TYPE   => "block",
        -- PIPELINE_IN_REGS => 1,
        -- PIPELINE_OUT_REGS => 1,
        RAM_WIDTH     => num_bits,
        RAM_DEPTH     => num_delays + 1 
      )
      port map (
        clk           => clk,
        rst           => rst,
        --
        i_delay         => num_delays,
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
  
  
end architecture beh;