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
function acomboid_to_index_ram(comboid : unsigned) return std_logic_vector;

-- pT parametrisation constants
constant params_width : natural := 32;
constant A0_LEN     : natural := 11;
constant A1_LEN     : natural := 11;
constant B0_LEN     : natural := 8;
constant B1_LEN     : natural := 11;
constant B2_LEN     : natural := 16;
constant C0_LEN     : natural := 16;
constant C1_LEN     : natural := 16;

constant A_PARAMS_DEPTH_LEN : natural := 5;
constant PARAMS_DEPTH_LEN : natural := 9;
constant PHIMOD_MULTI_LEN   : integer := integer(log2(UCM2PL_PHIMOD_MULT*1000.0));
constant ETA_MULTI_LEN : integer := integer(log2(PTCALC2MTC_MDT_ETA_MULT));
constant B_MULT     : real := 8.0;
constant B_MULT_LEN : integer := integer(log2(B_MULT));
constant C_MULT     : real := 8.0;
constant C_MULT_LEN : integer := integer(log2(C_MULT));

end;
package body pt_params_pkg is

function acomboid_to_index_ram(comboid : unsigned) return std_logic_vector is
variable index : integer := 0;
variable addr : std_logic_vector(A_PARAMS_DEPTH_LEN-1 downto 0);
begin
if comboid = 1126 then
 index := 0;
end if;
if comboid = 1638 then
 index := 1;
end if;
if comboid = 257 then
 index := 2;
end if;
if comboid = 1028 then
 index := 3;
end if;
if comboid = 1092 then
 index := 4;
end if;
if comboid = 1348 then
 index := 5;
end if;
if comboid = 514 then
 index := 6;
end if;
if comboid = 771 then
 index := 7;
end if;
if comboid = 1542 then
 index := 8;
end if;
if comboid = 546 then
 index := 9;
end if;
if comboid = 803 then
 index := 10;
end if;
if comboid = 1076 then
 index := 11;
end if;
if comboid = 272 then
 index := 12;
end if;
if comboid = 819 then
 index := 13;
end if;
if comboid = 1075 then
 index := 14;
end if;
if comboid = 102 then
 index := 15;
end if;
if comboid = 529 then
 index := 16;
end if;
if comboid = 273 then
 index := 17;
end if;
if comboid = 1381 then
 index := 18;
end if;
if comboid = 17 then
 index := 19;
end if;
if comboid = 34 then
 index := 20;
end if;
if comboid = 85 then
 index := 21;
end if;
if comboid = 1365 then
 index := 22;
end if;
if comboid = 51 then
 index := 23;
end if;
if comboid = 68 then
 index := 24;
end if;
if comboid = 1072 then
 index := 25;
end if;
if comboid = 1364 then
 index := 26;
end if;
addr := std_logic_vector(to_unsigned(index, A_PARAMS_DEPTH_LEN));
return addr;
end function;

function comboid_to_index_ram(comboid : unsigned) return std_logic_vector is
variable index : integer := 0;
variable addr : std_logic_vector(PARAMS_DEPTH_LEN-1 downto 0);
begin
if comboid = 5206 then
 index := 0;
end if;
if comboid = 9302 then
 index := 1;
end if;
if comboid = 13398 then
 index := 2;
end if;
if comboid = 17494 then
 index := 3;
end if;
if comboid = 21590 then
 index := 4;
end if;
if comboid = 25686 then
 index := 5;
end if;
if comboid = 29782 then
 index := 6;
end if;
if comboid = 33878 then
 index := 7;
end if;
if comboid = 37974 then
 index := 8;
end if;
if comboid = 1126 then
 index := 9;
end if;
if comboid = 5222 then
 index := 10;
end if;
if comboid = 9318 then
 index := 11;
end if;
if comboid = 13414 then
 index := 12;
end if;
if comboid = 17510 then
 index := 13;
end if;
if comboid = 21606 then
 index := 14;
end if;
if comboid = 25702 then
 index := 15;
end if;
if comboid = 29798 then
 index := 16;
end if;
if comboid = 33894 then
 index := 17;
end if;
if comboid = 37990 then
 index := 18;
end if;
if comboid = 1638 then
 index := 19;
end if;
if comboid = 5734 then
 index := 20;
end if;
if comboid = 9830 then
 index := 21;
end if;
if comboid = 13926 then
 index := 22;
end if;
if comboid = 18022 then
 index := 23;
end if;
if comboid = 22118 then
 index := 24;
end if;
if comboid = 26214 then
 index := 25;
end if;
if comboid = 30310 then
 index := 26;
end if;
if comboid = 34406 then
 index := 27;
