// This file was auto-generated by YML2HDL toll.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef DAQ_DEVEL_DEFS_SVH
`define DAQ_DEVEL_DEFS_SVH

`include <common_defs.svh>


  parameter int  DAQ_MAX_STREAMS = 1;

  parameter int  DAQ_MAX_BRANCHES = 6;

  parameter int  DAQ_MAX_ROWS = DAQ_MAX_STREAMS + 1;

  parameter int  DAQ_MAX_PIPELINES = 40;

  parameter int  DAQ_MAX_COUNTER_LEN = 64;

  parameter int  DAQ_MAX_DATA_LEN = 160;

  parameter int  DAQ_NODE_DATA_BUS_WIDTH = 42;

  parameter int  DAQ_NODE_COUNTER_WIDTH = 11;

  parameter int  DAQ_LXA_REQ_DATA_BUS_WIDTH = 512;

  parameter int  DAQ_LXA_REQ_COUNTER_WIDTH = 11;



`endif // DAQ_DEVEL_DEFS_SVH
