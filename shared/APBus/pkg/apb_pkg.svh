// This file was auto-generated by YML2HDL toll.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef APB_PKG_SVH
`define APB_PKG_SVH

`include <common_ieee.svh>


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

  typedef MEM_INT_10A148D_MON_t  [5-1:0] MEM_INT_10A148D_MON_t_ARRAY;

  typedef struct packed {
    logic  wr_req;
    logic  rd_ack;
    logic [10-1:0] wr_addr;
    logic [10-1:0] rd_addr;
    MEM_INT_10A148D_wr_data_CTRL_t   wr_data;
  } MEM_INT_10A148D_CTRL_t;

  typedef MEM_INT_10A148D_CTRL_t  [5-1:0] MEM_INT_10A148D_CTRL_t_ARRAY;



`endif // APB_PKG_SVH