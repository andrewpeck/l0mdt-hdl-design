// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef UCM_CTRL_SVH
`define UCM_CTRL_SVH

`include <common_ieee_pkg.svh>


  typedef struct packed {
    logic  RESET;
    logic  ENABLE;
    logic  DISABLE;
    logic  FREEZE;
  } UCM_SUPER_ACTIONS_CTRL_t;

  typedef struct packed {
    logic [4-1:0] THREADS;
    logic  INPUT_EN;
    logic  OUTPUT_EN;
  } UCM_SUPER_CONFIGS_CTRL_t;

  typedef struct packed {
    logic  ENABLED;
    logic  READY;
    logic [8-1:0] ERROR;
  } UCM_SUPER_STATUS_MON_t;

  typedef struct packed {
    logic [10-1:0] rd_data;
  } UCM_SUPER_SECTOR_PHI_MON_t;

  typedef struct packed {
    logic  wr_req;
    logic  rd_req;
    logic [10-1:0] wr_data;
  } UCM_SUPER_SECTOR_PHI_CTRL_t;

  typedef struct packed {
    logic  rd_rdy;
    logic  freeze_ena;
  } UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_SIGNALS_MON_t;

  typedef struct packed {
    logic  wr_req;
    logic  wr_ack;
    logic  rd_req;
    logic  rd_ack;
    logic  flush_req;
    logic  freeze_req;
    logic [3-1:0] mem_sel;
  } UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_SIGNALS_CTRL_t;

  typedef struct packed {
    logic [16-1:0] wr_data_0;
  } UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_wr_data_CTRL_t;

  typedef struct packed {
    logic [16-1:0] rd_data_0;
  } UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_rd_data_MON_t;

  typedef struct packed {
    UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_SIGNALS_MON_t   SIGNALS;
    UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_rd_data_MON_t   rd_data;
  } UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t;

  typedef UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t  [4-1:0] UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t_ARRAY;

  typedef struct packed {
    UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_SIGNALS_CTRL_t   SIGNALS;
    logic [8-1:0] wr_addr;
    logic [8-1:0] rd_addr;
    UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_wr_data_CTRL_t   wr_data;
  } UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t;

  typedef UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t  [4-1:0] UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t_ARRAY;

  typedef struct packed {
    UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_MON_t_ARRAY   CDE_CHAMB_Z0;
  } UCM_SUPER_CDE_CHAMB_Z0_MON_t;

  typedef struct packed {
    UCM_SUPER_CDE_CHAMB_Z0_CDE_CHAMB_Z0_CTRL_t_ARRAY   CDE_CHAMB_Z0;
  } UCM_SUPER_CDE_CHAMB_Z0_CTRL_t;

  typedef struct packed {
    logic  rd_rdy;
    logic  freeze_ena;
  } UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_SIGNALS_MON_t;

  typedef struct packed {
    logic  wr_req;
    logic  wr_ack;
    logic  rd_req;
    logic  rd_ack;
    logic  flush_req;
    logic  freeze_req;
    logic [3-1:0] mem_sel;
  } UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_SIGNALS_CTRL_t;

  typedef struct packed {
    logic [16-1:0] wr_data_0;
  } UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_wr_data_CTRL_t;

  typedef struct packed {
    logic [16-1:0] rd_data_0;
  } UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_rd_data_MON_t;

  typedef struct packed {
    UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_SIGNALS_MON_t   SIGNALS;
    UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_rd_data_MON_t   rd_data;
  } UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t;

  typedef UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t  [4-1:0] UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t_ARRAY;

  typedef struct packed {
    UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_SIGNALS_CTRL_t   SIGNALS;
    logic [8-1:0] wr_addr;
    logic [8-1:0] rd_addr;
    UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_wr_data_CTRL_t   wr_data;
  } UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t;

  typedef UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t  [4-1:0] UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t_ARRAY;

  typedef struct packed {
    UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_MON_t_ARRAY   CVP_CHAMB_Z0;
  } UCM_SUPER_CVP_CHAMB_Z0_MON_t;

  typedef struct packed {
    UCM_SUPER_CVP_CHAMB_Z0_CVP_CHAMB_Z0_CTRL_t_ARRAY   CVP_CHAMB_Z0;
  } UCM_SUPER_CVP_CHAMB_Z0_CTRL_t;

  typedef struct packed {
    UCM_SUPER_STATUS_MON_t   STATUS;
    UCM_SUPER_SECTOR_PHI_MON_t   SECTOR_PHI;
    UCM_SUPER_CDE_CHAMB_Z0_MON_t   CDE_CHAMB_Z0;
    UCM_SUPER_CVP_CHAMB_Z0_MON_t   CVP_CHAMB_Z0;
  } UCM_SUPER_MON_t;

  typedef struct packed {
    UCM_SUPER_ACTIONS_CTRL_t   ACTIONS;
    UCM_SUPER_CONFIGS_CTRL_t   CONFIGS;
    UCM_SUPER_SECTOR_PHI_CTRL_t   SECTOR_PHI;
    UCM_SUPER_CDE_CHAMB_Z0_CTRL_t   CDE_CHAMB_Z0;
    UCM_SUPER_CVP_CHAMB_Z0_CTRL_t   CVP_CHAMB_Z0;
  } UCM_SUPER_CTRL_t;

  typedef struct packed {
    logic  rd_rdy;
    logic [12-1:0] rd_data;
  } UCM_R_PHI_COMP_RPC_MEM_INTERFACE_MON_t;

  typedef struct packed {
    logic  wr_req;
    logic  rd_req;
    logic [5-1:0] wr_addr;
    logic [5-1:0] rd_addr;
    logic [12-1:0] wr_data;
  } UCM_R_PHI_COMP_RPC_MEM_INTERFACE_CTRL_t;

  typedef struct packed {
    UCM_R_PHI_COMP_RPC_MEM_INTERFACE_MON_t   MEM_INTERFACE;
  } UCM_R_PHI_COMP_RPC_MON_t;

  typedef struct packed {
    logic [4-1:0] sel_thread;
    logic [4-1:0] sel_station;
    logic [4-1:0] sel_layer;
    logic  ext_ctrl;
    UCM_R_PHI_COMP_RPC_MEM_INTERFACE_CTRL_t   MEM_INTERFACE;
  } UCM_R_PHI_COMP_RPC_CTRL_t;

  typedef struct packed {
    logic  rd_rdy;
    logic [14-1:0] rd_data;
  } UCM_R_PHI_COMP_MDT_MEM_INTERFACE_MON_t;

  typedef struct packed {
    logic  wr_req;
    logic  rd_req;
    logic [5-1:0] wr_addr;
    logic [5-1:0] rd_addr;
    logic [14-1:0] wr_data;
  } UCM_R_PHI_COMP_MDT_MEM_INTERFACE_CTRL_t;

  typedef struct packed {
    UCM_R_PHI_COMP_MDT_MEM_INTERFACE_MON_t   MEM_INTERFACE;
  } UCM_R_PHI_COMP_MDT_MON_t;

  typedef struct packed {
    logic [4-1:0] sel_thread;
    logic [4-1:0] sel_station;
    logic [4-1:0] sel_layer;
    logic  ext_ctrl;
    UCM_R_PHI_COMP_MDT_MEM_INTERFACE_CTRL_t   MEM_INTERFACE;
  } UCM_R_PHI_COMP_MDT_CTRL_t;

  typedef struct packed {
    UCM_R_PHI_COMP_RPC_MON_t   RPC;
    UCM_R_PHI_COMP_MDT_MON_t   MDT;
  } UCM_R_PHI_COMP_MON_t;

  typedef struct packed {
    UCM_R_PHI_COMP_RPC_CTRL_t   RPC;
    UCM_R_PHI_COMP_MDT_CTRL_t   MDT;
  } UCM_R_PHI_COMP_CTRL_t;

  typedef struct packed {
    UCM_SUPER_MON_t   SUPER;
    UCM_R_PHI_COMP_MON_t   R_PHI_COMP;
  } UCM_MON_t;

  typedef struct packed {
    UCM_SUPER_CTRL_t   SUPER;
    UCM_R_PHI_COMP_CTRL_t   R_PHI_COMP;
  } UCM_CTRL_t;



`endif // UCM_CTRL_SVH
