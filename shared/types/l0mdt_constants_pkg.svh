// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl
// 2022-03-14 23:33:47

`ifndef L0MDT_CONSTANTS_PKG_SVH
`define L0MDT_CONSTANTS_PKG_SVH

`include <common_ieee_pkg.svh>

package l0mdt_constants_pkg;

   parameter int SL_HEADER_H_RESERVED_LEN = 10;

   parameter float SL_HEADER_H_RESERVED_MULT = 1.0;

   parameter int SL_HEADER_TCOVERFLOW_LEN = 1;

   parameter float SL_HEADER_TCOVERFLOW_MULT = 1.0;

   parameter int SL_HEADER_NMTC_SL_LEN = 3;

   parameter float SL_HEADER_NMTC_SL_MULT = 1.0;

   parameter int SL_HEADER_NMTC_MDT_LEN = 3;

   parameter float SL_HEADER_NMTC_MDT_MULT = 1.0;

   parameter int SL_HEADER_NSLC_LEN = 3;

   parameter float SL_HEADER_NSLC_MULT = 1.0;

   parameter int SL_HEADER_BCID_LEN = 12;

   parameter float SL_HEADER_BCID_MULT = 1.0;

   parameter int SL_TRAILER_T_RESERVED_LEN = 6;

   parameter float SL_TRAILER_T_RESERVED_MULT = 1.0;

   parameter int SL_TRAILER_CRC_LEN = 8;

   parameter float SL_TRAILER_CRC_MULT = 1.0;

   parameter int SL_TRAILER_FIBERID_LEN = 4;

   parameter float SL_TRAILER_FIBERID_MULT = 1.0;

   parameter int SL_TRAILER_SLID_LEN = 6;

   parameter float SL_TRAILER_SLID_MULT = 1.0;

   parameter int SL_TRAILER_COMMA_LEN = 8;

   parameter float SL_TRAILER_COMMA_MULT = 1.0;

   parameter int SLC_COMMON_SLCID_LEN = 3;

   parameter float SLC_COMMON_SLCID_MULT = 1.0;

   parameter int SLC_COMMON_TCSENT_LEN = 1;

   parameter float SLC_COMMON_TCSENT_MULT = 1.0;

   parameter int SLC_COMMON_POSETA_LEN = 14;

   parameter float SLC_COMMON_POSETA_MULT = 4096.0;

   parameter int SLC_COMMON_POSPHI_LEN = 9;

   parameter float SLC_COMMON_POSPHI_MULT = 64.0;

   parameter int SLC_COMMON_SL_PT_LEN = 8;

   parameter float SLC_COMMON_SL_PT_MULT = 2.0;

   parameter int SLC_COMMON_SL_PTTHRESH_LEN = 4;

   parameter float SLC_COMMON_SL_PTTHRESH_MULT = 0.25;

   parameter int SLC_COMMON_SL_CHARGE_LEN = 1;

   parameter float SLC_COMMON_SL_CHARGE_MULT = 1.0;

   parameter int SLC_COMMON_COINTYPE_LEN = 3;

   parameter float SLC_COMMON_COINTYPE_MULT = 1.0;

   parameter int SLC_ENDCAP_E_RESERVED_LEN = 9;

   parameter float SLC_ENDCAP_E_RESERVED_MULT = 1.0;

   parameter int SLC_ENDCAP_NSWSEG_MON_LEN = 1;

   parameter float SLC_ENDCAP_NSWSEG_MON_MULT = 1.0;

   parameter int SLC_ENDCAP_NSWSEG_ANGDTHETA_LEN = 5;

   parameter float SLC_ENDCAP_NSWSEG_ANGDTHETA_MULT = 1.0;

   parameter int SLC_ENDCAP_NSWSEG_POSPHI_LEN = 8;

   parameter float SLC_ENDCAP_NSWSEG_POSPHI_MULT = 0.03125;

   parameter int SLC_ENDCAP_NSWSEG_POSETA_LEN = 14;

   parameter float SLC_ENDCAP_NSWSEG_POSETA_MULT = 4096.0;

   parameter int SLC_ENDCAP_SEG_ANGDPHI_LEN = 4;

   parameter float SLC_ENDCAP_SEG_ANGDPHI_MULT = 0.2;

   parameter int SLC_ENDCAP_SEG_ANGDTHETA_LEN = 7;

   parameter float SLC_ENDCAP_SEG_ANGDTHETA_MULT = 0.25;

   parameter int SLC_BARREL_RPC3_POSZ_LEN = 12;

   parameter float SLC_BARREL_RPC3_POSZ_MULT = 0.125;

   parameter int SLC_BARREL_RPC2_POSZ_LEN = 12;

   parameter float SLC_BARREL_RPC2_POSZ_MULT = 0.125;

   parameter int SLC_BARREL_RPC1_POSZ_LEN = 12;

   parameter float SLC_BARREL_RPC1_POSZ_MULT = 0.125;

   parameter int SLC_BARREL_RPC0_POSZ_LEN = 12;

   parameter float SLC_BARREL_RPC0_POSZ_MULT = 0.125;

   parameter int SLC_RX_DATA_VALID_LEN = 1;

   parameter float SLC_RX_DATA_VALID_MULT = 1.0;

   parameter int SLC_RX_SPECIFIC_LEN = 48;

   parameter float SLC_RX_SPECIFIC_MULT = 1.0;

   parameter int VEC_MDTID_CHAMBER_ID_LEN = 5;

   parameter float VEC_MDTID_CHAMBER_ID_MULT = 1.0;

   parameter int VEC_MDTID_CHAMBER_IETA_LEN = 4;

   parameter float VEC_MDTID_CHAMBER_IETA_MULT = 1.0;

   parameter int TDC_CHANID_LEN = 5;

   parameter float TDC_CHANID_MULT = 1.0;

   parameter int TDC_EDGEMODE_LEN = 2;

   parameter float TDC_EDGEMODE_MULT = 1.0;

   parameter int TDC_COARSETIME_LEN = 12;

   parameter float TDC_COARSETIME_MULT = 1.0;

   parameter int TDC_FINETIME_LEN = 5;

   parameter float TDC_FINETIME_MULT = 32.0;

   parameter int TDC_PULSEWIDTH_LEN = 8;

   parameter float TDC_PULSEWIDTH_MULT = 32.0;

   parameter int UCM2PL_DATA_VALID_LEN = 1;

   parameter float UCM2PL_DATA_VALID_MULT = 1.0;

   parameter int UCM2PL_BUSY_LEN = 1;

   parameter float UCM2PL_BUSY_MULT = 1.0;

   parameter int UCM2PL_PROCESS_CH_LEN = 4;

   parameter float UCM2PL_PROCESS_CH_MULT = 1.0;

   parameter int UCM2PL_PHIMOD_LEN = 8;

   parameter float UCM2PL_PHIMOD_MULT = 256.0;

   parameter int TDCPOLMUX2TAR_DATA_VALID_LEN = 1;

   parameter float TDCPOLMUX2TAR_DATA_VALID_MULT = 1.0;

   parameter int TDCPOLMUX2TAR_CSMID_LEN = 4;

   parameter float TDCPOLMUX2TAR_CSMID_MULT = 1.0;

   parameter int TDCPOLMUX2TAR_TDCID_LEN = 5;

   parameter float TDCPOLMUX2TAR_TDCID_MULT = 1.0;

   parameter int UCM2HPS_DATA_VALID_LEN = 1;

   parameter float UCM2HPS_DATA_VALID_MULT = 1.0;

   parameter int UCM2HPS_MDTSEG_DEST_LEN = 2;

   parameter float UCM2HPS_MDTSEG_DEST_MULT = 1.0;

   parameter int UCM2HPS_VEC_POS_LEN = 14;

   parameter float UCM2HPS_VEC_POS_MULT = 1.0;

   parameter int UCM2HPS_VEC_ANG_LEN = 11;

   parameter float UCM2HPS_VEC_ANG_MULT = 1.0;

   parameter int HEG2SFSLC_DATA_VALID_LEN = 1;

   parameter float HEG2SFSLC_DATA_VALID_MULT = 1.0;

   parameter int HEG2SFSLC_MDTSEG_DEST_LEN = 2;

   parameter float HEG2SFSLC_MDTSEG_DEST_MULT = 1.0;

   parameter int HEG2SFSLC_HEWINDOW_POS_LEN = 19;

   parameter float HEG2SFSLC_HEWINDOW_POS_MULT = 32.0;

   parameter int TAR2HPS_DATA_VALID_LEN = 1;

   parameter float TAR2HPS_DATA_VALID_MULT = 1.0;

   parameter int TAR2HPS_LAYER_LEN = 5;

   parameter float TAR2HPS_LAYER_MULT = 1.0;

   parameter int TAR2HPS_TUBE_LEN = 9;

   parameter float TAR2HPS_TUBE_MULT = 1.0;

   parameter int TAR2HPS_TIME_LEN = 17;

   parameter float TAR2HPS_TIME_MULT = 32.0;

   parameter int HEG2SFHIT_DATA_VALID_LEN = 1;

   parameter float HEG2SFHIT_DATA_VALID_MULT = 1.0;

   parameter int HEG2SFHIT_MLAYER_LEN = 1;

   parameter float HEG2SFHIT_MLAYER_MULT = 1.0;

   parameter int HEG2SFHIT_LOCALX_LEN = 15;

   parameter float HEG2SFHIT_LOCALX_MULT = 32.0;

   parameter int HEG2SFHIT_LOCALY_LEN = 15;

   parameter float HEG2SFHIT_LOCALY_MULT = 32.0;

   parameter int HEG2SFHIT_RADIUS_LEN = 9;

   parameter float HEG2SFHIT_RADIUS_MULT = 32.0;

   parameter int SF2PTCALC_DATA_VALID_LEN = 1;

   parameter float SF2PTCALC_DATA_VALID_MULT = 1.0;

   parameter int SF2PTCALC_SEGPOS_LEN = 18;

   parameter float SF2PTCALC_SEGPOS_MULT = 8.0;

   parameter int SF2PTCALC_SEGANGLE_LEN = 14;

   parameter float SF2PTCALC_SEGANGLE_MULT = 4096.0;

   parameter int SF2PTCALC_SEGQUALITY_LEN = 1;

   parameter float SF2PTCALC_SEGQUALITY_MULT = 1.0;

   parameter int PTCALC2MTC_DATA_VALID_LEN = 1;

   parameter float PTCALC2MTC_DATA_VALID_MULT = 1.0;

   parameter int PTCALC2MTC_MDT_ETA_LEN = 14;

   parameter float PTCALC2MTC_MDT_ETA_MULT = 2048.0;

   parameter int PTCALC2MTC_MDT_PT_LEN = 8;

   parameter float PTCALC2MTC_MDT_PT_MULT = 2.0;

   parameter int PTCALC2MTC_MDT_PTTHRESH_LEN = 4;

   parameter float PTCALC2MTC_MDT_PTTHRESH_MULT = 0.25;

   parameter int PTCALC2MTC_MDT_CHARGE_LEN = 1;

   parameter float PTCALC2MTC_MDT_CHARGE_MULT = 1.0;

   parameter int PTCALC2MTC_MDT_NSEGMENTS_LEN = 2;

   parameter float PTCALC2MTC_MDT_NSEGMENTS_MULT = 1.0;

   parameter int PTCALC2MTC_MDT_QUALITY_LEN = 3;

   parameter float PTCALC2MTC_MDT_QUALITY_MULT = 1.0;

   parameter int PL2MTC_DATA_VALID_LEN = 1;

   parameter float PL2MTC_DATA_VALID_MULT = 1.0;

   parameter int MTC2SL_DATA_VALID_LEN = 1;

   parameter float MTC2SL_DATA_VALID_MULT = 1.0;

   parameter int MTC2SL_MDT_PROCFLAGS_LEN = 4;

   parameter float MTC2SL_MDT_PROCFLAGS_MULT = 1.0;

   parameter int MTC2SL_M_RESERVED_LEN = 49;

   parameter float MTC2SL_M_RESERVED_MULT = 1.0;

endpackage : l0mdt_constants_pkg

`endif // L0MDT_CONSTANTS_PKG_SVH
