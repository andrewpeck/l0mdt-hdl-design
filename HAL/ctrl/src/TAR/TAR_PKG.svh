// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef TAR_CTRL_SVH
`define TAR_CTRL_SVH

`include <common_ieee.svh>


  typedef struct packed {
    logic  RESET;
    logic  ENABLE;
    logic  DISABLE;
    logic  FREEZE;
  } TAR_ACTIONS_CTRL_t;

  typedef struct packed {
    logic  INPUT_EN;
    logic  OUTPUT_EN;
    logic  FLUSH_MEM_RESET;
  } TAR_CONFIGS_CTRL_t;

  typedef struct packed {
    logic  ENABLED;
    logic  READY;
    logic [8-1:0] ERROR;
  } TAR_STATUS_MON_t;

  typedef struct packed {
    logic  rd_rdy;
    logic  freeze_ena;
  } TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_SIGNALS_MON_t;

  typedef struct packed {
    logic  wr_req;
    logic  wr_ack;
    logic  rd_req;
    logic  rd_ack;
    logic  flush_req;
    logic  freeze_req;
    logic [3-1:0] mem_sel;
  } TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_SIGNALS_CTRL_t;

  typedef struct packed {
    logic [32-1:0] wr_data_0;
    logic [10-1:0] wr_data_1;
  } TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_wr_data_CTRL_t;

  typedef struct packed {
    logic [32-1:0] rd_data_0;
    logic [10-1:0] rd_data_1;
  } TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_rd_data_MON_t;

  typedef struct packed {
    TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_SIGNALS_MON_t   SIGNALS;
    TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_rd_data_MON_t   rd_data;
  } TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_MON_t;

  typedef TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_MON_t  [6-1:0] TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_MON_t_ARRAY;

  typedef struct packed {
    TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_SIGNALS_CTRL_t   SIGNALS;
    logic [12-1:0] wr_addr;
    logic [12-1:0] rd_addr;
    TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_wr_data_CTRL_t   wr_data;
  } TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_CTRL_t;

  typedef TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_CTRL_t  [6-1:0] TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_CTRL_t_ARRAY;

  typedef struct packed {
    TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_MON_t_ARRAY   PL_MEM;
  } TAR_PL_ST_PL_ST_PL_CHAMBER_MON_t;

  typedef struct packed {
    TAR_PL_ST_PL_ST_PL_CHAMBER_PL_MEM_CTRL_t_ARRAY   PL_MEM;
  } TAR_PL_ST_PL_ST_PL_CHAMBER_CTRL_t;

  typedef struct packed {
    TAR_PL_ST_PL_ST_PL_CHAMBER_MON_t   PL_CHAMBER;
  } TAR_PL_ST_PL_ST_MON_t;

  typedef TAR_PL_ST_PL_ST_MON_t  [4-1:0] TAR_PL_ST_PL_ST_MON_t_ARRAY;

  typedef struct packed {
    TAR_PL_ST_PL_ST_PL_CHAMBER_CTRL_t   PL_CHAMBER;
  } TAR_PL_ST_PL_ST_CTRL_t;

  typedef TAR_PL_ST_PL_ST_CTRL_t  [4-1:0] TAR_PL_ST_PL_ST_CTRL_t_ARRAY;

  typedef struct packed {
    TAR_PL_ST_PL_ST_MON_t_ARRAY   PL_ST;
  } TAR_PL_ST_MON_t;

  typedef struct packed {
    TAR_PL_ST_PL_ST_CTRL_t_ARRAY   PL_ST;
  } TAR_PL_ST_CTRL_t;

  typedef struct packed {
    TAR_STATUS_MON_t   STATUS;
    TAR_PL_ST_MON_t   PL_ST;
  } TAR_MON_t;

  typedef struct packed {
    TAR_ACTIONS_CTRL_t   ACTIONS;
    TAR_CONFIGS_CTRL_t   CONFIGS;
    TAR_PL_ST_CTRL_t   PL_ST;
  } TAR_CTRL_t;



`endif // TAR_CTRL_SVH
