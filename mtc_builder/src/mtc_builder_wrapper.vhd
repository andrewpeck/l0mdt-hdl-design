package ptcalc_array_type is
    type ptcalc_array is array(0 to 2) of Bit_Vector (54 downto 0);
end package ptcalc_array_type;


library IEEE;
use work.ptcalc_array_type.all;
use IEEE.STD_LOGIC_1164.ALL;

entity mtc_builder_wrapper IS
  PORT(
clk,rst,srst,b0_ec1: IN std_logic;
ptcalc: in ptcalc_array;
slcpipeline: in Bit_Vector(58 downto 0);
mtc: out Bit_Vector(80 downto 0)
);
end entity mtc_builder_wrapper;

architecture mtc_builder_wrapper_arch of mtc_builder_wrapper IS
component mtc_builder
    PORT(
clk,rst,srst,b0_ec1: IN std_logic;
ptcalc: in ptcalc_array;
slcpipeline: in Bit_Vector(58 downto 0);
mtc: out Bit_Vector(80 downto 0)
);
end component;

begin 
  mtc_builder_inst: mtc_builder port map (
    clk => clk,
    rst => rst,
    srst=> srst,
    b0_ec1=> b0_ec1,
    ptcalc => ptcalc,
    slcpipeline => slcpipeline,
    mtc => mtc
    );
end  architecture mtc_builder_wrapper_arch ;            
