library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package custom_types_pkg is

  function structify(x: std_logic_vector) return signed;
  function structify(x: std_logic_vector) return unsigned;
  function structify(x: std_logic_vector) return std_logic_vector;

  function vectorify(x: signed) return std_logic_vector;
  function vectorify(x: unsigned) return std_logic_vector;
  function vectorify(x: std_logic_vector) return std_logic_vector;

  function nullify(x: std_logic) return std_logic;
  function nullify(x: std_logic_vector) return std_logic_vector;
  function nullify(x: unsigned) return unsigned;
  function nullify(x: signed) return signed;

  constant   LEN0                 :  integer := 2;

  constant   LEN1                 :  integer := 6;

  subtype    bit0_t               is std_logic;

  subtype    vector0_t            is std_logic_vector;

  subtype    vector1_t            is std_logic_vector(LEN1-1 downto 0);

  type record0_rt is record
     r0_var0              :  std_logic;
     r0_var1              :  std_logic_vector(LEN0-1 downto 0);
     r0_var2              :  std_logic_vector(5-1 downto 0);
     r0_var3              :  vector0_t(LEN1-1 downto 0);
     r0_var4              :  vector1_t;
  end record record0_rt;
  constant RECORD0_LEN : integer := 20;
  subtype record0_rvt is std_logic_vector(RECORD0_LEN-1 downto 0);
  function vectorify(x: record0_rt) return record0_rvt;
  function structify(x: record0_rvt) return record0_rt;
  function nullify (x: record0_rt) return record0_rt;

  type array0_at is array(integer range <>) of vector0_t(13-1 downto 0);
  type array0_avt is array(integer range <>) of vector0_t(13-1 downto 0);
  function vectorify(x: array0_at) return array0_avt;
  function vectorify(x: array0_at) return std_logic_vector;
  function structify(x: array0_avt) return array0_at;
  function structify(x: std_logic_vector) return array0_at;
  function nullify(x: array0_at) return array0_at;
  function nullify(x: array0_avt) return array0_avt;

  type array1_at is array(3-1 downto 0) of vector1_t;
  type array1_avt is array(3-1 downto 0) of vector1_t;
  function vectorify(x: array1_at) return array1_avt;
  function vectorify(x: array1_at) return std_logic_vector;
  function structify(x: array1_avt) return array1_at;
  function structify(x: std_logic_vector) return array1_at;
  function nullify(x: array1_at) return array1_at;
  function nullify(x: array1_avt) return array1_avt;

  type array2_at is array(LEN0-1 downto 0) of record0_rt;
  type array2_avt is array(LEN0-1 downto 0) of record0_rvt;
  function vectorify(x: array2_at) return array2_avt;
  function vectorify(x: array2_at) return std_logic_vector;
  function structify(x: array2_avt) return array2_at;
  function structify(x: std_logic_vector) return array2_at;
  function nullify(x: array2_at) return array2_at;
  function nullify(x: array2_avt) return array2_avt;

  type array3_at is array(LEN0-1 downto 0) of std_logic_vector(LEN1-1 downto 0);
  type array3_avt is array(LEN0-1 downto 0) of std_logic_vector(LEN1-1 downto 0);
  function vectorify(x: array3_at) return array3_avt;
  function vectorify(x: array3_at) return std_logic_vector;
  function structify(x: array3_avt) return array3_at;
  function structify(x: std_logic_vector) return array3_at;
  function nullify(x: array3_at) return array3_at;
  function nullify(x: array3_avt) return array3_avt;

  type array4_at is array(LEN0-1 downto 0) of array0_at(LEN1-1 downto 0);
  type array4_avt is array(LEN0-1 downto 0) of array0_avt(LEN1-1 downto 0);
  function vectorify(x: array4_at) return array4_avt;
  function vectorify(x: array4_at) return std_logic_vector;
  function structify(x: array4_avt) return array4_at;
  function structify(x: std_logic_vector) return array4_at;
  function nullify(x: array4_at) return array4_at;
  function nullify(x: array4_avt) return array4_avt;

  type record1_rt is record
     r1_var0              :  array0_at(3-1 downto 0);
     r1_var1              :  array1_at;
     r1_var2              :  array2_at;
     r1_var3              :  array0_at(LEN0-1 downto 0);
  end record record1_rt;
  constant RECORD1_LEN : integer := 123;
  subtype record1_rvt is std_logic_vector(RECORD1_LEN-1 downto 0);
  function vectorify(x: record1_rt) return record1_rvt;
  function structify(x: record1_rvt) return record1_rt;
  function nullify (x: record1_rt) return record1_rt;

end package custom_types_pkg;

------------------------------------------------------------

