--------------------------------------------------------------------------------
--  UMass , Physics Department
--  Guillermo Loustau de Linares
--  guillermo.ldl@cern.ch
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
    g_INFER_DSP       : std_logic := '0';
    g_OPERATION       : string;--:= "*";
    g_IN_PIPE_STAGES  : integer := 2;      -- specifies how many pipeline registers to instantiate at the input of multiplier
    -- g_OPERAND_A_WIDTH : integer := 16;     -- width of the first multiplier operand
    -- g_OPERAND_B_WIDTH : integer := 16;     -- width of the second multiplier operand
    g_OUT_PIPE_STAGES : integer := 2;       -- number of the pipeline registers to instantiate at the output of multiplier
    -- g_RESULT_WIDTH    : integer := arith_get_out_width(g_OPERATION,g_OPERAND_A_WIDTH,g_OPERAND_B_WIDTH)
    g_IN_DEFAULT_VAL : std_logic_vector(0 downto 0) := (others => '0');
    g_length_in_A : integer := 0;
    g_length_in_B : integer := 0;
    g_length_in_C : integer := 0;
    g_length_in_D : integer := 0;
  );
  port (
    -- clock and reset signals
    clk           : in std_logic;
    rst           : in std_logic;
    -- input operands
    i_in_A        : in std_logic_vector ;--:= g_IN_DEFAULT_VAL;--(g_OPERAND_A_WIDTH-1 downto 0);
    i_in_B        : in std_logic_vector ;--:= g_IN_DEFAULT_VAL;--(g_OPERAND_B_WIDTH-1 downto 0);
    i_in_C        : in std_logic_vector ;--:= g_IN_DEFAULT_VAL;--(g_OPERAND_C_WIDTH-1 downto 0);
    i_in_D        : in std_logic_vector ;--:= g_IN_DEFAULT_VAL;--(g_OPERAND_C_WIDTH-1 downto 0);
    i_dv          : in std_logic; -- specifies that A and B inputs are valid, so their values can be propagated through the pipeline
    -- output product
    o_result      : out std_logic_vector;--((g_RESULT_WIDTH-1) downto 0);
    o_dv          : out std_logic -- valid signal for an output product
  );
end generic_pipelined_MATH;

architecture beh of generic_pipelined_MATH is

  constant g_OPERAND_A_WIDTH : integer := i_in_A'length;--arith_get_in_width(i_in_A'length,to_integer(unsigned(i_in_A)));
  constant g_OPERAND_B_WIDTH : integer := i_in_B'length;--arith_get_in_width(i_in_B'length,to_integer(unsigned(i_in_B)));
  constant g_OPERAND_C_WIDTH : integer := i_in_C'length;--arith_get_in_width(i_in_C'length,to_integer(unsigned(i_in_C)));
  constant g_OPERAND_D_WIDTH : integer := i_in_D'length;--arith_get_in_width(i_in_D'length,to_integer(unsigned(i_in_D)));
  constant g_RESULT_WIDTH    : integer := arith_get_out_width(g_OPERATION,g_OPERAND_A_WIDTH,g_OPERAND_B_WIDTH,g_OPERAND_C_WIDTH,g_OPERAND_D_WIDTH);

  constant TOTAL_MUL_LATENCY : integer := g_IN_PIPE_STAGES + g_OUT_PIPE_STAGES;

  type data_pl_A_t is array (integer range <>) of std_logic_vector(g_OPERAND_A_WIDTH-1 downto 0);
  type data_pl_B_t is array (integer range <>) of std_logic_vector(g_OPERAND_B_WIDTH-1 downto 0);
  type data_pl_C_t is array (integer range <>) of std_logic_vector(g_OPERAND_C_WIDTH-1 downto 0);
  type data_pl_D_t is array (integer range <>) of std_logic_vector(g_OPERAND_D_WIDTH-1 downto 0);

  type data_pl_O_t is array (integer range <>) of std_logic_vector((g_RESULT_WIDTH-1) downto 0);

  signal mul_in_pipe_A : data_pl_A_t(g_IN_PIPE_STAGES -1 downto 0);
  signal mul_in_pipe_B : data_pl_B_t(g_IN_PIPE_STAGES -1 downto 0);
  signal mul_in_pipe_C : data_pl_C_t(g_IN_PIPE_STAGES -1 downto 0);
  signal mul_in_pipe_D : data_pl_D_t(g_IN_PIPE_STAGES -1 downto 0);

  signal mul_output_pipe : data_pl_O_t(g_OUT_PIPE_STAGES -1 downto 0);

  signal valid_signal_pipe : std_logic_vector(TOTAL_MUL_LATENCY downto 0);

  signal int_Result : std_logic_vector((g_RESULT_WIDTH-1) downto 0);
  attribute use_dsp             : string;
  attribute use_dsp of int_Result : signal is "yes";
  
