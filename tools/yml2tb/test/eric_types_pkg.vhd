library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package eric_types_pkg is

  constant MDT_POLMUX_LEN : integer := 42;
  constant   MDT_FIBER_LEN        :  integer := 5;                                        -- 

  constant   MDT_TDC_CH_LEN       :  integer := 5;                                        -- 

  constant   MDT_TDC_MODE_LEN     :  integer := 2;                                        -- 

  constant   MDT_TDC_COARSE_LEN   :  integer := 12;                                       -- 

  constant   MDT_TDC_FINE_LEN     :  integer := 5;                                        -- 

  constant   MDT_TDC_PW_LEN       :  integer := 8;                                        -- 

  constant   MDT_MUXCH_LEN        :  integer := 4;                                        -- 

  type mdt_tdc_rt is record
     ch                   :  std_logic_vector(MDT_TDC_CH_LEN-1 downto 0);                 -- 
     mode                 :  std_logic_vector(MDT_TDC_MODE_LEN-1 downto 0);               -- 
     coarse               :  unsigned(MDT_TDC_COARSE_LEN-1 downto 0);                     -- 
     fine                 :  unsigned(MDT_TDC_FINE_LEN-1 downto 0);                       -- 
     pw                   :  unsigned(MDT_TDC_PW_LEN-1 downto 0);                         -- 
  end record mdt_tdc_rt;

  type l0mdt_control_rt is record
     clk                  :  std_logic;                                                   -- 
     rst                  :  std_logic;                                                   -- 
     bx                   :  std_logic;                                                   -- 
  end record l0mdt_control_rt;
  constant L0MDT_CONTROL_LEN : integer := 3;
  subtype l0mdt_control_rvt is std_logic_vector(L0MDT_CONTROL_LEN-1 downto 0);
  function vectorify(x: l0mdt_control_rt) return l0mdt_control_rvt;
  function structify(x: l0mdt_control_rvt) return l0mdt_control_rt;
  function nullify (x: l0mdt_control_rt) return l0mdt_control_rt;

  type l0mdt_ttc_rt is record
     bcr                  :  std_logic;                                                   -- 
     ocr                  :  std_logic;                                                   -- 
     ecr                  :  std_logic;                                                   -- 
     l0a                  :  std_logic;                                                   -- 
     l1a                  :  std_logic;                                                   -- 
  end record l0mdt_ttc_rt;
  constant L0MDT_TTC_LEN : integer := 5;
  subtype l0mdt_ttc_rvt is std_logic_vector(L0MDT_TTC_LEN-1 downto 0);
  function vectorify(x: l0mdt_ttc_rt) return l0mdt_ttc_rvt;
  function structify(x: l0mdt_ttc_rvt) return l0mdt_ttc_rt;
  function nullify (x: l0mdt_ttc_rt) return l0mdt_ttc_rt;

  type mdt_polmux_rt is record
     fiberID              :  std_logic_vector(MDT_FIBER_LEN-1 downto 0);                  -- 
     muxID                :  std_logic_vector(MDT_MUXCH_LEN-1 downto 0);                  -- 
     tdc                  :  mdt_tdc_rt;                                                  -- 
     data_valid           :  std_logic;                                                   -- 
  end record mdt_polmux_rt;

  subtype mdt_polmux_rvt is std_logic_vector(MDT_POLMUX_LEN-1 downto 0);

  type mdt_polmux_at is array(integer range <>) of mdt_polmux_rt;
  type mdt_polmux_avt is array(integer range <>) of mdt_polmux_rvt;
  function vectorify(x: mdt_polmux_at) return mdt_polmux_avt;
  function vectorify(x: mdt_polmux_at) return std_logic_vector;
  function structify(x: mdt_polmux_avt) return mdt_polmux_at;
  function structify(x: std_logic_vector) return mdt_polmux_at;
  function nullify(x: mdt_polmux_at) return mdt_polmux_at;
  function nullify(x: mdt_polmux_avt) return mdt_polmux_avt;

  function vectorify(x: mdt_polmux_rt) return mdt_polmux_rvt;
  function structify(x: mdt_polmux_rvt) return mdt_polmux_rt;
  function nullify (x: mdt_polmux_rt) return mdt_polmux_rt;

  constant MDT_TDC_LEN : integer := 32;
  subtype mdt_tdc_rvt is std_logic_vector(MDT_TDC_LEN-1 downto 0);
  function vectorify(x: mdt_tdc_rt) return mdt_tdc_rvt;
  function structify(x: mdt_tdc_rvt) return mdt_tdc_rt;
  function nullify (x: mdt_tdc_rt) return mdt_tdc_rt;

end package eric_types_pkg;

------------------------------------------------------------