package body custom_types_pkg is

  function structify(x: std_logic_vector) return signed is
  begin
    return signed(x);
  end function structify;
  function structify(x: std_logic_vector) return unsigned is
  begin
    return unsigned(x);
  end function structify;
  function structify(x: std_logic_vector) return std_logic_vector is
  begin
    return std_logic_vector(x);
  end function structify;

  function vectorify(x: signed) return std_logic_vector is
  begin
    return std_logic_vector(x);
  end function vectorify;
  function vectorify(x: unsigned) return std_logic_vector is
  begin
    return std_logic_vector(x);
  end function vectorify;
  function vectorify(x: std_logic_vector) return std_logic_vector is
  begin
    return x;
  end function vectorify;

  function nullify(x: std_logic) return std_logic is
  begin
    return '0';
  end function nullify;
  function nullify(x: std_logic_vector) return std_logic_vector is
  begin
    return (x'range => '0');
  end function nullify;
  function nullify(x: unsigned) return unsigned is
  begin
    return to_unsigned(0, x'length);
  end function nullify;
  function nullify(x: signed) return signed is
  begin
    return to_signed(0, x'length);
  end function nullify;

  function vectorify(x: record0_rt) return record0_rvt is
    variable y : record0_rvt;
  begin
    y(19)                      := x.r0_var0;
    y(18 downto 17)            := x.r0_var1;
    y(16 downto 12)            := x.r0_var2;
    y(11 downto 6)             := vectorify(x.r0_var3);
    y(5 downto 0)              := vectorify(x.r0_var4);
    return y;
  end function vectorify;
  function structify(x: record0_rvt) return record0_rt is
    variable y : record0_rt;
  begin
    y.r0_var0                  := x(19);
    y.r0_var1                  := x(18 downto 17);
    y.r0_var2                  := x(16 downto 12);
    y.r0_var3                  := structify(x(11 downto 6));
    y.r0_var4                  := structify(x(5 downto 0));
    return y;
  end function structify;
  function nullify (x: record0_rt) return record0_rt is
    variable y : record0_rt;
  begin
    y.r0_var0                  := nullify(x.r0_var0);
    y.r0_var1                  := nullify(x.r0_var1);
    y.r0_var2                  := nullify(x.r0_var2);
    y.r0_var3                  := nullify(x.r0_var3);
    y.r0_var4                  := nullify(x.r0_var4);
    return y;
  end function nullify;

  function vectorify(x: array0_at) return array0_avt is
    variable y :  array0_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: array0_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*13-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-13) := vectorify(x(i));
      msb := msb - 13 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: array0_avt) return array0_at is
    variable y :  array0_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return array0_at is
    variable y :  array0_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-13));
      msb := msb - 13 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: array0_at) return array0_at is
    variable y :  array0_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: array0_avt) return array0_avt is
    variable y :  array0_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: array1_at) return array1_avt is
    variable y :  array1_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: array1_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*LEN1-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-LEN1) := vectorify(x(i));
      msb := msb - LEN1 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: array1_avt) return array1_at is
    variable y :  array1_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return array1_at is
    variable y :  array1_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-LEN1));
      msb := msb - LEN1 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: array1_at) return array1_at is
    variable y :  array1_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: array1_avt) return array1_avt is
    variable y :  array1_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: array2_at) return array2_avt is
    variable y :  array2_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: array2_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*20-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-20) := vectorify(x(i));
      msb := msb - 20 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: array2_avt) return array2_at is
    variable y :  array2_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return array2_at is
    variable y :  array2_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-20));
      msb := msb - 20 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: array2_at) return array2_at is
    variable y :  array2_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: array2_avt) return array2_avt is
    variable y :  array2_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: array3_at) return array3_avt is
    variable y :  array3_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: array3_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*LEN1-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-LEN1) := vectorify(x(i));
      msb := msb - LEN1 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: array3_avt) return array3_at is
    variable y :  array3_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return array3_at is
    variable y :  array3_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-LEN1));
      msb := msb - LEN1 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: array3_at) return array3_at is
    variable y :  array3_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: array3_avt) return array3_avt is
    variable y :  array3_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: array4_at) return array4_avt is
    variable y :  array4_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: array4_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*78-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-78) := vectorify(x(i));
      msb := msb - 78 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: array4_avt) return array4_at is
    variable y :  array4_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return array4_at is
    variable y :  array4_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-78));
      msb := msb - 78 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: array4_at) return array4_at is
    variable y :  array4_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: array4_avt) return array4_avt is
    variable y :  array4_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: record1_rt) return record1_rvt is
    variable y : record1_rvt;
  begin
    y(122 downto 84)           := vectorify(x.r1_var0);
    y(83 downto 66)            := vectorify(x.r1_var1);
    y(65 downto 26)            := vectorify(x.r1_var2);
    y(25 downto 0)             := vectorify(x.r1_var3);
    return y;
  end function vectorify;
  function structify(x: record1_rvt) return record1_rt is
    variable y : record1_rt;
  begin
    y.r1_var0                  := structify(x(122 downto 84));
    y.r1_var1                  := structify(x(83 downto 66));
    y.r1_var2                  := structify(x(65 downto 26));
    y.r1_var3                  := structify(x(25 downto 0));
    return y;
  end function structify;
  function nullify (x: record1_rt) return record1_rt is
    variable y : record1_rt;
  begin
    y.r1_var0                  := nullify(x.r1_var0);
    y.r1_var1                  := nullify(x.r1_var1);
    y.r1_var2                  := nullify(x.r1_var2);
    y.r1_var3                  := nullify(x.r1_var3);
    return y;
  end function nullify;

end package body custom_types_pkg;
