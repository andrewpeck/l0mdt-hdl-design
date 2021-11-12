// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef MEM_INT_12A42D_CTRL_SVH
`define MEM_INT_12A42D_CTRL_SVH

`include <common_ieee.svh>


  typedef struct packed {
    logic  rd_rdy;
    logic  freeze_ena;
  } MEM_INT_12A42D_SIGNALS_MON_t;

  typedef struct packed {
    logic  wr_req;
    logic  wr_ack;
    logic  rd_req;
    logic  rd_ack;
    logic  flush_req;
    logic  freeze_req;
    logic [3-1:0] mem_sel;
  } MEM_INT_12A42D_SIGNALS_CTRL_t;

  typedef struct packed {
    logic [32-1:0] wr_data_0;
    logic [10-1:0] wr_data_1;
  } MEM_INT_12A42D_wr_data_CTRL_t;

  typedef struct packed {
    logic [32-1:0] rd_data_0;
    logic [10-1:0] rd_data_1;
  } MEM_INT_12A42D_rd_data_MON_t;

  typedef struct packed {
    MEM_INT_12A42D_SIGNALS_MON_t   SIGNALS;
    MEM_INT_12A42D_rd_data_MON_t   rd_data;
  } MEM_INT_12A42D_MON_t;

  typedef struct packed {
    MEM_INT_12A42D_SIGNALS_CTRL_t   SIGNALS;
    logic [12-1:0] wr_addr;
    logic [12-1:0] rd_addr;
    MEM_INT_12A42D_wr_data_CTRL_t   wr_data;
  } MEM_INT_12A42D_CTRL_t;



`endif // MEM_INT_12A42D_CTRL_SVH