package body eric_types_pkg is

  function vectorify(x: l0mdt_control_rt) return l0mdt_control_rvt is
    variable y : l0mdt_control_rvt;
  begin
    y(2)                       := x.clk;
    y(1)                       := x.rst;
    y(0)                       := x.bx;
    return y;
  end function vectorify;
  function structify(x: l0mdt_control_rvt) return l0mdt_control_rt is
    variable y : l0mdt_control_rt;
  begin
    y.clk                      := x(2);
    y.rst                      := x(1);
    y.bx                       := x(0);
    return y;
  end function structify;
  function nullify (x: l0mdt_control_rt) return l0mdt_control_rt is
    variable y : l0mdt_control_rt;
  begin
    y.clk                      := nullify(x.clk);
    y.rst                      := nullify(x.rst);
    y.bx                       := nullify(x.bx);
    return y;
  end function nullify;

  function vectorify(x: l0mdt_ttc_rt) return l0mdt_ttc_rvt is
    variable y : l0mdt_ttc_rvt;
  begin
    y(4)                       := x.bcr;
    y(3)                       := x.ocr;
    y(2)                       := x.ecr;
    y(1)                       := x.l0a;
    y(0)                       := x.l1a;
    return y;
  end function vectorify;
  function structify(x: l0mdt_ttc_rvt) return l0mdt_ttc_rt is
    variable y : l0mdt_ttc_rt;
  begin
    y.bcr                      := x(4);
    y.ocr                      := x(3);
    y.ecr                      := x(2);
    y.l0a                      := x(1);
    y.l1a                      := x(0);
    return y;
  end function structify;
  function nullify (x: l0mdt_ttc_rt) return l0mdt_ttc_rt is
    variable y : l0mdt_ttc_rt;
  begin
    y.bcr                      := nullify(x.bcr);
    y.ocr                      := nullify(x.ocr);
    y.ecr                      := nullify(x.ecr);
    y.l0a                      := nullify(x.l0a);
    y.l1a                      := nullify(x.l1a);
    return y;
  end function nullify;

  function vectorify(x: mdt_polmux_at) return mdt_polmux_avt is
    variable y :  mdt_polmux_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: mdt_polmux_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*42-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-42) := vectorify(x(i));
      msb := msb - 42 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: mdt_polmux_avt) return mdt_polmux_at is
    variable y :  mdt_polmux_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return mdt_polmux_at is
    variable y :  mdt_polmux_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-42));
      msb := msb - 42 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: mdt_polmux_at) return mdt_polmux_at is
    variable y :  mdt_polmux_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: mdt_polmux_avt) return mdt_polmux_avt is
    variable y :  mdt_polmux_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: mdt_polmux_rt) return mdt_polmux_rvt is
    variable y : mdt_polmux_rvt;
  begin
    y(41 downto 37)            := x.fiberID;
    y(36 downto 33)            := x.muxID;
    y(32 downto 1)             := vectorify(x.tdc);
    y(0)                       := x.data_valid;
    return y;
  end function vectorify;
  function structify(x: mdt_polmux_rvt) return mdt_polmux_rt is
    variable y : mdt_polmux_rt;
  begin
    y.fiberID                  := x(41 downto 37);
    y.muxID                    := x(36 downto 33);
    y.tdc                      := structify(x(32 downto 1));
    y.data_valid               := x(0);
    return y;
  end function structify;
  function nullify (x: mdt_polmux_rt) return mdt_polmux_rt is
    variable y : mdt_polmux_rt;
  begin
    y.fiberID                  := nullify(x.fiberID);
    y.muxID                    := nullify(x.muxID);
    y.tdc                      := nullify(x.tdc);
    y.data_valid               := nullify(x.data_valid);
    return y;
  end function nullify;

  function vectorify(x: mdt_tdc_rt) return mdt_tdc_rvt is
    variable y : mdt_tdc_rvt;
  begin
    y(31 downto 27)            := x.ch;
    y(26 downto 25)            := x.mode;
    y(24 downto 13)            := vectorify(x.coarse);
    y(12 downto 8)             := vectorify(x.fine);
    y(7 downto 0)              := vectorify(x.pw);
    return y;
  end function vectorify;
  function structify(x: mdt_tdc_rvt) return mdt_tdc_rt is
    variable y : mdt_tdc_rt;
  begin
    y.ch                       := x(31 downto 27);
    y.mode                     := x(26 downto 25);
    y.coarse                   := structify(x(24 downto 13));
    y.fine                     := structify(x(12 downto 8));
    y.pw                       := structify(x(7 downto 0));
    return y;
  end function structify;
  function nullify (x: mdt_tdc_rt) return mdt_tdc_rt is
    variable y : mdt_tdc_rt;
  begin
    y.ch                       := nullify(x.ch);
    y.mode                     := nullify(x.mode);
    y.coarse                   := nullify(x.coarse);
    y.fine                     := nullify(x.fine);
    y.pw                       := nullify(x.pw);
    return y;
  end function nullify;

end package body eric_types_pkg;
