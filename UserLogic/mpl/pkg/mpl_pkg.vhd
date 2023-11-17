-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl

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

package mpl_pkg is

   -- Custom types and functions --

   type mpl2csw_ptcalc_rt is record
      data_valid : std_logic;
      busy : std_logic;
      process_ch : std_logic_vector(UCM2PL_PROCESS_CH_LEN-1 downto 0);
      muid : slc_muid_rt;
      phimod : signed(UCM2PL_PHIMOD_LEN-1 downto 0);
      sl_charge : std_logic;
      nswseg_poseta : unsigned(SLC_ENDCAP_NSWSEG_POSETA_LEN-1 downto 0);
      nswseg_posphi : unsigned(SLC_ENDCAP_NSWSEG_POSPHI_LEN-1 downto 0);
      nswseg_angdtheta : signed(SLC_ENDCAP_NSWSEG_ANGDTHETA_LEN-1 downto 0);
   end record mpl2csw_ptcalc_rt;
   attribute w of mpl2csw_ptcalc_rt : type is 63;
   function width(x: mpl2csw_ptcalc_rt) return natural;
   function convert(x: mpl2csw_ptcalc_rt; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt;
   function zero(tpl: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt;

   subtype mpl2csw_ptcalc_vt is std_logic_vector(mpl2csw_ptcalc_rt'w-1 downto 0);
   attribute w of mpl2csw_ptcalc_vt : subtype is 63;

   type mpl2csw_ptcalc_art is array(integer range <>) of mpl2csw_ptcalc_rt;
   function width(x: mpl2csw_ptcalc_art) return integer;
   function convert(x: mpl2csw_ptcalc_art; tpl: std_logic_vector) return std_logic_vector;
   function convert(x: std_logic_vector; tpl: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art;
   function zero(tpl: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art;
   function convert(x: mpl2csw_ptcalc_art; tpl: std_logic_vector_array) return std_logic_vector_array;
   function convert(x: std_logic_vector_array; tpl: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art;

   subtype mpl2csw_ptcalc_avt is std_logic_vector_array(open)(mpl2csw_ptcalc_rt'w-1 downto 0);

   constant MPL_PL_A_LATENCY : integer := 10;
   attribute w of MPL_PL_A_LATENCY : constant is 32;

   constant MPL_PL_B_LATENCY : integer := 5;
   attribute w of MPL_PL_B_LATENCY : constant is 32;

end package mpl_pkg;

------------------------------------------------------------

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

package body mpl_pkg is

   -- Custom types and functions --

   function width(x: mpl2csw_ptcalc_rt) return natural is
      variable w : natural := 0;
   begin
      w := w + width(x.data_valid);
      w := w + width(x.busy);
      w := w + width(x.process_ch);
      w := w + width(x.muid);
      w := w + width(x.phimod);
      w := w + width(x.sl_charge);
      w := w + width(x.nswseg_poseta);
      w := w + width(x.nswseg_posphi);
      w := w + width(x.nswseg_angdtheta);
      return w;
   end function width;
   function convert(x: mpl2csw_ptcalc_rt; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      variable w : integer;
      variable u : integer := tpl'left;
   begin
      if tpl'ascending then
         w := width(x.data_valid);
         y(u to u+w-1) := convert(x.data_valid, y(u to u+w-1));
         u := u + w;
         w := width(x.busy);
         y(u to u+w-1) := convert(x.busy, y(u to u+w-1));
         u := u + w;
         w := width(x.process_ch);
         y(u to u+w-1) := convert(x.process_ch, y(u to u+w-1));
         u := u + w;
         w := width(x.muid);
         y(u to u+w-1) := convert(x.muid, y(u to u+w-1));
         u := u + w;
         w := width(x.phimod);
         y(u to u+w-1) := convert(x.phimod, y(u to u+w-1));
         u := u + w;
         w := width(x.sl_charge);
         y(u to u+w-1) := convert(x.sl_charge, y(u to u+w-1));
         u := u + w;
         w := width(x.nswseg_poseta);
         y(u to u+w-1) := convert(x.nswseg_poseta, y(u to u+w-1));
         u := u + w;
         w := width(x.nswseg_posphi);
         y(u to u+w-1) := convert(x.nswseg_posphi, y(u to u+w-1));
         u := u + w;
         w := width(x.nswseg_angdtheta);
         y(u to u+w-1) := convert(x.nswseg_angdtheta, y(u to u+w-1));
      else
         w := width(x.data_valid);
         y(u downto u-w+1) := convert(x.data_valid, y(u downto u-w+1));
         u := u - w;
         w := width(x.busy);
         y(u downto u-w+1) := convert(x.busy, y(u downto u-w+1));
         u := u - w;
         w := width(x.process_ch);
         y(u downto u-w+1) := convert(x.process_ch, y(u downto u-w+1));
         u := u - w;
         w := width(x.muid);
         y(u downto u-w+1) := convert(x.muid, y(u downto u-w+1));
         u := u - w;
         w := width(x.phimod);
         y(u downto u-w+1) := convert(x.phimod, y(u downto u-w+1));
         u := u - w;
         w := width(x.sl_charge);
         y(u downto u-w+1) := convert(x.sl_charge, y(u downto u-w+1));
         u := u - w;
         w := width(x.nswseg_poseta);
         y(u downto u-w+1) := convert(x.nswseg_poseta, y(u downto u-w+1));
         u := u - w;
         w := width(x.nswseg_posphi);
         y(u downto u-w+1) := convert(x.nswseg_posphi, y(u downto u-w+1));
         u := u - w;
         w := width(x.nswseg_angdtheta);
         y(u downto u-w+1) := convert(x.nswseg_angdtheta, y(u downto u-w+1));
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt is
      variable y : mpl2csw_ptcalc_rt;
      variable w : integer;
      variable u : integer := x'left;
   begin
      if x'ascending then
         w := width(tpl.data_valid);
         y.data_valid := convert(x(u to u+w-1), tpl.data_valid);
         u := u + w;
         w := width(tpl.busy);
         y.busy := convert(x(u to u+w-1), tpl.busy);
         u := u + w;
         w := width(tpl.process_ch);
         y.process_ch := convert(x(u to u+w-1), tpl.process_ch);
         u := u + w;
         w := width(tpl.muid);
         y.muid := convert(x(u to u+w-1), tpl.muid);
         u := u + w;
         w := width(tpl.phimod);
         y.phimod := convert(x(u to u+w-1), tpl.phimod);
         u := u + w;
         w := width(tpl.sl_charge);
         y.sl_charge := convert(x(u to u+w-1), tpl.sl_charge);
         u := u + w;
         w := width(tpl.nswseg_poseta);
         y.nswseg_poseta := convert(x(u to u+w-1), tpl.nswseg_poseta);
         u := u + w;
         w := width(tpl.nswseg_posphi);
         y.nswseg_posphi := convert(x(u to u+w-1), tpl.nswseg_posphi);
         u := u + w;
         w := width(tpl.nswseg_angdtheta);
         y.nswseg_angdtheta := convert(x(u to u+w-1), tpl.nswseg_angdtheta);
      else
         w := width(tpl.data_valid);
         y.data_valid := convert(x(u downto u-w+1), tpl.data_valid);
         u := u - w;
         w := width(tpl.busy);
         y.busy := convert(x(u downto u-w+1), tpl.busy);
         u := u - w;
         w := width(tpl.process_ch);
         y.process_ch := convert(x(u downto u-w+1), tpl.process_ch);
         u := u - w;
         w := width(tpl.muid);
         y.muid := convert(x(u downto u-w+1), tpl.muid);
         u := u - w;
         w := width(tpl.phimod);
         y.phimod := convert(x(u downto u-w+1), tpl.phimod);
         u := u - w;
         w := width(tpl.sl_charge);
         y.sl_charge := convert(x(u downto u-w+1), tpl.sl_charge);
         u := u - w;
         w := width(tpl.nswseg_poseta);
         y.nswseg_poseta := convert(x(u downto u-w+1), tpl.nswseg_poseta);
         u := u - w;
         w := width(tpl.nswseg_posphi);
         y.nswseg_posphi := convert(x(u downto u-w+1), tpl.nswseg_posphi);
         u := u - w;
         w := width(tpl.nswseg_angdtheta);
         y.nswseg_angdtheta := convert(x(u downto u-w+1), tpl.nswseg_angdtheta);
      end if;
      return y;
   end function convert;
   function zero(tpl: mpl2csw_ptcalc_rt) return mpl2csw_ptcalc_rt is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;

   function width(x: mpl2csw_ptcalc_art) return integer is
      variable w : integer;
   begin
      if x'length < 1 then
        w := 0;
      else
        w := x'length * width(x(x'low));
      end if;
      return w;
   end function width;
   function convert(x: mpl2csw_ptcalc_art; tpl: std_logic_vector) return std_logic_vector is
      variable y : std_logic_vector(tpl'range);
      constant W : natural := width(x(x'low));
      variable a : integer;
      variable b : integer;
   begin
      if y'ascending then
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(b to a), convert(x(i+x'low), y(b to a)));
         end loop;
      else
         for i in 0 to x'length-1 loop
            a := W*i + y'low + W - 1;
            b := W*i + y'low;
            assign(y(a downto b), convert(x(i+x'low), y(a downto b)));
         end loop;
      end if;
      return y;
   end function convert;
   function convert(x: std_logic_vector; tpl: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art is
      variable y : mpl2csw_ptcalc_art(tpl'range);
      constant W : natural := width(y(y'low));
      variable a : integer;
      variable b : integer;
   begin
      if x'ascending then
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(b to a), y(i+y'low));
         end loop;
      else
         for i in 0 to y'length-1 loop
            a := W*i + x'low + W - 1;
            b := W*i + x'low;
            y(i+y'low) := convert(x(a downto b), y(i+y'low));
         end loop;
      end if;
      return y;
   end function convert;
   function zero(tpl: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art is
   begin
      return convert(std_logic_vector'(width(tpl)-1 downto 0 => '0'), tpl);
   end function zero;
   function convert(x: mpl2csw_ptcalc_art; tpl: std_logic_vector_array) return std_logic_vector_array is
      variable y : std_logic_vector_array(tpl'range)(tpl(tpl'low)'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), (y(j)'range => '0'));
      end loop;
      return y;
   end function convert;
   function convert(x: std_logic_vector_array; tpl: mpl2csw_ptcalc_art) return mpl2csw_ptcalc_art is
      variable y : mpl2csw_ptcalc_art(tpl'range);
   begin
      for j in y'range loop
          y(j) := convert(x(j), y(j));
      end loop;
      return y;
   end function convert;

end package body mpl_pkg;