end if;
if comboid = 38502 then
 index := 28;
end if;
if comboid = 257 then
 index := 29;
end if;
if comboid = 4353 then
 index := 30;
end if;
if comboid = 8449 then
 index := 31;
end if;
if comboid = 12545 then
 index := 32;
end if;
if comboid = 16641 then
 index := 33;
end if;
if comboid = 20737 then
 index := 34;
end if;
if comboid = 24833 then
 index := 35;
end if;
if comboid = 28929 then
 index := 36;
end if;
if comboid = 33025 then
 index := 37;
end if;
if comboid = 37121 then
 index := 38;
end if;
if comboid = 1028 then
 index := 39;
end if;
if comboid = 5124 then
 index := 40;
end if;
if comboid = 9220 then
 index := 41;
end if;
if comboid = 13316 then
 index := 42;
end if;
if comboid = 17412 then
 index := 43;
end if;
if comboid = 21508 then
 index := 44;
end if;
if comboid = 25604 then
 index := 45;
end if;
if comboid = 29700 then
 index := 46;
end if;
if comboid = 33796 then
 index := 47;
end if;
if comboid = 37892 then
 index := 48;
end if;
if comboid = 1092 then
 index := 49;
end if;
if comboid = 5188 then
 index := 50;
end if;
if comboid = 9284 then
 index := 51;
end if;
if comboid = 13380 then
 index := 52;
end if;
if comboid = 17476 then
 index := 53;
end if;
if comboid = 21572 then
 index := 54;
end if;
if comboid = 25668 then
 index := 55;
end if;
if comboid = 29764 then
 index := 56;
end if;
if comboid = 33860 then
 index := 57;
end if;
if comboid = 37956 then
 index := 58;
end if;
if comboid = 1348 then
 index := 59;
end if;
if comboid = 5444 then
 index := 60;
end if;
if comboid = 9540 then
 index := 61;
end if;
if comboid = 13636 then
 index := 62;
end if;
if comboid = 17732 then
 index := 63;
end if;
if comboid = 21828 then
 index := 64;
end if;
if comboid = 25924 then
 index := 65;
end if;
if comboid = 30020 then
 index := 66;
end if;
if comboid = 34116 then
 index := 67;
end if;
if comboid = 38212 then
 index := 68;
end if;
if comboid = 514 then
 index := 69;
end if;
if comboid = 4610 then
 index := 70;
end if;
if comboid = 8706 then
 index := 71;
end if;
if comboid = 12802 then
 index := 72;
end if;
if comboid = 16898 then
 index := 73;
end if;
if comboid = 20994 then
 index := 74;
end if;
if comboid = 25090 then
 index := 75;
end if;
if comboid = 29186 then
 index := 76;
end if;
if comboid = 33282 then
 index := 77;
end if;
if comboid = 37378 then
 index := 78;
end if;
if comboid = 771 then
 index := 79;
end if;
if comboid = 4867 then
 index := 80;
end if;
if comboid = 8963 then
 index := 81;
end if;
if comboid = 13059 then
 index := 82;
end if;
if comboid = 17155 then
 index := 83;
end if;
if comboid = 21251 then
 index := 84;
end if;
if comboid = 25347 then
 index := 85;
end if;
if comboid = 29443 then
 index := 86;
end if;
if comboid = 33539 then
 index := 87;
end if;
if comboid = 37635 then
 index := 88;
end if;
if comboid = 1542 then
 index := 89;
end if;
if comboid = 5638 then
 index := 90;
end if;
if comboid = 9734 then
 index := 91;
end if;
if comboid = 13830 then
 index := 92;
end if;
if comboid = 17926 then
 index := 93;
end if;
if comboid = 22022 then
 index := 94;
end if;
if comboid = 26118 then
 index := 95;
end if;
if comboid = 30214 then
 index := 96;
end if;
if comboid = 34310 then
 index := 97;
end if;
if comboid = 38406 then
 index := 98;
end if;
if comboid = 546 then
 index := 99;
end if;
if comboid = 4642 then
 index := 100;
end if;
if comboid = 8738 then
 index := 101;
end if;
if comboid = 12834 then
 index := 102;
end if;
if comboid = 16930 then
 index := 103;
end if;
if comboid = 21026 then
 index := 104;
end if;
if comboid = 25122 then
 index := 105;
end if;
if comboid = 29218 then
 index := 106;
end if;
if comboid = 33314 then
 index := 107;
end if;
if comboid = 37410 then
 index := 108;
end if;
if comboid = 803 then
 index := 109;
end if;
if comboid = 4899 then
 index := 110;
end if;
if comboid = 8995 then
 index := 111;
end if;
if comboid = 13091 then
 index := 112;
