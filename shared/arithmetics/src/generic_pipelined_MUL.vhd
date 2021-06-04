--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  gloustau@cern.ch
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger 
--  Module: Configurable pipeline Multiplier 
--  Description:
-- ORIGINAL: https://forums.xilinx.com/t5/Synthesis/DSP48E2-not-pipelined-DRC-DPOP-4-warning/m-p/1209090#M37753
--
--------------------------------------------------------------------------------
--  Revisions:
--      
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.math_real.all;


entity generic_pipelined_MUL is
  generic (
     IN_PIPE_STAGES  : integer := 2;      -- specifies how many pipeline registers to instantiate at the input of multiplier
     OPERAND_A_WIDTH : integer := 16;     -- width of the first multiplier operand
     OPERAND_B_WIDTH : integer := 16;     -- width of the second multiplier operand
     OUT_PIPE_STAGES : integer := 2       -- number of the pipeline registers to instantiate at the output of multiplier
  );
  port (
    -- clock and reset signals
    clk           : in std_logic;
    rst           : in std_logic;
    -- input operands
    i_in_A        : in std_logic_vector(OPERAND_A_WIDTH-1 downto 0);
    i_in_B        : in std_logic_vector(OPERAND_B_WIDTH-1 downto 0);
    i_dv          : in std_logic; -- specifies that A and B inputs are valid, so their values can be propagated through the pipeline
    -- output product
    o_result      : out std_logic_vector((OPERAND_A_WIDTH+OPERAND_B_WIDTH-1) downto 0);
    o_dv          : out std_logic -- valid signal for an output product
  );
end generic_pipelined_MUL;

architecture beh of generic_pipelined_MUL is

  constant TOTAL_MUL_LATENCY : integer := IN_PIPE_STAGES + OUT_PIPE_STAGES;

  type data_pl_A_t is array (integer range <>) of std_logic_vector(OPERAND_A_WIDTH-1 downto 0);
  type data_pl_B_t is array (integer range <>) of std_logic_vector(OPERAND_B_WIDTH-1 downto 0);
  type data_pl_O_t is array (integer range <>) of std_logic_vector((OPERAND_A_WIDTH+OPERAND_B_WIDTH-1) downto 0);

  signal mul_in_pipe_A : data_pl_A_t(IN_PIPE_STAGES -1 downto 0);
  signal mul_in_pipe_B : data_pl_B_t(IN_PIPE_STAGES -1 downto 0);
  signal mul_output_pipe : data_pl_O_t(OUT_PIPE_STAGES -1 downto 0);

  signal valid_signal_pipe : std_logic_vector(TOTAL_MUL_LATENCY - 1 downto 0);
  
begin
  
  process(clk, rst)
  begin
    if rising_edge(clk) then
      if rst = '0' then
        mul_in_pipe_A <= (others => (others => '0'));
        mul_in_pipe_B <= (others => (others => '0'));
        valid_signal_pipe <= (others => '0');
        mul_output_pipe <= (others => (others => '0'));
        o_result <= (others => '0');
        o_dv <= '0';
      else
        valid_signal_pipe(0) <= i_dv;
        mul_in_pipe_A(0) <= i_in_A;
        mul_in_pipe_B(0) <= i_in_B;

        for i in 1 to (IN_PIPE_STAGES-1) loop
          mul_in_pipe_A(i) <=  mul_in_pipe_A(i-1);
          mul_in_pipe_B(i) <=  mul_in_pipe_B(i-1);
        end loop;

        mul_output_pipe(0) <= mul_in_pipe_A(IN_PIPE_STAGES-1) * mul_in_pipe_B(IN_PIPE_STAGES-1);

        for j in 1 to (OUT_PIPE_STAGES-1) loop
          mul_output_pipe(j) <=  mul_output_pipe(j-1);
        end loop;

        o_result <= mul_output_pipe(OUT_PIPE_STAGES-1);

        for n in 1 to (TOTAL_MUL_LATENCY-1) loop
          valid_signal_pipe(n) <=  valid_signal_pipe(n-1);
        end loop;
        o_dv <= valid_signal_pipe(TOTAL_MUL_LATENCY-1);
      end if;
    end if;
  end process;
  
end architecture beh;