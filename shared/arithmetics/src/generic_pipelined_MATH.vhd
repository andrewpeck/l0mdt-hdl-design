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

library shared_lib;
use shared_lib.generic_pipelined_MATH_pkg.all;


entity generic_pipelined_MATH is
  generic (
    g_OPERATION       : string;--:= "*";
    g_IN_PIPE_STAGES  : integer := 2;      -- specifies how many pipeline registers to instantiate at the input of multiplier
    g_OPERAND_A_WIDTH : integer := 16;     -- width of the first multiplier operand
    g_OPERAND_B_WIDTH : integer := 16;     -- width of the second multiplier operand
    g_OUT_PIPE_STAGES : integer := 2;       -- number of the pipeline registers to instantiate at the output of multiplier
    g_RESULT_WIDTH    : integer := arith_get_out_width(g_OPERATION,g_OPERAND_A_WIDTH,g_OPERAND_B_WIDTH)
  );
  port (
    -- clock and reset signals
    clk           : in std_logic;
    rst           : in std_logic;
    -- input operands
    i_in_A        : in std_logic_vector(g_OPERAND_A_WIDTH-1 downto 0);
    i_in_B        : in std_logic_vector(g_OPERAND_B_WIDTH-1 downto 0);
    i_dv          : in std_logic; -- specifies that A and B inputs are valid, so their values can be propagated through the pipeline
    -- output product
    o_result      : out std_logic_vector((g_RESULT_WIDTH-1) downto 0);
    o_dv          : out std_logic -- valid signal for an output product
  );
end generic_pipelined_MATH;

architecture beh of generic_pipelined_MATH is

  constant TOTAL_MUL_LATENCY : integer := g_IN_PIPE_STAGES + g_OUT_PIPE_STAGES;

  type data_pl_A_t is array (integer range <>) of std_logic_vector(g_OPERAND_A_WIDTH-1 downto 0);
  type data_pl_B_t is array (integer range <>) of std_logic_vector(g_OPERAND_B_WIDTH-1 downto 0);
  type data_pl_O_t is array (integer range <>) of std_logic_vector((g_RESULT_WIDTH-1) downto 0);

  signal mul_in_pipe_A : data_pl_A_t(g_IN_PIPE_STAGES -1 downto 0);
  signal mul_in_pipe_B : data_pl_B_t(g_IN_PIPE_STAGES -1 downto 0);
  signal mul_output_pipe : data_pl_O_t(g_OUT_PIPE_STAGES -1 downto 0);

  signal valid_signal_pipe : std_logic_vector(TOTAL_MUL_LATENCY - 1 downto 0);
  
begin

  -- IN_PL: if g_IN_PIPE_STAGES = 0 generate
  -- else generate
  -- end generate IN_PL;
  
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        mul_in_pipe_A <= (others => (others => '0'));
        mul_in_pipe_B <= (others => (others => '0'));
        valid_signal_pipe <= (others => '0');
        mul_output_pipe <= (others => (others => '0'));
        o_result <= (others => '0');
        o_dv <= '0';
      else
        if i_dv then
          valid_signal_pipe(0) <= i_dv;
          mul_in_pipe_A(0) <= i_in_A;
          mul_in_pipe_B(0) <= i_in_B;
        else
          valid_signal_pipe(0) <= '0';
          mul_in_pipe_A(0) <= (others => '0');
          mul_in_pipe_B(0) <= (others => '0');
        end if;

        for i in 1 to (g_IN_PIPE_STAGES-1) loop
          mul_in_pipe_A(i) <=  mul_in_pipe_A(i-1);
          mul_in_pipe_B(i) <=  mul_in_pipe_B(i-1);
        end loop;

        case g_OPERATION is
          when "*" =>
            mul_output_pipe(0) <=std_logic_vector(
              signed(mul_in_pipe_A(g_IN_PIPE_STAGES-1)) * signed( mul_in_pipe_B(g_IN_PIPE_STAGES-1))
            );
          when "-" =>
            mul_output_pipe(0) <=std_logic_vector(
              signed(mul_in_pipe_A(g_IN_PIPE_STAGES-1)) - signed( mul_in_pipe_B(g_IN_PIPE_STAGES-1))
            );
          when others =>
        end case;

        

        for j in 1 to (g_OUT_PIPE_STAGES-1) loop
          mul_output_pipe(j) <=  mul_output_pipe(j-1);
        end loop;

        o_result <= mul_output_pipe(g_OUT_PIPE_STAGES-1);

        for n in 1 to (TOTAL_MUL_LATENCY-1) loop
          valid_signal_pipe(n) <=  valid_signal_pipe(n-1);
        end loop;
        o_dv <= valid_signal_pipe(TOTAL_MUL_LATENCY-1);
      end if;
    end if;
  end process;
  
end architecture beh;