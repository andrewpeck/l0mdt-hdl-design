// This file was auto-generated by YML2HDL tool.
// https://gitlab.com/tcpaiva/yml2hdl
// 2022-03-14 23:33:51

`ifndef DAQ_PKG_SVH
`define DAQ_PKG_SVH


`include <common_ieee_pkg.svh>

package DAQ_PKG;

   typedef struct DAQ_MON_t {
      logic STATUS;
      logic READY;
   };

   typedef struct DAQ_CTRL_t {
      logic RESET;
   };

endpackage : DAQ_PKG

`endif // DAQ_PKG_SVH
