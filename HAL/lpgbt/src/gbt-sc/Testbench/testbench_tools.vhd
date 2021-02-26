library ieee;
use Std.TextIO.all;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

package tb_tools_package is

	function to_bstring(sl : std_logic) return string;
	function to_bstring(slv : std_logic_vector) return string;
	function to_hstring(sv: Std_Logic_Vector) return string;
	procedure HWRITE(L:inout LINE; VALUE:in BIT_VECTOR; JUSTIFIED:in SIDE := RIGHT; FIELD:in WIDTH := 0);

end tb_tools_package;

package body tb_tools_package is

	function to_bstring(sl : std_logic) return string is
	  variable sl_str_v : string(1 to 3);  -- std_logic image with quotes around
	begin
	  sl_str_v := std_logic'image(sl);
	  return "" & sl_str_v(2);  -- "" & character to get string
	end function;

	function to_bstring(slv : std_logic_vector) return string is
	  alias    slv_norm : std_logic_vector(1 to slv'length) is slv;
	  variable sl_str_v : string(1 to 1);  -- String of std_logic
	  variable res_v    : string(1 to slv'length);
	begin
	  for idx in slv_norm'range loop
		sl_str_v := to_bstring(slv_norm(idx));
		res_v(idx) := sl_str_v(1);
	  end loop;
	  return res_v;
	end function;
	 
	function to_hstring(sv: Std_Logic_Vector) return string is
		  use Std.TextIO.all;
		  
		  variable bv: bit_vector(sv'range) := to_bitvector(sv);
		  variable lp: line;
		begin
		  hwrite(lp, bv);
		  return lp.all;
	end;

	procedure HWRITE(L:inout LINE; VALUE:in BIT_VECTOR;
		JUSTIFIED:in SIDE := RIGHT; FIELD:in WIDTH := 0) is      
		  variable quad: bit_vector(0 to 3);
		  constant ne:   integer := (value'length+3)/4;
		  constant displaybits: integer := ne*4;
		  constant inputbits: integer := value'length;
		  constant emptybits: integer := displaybits - inputbits;
		  variable bv:   bit_vector(0 to value'length+4) := (others => '0');
		  variable s:    string(1 to ne);
		begin

		  bv(emptybits to (emptybits+value'length-1)) := value;
		
		  for i in 0 to ne-1 loop
			quad := bv(4*i to 4*i+3);
			case quad is
			  when x"0" => s(i+1) := '0';
			  when x"1" => s(i+1) := '1';
			  when x"2" => s(i+1) := '2';
			  when x"3" => s(i+1) := '3';
			  when x"4" => s(i+1) := '4';
			  when x"5" => s(i+1) := '5';
			  when x"6" => s(i+1) := '6';
			  when x"7" => s(i+1) := '7';
			  when x"8" => s(i+1) := '8';
			  when x"9" => s(i+1) := '9';
			  when x"A" => s(i+1) := 'A';
			  when x"B" => s(i+1) := 'B';
			  when x"C" => s(i+1) := 'C';
			  when x"D" => s(i+1) := 'D';
			  when x"E" => s(i+1) := 'E';
			  when x"F" => s(i+1) := 'F';
			end case;
		  end loop;
		  write(L, s, JUSTIFIED, FIELD);
	end HWRITE;
	
end tb_tools_package;


