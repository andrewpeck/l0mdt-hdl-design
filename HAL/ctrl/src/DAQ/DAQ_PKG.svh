// This file was auto-generated by YML2HDL toll.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef DAQ_CTRL_SVH
`define DAQ_CTRL_SVH

`include <common_ieee.svh>


  typedef struct packed {
    logic  STATUS;
    logic  READY;
  } DAQ_MON_t;

  typedef struct packed {
    logic  RESET;
  } DAQ_CTRL_t;



`endif // DAQ_CTRL_SVH