end if;
if comboid = 17187 then
 index := 113;
end if;
if comboid = 21283 then
 index := 114;
end if;
if comboid = 25379 then
 index := 115;
end if;
if comboid = 29475 then
 index := 116;
end if;
if comboid = 33571 then
 index := 117;
end if;
if comboid = 37667 then
 index := 118;
end if;
if comboid = 1076 then
 index := 119;
end if;
if comboid = 5172 then
 index := 120;
end if;
if comboid = 9268 then
 index := 121;
end if;
if comboid = 13364 then
 index := 122;
end if;
if comboid = 17460 then
 index := 123;
end if;
if comboid = 21556 then
 index := 124;
end if;
if comboid = 25652 then
 index := 125;
end if;
if comboid = 29748 then
 index := 126;
end if;
if comboid = 33844 then
 index := 127;
end if;
if comboid = 37940 then
 index := 128;
end if;
if comboid = 272 then
 index := 129;
end if;
if comboid = 4368 then
 index := 130;
end if;
if comboid = 8464 then
 index := 131;
end if;
if comboid = 12560 then
 index := 132;
end if;
if comboid = 16656 then
 index := 133;
end if;
if comboid = 20752 then
 index := 134;
end if;
if comboid = 24848 then
 index := 135;
end if;
if comboid = 28944 then
 index := 136;
end if;
if comboid = 33040 then
 index := 137;
end if;
if comboid = 37136 then
 index := 138;
end if;
if comboid = 819 then
 index := 139;
end if;
if comboid = 4915 then
 index := 140;
end if;
if comboid = 9011 then
 index := 141;
end if;
if comboid = 13107 then
 index := 142;
end if;
if comboid = 17203 then
 index := 143;
end if;
if comboid = 21299 then
 index := 144;
end if;
if comboid = 25395 then
 index := 145;
end if;
if comboid = 29491 then
 index := 146;
end if;
if comboid = 33587 then
 index := 147;
end if;
if comboid = 37683 then
 index := 148;
end if;
if comboid = 1075 then
 index := 149;
end if;
if comboid = 5171 then
 index := 150;
end if;
if comboid = 9267 then
 index := 151;
end if;
if comboid = 13363 then
 index := 152;
end if;
if comboid = 17459 then
 index := 153;
end if;
if comboid = 21555 then
 index := 154;
end if;
if comboid = 25651 then
 index := 155;
end if;
if comboid = 29747 then
 index := 156;
end if;
if comboid = 33843 then
 index := 157;
end if;
if comboid = 37939 then
 index := 158;
end if;
if comboid = 102 then
 index := 159;
end if;
if comboid = 4198 then
 index := 160;
end if;
if comboid = 8294 then
 index := 161;
end if;
if comboid = 12390 then
 index := 162;
end if;
if comboid = 16486 then
 index := 163;
end if;
if comboid = 20582 then
 index := 164;
end if;
if comboid = 24678 then
 index := 165;
end if;
if comboid = 28774 then
 index := 166;
end if;
if comboid = 32870 then
 index := 167;
end if;
if comboid = 36966 then
 index := 168;
end if;
if comboid = 529 then
 index := 169;
end if;
if comboid = 4625 then
 index := 170;
end if;
if comboid = 8721 then
 index := 171;
end if;
if comboid = 12817 then
 index := 172;
end if;
if comboid = 16913 then
 index := 173;
end if;
if comboid = 21009 then
 index := 174;
end if;
if comboid = 25105 then
 index := 175;
end if;
if comboid = 29201 then
 index := 176;
end if;
if comboid = 33297 then
 index := 177;
end if;
if comboid = 37393 then
 index := 178;
end if;
if comboid = 273 then
 index := 179;
end if;
if comboid = 4369 then
 index := 180;
end if;
if comboid = 8465 then
 index := 181;
end if;
if comboid = 12561 then
 index := 182;
end if;
if comboid = 16657 then
 index := 183;
end if;
if comboid = 20753 then
 index := 184;
end if;
if comboid = 24849 then
 index := 185;
end if;
if comboid = 28945 then
 index := 186;
end if;
if comboid = 33041 then
 index := 187;
end if;
if comboid = 37137 then
 index := 188;
end if;
if comboid = 1381 then
 index := 189;
end if;
if comboid = 5477 then
 index := 190;
end if;
if comboid = 9573 then
 index := 191;
end if;
if comboid = 13669 then
 index := 192;
end if;
if comboid = 17765 then
 index := 193;
end if;
if comboid = 21861 then
 index := 194;
end if;
if comboid = 25957 then
 index := 195;
end if;
if comboid = 30053 then
 index := 196;
