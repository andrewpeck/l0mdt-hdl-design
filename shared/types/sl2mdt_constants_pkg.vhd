-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package sl2mdt_constants_pkg is

  constant SL2MDT_HEADER_H_RESERVED_LEN : integer := 10;

  constant SL2MDT_HEADER_H_RESERVED_MULT : real := 1.0;

  constant SL2MDT_HEADER_TCOVERFLOW_LEN : integer := 1;

  constant SL2MDT_HEADER_TCOVERFLOW_MULT : real := 1.0;

  constant SL2MDT_HEADER_NMTC_SL_LEN : integer := 3;

  constant SL2MDT_HEADER_NMTC_SL_MULT : real := 1.0;

  constant SL2MDT_HEADER_NMTC_MDT_LEN : integer := 3;

  constant SL2MDT_HEADER_NMTC_MDT_MULT : real := 1.0;

  constant SL2MDT_HEADER_NSLC_SLC_LEN : integer := 3;

  constant SL2MDT_HEADER_NSLC_SLC_MULT : real := 1.0;

  constant SL2MDT_HEADER_BCID_LEN : integer := 12;

  constant SL2MDT_HEADER_BCID_MULT : real := 1.0;

  constant SL2MDT_TRAILER_T_RESERVED_LEN : integer := 6;

  constant SL2MDT_TRAILER_T_RESERVED_MULT : real := 1.0;

  constant SL2MDT_TRAILER_CRC_LEN : integer := 8;

  constant SL2MDT_TRAILER_CRC_MULT : real := 1.0;

  constant SL2MDT_TRAILER_FIBERID_LEN : integer := 4;

  constant SL2MDT_TRAILER_FIBERID_MULT : real := 1.0;

  constant SL2MDT_TRAILER_SLID_LEN : integer := 6;

  constant SL2MDT_TRAILER_SLID_MULT : real := 1.0;

  constant SL2MDT_TRAILER_COMMA_LEN : integer := 8;

  constant SL2MDT_TRAILER_COMMA_MULT : real := 1.0;

  constant SL2MDT_SLC_COMMON_SLCID_LEN : integer := 3;

  constant SL2MDT_SLC_COMMON_SLCID_MULT : real := 1.0;

  constant SL2MDT_SLC_COMMON_TCSENT_LEN : integer := 1;

  constant SL2MDT_SLC_COMMON_TCSENT_MULT : real := 1.0;

  constant SL2MDT_SLC_COMMON_POSETA_LEN : integer := 14;

  constant SL2MDT_SLC_COMMON_POSETA_MULT : real := 4096.0;

  constant SL2MDT_SLC_COMMON_POSPHI_LEN : integer := 9;

  constant SL2MDT_SLC_COMMON_POSPHI_MULT : real := 0.0625;

  constant SL2MDT_SLC_COMMON_SL_PT_LEN : integer := 8;

  constant SL2MDT_SLC_COMMON_SL_PT_MULT : real := 2.0;

  constant SL2MDT_SLC_COMMON_SL_PTTHRESH_LEN : integer := 4;

  constant SL2MDT_SLC_COMMON_SL_PTTHRESH_MULT : real := 0.25;

  constant SL2MDT_SLC_COMMON_SL_CHARGE_LEN : integer := 1;

  constant SL2MDT_SLC_COMMON_SL_CHARGE_MULT : real := 1.0;

  constant SL2MDT_SLC_COMMON_COINTYPE_LEN : integer := 3;

  constant SL2MDT_SLC_COMMON_COINTYPE_MULT : real := 1.0;

  constant SL2MDT_SLC_ENDCAP_E_RESERVED_LEN : integer := 46;

  constant SL2MDT_SLC_ENDCAP_E_RESERVED_MULT : real := 1.0;

  constant SL2MDT_SLC_ENDCAP_NSWSEG_MON_LEN : integer := 1;

  constant SL2MDT_SLC_ENDCAP_NSWSEG_MON_MULT : real := 1.0;

  constant SL2MDT_SLC_ENDCAP_NSWSEG_ANGDTHETA_LEN : integer := 5;

  constant SL2MDT_SLC_ENDCAP_NSWSEG_ANGDTHETA_MULT : real := 1.0;

  constant SL2MDT_SLC_ENDCAP_NSWSEG_POSPHI_LEN : integer := 8;

  constant SL2MDT_SLC_ENDCAP_NSWSEG_POSPHI_MULT : real := 0.03125;

  constant SL2MDT_SLC_ENDCAP_NSWSEG_POSETA_LEN : integer := 14;

  constant SL2MDT_SLC_ENDCAP_NSWSEG_POSETA_MULT : real := 4096.0;

  constant SL2MDT_SLC_ENDCAP_SEG_ANGDPHI_LEN : integer := 4;

  constant SL2MDT_SLC_ENDCAP_SEG_ANGDPHI_MULT : real := 0.25;

  constant SL2MDT_SLC_ENDCAP_SEG_ANGDTHETA_LEN : integer := 7;

  constant SL2MDT_SLC_ENDCAP_SEG_ANGDTHETA_MULT : real := 0.25;

  constant SL2MDT_SLC_BARREL_B_RESERVED_LEN : integer := 37;

  constant SL2MDT_SLC_BARREL_B_RESERVED_MULT : real := 1.0;

  constant SL2MDT_SLC_BARREL_RPC3_POSZ_LEN : integer := 12;

  constant SL2MDT_SLC_BARREL_RPC3_POSZ_MULT : real := 0.125;

  constant SL2MDT_SLC_BARREL_RPC2_POSZ_LEN : integer := 12;

  constant SL2MDT_SLC_BARREL_RPC2_POSZ_MULT : real := 0.125;

  constant SL2MDT_SLC_BARREL_RPC1_POSZ_LEN : integer := 12;

  constant SL2MDT_SLC_BARREL_RPC1_POSZ_MULT : real := 0.125;

  constant SL2MDT_SLC_BARREL_RPC0_POSZ_LEN : integer := 12;

  constant SL2MDT_SLC_BARREL_RPC0_POSZ_MULT : real := 0.125;

  constant SL2MDT_SLC_RX_DATA_VALID_LEN : integer := 1;

  constant SL2MDT_SLC_RX_DATA_VALID_MULT : real := 1.0;

  constant SL2MDT_SLC_RX_SPECIFIC_LEN : integer := 85;

  constant SL2MDT_SLC_RX_SPECIFIC_MULT : real := 1.0;

  constant SL2MDT_VEC_MDTID_CHAMBER_ID_LEN : integer := 5;

  constant SL2MDT_VEC_MDTID_CHAMBER_ID_MULT : real := 1.0;

  constant SL2MDT_VEC_MDTID_CHAMBER_IETA_LEN : integer := 4;

  constant SL2MDT_VEC_MDTID_CHAMBER_IETA_MULT : real := 1.0;

  constant SL2MDT_MTC2SL_DATA_VALID_LEN : integer := 1;

  constant SL2MDT_MTC2SL_DATA_VALID_MULT : real := 1.0;

  constant SL2MDT_MTC2SL_MDT_PROCFLAGS_LEN : integer := 4;

  constant SL2MDT_MTC2SL_MDT_PROCFLAGS_MULT : real := 1.0;

  constant SL2MDT_MTC2SL_M_RESERVED_LEN : integer := 49;

  constant SL2MDT_MTC2SL_M_RESERVED_MULT : real := 1.0;

end package sl2mdt_constants_pkg;

------------------------------------------------------------

package body sl2mdt_constants_pkg is

end package body sl2mdt_constants_pkg;
