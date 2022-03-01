// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef SL2MDT_CONSTANTS_PKG_SVH
`define SL2MDT_CONSTANTS_PKG_SVH

`include <common_ieee_pkg.svh>


  parameter int  SL2MDT_HEADER_H_RESERVED_LEN = 10;

  parameter float  SL2MDT_HEADER_H_RESERVED_MULT = 1.0;

  parameter int  SL2MDT_HEADER_TCOVERFLOW_LEN = 1;

  parameter float  SL2MDT_HEADER_TCOVERFLOW_MULT = 1.0;

  parameter int  SL2MDT_HEADER_NMTC_SL_LEN = 3;

  parameter float  SL2MDT_HEADER_NMTC_SL_MULT = 1.0;

  parameter int  SL2MDT_HEADER_NMTC_MDT_LEN = 3;

  parameter float  SL2MDT_HEADER_NMTC_MDT_MULT = 1.0;

  parameter int  SL2MDT_HEADER_NSLC_SLC_LEN = 3;

  parameter float  SL2MDT_HEADER_NSLC_SLC_MULT = 1.0;

  parameter int  SL2MDT_HEADER_BCID_LEN = 12;

  parameter float  SL2MDT_HEADER_BCID_MULT = 1.0;

  parameter int  SL2MDT_TRAILER_T_RESERVED_LEN = 6;

  parameter float  SL2MDT_TRAILER_T_RESERVED_MULT = 1.0;

  parameter int  SL2MDT_TRAILER_CRC_LEN = 8;

  parameter float  SL2MDT_TRAILER_CRC_MULT = 1.0;

  parameter int  SL2MDT_TRAILER_FIBERID_LEN = 4;

  parameter float  SL2MDT_TRAILER_FIBERID_MULT = 1.0;

  parameter int  SL2MDT_TRAILER_SLID_LEN = 6;

  parameter float  SL2MDT_TRAILER_SLID_MULT = 1.0;

  parameter int  SL2MDT_TRAILER_COMMA_LEN = 8;

  parameter float  SL2MDT_TRAILER_COMMA_MULT = 1.0;

  parameter int  SL2MDT_SLC_COMMON_SLCID_LEN = 3;

  parameter float  SL2MDT_SLC_COMMON_SLCID_MULT = 1.0;

  parameter int  SL2MDT_SLC_COMMON_TCSENT_LEN = 1;

  parameter float  SL2MDT_SLC_COMMON_TCSENT_MULT = 1.0;

  parameter int  SL2MDT_SLC_COMMON_POSETA_LEN = 14;

  parameter float  SL2MDT_SLC_COMMON_POSETA_MULT = 4096.0;

  parameter int  SL2MDT_SLC_COMMON_POSPHI_LEN = 9;

  parameter float  SL2MDT_SLC_COMMON_POSPHI_MULT = 0.0625;

  parameter int  SL2MDT_SLC_COMMON_SL_PT_LEN = 8;

  parameter float  SL2MDT_SLC_COMMON_SL_PT_MULT = 2.0;

  parameter int  SL2MDT_SLC_COMMON_SL_PTTHRESH_LEN = 4;

  parameter float  SL2MDT_SLC_COMMON_SL_PTTHRESH_MULT = 0.25;

  parameter int  SL2MDT_SLC_COMMON_SL_CHARGE_LEN = 1;

  parameter float  SL2MDT_SLC_COMMON_SL_CHARGE_MULT = 1.0;

  parameter int  SL2MDT_SLC_COMMON_COINTYPE_LEN = 3;

  parameter float  SL2MDT_SLC_COMMON_COINTYPE_MULT = 1.0;

  parameter int  SL2MDT_SLC_ENDCAP_E_RESERVED_LEN = 46;

  parameter float  SL2MDT_SLC_ENDCAP_E_RESERVED_MULT = 1.0;

  parameter int  SL2MDT_SLC_ENDCAP_NSWSEG_MON_LEN = 1;

  parameter float  SL2MDT_SLC_ENDCAP_NSWSEG_MON_MULT = 1.0;

  parameter int  SL2MDT_SLC_ENDCAP_NSWSEG_ANGDTHETA_LEN = 5;

  parameter float  SL2MDT_SLC_ENDCAP_NSWSEG_ANGDTHETA_MULT = 1.0;

  parameter int  SL2MDT_SLC_ENDCAP_NSWSEG_POSPHI_LEN = 8;

  parameter float  SL2MDT_SLC_ENDCAP_NSWSEG_POSPHI_MULT = 0.03125;

  parameter int  SL2MDT_SLC_ENDCAP_NSWSEG_POSETA_LEN = 14;

  parameter float  SL2MDT_SLC_ENDCAP_NSWSEG_POSETA_MULT = 4096.0;

  parameter int  SL2MDT_SLC_ENDCAP_SEG_ANGDPHI_LEN = 4;

  parameter float  SL2MDT_SLC_ENDCAP_SEG_ANGDPHI_MULT = 0.25;

  parameter int  SL2MDT_SLC_ENDCAP_SEG_ANGDTHETA_LEN = 7;

  parameter float  SL2MDT_SLC_ENDCAP_SEG_ANGDTHETA_MULT = 0.25;

  parameter int  SL2MDT_SLC_BARREL_B_RESERVED_LEN = 37;

  parameter float  SL2MDT_SLC_BARREL_B_RESERVED_MULT = 1.0;

  parameter int  SL2MDT_SLC_BARREL_RPC3_POSZ_LEN = 12;

  parameter float  SL2MDT_SLC_BARREL_RPC3_POSZ_MULT = 0.125;

  parameter int  SL2MDT_SLC_BARREL_RPC2_POSZ_LEN = 12;

  parameter float  SL2MDT_SLC_BARREL_RPC2_POSZ_MULT = 0.125;

  parameter int  SL2MDT_SLC_BARREL_RPC1_POSZ_LEN = 12;

  parameter float  SL2MDT_SLC_BARREL_RPC1_POSZ_MULT = 0.125;

  parameter int  SL2MDT_SLC_BARREL_RPC0_POSZ_LEN = 12;

  parameter float  SL2MDT_SLC_BARREL_RPC0_POSZ_MULT = 0.125;

  parameter int  SL2MDT_SLC_RX_DATA_VALID_LEN = 1;

  parameter float  SL2MDT_SLC_RX_DATA_VALID_MULT = 1.0;

  parameter int  SL2MDT_SLC_RX_SPECIFIC_LEN = 85;

  parameter float  SL2MDT_SLC_RX_SPECIFIC_MULT = 1.0;

  parameter int  SL2MDT_VEC_MDTID_CHAMBER_ID_LEN = 5;

  parameter float  SL2MDT_VEC_MDTID_CHAMBER_ID_MULT = 1.0;

  parameter int  SL2MDT_VEC_MDTID_CHAMBER_IETA_LEN = 4;

  parameter float  SL2MDT_VEC_MDTID_CHAMBER_IETA_MULT = 1.0;

  parameter int  SL2MDT_MTC2SL_DATA_VALID_LEN = 1;

  parameter float  SL2MDT_MTC2SL_DATA_VALID_MULT = 1.0;

  parameter int  SL2MDT_MTC2SL_MDT_PROCFLAGS_LEN = 4;

  parameter float  SL2MDT_MTC2SL_MDT_PROCFLAGS_MULT = 1.0;

  parameter int  SL2MDT_MTC2SL_M_RESERVED_LEN = 49;

  parameter float  SL2MDT_MTC2SL_M_RESERVED_MULT = 1.0;



`endif // SL2MDT_CONSTANTS_PKG_SVH
