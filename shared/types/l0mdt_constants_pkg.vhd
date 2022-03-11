-- This file was auto-generated by YML2HDL tool.
-- https://gitlab.com/tcpaiva/yml2hdl

library shared_lib;
use shared_lib.common_ieee_pkg.all;

package l0mdt_constants_pkg is

  constant SL_HEADER_H_RESERVED_LEN : integer := 10;

  constant SL_HEADER_H_RESERVED_MULT : real := 1.0;

  constant SL_HEADER_TCOVERFLOW_LEN : integer := 1;

  constant SL_HEADER_TCOVERFLOW_MULT : real := 1.0;

  constant SL_HEADER_NMTC_SL_LEN : integer := 3;

  constant SL_HEADER_NMTC_SL_MULT : real := 1.0;

  constant SL_HEADER_NMTC_MDT_LEN : integer := 3;

  constant SL_HEADER_NMTC_MDT_MULT : real := 1.0;

  constant SL_HEADER_NSLC_LEN : integer := 3;

  constant SL_HEADER_NSLC_MULT : real := 1.0;

  constant SL_HEADER_BCID_LEN : integer := 12;

  constant SL_HEADER_BCID_MULT : real := 1.0;

  constant SL_TRAILER_T_RESERVED_LEN : integer := 6;

  constant SL_TRAILER_T_RESERVED_MULT : real := 1.0;

  constant SL_TRAILER_CRC_LEN : integer := 8;

  constant SL_TRAILER_CRC_MULT : real := 1.0;

  constant SL_TRAILER_FIBERID_LEN : integer := 4;

  constant SL_TRAILER_FIBERID_MULT : real := 1.0;

  constant SL_TRAILER_SLID_LEN : integer := 6;

  constant SL_TRAILER_SLID_MULT : real := 1.0;

  constant SL_TRAILER_COMMA_LEN : integer := 8;

  constant SL_TRAILER_COMMA_MULT : real := 1.0;

  constant SLC_COMMON_SLCID_LEN : integer := 3;

  constant SLC_COMMON_SLCID_MULT : real := 1.0;

  constant SLC_COMMON_TCSENT_LEN : integer := 1;

  constant SLC_COMMON_TCSENT_MULT : real := 1.0;

  constant SLC_COMMON_POSETA_LEN : integer := 14;

  constant SLC_COMMON_POSETA_MULT : real := 4096.0;

  constant SLC_COMMON_POSPHI_LEN : integer := 9;

  constant SLC_COMMON_POSPHI_MULT : real := 64.0;

  constant SLC_COMMON_SL_PT_LEN : integer := 8;

  constant SLC_COMMON_SL_PT_MULT : real := 2.0;

  constant SLC_COMMON_SL_PTTHRESH_LEN : integer := 4;

  constant SLC_COMMON_SL_PTTHRESH_MULT : real := 0.25;

  constant SLC_COMMON_SL_CHARGE_LEN : integer := 1;

  constant SLC_COMMON_SL_CHARGE_MULT : real := 1.0;

  constant SLC_COMMON_COINTYPE_LEN : integer := 3;

  constant SLC_COMMON_COINTYPE_MULT : real := 1.0;

  constant SLC_ENDCAP_E_RESERVED_LEN : integer := 9;

  constant SLC_ENDCAP_E_RESERVED_MULT : real := 1.0;

  constant SLC_ENDCAP_NSWSEG_MON_LEN : integer := 1;

  constant SLC_ENDCAP_NSWSEG_MON_MULT : real := 1.0;

  constant SLC_ENDCAP_NSWSEG_ANGDTHETA_LEN : integer := 5;

  constant SLC_ENDCAP_NSWSEG_ANGDTHETA_MULT : real := 1.0;

  constant SLC_ENDCAP_NSWSEG_POSPHI_LEN : integer := 8;

  constant SLC_ENDCAP_NSWSEG_POSPHI_MULT : real := 0.03125;

  constant SLC_ENDCAP_NSWSEG_POSETA_LEN : integer := 14;

  constant SLC_ENDCAP_NSWSEG_POSETA_MULT : real := 4096.0;

  constant SLC_ENDCAP_SEG_ANGDPHI_LEN : integer := 4;

  constant SLC_ENDCAP_SEG_ANGDPHI_MULT : real := 0.2;

  constant SLC_ENDCAP_SEG_ANGDTHETA_LEN : integer := 7;

  constant SLC_ENDCAP_SEG_ANGDTHETA_MULT : real := 0.25;

  constant SLC_BARREL_RPC3_POSZ_LEN : integer := 12;

  constant SLC_BARREL_RPC3_POSZ_MULT : real := 0.125;

  constant SLC_BARREL_RPC2_POSZ_LEN : integer := 12;

  constant SLC_BARREL_RPC2_POSZ_MULT : real := 0.125;

  constant SLC_BARREL_RPC1_POSZ_LEN : integer := 12;

  constant SLC_BARREL_RPC1_POSZ_MULT : real := 0.125;

  constant SLC_BARREL_RPC0_POSZ_LEN : integer := 12;

  constant SLC_BARREL_RPC0_POSZ_MULT : real := 0.125;

  constant SLC_RX_DATA_VALID_LEN : integer := 1;

  constant SLC_RX_DATA_VALID_MULT : real := 1.0;

  constant SLC_RX_SPECIFIC_LEN : integer := 48;

  constant SLC_RX_SPECIFIC_MULT : real := 1.0;

  constant VEC_MDTID_CHAMBER_ID_LEN : integer := 5;

  constant VEC_MDTID_CHAMBER_ID_MULT : real := 1.0;

  constant VEC_MDTID_CHAMBER_IETA_LEN : integer := 4;

  constant VEC_MDTID_CHAMBER_IETA_MULT : real := 1.0;

  constant TDC_CHANID_LEN : integer := 5;

  constant TDC_CHANID_MULT : real := 1.0;

  constant TDC_EDGEMODE_LEN : integer := 2;

  constant TDC_EDGEMODE_MULT : real := 1.0;

  constant TDC_COARSETIME_LEN : integer := 12;

  constant TDC_COARSETIME_MULT : real := 1.0;

  constant TDC_FINETIME_LEN : integer := 5;

  constant TDC_FINETIME_MULT : real := 32.0;

  constant TDC_PULSEWIDTH_LEN : integer := 8;

  constant TDC_PULSEWIDTH_MULT : real := 32.0;

  constant UCM2PL_DATA_VALID_LEN : integer := 1;

  constant UCM2PL_DATA_VALID_MULT : real := 1.0;

  constant UCM2PL_BUSY_LEN : integer := 1;

  constant UCM2PL_BUSY_MULT : real := 1.0;

  constant UCM2PL_PROCESS_CH_LEN : integer := 4;

  constant UCM2PL_PROCESS_CH_MULT : real := 1.0;

  constant UCM2PL_PHIMOD_LEN : integer := 8;

  constant UCM2PL_PHIMOD_MULT : real := 256.0;

  constant TDCPOLMUX2TAR_DATA_VALID_LEN : integer := 1;

  constant TDCPOLMUX2TAR_DATA_VALID_MULT : real := 1.0;

  constant TDCPOLMUX2TAR_CSMID_LEN : integer := 4;

  constant TDCPOLMUX2TAR_CSMID_MULT : real := 1.0;

  constant TDCPOLMUX2TAR_TDCID_LEN : integer := 5;

  constant TDCPOLMUX2TAR_TDCID_MULT : real := 1.0;

  constant UCM2HPS_DATA_VALID_LEN : integer := 1;

  constant UCM2HPS_DATA_VALID_MULT : real := 1.0;

  constant UCM2HPS_MDTSEG_DEST_LEN : integer := 2;

  constant UCM2HPS_MDTSEG_DEST_MULT : real := 1.0;

  constant UCM2HPS_VEC_POS_LEN : integer := 14;

  constant UCM2HPS_VEC_POS_MULT : real := 1.0;

  constant UCM2HPS_VEC_ANG_LEN : integer := 11;

  constant UCM2HPS_VEC_ANG_MULT : real := 1.0;

  constant HEG2SFSLC_DATA_VALID_LEN : integer := 1;

  constant HEG2SFSLC_DATA_VALID_MULT : real := 1.0;

  constant HEG2SFSLC_MDTSEG_DEST_LEN : integer := 2;

  constant HEG2SFSLC_MDTSEG_DEST_MULT : real := 1.0;

  constant HEG2SFSLC_HEWINDOW_POS_LEN : integer := 19;

  constant HEG2SFSLC_HEWINDOW_POS_MULT : real := 32.0;

  constant TAR2HPS_DATA_VALID_LEN : integer := 1;

  constant TAR2HPS_DATA_VALID_MULT : real := 1.0;

  constant TAR2HPS_LAYER_LEN : integer := 5;

  constant TAR2HPS_LAYER_MULT : real := 1.0;

  constant TAR2HPS_TUBE_LEN : integer := 9;

  constant TAR2HPS_TUBE_MULT : real := 1.0;

  constant TAR2HPS_TIME_LEN : integer := 17;

  constant TAR2HPS_TIME_MULT : real := 32.0;

  constant HEG2SFHIT_DATA_VALID_LEN : integer := 1;

  constant HEG2SFHIT_DATA_VALID_MULT : real := 1.0;

  constant HEG2SFHIT_MLAYER_LEN : integer := 1;

  constant HEG2SFHIT_MLAYER_MULT : real := 1.0;

  constant HEG2SFHIT_LOCALX_LEN : integer := 15;

  constant HEG2SFHIT_LOCALX_MULT : real := 32.0;

  constant HEG2SFHIT_LOCALY_LEN : integer := 15;

  constant HEG2SFHIT_LOCALY_MULT : real := 32.0;

  constant HEG2SFHIT_RADIUS_LEN : integer := 9;

  constant HEG2SFHIT_RADIUS_MULT : real := 32.0;

  constant SF2PTCALC_DATA_VALID_LEN : integer := 1;

  constant SF2PTCALC_DATA_VALID_MULT : real := 1.0;

  constant SF2PTCALC_SEGPOS_LEN : integer := 18;

  constant SF2PTCALC_SEGPOS_MULT : real := 8.0;

  constant SF2PTCALC_SEGANGLE_LEN : integer := 14;

  constant SF2PTCALC_SEGANGLE_MULT : real := 4096.0;

  constant SF2PTCALC_SEGQUALITY_LEN : integer := 1;

  constant SF2PTCALC_SEGQUALITY_MULT : real := 1.0;

  constant PTCALC2MTC_DATA_VALID_LEN : integer := 1;

  constant PTCALC2MTC_DATA_VALID_MULT : real := 1.0;

  constant PTCALC2MTC_MDT_ETA_LEN : integer := 14;

  constant PTCALC2MTC_MDT_ETA_MULT : real := 2048.0;

  constant PTCALC2MTC_MDT_PT_LEN : integer := 8;

  constant PTCALC2MTC_MDT_PT_MULT : real := 2.0;

  constant PTCALC2MTC_MDT_PTTHRESH_LEN : integer := 4;

  constant PTCALC2MTC_MDT_PTTHRESH_MULT : real := 0.25;

  constant PTCALC2MTC_MDT_CHARGE_LEN : integer := 1;

  constant PTCALC2MTC_MDT_CHARGE_MULT : real := 1.0;

  constant PTCALC2MTC_MDT_NSEGMENTS_LEN : integer := 2;

  constant PTCALC2MTC_MDT_NSEGMENTS_MULT : real := 1.0;

  constant PTCALC2MTC_MDT_QUALITY_LEN : integer := 3;

  constant PTCALC2MTC_MDT_QUALITY_MULT : real := 1.0;

  constant PL2MTC_DATA_VALID_LEN : integer := 1;

  constant PL2MTC_DATA_VALID_MULT : real := 1.0;

  constant MTC2SL_DATA_VALID_LEN : integer := 1;

  constant MTC2SL_DATA_VALID_MULT : real := 1.0;

  constant MTC2SL_MDT_PROCFLAGS_LEN : integer := 4;

  constant MTC2SL_MDT_PROCFLAGS_MULT : real := 1.0;

  constant MTC2SL_M_RESERVED_LEN : integer := 49;

  constant MTC2SL_M_RESERVED_MULT : real := 1.0;

end package l0mdt_constants_pkg;

------------------------------------------------------------

package body l0mdt_constants_pkg is

end package body l0mdt_constants_pkg;
