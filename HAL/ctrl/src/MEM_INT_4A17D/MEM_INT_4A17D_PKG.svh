// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl
// 2022-03-15 23:42:25

`ifndef MEM_INT_4A17D_CTRL_SVH
`define MEM_INT_4A17D_CTRL_SVH


`include <common_ieee_pkg.svh>

package MEM_INT_4A17D_CTRL;

   typedef struct MEM_INT_4A17D_SIGNALS_MON_t {
      logic rd_rdy;
      logic freeze_ena;
   };

   typedef struct MEM_INT_4A17D_SIGNALS_CTRL_t {
      logic wr_req;
      logic wr_ack;
      logic rd_req;
      logic rd_ack;
      logic flush_req;
      logic freeze_req;
      logic mem_sel[3:0];
   };

   typedef struct MEM_INT_4A17D_wr_data_CTRL_t {
      logic wr_data_0[17:0];
   };

   typedef struct MEM_INT_4A17D_rd_data_MON_t {
      logic rd_data_0[17:0];
   };

   typedef struct MEM_INT_4A17D_MON_t {
      MEM_INT_4A17D_SIGNALS_MON_t SIGNALS;
      MEM_INT_4A17D_rd_data_MON_t rd_data;
   };

   typedef struct MEM_INT_4A17D_CTRL_t {
      MEM_INT_4A17D_SIGNALS_CTRL_t SIGNALS;
      logic wr_addr[4:0];
      logic rd_addr[4:0];
      MEM_INT_4A17D_wr_data_CTRL_t wr_data;
   };

endpackage : MEM_INT_4A17D_CTRL

`endif // MEM_INT_4A17D_CTRL_SVH