begin

  IN_PL_GEN: if g_IN_PIPE_STAGES = 0 generate
    mul_in_pipe_A(0) <= i_in_A;
    mul_in_pipe_B(0) <= i_in_B;
  else generate
    IN_PL : process(clk) begin
      if rising_edge(clk) then
        if rst = '1' then
          mul_in_pipe_A <= (others => (others => '0'));
          mul_in_pipe_B <= (others => (others => '0'));

        else
          if i_dv then
            mul_in_pipe_A(0) <= i_in_A;
            mul_in_pipe_B(0) <= i_in_B;
          else
            mul_in_pipe_A(0) <= (others => '0');
            mul_in_pipe_B(0) <= (others => '0');
          end if;
  
          for i in 1 to (g_IN_PIPE_STAGES-1) loop
            mul_in_pipe_A(i) <=  mul_in_pipe_A(i-1);
            mul_in_pipe_B(i) <=  mul_in_pipe_B(i-1);
          end loop;
        end if;
      end if;
    end process;
  end generate IN_PL_GEN;

  C_PL: if g_OPERAND_C_WIDTH > 1 generate
    IN_PL_GEN: if g_IN_PIPE_STAGES = 0 generate
      mul_in_pipe_C(0) <= i_in_C;
    else generate
      IN_PL : process(clk) begin
        if rising_edge(clk) then
          if rst = '1' then
            mul_in_pipe_C <= (others => (others => '0'));
          else
            if i_dv then
              mul_in_pipe_C(0) <= i_in_C;
            else
              mul_in_pipe_C(0) <= (others => '0');
            end if;
            for i in 1 to (g_IN_PIPE_STAGES-1) loop
              mul_in_pipe_C(i) <=  mul_in_pipe_C(i-1);
            end loop;
          end if;
        end if;
      end process;
    end generate IN_PL_GEN;
  end generate C_PL;
    
  D_PL: if g_OPERAND_D_WIDTH > 1 generate
    IN_PL_GEN: if g_IN_PIPE_STAGES = 0 generate
      mul_in_pipe_D(0) <= i_in_D;
    else generate
      IN_PL : process(clk) begin
        if rising_edge(clk) then
          if rst = '1' then
            mul_in_pipe_D <= (others => (others => '0'));
          else
            if i_dv then
              mul_in_pipe_D(0) <= i_in_D;
            else
              mul_in_pipe_D(0) <= (others => '0');
            end if;
            for i in 1 to (g_IN_PIPE_STAGES-1) loop
              mul_in_pipe_D(i) <=  mul_in_pipe_D(i-1);
            end loop;
          end if;
        end if;
      end process;
    end generate IN_PL_GEN;
  end generate D_PL;

 

  MATH : process(clk) begin
    if rising_edge(clk) then
      if rst = '1' then
        int_Result <= (others => '0');
      else
        if valid_signal_pipe(g_IN_PIPE_STAGES-1) = '1' then
          if g_OPERATION = "*" then
              int_Result <=std_logic_vector(
                signed(mul_in_pipe_A(g_IN_PIPE_STAGES-1)) * signed( mul_in_pipe_B(g_IN_PIPE_STAGES-1))
              );
          elsif g_OPERATION = "-" then
              int_Result <=std_logic_vector(
                signed(mul_in_pipe_A(g_IN_PIPE_STAGES-1)) - signed( mul_in_pipe_B(g_IN_PIPE_STAGES-1))
              );
          elsif g_OPERATION = "--" then
            int_Result <=std_logic_vector(
              signed(mul_in_pipe_A(g_IN_PIPE_STAGES-1)) - signed( mul_in_pipe_B(g_IN_PIPE_STAGES-1))
            );
          elsif g_OPERATION = "*-" then
              int_Result <=std_logic_vector(
                (signed(mul_in_pipe_A(g_IN_PIPE_STAGES-1)) * signed( mul_in_pipe_B(g_IN_PIPE_STAGES-1))) - signed( mul_in_pipe_C(g_IN_PIPE_STAGES-1))
              );
          elsif g_OPERATION = "/" then
              int_Result <=std_logic_vector(
                signed(mul_in_pipe_A(g_IN_PIPE_STAGES-1)) / signed( mul_in_pipe_B(g_IN_PIPE_STAGES-1))
              );
          elsif g_OPERATION = "+++" then
              int_Result <=std_logic_vector(
                resize(signed( mul_in_pipe_A(g_IN_PIPE_STAGES-1)),g_RESULT_WIDTH) + 
                resize(signed( mul_in_pipe_B(g_IN_PIPE_STAGES-1)),g_RESULT_WIDTH) +
                resize(signed( mul_in_pipe_C(g_IN_PIPE_STAGES-1)),g_RESULT_WIDTH) +
                resize(signed( mul_in_pipe_D(g_IN_PIPE_STAGES-1)),g_RESULT_WIDTH)
              );
          end if;
        else
          int_Result <= (others => '0');
        end if;
      end if;
    end if;
  end process;
        
  -- mul_output_pipe(0) <= int_Result;
  OUT_PL_GEN: if g_IN_PIPE_STAGES = 0 generate
    o_result <= int_Result;
  else  generate
    OUT_PL : process(clk) begin
      if rising_edge(clk) then
        if rst = '1' then
          mul_output_pipe <= (others => (others => '0'));
          -- o_result <= (others => '0');
        else
          mul_output_pipe(0) <= int_Result;
          for j in 1 to (g_OUT_PIPE_STAGES-1) loop
            mul_output_pipe(j) <=  mul_output_pipe(j-1);
          end loop;
          -- o_result <= mul_output_pipe(g_OUT_PIPE_STAGES-1);
        end if;
      end if;
    end process;
    o_result <= mul_output_pipe(g_OUT_PIPE_STAGES-1);
  end generate OUT_PL_GEN;


  DV_PL : process(clk) begin
    if rising_edge(clk) then
      if rst = '1' then
        valid_signal_pipe <= (others => '0');
        -- o_dv <= '0';
      else

        if i_dv then
          valid_signal_pipe(0) <= i_dv;
        else
          valid_signal_pipe(0) <= '0';
        end if;

        for n in 1 to (TOTAL_MUL_LATENCY) loop
          valid_signal_pipe(n) <=  valid_signal_pipe(n-1);
        end loop;
        
      end if;
    end if;
  end process;
  
  o_dv <= valid_signal_pipe(TOTAL_MUL_LATENCY);
  
end architecture beh;