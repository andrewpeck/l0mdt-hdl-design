// This file was auto-generated by YML2HDL toll.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef DAQ_DEVEL_DEFS_SVH
`define DAQ_DEVEL_DEFS_SVH

`include <common_defs.svh>


  parameter int  DAQ_MAX_STREAMS = 1;

  parameter int  DAQ_MAX_BRANCHES = 6;

  parameter int  DAQ_MAX_ROWS = DAQ_MAX_STREAMS + 1;

  parameter int  DAQ_MAX_PIPELINES = 40;

  parameter int  DAQ_MAX_COUNTER_WIDTH = 32;

  parameter int  DAQ_MAX_DATA_WIDTH = 160;

  parameter int  DAQ_FELIX_STREAM_WIDTH = 16;

  parameter int  DAQ_NODE_WRITE_DATA_WIDTH = 42;

  parameter int  DAQ_NODE_FIFO_DEPTH = 1024;



`endif // DAQ_DEVEL_DEFS_SVH
