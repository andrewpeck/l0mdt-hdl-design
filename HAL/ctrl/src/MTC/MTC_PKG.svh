// This file was auto-generated by YML2HDL toll.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef MTC_CTRL_SVH
`define MTC_CTRL_SVH

`include <common_ieee.svh>


  typedef struct packed {
    logic  STATUS;
    logic  READY;
  } MTC_MON_t;

  typedef struct packed {
    logic  RESET;
  } MTC_CTRL_t;



`endif // MTC_CTRL_SVH