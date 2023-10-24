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
use shared_lib.config_pkg.all;

package pt_params_pkg is
-- ComboId to ROM index function declaration
function comboid_to_index_ram(comboid : unsigned) return std_logic_vector;

-- pT parametrisation constants
constant params_width : natural := 32;
constant A0_LEN       : natural := 3;
constant A1_LEN       : natural := 14;
constant P0_0_LEN     : natural := 3;
constant P1_0_LEN     : natural := 4;
constant P2_0_LEN     : natural := 7;
constant P0_1_LEN     : natural := 2;
constant P1_1_LEN     : natural := 3;
constant P2_1_LEN     : natural := 7;
constant E0_0_LEN     : natural := 9;
constant E1_0_LEN     : natural := 9;
constant E0_1_LEN     : natural := 7;
constant E1_1_LEN     : natural := 7;

constant PARAMS_DEPTH_LEN : natural := 7;
constant PHIMOD_MULTI_LEN   : integer := integer(log2(UCM2PL_PHIMOD_MULT));
constant ETA_MULTI_LEN : integer := integer(log2(PTCALC2MTC_MDT_ETA_MULT));
constant TF_AX_1_MULTI : real := 8.0;
constant TF_AX_1_MULTI_LEN : integer := integer(log2(TF_AX_1_MULTI));
constant TF_PX_1_MULTI : real := 8.0;
constant TF_PX_1_MULTI_LEN : integer := integer(log2(TF_PX_1_MULTI));
constant TF_EX_1_MULTI : real := 8.0;
constant TF_EX_1_MULTI_LEN : integer := integer(log2(TF_EX_1_MULTI));


constant B_MULT     : real := 8.0;
constant B_MULT_LEN : integer := integer(log2(B_MULT));
constant C_MULT     : real := 8.0;
constant C_MULT_LEN : integer := integer(log2(C_MULT));

end;
package body pt_params_pkg is

function comboid_to_index_ram(comboid : unsigned) return std_logic_vector is
variable index : integer := 0;
variable addr : std_logic_vector(PARAMS_DEPTH_LEN-1 downto 0);
begin
if comboid = 273 then
 index := 0;
end if;
if comboid = 529 then
 index := 1;
end if;
if comboid = 17 then
 index := 2;
end if;
if comboid = 289 then
 index := 3;
end if;
if comboid = 545 then
 index := 4;
end if;
if comboid = 33 then
 index := 5;
end if;
if comboid = 257 then
 index := 6;
end if;
if comboid = 513 then
 index := 7;
end if;
if comboid = 274 then
 index := 8;
end if;
if comboid = 84 then
 index := 9;
end if;
if comboid = 772 then
 index := 10;
end if;
if comboid = 1028 then
 index := 11;
end if;
if comboid = 1284 then
 index := 12;
end if;
if comboid = 1093 then
 index := 13;
end if;
if comboid = 1349 then
 index := 14;
end if;
if comboid = 1605 then
 index := 15;
end if;
if comboid = 69 then
 index := 16;
end if;
if comboid = 1109 then
 index := 17;
end if;
if comboid = 1365 then
 index := 18;
end if;
if comboid = 1621 then
 index := 19;
end if;
if comboid = 85 then
 index := 20;
end if;
if comboid = 1381 then
 index := 21;
end if;
if comboid = 1637 then
 index := 22;
end if;
if comboid = 101 then
 index := 23;
end if;
if comboid = 1029 then
 index := 24;
end if;
if comboid = 1285 then
 index := 25;
end if;
if comboid = 1541 then
 index := 26;
end if;
if comboid = 1350 then
 index := 27;
end if;
if comboid = 1366 then
 index := 28;
end if;
if comboid = 1622 then
 index := 29;
end if;
if comboid = 86 then
 index := 30;
end if;
if comboid = 1382 then
 index := 31;
end if;
if comboid = 1638 then
 index := 32;
end if;
if comboid = 102 then
 index := 33;
end if;
if comboid = 1286 then
 index := 34;
end if;
if comboid = 1542 then
 index := 35;
end if;
if comboid = 530 then
 index := 36;
end if;
if comboid = 18 then
 index := 37;
end if;
if comboid = 290 then
 index := 38;
end if;
if comboid = 546 then
 index := 39;
end if;
if comboid = 802 then
 index := 40;
end if;
if comboid = 34 then
 index := 41;
end if;
if comboid = 818 then
 index := 42;
end if;
if comboid = 50 then
 index := 43;
end if;
if comboid = 258 then
 index := 44;
end if;
if comboid = 514 then
 index := 45;
end if;
if comboid = 770 then
 index := 46;
end if;
if comboid = 547 then
 index := 47;
end if;
if comboid = 803 then
 index := 48;
end if;
if comboid = 35 then
 index := 49;
end if;
if comboid = 563 then
 index := 50;
end if;
if comboid = 819 then
 index := 51;
end if;
if comboid = 1075 then
 index := 52;
end if;
if comboid = 51 then
 index := 53;
end if;
if comboid = 67 then
 index := 54;
end if;
if comboid = 515 then
 index := 55;
end if;
if comboid = 771 then
 index := 56;
end if;
if comboid = 1027 then
 index := 57;
end if;
if comboid = 820 then
 index := 58;
end if;
if comboid = 1076 then
 index := 59;
end if;
if comboid = 52 then
 index := 60;
end if;
if comboid = 1092 then
 index := 61;
end if;
if comboid = 1348 then
 index := 62;
end if;
if comboid = 272 then
 index := 63;
end if;
if comboid = 528 then
 index := 64;
end if;
if comboid = 288 then
 index := 65;
end if;
if comboid = 544 then
 index := 66;
end if;
if comboid = 800 then
 index := 67;
end if;
if comboid = 68 then
 index := 68;
end if;
if comboid = 1108 then
 index := 69;
end if;
if comboid = 1364 then
 index := 70;
end if;
if comboid = 560 then
 index := 71;
end if;
if comboid = 816 then
 index := 72;
end if;
if comboid = 1072 then
 index := 73;
end if;
if comboid = 1088 then
 index := 74;
end if;
if comboid = 1344 then
 index := 75;
end if;
if comboid = 1104 then
 index := 76;
end if;
if comboid = 1360 then
 index := 77;
end if;
if comboid = 1616 then
 index := 78;
end if;
if comboid = 1376 then
 index := 79;
end if;
if comboid = 1632 then
 index := 80;
end if;
addr := std_logic_vector(to_unsigned(index, PARAMS_DEPTH_LEN));
return addr;
end function;

end package body;