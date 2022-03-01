// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef MEM_INT_10A148D_CTRL_SVH
`define MEM_INT_10A148D_CTRL_SVH

`include <common_ieee_pkg.svh>


  typedef struct packed {
    logic [32-1:0] wr_data_0;
    logic [32-1:0] wr_data_1;
    logic [32-1:0] wr_data_2;
    logic [32-1:0] wr_data_3;
    logic [20-1:0] wr_data_4;
  } MEM_INT_10A148D_wr_data_CTRL_t;

  typedef struct packed {
    logic [32-1:0] rd_data_0;
    logic [32-1:0] rd_data_1;
    logic [32-1:0] rd_data_2;
    logic [32-1:0] rd_data_3;
    logic [20-1:0] rd_data_4;
  } MEM_INT_10A148D_rd_data_MON_t;

  typedef struct packed {
    logic  rd_rdy;
    MEM_INT_10A148D_rd_data_MON_t   rd_data;
  } MEM_INT_10A148D_MON_t;

  typedef struct packed {
    logic  wr_req;
    logic  wr_ack;
    logic  rd_req;
    logic  rd_ack;
    logic  flush_req;
    logic [10-1:0] wr_addr;
    logic [10-1:0] rd_addr;
    MEM_INT_10A148D_wr_data_CTRL_t   wr_data;
  } MEM_INT_10A148D_CTRL_t;



`endif // MEM_INT_10A148D_CTRL_SVH
