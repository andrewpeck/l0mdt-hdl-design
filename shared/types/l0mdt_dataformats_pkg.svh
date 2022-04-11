// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl
// 2022-03-16 17:08:04

`ifndef L0MDT_DATAFORMATS_PKG_SVH
`define L0MDT_DATAFORMATS_PKG_SVH


`include <common_ieee_pkg.svh>
`include <l0mdt_constants_pkg.svh>

package l0mdt_dataformats_pkg;

   typedef struct sl_header_rt {
      logic h_reserved[SL_HEADER_H_RESERVED_LEN-1:0];
      logic tcoverflow;
      logic unsigned nmtc_sl[SL_HEADER_NMTC_SL_LEN-1:0];
      logic unsigned nmtc_mdt[SL_HEADER_NMTC_MDT_LEN-1:0];
      logic unsigned nslc[SL_HEADER_NSLC_LEN-1:0];
      logic unsigned bcid[SL_HEADER_BCID_LEN-1:0];
   };

   typedef struct sl_trailer_rt {
      logic t_reserved[SL_TRAILER_T_RESERVED_LEN-1:0];
      logic crc[SL_TRAILER_CRC_LEN-1:0];
      logic unsigned fiberid[SL_TRAILER_FIBERID_LEN-1:0];
      logic unsigned slid[SL_TRAILER_SLID_LEN-1:0];
      logic comma[SL_TRAILER_COMMA_LEN-1:0];
   };

   typedef struct slc_common_rt {
      sl_header_rt header;
      logic unsigned slcid[SLC_COMMON_SLCID_LEN-1:0];
      logic tcsent;
      logic signed poseta[SLC_COMMON_POSETA_LEN-1:0];
      logic unsigned posphi[SLC_COMMON_POSPHI_LEN-1:0];
      logic unsigned sl_pt[SLC_COMMON_SL_PT_LEN-1:0];
      logic unsigned sl_ptthresh[SLC_COMMON_SL_PTTHRESH_LEN-1:0];
      logic sl_charge;
      logic cointype[SLC_COMMON_COINTYPE_LEN-1:0];
      sl_trailer_rt trailer;
   };

   typedef struct slc_endcap_rt {
      logic e_reserved[SLC_ENDCAP_E_RESERVED_LEN-1:0];
      logic nswseg_mon;
      logic signed nswseg_angdtheta[SLC_ENDCAP_NSWSEG_ANGDTHETA_LEN-1:0];
      logic unsigned nswseg_posphi[SLC_ENDCAP_NSWSEG_POSPHI_LEN-1:0];
      logic unsigned nswseg_poseta[SLC_ENDCAP_NSWSEG_POSETA_LEN-1:0];
      logic signed seg_angdphi[SLC_ENDCAP_SEG_ANGDPHI_LEN-1:0];
      logic signed seg_angdtheta[SLC_ENDCAP_SEG_ANGDTHETA_LEN-1:0];
   };

   typedef struct slc_barrel_rt {
      logic signed rpc3_posz[SLC_BARREL_RPC3_POSZ_LEN-1:0];
      logic signed rpc2_posz[SLC_BARREL_RPC2_POSZ_LEN-1:0];
      logic signed rpc1_posz[SLC_BARREL_RPC1_POSZ_LEN-1:0];
      logic signed rpc0_posz[SLC_BARREL_RPC0_POSZ_LEN-1:0];
   };

   typedef struct slc_rx_rt {
      logic data_valid;
      slc_common_rt common;
      logic specific[SLC_RX_SPECIFIC_LEN-1:0];
   };

   typedef struct slc_muid_rt {
      logic unsigned slcid[SLC_COMMON_SLCID_LEN-1:0];
      logic unsigned slid[SL_TRAILER_SLID_LEN-1:0];
      logic unsigned bcid[SL_HEADER_BCID_LEN-1:0];
   };

   typedef struct vec_mdtid_rt {
      logic unsigned chamber_id[VEC_MDTID_CHAMBER_ID_LEN-1:0];
      logic unsigned chamber_ieta[VEC_MDTID_CHAMBER_IETA_LEN-1:0];
   };

   typedef struct tdc_rt {
      logic unsigned chanid[TDC_CHANID_LEN-1:0];
      logic edgemode[TDC_EDGEMODE_LEN-1:0];
      logic unsigned coarsetime[TDC_COARSETIME_LEN-1:0];
      logic unsigned finetime[TDC_FINETIME_LEN-1:0];
      logic unsigned pulsewidth[TDC_PULSEWIDTH_LEN-1:0];
   };

   typedef struct ucm2pl_rt {
      logic data_valid;
      logic busy;
      logic process_ch[UCM2PL_PROCESS_CH_LEN-1:0];
      slc_common_rt common;
      logic signed phimod[UCM2PL_PHIMOD_LEN-1:0];
      logic signed nswseg_angdtheta[SLC_ENDCAP_NSWSEG_ANGDTHETA_LEN-1:0];
      logic unsigned nswseg_posphi[SLC_ENDCAP_NSWSEG_POSPHI_LEN-1:0];
      logic unsigned nswseg_poseta[SLC_ENDCAP_NSWSEG_POSETA_LEN-1:0];
   };

   typedef struct tdcpolmux2tar_rt {
      logic data_valid;
      tdc_rt tdc;
      logic unsigned csmid[TDCPOLMUX2TAR_CSMID_LEN-1:0];
      logic unsigned tdcid[TDCPOLMUX2TAR_TDCID_LEN-1:0];
   };

   typedef struct ucm2hps_rt {
      logic data_valid;
      slc_muid_rt muid;
      logic mdtseg_dest[UCM2HPS_MDTSEG_DEST_LEN-1:0];
      vec_mdtid_rt mdtid;
      logic unsigned vec_pos[UCM2HPS_VEC_POS_LEN-1:0];
      logic unsigned vec_ang[UCM2HPS_VEC_ANG_LEN-1:0];
   };

   typedef struct heg2sfslc_rt {
      logic data_valid;
      slc_muid_rt muid;
      logic mdtseg_dest[HEG2SFSLC_MDTSEG_DEST_LEN-1:0];
      vec_mdtid_rt mdtid;
      logic unsigned vec_pos[UCM2HPS_VEC_POS_LEN-1:0];
      logic unsigned vec_ang[UCM2HPS_VEC_ANG_LEN-1:0];
      logic unsigned hewindow_pos[HEG2SFSLC_HEWINDOW_POS_LEN-1:0];
   };

   typedef struct tar2hps_rt {
      logic data_valid;
      logic unsigned chamber_ieta[VEC_MDTID_CHAMBER_IETA_LEN-1:0];
      logic unsigned layer[TAR2HPS_LAYER_LEN-1:0];
      logic unsigned tube[TAR2HPS_TUBE_LEN-1:0];
      logic unsigned time[TAR2HPS_TIME_LEN-1:0];
   };

   typedef struct heg2sfhit_rt {
      logic data_valid;
      logic mlayer;
      logic unsigned localx[HEG2SFHIT_LOCALX_LEN-1:0];
      logic unsigned localy[HEG2SFHIT_LOCALY_LEN-1:0];
      logic unsigned radius[HEG2SFHIT_RADIUS_LEN-1:0];
   };

   typedef struct pl2ptcalc_rt {
      logic data_valid;
      slc_muid_rt muid;
      logic signed phimod[UCM2PL_PHIMOD_LEN-1:0];
      logic sl_charge;
      logic unsigned nswseg_poseta[SLC_ENDCAP_NSWSEG_POSETA_LEN-1:0];
      logic unsigned nswseg_posphi[SLC_ENDCAP_NSWSEG_POSPHI_LEN-1:0];
      logic signed nswseg_angdtheta[SLC_ENDCAP_NSWSEG_ANGDTHETA_LEN-1:0];
   };

   typedef struct sf2ptcalc_rt {
      logic data_valid;
      slc_muid_rt muid;
      logic unsigned segpos[SF2PTCALC_SEGPOS_LEN-1:0];
      logic unsigned segangle[SF2PTCALC_SEGANGLE_LEN-1:0];
      logic segquality;
      vec_mdtid_rt mdtid;
   };

   typedef struct ptcalc2mtc_rt {
      logic data_valid;
      slc_muid_rt muid;
      logic signed mdt_eta[PTCALC2MTC_MDT_ETA_LEN-1:0];
      logic unsigned mdt_pt[PTCALC2MTC_MDT_PT_LEN-1:0];
      logic unsigned mdt_ptthresh[PTCALC2MTC_MDT_PTTHRESH_LEN-1:0];
      logic mdt_charge;
      logic unsigned mdt_nsegments[PTCALC2MTC_MDT_NSEGMENTS_LEN-1:0];
      logic mdt_quality[PTCALC2MTC_MDT_QUALITY_LEN-1:0];
   };

   typedef struct pl2mtc_rt {
      logic data_valid;
      logic busy;
      logic process_ch[UCM2PL_PROCESS_CH_LEN-1:0];
      slc_common_rt common;
   };

   typedef struct mtc2sl_rt {
      logic data_valid;
      slc_common_rt common;
      logic signed mdt_eta[PTCALC2MTC_MDT_ETA_LEN-1:0];
      logic unsigned mdt_pt[PTCALC2MTC_MDT_PT_LEN-1:0];
      logic unsigned mdt_ptthresh[PTCALC2MTC_MDT_PTTHRESH_LEN-1:0];
      logic mdt_charge;
      logic mdt_procflags[MTC2SL_MDT_PROCFLAGS_LEN-1:0];
      logic unsigned mdt_nsegments[PTCALC2MTC_MDT_NSEGMENTS_LEN-1:0];
      logic mdt_quality[PTCALC2MTC_MDT_QUALITY_LEN-1:0];
      logic m_reserved[MTC2SL_M_RESERVED_LEN-1:0];
   };

endpackage : l0mdt_dataformats_pkg

`endif // L0MDT_DATAFORMATS_PKG_SVH
