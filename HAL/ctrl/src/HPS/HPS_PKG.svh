// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef HPS_CTRL_SVH
`define HPS_CTRL_SVH

`include <common_ieee.svh>


  typedef struct packed {
    logic  RESET;
    logic  ENABLE;
    logic  DISABLE;
    logic  FREEZE;
  } HPS_SUPER_ACTIONS_CTRL_t;

  typedef struct packed {
    logic [4-1:0] THREADS;
    logic  INPUT_EN;
    logic  OUTPUT_EN;
    logic  FLUSH_MEM_RESET;
  } HPS_SUPER_CONFIGS_CTRL_t;

  typedef struct packed {
    logic  ENABLED;
    logic  READY;
    logic [8-1:0] ERROR;
  } HPS_SUPER_STATUS_MON_t;

  typedef struct packed {
    HPS_SUPER_STATUS_MON_t   STATUS;
  } HPS_SUPER_MON_t;

  typedef struct packed {
    HPS_SUPER_ACTIONS_CTRL_t   ACTIONS;
    HPS_SUPER_CONFIGS_CTRL_t   CONFIGS;
  } HPS_SUPER_CTRL_t;

  typedef struct packed {
    logic  rd_rdy;
    logic  freeze_ena;
  } HPS_MDT_TC_MDT_TC_SIGNALS_MON_t;

  typedef struct packed {
    logic  wr_req;
    logic  wr_ack;
    logic  rd_req;
    logic  rd_ack;
    logic  flush_req;
    logic  freeze_req;
    logic [3-1:0] mem_sel;
  } HPS_MDT_TC_MDT_TC_SIGNALS_CTRL_t;

  typedef struct packed {
    logic [32-1:0] wr_data_0;
    logic [6-1:0] wr_data_1;
  } HPS_MDT_TC_MDT_TC_wr_data_CTRL_t;

  typedef struct packed {
    logic [6-1:0] rd_data_1;
    logic [32-1:0] rd_data_0;
  } HPS_MDT_TC_MDT_TC_rd_data_MON_t;

  typedef struct packed {
    HPS_MDT_TC_MDT_TC_SIGNALS_MON_t   SIGNALS;
    HPS_MDT_TC_MDT_TC_rd_data_MON_t   rd_data;
  } HPS_MDT_TC_MDT_TC_MON_t;

  typedef HPS_MDT_TC_MDT_TC_MON_t  [6-1:0] HPS_MDT_TC_MDT_TC_MON_t_ARRAY;

  typedef struct packed {
    HPS_MDT_TC_MDT_TC_SIGNALS_CTRL_t   SIGNALS;
    logic [10-1:0] wr_addr;
    logic [10-1:0] rd_addr;
    HPS_MDT_TC_MDT_TC_wr_data_CTRL_t   wr_data;
  } HPS_MDT_TC_MDT_TC_CTRL_t;

  typedef HPS_MDT_TC_MDT_TC_CTRL_t  [6-1:0] HPS_MDT_TC_MDT_TC_CTRL_t_ARRAY;

  typedef struct packed {
    HPS_MDT_TC_MDT_TC_MON_t_ARRAY   MDT_TC;
  } HPS_MDT_TC_MON_t;

  typedef struct packed {
    HPS_MDT_TC_MDT_TC_CTRL_t_ARRAY   MDT_TC;
  } HPS_MDT_TC_CTRL_t;

  typedef struct packed {
    logic  rd_rdy;
    logic  freeze_ena;
  } HPS_MDT_T0_MDT_T0_SIGNALS_MON_t;

  typedef struct packed {
    logic  wr_req;
    logic  wr_ack;
    logic  rd_req;
    logic  rd_ack;
    logic  flush_req;
    logic  freeze_req;
    logic [3-1:0] mem_sel;
  } HPS_MDT_T0_MDT_T0_SIGNALS_CTRL_t;

  typedef struct packed {
    logic [17-1:0] wr_data_0;
  } HPS_MDT_T0_MDT_T0_wr_data_CTRL_t;

  typedef struct packed {
    logic [17-1:0] rd_data_0;
  } HPS_MDT_T0_MDT_T0_rd_data_MON_t;

  typedef struct packed {
    HPS_MDT_T0_MDT_T0_SIGNALS_MON_t   SIGNALS;
    HPS_MDT_T0_MDT_T0_rd_data_MON_t   rd_data;
  } HPS_MDT_T0_MDT_T0_MON_t;

  typedef HPS_MDT_T0_MDT_T0_MON_t  [6-1:0] HPS_MDT_T0_MDT_T0_MON_t_ARRAY;

  typedef struct packed {
    HPS_MDT_T0_MDT_T0_SIGNALS_CTRL_t   SIGNALS;
    logic [4-1:0] wr_addr;
    logic [4-1:0] rd_addr;
    HPS_MDT_T0_MDT_T0_wr_data_CTRL_t   wr_data;
  } HPS_MDT_T0_MDT_T0_CTRL_t;

  typedef HPS_MDT_T0_MDT_T0_CTRL_t  [6-1:0] HPS_MDT_T0_MDT_T0_CTRL_t_ARRAY;

  typedef struct packed {
    HPS_MDT_T0_MDT_T0_MON_t_ARRAY   MDT_T0;
  } HPS_MDT_T0_MON_t;

  typedef struct packed {
    HPS_MDT_T0_MDT_T0_CTRL_t_ARRAY   MDT_T0;
  } HPS_MDT_T0_CTRL_t;

  typedef struct packed {
    logic  RESET;
    logic  ENABLE;
    logic  DISABLE;
    logic  FREEZE;
  } HPS_HEG_HEG_SUPER_ACTIONS_CTRL_t;

  typedef struct packed {
    logic  INPUT_EN;
    logic  OUTPUT_EN;
    logic  FLUSH_MEM_RESET;
  } HPS_HEG_HEG_SUPER_CONFIGS_CTRL_t;

  typedef struct packed {
    logic  ENABLED;
    logic  READY;
    logic  ERROR;
  } HPS_HEG_HEG_SUPER_STATUS_MON_t;

  typedef struct packed {
    logic [32-1:0] SLC_PROC;
    logic [32-1:0] HIT_PROC;
    logic [32-1:0] HIT_OK;
    logic [32-1:0] ERROR;
  } HPS_HEG_HEG_SUPER_COUNTERS_MON_t;

  typedef struct packed {
    HPS_HEG_HEG_SUPER_STATUS_MON_t   STATUS;
    HPS_HEG_HEG_SUPER_COUNTERS_MON_t   COUNTERS;
  } HPS_HEG_HEG_SUPER_MON_t;

  typedef struct packed {
    HPS_HEG_HEG_SUPER_ACTIONS_CTRL_t   ACTIONS;
    HPS_HEG_HEG_SUPER_CONFIGS_CTRL_t   CONFIGS;
  } HPS_HEG_HEG_SUPER_CTRL_t;

  typedef struct packed {
    logic  rd_rdy;
    logic  freeze_ena;
  } HPS_HEG_HEG_CTRL_ROI_TC_SIGNALS_MON_t;

  typedef struct packed {
    logic  wr_req;
    logic  wr_ack;
    logic  rd_req;
    logic  rd_ack;
    logic  flush_req;
    logic  freeze_req;
    logic [3-1:0] mem_sel;
  } HPS_HEG_HEG_CTRL_ROI_TC_SIGNALS_CTRL_t;

  typedef struct packed {
    logic [32-1:0] wr_data_0;
    logic [6-1:0] wr_data_1;
  } HPS_HEG_HEG_CTRL_ROI_TC_wr_data_CTRL_t;

  typedef struct packed {
    logic [6-1:0] rd_data_1;
    logic [32-1:0] rd_data_0;
  } HPS_HEG_HEG_CTRL_ROI_TC_rd_data_MON_t;

  typedef struct packed {
    HPS_HEG_HEG_CTRL_ROI_TC_SIGNALS_MON_t   SIGNALS;
    HPS_HEG_HEG_CTRL_ROI_TC_rd_data_MON_t   rd_data;
  } HPS_HEG_HEG_CTRL_ROI_TC_MON_t;

  typedef struct packed {
    HPS_HEG_HEG_CTRL_ROI_TC_SIGNALS_CTRL_t   SIGNALS;
    logic [10-1:0] wr_addr;
    logic [10-1:0] rd_addr;
    HPS_HEG_HEG_CTRL_ROI_TC_wr_data_CTRL_t   wr_data;
  } HPS_HEG_HEG_CTRL_ROI_TC_CTRL_t;

  typedef struct packed {
    HPS_HEG_HEG_CTRL_ROI_TC_MON_t   ROI_TC;
  } HPS_HEG_HEG_CTRL_MON_t;

  typedef struct packed {
    HPS_HEG_HEG_CTRL_ROI_TC_CTRL_t   ROI_TC;
  } HPS_HEG_HEG_CTRL_CTRL_t;

  typedef struct packed {
    logic  RESET;
    logic  ENABLE;
    logic  DISABLE;
    logic  FREEZE;
  } HPS_HEG_HEG_HP_HP_ACTIONS_CTRL_t;

  typedef struct packed {
    logic  INPUT_EN;
    logic  OUTPUT_EN;
    logic  FLUSH_MEM_RESET;
  } HPS_HEG_HEG_HP_HP_CONFIGS_CTRL_t;

  typedef struct packed {
    logic  rd_rdy;
    logic  freeze_ena;
  } HPS_HEG_HEG_HP_HP_MDT_DT2R_SIGNALS_MON_t;

  typedef struct packed {
    logic  wr_req;
    logic  wr_ack;
    logic  rd_req;
    logic  rd_ack;
    logic  flush_req;
    logic  freeze_req;
    logic [3-1:0] mem_sel;
  } HPS_HEG_HEG_HP_HP_MDT_DT2R_SIGNALS_CTRL_t;

  typedef struct packed {
    logic [9-1:0] wr_data_0;
  } HPS_HEG_HEG_HP_HP_MDT_DT2R_wr_data_CTRL_t;

  typedef struct packed {
    logic [9-1:0] rd_data_0;
  } HPS_HEG_HEG_HP_HP_MDT_DT2R_rd_data_MON_t;

  typedef struct packed {
    HPS_HEG_HEG_HP_HP_MDT_DT2R_SIGNALS_MON_t   SIGNALS;
    HPS_HEG_HEG_HP_HP_MDT_DT2R_rd_data_MON_t   rd_data;
  } HPS_HEG_HEG_HP_HP_MDT_DT2R_MON_t;

  typedef struct packed {
    HPS_HEG_HEG_HP_HP_MDT_DT2R_SIGNALS_CTRL_t   SIGNALS;
    logic [10-1:0] wr_addr;
    logic [10-1:0] rd_addr;
    HPS_HEG_HEG_HP_HP_MDT_DT2R_wr_data_CTRL_t   wr_data;
  } HPS_HEG_HEG_HP_HP_MDT_DT2R_CTRL_t;

  typedef struct packed {
    HPS_HEG_HEG_HP_HP_MDT_DT2R_MON_t   MDT_DT2R;
  } HPS_HEG_HEG_HP_HP_MON_t;

  typedef HPS_HEG_HEG_HP_HP_MON_t  [6-1:0] HPS_HEG_HEG_HP_HP_MON_t_ARRAY;

  typedef struct packed {
    HPS_HEG_HEG_HP_HP_ACTIONS_CTRL_t   ACTIONS;
    HPS_HEG_HEG_HP_HP_CONFIGS_CTRL_t   CONFIGS;
    HPS_HEG_HEG_HP_HP_MDT_DT2R_CTRL_t   MDT_DT2R;
  } HPS_HEG_HEG_HP_HP_CTRL_t;

  typedef HPS_HEG_HEG_HP_HP_CTRL_t  [6-1:0] HPS_HEG_HEG_HP_HP_CTRL_t_ARRAY;

  typedef struct packed {
    HPS_HEG_HEG_HP_HP_MON_t_ARRAY   HP;
  } HPS_HEG_HEG_HP_MON_t;

  typedef struct packed {
    HPS_HEG_HEG_HP_HP_CTRL_t_ARRAY   HP;
  } HPS_HEG_HEG_HP_CTRL_t;

  typedef struct packed {
    HPS_HEG_HEG_SUPER_MON_t   SUPER;
    HPS_HEG_HEG_CTRL_MON_t   CTRL;
    HPS_HEG_HEG_HP_MON_t   HP;
  } HPS_HEG_HEG_MON_t;

  typedef HPS_HEG_HEG_MON_t  [3-1:0] HPS_HEG_HEG_MON_t_ARRAY;

  typedef struct packed {
    HPS_HEG_HEG_SUPER_CTRL_t   SUPER;
    HPS_HEG_HEG_CTRL_CTRL_t   CTRL;
    HPS_HEG_HEG_HP_CTRL_t   HP;
  } HPS_HEG_HEG_CTRL_t;

  typedef HPS_HEG_HEG_CTRL_t  [3-1:0] HPS_HEG_HEG_CTRL_t_ARRAY;

  typedef struct packed {
    HPS_HEG_HEG_MON_t_ARRAY   HEG;
  } HPS_HEG_MON_t;

  typedef struct packed {
    HPS_HEG_HEG_CTRL_t_ARRAY   HEG;
  } HPS_HEG_CTRL_t;

  typedef struct packed {
    logic  STATUS;
    logic [32-1:0] sb_lsf_mdt_hits_rdata_31_0;
    logic [9-1:0] sb_lsf_mdt_hits_rdata_40_32;
  } HPS_LSF_LSF_MON_t;

  typedef HPS_LSF_LSF_MON_t  [3-1:0] HPS_LSF_LSF_MON_t_ARRAY;

  typedef struct packed {
    logic  RESET;
    logic [10-1:0] HBA_MAX_CLOCKS;
    logic  sb_lsf_mdt_hits_freeze;
    logic [8-1:0] sb_lsf_mdt_hits_raddr;
    logic  sb_lsf_mdt_hits_re;
  } HPS_LSF_LSF_CTRL_t;

  typedef HPS_LSF_LSF_CTRL_t  [3-1:0] HPS_LSF_LSF_CTRL_t_ARRAY;

  typedef struct packed {
    HPS_LSF_LSF_MON_t_ARRAY   LSF;
  } HPS_LSF_MON_t;

  typedef struct packed {
    HPS_LSF_LSF_CTRL_t_ARRAY   LSF;
  } HPS_LSF_CTRL_t;

  typedef struct packed {
    logic  RESET;
    logic  ENABLE;
    logic  DISABLE;
    logic  FREEZE;
  } HPS_CSF_CSF_ACTIONS_CTRL_t;

  typedef struct packed {
    logic  ENABLED;
    logic  READY;
    logic  ERROR;
  } HPS_CSF_CSF_STATUS_MON_t;

  typedef struct packed {
    HPS_CSF_CSF_STATUS_MON_t   STATUS;
  } HPS_CSF_CSF_MON_t;

  typedef HPS_CSF_CSF_MON_t  [3-1:0] HPS_CSF_CSF_MON_t_ARRAY;

  typedef struct packed {
    HPS_CSF_CSF_ACTIONS_CTRL_t   ACTIONS;
  } HPS_CSF_CSF_CTRL_t;

  typedef HPS_CSF_CSF_CTRL_t  [3-1:0] HPS_CSF_CSF_CTRL_t_ARRAY;

  typedef struct packed {
    HPS_CSF_CSF_MON_t_ARRAY   CSF;
  } HPS_CSF_MON_t;

  typedef struct packed {
    HPS_CSF_CSF_CTRL_t_ARRAY   CSF;
  } HPS_CSF_CTRL_t;

  typedef struct packed {
    HPS_SUPER_MON_t   SUPER;
    HPS_MDT_TC_MON_t   MDT_TC;
    HPS_MDT_T0_MON_t   MDT_T0;
    HPS_HEG_MON_t   HEG;
    HPS_LSF_MON_t   LSF;
    HPS_CSF_MON_t   CSF;
  } HPS_MON_t;

  typedef struct packed {
    HPS_SUPER_CTRL_t   SUPER;
    HPS_MDT_TC_CTRL_t   MDT_TC;
    HPS_MDT_T0_CTRL_t   MDT_T0;
    HPS_HEG_CTRL_t   HEG;
    HPS_LSF_CTRL_t   LSF;
    HPS_CSF_CTRL_t   CSF;
  } HPS_CTRL_t;



`endif // HPS_CTRL_SVH