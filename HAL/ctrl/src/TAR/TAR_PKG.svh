// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl
// 2022-03-23 15:04:40

`ifndef TAR_CTRL_SVH
`define TAR_CTRL_SVH


`include <common_ieee_pkg.svh>

package TAR_CTRL;

   typedef struct TAR_ACTIONS_CTRL_t {
      logic RESET;
      logic ENABLE;
      logic DISABLE;
      logic FREEZE;
   };

   typedef struct TAR_CONFIGS_CTRL_t {
      logic INPUT_EN;
      logic OUTPUT_EN;
      logic FLUSH_MEM_RESET;
   };

   typedef struct TAR_STATUS_MON_t {
      logic ENABLED;
      logic READY;
      logic FREEZED;
      logic ERROR[8 - 1:0];
   };

   typedef struct TAR_PL_ST_PL_MEM_SIGNALS_MON_t {
      logic rd_rdy;
      logic freeze_ena;
   };

   typedef struct TAR_PL_ST_PL_MEM_SIGNALS_CTRL_t {
      logic wr_req;
      logic wr_ack;
      logic rd_req;
      logic rd_ack;
      logic flush_req;
      logic freeze_req;
      logic mem_sel[3 - 1:0];
   };

   typedef struct TAR_PL_ST_PL_MEM_wr_data_CTRL_t {
      logic wr_data_0[32 - 1:0];
      logic wr_data_1[10 - 1:0];
   };

   typedef struct TAR_PL_ST_PL_MEM_rd_data_MON_t {
      logic rd_data_0[32 - 1:0];
      logic rd_data_1[10 - 1:0];
   };

   typedef struct TAR_PL_ST_PL_MEM_MON_t {
      TAR_PL_ST_PL_MEM_SIGNALS_MON_t SIGNALS;
      TAR_PL_ST_PL_MEM_rd_data_MON_t rd_data;
   };

   typedef TAR_PL_ST_PL_MEM_MON_t TAR_PL_ST_PL_MEM_MON_t_ARRAY[6 -1:0];

   typedef struct TAR_PL_ST_PL_MEM_CTRL_t {
      TAR_PL_ST_PL_MEM_SIGNALS_CTRL_t SIGNALS;
      logic wr_addr[12 - 1:0];
      logic rd_addr[12 - 1:0];
      TAR_PL_ST_PL_MEM_wr_data_CTRL_t wr_data;
   };

   typedef TAR_PL_ST_PL_MEM_CTRL_t TAR_PL_ST_PL_MEM_CTRL_t_ARRAY[6 -1:0];

   typedef struct TAR_PL_ST_MON_t {
      TAR_PL_ST_PL_MEM_MON_t_ARRAY PL_MEM;
   };

   typedef struct TAR_PL_ST_CTRL_t {
      TAR_PL_ST_PL_MEM_CTRL_t_ARRAY PL_MEM;
   };

   typedef struct TAR_MON_t {
      TAR_STATUS_MON_t STATUS;
      TAR_PL_ST_MON_t PL_ST;
   };

   typedef struct TAR_CTRL_t {
      TAR_ACTIONS_CTRL_t ACTIONS;
      TAR_CONFIGS_CTRL_t CONFIGS;
      TAR_PL_ST_CTRL_t PL_ST;
   };

endpackage : TAR_CTRL

`endif // TAR_CTRL_SVH
