library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;
use shared_lib.l0mdt_constants_pkg.all;
use shared_lib.l0mdt_dataformats_pkg.all;
use shared_lib.common_constants_pkg.all;
use shared_lib.common_types_pkg.all;
library ttc_lib;
use ttc_lib.ttc_defs_pkg.all;
library daq_lib;
use daq_lib.daq_user_defs_pkg.all;
use daq_lib.daq_devel_defs_pkg.all;
use daq_lib.daq_defs_pkg.all;

package daq_row_defs_pkg is

  type mngt_to_cell_rt is record
    en : std_logic;
    win_lower : bcid_t;
    win_width : bcid_t;
  end record mngt_to_cell_rt;
  constant MNGT_TO_CELL_LEN : integer := 25;
  subtype mngt_to_cell_rvt is std_logic_vector(MNGT_TO_CELL_LEN-1 downto 0);
  function vectorify(x: mngt_to_cell_rt) return mngt_to_cell_rvt;
  function structify(x: mngt_to_cell_rvt) return mngt_to_cell_rt;
  function nullify(x: mngt_to_cell_rt) return mngt_to_cell_rt;

  type cell_to_mngt_rt is record
    done : std_logic;
    full : std_logic;
    unexpected : std_logic;
  end record cell_to_mngt_rt;
  constant CELL_TO_MNGT_LEN : integer := 3;
  subtype cell_to_mngt_rvt is std_logic_vector(CELL_TO_MNGT_LEN-1 downto 0);
  function vectorify(x: cell_to_mngt_rt) return cell_to_mngt_rvt;
  function structify(x: cell_to_mngt_rvt) return cell_to_mngt_rt;
  function nullify(x: cell_to_mngt_rt) return cell_to_mngt_rt;

  type mngt_to_cell_bus_at is array(integer range <>) of mngt_to_cell_rt;
  type mngt_to_cell_bus_avt is array(integer range <>) of mngt_to_cell_rvt;
  function vectorify(x: mngt_to_cell_bus_at) return mngt_to_cell_bus_avt;
  function vectorify(x: mngt_to_cell_bus_at) return std_logic_vector;
  function structify(x: mngt_to_cell_bus_avt) return mngt_to_cell_bus_at;
  function structify(x: std_logic_vector) return mngt_to_cell_bus_at;
  function nullify(x: mngt_to_cell_bus_at) return mngt_to_cell_bus_at;
  function nullify(x: mngt_to_cell_bus_avt) return mngt_to_cell_bus_avt;

  type cell_to_mngt_bus_at is array(integer range <>) of cell_to_mngt_rt;
  type cell_to_mngt_bus_avt is array(integer range <>) of cell_to_mngt_rvt;
  function vectorify(x: cell_to_mngt_bus_at) return cell_to_mngt_bus_avt;
  function vectorify(x: cell_to_mngt_bus_at) return std_logic_vector;
  function structify(x: cell_to_mngt_bus_avt) return cell_to_mngt_bus_at;
  function structify(x: std_logic_vector) return cell_to_mngt_bus_at;
  function nullify(x: cell_to_mngt_bus_at) return cell_to_mngt_bus_at;
  function nullify(x: cell_to_mngt_bus_avt) return cell_to_mngt_bus_avt;

  type cell_to_bconv_rt is record
    nempty : std_logic;
    data : std_logic_vector(DEV_CELL_DATA_BUS_WIDTH-1 downto 0);
    counter : std_logic_vector(DEV_CELL_COUNTER_WIDTH-1 downto 0);
  end record cell_to_bconv_rt;
  constant CELL_TO_BCONV_LEN : integer := 525;
  subtype cell_to_bconv_rvt is std_logic_vector(CELL_TO_BCONV_LEN-1 downto 0);
  function vectorify(x: cell_to_bconv_rt) return cell_to_bconv_rvt;
  function structify(x: cell_to_bconv_rvt) return cell_to_bconv_rt;
  function nullify(x: cell_to_bconv_rt) return cell_to_bconv_rt;

  type bconv_to_cell_rt is record
    rd_strb : std_logic;
  end record bconv_to_cell_rt;
  constant BCONV_TO_CELL_LEN : integer := 1;
  subtype bconv_to_cell_rvt is std_logic_vector(BCONV_TO_CELL_LEN-1 downto 0);
  function vectorify(x: bconv_to_cell_rt) return bconv_to_cell_rvt;
  function structify(x: bconv_to_cell_rvt) return bconv_to_cell_rt;
  function nullify(x: bconv_to_cell_rt) return bconv_to_cell_rt;

  type cell_generics_rt is record
    INPUT_DATA_LEN : natural;
    COUNTER_LEN : natural;
  end record cell_generics_rt;
  constant CELL_GENERICS_LEN : integer := 64;
  subtype cell_generics_rvt is std_logic_vector(CELL_GENERICS_LEN-1 downto 0);
  function vectorify(x: cell_generics_rt) return cell_generics_rvt;
  function structify(x: cell_generics_rvt) return cell_generics_rt;
  function nullify(x: cell_generics_rt) return cell_generics_rt;

  type cell_irt is record
    sys : daq_sys_rt;
    mngt : mngt_to_cell_rt;
    stream : stream_rt;
    bconv : bconv_to_cell_rt;
  end record cell_irt;
  constant CELL_ILEN : integer := 553;
  subtype cell_irvt is std_logic_vector(CELL_ILEN-1 downto 0);
  function vectorify(x: cell_irt) return cell_irvt;
  function structify(x: cell_irvt) return cell_irt;
  function nullify(x: cell_irt) return cell_irt;

  type cell_ort is record
    mngt : cell_to_mngt_rt;
    bconv : cell_to_bconv_rt;
  end record cell_ort;
  constant CELL_OLEN : integer := 528;
  subtype cell_orvt is std_logic_vector(CELL_OLEN-1 downto 0);
  function vectorify(x: cell_ort) return cell_orvt;
  function structify(x: cell_orvt) return cell_ort;
  function nullify(x: cell_ort) return cell_ort;

  type cell_rt is record
    i : cell_irt;
    o : cell_ort;
  end record cell_rt;
  constant CELL_LEN : integer := 1081;
  subtype cell_rvt is std_logic_vector(CELL_LEN-1 downto 0);
  function vectorify(x: cell_rt) return cell_rvt;
  function structify(x: cell_rvt) return cell_rt;
  function nullify(x: cell_rt) return cell_rt;

  type cell_bus_at is array(DAQ_N_PIPELINES-1 downto 0) of cell_rt;
  type cell_bus_avt is array(DAQ_N_PIPELINES-1 downto 0) of cell_rvt;
  function vectorify(x: cell_bus_at) return cell_bus_avt;
  function vectorify(x: cell_bus_at) return std_logic_vector;
  function structify(x: cell_bus_avt) return cell_bus_at;
  function structify(x: std_logic_vector) return cell_bus_at;
  function nullify(x: cell_bus_at) return cell_bus_at;
  function nullify(x: cell_bus_avt) return cell_bus_avt;

  type cell_bus_iat is array(DAQ_N_PIPELINES-1 downto 0) of cell_irt;
  type cell_bus_iavt is array(DAQ_N_PIPELINES-1 downto 0) of cell_irvt;
  function vectorify(x: cell_bus_iat) return cell_bus_iavt;
  function vectorify(x: cell_bus_iat) return std_logic_vector;
  function structify(x: cell_bus_iavt) return cell_bus_iat;
  function structify(x: std_logic_vector) return cell_bus_iat;
  function nullify(x: cell_bus_iat) return cell_bus_iat;
  function nullify(x: cell_bus_iavt) return cell_bus_iavt;

  type cell_bus_oat is array(DAQ_N_PIPELINES-1 downto 0) of cell_ort;
  type cell_bus_oavt is array(DAQ_N_PIPELINES-1 downto 0) of cell_orvt;
  function vectorify(x: cell_bus_oat) return cell_bus_oavt;
  function vectorify(x: cell_bus_oat) return std_logic_vector;
  function structify(x: cell_bus_oavt) return cell_bus_oat;
  function structify(x: std_logic_vector) return cell_bus_oat;
  function nullify(x: cell_bus_oat) return cell_bus_oat;
  function nullify(x: cell_bus_oavt) return cell_bus_oavt;

  type bconv_generics_rt is record
    INPUT_DATA_LEN : natural;
    OUTPUT_DATA_LEN : natural;
    COUNTER_LEN : natural;
  end record bconv_generics_rt;
  constant BCONV_GENERICS_LEN : integer := 96;
  subtype bconv_generics_rvt is std_logic_vector(BCONV_GENERICS_LEN-1 downto 0);
  function vectorify(x: bconv_generics_rt) return bconv_generics_rvt;
  function structify(x: bconv_generics_rvt) return bconv_generics_rt;
  function nullify(x: bconv_generics_rt) return bconv_generics_rt;

  type bconv_irt is record
    sys : daq_sys_rt;
    cell : cell_to_bconv_rt;
    pkt_bldr : pkt_bldr_to_row_rt;
  end record bconv_irt;
  constant BCONV_ILEN : integer := 528;
  subtype bconv_irvt is std_logic_vector(BCONV_ILEN-1 downto 0);
  function vectorify(x: bconv_irt) return bconv_irvt;
  function structify(x: bconv_irvt) return bconv_irt;
  function nullify(x: bconv_irt) return bconv_irt;

  type bconv_ort is record
    cell : bconv_to_cell_rt;
    pkt_bldr : row_to_pkt_bldr_rt;
  end record bconv_ort;
  constant BCONV_OLEN : integer := 34;
  subtype bconv_orvt is std_logic_vector(BCONV_OLEN-1 downto 0);
  function vectorify(x: bconv_ort) return bconv_orvt;
  function structify(x: bconv_orvt) return bconv_ort;
  function nullify(x: bconv_ort) return bconv_ort;

  type bconv_rt is record
    i : bconv_irt;
    o : bconv_ort;
  end record bconv_rt;
  constant BCONV_LEN : integer := 562;
  subtype bconv_rvt is std_logic_vector(BCONV_LEN-1 downto 0);
  function vectorify(x: bconv_rt) return bconv_rvt;
  function structify(x: bconv_rvt) return bconv_rt;
  function nullify(x: bconv_rt) return bconv_rt;

