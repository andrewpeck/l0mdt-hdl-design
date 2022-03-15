// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl
// 2022-03-15 23:42:20

`ifndef DAQ_CTRL_SVH
`define DAQ_CTRL_SVH


`include <common_ieee_pkg.svh>

package DAQ_CTRL;

   typedef struct DAQ_MON_t {
      logic STATUS;
      logic READY;
   };

   typedef struct DAQ_CTRL_t {
      logic RESET;
   };

endpackage : DAQ_CTRL

`endif // DAQ_CTRL_SVH
