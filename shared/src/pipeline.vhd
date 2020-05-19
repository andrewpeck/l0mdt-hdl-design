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

library ieee, shared_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity std_pipeline is
  generic(
    num_delays          : integer; 
    num_bits            : integer
  );
  port (
    clk                 : in std_logic;
    Reset_b             : in std_logic;
    glob_en             : in std_logic;
    --
    i_data              : in std_logic_vector(num_bits -1 downto 0);
    o_data              :out std_logic_vector(num_bits -1 downto 0)
  );
end entity std_pipeline;

architecture beh of std_pipeline is

  type data_pl_at is array (num_delays -1 downto 0) of std_logic_vector(num_bits -1 downto 0);
  signal data_pl : data_pl_at;

begin
  
  o_data <= data_pl(0);

  valid_pipe : process(Reset_b,clk) begin
    if rising_edge(clk)then
      if Reset_b = '0' then
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

end beh;