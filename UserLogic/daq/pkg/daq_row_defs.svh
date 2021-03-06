// This file was auto-generated by YML2HDL toll.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef DAQ_ROW_DEFS_SVH
`define DAQ_ROW_DEFS_SVH

`include <ttc_defs.svh>

`include <common_defs.svh>

`include <daq_devel_defs.svh>
`include <daq_defs.svh>


  typedef struct packed {
    logic  done;
    logic  nempty;
    logic  err;
  } node_to_mngt_rt;

  typedef struct packed {
    logic  en;
    logic  rd_en;
  } mngt_to_node_rt;

  typedef struct packed {
    forward_rt   counter;
    forward_rt   payload;
  } node_to_bconv_rt;

  typedef struct packed {
    backward_rt   counter;
    backward_rt   payload;
  } bconv_to_node_rt;

  typedef struct packed {
    forward_rt   counter;
    forward_rt   payload;
  } bconv_to_pbldr_rt;

  typedef struct packed {
    backward_rt   counter;
    backward_rt   payload;
  } pbldr_to_bconv_rt;

  typedef struct packed {
    node_to_mngt_rt   mngt;
    node_to_bconv_rt   bconv;
  } node_ort;

  typedef logic [$bits(node_ort)-1:0] node_ovt;

  typedef struct packed {
    int  INPUT_DATA_WIDTH;
    int  COUNTER_WIDTH;
  } dnode_grt;

  typedef struct packed {
    daq_sys_rt   sys;
    mngt_to_node_rt   mngt;
    req_to_row_common_rt   req;
    daq_stream_rt   stream;
    bconv_to_node_rt   bconv;
  } dnode_irt;

  typedef struct packed {
    dnode_irt   i;
    node_ort   o;
  } dnode_ert;

  typedef logic [$bits(dnode_irt)-1:0] dnode_ivt;

  typedef struct packed {
    int  COUNTER_WIDTH;
  } hnode_grt;

  typedef struct packed {
    daq_sys_rt   sys;
    mngt_to_node_rt   mngt;
    req_to_row_rt   req;
    bconv_to_node_rt   bconv;
  } hnode_irt;

  typedef struct packed {
    hnode_irt   i;
    node_ort   o;
  } hnode_ert;

  typedef logic [$bits(hnode_irt)-1:0] hnode_ivt;

  typedef struct packed {
    int  INPUT_DATA_WIDTH;
  } bconv_grt;

  typedef struct packed {
    daq_sys_rt   sys;
    forward_rt   src;
    pbldr_backward_rt   dst;
  } bconv_irt;

  typedef struct packed {
    backward_rt   src;
    pbldr_forward_rt   dst;
  } bconv_ort;

  typedef struct packed {
    bconv_irt   i;
    bconv_ort   o;
  } bconv_ert;

  typedef logic [$bits(bconv_irt)-1:0] bconv_ivt;

  typedef logic [$bits(bconv_ort)-1:0] bconv_ovt;

  typedef struct packed {
    pbldr_forward_rt   cnt;
    pbldr_forward_rt   pld;
    pbldr_backward_rt   dst;
  } hub_irt;

  typedef struct packed {
    pbldr_backward_rt   cnt;
    pbldr_backward_rt   pld;
    pbldr_forward_rt   dst;
  } hub_ort;

  typedef struct packed {
    hub_irt   i;
    hub_ort   o;
  } hub_ert;

  typedef logic [$bits(hub_irt)-1:0] hub_ivt;

  typedef logic [$bits(hub_ort)-1:0] hub_ovt;



`endif // DAQ_ROW_DEFS_SVH
