// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl

`ifndef HAL_CTRL_SVH
`define HAL_CTRL_SVH

`include <common_ieee.svh>


  typedef struct packed {
    logic  READY;
    logic [16-1:0] FEC_ERR_CNT;
  } HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_MON_t;

  typedef HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_MON_t  [2-1:0] HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_MON_t_ARRAY;

  typedef struct packed {
    logic  RESET;
  } HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_CTRL_t;

  typedef HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_CTRL_t  [2-1:0] HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_CTRL_t_ARRAY;

  typedef struct packed {
    HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_MON_t_ARRAY   UPLINK;
  } HAL_CSM_CSM_LPGBT_UPLINK_MON_t;

  typedef struct packed {
    HAL_CSM_CSM_LPGBT_UPLINK_UPLINK_CTRL_t_ARRAY   UPLINK;
  } HAL_CSM_CSM_LPGBT_UPLINK_CTRL_t;

  typedef struct packed {
    logic  READY;
  } HAL_CSM_CSM_LPGBT_DOWNLINK_MON_t;

  typedef struct packed {
    logic  RESET;
  } HAL_CSM_CSM_LPGBT_DOWNLINK_CTRL_t;

  typedef struct packed {
    HAL_CSM_CSM_LPGBT_UPLINK_MON_t   UPLINK;
    HAL_CSM_CSM_LPGBT_DOWNLINK_MON_t   DOWNLINK;
  } HAL_CSM_CSM_LPGBT_MON_t;

  typedef struct packed {
    HAL_CSM_CSM_LPGBT_UPLINK_CTRL_t   UPLINK;
    HAL_CSM_CSM_LPGBT_DOWNLINK_CTRL_t   DOWNLINK;
  } HAL_CSM_CSM_LPGBT_CTRL_t;

  typedef struct packed {
    logic [8-1:0] RX_LEN;
    logic [8-1:0] RX_ADDRESS;
    logic [8-1:0] RX_CONTROL;
    logic [8-1:0] RX_TRANSID;
    logic [8-1:0] RX_ERR;
    logic  RX_RECEIVED;
    logic [8-1:0] RX_CHANNEL;
    logic [32-1:0] RX_DATA;
  } HAL_CSM_CSM_SC_MASTER_RX_RX_MON_t;

  typedef HAL_CSM_CSM_SC_MASTER_RX_RX_MON_t  [3-1:0] HAL_CSM_CSM_SC_MASTER_RX_RX_MON_t_ARRAY;

  typedef struct packed {
    HAL_CSM_CSM_SC_MASTER_RX_RX_MON_t_ARRAY   RX;
  } HAL_CSM_CSM_SC_MASTER_RX_MON_t;

  typedef struct packed {
    logic [8-1:0] RX_DATA_FROM_GBTX;
    logic  TX_READY;
    logic  RX_EMPTY;
    HAL_CSM_CSM_SC_MASTER_RX_MON_t   RX;
  } HAL_CSM_CSM_SC_MASTER_MON_t;

  typedef struct packed {
    logic  TX_RESET;
    logic  RX_RESET;
    logic  TX_START_WRITE;
    logic  TX_START_READ;
    logic [8-1:0] TX_GBTX_ADDR;
    logic [16-1:0] TX_REGISTER_ADDR;
    logic [16-1:0] TX_NUM_BYTES_TO_READ;
    logic [8-1:0] TX_DATA_TO_GBTX;
    logic  TX_WR;
    logic  RX_RD;
    logic [8-1:0] TX_CMD;
    logic [8-1:0] TX_ADDRESS;
    logic [8-1:0] TX_TRANSID;
    logic [8-1:0] TX_CHANNEL;
    logic [32-1:0] TX_DATA;
    logic [3-1:0] SCA_ENABLE;
    logic  START_RESET;
    logic  START_CONNECT;
    logic  START_COMMAND;
    logic  INJ_CRC_ERR;
  } HAL_CSM_CSM_SC_MASTER_CTRL_t;

  typedef struct packed {
    logic [8-1:0] RX_DATA_FROM_GBTX;
    logic  TX_READY;
    logic  RX_EMPTY;
  } HAL_CSM_CSM_SC_SLAVE_MON_t;

  typedef struct packed {
    logic  TX_RESET;
    logic  RX_RESET;
    logic  TX_START_WRITE;
    logic  TX_START_READ;
    logic [8-1:0] TX_GBTX_ADDR;
    logic [16-1:0] TX_REGISTER_ADDR;
    logic [16-1:0] TX_NUM_BYTES_TO_READ;
    logic [8-1:0] TX_DATA_TO_GBTX;
    logic  TX_WR;
    logic  RX_RD;
  } HAL_CSM_CSM_SC_SLAVE_CTRL_t;

  typedef struct packed {
    HAL_CSM_CSM_SC_MASTER_MON_t   MASTER;
    HAL_CSM_CSM_SC_SLAVE_MON_t   SLAVE;
  } HAL_CSM_CSM_SC_MON_t;

  typedef struct packed {
    HAL_CSM_CSM_SC_MASTER_CTRL_t   MASTER;
    HAL_CSM_CSM_SC_SLAVE_CTRL_t   SLAVE;
  } HAL_CSM_CSM_SC_CTRL_t;

  typedef struct packed {
    HAL_CSM_CSM_LPGBT_MON_t   LPGBT;
    HAL_CSM_CSM_SC_MON_t   SC;
  } HAL_CSM_CSM_MON_t;

  typedef HAL_CSM_CSM_MON_t  [18-1:0] HAL_CSM_CSM_MON_t_ARRAY;

  typedef struct packed {
    HAL_CSM_CSM_LPGBT_CTRL_t   LPGBT;
    HAL_CSM_CSM_SC_CTRL_t   SC;
  } HAL_CSM_CSM_CTRL_t;

  typedef HAL_CSM_CSM_CTRL_t  [18-1:0] HAL_CSM_CSM_CTRL_t_ARRAY;

  typedef struct packed {
    HAL_CSM_CSM_MON_t_ARRAY   CSM;
  } HAL_CSM_MON_t;

  typedef struct packed {
    HAL_CSM_CSM_CTRL_t_ARRAY   CSM;
  } HAL_CSM_CTRL_t;

  typedef struct packed {
    HAL_CSM_MON_t   CSM;
  } HAL_MON_t;

  typedef struct packed {
    logic  RESET_DOWNLINKS;
    logic  RESET_UPLINKS;
    logic  RESET_COUNTERS;
    HAL_CSM_CTRL_t   CSM;
  } HAL_CTRL_t;



`endif // HAL_CTRL_SVH