// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef TF_CTRL_SVH
`define TF_CTRL_SVH

`include <common_ieee_pkg.svh>


  typedef struct packed {
    logic  STATUS;
    logic  READY;
  } TF_MON_t;

  typedef struct packed {
    logic  RESET;
  } TF_CTRL_t;



`endif // TF_CTRL_SVH