end if;
if comboid = 34149 then
 index := 197;
end if;
if comboid = 38245 then
 index := 198;
end if;
if comboid = 17 then
 index := 199;
end if;
if comboid = 4113 then
 index := 200;
end if;
if comboid = 8209 then
 index := 201;
end if;
if comboid = 12305 then
 index := 202;
end if;
if comboid = 16401 then
 index := 203;
end if;
if comboid = 20497 then
 index := 204;
end if;
if comboid = 24593 then
 index := 205;
end if;
if comboid = 28689 then
 index := 206;
end if;
if comboid = 32785 then
 index := 207;
end if;
if comboid = 36881 then
 index := 208;
end if;
if comboid = 34 then
 index := 209;
end if;
if comboid = 4130 then
 index := 210;
end if;
if comboid = 8226 then
 index := 211;
end if;
if comboid = 12322 then
 index := 212;
end if;
if comboid = 16418 then
 index := 213;
end if;
if comboid = 20514 then
 index := 214;
end if;
if comboid = 24610 then
 index := 215;
end if;
if comboid = 28706 then
 index := 216;
end if;
if comboid = 32802 then
 index := 217;
end if;
if comboid = 36898 then
 index := 218;
end if;
if comboid = 85 then
 index := 219;
end if;
if comboid = 4181 then
 index := 220;
end if;
if comboid = 8277 then
 index := 221;
end if;
if comboid = 12373 then
 index := 222;
end if;
if comboid = 16469 then
 index := 223;
end if;
if comboid = 20565 then
 index := 224;
end if;
if comboid = 24661 then
 index := 225;
end if;
if comboid = 28757 then
 index := 226;
end if;
if comboid = 32853 then
 index := 227;
end if;
if comboid = 36949 then
 index := 228;
end if;
if comboid = 1365 then
 index := 229;
end if;
if comboid = 5461 then
 index := 230;
end if;
if comboid = 9557 then
 index := 231;
end if;
if comboid = 13653 then
 index := 232;
end if;
if comboid = 17749 then
 index := 233;
end if;
if comboid = 21845 then
 index := 234;
end if;
if comboid = 25941 then
 index := 235;
end if;
if comboid = 30037 then
 index := 236;
end if;
if comboid = 34133 then
 index := 237;
end if;
if comboid = 38229 then
 index := 238;
end if;
if comboid = 51 then
 index := 239;
end if;
if comboid = 4147 then
 index := 240;
end if;
if comboid = 8243 then
 index := 241;
end if;
if comboid = 12339 then
 index := 242;
end if;
if comboid = 16435 then
 index := 243;
end if;
if comboid = 20531 then
 index := 244;
end if;
if comboid = 24627 then
 index := 245;
end if;
if comboid = 28723 then
 index := 246;
end if;
if comboid = 32819 then
 index := 247;
end if;
if comboid = 36915 then
 index := 248;
end if;
if comboid = 68 then
 index := 249;
end if;
if comboid = 4164 then
 index := 250;
end if;
if comboid = 8260 then
 index := 251;
end if;
if comboid = 12356 then
 index := 252;
end if;
if comboid = 16452 then
 index := 253;
end if;
if comboid = 20548 then
 index := 254;
end if;
if comboid = 24644 then
 index := 255;
end if;
if comboid = 28740 then
 index := 256;
end if;
if comboid = 32836 then
 index := 257;
end if;
if comboid = 36932 then
 index := 258;
end if;
if comboid = 1072 then
 index := 259;
end if;
if comboid = 5168 then
 index := 260;
end if;
if comboid = 9264 then
 index := 261;
end if;
if comboid = 13360 then
 index := 262;
end if;
if comboid = 17456 then
 index := 263;
end if;
if comboid = 21552 then
 index := 264;
end if;
if comboid = 25648 then
 index := 265;
end if;
if comboid = 29744 then
 index := 266;
end if;
if comboid = 33840 then
 index := 267;
end if;
if comboid = 37936 then
 index := 268;
end if;
if comboid = 1364 then
 index := 269;
end if;
if comboid = 5460 then
 index := 270;
end if;
if comboid = 9556 then
 index := 271;
end if;
if comboid = 13652 then
 index := 272;
end if;
if comboid = 17748 then
 index := 273;
end if;
if comboid = 21844 then
 index := 274;
end if;
if comboid = 25940 then
 index := 275;
end if;
if comboid = 30036 then
 index := 276;
end if;
if comboid = 34132 then
 index := 277;
end if;
if comboid = 38228 then
 index := 278;
end if;
addr := std_logic_vector(to_unsigned(index, PARAMS_DEPTH_LEN));
return addr;
end function;

end package body;