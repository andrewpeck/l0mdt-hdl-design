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

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
use shared_lib.config_pkg.all;
-- use shared_lib.vhdl2008_functions_pkg.all;
use shared_lib.detector_param_pkg.all;

entity gldl_tests_top is
  generic (
    DUMMY             : boolean := false
  );
  port (
    clk               : in std_logic;
    rst               : in std_logic;
    --
    i_test_signal     : in std_logic_vector(31 downto 0);
    o_test_signal     : out std_logic_vector(31 downto 0);

    sump              : in std_logic
  );
end entity gldl_tests_top;

architecture beh of gldl_tests_top is

  constant RAM_DEPTH : integer := 10;

  signal num_delays : integer := RAM_DEPTH;
  
begin

  ring_mem : entity shared_lib.ring_buffer_v2
    generic map (
      g_SIMULATION => '1',
      LOGIC_TYPE    => "pipeline",
      MEMORY_TYPE   => "block",
      -- PIPELINE_IN_REGS => 1,
      -- PIPELINE_OUT_REGS => 1,
      RAM_WIDTH     => i_test_signal'length,
      RAM_DEPTH     => RAM_DEPTH + 1 
    )
    port map (
      clk           => clk,
      rst           => rst,
      --
      i_delay         => num_delays,
      --
      i_wr          => '1',
      i_wr_data     => i_test_signal,
      --
      i_rd          => '1',
      o_rd_dv       => open,
      o_rd_data     => o_test_signal,
      --
      o_empty       => open,
      o_empty_next  => open,
      o_full        => open,
      o_full_next   => open,
      o_used        => open
    );

  
  
end architecture beh;