// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl
// 2022-03-23 15:04:38

`ifndef HAL_CORE_CTRL_SVH
`define HAL_CORE_CTRL_SVH


`include <common_ieee_pkg.svh>

package HAL_CORE_CTRL;

   typedef struct HAL_CORE_CLOCKING_MON_t {
      logic MMCM_LOCKED;
   };

   typedef struct HAL_CORE_CLOCKING_CTRL_t {
      logic RESET_MMCM;
   };

   typedef struct HAL_CORE_MGT_MGT_STATUS_MON_t {
      logic rxcdr_stable;
      logic powergood;
      logic txready;
      logic rxready;
      logic rx_pma_reset_done;
      logic tx_pma_reset_done;
      logic tx_reset_done;
      logic rx_reset_done;
      logic buffbypass_tx_done_out;
      logic buffbypass_tx_error_out;
      logic buffbypass_rx_done_out;
      logic buffbypass_rx_error_out;
   };

   typedef struct HAL_CORE_MGT_MGT_DRP_MON_t {
      logic rd_rdy;
      logic rd_data[16 - 1:0];
   };

   typedef struct HAL_CORE_MGT_MGT_DRP_CTRL_t {
      logic wr_en;
      logic wr_addr[10 - 1:0];
      logic en;
      logic wr_data[16 - 1:0];
   };

   typedef struct HAL_CORE_MGT_MGT_TX_RESETS_CTRL_t {
      logic reset;
      logic reset_pll_and_datapath;
      logic reset_datapath;
      logic reset_bufbypass;
   };

   typedef struct HAL_CORE_MGT_MGT_RX_RESETS_CTRL_t {
      logic reset;
      logic reset_pll_and_datapath;
      logic reset_datapath;
      logic reset_bufbypass;
   };

   typedef struct HAL_CORE_MGT_MGT_MON_t {
      HAL_CORE_MGT_MGT_STATUS_MON_t STATUS;
      HAL_CORE_MGT_MGT_DRP_MON_t DRP;
   };

   typedef HAL_CORE_MGT_MGT_MON_t HAL_CORE_MGT_MGT_MON_t_ARRAY[128 -1:0];

   typedef struct HAL_CORE_MGT_MGT_CTRL_t {
      HAL_CORE_MGT_MGT_DRP_CTRL_t DRP;
      HAL_CORE_MGT_MGT_TX_RESETS_CTRL_t TX_RESETS;
      HAL_CORE_MGT_MGT_RX_RESETS_CTRL_t RX_RESETS;
   };

   typedef HAL_CORE_MGT_MGT_CTRL_t HAL_CORE_MGT_MGT_CTRL_t_ARRAY[128 -1:0];

   typedef struct HAL_CORE_MGT_MON_t {
      HAL_CORE_MGT_MGT_MON_t_ARRAY MGT;
   };

   typedef struct HAL_CORE_MGT_CTRL_t {
      HAL_CORE_MGT_MGT_CTRL_t_ARRAY MGT;
   };

   typedef struct HAL_CORE_MON_t {
      HAL_CORE_CLOCKING_MON_t CLOCKING;
      HAL_CORE_MGT_MON_t MGT;
   };

   typedef struct HAL_CORE_CTRL_t {
      HAL_CORE_CLOCKING_CTRL_t CLOCKING;
      HAL_CORE_MGT_CTRL_t MGT;
   };

endpackage : HAL_CORE_CTRL

`endif // HAL_CORE_CTRL_SVH
