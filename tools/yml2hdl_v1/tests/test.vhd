library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
end top;

architecture RTL of top is

  -- --------
  -- type vector0_t is record
  --   v : std_logic_vector(integer range 3 to 0);
  -- end record vector0_t;
  -- 
  -- impure function nullify return vector0_t is
  --   variable v : vector0_t;
  -- begin
  --    v.v := (v.v'range => '0');
  --   return v;
  -- end function nullify;
  -- 
  -- --------
  -- type vector1_t is record
  --   v : std_logic_vector(integer range 3 to 0);
  -- end record vector1_t;
  -- 
  -- impure function nullify return vector1_t is
  --   variable v : vector1_t;
  -- begin
  --   return v;
  -- end function nullify;
  -- 
  -- signal vector0 : vector0_t := nullify;
  -- signal vector1 : vector1_t := nullify;


  subtype vector0_t is std_logic_vector(3 downto 0);
  -- subtype vector1_t is std_logic_vector(3 downto 0);
  -- 
  -- function nullify(v: std_logic_vector) return std_logic_vector is
  -- begin
  --   return (v'range => '0');
  -- end function nullify;
  -- 
  -- -- function nullify(v: vector1_t) return vector1_t is
  -- -- begin
  -- --   return (vector1_t'range => '0');
  -- -- end function nullify;
  -- 
  -- signal vector0 : vector0_t := nullify(vector0);
  -- signal vector1 : vector1_t := nullify;

  type bla_t is ( vector0_t);
  
  --------
  -- function nullify_vector0_t return vector0_t is
  --   variable

  
  type array0_t is array(integer range <>) of std_logic;

  type array1_t is array(integer range <>) of std_logic_vector(1 downto 0);

  -- inner type cannot be unconstrained
  -- type array2_t is array(4 downto 0) of std_logic_vector(integer range <>);

  type array3_t is array(2 downto 0) of std_logic;

  type record0_t is record
    array0 : array0_t(3 downto 0);
    array1 : array0_t(3 downto 5);
  end record record0_t;
  
begin

end RTL; -- top