end package daq_row_defs_pkg;

------------------------------------------------------------

package body daq_row_defs_pkg is

  function vectorify(x: mngt_to_cell_rt) return mngt_to_cell_rvt is
    variable y : mngt_to_cell_rvt;
  begin
    y(24 downto 24)            := vectorify(x.en);
    y(23 downto 12)            := vectorify(x.win_lower);
    y(11 downto 0)             := vectorify(x.win_width);
    return y;
  end function vectorify;
  function structify(x: mngt_to_cell_rvt) return mngt_to_cell_rt is
    variable y : mngt_to_cell_rt;
  begin
    y.en                       := structify(x(24 downto 24));
    y.win_lower                := structify(x(23 downto 12));
    y.win_width                := structify(x(11 downto 0));
    return y;
  end function structify;
  function nullify(x: mngt_to_cell_rt) return mngt_to_cell_rt is
    variable y : mngt_to_cell_rt;
  begin
    y.en                       := nullify(x.en);
    y.win_lower                := nullify(x.win_lower);
    y.win_width                := nullify(x.win_width);
    return y;
  end function nullify;

  function vectorify(x: cell_to_mngt_rt) return cell_to_mngt_rvt is
    variable y : cell_to_mngt_rvt;
  begin
    y(2 downto 2)              := vectorify(x.done);
    y(1 downto 1)              := vectorify(x.full);
    y(0 downto 0)              := vectorify(x.unexpected);
    return y;
  end function vectorify;
  function structify(x: cell_to_mngt_rvt) return cell_to_mngt_rt is
    variable y : cell_to_mngt_rt;
  begin
    y.done                     := structify(x(2 downto 2));
    y.full                     := structify(x(1 downto 1));
    y.unexpected               := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: cell_to_mngt_rt) return cell_to_mngt_rt is
    variable y : cell_to_mngt_rt;
  begin
    y.done                     := nullify(x.done);
    y.full                     := nullify(x.full);
    y.unexpected               := nullify(x.unexpected);
    return y;
  end function nullify;

  function vectorify(x: mngt_to_cell_bus_at) return mngt_to_cell_bus_avt is
    variable y :  mngt_to_cell_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: mngt_to_cell_bus_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*25-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-25) := vectorify(x(i));
      msb := msb - 25 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: mngt_to_cell_bus_avt) return mngt_to_cell_bus_at is
    variable y :  mngt_to_cell_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return mngt_to_cell_bus_at is
    variable y :  mngt_to_cell_bus_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-25));
      msb := msb - 25 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: mngt_to_cell_bus_at) return mngt_to_cell_bus_at is
    variable y :  mngt_to_cell_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: mngt_to_cell_bus_avt) return mngt_to_cell_bus_avt is
    variable y :  mngt_to_cell_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: cell_to_mngt_bus_at) return cell_to_mngt_bus_avt is
    variable y :  cell_to_mngt_bus_avt(x'range);
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: cell_to_mngt_bus_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*3-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-3) := vectorify(x(i));
      msb := msb - 3 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: cell_to_mngt_bus_avt) return cell_to_mngt_bus_at is
    variable y :  cell_to_mngt_bus_at(x'range);
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return cell_to_mngt_bus_at is
    variable y :  cell_to_mngt_bus_at(x'range);
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-3));
      msb := msb - 3 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: cell_to_mngt_bus_at) return cell_to_mngt_bus_at is
    variable y :  cell_to_mngt_bus_at(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: cell_to_mngt_bus_avt) return cell_to_mngt_bus_avt is
    variable y :  cell_to_mngt_bus_avt(x'range);
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: cell_to_bconv_rt) return cell_to_bconv_rvt is
    variable y : cell_to_bconv_rvt;
  begin
    y(524 downto 524)          := vectorify(x.nempty);
    y(523 downto 12)           := vectorify(x.data);
    y(11 downto 0)             := vectorify(x.counter);
    return y;
  end function vectorify;
  function structify(x: cell_to_bconv_rvt) return cell_to_bconv_rt is
    variable y : cell_to_bconv_rt;
  begin
    y.nempty                   := structify(x(524 downto 524));
    y.data                     := structify(x(523 downto 12));
    y.counter                  := structify(x(11 downto 0));
    return y;
  end function structify;
  function nullify(x: cell_to_bconv_rt) return cell_to_bconv_rt is
    variable y : cell_to_bconv_rt;
  begin
    y.nempty                   := nullify(x.nempty);
    y.data                     := nullify(x.data);
    y.counter                  := nullify(x.counter);
    return y;
  end function nullify;

  function vectorify(x: bconv_to_cell_rt) return bconv_to_cell_rvt is
    variable y : bconv_to_cell_rvt;
  begin
    y(0 downto 0)              := vectorify(x.rd_strb);
    return y;
  end function vectorify;
  function structify(x: bconv_to_cell_rvt) return bconv_to_cell_rt is
    variable y : bconv_to_cell_rt;
  begin
    y.rd_strb                  := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: bconv_to_cell_rt) return bconv_to_cell_rt is
    variable y : bconv_to_cell_rt;
  begin
    y.rd_strb                  := nullify(x.rd_strb);
    return y;
  end function nullify;

  function vectorify(x: cell_generics_rt) return cell_generics_rvt is
    variable y : cell_generics_rvt;
  begin
    y(63 downto 32)            := vectorify(x.INPUT_DATA_LEN);
    y(31 downto 0)             := vectorify(x.COUNTER_LEN);
    return y;
  end function vectorify;
  function structify(x: cell_generics_rvt) return cell_generics_rt is
    variable y : cell_generics_rt;
  begin
    y.INPUT_DATA_LEN           := structify(x(63 downto 32));
    y.COUNTER_LEN              := structify(x(31 downto 0));
    return y;
  end function structify;
  function nullify(x: cell_generics_rt) return cell_generics_rt is
    variable y : cell_generics_rt;
  begin
    y.INPUT_DATA_LEN           := nullify(x.INPUT_DATA_LEN);
    y.COUNTER_LEN              := nullify(x.COUNTER_LEN);
    return y;
  end function nullify;

  function vectorify(x: cell_irt) return cell_irvt is
    variable y : cell_irvt;
  begin
    y(552 downto 551)          := vectorify(x.sys);
    y(550 downto 526)          := vectorify(x.mngt);
    y(525 downto 1)            := vectorify(x.stream);
    y(0 downto 0)              := vectorify(x.bconv);
    return y;
  end function vectorify;
  function structify(x: cell_irvt) return cell_irt is
    variable y : cell_irt;
  begin
    y.sys                      := structify(x(552 downto 551));
    y.mngt                     := structify(x(550 downto 526));
    y.stream                   := structify(x(525 downto 1));
    y.bconv                    := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: cell_irt) return cell_irt is
    variable y : cell_irt;
  begin
    y.sys                      := nullify(x.sys);
    y.mngt                     := nullify(x.mngt);
    y.stream                   := nullify(x.stream);
    y.bconv                    := nullify(x.bconv);
    return y;
  end function nullify;

  function vectorify(x: cell_ort) return cell_orvt is
    variable y : cell_orvt;
  begin
    y(527 downto 525)          := vectorify(x.mngt);
    y(524 downto 0)            := vectorify(x.bconv);
    return y;
  end function vectorify;
  function structify(x: cell_orvt) return cell_ort is
    variable y : cell_ort;
  begin
    y.mngt                     := structify(x(527 downto 525));
    y.bconv                    := structify(x(524 downto 0));
    return y;
  end function structify;
  function nullify(x: cell_ort) return cell_ort is
    variable y : cell_ort;
  begin
    y.mngt                     := nullify(x.mngt);
    y.bconv                    := nullify(x.bconv);
    return y;
  end function nullify;

  function vectorify(x: cell_rt) return cell_rvt is
    variable y : cell_rvt;
  begin
    y(1080 downto 528)         := vectorify(x.i);
    y(527 downto 0)            := vectorify(x.o);
    return y;
  end function vectorify;
  function structify(x: cell_rvt) return cell_rt is
    variable y : cell_rt;
  begin
    y.i                        := structify(x(1080 downto 528));
    y.o                        := structify(x(527 downto 0));
    return y;
  end function structify;
  function nullify(x: cell_rt) return cell_rt is
    variable y : cell_rt;
  begin
    y.i                        := nullify(x.i);
    y.o                        := nullify(x.o);
    return y;
  end function nullify;

  function vectorify(x: cell_bus_at) return cell_bus_avt is
    variable y :  cell_bus_avt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: cell_bus_at) return std_logic_vector is
    variable y : std_logic_vector(x'length*1081-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-1081) := vectorify(x(i));
      msb := msb - 1081 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: cell_bus_avt) return cell_bus_at is
    variable y :  cell_bus_at;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return cell_bus_at is
    variable y :  cell_bus_at;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-1081));
      msb := msb - 1081 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: cell_bus_at) return cell_bus_at is
    variable y :  cell_bus_at;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: cell_bus_avt) return cell_bus_avt is
    variable y :  cell_bus_avt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: cell_bus_iat) return cell_bus_iavt is
    variable y :  cell_bus_iavt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: cell_bus_iat) return std_logic_vector is
    variable y : std_logic_vector(x'length*553-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-553) := vectorify(x(i));
      msb := msb - 553 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: cell_bus_iavt) return cell_bus_iat is
    variable y :  cell_bus_iat;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return cell_bus_iat is
    variable y :  cell_bus_iat;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-553));
      msb := msb - 553 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: cell_bus_iat) return cell_bus_iat is
    variable y :  cell_bus_iat;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: cell_bus_iavt) return cell_bus_iavt is
    variable y :  cell_bus_iavt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: cell_bus_oat) return cell_bus_oavt is
    variable y :  cell_bus_oavt;
  begin
    l: for i in x'range loop
      y(i) := vectorify(x(i));
    end loop l;
    return y;
  end function vectorify;
  function vectorify(x: cell_bus_oat) return std_logic_vector is
    variable y : std_logic_vector(x'length*528-1 downto 0);
    variable msb : integer := y'length-1;
  begin
    l: for i in x'range loop
      y(msb downto msb-528) := vectorify(x(i));
      msb := msb - 528 -1;
    end loop l;
    return y;
  end function vectorify;
  function structify(x: cell_bus_oavt) return cell_bus_oat is
    variable y :  cell_bus_oat;
  begin
    l: for i in x'range loop
      y(i) := structify(x(i));
    end loop l;
    return y;
  end function structify;
  function structify(x: std_logic_vector) return cell_bus_oat is
    variable y :  cell_bus_oat;
    variable msb : integer := x'length-1;
  begin
    l: for i in y'range loop
      y(i) := structify(x(msb downto msb-528));
      msb := msb - 528 -1;
    end loop l;
    return y;
  end function structify;
  function nullify(x: cell_bus_oat) return cell_bus_oat is
    variable y :  cell_bus_oat;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;
  function nullify(x: cell_bus_oavt) return cell_bus_oavt is
    variable y :  cell_bus_oavt;
  begin
    l: for i in y'range loop
      y(i) := nullify(x(i));
    end loop l;
    return y;
  end function nullify;

  function vectorify(x: bconv_generics_rt) return bconv_generics_rvt is
    variable y : bconv_generics_rvt;
  begin
    y(95 downto 64)            := vectorify(x.INPUT_DATA_LEN);
    y(63 downto 32)            := vectorify(x.OUTPUT_DATA_LEN);
    y(31 downto 0)             := vectorify(x.COUNTER_LEN);
    return y;
  end function vectorify;
  function structify(x: bconv_generics_rvt) return bconv_generics_rt is
    variable y : bconv_generics_rt;
  begin
    y.INPUT_DATA_LEN           := structify(x(95 downto 64));
    y.OUTPUT_DATA_LEN          := structify(x(63 downto 32));
    y.COUNTER_LEN              := structify(x(31 downto 0));
    return y;
  end function structify;
  function nullify(x: bconv_generics_rt) return bconv_generics_rt is
    variable y : bconv_generics_rt;
  begin
    y.INPUT_DATA_LEN           := nullify(x.INPUT_DATA_LEN);
    y.OUTPUT_DATA_LEN          := nullify(x.OUTPUT_DATA_LEN);
    y.COUNTER_LEN              := nullify(x.COUNTER_LEN);
    return y;
  end function nullify;

  function vectorify(x: bconv_irt) return bconv_irvt is
    variable y : bconv_irvt;
  begin
    y(527 downto 526)          := vectorify(x.sys);
    y(525 downto 1)            := vectorify(x.cell);
    y(0 downto 0)              := vectorify(x.pkt_bldr);
    return y;
  end function vectorify;
  function structify(x: bconv_irvt) return bconv_irt is
    variable y : bconv_irt;
  begin
    y.sys                      := structify(x(527 downto 526));
    y.cell                     := structify(x(525 downto 1));
    y.pkt_bldr                 := structify(x(0 downto 0));
    return y;
  end function structify;
  function nullify(x: bconv_irt) return bconv_irt is
    variable y : bconv_irt;
  begin
    y.sys                      := nullify(x.sys);
    y.cell                     := nullify(x.cell);
    y.pkt_bldr                 := nullify(x.pkt_bldr);
    return y;
  end function nullify;

  function vectorify(x: bconv_ort) return bconv_orvt is
    variable y : bconv_orvt;
  begin
    y(33 downto 33)            := vectorify(x.cell);
    y(32 downto 0)             := vectorify(x.pkt_bldr);
    return y;
  end function vectorify;
  function structify(x: bconv_orvt) return bconv_ort is
    variable y : bconv_ort;
  begin
    y.cell                     := structify(x(33 downto 33));
    y.pkt_bldr                 := structify(x(32 downto 0));
    return y;
  end function structify;
  function nullify(x: bconv_ort) return bconv_ort is
    variable y : bconv_ort;
  begin
    y.cell                     := nullify(x.cell);
    y.pkt_bldr                 := nullify(x.pkt_bldr);
    return y;
  end function nullify;

  function vectorify(x: bconv_rt) return bconv_rvt is
    variable y : bconv_rvt;
  begin
    y(561 downto 34)           := vectorify(x.i);
    y(33 downto 0)             := vectorify(x.o);
    return y;
  end function vectorify;
  function structify(x: bconv_rvt) return bconv_rt is
    variable y : bconv_rt;
  begin
    y.i                        := structify(x(561 downto 34));
    y.o                        := structify(x(33 downto 0));
    return y;
  end function structify;
  function nullify(x: bconv_rt) return bconv_rt is
    variable y : bconv_rt;
  begin
    y.i                        := nullify(x.i);
    y.o                        := nullify(x.o);
    return y;
  end function nullify;

end package body daq_row_defs_pkg;
