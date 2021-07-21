// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef MPL_CTRL_SVH
`define MPL_CTRL_SVH

`include <common_ieee.svh>


  typedef struct packed {
    logic  RESET;
    logic  ENABLE;
    logic  DISABLE;
    logic  FREEZE;
  } MPL_ACTIONS_CTRL_t;

  typedef struct packed {
    logic [4-1:0] THREADS;
    logic  INPUT_EN;
    logic  OUTPUT_EN;
    logic  FLUSH_MEM_RESET;
  } MPL_CONFIGS_CTRL_t;

  typedef struct packed {
    logic  ENABLED;
    logic  READY;
    logic  ERROR;
  } MPL_STATUS_MON_t;

  typedef struct packed {
    logic [32-1:0] wr_data_0;
    logic [32-1:0] wr_data_1;
    logic [32-1:0] wr_data_2;
    logic [32-1:0] wr_data_3;
    logic [20-1:0] wr_data_4;
  } MPL_PL_MEM_PL_MEM_wr_data_CTRL_t;

  typedef struct packed {
    logic [32-1:0] rd_data_0;
    logic [32-1:0] rd_data_1;
    logic [32-1:0] rd_data_2;
    logic [32-1:0] rd_data_3;
    logic [20-1:0] rd_data_4;
  } MPL_PL_MEM_PL_MEM_rd_data_MON_t;

  typedef struct packed {
    logic  rd_rdy;
    MPL_PL_MEM_PL_MEM_rd_data_MON_t   rd_data;
  } MPL_PL_MEM_PL_MEM_MON_t;

  typedef MPL_PL_MEM_PL_MEM_MON_t  [5-1:0] MPL_PL_MEM_PL_MEM_MON_t_ARRAY;

  typedef struct packed {
    logic  wr_req;
    logic  wr_ack;
    logic  rd_req;
    logic  rd_ack;
    logic  flush_req;
    logic [12-1:0] wr_addr;
    logic [12-1:0] rd_addr;
    MPL_PL_MEM_PL_MEM_wr_data_CTRL_t   wr_data;
  } MPL_PL_MEM_PL_MEM_CTRL_t;

  typedef MPL_PL_MEM_PL_MEM_CTRL_t  [5-1:0] MPL_PL_MEM_PL_MEM_CTRL_t_ARRAY;

  typedef struct packed {
    MPL_PL_MEM_PL_MEM_MON_t_ARRAY   PL_MEM;
  } MPL_PL_MEM_MON_t;

  typedef struct packed {
    MPL_PL_MEM_PL_MEM_CTRL_t_ARRAY   PL_MEM;
  } MPL_PL_MEM_CTRL_t;

  typedef struct packed {
    MPL_STATUS_MON_t   STATUS;
    MPL_PL_MEM_MON_t   PL_MEM;
  } MPL_MON_t;

  typedef struct packed {
    MPL_ACTIONS_CTRL_t   ACTIONS;
    MPL_CONFIGS_CTRL_t   CONFIGS;
    MPL_PL_MEM_CTRL_t   PL_MEM;
  } MPL_CTRL_t;



`endif // MPL_CTRL_SVH
