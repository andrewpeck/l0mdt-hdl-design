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
    type_memory         : string := "distributed" ;-- auto, ultra, block, distributed
    logic_type          : string := "shift_reg";-- shift_reg , ring_buffer 
    num_delays          : integer; 
    num_bits            : integer
  );
  port (
    clk                 : in std_logic;
    rst                 : in std_logic;
    glob_en             : in std_logic;
    --
    i_data              : in std_logic_vector(num_bits -1 downto 0);
    o_data              :out std_logic_vector(num_bits -1 downto 0)
  );
end entity std_pipeline;

architecture beh of std_pipeline is

  type data_pl_at is array (num_delays -1 downto 0) of std_logic_vector(num_bits -1 downto 0);
  signal data_pl : data_pl_at;

  attribute ram_style : string;
  attribute ram_style of data_pl : signal is type_memory;
  -- "ultra" for ultra ram
  -- "distributed" for normal logic cells

begin
  
  o_data <= data_pl(0);

  SHIFT : if logic_type = "shift_reg" generate

    valid_pipe : process(rst,clk) begin
      if rising_edge(clk)then
        if rst= '1' then
          data_pl <= (others => (others => '0'));
        else
          if glob_en = '1' then
            for num_delays in num_delays - 1 downto 1 loop
              data_pl(num_delays - 1) <= data_pl(num_delays);
            end loop;
            data_pl(num_delays -1) <= i_data;
          end if;
        end if;
      end if;
    end process;

end generate;

RING : if logic_type = "shift_reg" generate
  u_daq_inner_delay : entity shared_lib.ring_buffer
    generic map (
      MEMORY_TYPE => type_memory,
      -- PIPELINE_REGS => num_delays,
      RAM_WIDTH   => num_bits,
      RAM_DEPTH   => num_delays - 2,
      FIXED_DELAY   => true
    )
    port map (
      clk          => clk,
      rst          => rst,
      delay        => num_delays-1-2,
      wr_en_i      => '1',
      wr_data_i    => i_data,
      rd_en_i      => '1',
      rd_valid_o   => open,
      rd_data_o    => o_data,
      empty_o      => open,
      empty_next_o => open,
      full_o       => open,
      full_next_o  => open,
      fill_count_o => open
    );
end generate;

end beh;