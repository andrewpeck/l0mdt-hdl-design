// -------------------------------------------------------------------------------------------------
// Auto-generated from:
// https://docs.google.com/spreadsheets/d/1oJh-NPv990n6AzXXZ7cBaySrltqBO-eGucrsnOx_r4s
// -------------------------------------------------------------------------------------------------

`define DF_HASH 4fd39fa5;

// -------------------------------------------------------------------
parameter SLC_MUID_LEN = 20 ;

// SLc Identification (up to 3)
parameter SLC_MUID_SLCID_LEN = 2 ;
parameter SLC_MUID_SLCID_MSB = 19 ;
parameter SLC_MUID_SLCID_LSB = 18 ;
parameter SLC_MUID_SLCID_DECB = 0 ;

// SL board ID (based on the fiber ID)
parameter SLC_MUID_SLID_LEN = 6 ;
parameter SLC_MUID_SLID_MSB = 17 ;
parameter SLC_MUID_SLID_LSB = 12 ;
parameter SLC_MUID_SLID_DECB = 0 ;

// BCID from SLC
parameter SLC_MUID_BCID_LEN = 12 ;
parameter SLC_MUID_BCID_MSB = 11 ;
parameter SLC_MUID_BCID_LSB = 0 ;
parameter SLC_MUID_BCID_DECB = 0 ;

// -------------------------------------------------------------------
parameter SLC_COMMON_LEN = 32 ;

// SLc Identification (up to 3)
parameter SLC_COMMON_SLCID_LEN = 2 ;
parameter SLC_COMMON_SLCID_MSB = 31 ;
parameter SLC_COMMON_SLCID_LSB = 30 ;
parameter SLC_COMMON_SLCID_DECB = 0 ;

// TC sent to MDT TP
parameter SLC_COMMON_TCSENT_LEN = 1 ;
parameter SLC_COMMON_TCSENT_MSB = 29 ;
parameter SLC_COMMON_TCSENT_LSB = 29 ;
parameter SLC_COMMON_TCSENT_DECB = 0 ;

// SLc Eta Position
parameter SLC_COMMON_POSETA_LEN = 15 ;
parameter SLC_COMMON_POSETA_MSB = 28 ;
parameter SLC_COMMON_POSETA_LSB = 14 ;
parameter SLC_COMMON_POSETA_DECB = 12 ;

// SLc Phi Position
parameter SLC_COMMON_POSPHI_LEN = 9 ;
parameter SLC_COMMON_POSPHI_MSB = 13 ;
parameter SLC_COMMON_POSPHI_LSB = 5 ;
parameter SLC_COMMON_POSPHI_DECB = 0 ;

// SLc highest pT threshold passed
parameter SLC_COMMON_PTTHRESH_LEN = 4 ;
parameter SLC_COMMON_PTTHRESH_MSB = 4 ;
parameter SLC_COMMON_PTTHRESH_LSB = 1 ;
parameter SLC_COMMON_PTTHRESH_DECB = 0 ;

// SLc charge
parameter SLC_COMMON_CHARGE_LEN = 1 ;
parameter SLC_COMMON_CHARGE_MSB = 0 ;
parameter SLC_COMMON_CHARGE_LSB = 0 ;
parameter SLC_COMMON_CHARGE_DECB = 0 ;

// -------------------------------------------------------------------
parameter SLC_ENDCAP_LEN = 70 ;

// (COPY)
parameter SLC_ENDCAP_SLC_COMMON_LEN = 32 ;
parameter SLC_ENDCAP_SLC_COMMON_MSB = 69 ;
parameter SLC_ENDCAP_SLC_COMMON_LSB = 38 ;
parameter SLC_ENDCAP_SLC_COMMON_DECB = 0 ;

// SLc Segment Angle wrt Eta position
parameter SLC_ENDCAP_SEG_ANGDTHETA_LEN = 7 ;
parameter SLC_ENDCAP_SEG_ANGDTHETA_MSB = 37 ;
parameter SLC_ENDCAP_SEG_ANGDTHETA_LSB = 31 ;
parameter SLC_ENDCAP_SEG_ANGDTHETA_DECB = 0 ;

// SLc Segment Angle wrt Phi position
parameter SLC_ENDCAP_SEG_ANGDPHI_LEN = 4 ;
parameter SLC_ENDCAP_SEG_ANGDPHI_MSB = 30 ;
parameter SLC_ENDCAP_SEG_ANGDPHI_LSB = 27 ;
parameter SLC_ENDCAP_SEG_ANGDPHI_DECB = 0 ;

// NSW segment eta position
parameter SLC_ENDCAP_NSWSEG_POSETA_LEN = 14 ;
parameter SLC_ENDCAP_NSWSEG_POSETA_MSB = 26 ;
parameter SLC_ENDCAP_NSWSEG_POSETA_LSB = 13 ;
parameter SLC_ENDCAP_NSWSEG_POSETA_DECB = 13 ;

// NSW segment phi position
parameter SLC_ENDCAP_NSWSEG_POSPHI_LEN = 8 ;
parameter SLC_ENDCAP_NSWSEG_POSPHI_MSB = 12 ;
parameter SLC_ENDCAP_NSWSEG_POSPHI_LSB = 5 ;
parameter SLC_ENDCAP_NSWSEG_POSPHI_DECB = 0 ;

// NSW segment angle wrt Eta position
parameter SLC_ENDCAP_NSWSEG_ANGDTHETA_LEN = 5 ;
parameter SLC_ENDCAP_NSWSEG_ANGDTHETA_MSB = 4 ;
parameter SLC_ENDCAP_NSWSEG_ANGDTHETA_LSB = 0 ;
parameter SLC_ENDCAP_NSWSEG_ANGDTHETA_DECB = 0 ;

// -------------------------------------------------------------------
parameter SLC_BARREL_LEN = 75 ;

// (COPY)
parameter SLC_BARREL_SLC_COMMON_LEN = 32 ;
parameter SLC_BARREL_SLC_COMMON_MSB = 74 ;
parameter SLC_BARREL_SLC_COMMON_LSB = 43 ;
parameter SLC_BARREL_SLC_COMMON_DECB = 0 ;

// SLc Hit Z Position in RPC0
parameter SLC_BARREL_RPC0_POSZ_LEN = 10 ;
parameter SLC_BARREL_RPC0_POSZ_MSB = 42 ;
parameter SLC_BARREL_RPC0_POSZ_LSB = 33 ;
parameter SLC_BARREL_RPC0_POSZ_DECB = 0 ;

// SLc Hit Z Position in RPC1
parameter SLC_BARREL_RPC1_POSZ_LEN = 10 ;
parameter SLC_BARREL_RPC1_POSZ_MSB = 32 ;
parameter SLC_BARREL_RPC1_POSZ_LSB = 23 ;
parameter SLC_BARREL_RPC1_POSZ_DECB = 0 ;

// SLc Hit Z Position in RPC2
parameter SLC_BARREL_RPC2_POSZ_LEN = 10 ;
parameter SLC_BARREL_RPC2_POSZ_MSB = 22 ;
parameter SLC_BARREL_RPC2_POSZ_LSB = 13 ;
parameter SLC_BARREL_RPC2_POSZ_DECB = 0 ;

// SLc Hit Z Position in RPC3
parameter SLC_BARREL_RPC3_POSZ_LEN = 10 ;
parameter SLC_BARREL_RPC3_POSZ_MSB = 12 ;
parameter SLC_BARREL_RPC3_POSZ_LSB = 3 ;
parameter SLC_BARREL_RPC3_POSZ_DECB = 0 ;

// SLc coincidence type
parameter SLC_BARREL_COINTYPE_LEN = 3 ;
parameter SLC_BARREL_COINTYPE_MSB = 2 ;
parameter SLC_BARREL_COINTYPE_LSB = 0 ;
parameter SLC_BARREL_COINTYPE_DECB = 0 ;

// -------------------------------------------------------------------
parameter SLCPROC_PIPE_COMMON_LEN = 35 ;

// SLc busy flag
parameter SLCPROC_PIPE_COMMON_BUSY_LEN = 1 ;
parameter SLCPROC_PIPE_COMMON_BUSY_MSB = 34 ;
parameter SLCPROC_PIPE_COMMON_BUSY_LSB = 34 ;
parameter SLCPROC_PIPE_COMMON_BUSY_DECB = 0 ;

// SLc board destination
parameter SLCPROC_PIPE_COMMON_DESTSL_LEN = 2 ;
parameter SLCPROC_PIPE_COMMON_DESTSL_MSB = 33 ;
parameter SLCPROC_PIPE_COMMON_DESTSL_LSB = 32 ;
parameter SLCPROC_PIPE_COMMON_DESTSL_DECB = 0 ;

// SLc phimod
parameter SLCPROC_PIPE_COMMON_PHIMOD_LEN = 8 ;
parameter SLCPROC_PIPE_COMMON_PHIMOD_MSB = 31 ;
parameter SLCPROC_PIPE_COMMON_PHIMOD_LSB = 24 ;
parameter SLCPROC_PIPE_COMMON_PHIMOD_DECB = 0 ;

// SLc Inner Vector MDT chamber ID
parameter SLCPROC_PIPE_COMMON_INN_VEC_MDTID_LEN = 6 ;
parameter SLCPROC_PIPE_COMMON_INN_VEC_MDTID_MSB = 23 ;
parameter SLCPROC_PIPE_COMMON_INN_VEC_MDTID_LSB = 18 ;
parameter SLCPROC_PIPE_COMMON_INN_VEC_MDTID_DECB = 0 ;

// SLc Middle Vector MDT chamber ID
parameter SLCPROC_PIPE_COMMON_MID_VEC_MDTID_LEN = 6 ;
parameter SLCPROC_PIPE_COMMON_MID_VEC_MDTID_MSB = 17 ;
parameter SLCPROC_PIPE_COMMON_MID_VEC_MDTID_LSB = 12 ;
parameter SLCPROC_PIPE_COMMON_MID_VEC_MDTID_DECB = 0 ;

// SLc Outer Vector MDT chamber ID
parameter SLCPROC_PIPE_COMMON_OUT_VEC_MDTID_LEN = 6 ;
parameter SLCPROC_PIPE_COMMON_OUT_VEC_MDTID_MSB = 11 ;
parameter SLCPROC_PIPE_COMMON_OUT_VEC_MDTID_LSB = 6 ;
parameter SLCPROC_PIPE_COMMON_OUT_VEC_MDTID_DECB = 0 ;

// SLc Extra Vector MDT chamber ID
parameter SLCPROC_PIPE_COMMON_EXT_VEC_MDTID_LEN = 6 ;
parameter SLCPROC_PIPE_COMMON_EXT_VEC_MDTID_MSB = 5 ;
parameter SLCPROC_PIPE_COMMON_EXT_VEC_MDTID_LSB = 0 ;
parameter SLCPROC_PIPE_COMMON_EXT_VEC_MDTID_DECB = 0 ;

// -------------------------------------------------------------------
parameter SLCPROC_PIPE_ENDCAP_LEN = 125 ;

// (COPY)
parameter SLCPROC_PIPE_ENDCAP_SLCPROC_PIPE_COMMON_LEN = 35 ;
parameter SLCPROC_PIPE_ENDCAP_SLCPROC_PIPE_COMMON_MSB = 124 ;
parameter SLCPROC_PIPE_ENDCAP_SLCPROC_PIPE_COMMON_LSB = 90 ;
parameter SLCPROC_PIPE_ENDCAP_SLCPROC_PIPE_COMMON_DECB = 0 ;

// (COPY)
parameter SLCPROC_PIPE_ENDCAP_SLC_ENDCAP_LEN = 70 ;
parameter SLCPROC_PIPE_ENDCAP_SLC_ENDCAP_MSB = 89 ;
parameter SLCPROC_PIPE_ENDCAP_SLC_ENDCAP_LSB = 20 ;
parameter SLCPROC_PIPE_ENDCAP_SLC_ENDCAP_DECB = 0 ;

// (COPY)
parameter SLCPROC_PIPE_ENDCAP_SLC_MUID_LEN = 20 ;
parameter SLCPROC_PIPE_ENDCAP_SLC_MUID_MSB = 19 ;
parameter SLCPROC_PIPE_ENDCAP_SLC_MUID_LSB = 0 ;
parameter SLCPROC_PIPE_ENDCAP_SLC_MUID_DECB = 0 ;

// -------------------------------------------------------------------
parameter SLCPROC_PIPE_BARREL_LEN = 130 ;

// (COPY)
parameter SLCPROC_PIPE_BARREL_SLCPROC_PIPE_COMMON_LEN = 35 ;
parameter SLCPROC_PIPE_BARREL_SLCPROC_PIPE_COMMON_MSB = 129 ;
parameter SLCPROC_PIPE_BARREL_SLCPROC_PIPE_COMMON_LSB = 95 ;
parameter SLCPROC_PIPE_BARREL_SLCPROC_PIPE_COMMON_DECB = 0 ;

// (COPY)
parameter SLCPROC_PIPE_BARREL_SLC_BARREL_LEN = 75 ;
parameter SLCPROC_PIPE_BARREL_SLC_BARREL_MSB = 94 ;
parameter SLCPROC_PIPE_BARREL_SLC_BARREL_LSB = 20 ;
parameter SLCPROC_PIPE_BARREL_SLC_BARREL_DECB = 0 ;

// (COPY)
parameter SLCPROC_PIPE_BARREL_SLC_MUID_LEN = 20 ;
parameter SLCPROC_PIPE_BARREL_SLC_MUID_MSB = 19 ;
parameter SLCPROC_PIPE_BARREL_SLC_MUID_LSB = 0 ;
parameter SLCPROC_PIPE_BARREL_SLC_MUID_DECB = 0 ;

// -------------------------------------------------------------------
parameter TDC_LEN = 34 ;

// Channel number within TDC
parameter TDC_CHANID_LEN = 5 ;
parameter TDC_CHANID_MSB = 33 ;
parameter TDC_CHANID_LSB = 29 ;
parameter TDC_CHANID_DECB = 0 ;

// Edge or pair mode
parameter TDC_EDGEMODE_LEN = 2 ;
parameter TDC_EDGEMODE_MSB = 28 ;
parameter TDC_EDGEMODE_LSB = 27 ;
parameter TDC_EDGEMODE_DECB = 0 ;

// TDC BCID
parameter TDC_COARSETIME_LEN = 12 ;
parameter TDC_COARSETIME_MSB = 26 ;
parameter TDC_COARSETIME_LSB = 15 ;
parameter TDC_COARSETIME_DECB = 0 ;

// TDC fine time with BCID
parameter TDC_FINETIME_LEN = 6 ;
parameter TDC_FINETIME_MSB = 14 ;
parameter TDC_FINETIME_LSB = 9 ;
parameter TDC_FINETIME_DECB = 1 ;

// Pulse width
parameter TDC_PULSEWIDTH_LEN = 9 ;
parameter TDC_PULSEWIDTH_MSB = 8 ;
parameter TDC_PULSEWIDTH_LSB = 0 ;
parameter TDC_PULSEWIDTH_DECB = 1 ;

// -------------------------------------------------------------------
parameter TDCPOLMUX_LEN = 44 ;

// (COPY)
parameter TDCPOLMUX_TDC_LEN = 34 ;
parameter TDCPOLMUX_TDC_MSB = 43 ;
parameter TDCPOLMUX_TDC_LSB = 10 ;
parameter TDCPOLMUX_TDC_DECB = 0 ;

// Fiber ID within board
parameter TDCPOLMUX_FIBERID_LEN = 5 ;
parameter TDCPOLMUX_FIBERID_MSB = 9 ;
parameter TDCPOLMUX_FIBERID_LSB = 5 ;
parameter TDCPOLMUX_FIBERID_DECB = 0 ;

// Elink ID within fiber
parameter TDCPOLMUX_ELINKID_LEN = 4 ;
parameter TDCPOLMUX_ELINKID_MSB = 4 ;
parameter TDCPOLMUX_ELINKID_LSB = 1 ;
parameter TDCPOLMUX_ELINKID_DECB = 0 ;

// Valid bit
parameter TDCPOLMUX_DATAVALID_LEN = 1 ;
parameter TDCPOLMUX_DATAVALID_MSB = 0 ;
parameter TDCPOLMUX_DATAVALID_LSB = 0 ;
parameter TDCPOLMUX_DATAVALID_DECB = 0 ;

// -------------------------------------------------------------------
parameter SLCPROC_HPS_SF_LEN = 119; //49 ;

// SLC Valid bit
parameter SLCPROC_HPS_SF_SLC_VALID_LEN = 1 ;
parameter SLCPROC_HPS_SF_SLC_VALID_MSB = 48 ;
parameter SLCPROC_HPS_SF_SLC_VALID_LSB = 48 ;
parameter SLCPROC_HPS_SF_SLC_VALID_DECB = 0 ;

// SLc Muon Unique Identifier
parameter SLCPROC_HPS_SF_SLC_MUID_LEN = 20 ;
parameter SLCPROC_HPS_SF_SLC_MUID_MSB = 47 ;
parameter SLCPROC_HPS_SF_SLC_MUID_LSB = 28 ;
parameter SLCPROC_HPS_SF_SLC_MUID_DECB = 0 ;

// inner MDT segment chip destination
parameter SLCPROC_HPS_SF_MDTSEG_DEST_LEN = 2 ;
parameter SLCPROC_HPS_SF_MDTSEG_DEST_MSB = 27 ;
parameter SLCPROC_HPS_SF_MDTSEG_DEST_LSB = 26 ;
parameter SLCPROC_HPS_SF_MDTSEG_DEST_DECB = 0 ;

// SLc Inner Vector MDT chamber ID
parameter SLCPROC_HPS_SF_VEC_MDTID_LEN = 6 ;
parameter SLCPROC_HPS_SF_VEC_MDTID_MSB = 25 ;
parameter SLCPROC_HPS_SF_VEC_MDTID_LSB = 20 ;
parameter SLCPROC_HPS_SF_VEC_MDTID_DECB = 0 ;

// SLc inner vector rho position
parameter SLCPROC_HPS_SF_VEC_POS_LEN = 19; //10 ;
parameter SLCPROC_HPS_SF_VEC_POS_MSB = 19 ;
parameter SLCPROC_HPS_SF_VEC_POS_LSB = 10 ;
parameter SLCPROC_HPS_SF_VEC_POS_DECB = 0 ;

// SLc inner vector theta angle
parameter SLCPROC_HPS_SF_VEC_ANG_LEN = 10 ;
parameter SLCPROC_HPS_SF_VEC_ANG_MSB = 9 ;
parameter SLCPROC_HPS_SF_VEC_ANG_LSB = 0 ;
parameter SLCPROC_HPS_SF_VEC_ANG_DECB = 0 ;

// -------------------------------------------------------------------
parameter TAR_LEN = 71 ;

// Tube layer within one station
parameter TAR_MDT_TUBE_LAYER_LEN = 5 ;
parameter TAR_MDT_TUBE_LAYER_MSB = 70 ;
parameter TAR_MDT_TUBE_LAYER_LSB = 66 ;
parameter TAR_MDT_TUBE_LAYER_DECB = 0 ;

// Tube number within one station
parameter TAR_MDT_TUBE_NUM_LEN = 9 ;
parameter TAR_MDT_TUBE_NUM_MSB = 65 ;
parameter TAR_MDT_TUBE_NUM_LSB = 57 ;
parameter TAR_MDT_TUBE_NUM_DECB = 0 ;

// Tube radial position
parameter TAR_MDT_TUBE_RHO_LEN = 19 ;
parameter TAR_MDT_TUBE_RHO_MSB = 56 ;
parameter TAR_MDT_TUBE_RHO_LSB = 38 ;
parameter TAR_MDT_TUBE_RHO_DECB = 5 ;

// Tube position along z
parameter TAR_MDT_TUBE_Z_LEN = 20 ;
parameter TAR_MDT_TUBE_Z_MSB = 37 ;
parameter TAR_MDT_TUBE_Z_LSB = 18 ;
parameter TAR_MDT_TUBE_Z_DECB = 5 ;

// Tube (uncalibrated) time
parameter TAR_MDT_TUBE_TIME_LEN = 18 ;
parameter TAR_MDT_TUBE_TIME_MSB = 17 ;
parameter TAR_MDT_TUBE_TIME_LSB = 0 ;
parameter TAR_MDT_TUBE_TIME_DECB = 1 ;

// -------------------------------------------------------------------
parameter HPS_LSF_LEN = 47; //40 ;

// Data Valid bit
parameter HPS_LSF_DATA_VALID_LEN = 1 ;
parameter HPS_LSF_DATA_VALID_MSB = 39 ;
parameter HPS_LSF_DATA_VALID_LSB = 39 ;
parameter HPS_LSF_DATA_VALID_DECB = 0 ;

// Tube local position along precision coord
parameter HPS_LSF_MDT_LOCALX_LEN = 15; //19; //15 ;
parameter HPS_LSF_MDT_LOCALX_MSB = 38 ;
parameter HPS_LSF_MDT_LOCALX_LSB = 24 ;
parameter HPS_LSF_MDT_LOCALX_DECB = 5 ;

// Tube local position along second coord
parameter HPS_LSF_MDT_LOCALY_LEN = 15; //18 ;
parameter HPS_LSF_MDT_LOCALY_MSB = 23 ;
parameter HPS_LSF_MDT_LOCALY_LSB = 9 ;
parameter HPS_LSF_MDT_LOCALY_DECB = 5 ;

// Tube drift radius
parameter HPS_LSF_MDT_RADIUS_LEN = 9 ;
parameter HPS_LSF_MDT_RADIUS_MSB = 8 ;
parameter HPS_LSF_MDT_RADIUS_LSB = 0 ;
parameter HPS_LSF_MDT_RADIUS_DECB = 5 ;

// -------------------------------------------------------------------
parameter HPS_CSF_LEN = 40 ;

// Data Valid bit
parameter HPS_CSF_DATA_VALID_LEN = 1 ;
parameter HPS_CSF_DATA_VALID_MSB = 39 ;
parameter HPS_CSF_DATA_VALID_LSB = 39 ;
parameter HPS_CSF_DATA_VALID_DECB = 0 ;

// Tube local position along precision coord
parameter HPS_CSF_MDT_LOCALX_LEN = 15 ;
parameter HPS_CSF_MDT_LOCALX_MSB = 38 ;
parameter HPS_CSF_MDT_LOCALX_LSB = 24 ;
parameter HPS_CSF_MDT_LOCALX_DECB = 4 ;

// Tube local position along second coord
parameter HPS_CSF_MDT_LOCALY_LEN = 15 ;
parameter HPS_CSF_MDT_LOCALY_MSB = 23 ;
parameter HPS_CSF_MDT_LOCALY_LSB = 9 ;
parameter HPS_CSF_MDT_LOCALY_DECB = 4 ;

// Tube drift radius
parameter HPS_CSF_MDT_RADIUS_LEN = 9 ;
parameter HPS_CSF_MDT_RADIUS_MSB = 8 ;
parameter HPS_CSF_MDT_RADIUS_LSB = 0 ;
parameter HPS_CSF_MDT_RADIUS_DECB = 4 ;

// -------------------------------------------------------------------
parameter SLCPIPE_PTCALC_LEN = 29 ;

// (COPY)
parameter SLCPIPE_PTCALC_SLC_MUID_LEN = 20 ;
parameter SLCPIPE_PTCALC_SLC_MUID_MSB = 28 ;
parameter SLCPIPE_PTCALC_SLC_MUID_LSB = 9 ;
parameter SLCPIPE_PTCALC_SLC_MUID_DECB = 0 ;

// (COPY)
parameter SLCPIPE_PTCALC_PHIMOD_LEN = 8 ;
parameter SLCPIPE_PTCALC_PHIMOD_MSB = 8 ;
parameter SLCPIPE_PTCALC_PHIMOD_LSB = 1 ;
parameter SLCPIPE_PTCALC_PHIMOD_DECB = 0 ;

// (COPY)
parameter SLCPIPE_PTCALC_CHARGE_LEN = 1 ;
parameter SLCPIPE_PTCALC_CHARGE_MSB = 0 ;
parameter SLCPIPE_PTCALC_CHARGE_LSB = 0 ;
parameter SLCPIPE_PTCALC_CHARGE_DECB = 0 ;

// -------------------------------------------------------------------
parameter SF_LEN = 94; //56 ;

// (COPY)
parameter SF_SLC_MUID_LEN = 20 ;
parameter SF_SLC_MUID_MSB = 55 ;
parameter SF_SLC_MUID_LSB = 36 ;
parameter SF_SLC_MUID_DECB = 0 ;

// (COPY)
parameter SF_VEC_MDTID_LEN = 6 ;
parameter SF_VEC_MDTID_MSB = 35 ;
parameter SF_VEC_MDTID_LSB = 30 ;
parameter SF_VEC_MDTID_DECB = 0 ;

// SF MDT segment valid bit
parameter SF_SEGVALID_LEN = 1 ;
parameter SF_SEGVALID_MSB = 29 ;
parameter SF_SEGVALID_LSB = 29 ;
parameter SF_SEGVALID_DECB = 0 ;

// SF MDT segment position along the precision coord
parameter SF_SEGPOS_LEN = 17 ;
parameter SF_SEGPOS_MSB = 28 ;
parameter SF_SEGPOS_LSB = 12 ;
parameter SF_SEGPOS_DECB = 3 ;

// SF MDT segment angle along the precision coord
parameter SF_SEGANGLE_LEN = 15; //11 ;
parameter SF_SEGANGLE_MSB = 11 ;
parameter SF_SEGANGLE_LSB = 1 ;
parameter SF_SEGANGLE_DECB = 0 ;

// SF MDT segment qualiry
parameter SF_SEGQUALITY_LEN = 1 ;
parameter SF_SEGQUALITY_MSB = 0 ;
parameter SF_SEGQUALITY_LSB = 0 ;
parameter SF_SEGQUALITY_DECB = 0 ;

// -------------------------------------------------------------------
parameter PTCALC_LEN = 54 ;

// (COPY)
parameter PTCALC_SLC_MUID_LEN = 20 ;
parameter PTCALC_SLC_MUID_MSB = 53 ;
parameter PTCALC_SLC_MUID_LSB = 34 ;
parameter PTCALC_SLC_MUID_DECB = 0 ;

// eta of the innermost MDT station segment position
parameter PTCALC_ETA_LEN = 15 ;
parameter PTCALC_ETA_MSB = 33 ;
parameter PTCALC_ETA_LSB = 19 ;
parameter PTCALC_ETA_DECB = 12 ;

// pT calculated by the pT Calc
parameter PTCALC_PT_LEN = 9 ;
parameter PTCALC_PT_MSB = 18 ;
parameter PTCALC_PT_LSB = 10 ;
parameter PTCALC_PT_DECB = 2 ;

// pT threshold satisfied by the MDT TC
parameter PTCALC_PTTHRESH_LEN = 4 ;
parameter PTCALC_PTTHRESH_MSB = 9 ;
parameter PTCALC_PTTHRESH_LSB = 6 ;
parameter PTCALC_PTTHRESH_DECB = 0 ;

// charge determined from the pT calc
parameter PTCALC_CHARGE_LEN = 1 ;
parameter PTCALC_CHARGE_MSB = 5 ;
parameter PTCALC_CHARGE_LSB = 5 ;
parameter PTCALC_CHARGE_DECB = 0 ;

// # of segments used for calculating the pT
parameter PTCALC_NSEGMENTS_LEN = 2 ;
parameter PTCALC_NSEGMENTS_MSB = 4 ;
parameter PTCALC_NSEGMENTS_LSB = 3 ;
parameter PTCALC_NSEGMENTS_DECB = 0 ;

// quality of the MDT TC (TBC how this is defined)
parameter PTCALC_QUALITY_LEN = 3 ;
parameter PTCALC_QUALITY_MSB = 2 ;
parameter PTCALC_QUALITY_LSB = 0 ;
parameter PTCALC_QUALITY_DECB = 0 ;

// -------------------------------------------------------------------
parameter SLCPIPE_MTC_ENDCAP_LEN = 55 ;

// (COPY)
parameter SLCPIPE_MTC_ENDCAP_SLC_MUID_LEN = 20 ;
parameter SLCPIPE_MTC_ENDCAP_SLC_MUID_MSB = 54 ;
parameter SLCPIPE_MTC_ENDCAP_SLC_MUID_LSB = 35 ;
parameter SLCPIPE_MTC_ENDCAP_SLC_MUID_DECB = 0 ;

// (COPY)
parameter SLCPIPE_MTC_ENDCAP_SLC_COMMON_LEN = 32 ;
parameter SLCPIPE_MTC_ENDCAP_SLC_COMMON_MSB = 34 ;
parameter SLCPIPE_MTC_ENDCAP_SLC_COMMON_LSB = 3 ;
parameter SLCPIPE_MTC_ENDCAP_SLC_COMMON_DECB = 0 ;

// (COPY)
parameter SLCPIPE_MTC_ENDCAP_BUSY_LEN = 1 ;
parameter SLCPIPE_MTC_ENDCAP_BUSY_MSB = 2 ;
parameter SLCPIPE_MTC_ENDCAP_BUSY_LSB = 2 ;
parameter SLCPIPE_MTC_ENDCAP_BUSY_DECB = 0 ;

// (COPY)
parameter SLCPIPE_MTC_ENDCAP_DESTSL_LEN = 2 ;
parameter SLCPIPE_MTC_ENDCAP_DESTSL_MSB = 1 ;
parameter SLCPIPE_MTC_ENDCAP_DESTSL_LSB = 0 ;
parameter SLCPIPE_MTC_ENDCAP_DESTSL_DECB = 0 ;

// -------------------------------------------------------------------
parameter SLCPIPE_MTC_BARREL_LEN = 58 ;

// (COPY)
parameter SLCPIPE_MTC_BARREL_COINTYPE_LEN = 3 ;
parameter SLCPIPE_MTC_BARREL_COINTYPE_MSB = 57 ;
parameter SLCPIPE_MTC_BARREL_COINTYPE_LSB = 55 ;
parameter SLCPIPE_MTC_BARREL_COINTYPE_DECB = 0 ;

// (COPY)
parameter SLCPIPE_MTC_BARREL_SLC_MUID_LEN = 20 ;
parameter SLCPIPE_MTC_BARREL_SLC_MUID_MSB = 54 ;
parameter SLCPIPE_MTC_BARREL_SLC_MUID_LSB = 35 ;
parameter SLCPIPE_MTC_BARREL_SLC_MUID_DECB = 0 ;

// (COPY)
parameter SLCPIPE_MTC_BARREL_SLC_COMMON_LEN = 32 ;
parameter SLCPIPE_MTC_BARREL_SLC_COMMON_MSB = 34 ;
parameter SLCPIPE_MTC_BARREL_SLC_COMMON_LSB = 3 ;
parameter SLCPIPE_MTC_BARREL_SLC_COMMON_DECB = 0 ;

// (COPY)
parameter SLCPIPE_MTC_BARREL_BUSY_LEN = 1 ;
parameter SLCPIPE_MTC_BARREL_BUSY_MSB = 2 ;
parameter SLCPIPE_MTC_BARREL_BUSY_LSB = 2 ;
parameter SLCPIPE_MTC_BARREL_BUSY_DECB = 0 ;

// (COPY)
parameter SLCPIPE_MTC_BARREL_DESTSL_LEN = 2 ;
parameter SLCPIPE_MTC_BARREL_DESTSL_MSB = 1 ;
parameter SLCPIPE_MTC_BARREL_DESTSL_LSB = 0 ;
parameter SLCPIPE_MTC_BARREL_DESTSL_DECB = 0 ;

// -------------------------------------------------------------------
parameter MTC_LEN = 70 ;

// (COPY)
parameter MTC_SLC_COMMON_LEN = 32 ;
parameter MTC_SLC_COMMON_MSB = 69 ;
parameter MTC_SLC_COMMON_LSB = 38 ;
parameter MTC_SLC_COMMON_DECB = 0 ;

// (COPY)
parameter MTC_ETA_LEN = 15 ;
parameter MTC_ETA_MSB = 37 ;
parameter MTC_ETA_LSB = 23 ;
parameter MTC_ETA_DECB = 12 ;

// (COPY)
parameter MTC_PT_LEN = 9 ;
parameter MTC_PT_MSB = 22 ;
parameter MTC_PT_LSB = 14 ;
parameter MTC_PT_DECB = 2 ;

// (COPY)
parameter MTC_PTTHRESH_LEN = 4 ;
parameter MTC_PTTHRESH_MSB = 13 ;
parameter MTC_PTTHRESH_LSB = 10 ;
parameter MTC_PTTHRESH_DECB = 0 ;

// (COPY)
parameter MTC_CHARGE_LEN = 1 ;
parameter MTC_CHARGE_MSB = 9 ;
parameter MTC_CHARGE_LSB = 9 ;
parameter MTC_CHARGE_DECB = 0 ;

// MDT processing flags
parameter MTC_PROCFLAGS_LEN = 4 ;
parameter MTC_PROCFLAGS_MSB = 8 ;
parameter MTC_PROCFLAGS_LSB = 5 ;
parameter MTC_PROCFLAGS_DECB = 0 ;

// (COPY)
parameter MTC_NSEGMENTS_LEN = 2 ;
parameter MTC_NSEGMENTS_MSB = 4 ;
parameter MTC_NSEGMENTS_LSB = 3 ;
parameter MTC_NSEGMENTS_DECB = 0 ;

// (COPY)
parameter MTC_QUALITY_LEN = 3 ;
parameter MTC_QUALITY_MSB = 2 ;
parameter MTC_QUALITY_LSB = 0 ;
parameter MTC_QUALITY_DECB = 0 ;
